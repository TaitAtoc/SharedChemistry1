<style>
    .sharedchemistry-signup-wrap {
        float: none;
        max-width: 980px;
        margin-top: 52px;
        margin-left: auto;
        margin-right: auto;
        padding-left: 12px;
        padding-right: 12px;
    }

    .navbar .navbar-nav > li {
        display: none !important;
    }

    .navbar .navbar-nav > li:has(.sharedchemistry-nav-signin) {
        display: block !important;
    }

    .navbar .sharedchemistry-nav-join,
    .navbar a[href*="user/browse"],
    .navbar a[href*="chat/home"],
    .navbar a[href*="picture/main"],
    .navbar a[href*="video/main"],
    .navbar a[href*="forum/forum"],
    .navbar a[href*="note/main"] {
        display: none !important;
    }

    .navbar,
    .navbar-default,
    .navbar-inverse {
        min-height: 96px !important;
    }

    .navbar #logo,
    .navbar .navbar-brand {
        padding-top: 12px !important;
        padding-bottom: 12px !important;
    }

    .navbar #logo h1 {
        width: 360px !important;
        height: 72px !important;
        margin: 0 !important;
    }

    .navbar .sharedchemistry-logo-link {
        display: block !important;
        width: 360px !important;
        height: 72px !important;
        background: url("{url_tpl_img}sharedchemistry/sharedchemistry-header-logo.png") left center / contain no-repeat !important;
    }

    .navbar .sharedchemistry-header-logo,
    .navbar .sharedchemistry-logo-link span {
        display: none !important;
    }

    .navbar #logo:before,
    .navbar #logo:after {
        content: none !important;
        display: none !important;
    }

    header .ad_468_60,
    #headings,
    main#content > .msg:empty {
        display: none !important;
    }

    main#content {
        padding-top: 0 !important;
    }

    .sharedchemistry-step-intro,
    .sharedchemistry-step-card {
        background: #15161b;
        border: 1px solid rgba(228, 63, 95, .24);
        border-radius: 18px;
        color: #f7f3ef;
        box-shadow: 0 24px 60px rgba(0, 0, 0, .28);
    }

    .sharedchemistry-step-intro {
        padding: 28px 34px;
        margin: 12px 0 14px;
        border-color: rgba(228, 63, 95, .34);
        background: linear-gradient(135deg, #1a1b21 0%, #15161b 58%, #24171d 100%);
    }

    .sharedchemistry-step-card {
        padding: 24px 34px 30px;
        margin: 0 auto 18px;
    }

    .sharedchemistry-static-step-label {
        display: inline-block;
        margin: 0 0 14px;
        padding: 8px 14px;
        border-radius: 999px;
        background: linear-gradient(90deg, #d93052 0%, #e43f5f 55%, #ff6f8d 100%);
        color: #fff;
        font-size: 13px;
        font-weight: 700;
        line-height: 1;
    }

    .sharedchemistry-card-title {
        margin: 0 0 8px;
        color: #fff;
        font-size: 22px;
        line-height: 1.3;
        font-weight: 700;
    }

    .sharedchemistry-form-helper {
        margin: 0 0 16px;
        color: #d7d2ce;
        font-size: 15px;
        line-height: 1.6;
    }

    .sharedchemistry-upload-panel {
        margin-top: 16px;
        padding: 18px;
        border: 1px dashed rgba(255, 111, 141, .58);
        border-radius: 16px;
        background: #202128;
    }

    .sharedchemistry-step-card .form-group {
        margin-bottom: 16px;
    }

    .sharedchemistry-step-card .control-label,
    .sharedchemistry-step-card label {
        color: #f7f3ef;
        font-weight: 600;
    }

    .sharedchemistry-step-card .help-block,
    .sharedchemistry-step-card .description {
        color: #bdb5b0;
    }

    .sharedchemistry-step-card input[type="file"] {
        width: 100%;
        min-height: 48px;
        padding: 12px;
        background: #15161b;
        border: 1px solid #3b3d47;
        border-radius: 10px;
        color: #f7f3ef;
    }

    .sharedchemistry-step-card .btn,
    .sharedchemistry-step-card button,
    .sharedchemistry-step-card input[type="submit"] {
        min-height: 44px;
        border: 0;
        border-radius: 999px;
        background: #e43f5f;
        color: #fff;
        font-weight: 700;
        padding: 10px 22px;
        margin-right: 8px;
    }

    .sharedchemistry-step-card .btn:hover,
    .sharedchemistry-step-card button:hover,
    .sharedchemistry-step-card input[type="submit"]:hover {
        background: #f05572;
        color: #fff;
    }

    .sharedchemistry-step-card .btn + .btn,
    .sharedchemistry-step-card button + button,
    .sharedchemistry-step-card input[type="submit"] + input[type="submit"] {
        background: #30323b;
    }

    @media screen and (max-width: 767px) {
        .sharedchemistry-signup-wrap {
            width: 100%;
            margin-top: 34px;
        }

        .navbar #logo h1,
        .navbar .sharedchemistry-logo-link {
            width: 260px !important;
            height: 54px !important;
        }

        .sharedchemistry-step-intro,
        .sharedchemistry-step-card {
            border-radius: 14px;
        }

        .sharedchemistry-step-intro,
        .sharedchemistry-step-card {
            padding: 22px 18px;
        }

        .sharedchemistry-upload-panel {
            padding: 14px;
        }
    }
</style>

<div class="col-md-12 sharedchemistry-signup-wrap sharedchemistry-signup-step4">
    <section
        class="sharedchemistry-step-intro"
    >
        <h2 style="margin:0 0 8px;font-size:28px;line-height:1.2;font-weight:700;color:#fff;">Upload your couple photo</h2>
        <p style="margin:0;color:#d7d2ce;font-size:16px;line-height:1.6;">Add one clear photo now. You can add more photos later from your profile page.</p>
    </section>

    <section
        class="sharedchemistry-step-card"
    >
        <span class="sharedchemistry-static-step-label">Photo setup</span>
        <h3 class="sharedchemistry-card-title">Add your couple photo</h3>
        <p class="sharedchemistry-form-helper">Choose a photo that represents you as a couple. More photos can be added after signup.</p>
        <div class="sharedchemistry-upload-panel">
            {{ JoinForm::step4() }}
        </div>
    </section>
</div>
