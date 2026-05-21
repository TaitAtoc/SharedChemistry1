<?php
/**
 * SharedChemistry forum discussion processing override.
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

class MsgFormProcess extends Form
{
    const EXTRAS_TABLE = 'sc_forum_topic_extras';
    const PHOTOS_TABLE = 'sc_forum_topic_photos';
    const MAX_PHOTOS = 5;
    const MAX_PHOTO_BYTES = 5242880;

    private $aAllowedExtensions = ['jpg', 'jpeg', 'png', 'webp'];
    private $aAllowedMimeTypes = ['image/jpeg', 'image/png', 'image/webp'];

    public function __construct()
    {
        parent::__construct();

        $oForumModel = new ForumModel;

        $sTitle = trim($this->httpRequest->post('title'));
        $sMessage = $this->httpRequest->post('message', Http::ONLY_XSS_CLEAN);
        $sShortDescription = trim((string)$this->httpRequest->post('short_description', Http::ONLY_XSS_CLEAN));
        $sCurrentTime = $this->dateTime->get()->dateTime('Y-m-d H:i:s');
        $iTimeDelay = (int)DbConfig::getSetting('timeDelaySendForumTopic');
        $iProfileId = (int)$this->session->get('member_id');
        $iForumId = $this->httpRequest->get('forum_id', 'int');
        $aPhotos = $this->getUploadedPhotos();

        if (!$oForumModel->checkWaitTopic($iProfileId, $iTimeDelay, $sCurrentTime)) {
            \PFBC\Form::setError('form_msg', Form::waitWriteMsg($iTimeDelay));
        } elseif ($oForumModel->isDuplicateTopic($iProfileId, $sMessage)) {
            \PFBC\Form::setError('form_msg', Form::duplicateContentMsg());
        } elseif ($sShortDescription !== '' && !$this->tableExists(self::EXTRAS_TABLE)) {
            \PFBC\Form::setError('form_msg', t('Short descriptions need the SharedChemistry forum extras table before they can be saved.'));
        } elseif (!empty($aPhotos) && !$this->tableExists(self::PHOTOS_TABLE)) {
            \PFBC\Form::setError('form_msg', t('Discussion photos need the SharedChemistry forum photo table before they can be saved.'));
        } elseif (!$this->validatePhotos($aPhotos)) {
            // validatePhotos sets the form error.
        } else {
            if (!$oForumModel->addTopic($iProfileId, $iForumId, $sTitle, $sMessage, $sCurrentTime)) {
                \PFBC\Form::setError('form_msg', t('The discussion could not be created. Please try again.'));
                unset($oForumModel);
                return;
            }

            $iTopicId = (int)Db::getInstance()->lastInsertId();
            $this->saveShortDescription($iTopicId, $sShortDescription, $sCurrentTime);
            $this->savePhotos($iTopicId, $iProfileId, $aPhotos, $sCurrentTime);

            $this->redirectUserToTopicPost($iForumId, $sTitle, $iTopicId);
        }
        unset($oForumModel);
    }

    /**
     * @param int $iForumId
     * @param string $sTopicTitle
     * @param int $iTopicId
     *
     * @throws Framework\File\IOException
     */
    private function redirectUserToTopicPost($iForumId, $sTopicTitle, $iTopicId)
    {
        Header::redirect(
            Uri::get(
                'forum',
                'forum',
                'post',
                $this->httpRequest->get('forum_name') . ',' . $iForumId . ',' . $sTopicTitle . ',' . $iTopicId
            ),
            t('Discussion posted!')
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

    private function saveShortDescription($iTopicId, $sShortDescription, $sCurrentTime)
    {
        if ($sShortDescription === '') {
            return;
        }

        $rStmt = Db::getInstance()->prepare(
            'INSERT INTO' . Db::prefix(self::EXTRAS_TABLE) .
            '(topic_id, short_description, created_at, updated_at) VALUES(:topicId, :shortDescription, :createdAt, :updatedAt)'
        );
        $rStmt->bindValue(':topicId', $iTopicId, PDO::PARAM_INT);
        $rStmt->bindValue(':shortDescription', $sShortDescription, PDO::PARAM_STR);
        $rStmt->bindValue(':createdAt', $sCurrentTime, PDO::PARAM_STR);
        $rStmt->bindValue(':updatedAt', $sCurrentTime, PDO::PARAM_STR);
        $rStmt->execute();
        Db::free($rStmt);
    }

    private function savePhotos($iTopicId, $iProfileId, array $aPhotos, $sCurrentTime)
    {
        if (empty($aPhotos)) {
            return;
        }

        $sDir = $this->getTopicPhotoDir($iTopicId);
        (new File)->createDir($sDir);

        foreach ($aPhotos as $aPhoto) {
            $sExt = strtolower((string)pathinfo($aPhoto['name'], PATHINFO_EXTENSION));
            $sFileName = $this->generatePhotoFilename($sExt);
            $sPublicPath = $this->getTopicPhotoPublicPath($iTopicId, $sFileName);

            if (!move_uploaded_file($aPhoto['tmp_name'], $sDir . $sFileName)) {
                \PFBC\Form::setError('form_msg', t('One of the discussion photos could not be saved.'));
                continue;
            }

            $rStmt = Db::getInstance()->prepare(
                'INSERT INTO' . Db::prefix(self::PHOTOS_TABLE) .
                '(topic_id, member_id, filename, original_name, mime_type, file_size, public_path, created_at) ' .
                'VALUES (:topicId, :memberId, :filename, :originalName, :mimeType, :fileSize, :publicPath, :createdAt)'
            );
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
            \PFBC\Form::setError('form_msg', t('Please upload no more than 5 discussion photos.'));
            return false;
        }

        foreach ($aPhotos as $aPhoto) {
            if (!is_uploaded_file($aPhoto['tmp_name'])) {
                \PFBC\Form::setError('form_msg', t('One of the selected photos could not be uploaded.'));
                return false;
            }

            if ((int)$aPhoto['size'] > self::MAX_PHOTO_BYTES) {
                \PFBC\Form::setError('form_msg', t('Discussion photos must be 5MB or smaller.'));
                return false;
            }

            $sExt = strtolower((string)pathinfo($aPhoto['name'], PATHINFO_EXTENSION));
            if (!in_array($sExt, $this->aAllowedExtensions, true)) {
                \PFBC\Form::setError('form_msg', t('Please upload JPG, PNG, or WebP discussion photos.'));
                return false;
            }

            $sMimeType = $this->detectMimeType($aPhoto['tmp_name']);
            if ($sMimeType !== '' && !in_array($sMimeType, $this->aAllowedMimeTypes, true)) {
                \PFBC\Form::setError('form_msg', t('Please upload valid image files only.'));
                return false;
            }
        }

        return true;
    }

    private function getUploadedPhotos()
    {
        if (empty($_FILES['topic_photos']) || empty($_FILES['topic_photos']['name'])) {
            return [];
        }

        $aPhotos = [];
        foreach ((array)$_FILES['topic_photos']['name'] as $iIndex => $sName) {
            if ((string)$sName === '') {
                continue;
            }

            $aPhotos[] = [
                'name' => (string)$sName,
                'type' => isset($_FILES['topic_photos']['type'][$iIndex]) ? (string)$_FILES['topic_photos']['type'][$iIndex] : '',
                'tmp_name' => isset($_FILES['topic_photos']['tmp_name'][$iIndex]) ? (string)$_FILES['topic_photos']['tmp_name'][$iIndex] : '',
                'error' => isset($_FILES['topic_photos']['error'][$iIndex]) ? (int)$_FILES['topic_photos']['error'][$iIndex] : UPLOAD_ERR_NO_FILE,
                'size' => isset($_FILES['topic_photos']['size'][$iIndex]) ? (int)$_FILES['topic_photos']['size'][$iIndex] : 0
            ];
        }

        return array_filter($aPhotos, function ($aPhoto) {
            return (int)$aPhoto['error'] !== UPLOAD_ERR_NO_FILE;
        });
    }

    private function getTopicPhotoDir($iTopicId)
    {
        return PH7_PATH_ROOT . 'data' . PH7_DS . 'sharedchemistry' . PH7_DS . 'forum-topic-photos' . PH7_DS . $iTopicId . PH7_DS;
    }

    private function getTopicPhotoPublicPath($iTopicId, $sFileName)
    {
        return 'data/sharedchemistry/forum-topic-photos/' . $iTopicId . '/' . rawurlencode($sFileName);
    }

    private function generatePhotoFilename($sExt)
    {
        try {
            $sRandom = bin2hex(random_bytes(16));
        } catch (\Exception $oException) {
            $sRandom = sha1(uniqid('', true) . mt_rand());
        }

        return 'discussion-' . $sRandom . '.' . $sExt;
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
