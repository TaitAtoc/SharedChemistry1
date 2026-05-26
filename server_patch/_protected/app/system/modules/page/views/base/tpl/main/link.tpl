{literal}
<style>
    main#content:has(.sc-links-page),
    body main#content#content:has(.sc-links-page) {
        max-width: none !important;
        padding: 0 !important;
        background: #08080b !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top {
        min-height: 104px !important;
        border: 0 !important;
        background: rgba(8, 8, 11, .96) !important;
        box-shadow: 0 12px 34px rgba(0, 0, 0, .28) !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container {
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        gap: 32px !important;
        min-height: 104px !important;
        padding-top: 12px !important;
        padding-bottom: 12px !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar-header {
        display: flex !important;
        align-items: center !important;
        flex: 0 0 auto !important;
        min-height: 80px !important;
        margin: 0 !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo {
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

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-logo-link {
        display: inline-flex !important;
        align-items: center !important;
        width: 300px !important;
        max-width: 32vw !important;
        height: auto !important;
        margin: 0 !important;
        padding: 0 !important;
        transform: none !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-header-logo {
        display: block !important;
        width: 300px !important;
        max-width: 100% !important;
        max-height: none !important;
        height: auto !important;
        margin: 0 !important;
        object-fit: contain !important;
        transform: none !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
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

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-end !important;
        gap: 22px !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li {
        display: flex !important;
        align-items: center !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a {
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

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-join {
        background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
        color: #fff !important;
        box-shadow: 0 12px 30px rgba(236, 8, 104, .25) !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-signin {
        border: 1px solid rgba(255, 188, 10, .44) !important;
        background: rgba(247, 243, 239, .04) !important;
        color: #ffbc0a !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-blog {
        border: 1px solid rgba(247, 243, 239, .14) !important;
        background: rgba(247, 243, 239, .035) !important;
        color: #f7f3ef !important;
    }

    .sc-links-page,
    .sc-links-page * {
        box-sizing: border-box;
    }

    .sc-links-page {
        width: 100%;
        overflow: hidden;
        background:
            radial-gradient(circle at 18% 4%, rgba(236, 8, 104, .18), transparent 30%),
            radial-gradient(circle at 82% 10%, rgba(255, 188, 10, .12), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    .sc-links-wrap {
        width: min(1160px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-links-hero {
        padding: 94px 0 54px;
    }

    .sc-links-kicker {
        margin: 0 0 12px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-links-hero h1 {
        max-width: 780px;
        margin: 0;
        color: #fff8f1;
        font-size: clamp(40px, 7vw, 74px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: .95;
    }

    .sc-links-lede,
    .sc-links-note {
        max-width: 820px;
        color: #d7d2ce;
        font-size: clamp(16px, 2vw, 20px);
        line-height: 1.65;
    }

    .sc-links-lede {
        margin: 24px 0 0;
    }

    .sc-links-note {
        margin: 18px 0 0;
        font-size: 15px;
    }

    .sc-links-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 22px;
        padding: 0 0 80px;
    }

    .sc-links-section {
        min-width: 0;
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 8px;
        background: rgba(18, 18, 24, .78);
        box-shadow: 0 24px 70px rgba(0, 0, 0, .30);
    }

    .sc-links-section h2 {
        margin: 0 0 16px;
        color: #fff8f1;
        font-size: 24px;
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.2;
    }

    .sc-links-list {
        display: grid;
        gap: 14px;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .sc-links-card,
    .sc-links-placeholder {
        display: block;
        min-width: 0;
        padding: 18px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 8px;
        background: rgba(247, 243, 239, .035);
        color: #f7f3ef;
        text-decoration: none;
        transition: border-color .18s ease, background .18s ease, transform .18s ease;
    }

    .sc-links-card:hover,
    .sc-links-card:focus {
        border-color: rgba(255, 188, 10, .45);
        background: rgba(255, 188, 10, .08);
        color: #f7f3ef;
        text-decoration: none;
        transform: translateY(-1px);
    }

    .sc-links-card-title {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 12px;
        color: #fff8f1;
        font-size: 17px;
        font-weight: 800;
        line-height: 1.35;
    }

    .sc-links-badge {
        flex: 0 0 auto;
        padding: 4px 8px;
        border: 1px solid rgba(255, 188, 10, .28);
        border-radius: 999px;
        color: #ffbc0a;
        font-size: 11px;
        font-weight: 800;
        line-height: 1.2;
        white-space: nowrap;
        text-transform: uppercase;
    }

    .sc-links-card p,
    .sc-links-placeholder p {
        margin: 10px 0 0;
        color: #d7d2ce;
        font-size: 15px;
        line-height: 1.65;
    }

    .sc-links-privacy-list {
        display: grid;
        gap: 10px;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .sc-links-privacy-list a {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
        padding: 13px 14px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 8px;
        background: rgba(247, 243, 239, .035);
        color: #f7f3ef;
        font-weight: 800;
        line-height: 1.35;
        text-decoration: none;
        transition: border-color .18s ease, background .18s ease, color .18s ease;
    }

    .sc-links-privacy-list a:hover,
    .sc-links-privacy-list a:focus {
        border-color: rgba(255, 188, 10, .45);
        background: rgba(255, 188, 10, .08);
        color: #ffbc0a;
        text-decoration: none;
    }

    .sc-links-privacy-list a:after {
        content: ">";
        flex: 0 0 auto;
        color: #ffbc0a;
        font-weight: 800;
    }

    .sc-links-support {
        margin: -36px 0 78px;
        padding: 34px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 8px;
        background:
            linear-gradient(135deg, rgba(236, 8, 104, .18), rgba(255, 188, 10, .09)),
            #121218;
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-links-support h2 {
        margin: 0 0 12px;
        color: #fff8f1;
        font-size: 28px;
        font-weight: 800;
    }

    .sc-links-support p {
        max-width: 820px;
        margin: 0;
        color: #d7d2ce;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-links-support a {
        color: #ffbc0a;
        font-weight: 800;
        text-decoration: underline;
        text-underline-offset: 3px;
    }

    @media (max-width: 900px) {
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar-header,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
            min-height: 0 !important;
            height: auto !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container {
            display: grid !important;
            justify-items: center !important;
            gap: 12px !important;
            padding-top: 12px !important;
            padding-bottom: 12px !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar-header,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
            width: 100% !important;
            justify-content: center !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo {
            justify-content: center !important;
            padding: 0 !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-logo-link,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-header-logo {
            width: min(300px, 82vw) !important;
            max-width: 82vw !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav {
            justify-content: center !important;
            flex-wrap: wrap !important;
            gap: 10px 14px !important;
            width: 100% !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a {
            min-height: 42px !important;
            padding: 10px 14px !important;
        }

        .sc-links-hero {
            padding: 72px 0 42px;
        }

        .sc-links-grid {
            grid-template-columns: 1fr;
            padding-bottom: 64px;
        }
    }

    @media (max-width: 680px) {
        .sc-links-wrap {
            width: min(100% - 20px, 1160px);
        }

        .sc-links-hero {
            padding: 52px 0 34px;
        }

        .sc-links-section,
        .sc-links-support {
            padding: 22px;
        }

        .sc-links-card-title {
            align-items: flex-start;
            flex-direction: column;
        }
    }
</style>
{/literal}

<section class="sc-links-page sc-info-page">
    <div class="sc-links-wrap">
        <div class="sc-links-hero">
            <p class="sc-links-kicker">{lang 'SharedChemistry links'}</p>
            <h1>{lang 'Links'}</h1>
            <p class="sc-links-lede">{lang 'A small collection of outside articles, videos, and community resources connected to couples, lifestyle, events, communication, and privacy.'}</p>
            <p class="sc-links-note">{lang 'External resources are provided for convenience only. Third-party sites have their own privacy policies and terms, and SharedChemistry does not control their content.'}</p>
        </div>

        <div class="sc-links-grid">
            <section class="sc-links-section">
                <h2>{lang 'Lifestyle Articles'}</h2>
                <ul class="sc-links-list">
                    <li>
                        <a class="sc-links-card" href="https://www.hipcamp.com/journal/camping/what-do-upside-down-pineapples-flamingos-mean-campgrounds" target="_blank" rel="nofollow noopener noreferrer">
                            <span class="sc-links-card-title">
                                <span>{lang 'Upside-Down Pineapples & Flamingos at Campgrounds'}</span>
                                <span class="sc-links-badge">{lang 'External'}</span>
                            </span>
                            <p>{lang 'A light article about lifestyle symbols, campgrounds, and social signals.'}</p>
                        </a>
                    </li>
                </ul>
            </section>

            <section class="sc-links-section">
                <h2>{lang 'Videos'}</h2>
                <ul class="sc-links-list">
                    <li>
                        <a class="sc-links-card" href="https://www.youtube.com/watch?v=YikqklQTlts" target="_blank" rel="nofollow noopener noreferrer">
                            <span class="sc-links-card-title">
                                <span>{lang 'YouTube Lifestyle Video'}</span>
                                <span class="sc-links-badge">{lang 'External'}</span>
                            </span>
                            <p>{lang 'A test video link for the SharedChemistry links section.'}</p>
                        </a>
                    </li>
                </ul>
            </section>

            <section class="sc-links-section">
                <h2>{lang 'Community & Events'}</h2>
                <div class="sc-links-placeholder">
                    <span class="sc-links-card-title">{lang 'Community resources'}</span>
                    <p>{lang 'More community and event resources may be added here as SharedChemistry grows.'}</p>
                </div>
            </section>

            <section class="sc-links-section">
                <h2>{lang 'Privacy & Safety Resources'}</h2>
                <ul class="sc-links-privacy-list">
                    <li><a href="{{ $design->url('page','main','privacy') }}">{lang 'Privacy Policy'}</a></li>
                    <li><a href="{{ $design->url('page','main','terms') }}">{lang 'Terms of Use'}</a></li>
                    <li><a href="{{ $design->url('page','main','legalnotice') }}">{lang 'Legal Notice'}</a></li>
                    <li><a href="{{ $design->url('contact','contact','index') }}">{lang 'Contact Support'}</a></li>
                </ul>
            </section>
        </div>

        <section class="sc-links-support">
            <h2>{lang 'Support'}</h2>
            <p>{lang 'For questions about SharedChemistry links, privacy and safety, or the private couples community, contact'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>
        </section>
    </div>
</section>
