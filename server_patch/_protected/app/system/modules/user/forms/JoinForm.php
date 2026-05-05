<?php
/**
 * @author         Pierre-Henry Soria <hello@ph7builder.com>
 * @copyright      (c) 2012-2021, Pierre-Henry Soria. All Rights Reserved.
 * @license        MIT License; See LICENSE.md and COPYRIGHT.md in the root directory.
 * @package        PH7 / App / System / Module / User / Form
 */

namespace PH7;

use PFBC\Element\Button;
use PFBC\Element\CCaptcha;
use PFBC\Element\Checkbox;
use PFBC\Element\Date;
use PFBC\Element\Email;
use PFBC\Element\File;
use PFBC\Element\Hidden;
use PFBC\Element\HTMLExternal;
use PFBC\Element\Range;
use PFBC\Element\Textarea;
use PFBC\Element\Textbox;
use PFBC\Element\Token;
use PFBC\Validation\BirthDate;
use PFBC\Validation\CEmail;
use PFBC\Validation\Name;
use PFBC\Validation\Password;
use PFBC\Validation\Str;
use PFBC\Validation\Username;
use PH7\Framework\Geo\Ip\Geo;
use PH7\Framework\Mvc\Model\DbConfig;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Session\Session;
use PH7\Framework\Url\Header;

class JoinForm
{
    private static function predictGenderFromFirstName()
    {
        $sFirstName = (new Session)->get('first_name');

        if (empty($sFirstName)) {
            return GenderTypeUserCore::MALE;
        }

        $sNameInLowerCase = strtolower(trim($sFirstName));

        $aCommonFemaleNames = [
            'mary', 'maria', 'sarah', 'lisa', 'jennifer', 'linda', 'patricia',
            'barbara', 'susan', 'jessica', 'nancy', 'margaret', 'ashley',
            'emily', 'elizabeth', 'michelle', 'amanda', 'melissa', 'deborah',
            'sophie', 'emma', 'olivia', 'ava', 'isabella', 'mia', 'charlotte',
            'amelia', 'harper', 'sophia', 'evelyn', 'abigail', 'ella', 'grace',
            'anna', 'marie', 'claire', 'julie', 'kate', 'katherine', 'laura',
            'rebecca', 'rachel', 'hannah', 'alice', 'victoria', 'lucy', 'lily'
        ];

        $aCommonMaleNames = [
            'james', 'john', 'robert', 'michael', 'william', 'david', 'richard',
            'joseph', 'thomas', 'charles', 'christopher', 'daniel', 'matthew',
            'anthony', 'mark', 'donald', 'steven', 'paul', 'andrew', 'joshua',
            'kevin', 'brian', 'george', 'edward', 'ronald', 'timothy', 'jason',
            'jeffrey', 'ryan', 'jacob', 'nicholas', 'eric', 'stephen', 'jonathan'
        ];

        if (in_array($sNameInLowerCase, $aCommonFemaleNames, true)) {
            return GenderTypeUserCore::FEMALE;
        }

        if (in_array($sNameInLowerCase, $aCommonMaleNames, true)) {
            return GenderTypeUserCore::MALE;
        }

        $aFemaleEndings = ['ia' => 2, 'ina' => 3, 'elle' => 4, 'ette' => 4, 'ine' => 3, 'anna' => 4, 'lyn' => 3];
        foreach ($aFemaleEndings as $sEnding => $iLength) {
            if (substr($sNameInLowerCase, -$iLength) === $sEnding && strlen($sNameInLowerCase) > $iLength) {
                return GenderTypeUserCore::FEMALE;
            }
        }

        return GenderTypeUserCore::MALE;
    }

    private static function getOppositeGenderPreferences($sUserGender = null)
    {
        if ($sUserGender === null) {
            $sUserGender = self::predictGenderFromFirstName();
        }

        if ($sUserGender === GenderTypeUserCore::FEMALE) {
            return [GenderTypeUserCore::MALE];
        }

        if ($sUserGender === GenderTypeUserCore::MALE) {
            return [GenderTypeUserCore::FEMALE];
        }

        return [GenderTypeUserCore::MALE, GenderTypeUserCore::FEMALE];
    }

