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
use PH7\Framework\Mvc\Request\Http;
use stdClass;

class EditFormProcess extends Form
{
    private const COUPLE_PROFILE_DATA_FIELD = 'couple_profile_data';

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

        if (!$this->str->equals($this->httpRequest->post('first_name'), $oUser->firstName)) {
            $oUserModel->updateProfile('firstName', $this->httpRequest->post('first_name'), $iProfileId);
            $this->session->set('member_first_name', $this->httpRequest->post('first_name'));

            $this->clearFieldCache('firstName', $iProfileId);
        }

        if (!$this->str->equals($this->httpRequest->post('last_name'), $oUser->lastName)) {
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
        if (!$this->str->equals($this->httpRequest->post('match_sex', Http::NO_CLEAN), $oUser->matchSex)) {
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
