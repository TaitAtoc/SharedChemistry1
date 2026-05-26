{literal}
<style>
    main#content:has(.sc-sitemap-page),
    body main#content#content:has(.sc-sitemap-page) {
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

    .sc-sitemap-page,
    .sc-sitemap-page * {
        box-sizing: border-box;
    }

    .sc-sitemap-page {
        width: 100%;
        overflow: hidden;
        background:
            radial-gradient(circle at 18% 4%, rgba(236, 8, 104, .18), transparent 30%),
            radial-gradient(circle at 82% 10%, rgba(255, 188, 10, .12), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    .sc-sitemap-wrap {
        width: min(1160px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-sitemap-hero {
        padding: 94px 0 54px;
    }

    .sc-sitemap-kicker {
        margin: 0 0 12px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-sitemap-hero h1 {
        max-width: 780px;
        margin: 0;
        color: #fff8f1;
        font-size: clamp(40px, 7vw, 74px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: .95;
    }

    .sc-sitemap-lede {
        max-width: 780px;
        margin: 24px 0 0;
        color: #d7d2ce;
        font-size: clamp(17px, 2.2vw, 21px);
        line-height: 1.65;
    }

    .sc-sitemap-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 22px;
        padding: 0 0 80px;
    }

    .sc-sitemap-panel {
        min-width: 0;
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 8px;
        background: rgba(18, 18, 24, .78);
        box-shadow: 0 24px 70px rgba(0, 0, 0, .30);
    }

    .sc-sitemap-panel h2 {
        margin: 0 0 16px;
        color: #fff8f1;
        font-size: 24px;
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.2;
    }

    .sc-sitemap-list {
        display: grid;
        gap: 10px;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    .sc-sitemap-list a,
    .sc-sitemap-member-link {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 14px;
        min-width: 0;
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

    .sc-sitemap-list a:hover,
    .sc-sitemap-list a:focus {
        border-color: rgba(255, 188, 10, .45);
        background: rgba(255, 188, 10, .08);
        color: #ffbc0a;
        text-decoration: none;
    }

    .sc-sitemap-list a:after {
        content: ">";
        flex: 0 0 auto;
        color: #ffbc0a;
        font-weight: 800;
    }

    .sc-sitemap-member-link {
        color: #d7d2ce;
    }

    .sc-sitemap-badge {
        flex: 0 0 auto;
        padding: 4px 8px;
        border: 1px solid rgba(255, 188, 10, .28);
        border-radius: 999px;
        color: #ffbc0a;
        font-size: 11px;
        font-weight: 800;
        line-height: 1.2;
        white-space: nowrap;
    }

    .sc-sitemap-support {
        margin: -36px 0 78px;
        padding: 34px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 8px;
        background:
            linear-gradient(135deg, rgba(236, 8, 104, .18), rgba(255, 188, 10, .09)),
            #121218;
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-sitemap-support h2 {
        margin: 0 0 12px;
        color: #fff8f1;
        font-size: 28px;
        font-weight: 800;
    }

    .sc-sitemap-support p {
        max-width: 820px;
        margin: 0;
        color: #d7d2ce;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-sitemap-support a {
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

        .sc-sitemap-hero {
            padding: 72px 0 42px;
        }

        .sc-sitemap-grid {
            grid-template-columns: 1fr;
            padding-bottom: 64px;
        }
    }

    @media (max-width: 680px) {
        .sc-sitemap-wrap {
            width: min(100% - 20px, 1160px);
        }

        .sc-sitemap-hero {
            padding: 52px 0 34px;
        }

        .sc-sitemap-panel,
        .sc-sitemap-support {
            padding: 22px;
        }

        .sc-sitemap-list a,
        .sc-sitemap-member-link {
            align-items: flex-start;
            flex-direction: column;
        }
    }
</style>
{/literal}

<section class="sc-sitemap-page sc-info-page">
    <div class="sc-sitemap-wrap">
        <div class="sc-sitemap-hero">
            <p class="sc-sitemap-kicker">{lang 'SharedChemistry site map'}</p>
            <h1>{lang 'Site Map'}</h1>
            <p class="sc-sitemap-lede">{lang 'Find the main public pages, account areas, support links, and member features available on SharedChemistry.'}</p>
        </div>

        <div class="sc-sitemap-grid">
            <section class="sc-sitemap-panel">
                <h2>{lang 'Public Pages'}</h2>
                <ul class="sc-sitemap-list">
                    <li><a href="{url_root}">{lang 'Home'}</a></li>
                    <li><a href="{{ $design->url('page','main','about') }}">{lang 'About'}</a></li>
                    <li><a href="{{ $design->url('page','main','helpus') }}">{lang 'Help'}</a></li>
                    <li><a href="{{ $design->url('page','main','faq') }}">{lang 'FAQ'}</a></li>
                    <li><a href="{{ $design->url('page','main','terms') }}">{lang 'Terms of Use'}</a></li>
                    <li><a href="{{ $design->url('page','main','privacy') }}">{lang 'Privacy Policy'}</a></li>
                    <li><a href="{{ $design->url('page','main','legalnotice') }}">{lang 'Legal Notice'}</a></li>
                    <li><a href="{url_root}blog">{lang 'Blog'}</a></li>
                    <li><a href="{{ $design->url('contact','contact','index') }}">{lang 'Contact Support'}</a></li>
                </ul>
            </section>

            <section class="sc-sitemap-panel">
                <h2>{lang 'Account Access'}</h2>
                <ul class="sc-sitemap-list">
                    <li><a href="{{ $design->url('user','signup','step1') }}">{lang 'Create Profile'}</a></li>
                    <li><a href="{{ $design->url('user','main','login') }}">{lang 'Sign In'}</a></li>
                    <li><a href="{{ $design->url('invite','home','invitation') }}">{lang 'Invite Trusted Couples'}</a></li>
                    <li><a href="{{ $design->url('newsletter','home','subscription') }}">{lang 'Newsletter'}</a></li>
                </ul>
            </section>

            <section class="sc-sitemap-panel">
                <h2>{lang 'Member Areas'}</h2>
                <ul class="sc-sitemap-list">
                    <li><span class="sc-sitemap-member-link">{lang 'Dashboard'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                    <li><span class="sc-sitemap-member-link">{lang 'People'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                    <li><span class="sc-sitemap-member-link">{lang 'Messages'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                    <li><span class="sc-sitemap-member-link">{lang 'Friends Manager'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                    <li><span class="sc-sitemap-member-link">{lang 'Chat'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                    <li><span class="sc-sitemap-member-link">{lang 'Discussions'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                    <li><span class="sc-sitemap-member-link">{lang 'Profile Settings'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                    <li><span class="sc-sitemap-member-link">{lang 'Private Photos'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                    <li><span class="sc-sitemap-member-link">{lang 'Private Videos'} <span class="sc-sitemap-badge">{lang 'members only'}</span></span></li>
                </ul>
            </section>

            <section class="sc-sitemap-panel">
                <h2>{lang 'Privacy & Safety'}</h2>
                <ul class="sc-sitemap-list">
                    <li><a href="{{ $design->url('page','main','privacy') }}">{lang 'Privacy Policy'}</a></li>
                    <li><a href="{{ $design->url('page','main','terms') }}">{lang 'Terms of Use'}</a></li>
                    <li><a href="{{ $design->url('page','main','legalnotice') }}">{lang 'Legal Notice'}</a></li>
                    <li><a href="{{ $design->url('contact','contact','index') }}">{lang 'Contact Support'}</a></li>
                    <li><a href="mailto:support@sharedchemistry.com">{lang 'Report an issue'}</a></li>
                </ul>
            </section>
        </div>

        <section class="sc-sitemap-support">
            <h2>{lang 'Support'}</h2>
            <p>{lang 'For help with your account, profile, messages, private media, or reporting another member, contact:'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a></p>
        </section>
    </div>
</section>
