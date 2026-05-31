<?php
/**
 * SharedChemistry public articles controller.
 */

namespace PH7;

defined('PH7') or exit('Restricted access');

class MainController extends Controller
{
    private const FEATURED_SLUG = 'best-swinger-apps-for-couples';

    public function index(): void
    {
        $this->view->page_title = $this->view->h1_title = t('SharedChemistry Articles');
        $this->view->meta_description = t('Public articles from SharedChemistry about privacy, safer connections, and thoughtful community guidance for couples.');
        $this->view->featured_article = $this->featuredArticle();
        $this->view->articles = $this->placeholderArticles();
        $this->output();
    }

    public function read(string $sSlug = ''): void
    {
        $sSlug = $this->sanitizeSlug($sSlug ?: (string)$this->httpRequest->get('slug'));

        if ($sSlug === self::FEATURED_SLUG) {
            $oArticle = $this->featuredArticle();
            $this->view->page_title = t('Best Swinger Apps for Couples: Privacy, Verification, and Control | SharedChemistry');
            $this->view->h1_title = $oArticle->title;
            $this->view->meta_description = t('Compare what couples should look for in a swingers app, including privacy, verification, couple profiles, private media control, free access, and community quality.');
            $this->view->article = $oArticle;
            $this->output();

            return;
        }

        $this->view->page_title = $this->view->h1_title = t('Article Coming Soon');
        $this->view->meta_description = t('SharedChemistry articles are being prepared and will be published publicly when ready.');
        $this->view->article = null;
        $this->output();
    }

    private function featuredArticle(): object
    {
        return (object)[
            'topic' => t('Swinger apps'),
            'title' => t('Best Swinger Apps for Couples: Privacy, Verification, and Control'),
            'summary' => t('An honest guide to comparing swingers apps and couples dating sites by privacy, verification, couple-focused profiles, private media control, and community fit.'),
            'url' => PH7_URL_ROOT . 'blog/' . self::FEATURED_SLUG,
            'slug' => self::FEATURED_SLUG,
        ];
    }

    private function placeholderArticles(): array
    {
        return [
            (object)[
                'topic' => t('Trust'),
                'title' => t('How to Build Trust Before Meeting Another Couple'),
                'summary' => t('A future guide to setting expectations, taking time with conversation, and choosing a pace that feels comfortable for both couples.'),
                'url' => PH7_URL_ROOT . 'blog/how-to-build-trust-before-meeting-another-couple',
            ],
            (object)[
                'topic' => t('Profiles'),
                'title' => t('What Makes a Good Couples Profile'),
                'summary' => t('A planned article about writing a clear profile, sharing the right public details, and helping compatible couples understand your style.'),
                'url' => PH7_URL_ROOT . 'blog/what-makes-a-good-couples-profile',
            ],
            (object)[
                'topic' => t('Privacy'),
                'title' => t('Privacy and Safety Tips for Couples Dating'),
                'summary' => t('A public overview of privacy-minded habits, safer communication, and practical boundaries before moving into member-only spaces.'),
                'url' => PH7_URL_ROOT . 'blog/privacy-and-safety-tips-for-couples-dating',
            ],
            (object)[
                'topic' => t('Meeting'),
                'title' => t('Planning a First Lifestyle Meet-Up'),
                'summary' => t('A future article about choosing public settings, confirming expectations, and keeping the first meeting calm, respectful, and pressure-free.'),
                'url' => PH7_URL_ROOT . 'blog/planning-a-first-lifestyle-meet-up',
            ],
            (object)[
                'topic' => t('Verification'),
                'title' => t('Understanding Verified Couples on SharedChemistry'),
                'summary' => t('A planned explanation of how verification can support confidence while keeping sensitive member areas protected.'),
                'url' => PH7_URL_ROOT . 'blog/understanding-verified-couples-on-sharedchemistry',
            ],
            (object)[
                'topic' => t('Control'),
                'title' => t('How SharedChemistry Keeps Couples in Control'),
                'summary' => t('A preview of future guidance on privacy choices, member-only tools, and thoughtful controls for couples using SharedChemistry.'),
                'url' => PH7_URL_ROOT . 'blog/how-sharedchemistry-keeps-couples-in-control',
            ],
        ];
    }

    private function sanitizeSlug(string $sSlug): string
    {
        $sSlug = strtolower(trim($sSlug));
        $sSlug = preg_replace('/[^a-z0-9_-]+/', '', $sSlug);

        return is_string($sSlug) ? $sSlug : '';
    }
}
