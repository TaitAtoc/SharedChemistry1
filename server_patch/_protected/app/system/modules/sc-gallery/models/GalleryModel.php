<?php
/**
 * SharedChemistry isolated public member gallery model.
 */

namespace PH7;

use PDO;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Model\Engine\Model;

class GalleryModel extends Model
{
    const PHOTO_TABLE = 'sc_public_gallery_photos';
    const COMMENT_TABLE = 'sc_public_gallery_comments';

    public function getPhotos(): array
    {
        $sPhotoTable = Db::prefix(self::PHOTO_TABLE, false);
        $sMemberTable = Db::prefix(DbTableName::MEMBER, false);

        $rStmt = Db::getInstance()->prepare(
            'SELECT p.*, m.username, m.firstName, m.sex
            FROM ' . $sPhotoTable . ' AS p
            INNER JOIN ' . $sMemberTable . ' AS m ON p.uploaderId = m.profileId
            WHERE p.approved = :approved
            AND m.ban = 0
            ORDER BY p.createdAt DESC, p.photoId DESC'
        );
        $rStmt->bindValue(':approved', 1, PDO::PARAM_INT);
        $rStmt->execute();
        $aPhotos = $rStmt->fetchAll(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return $aPhotos;
    }

    public function getPhoto(int $iPhotoId): ?object
    {
        $sPhotoTable = Db::prefix(self::PHOTO_TABLE, false);
        $sMemberTable = Db::prefix(DbTableName::MEMBER, false);

        $rStmt = Db::getInstance()->prepare(
            'SELECT p.*, m.username, m.firstName, m.sex
            FROM ' . $sPhotoTable . ' AS p
            INNER JOIN ' . $sMemberTable . ' AS m ON p.uploaderId = m.profileId
            WHERE p.photoId = :photoId
            AND p.approved = :approved
            AND m.ban = 0
            LIMIT 1'
        );
        $rStmt->bindValue(':photoId', $iPhotoId, PDO::PARAM_INT);
        $rStmt->bindValue(':approved', 1, PDO::PARAM_INT);
        $rStmt->execute();
        $oPhoto = $rStmt->fetch(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return $oPhoto ?: null;
    }

    public function addPhoto(
        int $iUploaderId,
        string $sTitle,
        string $sCaption,
        string $sFileName,
        string $sFilePath,
        string $sCreatedAt
    ): bool {
        $sPhotoTable = Db::prefix(self::PHOTO_TABLE, false);

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO ' . $sPhotoTable . ' (uploaderId, title, caption, fileName, filePath, createdAt, approved)
            VALUES (:uploaderId, :title, :caption, :fileName, :filePath, :createdAt, :approved)'
        );
        $rStmt->bindValue(':uploaderId', $iUploaderId, PDO::PARAM_INT);
        $rStmt->bindValue(':title', $sTitle, PDO::PARAM_STR);
        $rStmt->bindValue(':caption', $sCaption, PDO::PARAM_STR);
        $rStmt->bindValue(':fileName', $sFileName, PDO::PARAM_STR);
        $rStmt->bindValue(':filePath', $sFilePath, PDO::PARAM_STR);
        $rStmt->bindValue(':createdAt', $sCreatedAt, PDO::PARAM_STR);
        $rStmt->bindValue(':approved', 1, PDO::PARAM_INT);
        $bAdded = $rStmt->execute();
        Db::free($rStmt);

        return $bAdded;
    }

    public function getComments(int $iPhotoId): array
    {
        $sCommentTable = Db::prefix(self::COMMENT_TABLE, false);
        $sMemberTable = Db::prefix(DbTableName::MEMBER, false);

        $rStmt = Db::getInstance()->prepare(
            'SELECT c.*, m.username, m.firstName, m.sex
            FROM ' . $sCommentTable . ' AS c
            INNER JOIN ' . $sMemberTable . ' AS m ON c.commenterId = m.profileId
            WHERE c.photoId = :photoId
            AND c.approved = :approved
            AND m.ban = 0
            ORDER BY c.createdAt ASC, c.commentId ASC'
        );
        $rStmt->bindValue(':photoId', $iPhotoId, PDO::PARAM_INT);
        $rStmt->bindValue(':approved', 1, PDO::PARAM_INT);
        $rStmt->execute();
        $aComments = $rStmt->fetchAll(PDO::FETCH_OBJ);
        Db::free($rStmt);

        return $aComments;
    }

    public function addComment(int $iPhotoId, int $iCommenterId, string $sCommentText, string $sCreatedAt): bool
    {
        if ($this->getPhoto($iPhotoId) === null) {
            return false;
        }

        $sCommentTable = Db::prefix(self::COMMENT_TABLE, false);

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO ' . $sCommentTable . ' (photoId, commenterId, commentText, createdAt, approved)
            VALUES (:photoId, :commenterId, :commentText, :createdAt, :approved)'
        );
        $rStmt->bindValue(':photoId', $iPhotoId, PDO::PARAM_INT);
        $rStmt->bindValue(':commenterId', $iCommenterId, PDO::PARAM_INT);
        $rStmt->bindValue(':commentText', $sCommentText, PDO::PARAM_STR);
        $rStmt->bindValue(':createdAt', $sCreatedAt, PDO::PARAM_STR);
        $rStmt->bindValue(':approved', 1, PDO::PARAM_INT);
        $bAdded = $rStmt->execute();
        Db::free($rStmt);

        return $bAdded;
    }
}
