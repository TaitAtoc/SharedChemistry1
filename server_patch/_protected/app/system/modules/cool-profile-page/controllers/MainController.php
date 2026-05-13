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
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Security\CSRF\Token;
use PDO;

class MainController extends ProfileBaseController
{
    const MAP_ZOOM_LEVEL = 10;
    const MAP_WIDTH_SIZE = '100%';
    const MAP_HEIGHT_SIZE = '200px';
    private const FRIEND_CARD_LIMIT = 6;
    private const VERIFIED_CARD_LIMIT = 6;
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';

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

            $this->view->page_title = $this->view->profile_title . ' | SharedChemistry';

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
            $this->view->is_own_profile = $this->isProfileOwner();
            $this->view->is_profile_online = $this->oUserModel->isOnline($this->iProfileId, DbConfig::getSetting('userTimeout'));
            $this->view->profile_status_label = $this->view->is_profile_online ? t('Online') : t('Offline');
            $this->view->public_profile_photos = (new ScPublicProfilePhoto)->getPhotos((int)$this->iProfileId, '1');
            $this->view->profile_friends = $this->getApprovedFriendCards((int)$this->iProfileId);
            $this->view->profile_friends_url = SysMod::isEnabled('friend') ? Uri::get('friend', 'main', 'index', $oUser->username) : '';
            $sReviewerDisplayName = !empty($aCoupleProfile['couple_name']) ? $aCoupleProfile['couple_name'] : $oUser->username;
            $this->view->profile_verified_friends = $this->getVerifiedCoupleCards((int)$this->iProfileId, $sReviewerDisplayName);
            $this->view->verification_csrf_token = (new Token)->generate('couple_verification');

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
            $aDecoded = $this->decodeCoupleProfileJson($sJson);
            if (is_array($aDecoded)) {
                $aDecoded = $this->normalizeDecodedCoupleProfileData($aDecoded);
                $aData = array_merge($aData, array_intersect_key($aDecoded, $aData));
            }
        }

        foreach (['looking_for', 'hosting_travel', 'availability', 'sexual_interests'] as $sArrayKey) {
            if (!isset($aData[$sArrayKey]) || !is_array($aData[$sArrayKey])) {
                $aData[$sArrayKey] = [];
            }
        }

        if (empty($aData['about_us']) && !empty($oFields->description)) {
            $aData['about_us'] = $this->cleanProfileTextValue($oFields->description);
        }

        return $aData;
    }

    private function normalizeDecodedCoupleProfileData(array $aData): array
    {
        foreach ($this->getCoupleProfileTextAliases() as $sCanonicalKey => $aAliases) {
            $sValue = $this->getFirstProfileTextValue($aData, $aAliases);
            if ($sValue !== '') {
                $aData[$sCanonicalKey] = $sValue;
            }
        }

        foreach ($this->getCoupleProfileScalarKeys() as $sKey) {
            if (isset($aData[$sKey]) && !is_array($aData[$sKey])) {
                $aData[$sKey] = $this->cleanProfileTextValue($aData[$sKey]);
            }
        }

        return $aData;
    }

    private function getCoupleProfileTextAliases(): array
    {
        return [
            'about_us' => ['about_us', 'aboutUs', 'about'],
            'about_her' => ['about_her', 'aboutHer', 'her_about', 'herAbout'],
            'about_him' => ['about_him', 'aboutHim', 'him_about', 'himAbout'],
            'fantasies' => ['fantasies', 'fantasy'],
            'boundaries' => ['boundaries', 'boundary', 'limits'],
            'ideal_match' => ['ideal_match', 'idealMatch', 'ideal']
        ];
    }

    private function getCoupleProfileScalarKeys(): array
    {
        return [
            'couple_name',
            'her_name',
            'her_age',
            'her_ethnicity',
            'her_languages',
            'her_sexuality',
            'her_experience_level',
            'about_her',
            'him_name',
            'him_age',
            'him_ethnicity',
            'him_languages',
            'him_sexuality',
            'him_experience_level',
            'about_him',
            'about_us',
            'fantasies',
            'boundaries',
            'ideal_match'
        ];
    }

    private function getFirstProfileTextValue(array $aData, array $aKeys): string
    {
        foreach ($aKeys as $sKey) {
            if (isset($aData[$sKey]) && !is_array($aData[$sKey])) {
                $sValue = $this->cleanProfileTextValue($aData[$sKey]);
                if ($sValue !== '') {
                    return $sValue;
                }
            }
        }

        return '';
    }

    private function cleanProfileTextValue($mValue): string
    {
        $sValue = trim((string)$mValue);
        if ($sValue === '') {
            return '';
        }

        return trim(stripslashes(html_entity_decode($sValue, ENT_QUOTES, 'UTF-8')));
    }

    private function decodeCoupleProfileJson(string $sJson): ?array
    {
        foreach ($this->getCoupleProfileJsonCandidates($sJson) as $sCandidate) {
            $aDecoded = json_decode($sCandidate, true);
            if (is_array($aDecoded)) {
                return $aDecoded;
            }
        }

        return null;
    }

    private function getCoupleProfileJsonCandidates(string $sJson): array
    {
        $sTrimmedJson = trim($sJson);
        $aCandidates = [
            $sTrimmedJson,
            html_entity_decode($sTrimmedJson, ENT_QUOTES, 'UTF-8'),
            stripslashes($sTrimmedJson),
            stripslashes(html_entity_decode($sTrimmedJson, ENT_QUOTES, 'UTF-8'))
        ];

        return array_values(array_unique($aCandidates));
    }

    private function assignCoupleProfileViewData(array $aData, array $aProfileData, string $sUsername): void
    {
        $this->view->couple_profile = $aData;
        $this->view->couple_name = $aData['couple_name'];
        $this->view->profile_title = !empty($aData['couple_name']) ? $aData['couple_name'] : $sUsername;
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

    private function getApprovedFriendCards(int $iProfileId): array
    {
        $aFriends = [];

        foreach ($this->getApprovedFriendIds($iProfileId) as $iFriendId) {
            $oFriend = $this->oUserModel->readProfile($iFriendId);
            if (!$oFriend || (int)$oFriend->ban === UserCore::BAN_STATUS) {
                continue;
            }

            $oFields = $this->oUserModel->getInfoFields($iFriendId);
            $aProfileData = $this->getFilteredData($oFriend, $oFields);
            $aCoupleProfile = $this->getCoupleProfileData($oFields);

            $aFriends[] = (object)[
                'profileId' => (int)$iFriendId,
                'username' => $oFriend->username,
                'firstName' => $oFriend->firstName,
                'sex' => $oFriend->sex,
                'displayName' => !empty($aCoupleProfile['couple_name']) ? $aCoupleProfile['couple_name'] : $oFriend->username,
                'location' => $this->getProfileLocationText($aProfileData),
                'profileUrl' => Uri::get('cool-profile-page', 'main', 'index', $iFriendId),
                'avatarUrl' => $this->getFriendAvatarUrl($oFriend),
                'isOnline' => $this->oUserModel->isOnline($iFriendId, DbConfig::getSetting('userTimeout'))
            ];
        }

        return $aFriends;
    }

    private function isProfileOwner(): bool
    {
        return $this->bUserAuth && (int)$this->iProfileId > 0 && (int)$this->iProfileId === (int)$this->iVisitorId;
    }

    private function getFriendAvatarUrl(\stdClass $oFriend): string
    {
        $sAvatarUrl = (string)$this->design->getUserAvatar($oFriend->username, $oFriend->sex, 150, false);

        return !empty($sAvatarUrl) ? $sAvatarUrl : PH7_URL_TPL . PH7_TPL_NAME . PH7_SH . PH7_IMG . 'sharedchemistry/SharedChemistyAvatar.png';
    }

    private function getVerifiedCoupleCards(int $iVerifierProfileId, string $sReviewerDisplayName): array
    {
        $aVerifiedCouples = [];

        foreach ($this->getVerifiedCoupleRows($iVerifierProfileId) as $oVerification) {
            $oVerified = $this->oUserModel->readProfile((int)$oVerification->verified_profile_id);
            if (!$oVerified || (int)$oVerified->ban === UserCore::BAN_STATUS) {
                continue;
            }

            $oFields = $this->oUserModel->getInfoFields((int)$oVerification->verified_profile_id);
            $aCoupleProfile = $this->getCoupleProfileData($oFields);

            $aVerifiedCouples[] = (object)[
                'profileId' => (int)$oVerification->verified_profile_id,
                'username' => $oVerified->username,
                'sex' => $oVerified->sex,
                'displayName' => !empty($aCoupleProfile['couple_name']) ? $aCoupleProfile['couple_name'] : $oVerified->username,
                'profileUrl' => Uri::get('cool-profile-page', 'main', 'index', (int)$oVerification->verified_profile_id),
                'avatarUrl' => $this->getFriendAvatarUrl($oVerified),
                'reviewerDisplayName' => $sReviewerDisplayName,
                'note' => (string)$oVerification->note
            ];
        }

        return $aVerifiedCouples;
    }

    private function getVerifiedCoupleRows(int $iVerifierProfileId): array
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT verified_profile_id, note FROM' .
                Db::prefix(self::COUPLE_VERIFICATION_TABLE) .
                'WHERE verifier_profile_id = :verifierProfileId AND status = :status ORDER BY updated_at DESC LIMIT :limit'
            );
            $rStmt->bindValue(':verifierProfileId', $iVerifierProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':status', 'active', PDO::PARAM_STR);
            $rStmt->bindValue(':limit', self::VERIFIED_CARD_LIMIT, PDO::PARAM_INT);
            $rStmt->execute();
            $aRows = $rStmt->fetchAll(PDO::FETCH_OBJ);
            Db::free($rStmt);

            return is_array($aRows) ? $aRows : [];
        } catch (\Exception $oException) {
            return [];
        }
    }

    private function getApprovedFriendIds(int $iProfileId): array
    {
        $rStmt = Db::getInstance()->prepare(
            'SELECT CASE WHEN profileId = :profileId THEN friendId ELSE profileId END AS friendId FROM' .
            Db::prefix(DbTableName::MEMBER_FRIEND) .
            'WHERE pending = :approved AND (profileId = :profileId OR friendId = :profileId) ORDER BY requestDate DESC LIMIT :limit'
        );
        $rStmt->bindValue(':profileId', $iProfileId, PDO::PARAM_INT);
        $rStmt->bindValue(':approved', FriendCoreModel::APPROVED_REQUEST, PDO::PARAM_INT);
        $rStmt->bindValue(':limit', self::FRIEND_CARD_LIMIT, PDO::PARAM_INT);
        $rStmt->execute();
        $aFriendIds = array_map('intval', $rStmt->fetchAll(PDO::FETCH_COLUMN));
        Db::free($rStmt);

        return $aFriendIds;
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
