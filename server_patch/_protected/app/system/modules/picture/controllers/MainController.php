<?php

namespace PH7;

use PH7\Datatype\Type;
use PH7\Framework\Analytics\Statistic;
use PH7\Framework\File\File;
use PH7\Framework\Http\Http;
use PH7\Framework\Image\FileStorage as FileStorageImage;
use PH7\Framework\Mvc\Model\DbConfig;
use PH7\Framework\Mvc\Router\Uri;
use PH7\Framework\Navigation\Page;
use PH7\Framework\Security\Ban\Ban;
use PH7\Framework\Security\CSRF\Token as CSRFToken;
use PH7\Framework\Security\Moderation\Filter;
use PH7\Framework\Url\Header;
use PH7\Framework\Util\Various;
use PH7\JustHttp\StatusCode;
use stdClass;

class MainController extends Controller
{
    use ImageTaggable;

    const ALBUMS_PER_PAGE = 16;
    const PHOTOS_PER_PAGE = 10;
    const MAX_IMAGE_WIDTH = 2500;
    const MAX_IMAGE_HEIGHT = 2500;
    const PICTURE2_SIZE = 400;
    const PICTURE3_SIZE = 600;
    const PICTURE4_SIZE = 800;
    const PICTURE5_SIZE = 1000;
    const PICTURE6_SIZE = 1200;
    const MAX_PUBLIC_GALLERY_COMMENT_LENGTH = 500;

    private $oPictureModel;
    private $oPage;
    private $sUsername;
    private $iProfileId;
    private $sTitle;
    private $iTotalPictures;

    public function __construct()
    {
        parent::__construct();

        $this->oPictureModel = new PictureModel;
        $this->oPage = new Page;
        $this->sUsername = $this->httpRequest->get('username');
        $this->view->member_id = $this->session->get('member_id');
        $this->iProfileId = (new UserCoreModel)->getId(null, $this->sUsername);
        $this->view->meta_keywords = t('picture,photo,pictures,photos,album,albums,photo album,picture album,gallery,picture dating');
    }

    public function index()
    {
        $this->handlePublicGalleryPost();

        $aPhotos = $this->oPictureModel->getPublicGalleryPhotos();
        $iSelectedPhotoId = $this->httpRequest->get('selected_photo_id', Type::INTEGER);
        $oSelectedPhoto = $this->selectPublicGalleryPhoto($aPhotos, $iSelectedPhotoId);

        $this->view->page_title = $this->view->h1_title = $this->view->h2_title = t('Shared Photo Gallery');
        $this->view->meta_description = t('Shared member photo gallery for signed-in SharedChemistry members.');
        $this->view->photos = $aPhotos;
        $this->view->selected_photo = $oSelectedPhoto;
        $this->view->comments = $oSelectedPhoto ? $this->oPictureModel->getPublicGalleryComments((int)$oSelectedPhoto->pictureId) : [];
        $this->view->avatarDesign = new AvatarDesignCore();
        $this->view->csrf_token = (new CSRFToken)->generate('public_gallery');

        $this->manualTplInclude('index.tpl');
        $this->output();
    }

    public function addAlbum()
    {
        $this->view->page_title = $this->view->h2_title = t('Add a new Album');
        $this->output();
    }

    public function addPhoto()
    {
        $this->view->page_title = $this->view->h2_title = t('Add some Photos');
        $this->output();
    }

    public function editAlbum()
    {
        $this->view->page_title = $this->view->h2_title = t('Edit Album');
        $this->output();
    }

    public function editPhoto()
    {
        $this->view->page_title = $this->view->h2_title = t('Edit Photo');
        $this->output();
    }

    public function albums()
    {
        $iProfileId = $this->httpRequest->getExists('username') ? $this->iProfileId : null;
        $this->view->total_pages = $this->oPage->getTotalPages(
            $this->oPictureModel->totalAlbums($iProfileId),
            self::ALBUMS_PER_PAGE
        );
        $this->view->current_page = $this->oPage->getCurrentPage();
        $oAlbums = $this->oPictureModel->album(
            $iProfileId,
            null,
            '1',
            $this->oPage->getFirstItem(),
            $this->oPage->getNbItemsPerPage()
        );

        $this->view->is_add_album_btn_shown = $this->httpRequest->get('show_add_album_btn', 'bool');

        if (empty($oAlbums)) {
            $this->sTitle = t('Oops! Nothing here for the moment.');
            $this->notFound(false);
        } else {
            $this->sTitle = !empty($iProfileId) ? t("The %0%'s photo album", $this->design->getProfileLink($this->sUsername, false)) : t('Photo Gallery Community');
            $this->view->page_title = $this->view->h2_title = $this->sTitle;
            $this->view->meta_description = t("%0%'s Albums | Photo Albums of the Dating Social Community - %site_name%", $this->sUsername);
            $this->view->albums = $oAlbums;
        }

        if (empty($iProfileId)) {
            $this->manualTplInclude('index.tpl');
        }

        $this->output();
    }

