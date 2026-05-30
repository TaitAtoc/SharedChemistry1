{literal}
<style>
    main#content:has(.sc-blog-page),
    body main#content#content:has(.sc-blog-page) {
        max-width: none !important;
        padding: 0 !important;
        background: #08080b !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top {
        min-height: 104px !important;
        border: 0 !important;
        background: rgba(8, 8, 11, .96) !important;
        box-shadow: 0 12px 34px rgba(0, 0, 0, .28) !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container {
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        gap: 32px !important;
        min-height: 104px !important;
        padding-top: 12px !important;
        padding-bottom: 12px !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) .navbar-header {
        display: flex !important;
        align-items: center !important;
        flex: 0 0 auto !important;
        min-height: 80px !important;
        margin: 0 !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-start !important;
        height: auto !important;
        min-height: 80px !important;
        margin: 0 !important;
        padding: 0 18px 0 0 !important;
        float: none !important;
        line-height: 1 !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-logo-link {
        display: inline-flex !important;
        align-items: center !important;
        width: 300px !important;
        max-width: 32vw !important;
        height: auto !important;
        margin: 0 !important;
        padding: 0 !important;
        transform: none !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-header-logo {
        display: block !important;
        width: 300px !important;
        max-width: 100% !important;
        max-height: none !important;
        height: auto !important;
        margin: 0 !important;
        object-fit: contain !important;
        transform: none !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-end !important;
        flex: 1 1 auto !important;
        min-height: 80px !important;
        margin: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        box-shadow: none !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-end !important;
        gap: 22px !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li {
        display: flex !important;
        align-items: center !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a {
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        min-height: 40px !important;
        margin: 0 !important;
        padding: 10px 16px !important;
        border-radius: 8px !important;
        line-height: 1.2 !important;
        white-space: nowrap !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-join {
        background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
        color: #fff !important;
        box-shadow: 0 12px 30px rgba(236, 8, 104, .25) !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-signin {
        border: 1px solid rgba(255, 188, 10, .44) !important;
        background: rgba(247, 243, 239, .04) !important;
        color: #ffbc0a !important;
    }

    body:has(.sc-blog-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-blog {
        border: 1px solid rgba(247, 243, 239, .14) !important;
        background: rgba(247, 243, 239, .035) !important;
        color: #f7f3ef !important;
    }

    #sc-blog-index-v1,
    #sc-blog-index-v1 * {
        box-sizing: border-box;
    }

    #sc-blog-index-v1 {
        width: 100%;
        overflow: hidden;
        padding: 94px 0 72px;
        background:
            radial-gradient(circle at 18% 5%, rgba(236, 8, 104, .16), transparent 30%),
            radial-gradient(circle at 82% 14%, rgba(255, 188, 10, .11), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    #sc-blog-index-v1 .sc-blog-wrap {
        width: min(1180px, calc(100% - 32px));
        margin: 0 auto;
    }

    #sc-blog-index-v1 a {
        color: inherit;
    }

    #sc-blog-index-v1 .sc-blog-hero,
    #sc-blog-index-v1 .sc-blog-featured,
    #sc-blog-index-v1 .sc-blog-note,
    #sc-blog-index-v1 .sc-blog-card {
        border: 1px solid rgba(247, 243, 239, .09);
        border-radius: 8px;
        background: #17181d;
        box-shadow: 0 16px 34px rgba(0, 0, 0, .24);
    }

    #sc-blog-index-v1 .sc-blog-hero {
        margin-bottom: 22px;
        padding: 28px;
    }

    #sc-blog-index-v1 .sc-blog-featured {
        margin-bottom: 26px;
        padding: 24px;
    }

    #sc-blog-index-v1 .sc-blog-featured h2 {
        max-width: 780px;
        margin: 0 0 12px;
        font-size: 28px;
    }

    #sc-blog-index-v1 h1 {
        margin: 0 0 10px;
        color: #fff;
        font-size: 38px;
        font-weight: 800;
        line-height: 1.12;
    }

    #sc-blog-index-v1 .sc-blog-intro,
    #sc-blog-index-v1 .sc-blog-featured-summary,
    #sc-blog-index-v1 .sc-blog-note p {
        max-width: 760px;
        margin: 0;
        color: #b8b3b0;
        font-size: 16px;
        line-height: 1.55;
    }

    #sc-blog-index-v1 .sc-blog-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 16px;
    }

    #sc-blog-index-v1 .sc-blog-section-title {
        margin: 0 0 14px;
        color: #fff;
        font-size: 24px;
        line-height: 1.2;
    }

    #sc-blog-index-v1 .sc-blog-card {
        display: flex;
        min-width: 0;
        flex-direction: column;
        padding: 20px;
    }

    #sc-blog-index-v1 .sc-blog-topic {
        width: fit-content;
        margin: 0 0 14px;
        padding: 6px 10px;
        border: 1px solid rgba(255, 188, 10, .28);
        border-radius: 999px;
        background: rgba(255, 188, 10, .08);
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        text-transform: uppercase;
    }

    #sc-blog-index-v1 h2 {
        margin: 0;
        color: #fff;
        font-size: 21px;
        line-height: 1.22;
    }

    #sc-blog-index-v1 .sc-blog-summary {
        flex: 1;
        margin: 0;
        color: #cbc4c0;
        font-size: 14px;
        line-height: 1.55;
    }

    #sc-blog-index-v1 .sc-blog-read-more {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: fit-content;
        min-height: 40px;
        margin-top: 4px;
        padding: 10px 16px;
        border-radius: 999px;
        background: #ec0868;
        background-image: linear-gradient(90deg, #ec0868, #c200fb);
        color: #fff;
        font-weight: 800;
        text-decoration: none;
    }

    #sc-blog-index-v1 .sc-blog-read-more:hover,
    #sc-blog-index-v1 .sc-blog-read-more:focus {
        color: #fff;
        text-decoration: none;
    }

    #sc-blog-index-v1 .sc-blog-note {
        margin-top: 18px;
        padding: 28px;
    }

    #sc-blog-index-v1 .sc-blog-public-links {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 16px;
    }

    #sc-blog-index-v1 .sc-blog-public-links a {
        display: inline-flex;
        min-height: 38px;
        align-items: center;
        padding: 8px 12px;
        border: 1px solid rgba(247, 243, 239, .12);
        border-radius: 999px;
        color: #f7f3ef;
        text-decoration: none;
    }

    @media (max-width: 700px) {
        #sc-blog-index-v1 {
            padding: 82px 0 60px;
        }

        #sc-blog-index-v1 .sc-blog-hero {
            padding: 22px;
        }

        #sc-blog-index-v1 .sc-blog-featured {
            padding: 22px;
        }

        #sc-blog-index-v1 h1 {
            font-size: 31px;
        }
    }
