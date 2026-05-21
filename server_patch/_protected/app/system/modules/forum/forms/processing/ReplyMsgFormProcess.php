<?php
/**
 * SharedChemistry forum reply processing override.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

use PDO;
use PH7\Framework\File\File;
use PH7\Framework\Mvc\Model\DbConfig;
use PH7\Framework\Mvc\Model\Engine\Db;
use PH7\Framework\Mvc\Request\Http;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Url\Header;

class ReplyMsgFormProcess extends Form
{
    const PHOTOS_TABLE = 'sc_forum_reply_photos';
    const MAX_PHOTOS = 5;
    const MAX_PHOTO_BYTES = 5242880;

    private $aAllowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];
    private $aAllowedMimeTypes = ['image/jpeg', 'image/png', 'image/webp'];

    public function __construct()
    {
        parent::__construct();

        $oForumModel = new ForumModel;

        $sMessage = $this->httpRequest->post('message', Http::ONLY_XSS_CLEAN);
        $sCurrentTime = $this->dateTime->get()->dateTime('Y-m-d H:i:s');
        $iTimeDelay = (int)DbConfig::getSetting('timeDelaySendForumMsg');
        $iProfileId = (int)$this->session->get('member_id');
        $iForumId = $this->httpRequest->get('forum_id', 'int');
        $iTopicId = $this->httpRequest->get('topic_id', 'int');
        $aPhotos = $this->getUploadedPhotos();

        if (!$oForumModel->checkWaitReply($iTopicId, $iProfileId, $iTimeDelay, $sCurrentTime)) {
            \PFBC\Form::setError('form_reply', Form::waitWriteMsg($iTimeDelay));
        } elseif ($oForumModel->isDuplicateMessage($iProfileId, $sMessage)) {
            \PFBC\Form::setError('form_reply', Form::duplicateContentMsg());
        } elseif (!empty($aPhotos) && !$this->tableExists(self::PHOTOS_TABLE)) {
            \PFBC\Form::setError('form_reply', t('Reply photos need the SharedChemistry forum reply photo table before they can be saved.'));
        } elseif (!$this->validatePhotos($aPhotos)) {
            // validatePhotos sets the form error.
        } else {
            if (!$oForumModel->addMessage($iProfileId, $iTopicId, $sMessage, $sCurrentTime)) {
                \PFBC\Form::setError('form_reply', t('The reply could not be posted. Please try again.'));
                unset($oForumModel);
                return;
            }

            $iMessageId = (int)Db::getInstance()->lastInsertId();
            $this->savePhotos($iMessageId, $iTopicId, $iProfileId, $aPhotos, $sCurrentTime);

            $this->redirectUserToTopicPost($iForumId, $iTopicId);
        }
        unset($oForumModel);
    }

    /**
     * @param int $iForumId
     * @param int $iTopicId
     *
     * @throws Framework\File\IOException
     */
    private function redirectUserToTopicPost($iForumId, $iTopicId)
    {
        Header::redirect(
            Uri::get(
                'forum',
                'forum',
                'post',
                $this->httpRequest->get('forum_name') . ',' . $iForumId . ',' . $this->httpRequest->get('topic_name') . ',' . $iTopicId
            ),
            t('Reply posted!')
        );
    }

    private function tableExists($sTable)
    {
        try {
            $rStmt = Db::getInstance()->prepare('SELECT 1 FROM' . Db::prefix($sTable) . 'LIMIT 1');
            $rStmt->execute();
            Db::free($rStmt);

            return true;
        } catch (\Exception $oException) {
            return false;
        }
    }

    private function savePhotos($iMessageId, $iTopicId, $iProfileId, array $aPhotos, $sCurrentTime)
    {
        if (empty($aPhotos)) {
            return;
        }

        $sDir = $this->getReplyPhotoDir($iMessageId);
        (new File)->createDir($sDir);

        foreach ($aPhotos as $aPhoto) {
            $sExt = strtolower((string)pathinfo($aPhoto['name'], PATHINFO_EXTENSION));
            $sFileName = $this->generatePhotoFilename($sExt);
            $sPublicPath = $this->getReplyPhotoPublicPath($iMessageId, $sFileName);

            if (!move_uploaded_file($aPhoto['tmp_name'], $sDir . $sFileName)) {
                \PFBC\Form::setError('form_reply', t('One of the reply photos could not be saved.'));
                continue;
            }

            $rStmt = Db::getInstance()->prepare(
                'INSERT INTO' . Db::prefix(self::PHOTOS_TABLE) .
                '(message_id, topic_id, member_id, filename, original_name, mime_type, file_size, public_path, created_at) ' .
                'VALUES (:messageId, :topicId, :memberId, :filename, :originalName, :mimeType, :fileSize, :publicPath, :createdAt)'
            );
            $rStmt->bindValue(':messageId', $iMessageId, PDO::PARAM_INT);
            $rStmt->bindValue(':topicId', $iTopicId, PDO::PARAM_INT);
            $rStmt->bindValue(':memberId', $iProfileId, PDO::PARAM_INT);
            $rStmt->bindValue(':filename', $sFileName, PDO::PARAM_STR);
            $rStmt->bindValue(':originalName', $this->cleanOriginalName($aPhoto['name']), PDO::PARAM_STR);
            $rStmt->bindValue(':mimeType', $this->detectMimeType($aPhoto['tmp_name']), PDO::PARAM_STR);
            $rStmt->bindValue(':fileSize', (int)$aPhoto['size'], PDO::PARAM_INT);
            $rStmt->bindValue(':publicPath', $sPublicPath, PDO::PARAM_STR);
            $rStmt->bindValue(':createdAt', $sCurrentTime, PDO::PARAM_STR);
            $rStmt->execute();
            Db::free($rStmt);
        }
    }

    private function validatePhotos(array $aPhotos)
    {
        if (count($aPhotos) > self::MAX_PHOTOS) {
            \PFBC\Form::setError('form_reply', t('Please upload no more than 5 reply photos.'));
            return false;
        }

        foreach ($aPhotos as $aPhoto) {
            if (!is_uploaded_file($aPhoto['tmp_name'])) {
                \PFBC\Form::setError('form_reply', t('One of the selected photos could not be uploaded.'));
                return false;
            }

            if ((int)$aPhoto['size'] > self::MAX_PHOTO_BYTES) {
                \PFBC\Form::setError('form_reply', t('Reply photos must be 5MB or smaller.'));
                return false;
            }

            $sExt = strtolower((string)pathinfo($aPhoto['name'], PATHINFO_EXTENSION));
            if (!in_array($sExt, $this->aAllowedExtensions, true)) {
                \PFBC\Form::setError('form_reply', t('Please upload JPG, PNG, or WebP reply photos.'));
                return false;
            }

            $sMimeType = $this->detectMimeType($aPhoto['tmp_name']);
            if ($sMimeType !== '' && !in_array($sMimeType, $this->aAllowedMimeTypes, true)) {
                \PFBC\Form::setError('form_reply', t('Please upload valid image files only.'));
                return false;
            }
        }

        return true;
    }

    private function getUploadedPhotos()
    {
        if (empty($_FILES['reply_photos']) || empty($_FILES['reply_photos']['name'])) {
            return [];
        }

        $aPhotos = [];
        foreach ((array)$_FILES['reply_photos']['name'] as $iIndex => $sName) {
            if ((string)$sName === '') {
                continue;
            }

            $aPhotos[] = [
                'name' => (string)$sName,
                'type' => isset($_FILES['reply_photos']['type'][$iIndex]) ? (string)$_FILES['reply_photos']['type'][$iIndex] : '',
                'tmp_name' => isset($_FILES['reply_photos']['tmp_name'][$iIndex]) ? (string)$_FILES['reply_photos']['tmp_name'][$iIndex] : '',
                'error' => isset($_FILES['reply_photos']['error'][$iIndex]) ? (int)$_FILES['reply_photos']['error'][$iIndex] : UPLOAD_ERR_NO_FILE,
                'size' => isset($_FILES['reply_photos']['size'][$iIndex]) ? (int)$_FILES['reply_photos']['size'][$iIndex] : 0
            ];
        }

        return array_filter($aPhotos, function ($aPhoto) {
            return (int)$aPhoto['error'] !== UPLOAD_ERR_NO_FILE;
        });
    }

    private function getReplyPhotoDir($iMessageId)
    {
        return PH7_PATH_ROOT . 'data' . PH7_DS . 'sharedchemistry' . PH7_DS . 'forum-reply-photos' . PH7_DS . $iMessageId . PH7_DS;
    }

    private function getReplyPhotoPublicPath($iMessageId, $sFileName)
    {
        return 'data/sharedchemistry/forum-reply-photos/' . $iMessageId . '/' . rawurlencode($sFileName);
    }

    private function generatePhotoFilename($sExt)
    {
        try {
            $sRandom = bin2hex(random_bytes(16));
        } catch (\Exception $oException) {
            $sRandom = sha1(uniqid('', true) . mt_rand());
        }

        return 'reply-' . $sRandom . '.' . $sExt;
    }

    private function cleanOriginalName($sOriginalName)
    {
        $sOriginalName = basename((string)$sOriginalName);
        $sOriginalName = preg_replace('/[^A-Za-z0-9._ -]/', '', $sOriginalName);

        return $sOriginalName !== '' ? $sOriginalName : 'upload';
    }

    private function detectMimeType($sTmpPath)
    {
        if (function_exists('finfo_open')) {
            $rFinfo = finfo_open(FILEINFO_MIME_TYPE);
            if ($rFinfo) {
                $sMimeType = (string)finfo_file($rFinfo, $sTmpPath);
                finfo_close($rFinfo);

                return $sMimeType;
            }
        }

        return function_exists('mime_content_type') ? (string)mime_content_type($sTmpPath) : '';
    }
}
