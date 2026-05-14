<?php
/**
 * SharedChemistry override for the pH7 picture model.
 *
 * This preserves the original pH7 public methods and adds the isolated shared
 * gallery helpers used by /photo-gallery.
 */

namespace PH7;

use PDO;
use PH7\Framework\Mvc\Model\Engine\Db;
use stdClass;

class PictureModel extends PictureCoreModel
{
    const PUBLIC_GALLERY_ALBUM_NAME = 'SharedChemistry Public Photo Gallery';

    public function addAlbum($iProfileId, $sTitle, $sDescription, $sThumb, $sCreatedDate, $sApproved = '1')
    {
        $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO ' . $sAlbumTable . ' (profileId, name, description, thumb, createdDate, approved)
            VALUES (:profileId, :name, :description, :thumb, :createdDate, :approved)'
        );

        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':name', $sTitle, PDO::PARAM_STR);
        $rStmt->bindValue(':description', $sDescription, PDO::PARAM_STR);
        $rStmt->bindValue(':thumb', $sThumb, PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', $sCreatedDate, PDO::PARAM_STR);
        $rStmt->bindValue(':approved', $sApproved, PDO::PARAM_STR);

        return $rStmt->execute();
    }

    public function addPhoto($iProfileId, $iAlbumId, $sTitle, $sDescription, $sFile, $sCreatedDate, $sApproved = '1')
    {
        $sPictureTable = Db::prefix(DbTableName::PICTURE, false);
        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO ' . $sPictureTable . ' (profileId, albumId, title, description, file, file_cdn_url, createdDate, approved)
            VALUES (:profileId, :albumId, :title, :description, :file, :file_cdn_url, :createdDate, :approved)'
        );

        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
        $rStmt->bindValue(':title', $sTitle, PDO::PARAM_STR);
        $rStmt->bindValue(':description', $sDescription, PDO::PARAM_STR);
        $rStmt->bindValue(':file', $sFile, PDO::PARAM_STR);
        $rStmt->bindValue(':file_cdn_url', '', PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', $sCreatedDate, PDO::PARAM_STR);
        $rStmt->bindValue(':approved', $sApproved, PDO::PARAM_STR);

        return $rStmt->execute();
    }

    public function deleteAlbum($iProfileId, $iAlbumId)
    {
        $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
        $rStmt = Db::getInstance()->prepare(
            'DELETE FROM ' . $sAlbumTable . ' WHERE profileId = :profileId AND albumId = :albumId'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);

        return $rStmt->execute();
    }

    public function getAlbumsName($iProfileId)
    {
        $this->cache->start(self::CACHE_GROUP, 'albumName' . $iProfileId, static::CACHE_TIME);

        if (!$aData = $this->cache->get()) {
            $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
            $rStmt = Db::getInstance()->prepare(
                'SELECT albumId, name FROM ' . $sAlbumTable . ' WHERE profileId = :profileId'
            );
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->execute();
            $aData = $rStmt->fetchAll(PDO::FETCH_OBJ);
            Db::free($rStmt);
            $this->cache->put($aData);
        }

        return $aData;
    }

    public function photo($iProfileId, $iAlbumId, $iPictureId, $sApproved, $iOffset, $iLimit)
    {
        $this->cache->start(self::CACHE_GROUP, 'photo' . $iProfileId . $iAlbumId . $iPictureId . $sApproved . $iOffset . $iLimit, static::CACHE_TIME);

        if (!$mData = $this->cache->get()) {
            $iOffset = (int)$iOffset;
            $iLimit = (int)$iLimit;

            $sPictureTable = Db::prefix(DbTableName::PICTURE, false);
            $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
            $sMemberTable = Db::prefix(DbTableName::MEMBER, false);
            $sSqlPictureId = !empty($iPictureId) ? 'p.pictureId = :pictureId AND ' : '';
            $rStmt = Db::getInstance()->prepare(
                'SELECT p.*, a.name, m.username, m.firstName, m.sex
                FROM ' . $sPictureTable . ' AS p
                INNER JOIN ' . $sAlbumTable . ' AS a ON p.albumId = a.albumId
                INNER JOIN ' . $sMemberTable . ' AS m ON p.profileId = m.profileId
                WHERE p.profileId = :profileId
                AND p.albumId = :albumId
                AND ' . $sSqlPictureId . 'p.approved = :approved
                LIMIT :offset, :limit'
            );

            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
            if (!empty($iPictureId)) {
                $rStmt->bindValue(':pictureId', $iPictureId, PDO::PARAM_INT);
            }
            $rStmt->bindValue(':approved', $sApproved, PDO::PARAM_STR);
            $rStmt->bindParam(':offset', $iOffset, PDO::PARAM_INT);
            $rStmt->bindParam(':limit', $iLimit, PDO::PARAM_INT);
            $rStmt->execute();

            $mData = !empty($iPictureId) ? $rStmt->fetch(PDO::FETCH_OBJ) : $rStmt->fetchAll(PDO::FETCH_OBJ);
            Db::free($rStmt);
            $this->cache->put($mData);
        }

        return $mData;
    }

    public function totalAlbums($iProfileId = null)
    {
        $this->cache->start(self::CACHE_GROUP, 'totalAlbums' . $iProfileId, static::CACHE_TIME);

        if (!$iTotalAlbums = $this->cache->get()) {
            $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
            $sSqlProfileId = $iProfileId !== null ? ' WHERE profileId = :profileId' : '';
            $rStmt = Db::getInstance()->prepare('SELECT COUNT(albumId) FROM ' . $sAlbumTable . $sSqlProfileId);

            if ($iProfileId !== null) {
                $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            }
            $rStmt->execute();
            $iTotalAlbums = (int)$rStmt->fetchColumn();
            Db::free($rStmt);
            $this->cache->put($iTotalAlbums);
        }

        return $iTotalAlbums;
    }

    public function totalPhotos($iProfileId)
    {
        $this->cache->start(self::CACHE_GROUP, 'totalPhotos' . $iProfileId, static::CACHE_TIME);

        if (!$iTotalPhotos = $this->cache->get()) {
            $sPictureTable = Db::prefix(DbTableName::PICTURE, false);
            $rStmt = Db::getInstance()->prepare(
                'SELECT COUNT(pictureId) FROM ' . $sPictureTable . ' WHERE profileId = :profileId'
            );
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->execute();
            $iTotalPhotos = (int)$rStmt->fetchColumn();
            Db::free($rStmt);
            $this->cache->put($iTotalPhotos);
        }

        return $iTotalPhotos;
    }

    public function updateAlbum($iProfileId, $iAlbumId, $sTitle, $sDescription, $sUpdatedDate)
    {
        $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
        $rStmt = Db::getInstance()->prepare(
            'UPDATE ' . $sAlbumTable . '
            SET name = :name, description = :description, updatedDate = :updatedDate
            WHERE profileId = :profileId AND albumId = :albumId'
        );

        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
        $rStmt->bindValue(':name', $sTitle, PDO::PARAM_STR);
        $rStmt->bindValue(':description', $sDescription, PDO::PARAM_STR);
        $rStmt->bindValue(':updatedDate', $sUpdatedDate, PDO::PARAM_STR);

        return $rStmt->execute();
    }

    public function updatePhoto($iProfileId, $iAlbumId, $iPictureId, $sTitle, $sDescription, $sUpdatedDate)
    {
        $sPictureTable = Db::prefix(DbTableName::PICTURE, false);
        $rStmt = Db::getInstance()->prepare(
            'UPDATE ' . $sPictureTable . '
            SET title = :title, description = :description, updatedDate = :updatedDate
            WHERE profileId = :profileId AND albumId = :albumId AND pictureId = :pictureId'
        );

        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
        $rStmt->bindValue(':pictureId', $iPictureId, PDO::PARAM_INT);
        $rStmt->bindValue(':title', $sTitle, PDO::PARAM_STR);
        $rStmt->bindValue(':description', $sDescription, PDO::PARAM_STR);
        $rStmt->bindValue(':updatedDate', $sUpdatedDate, PDO::PARAM_STR);

        return $rStmt->execute();
    }

    public function search($mLooking, $bCount, $sOrderBy, $iSort, $iOffset, $iLimit, $sApproved = '1')
    {
        $bCount = (bool)$bCount;
        $iOffset = (int)$iOffset;
        $iLimit = (int)$iLimit;
        $mLooking = trim($mLooking);
        $bDigitSearch = ctype_digit($mLooking);

        $sPictureTable = Db::prefix(DbTableName::PICTURE, false);
        $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
        $sMemberTable = Db::prefix(DbTableName::MEMBER, false);
        $sSqlOrder = SearchCoreModel::order($sOrderBy, $iSort, 'p');
        $sSqlSelect = !$bCount ? 'p.*, a.name, m.username, m.firstName, m.sex' : 'COUNT(p.pictureId)';
        $sSqlLimit = !$bCount ? ' LIMIT :offset, :limit' : '';
        $sSqlWhere = $bDigitSearch ? ' WHERE p.pictureId = :looking' : ' WHERE p.title LIKE :looking OR p.description LIKE :looking';

        $rStmt = Db::getInstance()->prepare(
            'SELECT ' . $sSqlSelect . '
            FROM ' . $sPictureTable . ' AS p
            INNER JOIN ' . $sAlbumTable . ' AS a USING(albumId)
            INNER JOIN ' . $sMemberTable . ' AS m ON p.profileId = m.profileId' .
            $sSqlWhere . ' AND p.approved = :approved' . $sSqlOrder . $sSqlLimit
        );

        if ($bDigitSearch) {
            $rStmt->bindValue(':looking', $mLooking, PDO::PARAM_INT);
        } else {
            $rStmt->bindValue(':looking', '%' . $mLooking . '%', PDO::PARAM_STR);
        }
        $rStmt->bindValue(':approved', $sApproved, PDO::PARAM_STR);

        if (!$bCount) {
            $rStmt->bindParam(':offset', $iOffset, PDO::PARAM_INT);
            $rStmt->bindParam(':limit', $iLimit, PDO::PARAM_INT);
        }

        $rStmt->execute();

        if (!$bCount) {
            $mData = $rStmt->fetchAll(PDO::FETCH_OBJ);
        } else {
            $mData = (int)$rStmt->fetchColumn();
        }

        Db::free($rStmt);

        return $mData;
    }

    public function getPublicGalleryPhotos(): array
    {
        $sPictureTable = Db::prefix(DbTableName::PICTURE, false);
        $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
        $sMemberTable = Db::prefix(DbTableName::MEMBER, false);
        $rStmt = Db::getInstance()->prepare(
            'SELECT p.*, a.name, m.username, m.firstName, m.sex
            FROM ' . $sPictureTable . ' AS p
            INNER JOIN ' . $sAlbumTable . ' AS a ON p.albumId = a.albumId AND p.profileId = a.profileId
            INNER JOIN ' . $sMemberTable . ' AS m ON p.profileId = m.profileId
            WHERE a.name = :albumName
            AND a.approved = :albumApproved
            AND p.approved = :photoApproved
            AND m.ban = 0
            ORDER BY p.createdDate DESC, p.pictureId DESC'
        );
        $rStmt->bindValue(':albumName', self::PUBLIC_GALLERY_ALBUM_NAME, PDO::PARAM_STR);
        $rStmt->bindValue(':albumApproved', '1', PDO::PARAM_STR);
        $rStmt->bindValue(':photoApproved', '1', PDO::PARAM_STR);
        $rStmt->execute();
        $aPhotos = $rStmt->fetchAll(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return $aPhotos;
    }

    public function getPublicGalleryPhoto(int $iPictureId): ?stdClass
    {
        $sPictureTable = Db::prefix(DbTableName::PICTURE, false);
        $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
        $sMemberTable = Db::prefix(DbTableName::MEMBER, false);
        $rStmt = Db::getInstance()->prepare(
            'SELECT p.*, a.name, m.username, m.firstName, m.sex
            FROM ' . $sPictureTable . ' AS p
            INNER JOIN ' . $sAlbumTable . ' AS a ON p.albumId = a.albumId AND p.profileId = a.profileId
            INNER JOIN ' . $sMemberTable . ' AS m ON p.profileId = m.profileId
            WHERE p.pictureId = :pictureId
            AND a.name = :albumName
            AND a.approved = :albumApproved
            AND p.approved = :photoApproved
            AND m.ban = 0
            LIMIT 1'
        );
        $rStmt->bindValue(':pictureId', $iPictureId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumName', self::PUBLIC_GALLERY_ALBUM_NAME, PDO::PARAM_STR);
        $rStmt->bindValue(':albumApproved', '1', PDO::PARAM_STR);
        $rStmt->bindValue(':photoApproved', '1', PDO::PARAM_STR);
        $rStmt->execute();
        $oPhoto = $rStmt->fetch(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return $oPhoto ?: null;
    }

    public function getOrCreatePublicGalleryAlbumId(int $iProfileId, string $sCreatedDate): int
    {
        $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
        $rStmt = Db::getInstance()->prepare(
            'SELECT albumId FROM ' . $sAlbumTable . '
            WHERE profileId = :profileId AND name = :name LIMIT 1'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':name', self::PUBLIC_GALLERY_ALBUM_NAME, PDO::PARAM_STR);
        $rStmt->execute();
        $iAlbumId = (int)$rStmt->fetchColumn();
        Db::free($rStmt);

        if ($iAlbumId > 0) {
            return $iAlbumId;
        }

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO ' . $sAlbumTable . ' (profileId, name, description, thumb, createdDate, approved)
            VALUES (:profileId, :name, :description, :thumb, :createdDate, :approved)'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':name', self::PUBLIC_GALLERY_ALBUM_NAME, PDO::PARAM_STR);
        $rStmt->bindValue(':description', 'Photos shared by this member in the SharedChemistry public member gallery.', PDO::PARAM_STR);
        $rStmt->bindValue(':thumb', '', PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', $sCreatedDate, PDO::PARAM_STR);
        $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);

        return (int)Db::getInstance()->lastInsertId();
    }

    public function updateAlbumThumb(int $iProfileId, int $iAlbumId, string $sFile, string $sUpdatedDate): void
    {
        $sAlbumTable = Db::prefix(DbTableName::ALBUM_PICTURE, false);
        $rStmt = Db::getInstance()->prepare(
            'UPDATE ' . $sAlbumTable . '
            SET thumb = :thumb, updatedDate = :updatedDate
            WHERE profileId = :profileId AND albumId = :albumId'
        );
        $rStmt->bindValue(':thumb', $sFile, PDO::PARAM_STR);
        $rStmt->bindValue(':updatedDate', $sUpdatedDate, PDO::PARAM_STR);
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':albumId', $iAlbumId, PDO::PARAM_INT);
        $rStmt->execute();
        Db::free($rStmt);
    }

    public function getPublicGalleryComments(int $iPictureId): array
    {
        $sCommentTable = Db::prefix(DbTableName::COMMENT_PICTURE, false);
        $sMemberTable = Db::prefix(DbTableName::MEMBER, false);
        $rStmt = Db::getInstance()->prepare(
            'SELECT c.*, m.username, m.firstName, m.sex
            FROM ' . $sCommentTable . ' AS c
            INNER JOIN ' . $sMemberTable . ' AS m ON c.sender = m.profileId
            WHERE c.recipient = :recipient
            AND c.approved = :approved
            AND m.ban = 0
            ORDER BY c.createdDate ASC'
        );
        $rStmt->bindValue(':recipient', $iPictureId, PDO::PARAM_INT);
        $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
        $rStmt->execute();
        $aComments = $rStmt->fetchAll(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return $aComments;
    }

    public function addPublicGalleryComment(int $iPictureId, int $iSenderId, string $sComment, string $sCreatedDate): bool
    {
        if ($this->getPublicGalleryPhoto($iPictureId) === null) {
            return false;
        }

        $sCommentTable = Db::prefix(DbTableName::COMMENT_PICTURE, false);
        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO ' . $sCommentTable . ' (comment, recipient, sender, approved, createdDate)
            VALUES (:comment, :recipient, :sender, :approved, :createdDate)'
        );
        $rStmt->bindValue(':comment', $sComment, PDO::PARAM_STR);
        $rStmt->bindValue(':recipient', $iPictureId, PDO::PARAM_INT);
        $rStmt->bindValue(':sender', $iSenderId, PDO::PARAM_INT);
        $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
        $rStmt->bindValue(':createdDate', $sCreatedDate, PDO::PARAM_STR);
        $bAdded = $rStmt->execute();
        Db::free($rStmt);

        return $bAdded;
    }
}
