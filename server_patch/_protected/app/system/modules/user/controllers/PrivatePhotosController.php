<?php

namespace PH7;

defined('PH7') or exit('Restricted access');

use PH7\Framework\File\File;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Security\CSRF\Token;
use PH7\Framework\Url\Header;
use PDO;

class PrivatePhotosController extends Controller
{
    private const ITEMS_TABLE = 'private_media_items';
    private const ACCESS_TABLE = 'private_media_access';
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';
    private const MAX_UPLOAD_BYTES = 10485760;
    private const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'webp', 'gif'];
    private const ALLOWED_MIME_TYPES = ['image/jpeg', 'image/png', 'image/webp', 'image/gif'];

    public function index(): void
    {
        if (!$this->canManagePrivateMedia()) {
            Header::redirect(Uri::get('user-dashboard', 'main', 'index'));
        }

        $iProfileId = (int)$this->session->get('member_id');
        $this->view->private_media_message = '';
        $this->view->private_media_error = '';

        if ($_SERVER['REQUEST_METHOD'] === 'POST') {
            $sAction = (string)$this->httpRequest->post('private_media_action');
            if (!(new Token)->check($this->getTokenName($sAction))) {
                $this->view->private_media_error = Form::errorTokenMsg();
            } else {
                if ($sAction === 'upload') {
                    $this->handleUpload($iProfileId);
                } elseif ($sAction === 'permissions') {
                    $this->savePermissions($iProfileId, 'photo');
                } elseif ($sAction === 'delete') {
                    $this->deletePhoto($iProfileId);
                }
            }
        }

        // Proof marker: when routing reaches this action, the page title is unique to the private manager.
        $this->view->page_title = $this->view->h1_title = t('SharedChemistry Private Photos Manager');
        $aPrivatePhotos = $this->getPrivatePhotos($iProfileId);
        $aAccessMap = $this->getPrivateMediaAccessMap($iProfileId, 'photo');

        $oToken = new Token;
        $this->view->private_media_csrf_token = $oToken->generate('sc_private_photos_permissions');
        $this->view->private_media_upload_csrf_token = $oToken->generate('sc_private_photos_upload');
        $this->view->private_media_delete_csrf_token = $oToken->generate('sc_private_photos_delete');
        $this->view->privatePhotos = $aPrivatePhotos;
        $this->view->accessMap = $aAccessMap;
        $this->view->accessRecipients = $this->getAccessRecipients($iProfileId, 'photo', $aAccessMap);
        $this->view->privateMediaDebug = 'owner_id=' . $iProfileId . ' count=' . count($aPrivatePhotos) . ' access_count=' . count($aAccessMap);
        $this->output();
    }

    private function handleUpload(int $iProfileId): void
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

        $sMimeType = $this->detectMimeType((string)$_FILES['private_media_file']['tmp_name']);
        if ($sMimeType !== '' && !in_array($sMimeType, self::ALLOWED_MIME_TYPES, true)) {
            $this->view->private_media_error = t('Please upload a valid image file.');
            return;
        }

        $sDir = $this->getPrivateMediaDir($iProfileId, 'photos');
        (new File)->createDir($sDir);
        $sFileName = $this->generatePrivateMediaFilename($iProfileId, 'photo', $sExt);
        $sPublicPath = $this->getPrivateMediaPublicPath($iProfileId, 'photos', $sFileName);

        if (!move_uploaded_file($_FILES['private_media_file']['tmp_name'], $sDir . $sFileName)) {
            $this->view->private_media_error = t('Unable to save the uploaded private photo.');
            return;
        }

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO' . Db::prefix(self::ITEMS_TABLE) .
            '(owner_id, media_type, filename, original_name, mime_type, file_size, public_path, created_at) ' .
            'VALUES (:ownerId, :mediaType, :filename, :originalName, :mimeType, :fileSize, :publicPath, NOW())'
        );
        $rStmt->bindValue(':ownerId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':mediaType', 'photo', PDO::PARAM_STR);
        $rStmt->bindValue(':filename', $sFileName, PDO::PARAM_STR);
        $rStmt->bindValue(':originalName', $this->cleanOriginalName($sOriginalName), PDO::PARAM_STR);
        $rStmt->bindValue(':mimeType', $sMimeType, PDO::PARAM_STR);
        $rStmt->bindValue(':fileSize', (int)$_FILES['private_media_file']['size'], PDO::PARAM_INT);
        $rStmt->bindValue(':publicPath', $sPublicPath, PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);

        $this->view->private_media_message = t('Private photo uploaded.');
    }

    private function getPrivatePhotos(int $iProfileId): array
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT media_id, filename, original_name, mime_type, file_size, public_path, created_at FROM' .
                Db::prefix(self::ITEMS_TABLE) .
                'WHERE owner_id = :ownerId AND media_type = :mediaType ORDER BY created_at DESC, media_id DESC'
            );
            $rStmt->bindValue(':ownerId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':mediaType', 'photo', PDO::PARAM_STR);
            $rStmt->execute();
            $aRows = $rStmt->fetchAll(PDO::FETCH_OBJ);
            Db::free($rStmt);
        } catch (\Exception $oException) {
            return [];
        }

        $aPhotos = [];
        foreach ($aRows as $oPhoto) {
            $aPhotos[] = (object)[
                'media_id' => (int)$oPhoto->media_id,
                'id' => (int)$oPhoto->media_id,
                'url' => (string)$oPhoto->public_path,
                'original_name' => (string)$oPhoto->original_name,
                'file_size' => (int)$oPhoto->file_size,
                'created_at' => (string)$oPhoto->created_at,
                'hasAccess' => true,
                'isMissing' => (string)$oPhoto->public_path === ''
            ];
        }

        return $aPhotos;
    }

    private function getTokenName(string $sAction): string
    {
        if ($sAction === 'upload') {
            return 'sc_private_photos_upload';
        }

        if ($sAction === 'delete') {
            return 'sc_private_photos_delete';
        }

        return 'sc_private_photos_permissions';
    }

    private function deletePhoto(int $iProfileId): void
    {
        $iMediaId = (int)$this->httpRequest->post('media_id');
        if ($iMediaId < 1) {
            $this->view->private_media_error = t('Private photo could not be deleted.');
            return;
        }

        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT media_id, filename, public_path FROM' . Db::prefix(self::ITEMS_TABLE) .
                'WHERE media_id = :mediaId AND owner_id = :ownerId AND media_type = :mediaType LIMIT 1'
            );
            $rStmt->bindValue(':mediaId', $iMediaId, PDO::PARAM_INT);
            $rStmt->bindValue(':ownerId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':mediaType', 'photo', PDO::PARAM_STR);
            $rStmt->execute();
            $oPhoto = $rStmt->fetch(PDO::FETCH_OBJ);
            Db::free($rStmt);

            if (!$oPhoto) {
                $this->view->private_media_error = t('Private photo could not be found.');
                return;
            }

            $rStmt = Db::getInstance()->prepare(
                'DELETE FROM' . Db::prefix(self::ITEMS_TABLE) .
                'WHERE media_id = :mediaId AND owner_id = :ownerId AND media_type = :mediaType'
            );
            $rStmt->bindValue(':mediaId', $iMediaId, PDO::PARAM_INT);
            $rStmt->bindValue(':ownerId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':mediaType', 'photo', PDO::PARAM_STR);
            $rStmt->execute();
            Db::free($rStmt);

            $this->deletePrivateMediaFile($iProfileId, 'photos', (string)$oPhoto->filename);
            $this->view->private_media_message = t('Private photo deleted.');
        } catch (\Exception $oException) {
            $this->view->private_media_error = t('Private photo could not be deleted.');
        }
    }

    protected function getPrivateMediaDir(int $iOwnerId, string $sFolder): string
    {
        return PH7_PATH_ROOT . 'data' . PH7_DS . 'sharedchemistry' . PH7_DS . 'private-media' . PH7_DS . $sFolder . PH7_DS . $iOwnerId . PH7_DS;
    }

    protected function getPrivateMediaPublicPath(int $iOwnerId, string $sFolder, string $sFileName): string
    {
        return '/data/sharedchemistry/private-media/' . $sFolder . '/' . $iOwnerId . '/' . rawurlencode($sFileName);
    }

    protected function generatePrivateMediaFilename(int $iOwnerId, string $sMediaType, string $sExt): string
    {
        return $sMediaType . '-' . $iOwnerId . '-' . time() . '-' . mt_rand(100000, 999999) . '.' . $sExt;
    }

    protected function cleanOriginalName(string $sOriginalName): string
    {
        $sOriginalName = basename($sOriginalName);
        $sOriginalName = preg_replace('/[^A-Za-z0-9._ -]/', '', $sOriginalName);

        return $sOriginalName !== '' ? $sOriginalName : 'upload';
    }

    protected function detectMimeType(string $sTmpPath): string
    {
        if (function_exists('finfo_open')) {
            $rFinfo = finfo_open(FILEINFO_MIME_TYPE);
            if ($rFinfo) {
                $sMimeType = (string)finfo_file($rFinfo, $sTmpPath);
                finfo_close($rFinfo);

                return $sMimeType;
            }
        }

        return function_exists('mime_content_type') ? (string)mime_content_type($sTmpPath) : '';
    }

    protected function deletePrivateMediaFile(int $iOwnerId, string $sFolder, string $sFileName): void
    {
        if ($iOwnerId < 1 || $sFileName === '') {
            return;
        }

        $sPath = $this->getPrivateMediaDir($iOwnerId, $sFolder) . basename($sFileName);
        if (is_file($sPath)) {
            @unlink($sPath);
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
