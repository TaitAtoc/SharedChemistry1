<?php
/**
 * @author         Pierre-Henry Soria <hello@ph7builder.com>
 * @copyright      (c) 2012-2019, Pierre-Henry Soria. All Rights Reserved.
 * @license        MIT License; See LICENSE.md and COPYRIGHT.md in the root directory.
 * @package        PH7/ App / System / Module / Friend / Model
 */

namespace PH7;

use PDO;
use PH7\Framework\Mvc\Model\Engine\Db;

class FriendModel extends FriendCoreModel
{
    const SUCCESS_STATUS = 0;
    const EXISTS_STATUS = 1;
    const UNEXISTENT_ID_STATUS = 2;
    const ERROR_STATUS = -1;
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';
    private const PRIVATE_MEDIA_ACCESS_TABLE = 'private_media_access';

    /** @var string */
    private $sStatus;

    /**
     * Add a friend.
     *
     * @param int $iProfileId = user Id
     * @param int $iFriendId friend id
     * @param string $sRequestDate Date of the Request Friend.
     * @param int $iPending 0 = approved or 1 = pending friend requests.
     *
     * @return int
     */
    public function add($iProfileId, $iFriendId, $sRequestDate, $iPending = self::PENDING_REQUEST)
    {
        $iProfileId = (int)$iProfileId;
        $iFriendId = (int)$iFriendId;

        if ($this->areProfileAndFriendExist($iProfileId, $iFriendId)) {
            if ($this->inList($iProfileId, $iFriendId) === false) {
                $sSqlQuery = 'INSERT INTO' . Db::prefix(DbTableName::MEMBER_FRIEND) .
                    '(profileId, friendId, pending, requestDate) VALUES (:profileId, :friendId, :pending, :requestDate)';

                $rStmt = Db::getInstance()->prepare($sSqlQuery);
                $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
                $rStmt->bindValue(':friendId', $iFriendId, PDO::PARAM_INT);
                $rStmt->bindValue(':pending', $iPending, PDO::PARAM_INT);
                $rStmt->bindValue(':requestDate', $sRequestDate, PDO::PARAM_STR);
                $oRow = $rStmt->execute();
                Db::free($rStmt);
                if (!$oRow) {
                    $this->sStatus = self::ERROR_STATUS;
                } else {
                    $this->sStatus = self::SUCCESS_STATUS;
                }
            } else {
                $this->sStatus = self::EXISTS_STATUS;
            }
        } else {
            $this->sStatus = self::UNEXISTENT_ID_STATUS;
        }

        unset($oExistsModel); // Destruction of the object

        return $this->sStatus;
    }

    /**
     * Approve friends.
     *
     * @param int $iProfileId
     * @param int $iFriendId
     *
     * @return bool
     */
    public function approval($iProfileId, $iFriendId)
    {
        $iProfileId = (int)$iProfileId;
        $iFriendId = (int)$iFriendId;

        $rStmt = Db::getInstance()->prepare('UPDATE' . Db::prefix(DbTableName::MEMBER_FRIEND) .
            'SET pending = :approved WHERE profileId = :friendId AND friendId = :profileId');
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':friendId', $iFriendId, PDO::PARAM_INT);
        $rStmt->bindValue(':approved', self::APPROVED_REQUEST, PDO::PARAM_INT);

        return $rStmt->execute();
    }

    /**
     * Delete a friend :-(
     *
     * @param int $iProfileId
     * @param int $iFriendId
     *
     * @return bool
     */
    public function delete($iProfileId, $iFriendId)
    {
        $iProfileId = (int)$iProfileId;
        $iFriendId = (int)$iFriendId;

        if (!$this->inList($iProfileId, $iFriendId, self::ALL_REQUEST)) {
            return false;
        }

        $rStmt = Db::getInstance()->prepare('DELETE FROM' . Db::prefix(DbTableName::MEMBER_FRIEND) .
            'WHERE (profileId = :profileId AND friendId = :friendId) OR (profileId = :friendId AND friendId = :profileId)');
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':friendId', $iFriendId, PDO::PARAM_INT);

        $bDeleted = $rStmt->execute() && $rStmt->rowCount() > 0;
        Db::free($rStmt);

        if ($bDeleted) {
            $this->cleanupDeletedFriendSafetyAccess($iProfileId, $iFriendId);
        }

        return $bDeleted;
    }

    private function cleanupDeletedFriendSafetyAccess(int $iProfileId, int $iFriendId): void
    {
        // SC_FRIEND_DELETE_SAFETY_CLEANUP_V1_ACTIVE
        $this->revokePrivateMediaAccessBetweenMembers($iProfileId, $iFriendId);
        $this->removeCoupleVerificationsBetweenMembers($iProfileId, $iFriendId);
    }

    private function revokePrivateMediaAccessBetweenMembers(int $iProfileId, int $iFriendId): void
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'DELETE FROM' . Db::prefix(self::PRIVATE_MEDIA_ACCESS_TABLE) .
                'WHERE media_type IN (:photoType, :videoType) AND ' .
                '((owner_id = :profileId AND viewer_id = :friendId) OR (owner_id = :friendId AND viewer_id = :profileId))'
            );
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':friendId', $iFriendId, PDO::PARAM_INT);
            $rStmt->bindValue(':photoType', 'photo', PDO::PARAM_STR);
            $rStmt->bindValue(':videoType', 'video', PDO::PARAM_STR);
            $rStmt->execute();
            Db::free($rStmt);
        } catch (\Exception $oException) {
            error_log('SC_FRIEND_DELETE_SAFETY_CLEANUP private_media_access failed: ' . $oException->getMessage());
        }
    }

    private function removeCoupleVerificationsBetweenMembers(int $iProfileId, int $iFriendId): void
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'DELETE FROM' . Db::prefix(self::COUPLE_VERIFICATION_TABLE) .
                'WHERE (verifier_profile_id = :profileId AND verified_profile_id = :friendId) ' .
                'OR (verifier_profile_id = :friendId AND verified_profile_id = :profileId)'
            );
            $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':friendId', $iFriendId, PDO::PARAM_INT);
            $rStmt->execute();
            Db::free($rStmt);
        } catch (\Exception $oException) {
            error_log('SC_FRIEND_DELETE_SAFETY_CLEANUP couple_verifications failed: ' . $oException->getMessage());
        }
    }

    private function areProfileAndFriendExist(int $iProfileId, int $iFriendId): bool
    {
        $sTableName = DbTableName::MEMBER;

        $oExistsModel = new ExistCoreModel;
        return $oExistsModel->id($iProfileId, $sTableName) && $oExistsModel->id($iFriendId, $sTableName);
    }
}
