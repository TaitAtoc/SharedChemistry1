<?php
/**
 * @author         Pierre-Henry Soria <hello@ph7builder.com>
 * @copyright      (c) 2012-2019, Pierre-Henry Soria. All Rights Reserved.
 * @license        MIT License; See LICENSE.md and COPYRIGHT.md in the root directory.
 * @package        PH7 / App / System / Module / User / Form
 */

namespace PH7;

use PFBC\Element\Button;
use PFBC\Element\Checkbox;
use PFBC\Element\Date;
use PFBC\Element\Email;
use PFBC\Element\Hidden;
use PFBC\Element\HTMLExternal;
use PFBC\Element\Number;
use PFBC\Element\Radio;
use PFBC\Element\Select;
use PFBC\Element\Textarea;
use PFBC\Element\Textbox;
use PFBC\Element\Token;
use PFBC\Validation\BirthDate;
use PFBC\Validation\Name;
use PH7\Framework\Date\CDateTime;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Request\Http as HttpRequest;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Session\Session;
use PH7\Framework\Url\Header;
use PDO;

class EditForm
{
    private const COUPLE_PROFILE_DATA_FIELD = 'couple_profile_data';
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';
    private const PRIVATE_MEDIA_ACCESS_TABLE = 'private_media_access';

    public static function display()
    {
        $oHttpRequest = new HttpRequest;
        $iProfileId = self::getProfileId($oHttpRequest);

        if (isset($_POST['submit_user_edit_account'])) {
            if (\PFBC\Form::isValid($_POST['submit_user_edit_account'])) {
                new EditFormProcess($iProfileId);
            }

            if (self::isAdminLoggedAndUserIdExists($oHttpRequest)) {
                Header::redirect();
            } else {
                Header::redirect(Uri::get('user-dashboard', 'main', 'index'));
            }
        }

        $oUserModel = new UserModel;
        $oUser = $oUserModel->readProfile($iProfileId);
        $oFields = $oUserModel->getInfoFields($iProfileId);
        $aCoupleProfile = self::getCoupleProfileData($oFields);
        if (empty($aCoupleProfile['couple_name']) && !empty($oUser->username)) {
            $aCoupleProfile['couple_name'] = $oUser->username;
        }

        // Birth Date with the date format for the date picker
        $sBirthDate = (new CDateTime)->get($oUser->birthDate)->date('Y-m-d');

        $oForm = new \PFBC\Form('form_user_edit_account');
        $oForm->configure(['action' => '']);
        $oForm->addElement(new Hidden('submit_user_edit_account', 'form_user_edit_account'));
        $oForm->addElement(new Token('edit_account'));

        if (self::isAdminLoggedAndUserIdExists($oHttpRequest)) {
            $oForm->addElement(
                new HTMLExternal('<p class="center"><a class="bold btn btn-default btn-md" href="' . Uri::get(PH7_ADMIN_MOD, 'user', 'browse') . '">' . t('Back to Browse Users') . '</a></p>')
            );

            $oMemberships = (new AdminCoreModel)->getMemberships();
            $aGroupName = [];
            foreach ($oMemberships as $oGroup) {
                // Retrieve only the activated memberships
                if ($oGroup->enable == 1) {
                    $aGroupName[$oGroup->groupId] = $oGroup->name;
                }
            }
            $oForm->addElement(new Select(t('Membership Group:'), 'group_id', $aGroupName, ['id' => 'group_id', 'value' => $oUser->groupId, 'required' => 1]));
            unset($aGroupName);
        }
        unset($oHR);

        $oForm->addElement(new HTMLExternal('<div class="sc-profile-form-grid"><section class="sc-profile-section sc-profile-section--wide"><h2>Couple basics</h2><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textbox(t('Couple name:'), 'couple_name', ['id' => 'couple_name', 'value' => self::getVal($aCoupleProfile, 'couple_name')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section"><h2>About Her</h2><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textbox(t('Her name:'), 'her_name', ['id' => 'her_name', 'value' => self::getVal($aCoupleProfile, 'her_name')]));
        $oForm->addElement(new Number(t('Her age:'), 'her_age', ['id' => 'her_age', 'value' => self::getVal($aCoupleProfile, 'her_age'), 'min' => 18, 'max' => 120]));
        $oForm->addElement(new Textbox(t('Her ethnicity:'), 'her_ethnicity', ['id' => 'her_ethnicity', 'value' => self::getVal($aCoupleProfile, 'her_ethnicity')]));
        $oForm->addElement(new Textbox(t('Her languages spoken:'), 'her_languages', ['id' => 'her_languages', 'value' => self::getVal($aCoupleProfile, 'her_languages')]));
        $oForm->addElement(new Select(t('Her sexuality:'), 'her_sexuality', self::sexualityOptions(), ['id' => 'her_sexuality', 'value' => self::getVal($aCoupleProfile, 'her_sexuality')]));
        $oForm->addElement(new Select(t('Her experience level:'), 'her_experience_level', self::experienceOptions(), ['id' => 'her_experience_level', 'value' => self::getVal($aCoupleProfile, 'her_experience_level')]));
        $oForm->addElement(new Textarea(t('About her:'), 'about_her', ['id' => 'about_her', 'value' => self::getVal($aCoupleProfile, 'about_her')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section"><h2>About Him</h2><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textbox(t('His name:'), 'him_name', ['id' => 'him_name', 'value' => self::getVal($aCoupleProfile, 'him_name')]));
        $oForm->addElement(new Number(t('His age:'), 'him_age', ['id' => 'him_age', 'value' => self::getVal($aCoupleProfile, 'him_age'), 'min' => 18, 'max' => 120]));
        $oForm->addElement(new Textbox(t('His ethnicity:'), 'him_ethnicity', ['id' => 'him_ethnicity', 'value' => self::getVal($aCoupleProfile, 'him_ethnicity')]));
        $oForm->addElement(new Textbox(t('His languages spoken:'), 'him_languages', ['id' => 'him_languages', 'value' => self::getVal($aCoupleProfile, 'him_languages')]));
        $oForm->addElement(new Select(t('His sexuality:'), 'him_sexuality', self::sexualityOptions(), ['id' => 'him_sexuality', 'value' => self::getVal($aCoupleProfile, 'him_sexuality')]));
        $oForm->addElement(new Select(t('His experience level:'), 'him_experience_level', self::experienceOptions(), ['id' => 'him_experience_level', 'value' => self::getVal($aCoupleProfile, 'him_experience_level')]));
        $oForm->addElement(new Textarea(t('About him:'), 'about_him', ['id' => 'about_him', 'value' => self::getVal($aCoupleProfile, 'about_him')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>About Us</h2><p class="sc-profile-helper">Write a short description of you as a couple.</p><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textarea(t('About us:'), 'about_us', ['id' => 'about_us', 'value' => self::getVal($aCoupleProfile, 'about_us')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>What we are looking for</h2><div class="sc-profile-checks">'));
        $oForm->addElement(new Checkbox(t('What we are looking for:'), 'looking_for', self::lookingForOptions(), ['value' => self::getArrayVal($aCoupleProfile, 'looking_for')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Hosting and travel</h2><div class="sc-profile-checks">'));
        $oForm->addElement(new Checkbox(t('Hosting and travel:'), 'hosting_travel', self::hostingTravelOptions(), ['value' => self::getArrayVal($aCoupleProfile, 'hosting_travel')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Availability</h2><p class="sc-profile-helper">Let other couples know when you are usually free to meet or chat.</p><div class="sc-profile-checks">'));
        $oForm->addElement(new Checkbox(t('Availability:'), 'availability', self::availabilityOptions(), ['value' => self::getArrayVal($aCoupleProfile, 'availability')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Sexual interests</h2><div class="sc-profile-checks">'));
        $oForm->addElement(new Checkbox(t('Sexual interests:'), 'sexual_interests', self::sexualInterestsOptions(), ['value' => self::getArrayVal($aCoupleProfile, 'sexual_interests')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Fantasies</h2><p class="sc-profile-helper">Share only what you are comfortable sharing. You can leave this blank.</p><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textarea(t('Fantasies you might want to explore:'), 'fantasies', ['id' => 'fantasies', 'value' => self::getVal($aCoupleProfile, 'fantasies')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Boundaries</h2><p class="sc-profile-helper">Share anything you are not interested in, hard limits, or boundaries you want other couples to respect.</p><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textarea(t('Boundaries / not interested in:'), 'boundaries', ['id' => 'boundaries', 'value' => self::getVal($aCoupleProfile, 'boundaries')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Ideal match</h2><p class="sc-profile-helper">Describe the kind of couple, vibe, or situation that feels right for you.</p><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textarea(t('Ideal match:'), 'ideal_match', ['id' => 'ideal_match', 'value' => self::getVal($aCoupleProfile, 'ideal_match')]));
        $oForm->addElement(new HTMLExternal('</div></section>' . self::renderPrivateMediaAccessSection($iProfileId, $oUserModel)));
        if (self::isAdminLoggedAndUserIdExists($oHttpRequest)) {
            $oForm->addElement(new HTMLExternal('<section class="sc-profile-section sc-profile-section--wide sc-profile-section--core"><h2>Core account details</h2><div class="sc-profile-field-row">'));
            $oForm->addElement(new Textbox(t('First Name:'), 'first_name', ['id' => 'name_first', 'onblur' => 'CValid(this.value,this.id)', 'value' => $oUser->firstName, 'required' => 1, 'validation' => new Name]));
            $oForm->addElement(new HTMLExternal('<span class="input_error name_first"></span>'));

            $oForm->addElement(new Textbox(t('Last Name:'), 'last_name', ['id' => 'name_last', 'onblur' => 'CValid(this.value,this.id)', 'value' => $oUser->lastName, 'validation' => new Name]));
            $oForm->addElement(new HTMLExternal('<span class="input_error name_last"></span>'));

            $oForm->addElement(new Textbox(t('Nickname:'), 'username', ['id' => 'username', 'description' => t('For security reasons, you cannot change your nickname.'), 'disabled' => 'disabled', 'value' => $oUser->username]));

            $oForm->addElement(new Email(t('Email:'), 'mail', ['id' => 'mail', 'description' => t('For security reasons and to avoid spam, you cannot change your email address. If it has changed, you will need to <a href="%0%">delete</a> your account and create a new one.', Uri::get('user', 'setting', 'delete')), 'disabled' => 'disabled', 'value' => $oUser->email]));

            // For security reasons, only admins can change profile gender
            $oForm->addElement(
                new Radio(
                    t('Gender:'),
                    'sex',
                    [
                        GenderTypeUserCore::FEMALE => t('Woman'),
                        GenderTypeUserCore::MALE => t('Man'),
                        GenderTypeUserCore::COUPLE => t('Couple')
                    ],
                    [
                        'value' => $oUser->sex,
                        'required' => 1
                    ]
                )
            );

            $oForm->addElement(
                new Checkbox(
                    t('Looking for a:'),
                    'match_sex',
                    [
                        GenderTypeUserCore::MALE => t('Man'),
                        GenderTypeUserCore::FEMALE => t('Woman'),
                        GenderTypeUserCore::COUPLE => t('Couple')
                    ],
                    ['value' => Form::getVal($oUser->matchSex), 'required' => 1]
                )
            );

            // For security reasons, only admins can change the date of birth
            $oForm->addElement(
                new Date(
                    t('Date of birth:'),
                    'birth_date',
                    [
                        'id' => 'birth_date',
                        'onblur' => 'CValid(this.value, this.id)',
                        'value' => $sBirthDate,
                        'validation' => new BirthDate,
                        'required' => 1
                    ]
                )
            );
            $oForm->addElement(new HTMLExternal('<span class="input_error birth_date"></span>'));

            // Generate dynamic fields for admin profile editing only.
            foreach ($oFields as $sColumn => $sValue) {
                if (in_array($sColumn, ['country', 'city', self::COUPLE_PROFILE_DATA_FIELD], true)) {
                    continue;
                }
                $oForm = (new DynamicFieldCoreForm($oForm, $sColumn, $sValue))->generate();
            }
        }

        $oForm->addElement(new HTMLExternal(self::isAdminLoggedAndUserIdExists($oHttpRequest) ? '</div></section></div>' : '</div>'));
        $oForm->addElement(new Button(t('Save Couple Profile'), 'submit', ['icon' => 'check']));
        $oForm->addElement(new HTMLExternal('<script src="' . PH7_URL_STATIC . PH7_JS . 'validate.js"></script><script src="' . PH7_URL_STATIC . PH7_JS . 'geo/autocompleteCity.js"></script>'));
        $oForm->render();
    }

    /**
     * @param HttpRequest $oHttpRequest
     *
     * @return int
     */
    private static function getProfileId(HttpRequest $oHttpRequest)
    {
        if (self::isAdminLoggedAndUserIdExists($oHttpRequest)) {
            return $oHttpRequest->get('profile_id', 'int');
        }

        return (new Session)->get('member_id');
    }

    /**
     * @param HttpRequest $oHttpRequest
     *
     * @return bool
     */
    private static function isAdminLoggedAndUserIdExists(HttpRequest $oHttpRequest)
    {
        return AdminCore::auth() && !User::auth() &&
            $oHttpRequest->getExists('profile_id');
    }

    private static function renderPrivateMediaAccessSection($iProfileId, UserCoreModel $oUserModel)
    {
        $aRecipients = self::getPrivateMediaAccessRecipients((int)$iProfileId, $oUserModel);

        $sHtml = '<section class="sc-profile-section sc-profile-section--wide sc-private-access-section">' .
            '<h2>' . self::e(t('Private Media Access')) . '</h2>' .
            '<p class="sc-profile-helper">' . self::e(t('Choose which friends and verified couples can view your private photos and private videos.')) . '</p>';

        if (empty($aRecipients)) {
            return $sHtml . '<p class="sc-profile-helper">' . self::e(t('Friend and verified friend access controls will appear here after you connect with other couples.')) . '</p></section>';
        }

        $sHtml .= '<div class="sc-private-access-list">';

        foreach ($aRecipients as $aRecipient) {
            $iRecipientId = (int)$aRecipient['profileId'];
            $sName = self::e($aRecipient['displayName']);
            $sType = self::e($aRecipient['relationship']);
            $bPhotoAccess = self::hasPrivateMediaAccess((int)$iProfileId, $iRecipientId, 'photo');
            $bVideoAccess = self::hasPrivateMediaAccess((int)$iProfileId, $iRecipientId, 'video');

            $sHtml .= '<div class="sc-private-access-card">' .
                '<input type="hidden" name="private_media_access_ids[]" value="' . $iRecipientId . '" />' .
                '<span class="sc-private-access-name">' . $sName . ' <small>(' . $sType . ')</small></span>' .
                '<div class="sc-private-access-controls">' .
                '<!-- Private photo access toggle for friend/verified profile ID ' . $iRecipientId . '. Field: private_media_access[' . $iRecipientId . '][photo]. -->' .
                '<label class="sc-private-access-toggle" for="private_media_access_' . $iRecipientId . '_photo">' .
                '<span>' . self::e(t('Allow Private Media Access')) . ' - ' . self::e(t('Photos')) . '</span>' .
                '<input id="private_media_access_' . $iRecipientId . '_photo" type="checkbox" name="private_media_access[' . $iRecipientId . '][photo]" value="1"' . ($bPhotoAccess ? ' checked="checked"' : '') . ' />' .
                '</label>' .
                '<!-- Private video access toggle for friend/verified profile ID ' . $iRecipientId . '. Field: private_media_access[' . $iRecipientId . '][video]. -->' .
                '<label class="sc-private-access-toggle" for="private_media_access_' . $iRecipientId . '_video">' .
                '<span>' . self::e(t('Allow Private Media Access')) . ' - ' . self::e(t('Videos')) . '</span>' .
                '<input id="private_media_access_' . $iRecipientId . '_video" type="checkbox" name="private_media_access[' . $iRecipientId . '][video]" value="1"' . ($bVideoAccess ? ' checked="checked"' : '') . ' />' .
                '</label>' .
                '</div></div>';
        }

        return $sHtml . '</div></section>';
    }

    private static function getPrivateMediaAccessRecipients($iProfileId, UserCoreModel $oUserModel)
    {
        $aRecipients = [];

        foreach (self::getApprovedFriendIds((int)$iProfileId) as $iFriendId) {
            self::addAccessRecipient($aRecipients, $iFriendId, t('Friend'), $oUserModel);
        }

        foreach (self::getVerifiedCoupleIds((int)$iProfileId) as $iVerifiedId) {
            self::addAccessRecipient($aRecipients, $iVerifiedId, t('Verified Friend'), $oUserModel);
        }

        return array_values($aRecipients);
    }

    private static function addAccessRecipient(array &$aRecipients, $iRecipientId, $sRelationship, UserCoreModel $oUserModel)
    {
        $iRecipientId = (int)$iRecipientId;
        if ($iRecipientId < 1 || isset($aRecipients[$iRecipientId])) {
            return;
        }

        $oRecipient = $oUserModel->readProfile($iRecipientId);
        if (!$oRecipient || (int)$oRecipient->ban === UserCore::BAN_STATUS) {
            return;
        }

        $oFields = $oUserModel->getInfoFields($iRecipientId);
        $aCoupleProfile = self::getCoupleProfileData($oFields);

        $aRecipients[$iRecipientId] = [
            'profileId' => $iRecipientId,
            'displayName' => !empty($aCoupleProfile['couple_name']) ? $aCoupleProfile['couple_name'] : $oRecipient->username,
            'relationship' => $sRelationship
        ];
    }

    private static function getApprovedFriendIds($iProfileId)
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT CASE WHEN profileId = :profileId THEN friendId ELSE profileId END AS friendId FROM' .
                Db::prefix(DbTableName::MEMBER_FRIEND) .
                'WHERE pending = :approved AND (profileId = :profileId OR friendId = :profileId) ORDER BY requestDate DESC'
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

    private static function getVerifiedCoupleIds($iProfileId)
    {
        try {
            $rStmt = Db::getInstance()->prepare(
                'SELECT CASE WHEN verifier_profile_id = :profileId THEN verified_profile_id ELSE verifier_profile_id END AS profileId FROM' .
                Db::prefix(self::COUPLE_VERIFICATION_TABLE) .
                'WHERE status = :status AND (verifier_profile_id = :profileId OR verified_profile_id = :profileId) ORDER BY updated_at DESC'
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

    private static function hasPrivateMediaAccess($iProfileId, $iRecipientId, $sMediaType)
    {
        $aColumns = self::getPrivateMediaAccessColumns($sMediaType);
        if (empty($aColumns['owner']) || empty($aColumns['viewer'])) {
            return false;
        }

        try {
            $sSql = 'SELECT COUNT(*) FROM' . Db::prefix(self::PRIVATE_MEDIA_ACCESS_TABLE) .
                'WHERE ' . $aColumns['owner'] . ' = :profileId AND ' . $aColumns['viewer'] . ' = :recipientId';
            if (!empty($aColumns['mediaType'])) {
                $sSql .= ' AND ' . $aColumns['mediaType'] . ' = :mediaType';
            }
            $sSql .= ' LIMIT 1';

            $rStmt = Db::getInstance()->prepare($sSql);
            $rStmt->bindValue(':profileId', (int)$iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':recipientId', (int)$iRecipientId, PDO::PARAM_INT);
            if (!empty($aColumns['mediaType'])) {
                $rStmt->bindValue(':mediaType', $sMediaType, PDO::PARAM_STR);
            }
            $rStmt->execute();
            $bHasAccess = (int)$rStmt->fetchColumn() > 0;
            Db::free($rStmt);

            return $bHasAccess;
        } catch (\Exception $oException) {
            return false;
        }
    }

    private static function getPrivateMediaAccessColumns($sMediaType)
    {
        $aTableColumns = self::getTableColumns(self::PRIVATE_MEDIA_ACCESS_TABLE);

        return [
            'owner' => self::getFirstExistingColumn($aTableColumns, ['owner_profile_id', 'profile_id', 'profileId']),
            'viewer' => self::getFirstExistingColumn($aTableColumns, ['viewer_profile_id', 'viewer_id', 'viewerId', 'member_id', 'memberId', 'friend_id', 'friendId']),
            'mediaId' => self::getFirstExistingColumn(
                $aTableColumns,
                $sMediaType === 'photo' ? ['media_id', 'mediaId', 'picture_id', 'pictureId'] : ['media_id', 'mediaId', 'video_id', 'videoId']
            ),
            'mediaType' => self::getFirstExistingColumn($aTableColumns, ['media_type', 'mediaType', 'type'])
        ];
    }

    private static function getTableColumns($sTableName)
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

    private static function getFirstExistingColumn(array $aColumns, array $aCandidates)
    {
        foreach ($aCandidates as $sCandidate) {
            if (in_array($sCandidate, $aColumns, true)) {
                return $sCandidate;
            }
        }

        return '';
    }

    private static function e($sValue)
    {
        return htmlspecialchars((string)$sValue, ENT_QUOTES, 'UTF-8');
    }

    private static function getCoupleProfileData($oFields)
    {
        $aData = self::defaultCoupleProfileData();
        $sJson = isset($oFields->{self::COUPLE_PROFILE_DATA_FIELD}) ? $oFields->{self::COUPLE_PROFILE_DATA_FIELD} : '';

        if (!empty($sJson)) {
            $aDecoded = json_decode($sJson, true);
            if (is_array($aDecoded)) {
                $aData = array_merge($aData, array_intersect_key($aDecoded, $aData));
            }
        }

        if (empty($aData['about_us']) && !empty($oFields->description)) {
            $aData['about_us'] = $oFields->description;
        }

        return $aData;
    }

    private static function defaultCoupleProfileData()
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

    private static function getVal(array $aData, $sKey)
    {
        return isset($aData[$sKey]) && !is_array($aData[$sKey]) ? $aData[$sKey] : '';
    }

    private static function getArrayVal(array $aData, $sKey)
    {
        return isset($aData[$sKey]) && is_array($aData[$sKey]) ? $aData[$sKey] : [];
    }

    private static function sexualityOptions()
    {
        return [
            '' => t('Please select'),
            'Straight' => t('Straight'),
            'Bi-curious' => t('Bi-curious'),
            'Bisexual' => t('Bisexual'),
            'Pansexual' => t('Pansexual'),
            'Prefer not to say' => t('Prefer not to say')
        ];
    }

    private static function experienceOptions()
    {
        return [
            '' => t('Please select'),
            'New / Curious' => t('New / Curious'),
            'Exploring' => t('Exploring'),
            'Some experience' => t('Some experience'),
            'Experienced' => t('Experienced'),
            'Very experienced' => t('Very experienced'),
            'Prefer not to say' => t('Prefer not to say')
        ];
    }

    private static function lookingForOptions()
    {
        return [
            'Looking for friendship' => t('Looking for friendship'),
            'Looking for dating' => t('Looking for dating'),
            'Looking for intimate playtime' => t('Looking for intimate playtime'),
            'Looking for parties/events' => t('Looking for parties/events'),
            'Looking for social meetups' => t('Looking for social meetups'),
            'Looking for ongoing connections' => t('Looking for ongoing connections'),
            'Looking for occasional meetups' => t('Looking for occasional meetups')
        ];
    }

    private static function hostingTravelOptions()
    {
        return [
            'Can host' => t('Can host'),
            'Cannot host' => t('Cannot host'),
            'Open to travel' => t('Open to travel'),
            'Prefer local couples' => t('Prefer local couples'),
            'Open to events/parties' => t('Open to events/parties'),
            'Hotel meetups okay' => t('Hotel meetups okay'),
            'Prefer public meet first' => t('Prefer public meet first')
        ];
    }

    private static function availabilityOptions()
    {
        return [
            'Weekdays' => t('Weekdays'),
            'Weekends' => t('Weekends'),
            'Daytime' => t('Daytime'),
            'Evenings' => t('Evenings')
        ];
    }

    private static function sexualInterestsOptions()
    {
        return [
            'Watching' => t('Watching'),
            'Soft swap' => t('Soft swap'),
            'Oral' => t('Oral'),
            'Full swap' => t('Full swap'),
            'Same-room play' => t('Same-room play'),
            'Separate-room play' => t('Separate-room play'),
            'Social only at first' => t('Social only at first'),
            'Not sure yet' => t('Not sure yet'),
            'Prefer to discuss privately' => t('Prefer to discuss privately')
        ];
    }
}
