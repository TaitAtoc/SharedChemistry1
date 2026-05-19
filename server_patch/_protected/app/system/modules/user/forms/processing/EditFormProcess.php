<?php
/**
 * @author         Pierre-Henry Soria <hello@ph7builder.com>
 * @copyright      (c) 2012-2019, Pierre-Henry Soria. All Rights Reserved.
 * @license        MIT License; See LICENSE.md and COPYRIGHT.md in the root directory.
 * @package        PH7 / App / System / Module / User / Form / Processing
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

use PH7\Framework\Cache\Cache;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Request\Http;
use PH7\Framework\Session\Session;
use PDO;
use stdClass;

class EditFormProcess extends Form
{
    private const COUPLE_PROFILE_DATA_FIELD = 'couple_profile_data';
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';
    private const PRIVATE_MEDIA_ACCESS_TABLE = 'private_media_access';
    private const PRIVATE_PHOTO_ALBUM_NAMES = [
        'Private Photos',
        'Private',
        'SharedChemistry Private Photos'
    ];
    private const PRIVATE_VIDEO_ALBUM_NAMES = [
        'Private Videos',
        'Private',
        'SharedChemistry Private Videos'
    ];

    /**
     * @param int $iProfileId
     *
     * @throws Framework\Mvc\Request\WrongRequestMethodException
     */
    public function __construct($iProfileId)
    {
        parent::__construct();

        $oUserModel = new UserModel;
        $oUser = $oUserModel->readProfile($iProfileId);

        if ($this->isOnlyAdminLoggedAndUserIdExists()) {
            $this->updateUserMembership($iProfileId, $oUser, $oUserModel);
        }

        if ($this->httpRequest->postExists('first_name') && !$this->str->equals($this->httpRequest->post('first_name'), $oUser->firstName)) {
            $oUserModel->updateProfile('firstName', $this->httpRequest->post('first_name'), $iProfileId);
            $this->session->set('member_first_name', $this->httpRequest->post('first_name'));

            $this->clearFieldCache('firstName', $iProfileId);
        }

        if ($this->httpRequest->postExists('last_name') && !$this->str->equals($this->httpRequest->post('last_name'), $oUser->lastName)) {
            $oUserModel->updateProfile('lastName', $this->httpRequest->post('last_name'), $iProfileId);
        }

        if ($this->isOnlyAdminLoggedAndUserIdExists()) {
            // For security reasons, only admins can change profile gender
            if (!$this->str->equals($this->httpRequest->post('sex'), $oUser->sex)) {
                $oUserModel->updateProfile('sex', $this->httpRequest->post('sex'), $iProfileId);
                $this->session->set('member_sex', $this->httpRequest->post('sex'));

                $this->clearFieldCache('sex', $iProfileId);
            }
        }

        // WARNING: Be careful, you should use the Http::NO_CLEAN constant, otherwise Http::post() method removes the special tags
        // and damages the SET function SQL for entry into the database.
        if ($this->httpRequest->postExists('match_sex') && !$this->str->equals($this->httpRequest->post('match_sex', Http::NO_CLEAN), $oUser->matchSex)) {
            $oUserModel->updateProfile(
                'matchSex',
                Form::setVal($this->httpRequest->post('match_sex', Http::NO_CLEAN)),
                $iProfileId
            );

            $this->clearFieldCache('matchsex', $iProfileId, null);
        }

        if ($this->isOnlyAdminLoggedAndUserIdExists()) {
            // For security reasons, only admins can change the DOB
            if (!$this->str->equals($this->dateTime->get($this->httpRequest->post('birth_date'))->date('Y-m-d'), $oUser->birthDate)) {
                $oUserModel->updateProfile(
                    'birthDate',
                    $this->dateTime->get($this->httpRequest->post('birth_date'))->date('Y-m-d'),
                    $iProfileId
                );
            }
        }

        $this->updateCoupleProfileData($iProfileId, $oUserModel);
        $this->updatePrivateMediaAccess((int)$iProfileId);
        $this->updateDynamicFields($iProfileId, $oUserModel);
        $oUserModel->setLastEdit($iProfileId);
        $this->clearCaches($iProfileId);

        // Destroy objects
        unset($oUserModel, $oUser);

        \PFBC\Form::setSuccess(
            'form_user_edit_account',
            t('The profile has been successfully updated')
        );
    }

    /**
     * Update user's in-depth couple profile JSON.
     *
     * @param int $iProfileId
     * @param UserCoreModel $oUserModel
     *
     * @return void
     *
     * @throws Framework\Mvc\Request\WrongRequestMethodException
     */
    private function updateCoupleProfileData($iProfileId, UserCoreModel $oUserModel)
    {
        $oFields = $oUserModel->getInfoFields($iProfileId);
        $sCurrentJson = isset($oFields->{self::COUPLE_PROFILE_DATA_FIELD}) ? (string)$oFields->{self::COUPLE_PROFILE_DATA_FIELD} : '';
        $sNewJson = json_encode($this->getCoupleProfilePayload(), JSON_UNESCAPED_SLASHES);

        if ($sNewJson !== false && !$this->str->equals($sNewJson, $sCurrentJson)) {
            $oUserModel->updateProfile(
                self::COUPLE_PROFILE_DATA_FIELD,
                $sNewJson,
                $iProfileId,
                DbTableName::MEMBER_INFO
            );
        }

        $sAboutUs = $this->getLongText('about_us');
        $sCurrentDescription = isset($oFields->description) ? (string)$oFields->description : '';
        if (!$this->str->equals($sAboutUs, $sCurrentDescription)) {
            $oUserModel->updateProfile(
                'description',
                $sAboutUs,
                $iProfileId,
                DbTableName::MEMBER_INFO
            );
        }
    }

    /**
     * Update user's info fields.
     *
     * @param int $iProfileId
     * @param UserCoreModel $oUserModel
     *
     * @return void
     *
     * @throws Framework\Mvc\Request\WrongRequestMethodException
     */
    private function updateDynamicFields($iProfileId, UserCoreModel $oUserModel)
    {
        $oFields = $oUserModel->getInfoFields($iProfileId);
        foreach ($oFields as $sColumn => $sValue) {
            if ($sColumn === self::COUPLE_PROFILE_DATA_FIELD || $sColumn === 'country' || $sColumn === 'city') {
                continue;
            }

            $sHRParam = ($sColumn === 'description') ? Http::ONLY_XSS_CLEAN : null;
            if ($this->httpRequest->postExists($sColumn) && !$this->str->equals($this->httpRequest->post($sColumn, $sHRParam), $sValue)) {
                $oUserModel->updateProfile(
                    $sColumn,
                    $this->httpRequest->post($sColumn, $sHRParam),
                    $iProfileId,
                    DbTableName::MEMBER_INFO
                );
            }
        }
        unset($oFields);
    }

    /**
     * Allow admins to update user's membership.
     *
     * @param int $iProfileId
     * @param stdClass $oUser
     * @param UserCoreModel $oUserModel
     *
     * @return void
     *
     * @throws Framework\Mvc\Request\WrongRequestMethodException
     */
    private function updateUserMembership($iProfileId, stdClass $oUser, UserCoreModel $oUserModel)
    {
        if (!$this->str->equals($this->httpRequest->post('group_id'), $oUser->groupId)) {
            $oUserModel->updateMembership(
                $this->httpRequest->post('group_id'),
                $iProfileId,
                $this->dateTime->get()->dateTime(UserCoreModel::DATETIME_FORMAT)
            );

            $this->clearFieldCache('membershipDetails', $iProfileId);
        }
    }

    private function getCoupleProfilePayload()
    {
        return [
            'couple_name' => $this->getText('couple_name'),
            'her_name' => $this->getText('her_name'),
            'her_age' => $this->getText('her_age'),
            'her_ethnicity' => $this->getText('her_ethnicity'),
            'her_languages' => $this->getText('her_languages'),
            'her_sexuality' => $this->getOption('her_sexuality', $this->sexualityOptions()),
            'her_experience_level' => $this->getOption('her_experience_level', $this->experienceOptions()),
            'about_her' => $this->getLongText('about_her'),
            'him_name' => $this->getText('him_name'),
            'him_age' => $this->getText('him_age'),
            'him_ethnicity' => $this->getText('him_ethnicity'),
            'him_languages' => $this->getText('him_languages'),
            'him_sexuality' => $this->getOption('him_sexuality', $this->sexualityOptions()),
            'him_experience_level' => $this->getOption('him_experience_level', $this->experienceOptions()),
            'about_him' => $this->getLongText('about_him'),
            'about_us' => $this->getLongText('about_us'),
            'looking_for' => $this->getArrayOptions('looking_for', $this->lookingForOptions()),
            'hosting_travel' => $this->getArrayOptions('hosting_travel', $this->hostingTravelOptions()),
            'availability' => $this->getArrayOptions('availability', $this->availabilityOptions()),
            'sexual_interests' => $this->getArrayOptions('sexual_interests', $this->sexualInterestsOptions()),
            'fantasies' => $this->getLongText('fantasies'),
            'boundaries' => $this->getLongText('boundaries'),
            'ideal_match' => $this->getLongText('ideal_match')
        ];
    }

    private function getText($sKey)
    {
        return $this->httpRequest->postExists($sKey) ? trim((string)$this->httpRequest->post($sKey)) : '';
    }

    private function getLongText($sKey)
    {
        return $this->httpRequest->postExists($sKey) ? trim((string)$this->httpRequest->post($sKey, Http::ONLY_XSS_CLEAN)) : '';
    }

    private function getOption($sKey, array $aAllowed)
    {
        $sValue = $this->getText($sKey);

        return in_array($sValue, $aAllowed, true) ? $sValue : '';
    }

    private function getArrayOptions($sKey, array $aAllowed)
    {
        $mValue = $this->httpRequest->postExists($sKey) ? $this->httpRequest->post($sKey, Http::NO_CLEAN) : [];
        $aValue = is_array($mValue) ? $mValue : [];

        return array_values(array_intersect($aAllowed, $aValue));
    }

    private function sexualityOptions()
    {
        return [
            'Straight',
            'Bi-curious',
            'Bisexual',
            'Pansexual',
            'Prefer not to say'
        ];
    }

    private function experienceOptions()
    {
        return [
            'New / Curious',
            'Exploring',
            'Some experience',
            'Experienced',
            'Very experienced',
            'Prefer not to say'
        ];
    }

    private function lookingForOptions()
    {
        return [
            'Looking for friendship',
            'Looking for dating',
            'Looking for intimate playtime',
            'Looking for parties/events',
            'Looking for social meetups',
            'Looking for ongoing connections',
            'Looking for occasional meetups'
        ];
    }

    private function hostingTravelOptions()
    {
        return [
            'Can host',
            'Cannot host',
            'Open to travel',
            'Prefer local couples',
            'Open to events/parties',
            'Hotel meetups okay',
            'Prefer public meet first'
        ];
    }

    private function availabilityOptions()
    {
        return [
            'Weekdays',
            'Weekends',
            'Daytime',
            'Evenings'
        ];
    }

    private function sexualInterestsOptions()
    {
        return [
            'Watching',
            'Soft swap',
            'Oral',
            'Full swap',
            'Same-room play',
            'Separate-room play',
            'Social only at first',
            'Not sure yet',
            'Prefer to discuss privately'
        ];
    }

    /**
     * Persist the private media permission toggles emitted by EditForm.php.
     * Only the logged-in owner can update this list; forged IDs are discarded by
     * rebuilding the eligible friend/verified-friend set on the server.
     */
    private function updatePrivateMediaAccess($iProfileId)
    {
        $iProfileId = (int)$iProfileId;
        $iLoggedProfileId = (int)(new Session)->get('member_id');
        if (!User::auth() || $iProfileId < 1 || $iLoggedProfileId !== $iProfileId) {
            return;
        }

        $aEligibleRecipientIds = array_fill_keys($this->getPrivateMediaAccessRecipientIds($iProfileId), true);
        $aPostedAccess = $this->httpRequest->postExists('private_media_access')
            ? $this->httpRequest->post('private_media_access', Http::NO_CLEAN)
            : [];
        $aPostedAccess = is_array($aPostedAccess) ? $aPostedAccess : [];

        foreach (array_keys($aEligibleRecipientIds) as $iRecipientId) {
            $iRecipientId = (int)$iRecipientId;
            if ($iRecipientId < 1 || $iRecipientId === $iProfileId) {
                continue;
            }

            foreach (['photo', 'video'] as $sMediaType) {
                $bShouldGrant = $this->isPrivateMediaAccessChecked($aPostedAccess, $iRecipientId, $sMediaType);
                if ($bShouldGrant) {
                    $this->grantPrivateMediaAccess($iProfileId, $iRecipientId, $sMediaType);
                } else {
                    $this->revokePrivateMediaAccess($iProfileId, $iRecipientId, $sMediaType);
                }
            }
        }
    }

    private function isPrivateMediaAccessChecked(array $aPostedAccess, $iRecipientId, $sMediaType)
    {
        $iRecipientId = (int)$iRecipientId;
        if (!isset($aPostedAccess[$iRecipientId]) || !is_array($aPostedAccess[$iRecipientId])) {
            return false;
        }

        $mValue = $aPostedAccess[$iRecipientId][$sMediaType] ?? null;

        return $mValue === '1' || $mValue === 1 || $mValue === true || $mValue === 'on';
    }

    private function grantPrivateMediaAccess($iProfileId, $iRecipientId, $sMediaType)
    {
        $aMediaIds = $this->getPrivateMediaIds((int)$iProfileId, $sMediaType);
        $aExistingIds = $this->getExistingPrivateMediaAccessIds((int)$iProfileId, (int)$iRecipientId, $sMediaType);

        foreach ($aMediaIds as $iMediaId) {
            if (!isset($aExistingIds[$iMediaId])) {
                $this->insertPrivateMediaAccess((int)$iProfileId, (int)$iRecipientId, $sMediaType, (int)$iMediaId);
            }
        }
    }

    private function revokePrivateMediaAccess($iProfileId, $iRecipientId, $sMediaType)
    {
        $aColumns = $this->getPrivateMediaAccessColumns($sMediaType);
        if (empty($aColumns['owner']) || empty($aColumns['viewer'])) {
            return;
        }

        try {
            $sSql = 'DELETE FROM' . Db::prefix(self::PRIVATE_MEDIA_ACCESS_TABLE) .
                'WHERE ' . $aColumns['owner'] . ' = :profileId AND ' . $aColumns['viewer'] . ' = :recipientId';
            if (!empty($aColumns['mediaType'])) {
                $sSql .= ' AND ' . $aColumns['mediaType'] . ' = :mediaType';
            }

            $rStmt = Db::getInstance()->prepare($sSql);
            $rStmt->bindValue(':profileId', (int)$iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':recipientId', (int)$iRecipientId, PDO::PARAM_INT);
            if (!empty($aColumns['mediaType'])) {
                $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            }
            $rStmt->execute();
            Db::free($rStmt);
        } catch (\Exception $oException) {
            return;
        }
    }

    private function insertPrivateMediaAccess($iProfileId, $iRecipientId, $sMediaType, $iMediaId)
    {
        $aColumns = $this->getPrivateMediaAccessColumns($sMediaType);
        if (empty($aColumns['owner']) || empty($aColumns['viewer'])) {
            return;
        }

        try {
            $aInsertColumns = [$aColumns['owner'], $aColumns['viewer']];
            $aInsertParams = [':profileId', ':recipientId'];

            if (!empty($aColumns['mediaId'])) {
                $aInsertColumns[] = $aColumns['mediaId'];
                $aInsertParams[] = ':mediaId';
            }

            if (!empty($aColumns['mediaType'])) {
                $aInsertColumns[] = $aColumns['mediaType'];
                $aInsertParams[] = ':mediaType';
            }

            if (!empty($aColumns['createdAt'])) {
                $aInsertColumns[] = $aColumns['createdAt'];
                $aInsertParams[] = 'NOW()';
            }

            $rStmt = Db::getInstance()->prepare(
                'INSERT INTO' . Db::prefix(self::PRIVATE_MEDIA_ACCESS_TABLE) .
                '(' . implode(',', $aInsertColumns) . ') VALUES(' . implode(',', $aInsertParams) . ')'
            );
            $rStmt->bindValue(':profileId', (int)$iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':recipientId', (int)$iRecipientId, PDO::PARAM_INT);
            if (!empty($aColumns['mediaId'])) {
                $rStmt->bindValue(':mediaId', (int)$iMediaId, PDO::PARAM_INT);
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

    private function getExistingPrivateMediaAccessIds($iProfileId, $iRecipientId, $sMediaType)
    {
        $aColumns = $this->getPrivateMediaAccessColumns($sMediaType);
        if (empty($aColumns['owner']) || empty($aColumns['viewer'])) {
            return [];
        }

        try {
            $sSelect = !empty($aColumns['mediaId']) ? $aColumns['mediaId'] : '0';
            $sSql = 'SELECT ' . $sSelect . ' FROM' . Db::prefix(self::PRIVATE_MEDIA_ACCESS_TABLE) .
                'WHERE ' . $aColumns['owner'] . ' = :profileId AND ' . $aColumns['viewer'] . ' = :recipientId';
            if (!empty($aColumns['mediaType'])) {
                $sSql .= ' AND ' . $aColumns['mediaType'] . ' = :mediaType';
            }

            $rStmt = Db::getInstance()->prepare($sSql);
            $rStmt->bindValue(':profileId', (int)$iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':recipientId', (int)$iRecipientId, PDO::PARAM_INT);
            if (!empty($aColumns['mediaType'])) {
                $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            }
            $rStmt->execute();
            $aIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return array_fill_keys($aIds, true);
        } catch (\Exception $oException) {
            return [];
        }
    }

    private function getPrivateMediaIds($iProfileId, $sMediaType)
    {
        return $sMediaType === 'photo' ? $this->getPrivatePhotoIds($iProfileId) : $this->getPrivateVideoIds($iProfileId);
    }

    private function getPrivatePhotoIds($iProfileId)
    {
        try {
            $aAlbumParams = $this->getSqlInParams(self::PRIVATE_PHOTO_ALBUM_NAMES, 'photoAlbum');
            $rStmt = Db::getInstance()->prepare(
                'SELECT p.pictureId FROM' . Db::prefix(DbTableName::PICTURE) . 'AS p INNER JOIN' .
                Db::prefix(DbTableName::ALBUM_PICTURE) . 'AS a ON p.albumId = a.albumId ' .
                'WHERE p.profileId = :profileId AND a.profileId = :profileId AND a.name IN (' . implode(',', array_keys($aAlbumParams)) . ') ' .
                'AND p.approved = :approved'
            );
            $rStmt->bindValue(':profileId', (int)$iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
            foreach ($aAlbumParams as $sParam => $sName) {
                $rStmt->bindValue($sParam, $sName, PDO::PARAM_STR);
            }
            $rStmt->execute();
            $aIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return $aIds;
        } catch (\Exception $oException) {
            return [];
        }
    }

    private function getPrivateVideoIds($iProfileId)
    {
        try {
            $aAlbumParams = $this->getSqlInParams(self::PRIVATE_VIDEO_ALBUM_NAMES, 'videoAlbum');
            $rStmt = Db::getInstance()->prepare(
                'SELECT v.videoId FROM' . Db::prefix(DbTableName::VIDEO) . 'AS v INNER JOIN' .
                Db::prefix(DbTableName::ALBUM_VIDEO) . 'AS a ON v.albumId = a.albumId ' .
                'WHERE v.profileId = :profileId AND a.profileId = :profileId AND a.name IN (' . implode(',', array_keys($aAlbumParams)) . ') ' .
                'AND v.approved = :approved'
            );
            $rStmt->bindValue(':profileId', (int)$iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':approved', '1', PDO::PARAM_STR);
            foreach ($aAlbumParams as $sParam => $sName) {
                $rStmt->bindValue($sParam, $sName, PDO::PARAM_STR);
            }
            $rStmt->execute();
            $aIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return $aIds;
        } catch (\Exception $oException) {
            return [];
        }
    }

    private function getPrivateMediaAccessRecipientIds($iProfileId)
    {
        return array_values(array_unique(array_merge(
            $this->getApprovedFriendIds($iProfileId),
            $this->getVerifiedCoupleIds($iProfileId)
        )));
    }

    private function getApprovedFriendIds($iProfileId)
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT CASE WHEN profileId = :profileId THEN friendId ELSE profileId END AS friendId FROM' .
                Db::prefix(DbTableName::MEMBER_FRIEND) .
                'WHERE pending = :approved AND (profileId = :profileId OR friendId = :profileId)'
            );
            $rStmt->bindValue(':profileId', (int)$iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':approved', FriendCoreModel::APPROVED_REQUEST, PDO::PARAM_INT);
            $rStmt->execute();
            $aIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return $aIds;
        } catch (\Exception $oException) {
            return [];
        }
    }

    private function getVerifiedCoupleIds($iProfileId)
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT CASE WHEN verifier_profile_id = :profileId THEN verified_profile_id ELSE verifier_profile_id END AS profileId FROM' .
                Db::prefix(self::COUPLE_VERIFICATION_TABLE) .
                'WHERE status = :status AND (verifier_profile_id = :profileId OR verified_profile_id = :profileId)'
            );
            $rStmt->bindValue(':profileId', (int)$iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':status', 'active', PDO::PARAM_STR);
            $rStmt->execute();
            $aIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);

            return $aIds;
        } catch (\Exception $oException) {
            return [];
        }
    }

    private function getPrivateMediaAccessColumns($sMediaType)
    {
        $aTableColumns = $this->getTableColumns(self::PRIVATE_MEDIA_ACCESS_TABLE);

        return [
            'owner' => $this->getFirstExistingColumn($aTableColumns, ['owner_profile_id', 'profile_id', 'profileId']),
            'viewer' => $this->getFirstExistingColumn($aTableColumns, ['viewer_profile_id', 'viewer_id', 'viewerId', 'member_id', 'memberId', 'friend_id', 'friendId']),
            'mediaId' => $this->getFirstExistingColumn(
                $aTableColumns,
                $sMediaType === 'photo' ? ['media_id', 'mediaId', 'picture_id', 'pictureId'] : ['media_id', 'mediaId', 'video_id', 'videoId']
            ),
            'mediaType' => $this->getFirstExistingColumn($aTableColumns, ['media_type', 'mediaType', 'type']),
            'createdAt' => $this->getFirstExistingColumn($aTableColumns, ['created_at', 'createdDate'])
        ];
    }

    private function getTableColumns($sTableName)
    {
        static $aTableColumns = [];
        if (isset($aTableColumns[$sTableName])) {
            return $aTableColumns[$sTableName];
        }

        try {
            $rStmt = Db::getInstance()->query('DESCRIBE' . Db::prefix($sTableName));
            $aTableColumns[$sTableName] = array_map('strval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
            Db::free($rStmt);
        } catch (\Exception $oException) {
            $aTableColumns[$sTableName] = [];
        }

        return $aTableColumns[$sTableName];
    }

    private function getFirstExistingColumn(array $aColumns, array $aCandidates)
    {
        foreach ($aCandidates as $sCandidate) {
            if (in_array($sCandidate, $aColumns, true)) {
                return $sCandidate;
            }
        }

        return '';
    }

    private function getSqlInParams(array $aValues, $sPrefix)
    {
        $aParams = [];
        foreach (array_values($aValues) as $iIndex => $sValue) {
            $aParams[':' . $sPrefix . $iIndex] = $sValue;
        }

        return $aParams;
    }

    /**
     * @return bool
     */
    private function isOnlyAdminLoggedAndUserIdExists()
    {
        return AdminCore::auth() && !User::auth() &&
            $this->httpRequest->getExists('profile_id');
    }

    /**
     * @param string $sCacheId
     * @param int $iProfileId
     * @param string $sTableName
     *
     * @return void
     */
    private function clearFieldCache($sCacheId, $iProfileId, $sTableName = DbTableName::MEMBER)
    {
        (new Cache)->start(
            UserCoreModel::CACHE_GROUP,
            $sCacheId . $iProfileId . $sTableName,
            null
        )->clear();
    }

    /**
     * @param int $iProfileId
     */
    private function clearCaches($iProfileId)
    {
        $oUserCache = new User;
        $oUserCache->clearReadProfileCache($iProfileId);
        $oUserCache->clearInfoFieldCache($iProfileId);
        unset($oUserCache);
    }
}
