<?php
/**
 * SharedChemistry isolated public member gallery controller.
 */

namespace PH7;

use PH7\Datatype\Type;
use PH7\Framework\File\File;
use PH7\Framework\Image\FileStorage as FileStorageImage;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Security\CSRF\Token as CSRFToken;
use PH7\Framework\Url\Header;
use PH7\Framework\Util\Various;

class MainController extends Controller
{
    const MAX_IMAGE_WIDTH = 2500;
    const MAX_IMAGE_HEIGHT = 2500;
    const MAX_TITLE_LENGTH = 120;
    const MAX_CAPTION_LENGTH = 500;
    const MAX_COMMENT_LENGTH = 500;
    const IMAGE_DIR = 'sc-gallery/img/';
    const ALLOWED_EXTENSIONS = ['jpg', 'jpeg', 'png', 'webp'];

    /** @var GalleryModel */
    private $oGalleryModel;

    public function __construct()
    {
        parent::__construct();

        $this->oGalleryModel = new GalleryModel();
    }

    public function index(): void
    {
        $sDiagStage = (string)$this->httpRequest->get('diag');
        if ($sDiagStage !== '') {
            $this->runDiagnosticStage($sDiagStage);
        }

        try {
            $aPhotos = $this->oGalleryModel->getPhotos();
            $this->handlePost();
            $aPhotos = $this->oGalleryModel->getPhotos();
        } catch (\Exception $oException) {
            $aPhotos = [];
            $this->view->gallery_error = t('The shared gallery database tables are not installed yet.');
        }

        $iSelectedPhotoId = $this->httpRequest->get('photo_id', Type::INTEGER);
        $oSelectedPhoto = $this->selectPhoto($aPhotos, $iSelectedPhotoId);
        $aComments = [];

        if ($oSelectedPhoto) {
            try {
                $aComments = $this->oGalleryModel->getComments((int)$oSelectedPhoto->photoId);
            } catch (\Exception $oException) {
                $this->view->gallery_error = t('The shared gallery database tables are not installed yet.');
            }
        }

        $this->view->page_title = $this->view->h1_title = $this->view->h2_title = t('Shared Photo Gallery');
        $this->view->meta_description = t('Shared member photo gallery for signed-in SharedChemistry members.');
        $this->view->photos = $aPhotos;
        $this->view->selected_photo = $oSelectedPhoto;
        $this->view->comments = $aComments;
        $this->view->avatarDesign = new AvatarDesignCore();
        $this->view->csrf_token = (new CSRFToken)->generate('sc_gallery');
        $this->view->image_base_url = PH7_URL_DATA_SYS_MOD . self::IMAGE_DIR;

        $this->output();
    }

    private function runDiagnosticStage(string $sStage): void
    {
        header('Content-Type: text/plain; charset=UTF-8');
        echo "stage=" . $sStage . "\n";

        try {
            switch ($sStage) {
                case '1':
                    echo "sc-gallery controller reached\n";
                    echo "member_id=" . (string)$this->session->get('member_id') . "\n";
                    break;

                case 'model':
                    $oGalleryModel = new GalleryModel();
                    $aPhotos = $oGalleryModel->getPhotos();
                    echo "photos_count=" . count($aPhotos) . "\n";
                    break;

                case 'csrf':
                    $sToken = (new CSRFToken())->generate('sc_gallery');
                    echo "token_generated=" . ($sToken !== '' ? 'YES' : 'NO') . "\n";
                    break;

                case 'avatar':
                    $oAvatarDesign = new AvatarDesignCore();
                    echo "avatar_design_class=" . get_class($oAvatarDesign) . "\n";
                    break;

                case 'view':
                    $aPhotos = $this->oGalleryModel->getPhotos();
                    $iSelectedPhotoId = $this->httpRequest->get('photo_id', Type::INTEGER);
                    $oSelectedPhoto = $this->selectPhoto($aPhotos, $iSelectedPhotoId);
                    $aComments = [];

                    if ($oSelectedPhoto) {
                        $aComments = $this->oGalleryModel->getComments((int)$oSelectedPhoto->photoId);
                    }

                    $this->view->page_title = $this->view->h1_title = $this->view->h2_title = t('Shared Photo Gallery');
                    $this->view->meta_description = t('Shared member photo gallery for signed-in SharedChemistry members.');
                    $this->view->photos = $aPhotos;
                    $this->view->selected_photo = $oSelectedPhoto;
                    $this->view->comments = $aComments;
                    $this->view->avatarDesign = new AvatarDesignCore();
                    $this->view->csrf_token = (new CSRFToken())->generate('sc_gallery');
                    $this->view->image_base_url = PH7_URL_DATA_SYS_MOD . self::IMAGE_DIR;
                    echo "view variables set\n";
                    break;

                default:
                    echo "unknown diagnostic stage\n";
                    break;
            }

            echo "OK\n";
        } catch (\Throwable $oThrowable) {
            echo "ERROR\n";
            echo "exception_class=" . get_class($oThrowable) . "\n";
            echo "exception_message=" . $oThrowable->getMessage() . "\n";
            echo "file=" . $oThrowable->getFile() . "\n";
            echo "line=" . $oThrowable->getLine() . "\n";
        }

        exit;
    }

