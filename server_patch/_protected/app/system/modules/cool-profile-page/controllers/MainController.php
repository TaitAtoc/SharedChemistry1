<?php
/**
 * @title          Profile Controller
 *
 * @author         Pierre-Henry Soria <hello@ph7builder.com>
 * @copyright      (c) 2012-2021, Pierre-Henry Soria. All Rights Reserved.
 * @license        MIT License; See LICENSE.md and COPYRIGHT.md in the root directory.
 * @package        PH7 / App / System / Module / Cool Profile Page / Controller
 */

namespace PH7;

use PH7\Framework\Analytics\Statistic;
use PH7\Framework\Date\Various as VDate;
use PH7\Framework\Module\Various as SysMod;
use PH7\Framework\Mvc\Model\DbConfig;

class MainController extends ProfileBaseController
{
    const MAP_ZOOM_LEVEL = 10;
    const MAP_WIDTH_SIZE = '100%';
    const MAP_HEIGHT_SIZE = '200px';

    private const COUPLE_PROFILE_DATA_FIELD = 'couple_profile_data';

    public function __construct()
    {
        parent::__construct();

        $this->setProfileId($this->httpRequest->get('profile_id'));
        $this->setVisitorId($this->session->get('member_id'));
    }

    public function index(): void
    {
        $this->addCssFiles();
        $this->addAdditionalAssetFiles();

        // Read the profile information
        $oUser = $this->oUserModel->readProfile($this->iProfileId);
        if ($oUser) {
            // The administrators can view all profiles and profile visits are not saved.
            if (!AdminCore::auth() || UserCore::isAdminLoggedAs()) {
                $this->initPrivacy($oUser);
            }

            // Assign the profile background image to the view
            $this->view->img_background = $this->oUserModel->getBackground($this->iProfileId, 1);

            $oFields = $this->oUserModel->getInfoFields($this->iProfileId);
            $aCoupleProfile = $this->getCoupleProfileData($oFields);

            // Date of birth
            $this->view->birth_date = $oUser->birthDate;
            $this->view->birth_date_formatted = $this->dateTime->get($oUser->birthDate)->date();

            $aData = $this->getFilteredData($oUser, $oFields);
            $this->assignCoupleProfileViewData($aCoupleProfile, $aData, $oUser->username);

            $this->view->page_title = t(
                'Meet %0%. A %1% looking for %2% - %3% years - %4% - %5% %6%',
                $aData['first_name'],
                t($oUser->sex),
                t($oUser->matchSex),
                $aData['age'],
                t($aData['country']),
                $aData['city'],
                $aData['state']
            );

            $this->view->meta_description = t(
                'Meet %0% %1% | %2% - %3%',
                $aData['first_name'],
                $aData['last_name'],
                $oUser->username,
                substr($aData['description'], 0, 100)
            );

            $this->view->h1_title = t(
                'A <span class="pH1">%0%</span> of <span class="pH3">%1% years</span>, from <span class="pH2">%2%, %3% %4%</span>',
                t($oUser->sex),
                $aData['age'],
                t($aData['country']),
                $aData['city'],
                $aData['state']
            );

            $this->imageToSocialMetaTags($oUser);
            $this->setMenuBar($aData['first_name'], $oUser);

            if (SysMod::isEnabled('map')) {
                $this->setMap($aData['city'], $aData['country'], $oUser);
            }

            $this->view->id = $this->iProfileId;
            $this->view->visitor_id = $this->iVisitorId;
            $this->view->username = $oUser->username;
            $this->view->first_name = $aData['first_name'];
            $this->view->last_name = $aData['last_name'];
            $this->view->middle_name = $aData['middle_name'];
            $this->view->sex = $oUser->sex;
            $this->view->match_sex = $oUser->matchSex;
            $this->view->match_sex_search = str_replace(['[code]', ','], '&amp;sex[]=', '[code]' . $oUser->matchSex);
            $this->view->age = $aData['age'];
            $this->view->country = t($aData['country']);
            $this->view->country_code = $aData['country'];
            $this->view->city = $aData['city'];
            $this->view->state = $aData['state'];
            $this->view->punchline = $aData['punchline'];
            $this->view->description = nl2br($aData['description']);
            $this->view->join_date = VDate::textTimeStamp($oUser->joinDate);
            $this->view->last_activity = VDate::textTimeStamp($oUser->lastActivity);
            $this->view->fields = $oFields;
            $this->view->is_logged = $this->bUserAuth;
            $this->view->is_own_profile = $this->isOwnProfile();
            $this->view->is_profile_online = $this->oUserModel->isOnline($this->iProfileId, DbConfig::getSetting('userTimeout'));
            $this->view->profile_status_label = $this->view->is_profile_online ? t('Online') : t('Offline');

            // Count number of times the profile is viewed
            Statistic::setView($this->iProfileId, DbTableName::MEMBER);
        } else {
            $this->displayPageNotFound();
        }

        $this->output();
    }