    public function album()
    {
        $this->view->total_pages = $this->oPage->getTotalPages(
            $this->oPictureModel->totalPhotos($this->iProfileId),
            self::ALBUMS_PER_PAGE
        );
        $this->view->current_page = $this->oPage->getCurrentPage();
        $oAlbum = $this->oPictureModel->photo(
            $this->iProfileId,
            $this->httpRequest->get('album_id', Type::INTEGER),
            null,
            1,
            $this->oPage->getFirstItem(),
            $this->oPage->getNbItemsPerPage()
        );

        if (empty($oAlbum)) {
            $this->sTitle = t('Album not found or still in pending approval.');
            $this->notFound();
        } else {
            $this->sTitle = t("%0%'s photo album", $this->design->getProfileLink($this->sUsername, false));
            $this->view->page_title = $this->view->h2_title = $this->sTitle;
            $this->view->meta_description = t("Browse %0%'s Photos | Photo Album Social Community - %site_name%", $this->sUsername);
            $this->view->album = $oAlbum;
        }

        $this->output();
    }

    public function photo()
    {
        $oPicture = $this->oPictureModel->photo(
            $this->iProfileId,
            $this->httpRequest->get('album_id', Type::INTEGER),
            $this->httpRequest->get('picture_id', Type::INTEGER),
            1,
            0,
            1
        );

        if (empty($oPicture)) {
            $this->sTitle = t('Photo not found or still in pending approval.');
            $this->notFound();
        } else {
            $this->sTitle = t("%0%'s photo", $this->design->getProfileLink($this->sUsername, false));
            $sTitle = Ban::filterWord($oPicture->title, false);
            $this->view->page_title = t("%0%'s photo, %1%", $oPicture->firstName, $sTitle);
            $this->view->meta_description = t("%0%'s photo, %1%, %2%", $oPicture->firstName, $sTitle, substr(Ban::filterWord($oPicture->description, false), 0, 100));
            $this->view->meta_keywords = t('picture,photo,pictures,photos,album,albums,photo album,picture album,gallery,%0%,%1%,%2%', str_replace(' ', ',', $sTitle), $oPicture->firstName, $oPicture->username);
            $this->view->h1_title = $this->sTitle;
            $this->view->picture = $oPicture;
            $this->imageToSocialMetaTags($oPicture);
            Statistic::setView($oPicture->pictureId, DbTableName::PICTURE);
        }

        $this->output();
    }

    public function deletePhoto()
    {
        $iPictureId = $this->httpRequest->post('picture_id', Type::INTEGER);
        CommentCoreModel::deleteRecipient($iPictureId, 'picture');
        $this->oPictureModel->deletePhoto(
            $this->session->get('member_id'),
            $this->httpRequest->post('album_id', Type::INTEGER),
            $iPictureId
        );

        (new Picture)->deletePhoto(
            $this->httpRequest->post('album_id'),
            $this->session->get('member_username'),
            $this->httpRequest->post('picture_link')
        );

        Picture::clearCache();
        Header::redirect(
            Uri::get(
                'picture',
                'main',
                'album',
                $this->session->get('member_username') . ',' . $this->httpRequest->post('album_title') . ',' . $this->httpRequest->post('album_id')
            ),
            t('Your photo has been removed.')
        );
    }

    public function deleteAlbum()
    {
        $this->oPictureModel->deletePhoto($this->session->get('member_id'), $this->httpRequest->post('album_id', Type::INTEGER));
        $this->oPictureModel->deleteAlbum($this->session->get('member_id'), $this->httpRequest->post('album_id', Type::INTEGER));
        $sDir = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'picture/img/' . $this->session->get('member_username') . PH7_DS . $this->httpRequest->post('album_id') . PH7_DS;
        $this->file->deleteDir($sDir);
        Picture::clearCache();
        Header::redirect(Uri::get('picture', 'main', 'albums'), t('Your album has been removed.'));
    }

    public function search()
    {
        $this->view->page_title = $this->view->h2_title = t('Photo Search - Looking for a photo');
        $this->output();
    }

