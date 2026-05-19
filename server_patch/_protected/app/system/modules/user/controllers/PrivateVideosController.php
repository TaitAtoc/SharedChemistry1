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
    private const ITEMS_TABLE = 'private_media_items';
    private const MAX_UPLOAD_BYTES = 104857600;
    private const ALLOWED_EXTENSIONS = ['mp4', 'webm', 'mov', 'm4v'];
    private const ALLOWED_MIME_TYPES = ['video/mp4', 'video/webm', 'video/quicktime', 'video/x-m4v'];

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
            $sAction = (string)$this->httpRequest->post('private_media_action');
            if (!(new Token)->check($this->getTokenName($sAction))) {
                $this->view->private_media_error = Form::errorTokenMsg();
            } else {
                if ($sAction === 'upload') {
                    $this->handleVideoUpload($iProfileId);
                } elseif ($sAction === 'permissions') {
                    $this->savePermissions($iProfileId, 'video');
                } elseif ($sAction === 'delete') {
                    $this->deleteVideo($iProfileId);
                }
            }
        }

        $aPrivateVideos = $this->getPrivateVideos($iProfileId);
        $aAccessMap = $this->getPrivateMediaAccessMap($iProfileId, 'video');

        // Proof marker: when routing reaches this action, the page title is unique to the private manager.
        $this->view->page_title = $this->view->h1_title = t('SharedChemistry Private Videos Manager');
        $oToken = new Token;
        $this->view->private_media_csrf_token = $oToken->generate('sc_private_videos_permissions');
        $this->view->private_media_upload_csrf_token = $oToken->generate('sc_private_videos_upload');
        $this->view->private_media_delete_csrf_token = $oToken->generate('sc_private_videos_delete');
        $this->view->privateVideos = $aPrivateVideos;
        $this->view->accessMap = $aAccessMap;
        $this->view->accessRecipients = $this->getAccessRecipients($iProfileId, 'video', $aAccessMap);
        $this->view->privateMediaDebug = 'owner_id=' . $iProfileId . ' count=' . count($aPrivateVideos) . ' access_count=' . count($aAccessMap);
        // pH7Builder lowercases PrivateVideosController to views/base/tpl/privatevideos/index.tpl via output().
        $this->output();
    }

    private function handleVideoUpload(int $iProfileId): void
    {
        if (empty($_FILES['private_media_file']['tmp_name']) || !is_uploaded_file($_FILES['private_media_file']['tmp_name'])) {
            $this->view->private_media_error = t('Please choose a private video to upload.');
            return;
        }

        if ((int)$_FILES['private_media_file']['size'] > self::MAX_UPLOAD_BYTES) {
            $this->view->private_media_error = t('Private videos must be 100 MB or smaller.');
            return;
        }

        $sOriginalName = (string)$_FILES['private_media_file']['name'];
        $sExt = strtolower((string)pathinfo($sOriginalName, PATHINFO_EXTENSION));
        if (!in_array($sExt, self::ALLOWED_EXTENSIONS, true)) {
            $this->view->private_media_error = t('Please upload an MP4, WebM, MOV, or M4V video.');
            return;
        }

        $sMimeType = $this->detectMimeType((string)$_FILES['private_media_file']['tmp_name']);
        if ($sMimeType !== '' && !in_array($sMimeType, self::ALLOWED_MIME_TYPES, true)) {
            $this->view->private_media_error = t('Please upload a valid video file.');
            return;
        }

        $sDir = $this->getPrivateMediaDir($iProfileId, 'videos');
        (new File)->createDir($sDir);
        $sFileName = $this->generatePrivateMediaFilename($iProfileId, 'video', $sExt);
        $sPublicPath = $this->getPrivateMediaPublicPath($iProfileId, 'videos', $sFileName);
        if (!move_uploaded_file($_FILES['private_media_file']['tmp_name'], $sDir . $sFileName)) {
            $this->view->private_media_error = t('Unable to save the uploaded private video.');
            return;
        }

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO' . Db::prefix(self::ITEMS_TABLE) .
            '(owner_id, media_type, filename, original_name, mime_type, file_size, public_path, created_at) ' .
            'VALUES (:ownerId, :mediaType, :filename, :originalName, :mimeType, :fileSize, :publicPath, NOW())'
        );
        $rStmt->bindValue(':ownerId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':mediaType', 'video', PDO::PARAM_STR);
        $rStmt->bindValue(':filename', $sFileName, PDO::PARAM_STR);
        $rStmt->bindValue(':originalName', $this->cleanOriginalName($sOriginalName), PDO::PARAM_STR);
        $rStmt->bindValue(':mimeType', $sMimeType, PDO::PARAM_STR);
        $rStmt->bindValue(':fileSize', (int)$_FILES['private_media_file']['size'], PDO::PARAM_INT);
        $rStmt->bindValue(':publicPath', $sPublicPath, PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);

        $this->view->private_media_message = t('Private video uploaded.');
    }

    private function getPrivateVideos(int $iProfileId): array
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT media_id, filename, original_name, mime_type, file_size, public_path, created_at FROM' .
                Db::prefix(self::ITEMS_TABLE) .
                'WHERE owner_id = :ownerId AND media_type = :mediaType ORDER BY created_at DESC, media_id DESC'
            );
            $rStmt->bindValue(':ownerId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':mediaType', 'video', PDO::PARAM_STR);
            $rStmt->execute();
            $aRows = $rStmt->fetchAll(PDO::FETCH_OBJ);
            Db::free($rStmt);
        } catch (\Exception $oException) {
            return [];
        }

        $aVideos = [];
        foreach ($aRows as $oVideo) {
            $aVideos[] = (object)[
                'media_id' => (int)$oVideo->media_id,
                'id' => (int)$oVideo->media_id,
                'url' => (string)$oVideo->public_path,
                'original_name' => (string)$oVideo->original_name,
                'file_size' => (int)$oVideo->file_size,
                'created_at' => (string)$oVideo->created_at,
                'hasAccess' => true
            ];
        }

        return $aVideos;
    }

    private function getTokenName(string $sAction): string
    {
        if ($sAction === 'upload') {
            return 'sc_private_videos_upload';
        }

        if ($sAction === 'delete') {
            return 'sc_private_videos_delete';
        }

        return 'sc_private_videos_permissions';
    }

    private function deleteVideo(int $iProfileId): void
    {
        $iMediaId = (int)$this->httpRequest->post('media_id');
        if ($iMediaId < 1) {
            $this->view->private_media_error = t('Private video could not be deleted.');
            return;
        }

        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT media_id, filename, public_path FROM' . Db::prefix(self::ITEMS_TABLE) .
                'WHERE media_id = :mediaId AND owner_id = :ownerId AND media_type = :mediaType LIMIT 1'
            );
            $rStmt->bindValue(':mediaId', $iMediaId, PDO::PARAM_INT);
            $rStmt->bindValue(':ownerId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':mediaType', 'video', PDO::PARAM_STR);
            $rStmt->execute();
            $oVideo = $rStmt->fetch(PDO::FETCH_OBJ);
            Db::free($rStmt);

            if (!$oVideo) {
                $this->view->private_media_error = t('Private video could not be found.');
                return;
            }

            $rStmt = Db::getInstance()->prepare(
                'DELETE FROM' . Db::prefix(self::ITEMS_TABLE) .
                'WHERE media_id = :mediaId AND owner_id = :ownerId AND media_type = :mediaType'
            );
            $rStmt->bindValue(':mediaId', $iMediaId, PDO::PARAM_INT);
            $rStmt->bindValue(':ownerId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':mediaType', 'video', PDO::PARAM_STR);
            $rStmt->execute();
            Db::free($rStmt);

            $this->deletePrivateMediaFile($iProfileId, 'videos', (string)$oVideo->filename);
            $this->view->private_media_message = t('Private video deleted.');
        } catch (\Exception $oException) {
            $this->view->private_media_error = t('Private video could not be deleted.');
        }
    }
}
