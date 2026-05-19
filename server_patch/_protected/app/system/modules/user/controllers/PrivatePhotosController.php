<?php

namespace PH7;

defined('PH7') or exit('Restricted access');

use PH7\Framework\File\File;
use PH7\Framework\Image\FileStorage as FileStorageImage;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Security\CSRF\Token;
use PH7\Framework\Url\Header;
use PDO;

class PrivatePhotosController extends Controller
{
    private const ALBUM_NAME = 'SharedChemistry Private Photos';
    private const ACCESS_TABLE = 'private_media_access';
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';
    private const MAX_UPLOAD_BYTES = 10485760;
    private const MAX_IMAGE_WIDTH = 2500;
    private const MAX_IMAGE_HEIGHT = 2500;
    private const PHOTO_THUMB_SIZE = 400;
    private const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'webp', 'gif'];

    public function index(): void
    {
        if (!$this->canManagePrivateMedia()) {
            Header::redirect(Uri::get('user-dashboard', 'main', 'index'));
        }

        $iProfileId = (int)$this->session->get('member_id');
        $sUsername = (string)$this->session->get('member_username');
        $this->view->private_media_message = '';
        $this->view->private_media_error = '';

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            if (!(new Token)->check('sc_private_photos')) {
                $this->view->private_media_error = Form::errorTokenMsg();
            } else {
                $sAction = (string)$this->httpRequest->post('private_media_action');
                if ($sAction === 'upload') {
                    $this->handleUpload($iProfileId, $sUsername);
                } elseif ($sAction === 'permissions') {
                    $this->savePermissions($iProfileId, 'photo');
                } elseif ($sAction === 'delete') {
                    $this->deletePhoto($iProfileId, $sUsername);
                }
            }
        }

        // Proof marker: when routing reaches this action, the page title is unique to the private manager.
        $this->view->page_title = $this->view->h1_title = t('SharedChemistry Private Photos Manager');
        $this->view->realPhotoCount = 0;
        $this->view->fallbackPhotoCount = 0;
        $aPrivatePhotos = $this->getPrivatePhotos($iProfileId, $sUsername);
        $aAccessMap = $this->getPrivateMediaAccessMap($iProfileId, 'photo');

        $this->view->private_media_csrf_token = (new Token)->generate('sc_private_photos');
        $this->view->privatePhotos = $aPrivatePhotos;
        $this->view->accessMap = $aAccessMap;
        $this->view->accessRecipients = $this->getAccessRecipients($iProfileId, 'photo', $aAccessMap);
        $this->view->privateMediaDebug = 'owner_id=' . $iProfileId . ' photo_count=' . count($aPrivatePhotos) . ' real_photo_count=' . (int)$this->view->realPhotoCount . ' fallback_count=' . (int)$this->view->fallbackPhotoCount . ' access_count=' . count($aAccessMap);
        // pH7Builder lowercases PrivatePhotosController to views/base/tpl/privatephotos/index.tpl via output().
        $this->output();
    }

    private function handleUpload(int $iProfileId, string $sUsername): void
    {
        if (empty($_FILES['private_media_file']['tmp_name']) || !is_uploaded_file($_FILES['private_media_file']['tmp_name'])) {
            $this->view->private_media_error = t('Please choose a private photo to upload.');
            return;
        }

        if ((int)$_FILES['private_media_file']['size'] > self::MAX_UPLOAD_BYTES) {
            $this->view->private_media_error = t('Private photos must be 10 MB or smaller.');
            return;
        }

        $sOriginalName = (string)$_FILES['private_media_file']['name'];
        $sExt = strtolower((string)pathinfo($sOriginalName, PATHINFO_EXTENSION));
        if (!in_array($sExt, self::ALLOWED_EXTENSIONS, true)) {
            $this->view->private_media_error = t('Please upload a JPG, PNG, WebP, or GIF image.');
            return;
        }

        $iAlbumId = $this->getOrCreatePhotoAlbumId($iProfileId);
        if ($iAlbumId < 1) {
            $this->view->private_media_error = t('Private photo storage is not ready yet.');
            return;
        }

        $oOriginal = new FileStorageImage(
            $_FILES['private_media_file']['tmp_name'],
            self::MAX_IMAGE_WIDTH,
            self::MAX_IMAGE_HEIGHT
        );
        if (!$oOriginal->validate()) {
            $this->view->private_media_error = t('Please upload a valid image file.');
            return;
        }

        $sDir = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_DS . $iAlbumId . PH7_DS;
        (new File)->createDir($sDir);
        $sBaseName = 'private-photo-' . $iProfileId . '-' . time() . '-' . mt_rand(1000, 9999);
        $sFileName = $sBaseName . '-original.' . $oOriginal->getExt();

        if (!$oOriginal->save($sDir . $sFileName)) {
            $this->view->private_media_error = t('Unable to save the uploaded private photo.');
            return;
        }

        foreach ([self::PHOTO_THUMB_SIZE, 600, 800, 1000, 1200] as $iSize) {
            $oSizedPhoto = clone $oOriginal;
            $oSizedPhoto->square($iSize);
            $oSizedPhoto->save($sDir . $sBaseName . '-' . $iSize . '.' . $oOriginal->getExt());
        }

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO' . Db::prefix(DbTableName::PICTURE) .
            '(profileId, albumId, title, description, file, file_cdn_url, createdDate, approved) ' .
            'VALUES (:profileId, :albumId, :title, :description, :file, :fileCdnUrl, :createdDate, :approved)'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
        $rStmt->bindValue(':title', 'Private Photo', PDO::PARAM_STR);
        $rStmt->bindValue(':description', 'SharedChemistry private photo.', PDO::PARAM_STR);
        $rStmt->bindValue(':file', $sFileName, PDO::PARAM_STR);
        $rStmt->bindValue(':fileCdnUrl', '', PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', date('Y-m-d H:i:s'), PDO::PARAM_STR);
        $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);

        $this->view->private_media_message = t('Private photo uploaded.');
    }

    private function getOrCreatePhotoAlbumId(int $iProfileId): int
    {
        $rStmt = Db::getInstance()->prepare(
            'SELECT albumId FROM' . Db::prefix(DbTableName::ALBUM_PICTURE) .
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
            'INSERT INTO' . Db::prefix(DbTableName::ALBUM_PICTURE) .
            '(profileId, name, description, thumb, createdDate, approved) VALUES(:profileId, :name, :description, :thumb, :createdDate, :approved)'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':name', self::ALBUM_NAME, PDO::PARAM_STR);
        $rStmt->bindValue(':description', 'Private SharedChemistry photos.', PDO::PARAM_STR);
        $rStmt->bindValue(':thumb', '', PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', date('Y-m-d H:i:s'), PDO::PARAM_STR);
        $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);

        return (int)Db::getInstance()->lastInsertId();
    }

    private function getPrivatePhotos(int $iProfileId, string $sUsername): array
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT p.* FROM' . Db::prefix(DbTableName::PICTURE) . 'AS p INNER JOIN' .
                Db::prefix(DbTableName::ALBUM_PICTURE) . 'AS a ON p.albumId = a.albumId ' .
                'WHERE p.profileId = :profileId AND a.profileId = :profileId AND a.name = :name AND p.approved = :approved ' .
                'ORDER BY p.createdDate DESC, p.pictureId DESC'
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

        $aPhotos = [];
        $iRealPhotoCount = 0;
        $iFallbackCount = 0;
        foreach ($aRows as $oPhoto) {
            $sOriginalFile = (string)$oPhoto->file;
            $sThumbFile = str_replace('original', (string)self::PHOTO_THUMB_SIZE, $sOriginalFile);
            $sPhotoDir = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_DS . $oPhoto->albumId . PH7_DS;
            $sOriginalUrl = $sOriginalFile !== '' && is_file($sPhotoDir . $sOriginalFile) ? $this->getPrivatePhotoUrl($sUsername, (int)$oPhoto->albumId, $sOriginalFile) : '';
            $sThumbUrl = $sThumbFile !== '' && is_file($sPhotoDir . $sThumbFile) ? $this->getPrivatePhotoUrl($sUsername, (int)$oPhoto->albumId, $sThumbFile) : '';
            $sUrl = $sThumbUrl !== '' ? $sThumbUrl : $sOriginalUrl;

            if ($sUrl !== '') {
                $iRealPhotoCount++;
            } else {
                $iFallbackCount++;
            }

            $aPhotos[] = (object)[
                'id' => (int)$oPhoto->pictureId,
                'url' => $sUrl,
                'originalUrl' => $sOriginalUrl,
                'hasAccess' => true,
                'isMissing' => $sUrl === ''
            ];
        }

        $this->view->realPhotoCount = $iRealPhotoCount;
        $this->view->fallbackPhotoCount = $iFallbackCount;

        return $aPhotos;
    }

    private function getPrivatePhotoUrl(string $sUsername, int $iAlbumId, string $sFileName): string
    {
        return PH7_URL_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_SH . $iAlbumId . PH7_SH . rawurlencode($sFileName);
    }

    private function deletePhoto(int $iProfileId, string $sUsername): void
    {
        $iPictureId = (int)$this->httpRequest->post('private_media_id');
        if ($iPictureId < 1) {
            $this->view->private_media_error = t('Private photo could not be deleted.');
            return;
        }

        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT p.pictureId, p.albumId, p.file FROM' . Db::prefix(DbTableName::PICTURE) . 'AS p INNER JOIN' .
                Db::prefix(DbTableName::ALBUM_PICTURE) . 'AS a ON p.albumId = a.albumId ' .
                'WHERE p.pictureId = :pictureId AND p.profileId = :profileId AND a.profileId = :profileId AND a.name = :name LIMIT 1'
            );
            $rStmt->bindValue(':pictureId', $iPictureId, PDO::PARAM_INT);
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':name', self::ALBUM_NAME, PDO::PARAM_STR);
            $rStmt->execute();
            $oPhoto = $rStmt->fetch(PDO::FETCH_OBJ);
            Db::free($rStmt);

            if (!$oPhoto) {
                $this->view->private_media_error = t('Private photo could not be found.');
                return;
            }

            $rStmt = Db::getInstance()->prepare(
                'DELETE FROM' . Db::prefix(DbTableName::PICTURE) .
                'WHERE pictureId = :pictureId AND profileId = :profileId AND albumId = :albumId'
            );
            $rStmt->bindValue(':pictureId', $iPictureId, PDO::PARAM_INT);
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':albumId', (int)$oPhoto->albumId, PDO::PARAM_INT);
            $rStmt->execute();
            Db::free($rStmt);

            $this->deletePhotoFiles((int)$oPhoto->albumId, $sUsername, (string)$oPhoto->file);
            $this->view->private_media_message = t('Private photo deleted.');
        } catch (\Exception $oException) {
            $this->view->private_media_error = t('Private photo could not be deleted.');
        }
    }

    private function deletePhotoFiles(int $iAlbumId, string $sUsername, string $sOriginalFile): void
    {
        if ($iAlbumId < 1 || $sOriginalFile === '') {
            return;
        }

        $sDir = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_DS . $iAlbumId . PH7_DS;
        foreach (['original', self::PHOTO_THUMB_SIZE, 600, 800, 1000, 1200] as $mSize) {
            $sFile = $mSize === 'original' ? $sOriginalFile : str_replace('original', (string)$mSize, $sOriginalFile);
            $sPath = $sDir . $sFile;
            if (is_file($sPath)) {
                @unlink($sPath);
            }
        }
    }

    protected function savePermissions(int $iProfileId, string $sMediaType): void
    {
        $aEligibleIds = $this->getRecipientIds($iProfileId);
        $aPosted = $this->httpRequest->postExists('private_media_access') ? $this->httpRequest->post('private_media_access', \PH7\Framework\Mvc\Request\Http::NO_CLEAN) : [];
        $aPosted = is_array($aPosted) ? $aPosted : [];
        $aSelectedIds = [];

        foreach ($aEligibleIds as $iRecipientId) {
            $iRecipientId = (int)$iRecipientId;
            if (isset($aPosted[$iRecipientId][$sMediaType]) && (string)$aPosted[$iRecipientId][$sMediaType] === '1') {
                $aSelectedIds[] = $iRecipientId;
            }
        }

        $this->savePrivateMediaAccess($iProfileId, $aEligibleIds, $aSelectedIds, $sMediaType);
        $this->view->private_media_message = $sMediaType === 'photo' ? t('Private photo permissions updated.') : t('Private video permissions updated.');
    }

    protected function getAccessRecipients(int $iProfileId, string $sMediaType, array $aAccessMap = []): array
    {
        if (empty($aAccessMap)) {
            $aAccessMap = $this->getPrivateMediaAccessMap($iProfileId, $sMediaType);
        }

        $oUserModel = new UserModel;
        $aRecipients = [];
        foreach ($this->getRecipientIds($iProfileId) as $iRecipientId) {
            $oUser = $oUserModel->readProfile((int)$iRecipientId);
            if (!$oUser || (int)$oUser->ban === UserCore::BAN_STATUS) {
                continue;
            }

            $aRecipients[] = (object)[
                'profileId' => (int)$iRecipientId,
                'displayName' => $oUser->username,
                'photoAccess' => $sMediaType === 'photo' ? isset($aAccessMap[(int)$iRecipientId]) : $this->hasAccess($iProfileId, (int)$iRecipientId, 'photo'),
                'videoAccess' => $sMediaType === 'video' ? isset($aAccessMap[(int)$iRecipientId]) : $this->hasAccess($iProfileId, (int)$iRecipientId, 'video')
            ];
        }

        return $aRecipients;
    }

    protected function getRecipientIds(int $iProfileId): array
    {
        return array_values(array_unique(array_merge($this->getFriendIds($iProfileId), $this->getVerifiedIds($iProfileId))));
    }

    private function getFriendIds(int $iProfileId): array
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT CASE WHEN profileId = :profileId THEN friendId ELSE profileId END FROM' .
                Db::prefix(DbTableName::MEMBER_FRIEND) .
                'WHERE pending = :approved AND (profileId = :profileId OR friendId = :profileId)'
            );
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':approved', FriendCoreModel::APPROVED_REQUEST, PDO::PARAM_INT);
            $rStmt->execute();
            $aIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return $aIds;
        } catch (\Exception $oException) {
            return [];
        }
    }

    private function getVerifiedIds(int $iProfileId): array
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT CASE WHEN verifier_profile_id = :profileId THEN verified_profile_id ELSE verifier_profile_id END FROM' .
                Db::prefix(self::COUPLE_VERIFICATION_TABLE) .
                'WHERE status = :status AND (verifier_profile_id = :profileId OR verified_profile_id = :profileId)'
            );
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':status', 'active', PDO::PARAM_STR);
            $rStmt->execute();
            $aIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return $aIds;
        } catch (\Exception $oException) {
            return [];
        }
    }

    protected function hasAccess(int $iProfileId, int $iRecipientId, string $sMediaType): bool
    {
        return isset($this->getPrivateMediaAccessMap($iProfileId, $sMediaType)[$iRecipientId]);
    }

    protected function getPrivateMediaAccessMap(int $iOwnerId, string $sMediaType): array
    {
        if ($iOwnerId < 1 || !in_array($sMediaType, ['photo', 'video'], true)) {
            return [];
        }

        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT viewer_id FROM' . Db::prefix(self::ACCESS_TABLE) .
                'WHERE owner_id = :ownerId AND media_type = :mediaType'
            );
            $rStmt->bindValue(':ownerId', $iOwnerId, PDO::PARAM_INT);
            $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            $rStmt->execute();
            $aViewerIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return array_fill_keys($aViewerIds, true);
        } catch (\Exception $oException) {
            return [];
        }
    }

    protected function savePrivateMediaAccess(int $iOwnerId, array $aEligibleViewerIds, array $aSelectedViewerIds, string $sMediaType): void
    {
        $aEligibleMap = array_fill_keys(array_map('intval', $aEligibleViewerIds), true);
        $aSelectedViewerIds = array_values(array_unique(array_map('intval', $aSelectedViewerIds)));

        try {
            $rStmt = Db::getInstance()->prepare(
                'DELETE FROM' . Db::prefix(self::ACCESS_TABLE) .
                'WHERE owner_id = :ownerId AND media_type = :mediaType'
            );
            $rStmt->bindValue(':ownerId', $iOwnerId, PDO::PARAM_INT);
            $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            $rStmt->execute();
            Db::free($rStmt);

            foreach ($aSelectedViewerIds as $iViewerId) {
                if ($iViewerId < 1 || $iViewerId === $iOwnerId || !isset($aEligibleMap[$iViewerId])) {
                    continue;
                }

                $rStmt = Db::getInstance()->prepare(
                    'INSERT INTO' . Db::prefix(self::ACCESS_TABLE) .
                    '(owner_id, viewer_id, media_type, created_at) VALUES(:ownerId, :viewerId, :mediaType, NOW())'
                );
                $rStmt->bindValue(':ownerId', $iOwnerId, PDO::PARAM_INT);
                $rStmt->bindValue(':viewerId', $iViewerId, PDO::PARAM_INT);
                $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
                $rStmt->execute();
                Db::free($rStmt);
            }
        } catch (\Exception $oException) {
            return;
        }
    }

    protected function getTableColumns(string $sTable): array
    {
        try {
            $rStmt = Db::getInstance()->query('DESCRIBE' . Db::prefix($sTable));
            $aColumns = array_map('strval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return $aColumns;
        } catch (\Exception $oException) {
            return [];
        }
    }

    protected function firstColumn(array $aColumns, array $aCandidates): string
    {
        foreach ($aCandidates as $sColumn) {
            if (in_array($sColumn, $aColumns, true)) {
                return $sColumn;
            }
        }

        return '';
    }

    private function canManagePrivateMedia(): bool
    {
        return User::auth() && (string)$this->session->get('member_sex') === GenderTypeUserCore::COUPLE;
    }
}
