<style>
    .sharedchemistry-signup-wrap {
        float: none;
        max-width: 980px;
        margin-left: auto;
        margin-right: auto;
        padding-left: 12px;
        padding-right: 12px;
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
        padding: 28px 34px 34px;
        margin: 0 auto 18px;
    }

    .sharedchemistry-upload-panel {
        margin-top: 22px;
        padding: 22px;
        border: 1px dashed rgba(255, 111, 141, .58);
        border-radius: 16px;
        background: #202128;
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
            padding: 16px;
        }
    }
</style>

<div class="col-md-12 sharedchemistry-signup-wrap sharedchemistry-signup-step4">
    <section
        class="sharedchemistry-step-intro"
    >
        <h2 style="margin:0 0 8px;font-size:28px;line-height:1.2;font-weight:700;color:#fff;">Add your couple photo</h2>
        <p style="margin:0;color:#d7d2ce;font-size:16px;line-height:1.6;">Upload a clear photo that represents you as a couple. You can update it later.</p>
    </section>

    <section
        class="sharedchemistry-step-card"
    >
        {include 'progressbar.inc.tpl'}
        <div class="sharedchemistry-upload-panel">
            {{ $avatarDesign->lightBox() }}
            {{ JoinForm::step4() }}
        </div>
    </section>
</div>
