<?php

namespace PH7;

defined('PH7') or exit('Restricted access');

use PH7\Framework\File\File;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Security\CSRF\Token;
use PH7\Framework\Url\Header;
use PDO;

if (!class_exists(PrivatePhotosController::class)) {
    require_once __DIR__ . '/PrivatePhotosController.php';
}

class PrivateVideosController extends PrivatePhotosController
{
    private const ALBUM_NAME = 'SharedChemistry Private Videos';
    private const MAX_UPLOAD_BYTES = 104857600;
    private const ALLOWED_EXTENSIONS = ['mp4', 'webm', 'mov', 'm4v'];

    public function index(): void
    {
        if (!User::auth() || (string)$this->session->get('member_sex') !== GenderTypeUserCore::COUPLE) {
            Header::redirect(Uri::get('user-dashboard', 'main', 'index'));
        }

        $iProfileId = (int)$this->session->get('member_id');
        $sUsername = (string)$this->session->get('member_username');
        $this->view->private_media_message = '';
        $this->view->private_media_error = '';

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!(new Token)->check('sc_private_videos')) {
                $this->view->private_media_error = Form::errorTokenMsg();
            } else {
                $sAction = (string)$this->httpRequest->post('private_media_action');
                if ($sAction === 'upload') {
                    $this->handleVideoUpload($iProfileId, $sUsername);
                } elseif ($sAction === 'permissions') {
                    $this->savePermissions($iProfileId, 'video');
                } elseif ($sAction === 'delete') {
                    $this->deleteVideo($iProfileId, $sUsername);
                }
            }
        }

        $aPrivateVideos = $this->getPrivateVideos($iProfileId, $sUsername);
        $aAccessMap = $this->getPrivateMediaAccessMap($iProfileId, 'video');

        // Proof marker: when routing reaches this action, the page title is unique to the private manager.
        $this->view->page_title = $this->view->h1_title = t('SharedChemistry Private Videos Manager');
        $this->view->private_media_csrf_token = (new Token)->generate('sc_private_videos');
        $this->view->privateVideos = $aPrivateVideos;
        $this->view->accessMap = $aAccessMap;
        $this->view->accessRecipients = $this->getAccessRecipients($iProfileId, 'video', $aAccessMap);
        $this->view->privateMediaDebug = 'owner_id=' . $iProfileId . ' video_count=' . count($aPrivateVideos) . ' access_count=' . count($aAccessMap);
        // pH7Builder lowercases PrivateVideosController to views/base/tpl/privatevideos/index.tpl via output().
        $this->output();
    }

    private function handleVideoUpload(int $iProfileId, string $sUsername): void
    {
        if (empty($_FILES['private_media_file']['tmp_name']) || !is_uploaded_file($_FILES['private_media_file']['tmp_name'])) {
            $this->view->private_media_error = t('Please choose a private video to upload.');
            return;
        }

        if ((int)$_FILES['private_media_file']['size'] > self::MAX_UPLOAD_BYTES) {
            $this->view->private_media_error = t('Private videos must be 100 MB or smaller.');
            return;
        }

        $sExt = strtolower((string)pathinfo((string)$_FILES['private_media_file']['name'], PATHINFO_EXTENSION));
        if (!in_array($sExt, self::ALLOWED_EXTENSIONS, true)) {
            $this->view->private_media_error = t('Please upload an MP4, WebM, MOV, or M4V video.');
            return;
        }

        $iAlbumId = $this->getOrCreateVideoAlbumId($iProfileId);
        if ($iAlbumId < 1) {
            $this->view->private_media_error = t('Private video storage is not ready yet.');
            return;
        }

        $sDir = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'video/file/' . $sUsername . PH7_DS . $iAlbumId . PH7_DS;
        (new File)->createDir($sDir);
        $sFileName = 'private-video-' . $iProfileId . '-' . time() . '-' . mt_rand(1000, 9999) . '.' . $sExt;
        if (!move_uploaded_file($_FILES['private_media_file']['tmp_name'], $sDir . $sFileName)) {
            $this->view->private_media_error = t('Unable to save the uploaded private video.');
            return;
        }

        $this->insertVideoRow($iProfileId, $iAlbumId, $sFileName);
        $this->view->private_media_message = t('Private video uploaded.');
    }

    private function getOrCreateVideoAlbumId(int $iProfileId): int
    {
        $rStmt = Db::getInstance()->prepare(
            'SELECT albumId FROM' . Db::prefix(DbTableName::ALBUM_VIDEO) .
            'WHERE profileId = :profileId AND name = :name LIMIT 1'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':name', self::ALBUM_NAME, PDO::PARAM_STR);
        $rStmt->execute();
        $iAlbumId = (int)$rStmt->fetchColumn();
        Db::free($rStmt);

        if ($iAlbumId > 0) {
            return $iAlbumId;
        }

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO' . Db::prefix(DbTableName::ALBUM_VIDEO) .
            '(profileId, name, description, thumb, createdDate, approved) VALUES(:profileId, :name, :description, :thumb, :createdDate, :approved)'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':name', self::ALBUM_NAME, PDO::PARAM_STR);
        $rStmt->bindValue(':description', 'Private SharedChemistry videos.', PDO::PARAM_STR);
        $rStmt->bindValue(':thumb', '', PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', date('Y-m-d H:i:s'), PDO::PARAM_STR);
        $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);

        return (int)Db::getInstance()->lastInsertId();
    }

    private function insertVideoRow(int $iProfileId, int $iAlbumId, string $sFileName): void
    {
        $aColumns = $this->getTableColumns(DbTableName::VIDEO);
        $aValues = [
            'profileId' => $iProfileId,
            'albumId' => $iAlbumId,
            'title' => 'Private Video',
            'description' => 'SharedChemistry private video.',
            'file' => $sFileName,
            'file_cdn_url' => '',
            'thumb' => '',
            'createdDate' => date('Y-m-d H:i:s'),
            'approved' => '1'
        ];

        $aInsertColumns = [];
        $aInsertParams = [];
        foreach ($aValues as $sColumn => $mValue) {
            if (in_array($sColumn, $aColumns, true)) {
                $aInsertColumns[] = $sColumn;
                $aInsertParams[] = ':' . $sColumn;
            }
        }

        if (empty($aInsertColumns)) {
            return;
        }

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO' . Db::prefix(DbTableName::VIDEO) .
            '(' . implode(',', $aInsertColumns) . ') VALUES(' . implode(',', $aInsertParams) . ')'
        );
        foreach ($aInsertColumns as $sColumn) {
            $rStmt->bindValue(':' . $sColumn, $aValues[$sColumn], is_int($aValues[$sColumn]) ? PDO::PARAM_INT : PDO::PARAM_STR);
        }
        $rStmt->execute();
        Db::free($rStmt);
    }

    private function getPrivateVideos(int $iProfileId, string $sUsername): array
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT v.* FROM' . Db::prefix(DbTableName::VIDEO) . 'AS v INNER JOIN' .
                Db::prefix(DbTableName::ALBUM_VIDEO) . 'AS a ON v.albumId = a.albumId ' .
                'WHERE v.profileId = :profileId AND a.profileId = :profileId AND a.name = :name AND v.approved = :approved ' .
                'ORDER BY v.createdDate DESC, v.videoId DESC'
            );
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':name', self::ALBUM_NAME, PDO::PARAM_STR);
            $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
            $rStmt->execute();
            $aRows = $rStmt->fetchAll(PDO::FETCH_OBJ);
            Db::free($rStmt);
        } catch (\Exception $oException) {
            return [];
        }

        $aVideos = [];
        foreach ($aRows as $oVideo) {
            $aVideos[] = (object)[
                'id' => (int)$oVideo->videoId,
                'url' => PH7_URL_DATA_SYS_MOD . 'video/file/' . $sUsername . PH7_SH . $oVideo->albumId . PH7_SH . $oVideo->file,
                'hasAccess' => true
            ];
        }

        return $aVideos;
    }

    private function deleteVideo(int $iProfileId, string $sUsername): void
    {
        $iVideoId = (int)$this->httpRequest->post('private_media_id');
        if ($iVideoId < 1) {
            $this->view->private_media_error = t('Private video could not be deleted.');
            return;
        }

        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT v.videoId, v.albumId, v.file FROM' . Db::prefix(DbTableName::VIDEO) . 'AS v INNER JOIN' .
                Db::prefix(DbTableName::ALBUM_VIDEO) . 'AS a ON v.albumId = a.albumId ' .
                'WHERE v.videoId = :videoId AND v.profileId = :profileId AND a.profileId = :profileId AND a.name = :name LIMIT 1'
            );
            $rStmt->bindValue(':videoId', $iVideoId, PDO::PARAM_INT);
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':name', self::ALBUM_NAME, PDO::PARAM_STR);
            $rStmt->execute();
            $oVideo = $rStmt->fetch(PDO::FETCH_OBJ);
            Db::free($rStmt);

            if (!$oVideo) {
                $this->view->private_media_error = t('Private video could not be found.');
                return;
            }

            $rStmt = Db::getInstance()->prepare(
                'DELETE FROM' . Db::prefix(DbTableName::VIDEO) .
                'WHERE videoId = :videoId AND profileId = :profileId AND albumId = :albumId'
            );
            $rStmt->bindValue(':videoId', $iVideoId, PDO::PARAM_INT);
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':albumId', (int)$oVideo->albumId, PDO::PARAM_INT);
            $rStmt->execute();
            Db::free($rStmt);

            $this->deleteVideoFile((int)$oVideo->albumId, $sUsername, (string)$oVideo->file);
            $this->view->private_media_message = t('Private video deleted.');
        } catch (\Exception $oException) {
            $this->view->private_media_error = t('Private video could not be deleted.');
        }
    }

    private function deleteVideoFile(int $iAlbumId, string $sUsername, string $sFileName): void
    {
        if ($iAlbumId < 1 || $sFileName === '') {
            return;
        }

        $sPath = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'video/file/' . $sUsername . PH7_DS . $iAlbumId . PH7_DS . $sFileName;
        if (is_file($sPath)) {
            @unlink($sPath);
        }
    }
}
