{literal}
<style>
    main#content:has(.sc-contact-page),
    body main#content#content:has(.sc-contact-page) {
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

    .sc-contact-page,
    .sc-contact-page * {
        box-sizing: border-box;
    }

    .sc-contact-page {
        width: 100%;
        min-height: 100vh;
        overflow: hidden;
        padding: 94px 0 78px;
        background:
            radial-gradient(circle at 18% 4%, rgba(236, 8, 104, .18), transparent 30%),
            radial-gradient(circle at 82% 10%, rgba(255, 188, 10, .12), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    .sc-contact-wrap {
        width: min(900px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-contact-hero {
        margin: 0 0 28px;
    }

    .sc-contact-kicker {
        margin: 0 0 12px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-contact-hero h1 {
        margin: 0;
        color: #fff8f1;
        font-size: clamp(38px, 6vw, 66px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1;
    }

    .sc-contact-lede {
        max-width: 820px;
        margin: 22px 0 0;
        color: #d7d2ce;
        font-size: clamp(16px, 2vw, 20px);
        line-height: 1.65;
    }

    .sc-contact-support {
        margin: 16px 0 0;
        color: #d7d2ce;
        font-size: 15px;
        line-height: 1.6;
    }

    .sc-contact-support a {
        color: #ffbc0a;
        font-weight: 800;
        text-decoration: underline;
        text-underline-offset: 3px;
    }

    .sc-contact-card {
        width: 100%;
        margin: 0 auto;
        padding: 34px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 8px;
        background: rgba(18, 18, 24, .82);
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-contact-form form,
    .sc-contact-form .pfbc-form {
        width: 100% !important;
        max-width: 100% !important;
        margin: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        border-radius: 0 !important;
        background: transparent !important;
        box-shadow: none !important;
        color: #f7f3ef !important;
    }

    .sc-contact-form label,
    .sc-contact-form .pfbc-label,
    .sc-contact-form legend {
        display: block !important;
        margin: 0 0 8px !important;
        color: #f7f3ef !important;
        font-size: 13px !important;
        font-weight: 800 !important;
        line-height: 1.3 !important;
        text-shadow: none !important;
    }

    .sc-contact-form input:not([type=image]):not([type=range]):not([type=hidden]),
    .sc-contact-form textarea,
    .sc-contact-form select {
        width: 100% !important;
        max-width: 100% !important;
        min-height: 46px !important;
        margin: 0 !important;
        padding: 12px 14px !important;
        border: 1px solid rgba(247, 243, 239, .18) !important;
        border-radius: 8px !important;
        background: rgba(8, 8, 11, .70) !important;
        color: #f7f3ef !important;
        font-size: 15px !important;
        line-height: 1.45 !important;
        text-shadow: none !important;
        box-shadow: inset 0 1px 0 rgba(255, 255, 255, .04) !important;
        white-space: normal !important;
    }

    .sc-contact-form textarea {
        min-height: 150px !important;
        resize: vertical !important;
    }

    .sc-contact-form input:focus,
    .sc-contact-form textarea:focus,
    .sc-contact-form select:focus {
        border-color: rgba(255, 188, 10, .72) !important;
        outline: 0 !important;
        box-shadow: 0 0 0 3px rgba(255, 188, 10, .14) !important;
    }

    .sc-contact-form div[id^="pfbc-element-"],
    .sc-contact-form .form-group,
    .sc-contact-form p {
        width: 100% !important;
        max-width: 100% !important;
        margin: 0 0 18px !important;
        padding: 0 !important;
        overflow: visible !important;
    }

    .sc-contact-form small,
    .sc-contact-form .help-block,
    .sc-contact-form .description {
        display: block !important;
        margin-top: 7px !important;
        color: #d7d2ce !important;
        font-size: 12px !important;
        line-height: 1.45 !important;
    }

    .sc-contact-form .input_error {
        float: none !important;
        display: block !important;
        min-height: 0 !important;
        margin: 7px 0 0 !important;
        color: #ff8b7d !important;
        font-size: 12px !important;
        line-height: 1.4 !important;
    }

    .sc-contact-form .captcha {
        display: block !important;
        width: 100% !important;
        max-width: 100% !important;
        height: auto !important;
        min-height: 54px !important;
        margin: 8px 0 10px !important;
        padding: 8px !important;
        border: 1px solid rgba(247, 243, 239, .16) !important;
        border-radius: 8px !important;
        background: rgba(247, 243, 239, .92) !important;
        object-fit: contain !important;
    }

    .sc-contact-form .captcha_button,
    .sc-contact-form input[type=image] {
        float: none !important;
        display: inline-flex !important;
        width: auto !important;
        max-width: 42px !important;
        height: 42px !important;
        margin: 0 0 10px !important;
        padding: 8px !important;
        border: 1px solid rgba(255, 188, 10, .36) !important;
        border-radius: 8px !important;
        background: rgba(247, 243, 239, .08) !important;
        vertical-align: middle !important;
    }

    .sc-contact-form input[type=submit],
    .sc-contact-form button {
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        width: auto !important;
        min-width: 160px !important;
        min-height: 46px !important;
        margin: 4px 10px 0 0 !important;
        padding: 12px 20px !important;
        border: 0 !important;
        border-radius: 8px !important;
        background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
        color: #fff !important;
        font-size: 14px !important;
        font-weight: 800 !important;
        line-height: 1.2 !important;
        text-shadow: none !important;
        box-shadow: 0 14px 34px rgba(236, 8, 104, .24) !important;
        cursor: pointer !important;
    }

    .sc-contact-ip-note {
        margin: 18px 0 0;
        color: #bfb7b3;
        font-size: 12px;
        font-style: italic;
        line-height: 1.5;
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

        .sc-contact-page {
            padding-top: 126px;
        }
    }

    @media (max-width: 680px) {
        .sc-contact-page {
            padding: 108px 0 56px;
        }

        .sc-contact-wrap {
            width: min(100% - 20px, 900px);
        }

        .sc-contact-card {
            padding: 24px 20px;
        }

        .sc-contact-form input[type=submit],
        .sc-contact-form button {
            width: 100% !important;
            margin-right: 0 !important;
        }
    }
</style>
{/literal}

<section class="sc-contact-page sc-info-page">
    <div class="sc-contact-wrap">
        <div class="sc-contact-hero">
            <p class="sc-contact-kicker">{lang 'Support'}</p>
            <h1>{lang 'Contact SharedChemistry'}</h1>
            <p class="sc-contact-lede">{lang 'Need help with your account, profile, messages, private media, reporting another member, or a site issue? Send us a message and the SharedChemistry team will review it.'}</p>
            <p class="sc-contact-support">{lang 'You can also email support directly at'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>
        </div>

        <div class="sc-contact-card">
            <div class="sc-contact-form">
                {{ ContactForm::display() }}
            </div>
            <p class="sc-contact-ip-note">{lang 'Your IP is: %0%', $ip}</p>
        </div>
    </div>
</section>