    private function handlePost(): void
    {
        if (!$this->httpRequest->postExists('sc_gallery_action')) {
            return;
        }

        if (!(new CSRFToken())->check('sc_gallery', $this->httpRequest->post('security_token'))) {
            $this->view->gallery_error = t('The form security token expired. Please try again.');
            return;
        }

        if ($this->httpRequest->post('sc_gallery_action') === 'upload') {
            $this->handleUpload();
            return;
        }

        if ($this->httpRequest->post('sc_gallery_action') === 'comment') {
            $this->handleComment();
        }
    }

    private function handleUpload(): void
    {
        if (empty($_FILES['photo']['tmp_name']) || !is_uploaded_file($_FILES['photo']['tmp_name'])) {
            $this->view->gallery_error = t('Please choose an image to upload.');
            return;
        }

        $oImage = new FileStorageImage($_FILES['photo']['tmp_name'], self::MAX_IMAGE_WIDTH, self::MAX_IMAGE_HEIGHT);
        if (!$oImage->validate()) {
            $this->view->gallery_error = Form::wrongImgFileTypeMsg();
            return;
        }

        $sExtension = strtolower($oImage->getExt());
        if (!in_array($sExtension, self::ALLOWED_EXTENSIONS, true)) {
            $this->view->gallery_error = t('Please upload a JPG, PNG, or WebP image.');
            return;
        }

        $sUploadPath = PH7_PATH_PUBLIC_DATA_SYS_MOD . self::IMAGE_DIR;
        (new File())->createDir($sUploadPath);

        $sFileName = 'sc-gallery-' . Various::genRnd('', 18) . PH7_DOT . $sExtension;
        $oImage->save($sUploadPath . $sFileName);

        $sNow = $this->dateTime->get()->dateTime('Y-m-d H:i:s');
        $this->oGalleryModel->addPhoto(
            (int)$this->session->get('member_id'),
            $this->cleanText((string)$this->httpRequest->post('title'), self::MAX_TITLE_LENGTH),
            $this->cleanText((string)$this->httpRequest->post('caption'), self::MAX_CAPTION_LENGTH),
            $sFileName,
            self::IMAGE_DIR . $sFileName,
            $sNow
        );

        Header::redirect($this->galleryUrl(), t('Photo uploaded to the shared gallery.'));
    }

    private function handleComment(): void
    {
        $iPhotoId = $this->httpRequest->post('photo_id', Type::INTEGER);
        $sComment = $this->cleanText((string)$this->httpRequest->post('comment'), self::MAX_COMMENT_LENGTH);

        if ($iPhotoId < 1 || $this->oGalleryModel->getPhoto($iPhotoId) === null) {
            $this->view->gallery_error = t('Please choose a gallery photo before commenting.');
            return;
        }

        if ($sComment === '') {
            $this->view->gallery_error = t('Please write a comment before posting.');
            return;
        }

        $this->oGalleryModel->addComment(
            $iPhotoId,
            (int)$this->session->get('member_id'),
            $sComment,
            $this->dateTime->get()->dateTime('Y-m-d H:i:s')
        );

        Header::redirect($this->galleryUrl($iPhotoId), t('Comment posted!'));
    }

    private function selectPhoto(array $aPhotos, int $iSelectedPhotoId): ?object
    {
        if (empty($aPhotos)) {
            return null;
        }

        foreach ($aPhotos as $oPhoto) {
            if ((int)$oPhoto->photoId === $iSelectedPhotoId) {
                return $oPhoto;
            }
        }

        return $aPhotos[0];
    }

    private function cleanText(string $sText, int $iMaxLength): string
    {
        $sText = trim(strip_tags($sText));
        $sText = preg_replace('/\s+/', ' ', $sText);

        if (function_exists('mb_substr')) {
            return mb_substr($sText, 0, $iMaxLength);
        }

        return substr($sText, 0, $iMaxLength);
    }

    private function galleryUrl(int $iPhotoId = 0): string
    {
        $sUrl = PH7_URL_ROOT . 'photo-gallery';

        return $iPhotoId > 0 ? $sUrl . '?photo_id=' . $iPhotoId : $sUrl;
    }
}