    public static function step1()
    {
        if ((new Session)->exists('mail_step1')) {
            Header::redirect(Uri::get('user', 'signup', 'step2'));
        }

        if (isset($_POST['submit_join_user'])) {
            if (\PFBC\Form::isValid($_POST['submit_join_user'])) {
                (new JoinFormProcess)->step1();
            }

            Header::redirect();
        }

        $oForm = new \PFBC\Form('form_join_user');
        $oForm->configure(['action' => Uri::get('user', 'signup', 'step1')]);
        $oForm->addElement(new Hidden('submit_join_user', 'form_join_user'));
        $oForm->addElement(new Token('join'));

        $oForm->addElement(new Textbox(t('Your First Name'), 'first_name', ['placeholder' => t('First Name'), 'id' => 'name_first', 'onblur' => 'CValid(this.value,this.id)', 'required' => 1, 'validation' => new Name]));
        $oForm->addElement(new HTMLExternal('<span class="input_error name_first"></span>'));

        $oForm->addElement(new \PFBC\Element\Username(t('Your Nickname'), 'username', ['placeholder' => t('Nickname'), 'description' => PH7_URL_ROOT . UserCore::PROFILE_PAGE_PREFIX . '<strong><span class="your-username">' . t('your-nickname') . '</span><span class="username"></span></strong>', 'id' => 'username', 'required' => 1, 'validation' => new Username]));

        $oForm->addElement(new Email(t('Your Email'), 'mail', ['placeholder' => t('Email'), 'id' => 'email', 'onblur' => 'CValid(this.value, this.id,\'guest\')', 'required' => 1, 'validation' => new CEmail(CEmail::GUEST_MODE)]));
        $oForm->addElement(new HTMLExternal('<span class="input_error email"></span>'));

        $oForm->addElement(new \PFBC\Element\Password(t('Your Password'), 'password', ['placeholder' => t('Password'), 'id' => 'password', 'onkeyup' => 'checkPassword(this.value)', 'onblur' => 'CValid(this.value, this.id)', 'required' => 1, 'validation' => new Password]));
        $oForm->addElement(new HTMLExternal('<span class="input_error password"></span>'));

        if (DbConfig::getSetting('isCaptchaUserSignup')) {
            $oForm->addElement(new CCaptcha(t('Captcha'), 'captcha', ['placeholder' => t('Captcha'), 'id' => 'ccaptcha', 'onkeyup' => 'CValid(this.value, this.id)', 'description' => t('Enter the below code:')]));
            $oForm->addElement(new HTMLExternal('<span class="input_error ccaptcha"></span>'));
        }

        $oForm->addElement(new Checkbox(t('Terms of Service'), 'terms', [1 => '<em>' . t('I have read and agree to the %0%.', '<a href="' . Uri::get('page', 'main', 'terms') . '" rel="nofollow" target="_blank">' . t('Terms of Service') . '</a>') . '</em>'], ['id' => 'terms', 'onblur' => 'CValid(this.checked, this.id)', 'required' => 1]));
        $oForm->addElement(new HTMLExternal('<span class="input_error terms-0"></span>'));
        $oForm->addElement(new Button(t('Join for free!'), 'submit', ['icon' => 'heart']));

        // JavaScript Files
        $oForm->addElement(new HTMLExternal('<script src="' . PH7_URL_STATIC . PH7_JS . 'signup.js"></script><script src="' . PH7_URL_STATIC . PH7_JS . 'validate.js"></script>'));

        $oForm->render();
    }

