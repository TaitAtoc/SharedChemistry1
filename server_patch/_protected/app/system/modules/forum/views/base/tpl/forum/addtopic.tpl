{literal}
<style>
    html body main#content#content:has(.sc-forum-add-topic-v1),
    html body main#content:has(.sc-forum-add-topic-v1) {
        margin-top: 0 !important;
        padding-top: 24px !important;
    }

    .sc-forum-add-topic-v1 {
        max-width: 960px;
        margin: 0 auto;
        padding: 0 0 34px;
        color: #fff8ef;
    }

    .sc-forum-add-topic-v1 * {
        box-sizing: border-box;
    }

    .sc-forum-add-topic-hero {
        margin: 0 0 22px;
        padding: 32px;
        border: 1px solid rgba(233, 187, 99, .24);
        border-radius: 8px;
        background:
            radial-gradient(circle at top left, rgba(224, 88, 121, .23), transparent 36%),
            linear-gradient(135deg, rgba(233, 187, 99, .14), rgba(21, 16, 22, .96) 58%, rgba(8, 7, 10, .98));
        box-shadow: 0 22px 64px rgba(0, 0, 0, .34);
    }

    .sc-forum-add-topic-hero h1 {
        margin: 0;
        color: #fff8ef;
        font-size: 40px;
        font-weight: 800;
        line-height: 1.12;
        letter-spacing: 0;
    }

    .sc-forum-add-topic-hero p {
        max-width: 690px;
        margin: 14px 0 0;
        color: #ddd2c8;
        font-size: 16px;
        line-height: 1.7;
    }

    .sc-forum-add-topic-card {
        padding: 28px;
        border: 1px solid rgba(233, 187, 99, .22);
        border-radius: 8px;
        background:
            linear-gradient(180deg, rgba(255, 255, 255, .055), rgba(255, 255, 255, .018)),
            #151116;
        box-shadow: 0 20px 58px rgba(0, 0, 0, .34);
    }

    .sc-forum-add-topic-card form,
    .sc-forum-add-topic-card .pfbc-form {
        max-width: none !important;
        margin: 0 !important;
        padding: 0 !important;
        background: transparent !important;
        border: 0 !important;
        box-shadow: none !important;
    }

    .sc-forum-add-topic-card .form-group,
    .sc-forum-add-topic-card .pfbc-element,
    .sc-forum-add-topic-field,
    .sc-forum-add-topic-upload {
        margin: 0 0 18px !important;
    }

    .sc-forum-add-topic-card label,
    .sc-forum-add-topic-card .pfbc-label {
        display: block !important;
        margin: 0 0 8px !important;
        color: #ffe0a3 !important;
        font-size: 13px !important;
        font-weight: 800 !important;
        letter-spacing: 0 !important;
    }

    .sc-forum-add-topic-card input[type="text"],
    .sc-forum-add-topic-card textarea,
    .sc-forum-add-topic-card input[type="file"] {
        width: 100% !important;
        min-height: 44px !important;
        border: 1px solid rgba(233, 187, 99, .24) !important;
        border-radius: 6px !important;
        background: rgba(5, 5, 8, .72) !important;
        color: #fff8ef !important;
        font-size: 15px !important;
        line-height: 1.5 !important;
        box-shadow: inset 0 1px 0 rgba(255, 255, 255, .04) !important;
    }

    .sc-forum-add-topic-card textarea {
        min-height: 132px !important;
        resize: vertical;
    }

    .sc-forum-add-topic-card input[type="file"] {
        padding: 10px !important;
        color: #ddd2c8 !important;
    }

    .sc-forum-add-topic-card .help-block,
    .sc-forum-add-topic-card .description,
    .sc-forum-add-topic-card small {
        color: #cfc4ba !important;
        font-size: 12px !important;
        line-height: 1.5 !important;
    }

    .sc-forum-add-topic-submit,
    .sc-forum-add-topic-card button,
    .sc-forum-add-topic-card input[type="submit"] {
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        min-height: 44px !important;
        padding: 11px 18px !important;
        border: 1px solid rgba(233, 187, 99, .58) !important;
        border-radius: 6px !important;
        background: linear-gradient(135deg, rgba(233, 187, 99, .32), rgba(224, 88, 121, .25)) !important;
        color: #fff3dc !important;
        font-size: 14px !important;
        font-weight: 800 !important;
        line-height: 1.2 !important;
        text-decoration: none !important;
        box-shadow: 0 14px 34px rgba(0, 0, 0, .28) !important;
    }

    .sc-forum-add-topic-card select,
    .sc-forum-add-topic-card [name="forum"],
    .sc-forum-add-topic-card label[for="forum"] {
        display: none !important;
    }

    @media (max-width: 680px) {
        .sc-forum-add-topic-hero,
        .sc-forum-add-topic-card {
            padding: 24px;
        }

        .sc-forum-add-topic-hero h1 {
            font-size: 34px;
        }
    }
</style>
{/literal}

<!-- SC_FORUM_ADD_TOPIC_REDESIGN_V1_ACTIVE -->
<section class="sc-forum-add-topic-v1">
    <header class="sc-forum-add-topic-hero">
        <h1>Start a Discussion</h1>
        <p>Create a new topic and invite other couples to join the conversation.</p>
    </header>

    <div class="sc-forum-add-topic-card">
        {{ MsgForm::display() }}
    </div>
</section>
<!-- SC_FORUM_ADD_TOPIC_REDESIGN_V1_END -->
