{literal}
<style>
    main#content:has(.sc-help-page),
    body main#content#content:has(.sc-help-page) {
        max-width: none !important;
        padding: 0 !important;
        background: #08080b !important;
    }

    body:has(.sc-info-page) .navbar.navbar-fixed-top {
        min-height: 104px !important;
        border: 0 !important;
        background: rgba(8, 8, 11, .96) !important;
        box-shadow: 0 12px 34px rgba(0, 0, 0, .28) !important;
    }

    body:has(.sc-info-page) .navbar.navbar-fixed-top > .container {
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        gap: 32px !important;
        min-height: 104px !important;
        padding-top: 12px !important;
        padding-bottom: 12px !important;
    }

    body:has(.sc-info-page) .navbar-header {
        display: flex !important;
        align-items: center !important;
        flex: 0 0 auto !important;
        min-height: 80px !important;
        margin: 0 !important;
    }

    body:has(.sc-info-page) #logo.navbar-brand.sharedchemistry-member-logo {
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

    body:has(.sc-info-page) #logo .sharedchemistry-logo-link {
        display: inline-flex !important;
        align-items: center !important;
        width: 300px !important;
        max-width: 32vw !important;
        height: auto !important;
        margin: 0 !important;
        padding: 0 !important;
        transform: none !important;
    }

    body:has(.sc-info-page) #logo .sharedchemistry-header-logo {
        display: block !important;
        width: 300px !important;
        max-width: 100% !important;
        max-height: none !important;
        height: auto !important;
        margin: 0 !important;
        object-fit: contain !important;
        transform: none !important;
    }

    body:has(.sc-info-page) #navbar.navbar-collapse {
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

    body:has(.sc-info-page) #navbar .navbar-nav {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-end !important;
        gap: 22px !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li {
        display: flex !important;
        align-items: center !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li > a {
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

    body:has(.sc-info-page) #navbar .navbar-nav > li > a.sharedchemistry-nav-join {
        background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
        color: #fff !important;
        box-shadow: 0 12px 30px rgba(236, 8, 104, .25) !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li > a.sharedchemistry-nav-signin {
        border: 1px solid rgba(255, 188, 10, .44) !important;
        background: rgba(247, 243, 239, .04) !important;
        color: #ffbc0a !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li > a.sharedchemistry-nav-blog {
        border: 1px solid rgba(247, 243, 239, .14) !important;
        background: rgba(247, 243, 239, .035) !important;
        color: #f7f3ef !important;
    }

    .sc-help-page,
    .sc-help-page * {
        box-sizing: border-box;
    }

    .sc-help-page {
        width: 100%;
        overflow: hidden;
        background:
            radial-gradient(circle at 18% 4%, rgba(236, 8, 104, .18), transparent 30%),
            radial-gradient(circle at 82% 10%, rgba(255, 188, 10, .12), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    .sc-help-wrap {
        width: min(1160px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-help-hero {
        padding: 94px 0 58px;
    }

    .sc-help-kicker {
        margin: 0 0 12px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-help-title {
        max-width: 820px;
        margin: 0;
        color: #fff8f1;
        font-size: clamp(40px, 5vw, 68px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1;
    }

    .sc-help-lede {
        max-width: 760px;
        margin: 22px 0 0;
        color: #d7d2ce;
        font-size: 18px;
        line-height: 1.7;
    }

    .sc-help-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 14px;
        margin-top: 32px;
    }

    .sc-help-button,
    .sc-help-button:visited {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 48px;
        padding: 13px 20px;
        border-radius: 8px;
        color: #fff;
        font-size: 14px;
        font-weight: 800;
        line-height: 1.2;
        text-decoration: none !important;
        text-shadow: none;
    }

    .sc-help-button-primary,
    .sc-help-button-primary:visited {
        border: 0;
        background: linear-gradient(90deg, #ec0868, #ff5a3d);
        box-shadow: 0 18px 44px rgba(236, 8, 104, .28);
    }

    .sc-help-button-secondary,
    .sc-help-button-secondary:visited {
        border: 1px solid rgba(255, 188, 10, .42);
        background: rgba(247, 243, 239, .045);
        color: #ffbc0a;
    }

    .sc-help-button-muted,
    .sc-help-button-muted:visited {
        border: 1px solid rgba(247, 243, 239, .16);
        background: rgba(247, 243, 239, .055);
        color: #f7f3ef;
    }

    .sc-help-button:hover,
    .sc-help-button:focus {
        color: #fff;
        text-decoration: none !important;
        transform: translateY(-1px);
    }

    .sc-help-section {
        padding: 54px 0;
    }

    .sc-help-section-head {
        max-width: 760px;
        margin-bottom: 26px;
    }

    .sc-help-section h2 {
        margin: 0;
        color: #fff8f1;
        font-size: clamp(30px, 3.4vw, 44px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.08;
    }

    .sc-help-section p {
        margin: 14px 0 0;
        color: #c9c2bd;
        font-size: 16px;
        line-height: 1.7;
    }

    .sc-help-grid {
        display: grid;
        grid-template-columns: repeat(4, minmax(0, 1fr));
        gap: 18px;
    }

    .sc-help-card {
        min-height: 230px;
        padding: 24px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 14px;
        background: linear-gradient(180deg, rgba(247, 243, 239, .07), rgba(247, 243, 239, .035));
        box-shadow: 0 20px 50px rgba(0, 0, 0, .24);
    }

    .sc-help-icon {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: 42px;
        height: 42px;
        margin-bottom: 18px;
        border-radius: 12px;
        background: rgba(236, 8, 104, .16);
        color: #ffbc0a;
        font-size: 18px;
        box-shadow: inset 0 0 0 1px rgba(255, 188, 10, .18);
    }

    .sc-help-card h3,
    .sc-help-faq h3 {
        margin: 0;
        color: #fff8f1;
        font-size: 19px;
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.18;
    }

    .sc-help-card p,
    .sc-help-faq p {
        margin-top: 12px;
        font-size: 15px;
        line-height: 1.65;
    }

    .sc-help-email {
        margin-top: 14px !important;
        color: #d7d2ce !important;
    }

    .sc-help-email a,
    .sc-help-email a:visited {
        color: #ffbc0a !important;
        font-weight: 800;
        text-decoration: none !important;
    }

    .sc-help-email a:hover,
    .sc-help-email a:focus {
        color: #fff8f1 !important;
        text-decoration: none !important;
    }

    .sc-help-faq-list {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 16px;
    }

    .sc-help-faq {
        padding: 22px 24px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 12px;
        background: rgba(18, 18, 24, .78);
    }

    .sc-help-cta {
        margin-bottom: 72px;
        padding: 34px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 18px;
        background:
            linear-gradient(135deg, rgba(236, 8, 104, .20), rgba(255, 188, 10, .10)),
            #121218;
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-help-cta p {
        max-width: 760px;
    }

    @media (max-width: 1100px) {
        .sc-help-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 900px) {
        body:has(.sc-info-page) .navbar.navbar-fixed-top,
        body:has(.sc-info-page) .navbar.navbar-fixed-top > .container,
        body:has(.sc-info-page) .navbar-header,
        body:has(.sc-info-page) #logo.navbar-brand.sharedchemistry-member-logo,
        body:has(.sc-info-page) #navbar.navbar-collapse {
            min-height: 0 !important;
            height: auto !important;
        }

        body:has(.sc-info-page) .navbar.navbar-fixed-top > .container {
            display: grid !important;
            justify-items: center !important;
            gap: 12px !important;
            padding-top: 12px !important;
            padding-bottom: 12px !important;
        }

        body:has(.sc-info-page) .navbar-header,
        body:has(.sc-info-page) #navbar.navbar-collapse {
            width: 100% !important;
            justify-content: center !important;
        }

        body:has(.sc-info-page) #logo.navbar-brand.sharedchemistry-member-logo {
            justify-content: center !important;
            padding: 0 !important;
        }

        body:has(.sc-info-page) #logo .sharedchemistry-logo-link,
        body:has(.sc-info-page) #logo .sharedchemistry-header-logo {
            width: min(300px, 82vw) !important;
            max-width: 82vw !important;
        }

        body:has(.sc-info-page) #navbar .navbar-nav {
            justify-content: center !important;
            flex-wrap: wrap !important;
            gap: 10px 14px !important;
            width: 100% !important;
        }

        body:has(.sc-info-page) #navbar .navbar-nav > li > a {
            min-height: 42px !important;
            padding: 10px 14px !important;
        }

        .sc-help-hero {
            padding: 72px 0 44px;
        }
    }

    @media (max-width: 680px) {
        .sc-help-wrap {
            width: min(100% - 20px, 1160px);
        }

        .sc-help-grid,
        .sc-help-faq-list {
            grid-template-columns: 1fr;
        }

        .sc-help-actions,
        .sc-help-button {
            width: 100%;
        }

        .sc-help-section {
            padding: 42px 0;
        }

        .sc-help-card {
            min-height: 0;
        }

        .sc-help-cta {
            margin-bottom: 48px;
            padding: 24px;
        }
    }
</style>
{/literal}

<div class="sc-help-page sc-info-page">
    <section class="sc-help-hero sc-help-wrap">
        <p class="sc-help-kicker">{lang 'SharedChemistry help'}</p>
        <p class="sc-help-title">{lang 'Need help with SharedChemistry?'}</p>
        <p class="sc-help-lede">{lang 'Find practical help with accounts, couples profile setup, privacy and discretion, messaging, photos, verified couples, and general site use in a private couples community.'}</p>
        <div class="sc-help-actions">
            <a class="sc-help-button sc-help-button-primary" href="{{ $design->url('user', 'signup', 'step1') }}">{lang 'Create your couple profile'}</a>
            <a class="sc-help-button sc-help-button-secondary" href="{{ $design->url('user', 'main', 'login') }}" data-load="ajax">{lang 'Sign in'}</a>
            <a class="sc-help-button sc-help-button-muted" href="{{ $design->url('contact','contact','index') }}">{lang 'Contact support'}</a>
        </div>
    </section>

    <section class="sc-help-section sc-help-wrap">
        <div class="sc-help-section-head">
            <h2>{lang 'How can we help?'}</h2>
            <p>{lang 'Choose the area that matches what you need. Each section points you toward the right next step without making the process feel complicated.'}</p>
        </div>

        <div class="sc-help-grid">
            <article class="sc-help-card">
                <span class="sc-help-icon"><i class="fa fa-sign-in"></i></span>
                <h3>{lang 'Account & Sign In'}</h3>
                <p>{lang 'Help with logging in, passwords, account access, and getting back into your SharedChemistry account.'}</p>
            </article>
            <article class="sc-help-card">
                <span class="sc-help-icon"><i class="fa fa-users"></i></span>
                <h3>{lang 'Couple Profile Setup'}</h3>
                <p>{lang 'Guidance for completing profile details, public profile sections, and the information that represents you as a couple.'}</p>
            </article>
            <article class="sc-help-card">
                <span class="sc-help-icon"><i class="fa fa-picture-o"></i></span>
                <h3>{lang 'Photos & Private Media'}</h3>
                <p>{lang 'Public profile photos and private media areas are handled separately, so each space can support a different level of visibility.'}</p>
            </article>
            <article class="sc-help-card">
                <span class="sc-help-icon"><i class="fa fa-comments-o"></i></span>
                <h3>{lang 'Messaging & Friends'}</h3>
                <p>{lang 'Help with connecting, sending messages, friend requests, and managing contacts inside the member area.'}</p>
            </article>
            <article class="sc-help-card">
                <span class="sc-help-icon"><i class="fa fa-check-circle"></i></span>
                <h3>{lang 'Verified Couples'}</h3>
                <p>{lang 'Learn how the Verified Couple feature works as a trust signal for members who want more confidence before connecting.'}</p>
            </article>
            <article class="sc-help-card">
                <span class="sc-help-icon"><i class="fa fa-lock"></i></span>
                <h3>{lang 'Privacy & Discretion'}</h3>
                <p>{lang 'Understand member-only access, profile visibility, and practical privacy-focused site use without heavy legal wording.'}</p>
            </article>
            <article class="sc-help-card">
                <span class="sc-help-icon"><i class="fa fa-wrench"></i></span>
                <h3>{lang 'Site Issues'}</h3>
                <p>{lang 'Get help with broken pages, upload problems, display issues, or browser problems that interrupt normal site use.'}</p>
            </article>
            <article class="sc-help-card">
                <span class="sc-help-icon"><i class="fa fa-envelope-o"></i></span>
                <h3>{lang 'Contact Support'}</h3>
                <p>{lang 'If the answer is not clear, contact SharedChemistry support with the account, page, or feature you need help with.'}</p>
                <p class="sc-help-email">{lang 'For direct support, email:'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a></p>
            </article>
        </div>
    </section>

    <section class="sc-help-section sc-help-wrap">
        <div class="sc-help-section-head">
            <h2>{lang 'Quick answers'}</h2>
            <p>{lang 'Short answers for the most common SharedChemistry help questions.'}</p>
        </div>

        <div class="sc-help-faq-list">
            <article class="sc-help-faq">
                <h3>{lang 'How do I create a couple profile?'}</h3>
                <p>{lang 'Use Create your couple profile, complete the signup steps together, and add the details that describe you as a couple.'}</p>
            </article>
            <article class="sc-help-faq">
                <h3>{lang 'Can I edit my profile later?'}</h3>
                <p>{lang 'Yes. After signing in, use your profile and account settings to update photos, details, and public profile sections.'}</p>
            </article>
            <article class="sc-help-faq">
                <h3>{lang 'Where do I upload photos?'}</h3>
                <p>{lang 'Profile photos and private media are managed in different areas so you can choose what belongs on each part of your presence.'}</p>
            </article>
            <article class="sc-help-faq">
                <h3>{lang 'What does Verified Couple mean?'}</h3>
                <p>{lang 'Verified Couple is a trust signal that helps members understand when another couple has additional community confidence.'}</p>
            </article>
            <article class="sc-help-faq">
                <h3>{lang 'Who can see my profile?'}</h3>
                <p>{lang 'Visibility depends on your member status and profile settings. Review your account and privacy options after signing in.'}</p>
            </article>
            <article class="sc-help-faq">
                <h3>{lang 'What should I do if something is not working?'}</h3>
                <p>{lang 'Try refreshing the page, checking your browser, and then contact support with the page and issue if the problem continues.'}</p>
            </article>
        </div>
    </section>

    <section class="sc-help-section sc-help-wrap">
        <div class="sc-help-cta">
            <p class="sc-help-kicker">{lang 'Support'}</p>
            <h2>{lang 'Still need help?'}</h2>
            <p>{lang 'Contact SharedChemistry support if you need help with account access, profile setup, verification, or site problems. Include enough detail so the team can understand what happened.'}</p>
            <p class="sc-help-email">{lang 'For direct support, email:'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a></p>
            <div class="sc-help-actions">
                <a class="sc-help-button sc-help-button-primary" href="{{ $design->url('contact','contact','index') }}">{lang 'Contact support'}</a>
            </div>
        </div>
    </section>
</div>