</style>
{/literal}

<!-- SC_BLOG_INDEX_V1_ACTIVE -->
<section id="sc-blog-index-v1" class="sc-info-page sc-blog-page">
    <div class="sc-blog-wrap">
        <section class="sc-blog-hero">
            <h1>{lang 'SharedChemistry Articles'}</h1>
            <p class="sc-blog-intro">{lang 'Privacy-minded articles and practical guidance for couples exploring SharedChemistry. This page is public and does not expose member profiles, private media, messages, or dashboard areas.'}</p>
        </section>

        {if !empty($featured_article)}
            <article class="sc-blog-featured">
                <p class="sc-blog-topic">{% escape($featured_article->topic) %}</p>
                <h2>{% escape($featured_article->title) %}</h2>
                <p class="sc-blog-featured-summary">{% escape($featured_article->summary) %}</p>
                <a class="sc-blog-read-more" href="{% $featured_article->url %}">{lang 'Read More'}</a>
            </article>
        {/if}

        <h2 class="sc-blog-section-title">{lang 'Planned Articles'}</h2>
        <section class="sc-blog-grid" aria-label="{lang 'Planned article topics'}">
            {each $article in $articles}
                <article class="sc-blog-card">
                    <p class="sc-blog-topic">{% escape($article->topic) %}</p>
                    <h2>{% escape($article->title) %}</h2>
                    <p class="sc-blog-summary">{% escape($article->summary) %}</p>
                    <a class="sc-blog-read-more" href="{% $article->url %}">{lang 'Read More'}</a>
                </article>
            {/each}
        </section>

        <section class="sc-blog-note" id="articles-coming-soon">
            <h2>{lang 'Public articles are coming soon'}</h2>
            <p>{lang 'For now, use the public pages below for information about SharedChemistry, privacy, terms, support, and site navigation.'}</p>
            <nav class="sc-blog-public-links" aria-label="{lang 'Related public pages'}">
                <a href="{{ $design->url('page','main','about') }}">{lang 'About'}</a>
                <a href="{{ $design->url('page','main','faq') }}">{lang 'FAQ'}</a>
                <a href="{{ $design->url('page','main','privacy') }}">{lang 'Privacy'}</a>
                <a href="{{ $design->url('page','main','terms') }}">{lang 'Terms of Use'}</a>
                <a href="{{ $design->url('xml','sitemap','index') }}">{lang 'Site Map'}</a>
                <a href="{{ $design->url('contact','contact','index') }}">{lang 'Contact'}</a>
            </nav>
        </section>
    </div>
</section>
<!-- SC_BLOG_INDEX_V1_END -->
