<?php
/**
 * @author         Pierre-Henry Soria <hello@ph7builder.com>
 * @copyright      (c) 2016-2019, Pierre-Henry Soria. All Rights Reserved.
 * @license        MIT License; See LICENSE.md and COPYRIGHT.md in the root directory.
 * @package        PH7 / App / System / Module / User Dashboard / Controller
 */

namespace PH7;

use PH7\Framework\Module\Various as SysMod;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Router\Uri;
use PDO;

class MainController extends Controller
{
    private const FRIEND_CARD_LIMIT = 6;
    private const VERIFIED_CARD_LIMIT = 6;
    private const COUPLE_VERIFICATION_TABLE = 'couple_verifications';
    private const COUPLE_PROFILE_DATA_FIELD = 'couple_profile_data';

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
        $this->view->dashboard_friends = [];
        $this->view->dashboard_friends_url = '';
        $this->view->dashboard_verified_friends = [];

        $iMemberId = (int)$this->session->get('member_id');

        if (SysMod::isEnabled('friend')) {
            $this->view->dashboard_friends = $this->getApprovedFriendCards($iMemberId);
            $this->view->dashboard_friends_url = Uri::get('friend', 'main', 'index', $this->view->username);
        }

        $this->view->dashboard_verified_friends = $this->getVerifiedCoupleCards($iMemberId);

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

    private function getApprovedFriendCards(int $iProfileId): array
    {
        $aFriends = [];
        $oUserModel = new UserCoreModel;

        foreach ($this->getApprovedFriendIds($iProfileId) as $iFriendId) {
            $oFriend = $oUserModel->readProfile($iFriendId);
            if (!$oFriend || (int)$oFriend->ban === UserCore::BAN_STATUS) {
                continue;
            }

            $oFields = $oUserModel->getInfoFields($iFriendId);
            $aCoupleProfile = $this->getCoupleProfileData($oFields);

            $aFriends[] = (object)[
                'profileId' => (int)$iFriendId,
                'username' => $oFriend->username,
                'sex' => $oFriend->sex,
                'displayName' => !empty($aCoupleProfile['couple_name']) ? $aCoupleProfile['couple_name'] : $oFriend->username,
                'profileUrl' => Uri::get('cool-profile-page', 'main', 'index', $iFriendId),
                'avatarUrl' => $this->getFriendAvatarUrl($oFriend)
            ];
        }

        unset($oUserModel);

        return $aFriends;
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

    private function getCoupleProfileData(\stdClass $oFields): array
    {
        $sJson = isset($oFields->{self::COUPLE_PROFILE_DATA_FIELD}) ? (string)$oFields->{self::COUPLE_PROFILE_DATA_FIELD} : '';
        $aData = json_decode($sJson, true);

        return is_array($aData) ? $aData : [];
    }

    private function getFriendAvatarUrl(\stdClass $oFriend): string
    {
        $sAvatarUrl = (string)$this->design->getUserAvatar($oFriend->username, $oFriend->sex, 150, false);

        return !empty($sAvatarUrl) ? $sAvatarUrl : PH7_URL_TPL . PH7_TPL_NAME . PH7_SH . PH7_IMG . 'sharedchemistry/SharedChemistyAvatar.png';
    }

    private function getVerifiedCoupleCards(int $iVerifierProfileId): array
    {
        $aVerifiedCouples = [];
        $oUserModel = new UserCoreModel;
        $sReviewerDisplayName = $this->getReviewerDisplayName($iVerifierProfileId, $oUserModel);

        foreach ($this->getVerifiedCoupleRows($iVerifierProfileId) as $oVerification) {
            $oVerified = $oUserModel->readProfile((int)$oVerification->verified_profile_id);
            if (!$oVerified || (int)$oVerified->ban === UserCore::BAN_STATUS) {
                continue;
            }

            $oFields = $oUserModel->getInfoFields((int)$oVerification->verified_profile_id);
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

        unset($oUserModel);

        return $aVerifiedCouples;
    }

    private function getReviewerDisplayName(int $iVerifierProfileId, UserCoreModel $oUserModel): string
    {
        $oVerifier = $oUserModel->readProfile($iVerifierProfileId);
        if (!$oVerifier) {
            return (string)$this->view->username;
        }

        $oFields = $oUserModel->getInfoFields($iVerifierProfileId);
        $aCoupleProfile = $this->getCoupleProfileData($oFields);

        return !empty($aCoupleProfile['couple_name']) ? $aCoupleProfile['couple_name'] : $oVerifier->username;
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
}