    /**
     * Add the General and Tabs Menu stylesheets.
     */
    protected function addCssFiles(): void
    {
        $this->design->addCss(
            PH7_LAYOUT . PH7_SYS . PH7_MOD . $this->registry->module . PH7_SH . PH7_TPL . PH7_TPL_MOD_NAME . PH7_SH . PH7_CSS,
            'style.css'
        );
    }

    private function getCoupleProfileData(\stdClass $oFields): array
    {
        $aData = $this->getDefaultCoupleProfileData();
        $sJson = isset($oFields->{self::COUPLE_PROFILE_DATA_FIELD}) ? (string)$oFields->{self::COUPLE_PROFILE_DATA_FIELD} : '';

        if (!empty($sJson)) {
            $aDecoded = json_decode($sJson, true);
            if (is_array($aDecoded)) {
                $aData = array_merge($aData, array_intersect_key($aDecoded, $aData));
            }
        }

        foreach (['looking_for', 'hosting_travel', 'availability', 'sexual_interests'] as $sArrayKey) {
            if (!isset($aData[$sArrayKey]) || !is_array($aData[$sArrayKey])) {
                $aData[$sArrayKey] = [];
            }
        }

        if (empty($aData['about_us']) && !empty($oFields->description)) {
            $aData['about_us'] = (string)$oFields->description;
        }

        return $aData;
    }

    private function assignCoupleProfileViewData(array $aData, array $aProfileData, string $sUsername): void
    {
        $this->view->couple_profile = $aData;
        $this->view->couple_name = $aData['couple_name'];
        $this->view->profile_title = !empty($aData['couple_name']) ? $aData['couple_name'] : (!empty($aProfileData['first_name']) ? $aProfileData['first_name'] : $sUsername);
        $this->view->profile_location = $this->getProfileLocationText($aProfileData);
        $this->view->profile_age_text = $this->getProfileAgeText($aData);
        $this->view->about_us = $aData['about_us'];
        $this->view->her_name = $aData['her_name'];
        $this->view->her_age = $aData['her_age'];
        $this->view->her_ethnicity = $aData['her_ethnicity'];
        $this->view->her_languages = $aData['her_languages'];
        $this->view->her_sexuality = $aData['her_sexuality'];
        $this->view->her_experience_level = $aData['her_experience_level'];
        $this->view->about_her = $aData['about_her'];
        $this->view->him_name = $aData['him_name'];
        $this->view->him_age = $aData['him_age'];
        $this->view->him_ethnicity = $aData['him_ethnicity'];
        $this->view->him_languages = $aData['him_languages'];
        $this->view->him_sexuality = $aData['him_sexuality'];
        $this->view->him_experience_level = $aData['him_experience_level'];
        $this->view->about_him = $aData['about_him'];
        $this->view->looking_for = $aData['looking_for'];
        $this->view->hosting_travel = $aData['hosting_travel'];
        $this->view->availability = $aData['availability'];
        $this->view->sexual_interests = $aData['sexual_interests'];
        $this->view->fantasies = $aData['fantasies'];
        $this->view->boundaries = $aData['boundaries'];
        $this->view->ideal_match = $aData['ideal_match'];
    }

    private function getProfileLocationText(array $aProfileData): string
    {
        $aLocation = [];

        if (!empty($aProfileData['city'])) {
            $aLocation[] = $aProfileData['city'];
        }

        if (!empty($aProfileData['country'])) {
            $aLocation[] = t($aProfileData['country']);
        }

        return implode(', ', $aLocation);
    }

    private function getProfileAgeText(array $aData): string
    {
        $aAges = [];

        if (!empty($aData['her_age'])) {
            $aAges[] = $aData['her_age'];
        }

        if (!empty($aData['him_age'])) {
            $aAges[] = $aData['him_age'];
        }

        return implode(' / ', $aAges);
    }

    private function getDefaultCoupleProfileData(): array
    {
        return [
            'couple_name' => '',
            'her_name' => '',
            'her_age' => '',
            'her_ethnicity' => '',
            'her_languages' => '',
            'her_sexuality' => '',
            'her_experience_level' => '',
            'about_her' => '',
            'him_name' => '',
            'him_age' => '',
            'him_ethnicity' => '',
            'him_languages' => '',
            'him_sexuality' => '',
            'him_experience_level' => '',
            'about_him' => '',
            'about_us' => '',
            'looking_for' => [],
            'hosting_travel' => [],
            'availability' => [],
            'sexual_interests' => [],
            'fantasies' => '',
            'boundaries' => '',
            'ideal_match' => ''
        ];
    }
}
