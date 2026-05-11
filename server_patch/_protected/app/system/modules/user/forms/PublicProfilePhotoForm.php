<?php

declare(strict_types=1);

namespace PH7;

use PFBC\Element\Button;
use PFBC\Element\File;
use PFBC\Element\Hidden;
use PFBC\Element\HTMLExternal;
use PFBC\Element\Token;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Url\Header;

class PublicProfilePhotoForm
{
    public static function display(int $iSlot, ?object $oPhoto = null): void
    {
        $sUploadFormId = 'form_sc_public_profile_photo_' . $iSlot;
        $sDeleteFormId = 'form_sc_public_profile_photo_delete_' . $iSlot;

        if (isset($_POST['submit_sc_public_profile_photo']) && $_POST['submit_sc_public_profile_photo'] === $sUploadFormId) {
            if (\PFBC\Form::isValid($sUploadFormId)) {
                new PublicProfilePhotoFormProcess($iSlot, PublicProfilePhotoFormProcess::ACTION_UPLOAD);
            }

            Header::redirect(Uri::get('user', 'setting', 'index') . '#p=avatar');
        }

        if (isset($_POST['submit_sc_public_profile_photo_delete']) && $_POST['submit_sc_public_profile_photo_delete'] === $sDeleteFormId) {
            if (\PFBC\Form::isValid($sDeleteFormId)) {
                new PublicProfilePhotoFormProcess($iSlot, PublicProfilePhotoFormProcess::ACTION_DELETE);
            }

            Header::redirect(Uri::get('user', 'setting', 'index') . '#p=avatar');
        }

        self::renderUploadForm($iSlot, $oPhoto, $sUploadFormId);

        if ($oPhoto !== null) {
            self::renderDeleteForm($iSlot, $sDeleteFormId);
        }
    }

    private static function renderUploadForm(int $iSlot, ?object $oPhoto, string $sFormId): void
    {
        $sButtonText = $oPhoto === null ? t('Upload') : t('Replace');

        $oForm = new \PFBC\Form($sFormId);
        $oForm->configure(['action' => Uri::get('user', 'setting', 'index') . '#p=avatar']);
        $oForm->addElement(new Hidden('submit_sc_public_profile_photo', $sFormId));
        $oForm->addElement(new Token('sc_public_profile_photo_' . $iSlot));
        $oForm->addElement(new Hidden('sc_public_profile_photo_slot', (string)$iSlot));
        $oForm->addElement(
            new File(
                t('Public profile photo %0%', $iSlot),
                'sc_public_profile_photo',
                ['accept' => 'image/*', 'required' => 1]
            )
        );
        $oForm->addElement(new Button($sButtonText, 'submit', ['icon' => 'image']));
        $oForm->render();
    }

    private static function renderDeleteForm(int $iSlot, string $sFormId): void
    {
        $oForm = new \PFBC\Form($sFormId);
        $oForm->configure(['action' => Uri::get('user', 'setting', 'index') . '#p=avatar']);
        $oForm->addElement(new Hidden('submit_sc_public_profile_photo_delete', $sFormId));
        $oForm->addElement(new Token('sc_public_profile_photo_delete_' . $iSlot));
        $oForm->addElement(new Hidden('sc_public_profile_photo_slot', (string)$iSlot));
        $oForm->addElement(new HTMLExternal('<div class="sc-public-photo-delete-wrap">'));
        $oForm->addElement(new Button(t('Delete'), 'submit', ['icon' => 'trash']));
        $oForm->addElement(new HTMLExternal('</div>'));
        $oForm->render();
    }
}
