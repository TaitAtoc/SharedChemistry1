<?php
/**
 * SharedChemistry forum reply form override.
 */

namespace PH7;

use PFBC\Element\Button;
use PFBC\Element\CCaptcha;
use PFBC\Element\File;
use PFBC\Element\Hidden;
use PFBC\Element\HTMLExternal;
use PFBC\Element\Token;
use PFBC\Validation\Str;
use PH7\Framework\Mvc\Model\DbConfig;
use PH7\Framework\Url\Header;

class ReplyMsgForm
{
    public static function display()
    {
        if (isset($_POST['submit_reply'])) {
            if (\PFBC\Form::isValid($_POST['submit_reply'])) {
                new ReplyMsgFormProcess();
            }

            Header::redirect();
        }

        $oForm = new \PFBC\Form('form_reply');
        $oForm->configure(['action' => '']);
        $oForm->addElement(new Hidden('submit_reply', 'form_reply'));
        $oForm->addElement(new Token('reply'));

        $sEditorClass = FormHelper::getEditorPfbcClassName();
        $oForm->addElement(
            new $sEditorClass(
                t('Reply'),
                'message',
                [
                    'class' => 'sc-forum-reply-field',
                    'placeholder' => t('Write your reply to this discussion.'),
                    'required' => 1,
                    'validation' => new Str(4)
                ]
            )
        );
        $oForm->addElement(
            new File(
                t('Add Photos'),
                'reply_photos[]',
                [
                    'class' => 'sc-forum-reply-upload',
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

        $oForm->addElement(new Button(t('Submit Reply'), 'submit', ['class' => 'sc-forum-reply-submit']));
        $oForm->addElement(new HTMLExternal('<script src="' . PH7_URL_STATIC . PH7_JS . 'validate.js"></script>'));
        $oForm->render();
    }
}
