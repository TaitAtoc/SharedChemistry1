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

    .sharedchemistry-form-kicker {
        display: block;
        margin: 22px 0 6px;
        color: #ff6f8d;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: .08em;
        text-transform: uppercase;
    }

    .sharedchemistry-form-helper {
        margin: 0 0 22px;
        color: #d7d2ce;
        font-size: 15px;
        line-height: 1.6;
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
    .sharedchemistry-step-card input[type="date"],
    .sharedchemistry-step-card input[type="number"],
    .sharedchemistry-step-card select,
    .sharedchemistry-step-card textarea {
        min-height: 44px;
        background: #202128;
        border: 1px solid #3b3d47;
        border-radius: 10px;
        color: #fff;
        box-shadow: none;
    }

    .sharedchemistry-step-card textarea {
        min-height: 180px;
        line-height: 1.6;
    }

    .sharedchemistry-step-card input:focus,
    .sharedchemistry-step-card select:focus,
    .sharedchemistry-step-card textarea:focus {
        border-color: #e43f5f;
        box-shadow: 0 0 0 3px rgba(228, 63, 95, .18);
        outline: none;
    }

    .sharedchemistry-step-card .radio,
    .sharedchemistry-step-card .checkbox {
        background: #202128;
        border: 1px solid #3b3d47;
        border-radius: 12px;
        padding: 14px 16px;
        margin: 12px 0;
        transition: border-color .18s ease, background-color .18s ease, box-shadow .18s ease;
    }

    .sharedchemistry-step-card .radio:hover,
    .sharedchemistry-step-card .checkbox:hover {
        background: #262832;
        border-color: rgba(228, 63, 95, .58);
        box-shadow: 0 10px 24px rgba(0, 0, 0, .2);
    }

    .sharedchemistry-step-card label {
        cursor: pointer;
        display: block;
        margin-bottom: 0;
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
        }

        .sharedchemistry-step-intro,
        .sharedchemistry-step-card {
            border-radius: 14px;
        }

        .sharedchemistry-step-intro,
        .sharedchemistry-step-card {
            padding: 22px 18px;
        }
    }
</style>

<div class="col-md-12 sharedchemistry-signup-wrap sharedchemistry-signup-step3">
    <section
        class="sharedchemistry-step-intro"
    >
        <h2 style="margin:0 0 8px;font-size:28px;line-height:1.2;font-weight:700;color:#fff;">Tell couples about yourselves</h2>
        <p style="margin:0;color:#d7d2ce;font-size:16px;line-height:1.6;">Write a short couple profile. Keep it real, warm, and clear.</p>
    </section>

    <section
        class="sharedchemistry-step-card"
    >
        {include 'progressbar.inc.tpl'}
        <span class="sharedchemistry-form-kicker">Couple description</span>
        <p class="sharedchemistry-form-helper">Write this as a couple. Mention who you are, what you enjoy, and the kind of people you want to meet.</p>
        {{ JoinForm::step3() }}
    </section>
</div>
