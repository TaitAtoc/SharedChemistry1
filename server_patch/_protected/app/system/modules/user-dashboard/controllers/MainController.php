<?php
/**
 * @author         Pierre-Henry Soria <hello@ph7builder.com>
 * @copyright      (c) 2016-2019, Pierre-Henry Soria. All Rights Reserved.
 * @license        MIT License; See LICENSE.md and COPYRIGHT.md in the root directory.
 * @package        PH7 / App / System / Module / User Dashboard / Controller
 */

namespace PH7;

use PH7\Framework\Module\Various as SysMod;

class MainController extends Controller
{
    public function index()
    {
        $this->view->page_title = $this->view->h1_title = t('My Dashboard');

        $this->design->addCss(
            PH7_STATIC . PH7_CSS . PH7_JS . 'jquery/slick/',
            'slick.css,slick-theme.css'
        );
        $this->design->addJs(
            PH7_STATIC . PH7_JS,
            'Wall.js,jquery/slick.js'
        );

        if (SysMod::isEnabled('friend')) {
            $this->addFriendJsFile();
        }

        $this->view->username = $this->session->get('member_username');
        $this->view->first_name = $this->session->get('member_first_name');
        $this->view->sex = $this->session->get('member_sex');
        $this->view->avatarDesign = new AvatarDesignCore; // For the avatar lightBox
        $this->view->userDesignModel = new UserDesignModel; // For the profilesBlock
        $this->view->public_avatar_url = $this->getPublicAvatarUrl(
            (int)$this->session->get('member_id'),
            $this->view->username,
            $this->view->sex
        );
        $this->view->public_photos = SysMod::isEnabled('picture') ?
            (new PictureModel)->getPublicPhotosByProfileId((int)$this->session->get('member_id')) :
            [];

        $this->output();
    }

    /**
     * Add the JS file for the Ajax Friend block (if friend module is enabled).
     *
     * @return void
     */
    private function addFriendJsFile()
    {
        $this->design->addJs(
            PH7_LAYOUT . PH7_SYS . PH7_MOD . 'friend' . PH7_SH . PH7_TPL . PH7_TPL_MOD_NAME . PH7_SH . PH7_JS,
            'friend.js'
        );
    }

    /**
     * Return the member avatar URL, or the SharedChemistry couple fallback when no avatar is uploaded.
     *
     * @param int $iProfileId
     * @param string $sUsername
     * @param string|null $sSex
     *
     * @return string
     */
    private function getPublicAvatarUrl($iProfileId, $sUsername, $sSex)
    {
        $oAvatar = (new UserCoreModel)->getAvatar($iProfileId, '1');
        $sAvatar = !empty($oAvatar->pic) ? $oAvatar->pic : '';
        $sAvatarPath = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'user/avatar/img/' . $sUsername . PH7_DS . $sAvatar;

        if (!empty($sAvatar) && is_file($sAvatarPath)) {
            return (new AvatarDesignCore)->getUserAvatar($sUsername, $sSex, 400, false);
        }

        return PH7_URL_TPL . PH7_TPL_NAME . PH7_SH . PH7_IMG . 'sharedchemistry/SharedChemistyAvatar.png';
    }
}
