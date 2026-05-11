<?php

declare(strict_types=1);

namespace PH7;

defined('PH7') or exit('Restricted access');

use PH7\Framework\Mvc\Model\DbConfig;
use PH7\Framework\Security\Moderation\Filter;

class PublicProfilePhotoFormProcess extends Form implements NudityDetectable
{
    public const ACTION_UPLOAD = 'upload';
    public const ACTION_DELETE = 'delete';

    private int $iSlot;
    private string $sAction;
    private string $sApproved;

    public function __construct(int $iSlot, string $sAction)
    {
        parent::__construct();

        $this->iSlot = $iSlot;
        $this->sAction = $sAction;
        $this->sApproved = DbConfig::getSetting('pictureManualApproval') == 0 ? '1' : '0';

        if (!$this->isValidSlot()) {
            \PFBC\Form::setError($this->getFormId(), t('Invalid public profile photo slot.'));
            return;
        }

        if ($this->sAction === self::ACTION_DELETE) {
            $this->deletePhoto();
            return;
        }

        $this->uploadPhoto();
    }

    public function isNudityFilterEligible(): bool
    {
        return $this->sApproved === '1' && DbConfig::getSetting('nudityFilter');
    }

    public function checkNudityFilter(): void
    {
        if (Filter::isNudity($_FILES['sc_public_profile_photo']['tmp_name'])) {
            $this->sApproved = '0';
        }
    }

    private function uploadPhoto(): void
    {
        if (empty($_FILES['sc_public_profile_photo']['tmp_name'])) {
            \PFBC\Form::setError($this->getFormId(), Form::wrongImgFileTypeMsg());
            return;
        }

        if ($this->isNudityFilterEligible()) {
            $this->checkNudityFilter();
        }

        $bSaved = (new ScPublicProfilePhoto)->saveSlot(
            (int)$this->session->get('member_id'),
            (string)$this->session->get('member_username'),
            $this->iSlot,
            $_FILES['sc_public_profile_photo']['tmp_name'],
            $this->sApproved
        );

        if (!$bSaved) {
            \PFBC\Form::setError($this->getFormId(), Form::wrongImgFileTypeMsg());
            return;
        }

        $sModerationText = t('Your public profile photo has been received. It will not be visible until it is approved by our moderators.');
        $sText = t('Your public profile photo has been updated successfully!');
        \PFBC\Form::setSuccess($this->getFormId(), $this->sApproved === '0' ? $sModerationText : $sText);
    }

    private function deletePhoto(): void
    {
        (new ScPublicProfilePhoto)->deleteSlot(
            (int)$this->session->get('member_id'),
            (string)$this->session->get('member_username'),
            $this->iSlot
        );

        \PFBC\Form::setSuccess($this->getFormId(), t('Your public profile photo has been deleted.'));
    }

    private function getFormId(): string
    {
        return $this->sAction === self::ACTION_DELETE
            ? 'form_sc_public_profile_photo_delete_' . $this->iSlot
            : 'form_sc_public_profile_photo_' . $this->iSlot;
    }

    private function isValidSlot(): bool
    {
        return $this->iSlot >= 1 && $this->iSlot <= ScPublicProfilePhoto::SLOT_COUNT;
    }
}
