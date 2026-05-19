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
    private const ALBUM_NAME = 'SharedChemistry Private Photos';
    private const ACCESS_TABLE = 'private_media_access';
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';
    private const MAX_UPLOAD_BYTES = 10485760;
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
                }
            }
        }

        // Proof marker: when routing reaches this action, the page title is unique to the private manager.
        $this->view->page_title = $this->view->h1_title = t('SharedChemistry Private Photos Manager');
        $this->view->private_media_csrf_token = (new Token)->generate('sc_private_photos');
        $this->view->privatePhotos = $this->getPrivatePhotos($iProfileId, $sUsername);
        $this->view->accessRecipients = $this->getAccessRecipients($iProfileId, 'photo');
        // pH7Builder resolves this action to views/base/tpl/private-photos/index.tpl via output().
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

        $sDir = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_DS . $iAlbumId . PH7_DS;
        (new File)->createDir($sDir);
        $sFileName = 'private-photo-' . $iProfileId . '-' . time() . '-' . mt_rand(1000, 9999) . '-original.' . $sExt;
        if (!move_uploaded_file($_FILES['private_media_file']['tmp_name'], $sDir . $sFileName)) {
            $this->view->private_media_error = t('Unable to save the uploaded private photo.');
            return;
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
        foreach ($aRows as $oPhoto) {
            $aPhotos[] = (object)[
                'id' => (int)$oPhoto->pictureId,
                'url' => PH7_URL_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_SH . $oPhoto->albumId . PH7_SH . $oPhoto->file,
                'hasAccess' => true
            ];
        }

        return $aPhotos;
    }

    private function savePermissions(int $iProfileId, string $sMediaType): void
    {
        $aEligibleIds = array_fill_keys($this->getRecipientIds($iProfileId), true);
        $aPosted = $this->httpRequest->postExists('private_media_access') ? $this->httpRequest->post('private_media_access', \PH7\Framework\Mvc\Request\Http::NO_CLEAN) : [];
        $aPosted = is_array($aPosted) ? $aPosted : [];
        $aMediaIds = $this->getPrivateMediaIds($iProfileId);

        foreach (array_keys($aEligibleIds) as $iRecipientId) {
            $iRecipientId = (int)$iRecipientId;
            $bAllowed = isset($aPosted[$iRecipientId][$sMediaType]) && (string)$aPosted[$iRecipientId][$sMediaType] === '1';
            if ($bAllowed) {
                foreach ($aMediaIds as $iMediaId) {
                    $this->insertAccess($iProfileId, $iRecipientId, $sMediaType, $iMediaId);
                }
            } else {
                $this->deleteAccess($iProfileId, $iRecipientId, $sMediaType);
            }
        }

        $this->view->private_media_message = t('Private photo permissions updated.');
    }

    private function getPrivateMediaIds(int $iProfileId): array
    {
        $aIds = [];
        foreach ($this->getPrivatePhotos($iProfileId, (string)$this->session->get('member_username')) as $oPhoto) {
            $aIds[] = (int)$oPhoto->id;
        }

        return $aIds;
    }

    protected function getAccessRecipients(int $iProfileId, string $sMediaType): array
    {
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
                'photoAccess' => $this->hasAccess($iProfileId, (int)$iRecipientId, 'photo'),
                'videoAccess' => $this->hasAccess($iProfileId, (int)$iRecipientId, 'video')
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
        $aColumns = $this->getAccessColumns($sMediaType);
        if (empty($aColumns['owner']) || empty($aColumns['viewer'])) {
            return false;
        }

        try {
            $sSql = 'SELECT COUNT(*) FROM' . Db::prefix(self::ACCESS_TABLE) .
                'WHERE ' . $aColumns['owner'] . ' = :profileId AND ' . $aColumns['viewer'] . ' = :recipientId';
            if (!empty($aColumns['mediaType'])) {
                $sSql .= ' AND ' . $aColumns['mediaType'] . ' = :mediaType';
            }
            $rStmt = Db::getInstance()->prepare($sSql);
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':recipientId', $iRecipientId, PDO::PARAM_INT);
            if (!empty($aColumns['mediaType'])) {
                $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            }
            $rStmt->execute();
            $bAccess = (int)$rStmt->fetchColumn() > 0;
            Db::free($rStmt);

            return $bAccess;
        } catch (\Exception $oException) {
            return false;
        }
    }

    protected function insertAccess(int $iProfileId, int $iRecipientId, string $sMediaType, int $iMediaId): void
    {
        if ($iRecipientId === $iProfileId || $this->hasMediaAccess($iProfileId, $iRecipientId, $sMediaType, $iMediaId)) {
            return;
        }

        $aColumns = $this->getAccessColumns($sMediaType);
        if (empty($aColumns['owner']) || empty($aColumns['viewer'])) {
            return;
        }

        $aCols = [$aColumns['owner'], $aColumns['viewer']];
        $aParams = [':profileId', ':recipientId'];
        if (!empty($aColumns['mediaId'])) {
            $aCols[] = $aColumns['mediaId'];
            $aParams[] = ':mediaId';
        }
        if (!empty($aColumns['mediaType'])) {
            $aCols[] = $aColumns['mediaType'];
            $aParams[] = ':mediaType';
        }
        if (!empty($aColumns['createdAt'])) {
            $aCols[] = $aColumns['createdAt'];
            $aParams[] = 'NOW()';
        }

        try {
            $rStmt = Db::getInstance()->prepare('INSERT INTO' . Db::prefix(self::ACCESS_TABLE) . '(' . implode(',', $aCols) . ') VALUES(' . implode(',', $aParams) . ')');
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':recipientId', $iRecipientId, PDO::PARAM_INT);
            if (!empty($aColumns['mediaId'])) {
                $rStmt->bindValue(':mediaId', $iMediaId, PDO::PARAM_INT);
            }
            if (!empty($aColumns['mediaType'])) {
                $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            }
            $rStmt->execute();
            Db::free($rStmt);
        } catch (\Exception $oException) {
            return;
        }
    }

    protected function hasMediaAccess(int $iProfileId, int $iRecipientId, string $sMediaType, int $iMediaId): bool
    {
        $aColumns = $this->getAccessColumns($sMediaType);
        if (empty($aColumns['owner']) || empty($aColumns['viewer'])) {
            return false;
        }

        try {
            $sSql = 'SELECT COUNT(*) FROM' . Db::prefix(self::ACCESS_TABLE) .
                'WHERE ' . $aColumns['owner'] . ' = :profileId AND ' . $aColumns['viewer'] . ' = :recipientId';
            if (!empty($aColumns['mediaId'])) {
                $sSql .= ' AND ' . $aColumns['mediaId'] . ' = :mediaId';
            }
            if (!empty($aColumns['mediaType'])) {
                $sSql .= ' AND ' . $aColumns['mediaType'] . ' = :mediaType';
            }
            $rStmt = Db::getInstance()->prepare($sSql);
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':recipientId', $iRecipientId, PDO::PARAM_INT);
            if (!empty($aColumns['mediaId'])) {
                $rStmt->bindValue(':mediaId', $iMediaId, PDO::PARAM_INT);
            }
            if (!empty($aColumns['mediaType'])) {
                $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            }
            $rStmt->execute();
            $bAccess = (int)$rStmt->fetchColumn() > 0;
            Db::free($rStmt);

            return $bAccess;
        } catch (\Exception $oException) {
            return false;
        }
    }

    protected function deleteAccess(int $iProfileId, int $iRecipientId, string $sMediaType): void
    {
        $aColumns = $this->getAccessColumns($sMediaType);
        if (empty($aColumns['owner']) || empty($aColumns['viewer'])) {
            return;
        }

        try {
            $sSql = 'DELETE FROM' . Db::prefix(self::ACCESS_TABLE) .
                'WHERE ' . $aColumns['owner'] . ' = :profileId AND ' . $aColumns['viewer'] . ' = :recipientId';
            if (!empty($aColumns['mediaType'])) {
                $sSql .= ' AND ' . $aColumns['mediaType'] . ' = :mediaType';
            }
            $rStmt = Db::getInstance()->prepare($sSql);
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':recipientId', $iRecipientId, PDO::PARAM_INT);
            if (!empty($aColumns['mediaType'])) {
                $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            }
            $rStmt->execute();
            Db::free($rStmt);
        } catch (\Exception $oException) {
            return;
        }
    }

    protected function getAccessColumns(string $sMediaType): array
    {
        $aColumns = $this->getTableColumns(self::ACCESS_TABLE);

        return [
            'owner' => $this->firstColumn($aColumns, ['owner_profile_id', 'profile_id', 'profileId']),
            'viewer' => $this->firstColumn($aColumns, ['viewer_profile_id', 'viewer_id', 'viewerId', 'member_id', 'memberId', 'friend_id', 'friendId']),
            'mediaId' => $this->firstColumn($aColumns, $sMediaType === 'photo' ? ['media_id', 'mediaId', 'picture_id', 'pictureId'] : ['media_id', 'mediaId', 'video_id', 'videoId']),
            'mediaType' => $this->firstColumn($aColumns, ['media_type', 'mediaType', 'type']),
            'createdAt' => $this->firstColumn($aColumns, ['created_at', 'createdDate'])
        ];
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
