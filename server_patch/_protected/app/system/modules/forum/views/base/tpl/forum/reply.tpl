{literal}
<style>
    html body main#content#content:has(.sc-forum-reply-v1),
    html body main#content:has(.sc-forum-reply-v1) {
        margin-top: 0 !important;
        padding-top: 24px !important;
    }

    .sc-forum-reply-v1 {
        max-width: 860px;
        margin: 0 auto;
        padding: 0 0 34px;
        color: #fff8ef;
    }

    .sc-forum-reply-v1 * {
        box-sizing: border-box;
    }

    .sc-forum-reply-hero {
        margin: 0 0 22px;
        padding: 32px;
        border: 1px solid rgba(233, 187, 99, .24);
        border-radius: 8px;
        background:
            radial-gradient(circle at top left, rgba(224, 88, 121, .23), transparent 36%),
            linear-gradient(135deg, rgba(233, 187, 99, .14), rgba(21, 16, 22, .96) 58%, rgba(8, 7, 10, .98));
        box-shadow: 0 22px 64px rgba(0, 0, 0, .34);
    }

    .sc-forum-reply-hero h1 {
        margin: 0;
        color: #fff8ef;
        font-size: 38px;
        font-weight: 800;
        line-height: 1.12;
        letter-spacing: 0;
    }

    .sc-forum-reply-hero p {
        max-width: 620px;
        margin: 14px 0 0;
        color: #ddd2c8;
        font-size: 16px;
        line-height: 1.7;
    }

    .sc-forum-reply-card {
        padding: 28px;
        border: 1px solid rgba(233, 187, 99, .22);
        border-radius: 8px;
        background:
            linear-gradient(180deg, rgba(255, 255, 255, .055), rgba(255, 255, 255, .018)),
            #151116;
        box-shadow: 0 20px 58px rgba(0, 0, 0, .34);
    }

    .sc-forum-reply-card form,
    .sc-forum-reply-card .pfbc-form {
        max-width: none !important;
        margin: 0 !important;
        padding: 0 !important;
        background: transparent !important;
        border: 0 !important;
        box-shadow: none !important;
    }

    .sc-forum-reply-card .form-group,
    .sc-forum-reply-card .pfbc-element,
    .sc-forum-reply-field,
    .sc-forum-reply-upload {
        margin: 0 0 18px !important;
    }

    .sc-forum-reply-card label,
    .sc-forum-reply-card .pfbc-label {
        display: block !important;
        margin: 0 0 8px !important;
        color: #ffe0a3 !important;
        font-size: 13px !important;
        font-weight: 800 !important;
        letter-spacing: 0 !important;
    }

    .sc-forum-reply-card textarea,
    .sc-forum-reply-card input[type="file"] {
        width: 100% !important;
        min-height: 44px !important;
        border: 1px solid rgba(233, 187, 99, .24) !important;
        border-radius: 6px !important;
        background: rgba(5, 5, 8, .72) !important;
        color: #fff8ef !important;
        font-size: 15px !important;
        line-height: 1.5 !important;
    }

    .sc-forum-reply-card textarea {
        min-height: 160px !important;
        resize: vertical;
    }

    .sc-forum-reply-card input[type="file"] {
        padding: 10px !important;
        color: #ddd2c8 !important;
    }

    .sc-forum-reply-submit,
    .sc-forum-reply-card button,
    .sc-forum-reply-card input[type="submit"] {
        display: inline-flex !important;
        min-height: 44px !important;
        align-items: center !important;
        justify-content: center !important;
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

    @media (max-width: 680px) {
        .sc-forum-reply-hero,
        .sc-forum-reply-card {
            padding: 24px;
        }

        .sc-forum-reply-hero h1 {
            font-size: 32px;
        }
    }
</style>
{/literal}

<!-- SC_FORUM_REPLY_REDESIGN_V1_ACTIVE -->
<section class="sc-forum-reply-v1">
    <header class="sc-forum-reply-hero">
        <h1>Reply</h1>
        <p>Add your reply to this discussion and keep the conversation moving.</p>
    </header>

    <div class="sc-forum-reply-card">
        {{ ReplyMsgForm::display() }}
    </div>
</section>
<!-- SC_FORUM_REPLY_REDESIGN_V1_END -->
