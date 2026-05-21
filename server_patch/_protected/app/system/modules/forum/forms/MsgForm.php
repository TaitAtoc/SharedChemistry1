<?php
/**
 * SharedChemistry forum discussion form override.
 */

namespace PH7;

use PFBC\Element\Button;
use PFBC\Element\CCaptcha;
use PFBC\Element\File;
use PFBC\Element\Hidden;
use PFBC\Element\HTMLExternal;
use PFBC\Element\Textarea;
use PFBC\Element\Textbox;
use PFBC\Element\Token;
use PFBC\Validation\RegExp;
use PFBC\Validation\Str;
use PH7\Framework\Config\Config;
use PH7\Framework\Mvc\Model\DbConfig;
use PH7\Framework\Mvc\Request\Http;
use PH7\Framework\Url\Header;

class MsgForm
{
    public static function display()
    {
        if (isset($_POST['submit_msg'])) {
            if (\PFBC\Form::isValid($_POST['submit_msg'])) {
                new MsgFormProcess();
            }

            Header::redirect();
        }

        $sTitlePattern = Config::getInstance()->values['module.setting']['url_title.pattern'];
        $iForumId = (new Http)->get('forum_id', 'int');

        $oForm = new \PFBC\Form('form_msg');
        $oForm->configure(['action' => '']);
        $oForm->addElement(new Hidden('submit_msg', 'form_msg'));
        $oForm->addElement(new Token('msg'));
        $oForm->addElement(new Hidden('forum_id', $iForumId));
        $oForm->addElement(
            new Textbox(
                t('Heading'),
                'title',
                [
                    'class' => 'sc-forum-add-topic-field',
                    'id' => 'str_title',
                    'onblur' => 'CValid(this.value,this.id,2,60)',
                    'pattern' => $sTitlePattern,
                    'placeholder' => t('Give your discussion a clear heading'),
                    'required' => 1,
                    'validation' => new RegExp($sTitlePattern)
                ]
            )
        );
        $oForm->addElement(new HTMLExternal('<span class="input_error str_title"></span>'));
        $oForm->addElement(
            new Textarea(
                t('Short Description'),
                'short_description',
                [
                    'class' => 'sc-forum-add-topic-field',
                    'id' => 'str_short_description',
                    'placeholder' => t('Add a quick summary for other members.'),
                    'validation' => new Str(0, 500)
                ]
            )
        );

        $sEditorClass = FormHelper::getEditorPfbcClassName();
        $oForm->addElement(
            new $sEditorClass(
                t('Discussion'),
                'message',
                [
                    'class' => 'sc-forum-add-topic-field',
                    'placeholder' => t('Share the conversation you want to start.'),
                    'required' => 1,
                    'validation' => new Str(4)
                ]
            )
        );
        $oForm->addElement(
            new File(
                t('Add Photos'),
                'topic_photos[]',
                [
                    'class' => 'sc-forum-add-topic-upload',
                    'accept' => 'image/jpeg,image/png,image/webp,.jpg,.jpeg,.png,.webp',
                    'description' => t('Optional. Add up to 5 JPG, PNG, or WebP images. Max 5MB each.'),
                    'multiple' => 'multiple'
                ]
            )
        );

        if (DbConfig::getSetting('isCaptchaForum')) {
            $oForm->addElement(
                new CCaptcha(
                    t('Captcha'),
                    'captcha',
                    [
                        'id' => 'ccaptcha',
                        'onkeyup' => 'CValid(this.value, this.id)',
                        'description' => t('Enter the below code:')
                    ]
                )
            );
            $oForm->addElement(new HTMLExternal('<span class="input_error ccaptcha"></span>'));
        }

        $oForm->addElement(new Button(t('Submit Discussion'), 'submit', ['class' => 'sc-forum-add-topic-submit']));
        $oForm->addElement(new HTMLExternal('<script src="' . PH7_URL_STATIC . PH7_JS . 'validate.js"></script>'));
        $oForm->render();
    }
}
