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
use PH7\Framework\Mvc\Request\Http as HttpRequest;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Session\Session;
use PH7\Framework\Url\Header;

class EditForm
{
    private const COUPLE_PROFILE_DATA_FIELD = 'couple_profile_data';

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
            $oForm->addElement(new Select(t('Membership Group:'), 'group_id', $aGroupName, ['value' => $oUser->groupId, 'required' => 1]));
            unset($aGroupName);
        }
        unset($oHR);

        $oForm->addElement(new HTMLExternal('<div class="sc-profile-form-grid"><section class="sc-profile-section sc-profile-section--wide"><h2>Couple basics</h2><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textbox(t('Couple name:'), 'couple_name', ['value' => self::getVal($aCoupleProfile, 'couple_name')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section"><h2>About Her</h2><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textbox(t('Her name:'), 'her_name', ['value' => self::getVal($aCoupleProfile, 'her_name')]));
        $oForm->addElement(new Number(t('Her age:'), 'her_age', ['value' => self::getVal($aCoupleProfile, 'her_age'), 'min' => 18, 'max' => 120]));
        $oForm->addElement(new Textbox(t('Her ethnicity:'), 'her_ethnicity', ['value' => self::getVal($aCoupleProfile, 'her_ethnicity')]));
        $oForm->addElement(new Textbox(t('Her languages spoken:'), 'her_languages', ['value' => self::getVal($aCoupleProfile, 'her_languages')]));
        $oForm->addElement(new Select(t('Her sexuality:'), 'her_sexuality', self::sexualityOptions(), ['value' => self::getVal($aCoupleProfile, 'her_sexuality')]));
        $oForm->addElement(new Select(t('Her experience level:'), 'her_experience_level', self::experienceOptions(), ['value' => self::getVal($aCoupleProfile, 'her_experience_level')]));
        $oForm->addElement(new Textarea(t('About her:'), 'about_her', ['value' => self::getVal($aCoupleProfile, 'about_her')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section"><h2>About Him</h2><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textbox(t('His name:'), 'him_name', ['value' => self::getVal($aCoupleProfile, 'him_name')]));
        $oForm->addElement(new Number(t('His age:'), 'him_age', ['value' => self::getVal($aCoupleProfile, 'him_age'), 'min' => 18, 'max' => 120]));
        $oForm->addElement(new Textbox(t('His ethnicity:'), 'him_ethnicity', ['value' => self::getVal($aCoupleProfile, 'him_ethnicity')]));
        $oForm->addElement(new Textbox(t('His languages spoken:'), 'him_languages', ['value' => self::getVal($aCoupleProfile, 'him_languages')]));
        $oForm->addElement(new Select(t('His sexuality:'), 'him_sexuality', self::sexualityOptions(), ['value' => self::getVal($aCoupleProfile, 'him_sexuality')]));
        $oForm->addElement(new Select(t('His experience level:'), 'him_experience_level', self::experienceOptions(), ['value' => self::getVal($aCoupleProfile, 'him_experience_level')]));
        $oForm->addElement(new Textarea(t('About him:'), 'about_him', ['value' => self::getVal($aCoupleProfile, 'about_him')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>About Us</h2><p class="sc-profile-helper">Write a short description of you as a couple.</p><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textarea(t('About us:'), 'about_us', ['value' => self::getVal($aCoupleProfile, 'about_us')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>What we are looking for</h2><div class="sc-profile-checks">'));
        $oForm->addElement(new Checkbox(t('What we are looking for:'), 'looking_for', self::lookingForOptions(), ['value' => self::getArrayVal($aCoupleProfile, 'looking_for')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Hosting and travel</h2><div class="sc-profile-checks">'));
        $oForm->addElement(new Checkbox(t('Hosting and travel:'), 'hosting_travel', self::hostingTravelOptions(), ['value' => self::getArrayVal($aCoupleProfile, 'hosting_travel')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Availability</h2><p class="sc-profile-helper">Let other couples know when you are usually free to meet or chat.</p><div class="sc-profile-checks">'));
        $oForm->addElement(new Checkbox(t('Availability:'), 'availability', self::availabilityOptions(), ['value' => self::getArrayVal($aCoupleProfile, 'availability')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Sexual interests</h2><div class="sc-profile-checks">'));
        $oForm->addElement(new Checkbox(t('Sexual interests:'), 'sexual_interests', self::sexualInterestsOptions(), ['value' => self::getArrayVal($aCoupleProfile, 'sexual_interests')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Fantasies</h2><p class="sc-profile-helper">Share only what you are comfortable sharing. You can leave this blank.</p><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textarea(t('Fantasies you might want to explore:'), 'fantasies', ['value' => self::getVal($aCoupleProfile, 'fantasies')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Boundaries</h2><p class="sc-profile-helper">Share anything you are not interested in, hard limits, or boundaries you want other couples to respect.</p><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textarea(t('Boundaries / not interested in:'), 'boundaries', ['value' => self::getVal($aCoupleProfile, 'boundaries')]));
        $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide"><h2>Ideal match</h2><p class="sc-profile-helper">Describe the kind of couple, vibe, or situation that feels right for you.</p><div class="sc-profile-field-row">'));
        $oForm->addElement(new Textarea(t('Ideal match:'), 'ideal_match', ['value' => self::getVal($aCoupleProfile, 'ideal_match')]));
        if (self::isAdminLoggedAndUserIdExists($oHttpRequest)) {
            $oForm->addElement(new HTMLExternal('</div></section><section class="sc-profile-section sc-profile-section--wide sc-profile-section--core"><h2>Core account details</h2><div class="sc-profile-field-row">'));
            $oForm->addElement(new Textbox(t('First Name:'), 'first_name', ['id' => 'name_first', 'onblur' => 'CValid(this.value,this.id)', 'value' => $oUser->firstName, 'required' => 1, 'validation' => new Name]));
            $oForm->addElement(new HTMLExternal('<span class="input_error name_first"></span>'));

            $oForm->addElement(new Textbox(t('Last Name:'), 'last_name', ['id' => 'name_last', 'onblur' => 'CValid(this.value,this.id)', 'value' => $oUser->lastName, 'validation' => new Name]));
            $oForm->addElement(new HTMLExternal('<span class="input_error name_last"></span>'));

            $oForm->addElement(new Textbox(t('Nickname:'), 'username', ['description' => t('For security reasons, you cannot change your nickname.'), 'disabled' => 'disabled', 'value' => $oUser->username]));

            $oForm->addElement(new Email(t('Email:'), 'mail', ['description' => t('For security reasons and to avoid spam, you cannot change your email address. If it has changed, you will need to <a href="%0%">delete</a> your account and create a new one.', Uri::get('user', 'setting', 'delete')), 'disabled' => 'disabled', 'value' => $oUser->email]));

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

        $oForm->addElement(new HTMLExternal('</div></section></div>'));
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
