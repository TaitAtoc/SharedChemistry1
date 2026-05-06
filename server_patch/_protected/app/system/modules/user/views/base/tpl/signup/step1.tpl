<style>
    .navbar,
    .navbar-default,
    .navbar-inverse,
    header .ad_468_60,
    #headings,
    main#content > .msg:empty {
        display: none !important;
    }

    main#content {
        padding-top: 0 !important;
    }

    .sharedchemistry-signup-wrap {
        float: none;
        max-width: 980px;
        margin: 34px auto 0;
        padding-left: 12px;
        padding-right: 12px;
    }

    .sharedchemistry-signup-logo {
        width: 100%;
        margin: 0 auto 28px;
        text-align: center;
    }

    .sharedchemistry-signup-logo img {
        display: block;
        width: 430px;
        max-width: 92%;
        height: auto;
        margin: 0 auto;
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
        margin: 0 0 14px;
        border-color: rgba(228, 63, 95, .34);
        background: linear-gradient(135deg, #1a1b21 0%, #15161b 58%, #24171d 100%);
    }

    .sharedchemistry-step-card {
        padding: 28px 34px 34px;
        margin: 0 auto 18px;
    }

    .sharedchemistry-step-card .form-group {
        margin-bottom: 22px;
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

    .sharedchemistry-step-card input[type="text"],
    .sharedchemistry-step-card input[type="email"],
    .sharedchemistry-step-card input[type="password"],
    .sharedchemistry-step-card select,
    .sharedchemistry-step-card textarea {
        min-height: 44px;
        background: #202128;
        border: 1px solid #3b3d47;
        border-radius: 10px;
        color: #fff;
        box-shadow: none;
    }

    .sharedchemistry-step-card input:focus,
    .sharedchemistry-step-card select:focus,
    .sharedchemistry-step-card textarea:focus {
        border-color: #e43f5f;
        box-shadow: 0 0 0 3px rgba(228, 63, 95, .18);
        outline: none;
    }

    .sharedchemistry-step-card .checkbox {
        background: #202128;
        border: 1px solid #3b3d47;
        border-radius: 12px;
        padding: 14px 16px;
        margin: 12px 0;
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
    }

    .sharedchemistry-step-card .btn:hover,
    .sharedchemistry-step-card button:hover,
    .sharedchemistry-step-card input[type="submit"]:hover {
        background: #f05572;
        color: #fff;
    }

    @media screen and (max-width: 767px) {
        .sharedchemistry-signup-wrap {
            width: 100%;
            margin-top: 22px;
        }

        .sharedchemistry-signup-logo {
            margin-bottom: 20px;
        }

        .sharedchemistry-step-intro,
        .sharedchemistry-step-card {
            padding: 22px 18px;
            border-radius: 14px;
        }
    }
</style>

<div class="col-md-12 sharedchemistry-signup-wrap sharedchemistry-signup-step1">
    <div class="sharedchemistry-signup-logo">
        <img src="{url_tpl_img}sharedchemistry/sharedchemistry-header-logo.png" alt="SharedChemistry" />
    </div>

    <section class="sharedchemistry-step-intro">
        <h2 style="margin:0 0 8px;font-size:28px;line-height:1.2;font-weight:700;color:#fff;">Sign up on SharedChemistry</h2>
        <p style="margin:0;color:#d7d2ce;font-size:16px;line-height:1.6;">Create your couple profile in a few simple steps.</p>
    </section>

    <section class="sharedchemistry-step-card">
        {{ $progressbar_percentage = 25 }}
        {{ $progressbar_step = 1 }}
        {{ $progressbar_total_steps = 4 }}
        {include 'progressbar.inc.tpl'}
        {{ JoinForm::step1() }}
    </section>
</div>
