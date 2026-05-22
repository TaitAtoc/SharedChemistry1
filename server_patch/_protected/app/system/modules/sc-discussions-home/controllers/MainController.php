<?php
/**
 * SharedChemistry clean discussions home controller.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

class MainController extends Controller
{
    private const TOPICS_PER_PAGE = 20;

    private DiscussionHomeModel $oDiscussionHomeModel;

    public function __construct()
    {
        parent::__construct();

        $this->oDiscussionHomeModel = new DiscussionHomeModel();
    }

    public function index(): void
    {
        // SC_DISCUSSIONS_HOME_CONTROLLER_V1_ACTIVE
        $this->view->page_title = t('Discussion Board | %site_name%');
        $this->view->meta_description = t('Community Discussion Board - %site_name%');
        $this->view->h1_title = t('Discussions - %site_name%');
        $this->view->sc_discussion_topics = $this->oDiscussionHomeModel->getRecentDiscussions(self::TOPICS_PER_PAGE);
        $this->view->sc_start_forum = $this->oDiscussionHomeModel->getDefaultStartForum();

        $this->output();
    }
}
