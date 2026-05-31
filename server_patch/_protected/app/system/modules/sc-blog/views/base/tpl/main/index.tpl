{literal}
<style>
    #sc-blog-index-v1,
    #sc-blog-index-v1 * {
        box-sizing: border-box;
    }

    #sc-blog-index-v1 {
        width: min(1180px, calc(100vw - 48px));
        margin: 0 auto;
        padding: 34px 0 72px;
        color: #f7f3ef;
    }

    #sc-blog-index-v1 a {
        color: inherit;
    }

    #sc-blog-index-v1 .sc-blog-hero,
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

    #sc-blog-index-v1 h1 {
        margin: 0 0 10px;
        color: #fff;
        font-size: 38px;
        font-weight: 800;
        line-height: 1.12;
    }

    #sc-blog-index-v1 .sc-blog-intro,
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
            width: min(100%, calc(100vw - 24px));
            padding: 24px 0 60px;
        }

        #sc-blog-index-v1 .sc-blog-hero {
            padding: 22px;
        }

        #sc-blog-index-v1 h1 {
            font-size: 31px;
        }
    }
</style>
{/literal}

<!-- SC_BLOG_INDEX_V1_ACTIVE -->
<section id="sc-blog-index-v1" class="sc-info-page">
    <section class="sc-blog-hero">
        <h1>{lang 'SharedChemistry Articles'}</h1>
        <p class="sc-blog-intro">{lang 'Privacy-minded articles and practical guidance for couples exploring SharedChemistry. Full articles will be published here later; this page is public and does not expose member profiles, private media, messages, or dashboard areas.'}</p>
    </section>

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
</section>
<!-- SC_BLOG_INDEX_V1_END -->
