<?php
/**
 * SharedChemistry member-wide chatroom.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

use PDO;
use PH7\Framework\Layout\Html\Design;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Security\CSRF\Token;
use PH7\Framework\Url\Header;

class HomeController extends Controller
{
    private const CHATROOM_TABLE = 'sc_chatroom_messages';
    private const MESSAGE_LIMIT = 50;
    private const MESSAGE_MAX_LENGTH = 500;
    private const COUPLE_PROFILE_DATA_FIELD = 'couple_profile_data';

    public function index(): void
    {
        $this->view->page_title = $this->view->h1_title = t('Shared Chat Room');
        $this->view->meta_description = t('SharedChemistry member chat room.');
        $this->view->chat_error = '';
        $this->view->table_ready = $this->isTableReady();

        if ($this->httpRequest->postExists('message')) {
            $this->handlePost();
        }

        $this->view->chat_csrf_token = (new Token)->generate('sharedchemistry_chatroom');
        $this->view->chat_messages = $this->view->table_ready ? $this->getMessages() : [];
        $this->output();
    }

    public function messages(): void
    {
        $this->outputJson([
            'messages' => $this->isTableReady() ? $this->formatMessagesForJson($this->getMessages()) : []
        ]);
    }

    private function handlePost(): void
    {
        if (!$this->view->table_ready) {
            $this->view->chat_error = t('The chat room is not ready yet. Please run the chat room database update.');
            return;
        }

        if (!(new Token)->check('sharedchemistry_chatroom')) {
            $this->view->chat_error = Form::errorTokenMsg();
            return;
        }

        $sMessage = $this->cleanMessage((string)$this->httpRequest->post('message'));

        if ($sMessage === '') {
            $this->view->chat_error = t('Please enter a message before sending.');
            return;
        }

        if ($this->messageLength($sMessage) > self::MESSAGE_MAX_LENGTH) {
            $this->view->chat_error = t('Please keep chat messages under %0% characters.', self::MESSAGE_MAX_LENGTH);
            return;
        }

        $sChatroomTable = Db::prefix(self::CHATROOM_TABLE, false);

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO ' . $sChatroomTable .
            ' (senderId, messageText, createdAt) VALUES (:senderId, :messageText, NOW())'
        );
        $rStmt->bindValue(':senderId', (int)$this->session->get('member_id'), PDO::PARAM_INT);
        $rStmt->bindValue(':messageText', $sMessage, PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);

        Header::redirect(
            PH7_URL_ROOT . 'free-chat-room',
            t('Message sent.'),
            Design::SUCCESS_TYPE
        );
    }

    private function getMessages(): array
    {
        $sChatroomTable = Db::prefix(self::CHATROOM_TABLE, false);
        $sMemberTable = Db::prefix(DbTableName::MEMBER, false);
        $sMemberInfoTable = Db::prefix(DbTableName::MEMBER_INFO, false);

        $rStmt = Db::getInstance()->prepare(
            'SELECT chat.messageId, chat.senderId, chat.messageText, chat.createdAt, m.username, m.firstName, m.sex, i.' . self::COUPLE_PROFILE_DATA_FIELD . ' FROM ' .
            '(SELECT messageId, senderId, messageText, createdAt FROM ' . $sChatroomTable .
            ' ORDER BY createdAt DESC, messageId DESC LIMIT :limit) AS chat INNER JOIN ' .
            $sMemberTable . ' AS m ON m.profileId = chat.senderId LEFT JOIN ' .
            $sMemberInfoTable . ' AS i ON i.profileId = chat.senderId WHERE m.ban = 0 ' .
            'ORDER BY chat.createdAt ASC, chat.messageId ASC'
        );
        $rStmt->bindValue(':limit', self::MESSAGE_LIMIT, PDO::PARAM_INT);
        $rStmt->execute();
        $aRows = $rStmt->fetchAll(PDO::FETCH_OBJ);
        Db::free($rStmt);

        foreach ($aRows as $oMessage) {
            $oMessage->displayName = $this->getDisplayName($oMessage);
            $oMessage->avatarUrl = $this->getAvatarUrl($oMessage);
            $oMessage->displayTime = $this->getDisplayTime($oMessage->createdAt);
        }

        return is_array($aRows) ? $aRows : [];
    }

    private function isTableReady(): bool
    {
        try {
            $rStmt = Db::getInstance()->query('SELECT 1 FROM ' . Db::prefix(self::CHATROOM_TABLE, false) . ' LIMIT 1');
            Db::free($rStmt);

            return true;
        } catch (\Exception $oException) {
            return false;
        }
    }

    private function cleanMessage(string $sMessage): string
    {
        $sMessage = trim(strip_tags($sMessage));
        $sMessage = preg_replace('/\s+/u', ' ', $sMessage);

        return is_string($sMessage) ? $sMessage : '';
    }

    private function messageLength(string $sMessage): int
    {
        return function_exists('mb_strlen') ? mb_strlen($sMessage, 'UTF-8') : strlen($sMessage);
    }

    private function getDisplayName(\stdClass $oMessage): string
    {
        $aCoupleProfile = $this->getCoupleProfileData((string)$oMessage->{self::COUPLE_PROFILE_DATA_FIELD});

        if (!empty($aCoupleProfile['couple_name'])) {
            return (string)$aCoupleProfile['couple_name'];
        }

        return !empty($oMessage->username) ? (string)$oMessage->username : (string)$oMessage->firstName;
    }

    private function getCoupleProfileData(string $sJson): array
    {
        $aData = json_decode($sJson, true);

        return is_array($aData) ? $aData : [];
    }

    private function getAvatarUrl(\stdClass $oMessage): string
    {
        $sAvatarUrl = (string)$this->design->getUserAvatar($oMessage->username, $oMessage->sex, 150, false);

        return !empty($sAvatarUrl) ? $sAvatarUrl : PH7_URL_TPL . PH7_TPL_NAME . PH7_SH . PH7_IMG . 'sharedchemistry/SharedChemistyAvatar.png';
    }

    private function getDisplayTime(string $sCreatedAt): string
    {
        $iCreatedAt = strtotime($sCreatedAt);

        if ($iCreatedAt === false) {
            return '';
        }

        $iSecondsAgo = max(0, time() - $iCreatedAt);

        if ($iSecondsAgo < 60) {
            return t('Just now');
        }

        if ($iSecondsAgo < 3600) {
            $iMinutes = max(1, (int)floor($iSecondsAgo / 60));
            return $iMinutes === 1 ? t('1 minute ago') : t('%0% minutes ago', $iMinutes);
        }

        if (date('Y-m-d', $iCreatedAt) === date('Y-m-d')) {
            return date('g:i A', $iCreatedAt);
        }

        return date('M j, g:i A', $iCreatedAt);
    }

    private function formatMessagesForJson(array $aMessages): array
    {
        $aFormattedMessages = [];

        foreach ($aMessages as $oMessage) {
            $aFormattedMessages[] = [
                'messageId' => (int)$oMessage->messageId,
                'displayName' => (string)$oMessage->displayName,
                'avatarUrl' => (string)$oMessage->avatarUrl,
                'messageText' => (string)$oMessage->messageText,
                'createdAt' => (string)$oMessage->createdAt,
                'displayTime' => (string)$oMessage->displayTime
            ];
        }

        return $aFormattedMessages;
    }

    private function outputJson(array $aPayload): void
    {
        header('Content-Type: application/json; charset=' . PH7_ENCODING);
        echo json_encode($aPayload, JSON_UNESCAPED_SLASHES);
        exit;
    }
}