    public function result()
    {
        $this->iTotalPictures = $this->oPictureModel->search(
            $this->httpRequest->get('looking'),
            true,
            $this->httpRequest->get('order'),
            $this->httpRequest->get('sort'),
            null,
            null
        );
        $this->view->total_pages = $this->oPage->getTotalPages($this->iTotalPictures, self::PHOTOS_PER_PAGE);
        $this->view->current_page = $this->oPage->getCurrentPage();
        $oSearch = $this->oPictureModel->search(
            $this->httpRequest->get('looking'),
            false,
            $this->httpRequest->get('order'),
            $this->httpRequest->get('sort'),
            $this->oPage->getFirstItem(),
            $this->oPage->getNbItemsPerPage()
        );

        if (empty($oSearch)) {
            $this->sTitle = t('Sorry, Your search returned no results!');
            $this->notFound();
        } else {
            $this->sTitle = t('Dating Social Picture - Your search returned');
            $this->view->page_title = $this->sTitle;
            $this->view->h3_title = nt('%n% photo found!', '%n% photos found!', $this->iTotalPictures);
            $this->view->meta_description = t('Search - %site_name% is a Dating Social Photo Community!');
            $this->view->meta_keywords = t('search,picture,photo, photo gallery,dating,social network,community,music,movie,news,picture sharing');
            $this->view->h2_title = $this->sTitle;
            $this->view->album = $oSearch;
        }

        $this->manualTplInclude('album.tpl');
        $this->output();
    }

    protected function imageToSocialMetaTags(stdClass $oPicture): void
    {
        $sFilename = str_replace('original', '600', $oPicture->file);
        $sImageUrl = PH7_URL_DATA_SYS_MOD . 'picture/img/' . $oPicture->username . '/' . $oPicture->albumId . '/' . $sFilename;
        $this->view->image_social_meta_tag = $sImageUrl;
    }

    private function handlePublicGalleryPost(): void
    {
        if (!$this->httpRequest->postExists('public_gallery_action')) {
            return;
        }

        if (!(new CSRFToken)->check('public_gallery', $this->httpRequest->post('security_token'))) {
            $this->view->gallery_error = t('The form security token expired. Please try again.');
            return;
        }

        if ($this->httpRequest->post('public_gallery_action') === 'upload') {
            $this->handlePublicGalleryUpload();
            return;
        }

        if ($this->httpRequest->post('public_gallery_action') === 'comment') {
            $this->handlePublicGalleryComment();
        }
    }

    private function handlePublicGalleryUpload(): void
    {
        if (empty($_FILES['photo']['tmp_name']) || !is_uploaded_file($_FILES['photo']['tmp_name'])) {
            $this->view->gallery_error = t('Please choose an image to upload.');
            return;
        }

        $oOriginal = new FileStorageImage($_FILES['photo']['tmp_name'], self::MAX_IMAGE_WIDTH, self::MAX_IMAGE_HEIGHT);
        if (!$oOriginal->validate()) {
            $this->view->gallery_error = Form::wrongImgFileTypeMsg();
            return;
        }

        $iProfileId = (int)$this->session->get('member_id');
        $sUsername = (string)$this->session->get('member_username');
        $sNow = $this->dateTime->get()->dateTime('Y-m-d H:i:s');
        $iAlbumId = $this->oPictureModel->getOrCreatePublicGalleryAlbumId($iProfileId, $sNow);
        $sApproved = DbConfig::getSetting('pictureManualApproval') == 0 ? '1' : '0';

        if ($sApproved === '1' && DbConfig::getSetting('nudityFilter') && Filter::isNudity($_FILES['photo']['tmp_name'])) {
            $sApproved = '0';
        }

        $aSizedImages = [
            self::PICTURE2_SIZE => clone $oOriginal,
            self::PICTURE3_SIZE => clone $oOriginal,
            self::PICTURE4_SIZE => clone $oOriginal,
            self::PICTURE5_SIZE => clone $oOriginal,
            self::PICTURE6_SIZE => clone $oOriginal
        ];

        foreach ($aSizedImages as $iSize => $oImage) {
            $oImage->square($iSize);
        }

        $sWatermarkText = DbConfig::getSetting('watermarkTextImage');
        if (!empty(trim((string)$sWatermarkText))) {
            $iSizeWatermarkText = DbConfig::getSetting('sizeWatermarkTextImage');
            $oOriginal->watermarkText($sWatermarkText, $iSizeWatermarkText);
            foreach ($aSizedImages as $oImage) {
                $oImage->watermarkText($sWatermarkText, $iSizeWatermarkText);
            }
        }

        $sPath = PH7_PATH_PUBLIC_DATA_SYS_MOD . 'picture/img/' . $sUsername . PH7_DS . $iAlbumId . PH7_DS;
        (new File)->createDir($sPath);

        $sFileName = Various::genRnd($oOriginal->getFileName(), 20);
        $sFileOriginal = $sFileName . '-original.' . $oOriginal->getExt();
        $oOriginal->save($sPath . $sFileOriginal);

        foreach ($aSizedImages as $iSize => $oImage) {
            $oImage->save($sPath . $sFileName . '-' . $iSize . PH7_DOT . $oImage->getExt());
        }

        $sTitle = trim(strip_tags((string)$this->httpRequest->post('title')));
        if ($sTitle === '') {
            $sTitle = $this->getTitleFromUploadedFile($oOriginal);
        }

        $this->oPictureModel->addPhoto(
            $iProfileId,
            $iAlbumId,
            MediaCore::cleanTitle($sTitle),
            '',
            $sFileOriginal,
            $sNow,
            $sApproved
        );
        $this->oPictureModel->updateAlbumThumb($iProfileId, $iAlbumId, $sFileOriginal, $sNow);
        Picture::clearCache();

        $sMessage = $sApproved === '1' ? t('Photo uploaded to the shared gallery.') : t('Your photo was uploaded and is awaiting moderator approval.');
        Header::redirect(Uri::get('picture', 'main', 'index'), $sMessage);
    }

