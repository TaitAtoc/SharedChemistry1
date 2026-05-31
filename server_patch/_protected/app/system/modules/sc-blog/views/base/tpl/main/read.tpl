{literal}
<style>
    #sc-blog-article-v1,
    #sc-blog-article-v1 * {
        box-sizing: border-box;
    }

    #sc-blog-article-v1 {
        width: min(920px, calc(100vw - 48px));
        margin: 0 auto;
        padding: 34px 0 72px;
        color: #f7f3ef;
    }

    #sc-blog-article-v1 a {
        color: #ffbc0a;
    }

    #sc-blog-article-v1 .sc-blog-back {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 38px;
        margin-bottom: 16px;
        padding: 9px 14px;
        border: 1px solid rgba(247, 243, 239, .12);
        border-radius: 999px;
        background: #17181d;
        color: #f7f3ef;
        font-weight: 800;
        text-decoration: none;
    }

    #sc-blog-article-v1 .sc-blog-article,
    #sc-blog-article-v1 .sc-blog-not-found {
        overflow: hidden;
        border: 1px solid rgba(247, 243, 239, .09);
        border-radius: 8px;
        background: #17181d;
        box-shadow: 0 16px 34px rgba(0, 0, 0, .24);
    }

    #sc-blog-article-v1 .sc-blog-article-header,
    #sc-blog-article-v1 .sc-blog-content,
    #sc-blog-article-v1 .sc-blog-not-found {
        padding: 28px;
    }

    #sc-blog-article-v1 h1 {
        margin: 0 0 12px;
        color: #fff;
        font-size: 40px;
        font-weight: 800;
        line-height: 1.12;
    }

    #sc-blog-article-v1 .sc-blog-date {
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        text-transform: uppercase;
    }

    #sc-blog-article-v1 .sc-blog-featured {
        display: block;
        width: 100%;
        max-height: 520px;
        object-fit: cover;
        background: #101114;
    }

    #sc-blog-article-v1 .sc-blog-content {
        color: #e8e0dc;
        font-size: 17px;
        line-height: 1.72;
    }

    #sc-blog-article-v1 .sc-blog-content h2,
    #sc-blog-article-v1 .sc-blog-content h3,
    #sc-blog-article-v1 .sc-blog-content h4 {
        margin: 28px 0 10px;
        color: #fff;
        line-height: 1.2;
    }

    #sc-blog-article-v1 .sc-blog-content p,
    #sc-blog-article-v1 .sc-blog-content ul,
    #sc-blog-article-v1 .sc-blog-content ol,
    #sc-blog-article-v1 .sc-blog-content blockquote {
        margin: 0 0 18px;
    }

    #sc-blog-article-v1 .sc-blog-content blockquote {
        padding: 4px 0 4px 18px;
        border-left: 4px solid #ec0868;
        color: #cbc4c0;
    }

    #sc-blog-article-v1 .sc-blog-content img {
        max-width: 100%;
        height: auto;
        border-radius: 8px;
    }

    #sc-blog-article-v1 .sc-blog-not-found h1 {
        font-size: 32px;
    }

    #sc-blog-article-v1 .sc-blog-not-found p {
        margin: 0;
        color: #cbc4c0;
        font-size: 16px;
        line-height: 1.55;
    }

    @media (max-width: 700px) {
        #sc-blog-article-v1 {
            width: min(100%, calc(100vw - 24px));
            padding: 24px 0 60px;
        }

        #sc-blog-article-v1 .sc-blog-article-header,
        #sc-blog-article-v1 .sc-blog-content,
        #sc-blog-article-v1 .sc-blog-not-found {
            padding: 22px;
        }

        #sc-blog-article-v1 h1 {
            font-size: 31px;
        }
    }
</style>
{/literal}

<!-- SC_BLOG_ARTICLE_V1_ACTIVE -->
<div id="sc-blog-article-v1">
    <a class="sc-blog-back" href="{url_root}blog">{lang 'Back to Articles'}</a>

    <section class="sc-blog-not-found">
        <h1>{lang 'Article Coming Soon'}</h1>
        <p>{lang 'SharedChemistry articles are being prepared. This public article route does not show member profiles, private media, messages, dashboard pages, or other member-only areas.'}</p>
    </section>
</div>
<!-- SC_BLOG_ARTICLE_V1_END -->
