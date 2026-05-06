<style>
    .navbar,
    .navbar-default,
    .navbar-inverse,
    header .ad_468_60,
    #headings,
    main#content > .msg:empty,
    .ad_336_280 {
        display: none !important;
    }

    main#content {
        padding-top: 0 !important;
    }

    .sharedchemistry-login-wrap {
        float: none;
        max-width: 760px;
        margin: 34px auto 0;
        padding-left: 12px;
        padding-right: 12px;
    }

    .sharedchemistry-login-logo {
        width: 100%;
        margin: 0 auto 28px;
        text-align: center;
    }

    .sharedchemistry-login-logo img {
        display: block;
        width: 430px;
        max-width: 92%;
        height: auto;
        margin: 0 auto;
    }

    .sharedchemistry-login-intro,
    .sharedchemistry-login-card {
        background: #15161b;
        border: 1px solid rgba(228, 63, 95, .24);
        border-radius: 18px;
        color: #f7f3ef;
        box-shadow: 0 24px 60px rgba(0, 0, 0, .28);
    }

    .sharedchemistry-login-intro {
        padding: 28px 34px;
        margin: 0 0 14px;
        border-color: rgba(228, 63, 95, .34);
        background: linear-gradient(135deg, #1a1b21 0%, #15161b 58%, #24171d 100%);
    }

    .sharedchemistry-login-card {
        padding: 28px 34px 34px;
        margin: 0 auto 18px;
    }

    .sharedchemistry-login-card #form_login_user,
    .sharedchemistry-login-card .pfbc-form {
        width: 100%;
        margin: 0 !important;
        padding: 0 !important;
        background: transparent !important;
        border: 0 !important;
        box-shadow: none !important;
    }

    .sharedchemistry-login-card #form_login_user .form-group,
    .sharedchemistry-login-card #form_login_user .pfbc-element,
    .sharedchemistry-login-card #form_login_user .control-group {
        float: none !important;
        clear: both !important;
        width: 100% !important;
        margin: 0 0 18px !important;
    }

    .sharedchemistry-login-card #form_login_user label,
    .sharedchemistry-login-card #form_login_user .control-label,
    .sharedchemistry-login-card #form_login_user .pfbc-label,
    .sharedchemistry-login-card #form_login_user legend {
        display: block !important;
        width: 100% !important;
        margin: 0 0 8px !important;
        color: #f7f3ef !important;
        font-weight: 600 !important;
        text-align: left !important;
    }

    .sharedchemistry-login-card #form_login_user input[type="email"],
    .sharedchemistry-login-card #form_login_user input[type="password"],
    .sharedchemistry-login-card #form_login_user input[type="text"] {
        display: block !important;
        float: none !important;
        width: 100% !important;
        max-width: 100% !important;
        min-height: 44px;
        margin: 0 !important;
        background: #202128 !important;
        border: 1px solid #3b3d47 !important;
        border-radius: 10px !important;
        color: #fff !important;
        box-shadow: none !important;
        box-sizing: border-box;
    }

    .sharedchemistry-login-card #form_login_user input:focus {
        border-color: #e43f5f !important;
        box-shadow: 0 0 0 3px rgba(228, 63, 95, .18) !important;
        outline: none !important;
    }

    .sharedchemistry-login-card #form_login_user .checkbox,
    .sharedchemistry-login-card #form_login_user .bt_login_remember {
        display: block !important;
        float: none !important;
        width: 100% !important;
        margin: 0 0 20px !important;
        color: #d7d2ce !important;
    }

    .sharedchemistry-login-card #form_login_user .checkbox label,
    .sharedchemistry-login-card #form_login_user .bt_login_remember label {
        display: inline !important;
        color: #d7d2ce !important;
        font-weight: 500 !important;
    }

    .sharedchemistry-login-card #form_login_user input[type="checkbox"] {
        width: auto !important;
        height: auto !important;
        margin: 0 8px 0 0 !important;
        vertical-align: middle;
    }

    .sharedchemistry-login-card #form_login_user button,
    .sharedchemistry-login-card #form_login_user input[type="submit"],
    .sharedchemistry-login-card #form_login_user .btn,
    .sharedchemistry-login-card #form_login_user .ui-button {
        display: inline-flex !important;
        float: right !important;
        align-items: center;
        justify-content: center;
        min-height: 44px;
        margin: 0 0 18px auto !important;
        border: 0 !important;
        border-radius: 999px !important;
        background: #e43f5f !important;
        color: #fff !important;
        font-weight: 700 !important;
        padding: 10px 24px !important;
        text-shadow: none !important;
    }

    .sharedchemistry-login-card #form_login_user:after {
        content: "";
        display: table;
        clear: both;
    }

    .sharedchemistry-login-links {
        clear: both;
        margin: 4px 0 0;
        color: #d7d2ce;
        text-align: right;
    }

    .sharedchemistry-login-links a,
    .sharedchemistry-login-secondary a {
        color: #ff6f8d !important;
        text-decoration: underline;
    }

    .sharedchemistry-login-secondary {
        margin: 18px 0 0;
        color: #bdb5b0;
        text-align: center;
    }

    @media screen and (max-width: 767px) {
        .sharedchemistry-login-wrap {
            width: 100%;
            margin-top: 22px;
        }

        .sharedchemistry-login-logo {
            margin-bottom: 20px;
        }

        .sharedchemistry-login-intro,
        .sharedchemistry-login-card {
            padding: 22px 18px;
            border-radius: 14px;
        }
    }
</style>

<div class="col-md-12 sharedchemistry-login-wrap">
    <div class="sharedchemistry-login-logo">
        <img src="{url_tpl_img}sharedchemistry/sharedchemistry-header-logo.png" alt="SharedChemistry" />
    </div>

    <section class="sharedchemistry-login-intro">
        <h2 style="margin:0;font-size:28px;line-height:1.2;font-weight:700;color:#fff;">Sign In to SharedChemistry</h2>
    </section>

    <section class="sharedchemistry-login-card">
        {{ LoginForm::display() }}

        <p class="sharedchemistry-login-links">
            {{ LostPwdDesignCore::link('user') }}
            {if Framework\Mvc\Model\DbConfig::getSetting('userActivationType') == Registration::EMAIL_ACTIVATION}
                | <a rel="nofollow" href="{{ $design->url('user','main','resendactivation') }}">{lang 'Resend activation email'}</a>
            {/if}
        </p>

        <p class="sharedchemistry-login-secondary">
            {lang 'Not registered yet?'}
            <a class="underline" href="{{ $design->url('user','signup','step1') }}">
                <strong>{lang 'Join Us Today!'}</strong>
            </a>
        </p>
    </section>
</div>