    public static function step2()
    {
        $oSession = new Session;
        if (!$oSession->exists('mail_step1')) {
            Header::redirect(Uri::get('user', 'signup', 'step1'));
        } elseif ($oSession->exists('mail_step2')) {
            Header::redirect(Uri::get('user', 'signup', 'step3'));
        }
        unset($oSession);

        if (isset($_POST['submit_join_user2'])) {
            if (\PFBC\Form::isValid($_POST['submit_join_user2'])) {
                (new JoinFormProcess)->step2();
            }

            Header::redirect();
        }

        $oForm = new \PFBC\Form('form_join_user2');
        $oForm->configure(['action' => '']);
        $oForm->addElement(new Hidden('submit_join_user2', 'form_join_user2'));
        $oForm->addElement(new Token('join2'));
        $oForm->addElement(
            new HTMLExternal(
                '<style>
                #form_join_user2 {
                    background: linear-gradient(180deg, #2a0f19 0%, #14070d 100%);
                    border: 1px solid rgba(255, 119, 149, 0.22);
                    border-radius: 24px;
                    box-shadow: 0 24px 60px rgba(0, 0, 0, 0.35);
                    color: #f8dbe3;
                    margin-top: 22px;
                    overflow: hidden;
                    padding: 0;
                }
                #form_join_user2 .pfbc-fieldset {
                    background: transparent;
                    border: 0;
                    margin: 0;
                    padding: 0;
                }
                #form_join_user2 .legend,
                #form_join_user2 legend {
                    display: none;
                }
                #form_join_user2 .signup-step2-shell {
                    padding: 30px 28px 32px;
                }
                #form_join_user2 .signup-step2-hero {
                    background: radial-gradient(circle at top left, rgba(255, 110, 140, 0.26), transparent 55%), linear-gradient(135deg, rgba(110, 18, 40, 0.92), rgba(38, 7, 16, 0.96));
                    border: 1px solid rgba(255, 145, 171, 0.18);
                    border-radius: 20px;
                    margin-bottom: 20px;
                    padding: 22px 22px 18px;
                }
                #form_join_user2 .signup-step2-eyebrow {
                    color: #ff9ab5;
                    display: block;
                    font-size: 12px;
                    font-weight: 700;
                    letter-spacing: 0.16em;
                    margin-bottom: 10px;
                    text-transform: uppercase;
                }
                #form_join_user2 .signup-step2-title {
                    color: #fff4f7;
                    font-size: 31px;
                    font-weight: 700;
                    line-height: 1.15;
                    margin: 0 0 10px;
                }
                #form_join_user2 .signup-step2-copy {
                    color: rgba(255, 233, 239, 0.82);
                    font-size: 15px;
                    line-height: 1.6;
                    margin: 0;
                }
                #form_join_user2 .signup-step2-grid {
                    display: grid;
                    gap: 16px;
                    grid-template-columns: repeat(2, minmax(0, 1fr));
                    margin-bottom: 18px;
                }
                #form_join_user2 .signup-step2-panel {
                    background: linear-gradient(180deg, rgba(255, 255, 255, 0.05), rgba(255, 255, 255, 0.02));
                    border: 1px solid rgba(255, 145, 171, 0.15);
                    border-radius: 18px;
                    min-height: 138px;
                    padding: 18px 18px 16px;
                }
                #form_join_user2 .signup-step2-panel h3 {
                    color: #ffd4df;
                    font-size: 17px;
                    margin: 0 0 8px;
                }
                #form_join_user2 .signup-step2-panel p {
                    color: rgba(255, 228, 235, 0.7);
                    font-size: 14px;
                    line-height: 1.6;
                    margin: 0;
                }
                #form_join_user2 .signup-step2-location {
                    background: rgba(12, 2, 7, 0.38);
                    border: 1px solid rgba(255, 145, 171, 0.15);
                    border-radius: 18px;
                    margin-bottom: 18px;
                    padding: 20px 18px 6px;
                }
                #form_join_user2 .signup-step2-section-title {
                    color: #fff3f7;
                    font-size: 21px;
                    margin: 0 0 6px;
                }
                #form_join_user2 .signup-step2-section-copy {
                    color: rgba(255, 228, 235, 0.68);
                    font-size: 14px;
                    line-height: 1.55;
                    margin: 0 0 14px;
                }
                #form_join_user2 label {
                    color: #ffd9e3;
                    font-weight: 600;
                }
                #form_join_user2 input[type="text"],
                #form_join_user2 input[type="date"],
                #form_join_user2 select {
                    background: rgba(255, 255, 255, 0.08);
                    border: 1px solid rgba(255, 155, 177, 0.24);
                    border-radius: 12px;
                    color: #fff4f7;
                }
                #form_join_user2 input[type="text"]:focus,
                #form_join_user2 input[type="date"]:focus,
                #form_join_user2 select:focus {
                    border-color: rgba(255, 108, 145, 0.8);
                    box-shadow: 0 0 0 3px rgba(255, 108, 145, 0.16);
                }
                #form_join_user2 .help-block,
                #form_join_user2 .description,
                #form_join_user2 small {
                    color: rgba(255, 228, 235, 0.62);
                }
                #form_join_user2 .pfbc-buttons {
                    margin-top: 8px;
                    text-align: right;
                }
                #form_join_user2 button,
                #form_join_user2 input[type="submit"] {
                    background: linear-gradient(135deg, #ff5a80, #d61d4f);
                    border: 0;
                    border-radius: 999px;
                    box-shadow: 0 14px 30px rgba(214, 29, 79, 0.34);
                    color: #fff;
                    font-size: 15px;
                    font-weight: 700;
                    padding-left: 22px;
                    padding-right: 22px;
                }
                #form_join_user2 button:hover,
                #form_join_user2 input[type="submit"]:hover {
                    background: linear-gradient(135deg, #ff7093, #e02e61);
                }
                .progress {
                    background: rgba(15, 4, 9, 0.72);
                    border: 1px solid rgba(255, 145, 171, 0.18);
                    border-radius: 999px;
                    box-shadow: none;
                    margin-bottom: 18px;
                    overflow: hidden;
                }
                .progress .progress-bar {
                    background: linear-gradient(90deg, #ff6b91 0%, #ef3f6d 45%, #c91546 100%);
                    color: #fff6f9;
                    text-shadow: none;
                }
                @media (max-width: 767px) {
                    #form_join_user2 .signup-step2-shell {
                        padding: 20px 16px 24px;
                    }
                    #form_join_user2 .signup-step2-title {
                        font-size: 26px;
                    }
                    #form_join_user2 .signup-step2-grid {
                        grid-template-columns: 1fr;
                    }
                }
                </style>
                <div class="signup-step2-shell">
                    <div class="signup-step2-hero">
                        <span class="signup-step2-eyebrow">' . t('Step 2 of 3') . '</span>
                        <h2 class="signup-step2-title">' . t('Complete your couple profile') . '</h2>
                        <p class="signup-step2-copy">' . t('Set up the essentials for your shared profile before you continue to the next step.') . '</p>
                    </div>
                    <div class="signup-step2-grid">
                        <section class="signup-step2-panel">
                            <h3>' . t('What are you both interested in?') . '</h3>
                            <p>' . t('Shared preferences will be added in the next setup step.') . '</p>
                        </section>
                        <section class="signup-step2-panel">
                            <h3>' . t('What are you looking for?') . '</h3>
                            <p>' . t('Your couple connection preferences will be added in the next setup step.') . '</p>
                        </section>
                        <section class="signup-step2-panel">
                            <h3>' . t('Couple details') . '</h3>
                            <p>' . t('Start with the basics for your shared account.') . '</p>
                        </section>
                        <section class="signup-step2-panel">
                            <h3>' . t('Her') . '</h3>
                            <p>' . t('Partner details will be added in the next setup step.') . '</p>
                        </section>
                        <section class="signup-step2-panel">
                            <h3>' . t('Him') . '</h3>
                            <p>' . t('Partner details will be added in the next setup step.') . '</p>
                        </section>
                    </div>'
            )
        );
        $oForm->addElement(new Hidden('sex', GenderTypeUserCore::COUPLE));
        $oForm->addElement(new Hidden('match_sex[]', GenderTypeUserCore::COUPLE));

        self::generateBirthDateField($oForm);

        $oForm->addElement(
            new HTMLExternal(
                '<section class="signup-step2-location">
                    <h3 class="signup-step2-section-title">' . t('Where are you based?') . '</h3>
                    <p class="signup-step2-section-copy">' . t('Tell couples where you are usually based so your profile starts in the right place.') . '</p>'
            )
        );
        $oForm->addElement(
            new \PFBC\Element\Select(
                t('Country'),
                'country',
                Form::getCountryValues(),
                ['id' => 'str_country', 'value' => Geo::getCountryCode(), 'required' => 1]
            )
        );
        $oForm->addElement(
            new Textbox(
                t('City'),
                'city',
                [
                    'id' => 'str_city',
                    'value' => Geo::getCity(),
                    'onblur' => 'CValid(this.value,this.id,2,150)',
                    'description' => t('Select the city where you are usually based.'),
                    'validation' => new Str(2, 150),
                    'required' => 1
                ]
            )
        );
        $oForm->addElement(new HTMLExternal('<span class="input_error str_city"></span>'));

        $oForm->addElement(
            new Textbox(
                t('Postal Code'),
                'zip_code',
                [
                    'id' => 'str_zip_code',
                    'value' => Geo::getZipCode(),
                    'onblur' => 'CValid(this.value,this.id,2,15)',
                    'validation' => new Str(2, 15)
                ]
            )
        );
        $oForm->addElement(new HTMLExternal('<span class="input_error str_zip_code"></span>'));
        $oForm->addElement(new HTMLExternal('</section></div>'));

        $oForm->addElement(new Button(t('Next'), 'submit', ['icon' => 'seek-next']));
        $oForm->addElement(
            new HTMLExternal(
                '<script src="' . PH7_URL_STATIC . PH7_JS . 'validate.js"></script><script src="' . PH7_URL_STATIC . PH7_JS . 'geo/autocompleteCity.js"></script>'
            )
        );
        $oForm->render();
    }

    public static function step3()
    {
        $oSession = new Session;
        if (!$oSession->exists('mail_step2')) {
            Header::redirect(Uri::get('user', 'signup', 'step2'));
        } elseif ($oSession->exists('mail_step3')) {
            Header::redirect(Uri::get('user', 'signup', 'step4'));
        }
        unset($oSession);

        if (isset($_POST['submit_join_user3'])) {
            if (\PFBC\Form::isValid($_POST['submit_join_user3'])) {
                (new JoinFormProcess)->step3();
            }

            Header::redirect();
        }

        $oForm = new \PFBC\Form('form_join_user3');
        $oForm->configure(['action' => '']);
        $oForm->addElement(new Hidden('submit_join_user3', 'form_join_user3'));
        $oForm->addElement(new Token('join3'));

        $oForm->addElement(
            new Textarea(
                t('About Me'),
                'description',
                [
                    'id' => 'str_description',
                    'description' => t(
                        'Describe yourself in a few words. Your description should be at least 20 characters long.'
                    ),
                    'onblur' => 'CValid(this.value,this.id,20,4000)',
                    'validation' => new Str(20, 4000),
                    'required' => 1
                ]
            )
        );
        $oForm->addElement(new HTMLExternal('<span class="input_error str_description"></span>'));

        $oForm->addElement(new Button(t('Next'), 'submit', ['icon' => 'seek-next']));
        $oForm->addElement(new HTMLExternal('<script src="' . PH7_URL_STATIC . PH7_JS . 'validate.js"></script>'));
        $oForm->render();
    }

    public static function step4()
    {
        $oSession = new Session;
        if (!$oSession->exists('mail_step3')) {
            Header::redirect(Uri::get('user', 'signup', 'step3'));
        } elseif ($oSession->exists('mail_step4')) {
            Header::redirect(Uri::get('user', 'signup', 'done'));
        }
        unset($oSession);

        if (isset($_POST['submit_join_user4'])) {
            if (\PFBC\Form::isValid($_POST['submit_join_user4'])) {
                (new JoinFormProcess)->step4();
            }

            Header::redirect();
        }

        $aAvatarFieldOption = ['accept' => 'image/*'];
        $bIsAvatarRequired = DbConfig::getSetting('requireRegistrationAvatar');
        if ($bIsAvatarRequired) {
            $aAvatarFieldOption += ['required' => 1];
        }

        $oForm = new \PFBC\Form('form_join_user4');
        $oForm->configure(['action' => '']);
        $oForm->addElement(new Hidden('submit_join_user4', 'form_join_user4'));
        $oForm->addElement(new Token('join4'));
        $oForm->addElement(new File(t('Your Profile Photo'), 'avatar', $aAvatarFieldOption));
        $oForm->addElement(new Button(t('Add My Photo')));

        if (!$bIsAvatarRequired) {
            $oForm->addElement(
                new Button(
                    t('Skip'),
                    'submit',
                    ['formaction' => Uri::get('user', 'signup', 'done')]
                )
            );
        }
        $oForm->render();
    }

    private static function generateBirthDateField(\PFBC\Form $oForm)
    {
        if (DbConfig::getSetting('isUserAgeRangeField')) {
            self::getRangeBirthDateFieldForm($oForm);
        } else {
            $oForm->addElement(
                new Date(
                    t('Your Date of Birth'),
                    'birth_date',
                    [
                        'id' => 'birth_date',
                        'description' => t('Please specify your date of birth using the calendar.'),
                        'onblur' => 'CValid(this.value, this.id)',
                        'validation' => new BirthDate,
                        'required' => 1
                    ]
                )
            );
            $oForm->addElement(new HTMLExternal('<span class="input_error birth_date"></span>'));
        }
    }

    private static function getRangeBirthDateFieldForm(\PFBC\Form $oForm)
    {
        $iMinAge = DbConfig::getSetting('minAgeRegistration');
        $iMaxAge = DbConfig::getSetting('maxAgeRegistration');
        $iDefRegistrationAge = $iMinAge + 16;

        $oForm->addElement(
            new Range(
                t('How Old Are You?'),
                'age',
                [
                    'value' => $iDefRegistrationAge,
                    'min' => $iMinAge,
                    'max' => $iMaxAge,
                    'required' => 1
                ]
            )
        );
    }
}