    private function handlePublicGalleryComment(): void
    {
        $iPictureId = $this->httpRequest->post('picture_id', Type::INTEGER);
        $sComment = $this->cleanPublicGalleryComment((string)$this->httpRequest->post('comment'));

        if ($iPictureId < 1 || $this->oPictureModel->getPublicGalleryPhoto($iPictureId) === null) {
            $this->view->gallery_error = t('Please choose a gallery photo before commenting.');
            return;
        }

        if ($sComment === '') {
            $this->view->gallery_error = t('Please write a comment before posting.');
            return;
        }

        if (!$this->oPictureModel->addPublicGalleryComment(
            $iPictureId,
            (int)$this->session->get('member_id'),
            $sComment,
            $this->dateTime->get()->dateTime('Y-m-d H:i:s')
        )) {
            $this->view->gallery_error = t('Oops! Error occurred when adding comment.');
            return;
        }

        CommentCore::clearCache();
        Header::redirect(Uri::get('picture', 'main', 'index') . '?selected_photo_id=' . $iPictureId, t('Comment posted!'));
    }

    private function selectPublicGalleryPhoto(array $aPhotos, int $iSelectedPhotoId): ?stdClass
    {
        if (empty($aPhotos)) {
            return null;
        }

        foreach ($aPhotos as $oPhoto) {
            if ((int)$oPhoto->pictureId === $iSelectedPhotoId) {
                return $oPhoto;
            }
        }

        return $aPhotos[0];
    }

    private function cleanPublicGalleryComment(string $sComment): string
    {
        $sComment = trim(strip_tags($sComment));
        $sComment = preg_replace('/\s+/', ' ', $sComment);

        if (function_exists('mb_substr')) {
            return mb_substr($sComment, 0, self::MAX_PUBLIC_GALLERY_COMMENT_LENGTH);
        }

        return substr($sComment, 0, self::MAX_PUBLIC_GALLERY_COMMENT_LENGTH);
    }

    private function getTitleFromUploadedFile(FileStorageImage $oPicture): string
    {
        return $this->str->upperFirst(
            str_replace(
                ['-', '_'],
                ' ',
                str_ireplace(PH7_DOT . $oPicture->getExt(), '', escape($_FILES['photo']['name'], true))
            )
        );
    }

    private function notFound($b404Status = true)
    {
        if ($b404Status === true) {
            Http::setHeadersByCode(StatusCode::NOT_FOUND);
        }

        $sErrMsg = '';
        if ($b404Status === true) {
            $sErrMsg = '<br />' . t('Please return to <a href="%0%">the previous page</a> or <a href="%1%">add new photos</a> in this album.', 'javascript:history.back();', Uri::get('picture', 'main', 'addphoto', $this->httpRequest->get('album_id')));
        }

        $this->view->page_title = $this->view->h2_title = $this->sTitle;
        $this->view->error = $this->sTitle . $sErrMsg;
    }
}
