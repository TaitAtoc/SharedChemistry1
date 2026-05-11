<?php

declare(strict_types=1);

namespace PH7;

use PDO;
use PH7\Framework\Cache\Cache;
use PH7\Framework\File\File;
use PH7\Framework\Image\FileStorage as FileStorageImage;
use PH7\Framework\Mvc\Model\DbConfig;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Util\Various;

class ScPublicProfilePhoto
{
    public const SLOT_COUNT = 4;
    private const ALBUM_NAME = 'SharedChemistry Public Profile Photos';
    private const TITLE_PREFIX = 'SharedChemistry Public Profile Photo ';
    private const MAX_IMAGE_WIDTH = 2500;
    private const MAX_IMAGE_HEIGHT = 2500;
    private const SIZES = [400, 600, 800, 1000, 1200];

    public function getPhotos(int $iProfileId, ?string $sApproved = null): array
    {
        $aPhotos = [];
        $aTitles = [];

        for ($iSlot = 1; $iSlot <= self::SLOT_COUNT; $iSlot++) {
            $aTitles[] = $this->getSlotTitle($iSlot);
            $aPhotos[$iSlot] = null;
        }

        $sPlaceholders = implode(',', array_fill(0, count($aTitles), '?'));
        $sApprovedSql = $sApproved !== null ? ' AND p.approved = ? ' : ' ';
        $sSql = 'SELECT p.*, a.name AS albumName FROM' . Db::prefix(DbTableName::PICTURE) . 'AS p INNER JOIN' .
            Db::prefix(DbTableName::ALBUM_PICTURE) . 'AS a ON p.albumId = a.albumId ' .
            'WHERE p.profileId = ? AND a.profileId = ? AND a.name = ? AND p.title IN (' . $sPlaceholders . ')' . $sApprovedSql .
            'ORDER BY p.updatedDate DESC, p.createdDate DESC, p.pictureId DESC';

        $rStmt = Db::getInstance()->prepare($sSql);
        $iParam = 1;
        $rStmt->bindValue($iParam++, $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue($iParam++, $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue($iParam++, self::ALBUM_NAME, PDO::PARAM_STR);

        foreach ($aTitles as $sTitle) {
            $rStmt->bindValue($iParam++, $sTitle, PDO::PARAM_STR);
        }

        if ($sApproved !== null) {
            $rStmt->bindValue($iParam++, $sApproved, PDO::PARAM_STR);
        }

        $rStmt->execute();

        foreach ($rStmt->fetchAll(PDO::FETCH_OBJ) as $oPhoto) {
            $iSlot = $this->getSlotFromTitle((string)$oPhoto->title);
            if ($iSlot !== null && $aPhotos[$iSlot] === null) {
                $aPhotos[$iSlot] = $oPhoto;
            }
        }

        Db::free($rStmt);

        return $aPhotos;
    }

    public function saveSlot(int $iProfileId, string $sUsername, int $iSlot, string $sTmpFile, string $sApproved): bool
    {
        if (!$this->isValidSlot($iSlot)) {
            return false;
        }

        $oOriginal = new FileStorageImage($sTmpFile, self::MAX_IMAGE_WIDTH, self::MAX_IMAGE_HEIGHT);
        if (!$oOriginal->validate()) {
            return false;
        }

        $iAlbumId = $this->getOrCreateAlbumId($iProfileId);
        $this->deleteSlot($iProfileId, $sUsername, $iSlot);

        $aImages = [];
        foreach (self::SIZES as $iSize) {
            $aImages[$iSize] = clone $oOriginal;
            $aImages[$iSize]->square($iSize);
        }

        $sWatermarkText = DbConfig::getSetting('watermarkTextImage');
        if (!empty(trim((string)$sWatermarkText))) {
            $iSizeWatermarkText = DbConfig::getSetting('sizeWatermarkTextImage');
            $oOriginal->watermarkText($sWatermarkText, $iSizeWatermarkText);
            foreach ($aImages as $oImage) {
                $oImage->watermarkText($sWatermarkText, $iSizeWatermarkText);
            }
        }

        $sPath = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_DS . $iAlbumId . PH7_DS;
        (new File)->createDir($sPath);

        $sFileName = Various::genRnd($oOriginal->getFileName(), 20);
        $sFileOriginal = $sFileName . '-original.' . $oOriginal->getExt();

        $oOriginal->save($sPath . $sFileOriginal);
        foreach ($aImages as $iSize => $oImage) {
            $oImage->save($sPath . $sFileName . '-' . $iSize . PH7_DOT . $oImage->getExt());
        }

        $sSql = 'INSERT INTO' . Db::prefix(DbTableName::PICTURE) .
            '(profileId, albumId, title, description, file, file_cdn_url, createdDate, approved) ' .
            'VALUES (:profileId, :albumId, :title, :description, :file, :file_cdn_url, :createdDate, :approved)';
        $rStmt = Db::getInstance()->prepare($sSql);
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
        $rStmt->bindValue(':title', $this->getSlotTitle($iSlot), PDO::PARAM_STR);
        $rStmt->bindValue(':description', 'Public-facing SharedChemistry profile photo slot ' . $iSlot, PDO::PARAM_STR);
        $rStmt->bindValue(':file', $sFileOriginal, PDO::PARAM_STR);
        $rStmt->bindValue(':file_cdn_url', '', PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', date('Y-m-d H:i:s'), PDO::PARAM_STR);
        $rStmt->bindValue(':approved', $sApproved, PDO::PARAM_STR);
        $bSaved = $rStmt->execute();
        Db::free($rStmt);

        $this->updateAlbumThumb($iProfileId, $iAlbumId, $sFileOriginal);
        $this->clearPictureCache();

        return $bSaved;
    }

    public function deleteSlot(int $iProfileId, string $sUsername, int $iSlot): bool
    {
        $oPhoto = $this->getSlotPhoto($iProfileId, $iSlot);
        if (!$oPhoto) {
            return true;
        }

        if (class_exists(CommentCoreModel::class)) {
            CommentCoreModel::deleteRecipient((int)$oPhoto->pictureId, 'picture');
        }

        $rStmt = Db::getInstance()->prepare(
            'DELETE FROM' . Db::prefix(DbTableName::PICTURE) .
            'WHERE profileId = :profileId AND albumId = :albumId AND pictureId = :pictureId'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', (int)$oPhoto->albumId, PDO::PARAM_INT);
        $rStmt->bindValue(':pictureId', (int)$oPhoto->pictureId, PDO::PARAM_INT);
        $bDeleted = $rStmt->execute();
        Db::free($rStmt);

        $this->deletePhotoFiles((int)$oPhoto->albumId, $sUsername, (string)$oPhoto->file);
        $this->refreshAlbumThumb($iProfileId, (int)$oPhoto->albumId);
        $this->clearPictureCache();

        return $bDeleted;
    }

    public function getPhotoUrl(string $sUsername, object $oPhoto, int $iSize = 400): string
    {
        return PH7_URL_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_SH . $oPhoto->albumId . PH7_SH .
            str_replace('original', (string)$iSize, $oPhoto->file);
    }

    private function getSlotPhoto(int $iProfileId, int $iSlot): ?object
    {
        $aPhotos = $this->getPhotos($iProfileId);

        return $aPhotos[$iSlot] ?? null;
    }

    private function getOrCreateAlbumId(int $iProfileId): int
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
            '(profileId, name, description, thumb, createdDate, approved) ' .
            'VALUES (:profileId, :name, :description, :thumb, :createdDate, :approved)'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':name', self::ALBUM_NAME, PDO::PARAM_STR);
        $rStmt->bindValue(':description', 'Public-facing profile photos shown on the SharedChemistry couple profile.', PDO::PARAM_STR);
        $rStmt->bindValue(':thumb', '', PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', date('Y-m-d H:i:s'), PDO::PARAM_STR);
        $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);

        return (int)Db::getInstance()->lastInsertId();
    }

    private function updateAlbumThumb(int $iProfileId, int $iAlbumId, string $sFile): void
    {
        $rStmt = Db::getInstance()->prepare(
            'UPDATE' . Db::prefix(DbTableName::ALBUM_PICTURE) .
            'SET thumb = :thumb, updatedDate = :updatedDate WHERE profileId = :profileId AND albumId = :albumId'
        );
        $rStmt->bindValue(':thumb', $sFile, PDO::PARAM_STR);
        $rStmt->bindValue(':updatedDate', date('Y-m-d H:i:s'), PDO::PARAM_STR);
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
        $rStmt->execute();
        Db::free($rStmt);
    }

    private function refreshAlbumThumb(int $iProfileId, int $iAlbumId): void
    {
        $rStmt = Db::getInstance()->prepare(
            'SELECT file FROM' . Db::prefix(DbTableName::PICTURE) .
            'WHERE profileId = :profileId AND albumId = :albumId ORDER BY pictureId DESC LIMIT 1'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
        $rStmt->execute();
        $sThumb = (string)$rStmt->fetchColumn();
        Db::free($rStmt);

        $this->updateAlbumThumb($iProfileId, $iAlbumId, $sThumb);
    }

    private function deletePhotoFiles(int $iAlbumId, string $sUsername, string $sPictureLink): void
    {
        $sDir = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_DS . $iAlbumId . PH7_DS;
        $aFiles = [$sDir . $sPictureLink];

        foreach (self::SIZES as $iSize) {
            $aFiles[] = $sDir . str_replace('original', (string)$iSize, $sPictureLink);
        }

        (new File)->deleteFile($aFiles);
    }

    private function clearPictureCache(): void
    {
        if (class_exists(PictureCoreModel::class)) {
            (new Cache)->start(PictureCoreModel::CACHE_GROUP, null, null)->clear();
        }
    }

    private function getSlotTitle(int $iSlot): string
    {
        return self::TITLE_PREFIX . $iSlot;
    }

    private function getSlotFromTitle(string $sTitle): ?int
    {
        if (strpos($sTitle, self::TITLE_PREFIX) !== 0) {
            return null;
        }

        $iSlot = (int)substr($sTitle, strlen(self::TITLE_PREFIX));

        return $this->isValidSlot($iSlot) ? $iSlot : null;
    }

    private function isValidSlot(int $iSlot): bool
    {
        return $iSlot >= 1 && $iSlot <= self::SLOT_COUNT;
    }
}
