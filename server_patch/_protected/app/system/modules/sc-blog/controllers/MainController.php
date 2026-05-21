<?php
/**
 * SharedChemistry public blog controller.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

class MainController extends Controller
{
    private const POSTS_PER_PAGE = 12;

    private BlogPostModel $oBlogPostModel;

    public function __construct()
    {
        parent::__construct();

        $this->oBlogPostModel = new BlogPostModel();
    }

    public function index(): void
    {
        try {
            $aPosts = $this->oBlogPostModel->getPublishedPosts(self::POSTS_PER_PAGE);
            $iTotalPosts = $this->oBlogPostModel->countPublishedPosts();
            $this->view->blog_error = '';
        } catch (\Exception $oException) {
            $aPosts = [];
            $iTotalPosts = 0;
            $this->view->blog_error = t('The SharedChemistry blog is not ready yet.');
        }

        $this->view->page_title = $this->view->h1_title = t('SharedChemistry Blog');
        $this->view->meta_description = t('Latest articles, updates, and guidance from SharedChemistry.');
        $this->view->posts = $this->preparePosts($aPosts);
        $this->view->total_posts = $iTotalPosts;
        $this->output();
    }

    public function read(string $sSlug = ''): void
    {
        $sSlug = $this->sanitizeSlug($sSlug ?: (string)$this->httpRequest->get('slug'));
        $oPost = null;

        if ($sSlug !== '') {
            try {
                $oPost = $this->oBlogPostModel->getPublishedPostBySlug($sSlug);
            } catch (\Exception $oException) {
                $this->view->blog_error = t('The SharedChemistry blog is not ready yet.');
            }
        }

        if ($oPost === null) {
            $this->view->page_title = $this->view->h1_title = t('Article Not Found');
            $this->view->meta_description = t('The requested SharedChemistry blog article is unavailable.');
            $this->view->article = null;
            $this->view->article_content = '';
            $this->view->blog_error = !empty($this->view->blog_error) ? $this->view->blog_error : t('This article is not available.');
            $this->output();

            return;
        }

        $this->view->page_title = !empty($oPost->meta_title) ? $oPost->meta_title : $oPost->title;
        $this->view->h1_title = $oPost->title;
        $this->view->meta_description = !empty($oPost->meta_description) ? $oPost->meta_description : $oPost->excerpt;
        $this->view->article = $this->preparePost($oPost);
        $this->view->article_content = $this->sanitizeArticleHtml((string)$oPost->content);
        $this->view->blog_error = '';
        $this->output();
    }

    private function preparePosts(array $aPosts): array
    {
        return array_map([$this, 'preparePost'], $aPosts);
    }

    private function preparePost(object $oPost): object
    {
        $oPost->blogUrl = PH7_URL_ROOT . 'blog/' . rawurlencode((string)$oPost->slug);
        $oPost->displayDate = !empty($oPost->published_at) ? date('F j, Y', strtotime((string)$oPost->published_at)) : '';
        $oPost->excerpt = trim((string)$oPost->excerpt);

        if ($oPost->excerpt === '') {
            $oPost->excerpt = trim(strip_tags((string)$oPost->content));
            if (strlen($oPost->excerpt) > 180) {
                $oPost->excerpt = substr($oPost->excerpt, 0, 177) . '...';
            }
        }

        return $oPost;
    }

    private function sanitizeSlug(string $sSlug): string
    {
        $sSlug = strtolower(trim($sSlug));
        $sSlug = preg_replace('/[^a-z0-9_-]+/', '', $sSlug);

        return is_string($sSlug) ? $sSlug : '';
    }

    private function sanitizeArticleHtml(string $sContent): string
    {
        $sContent = preg_replace('#<(script|style|iframe|object|embed|form)[^>]*>.*?</\\1>#is', '', $sContent);
        $sContent = preg_replace('/\\son[a-z]+\\s*=\\s*("[^"]*"|\'[^\']*\'|[^\\s>]+)/i', '', $sContent);
        $sContent = preg_replace('/\\s(href|src)\\s*=\\s*([\"\'])\\s*javascript:[^\"\']*\\2/i', ' $1="#"', $sContent);

        $sAllowedTags = '<p><br><strong><b><em><i><u><ul><ol><li><blockquote><h2><h3><h4><a><img><figure><figcaption><pre><code>';

        return strip_tags(is_string($sContent) ? $sContent : '', $sAllowedTags);
    }
}
