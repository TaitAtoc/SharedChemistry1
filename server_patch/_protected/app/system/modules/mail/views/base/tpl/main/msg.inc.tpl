{literal}
<style>
body {
    background: #101114 !important;
}

#headings {
    display: none !important;
}

main#content {
    max-width: 1120px !important;
    margin: 0 auto !important;
    padding: 44px 15px 104px !important;
    background: transparent !important;
    border: 0 !important;
    box-shadow: none !important;
}

.sc-single-mail,
.sc-single-mail * {
    box-sizing: border-box;
}

.sc-single-mail {
    width: min(100%, 1060px);
    margin: 0 auto;
    color: #F7F3EF;
}

.sc-single-mail-title {
    margin: 0 0 22px;
}

.sc-single-mail-title h1 {
    margin: 0;
    color: #F7F3EF;
    font-size: 34px;
    font-weight: 800;
    line-height: 1.15;
}

.sc-single-mail-card {
    width: 100%;
    padding: 26px;
    background: #17181D;
    border: 1px solid rgba(247, 243, 239, .09);
    border-radius: 14px;
    box-shadow: 0 22px 55px rgba(0, 0, 0, .28);
}

.sc-single-mail-meta {
    display: grid;
    grid-template-columns: 58px minmax(0, 1fr);
    gap: 15px;
    align-items: center;
    padding-bottom: 20px;
    border-bottom: 1px solid rgba(247, 243, 239, .08);
}

.sc-single-mail-avatar {
    width: 52px;
    height: 52px;
    overflow: hidden;
    border-radius: 50%;
    background: #202127;
    border: 1px solid rgba(236, 8, 104, .35);
}

.sc-single-mail-avatar img,
.sc-single-mail-avatar .avatar {
    width: 100% !important;
    height: 100% !important;
    object-fit: cover;
    border-radius: 50%;
}

.sc-single-mail-author {
    margin: 0 0 5px;
    color: #F7F3EF;
    font-size: 15px;
    font-weight: 800;
    line-height: 1.25;
}

.sc-single-mail-date {
    color: #B8B3B0;
    font-size: 13px;
}

.sc-single-mail-subject {
    margin: 22px 0 14px;
    color: #F7F3EF;
    font-size: 24px;
    font-weight: 800;
    line-height: 1.25;
}

.sc-single-mail-body {
    min-height: 170px;
    padding: 20px;
    color: #F7F3EF;
    background: #202127;
    border: 1px solid rgba(247, 243, 239, .07);
    border-radius: 12px;
    font-size: 16px;
    line-height: 1.65;
    overflow-wrap: anywhere;
}

.sc-single-mail-actions {
    display: flex;
    flex-wrap: wrap;
    gap: 12px;
    align-items: center;
    justify-content: flex-start;
    margin-top: 22px;
}

.sc-single-mail-actions form {
    display: inline-flex;
    margin: 0;
}

.sc-single-mail-reply,
.sc-single-mail-secondary form button,
.sc-single-mail-secondary form input[type="submit"] {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-width: 132px;
    min-height: 42px;
    padding: 0 20px;
    border-radius: 999px;
    font-size: 14px;
    font-weight: 800;
    line-height: 1;
    text-decoration: none !important;
    cursor: pointer;
}

.sc-single-mail-reply {
    color: #fff !important;
    background: linear-gradient(135deg, #EC0868, #C200FB);
    border: 1px solid rgba(236, 8, 104, .78);
}

.sc-single-mail-reply:hover,
.sc-single-mail-reply:focus {
    color: #fff !important;
    filter: brightness(1.08);
    text-decoration: none !important;
}

.sc-single-mail-secondary form button,
.sc-single-mail-secondary form input[type="submit"] {
    color: #F7F3EF !important;
    background: transparent !important;
    border: 1px solid rgba(247, 243, 239, .22) !important;
    box-shadow: none !important;
}

.sc-single-mail-secondary form button:hover,
.sc-single-mail-secondary form button:focus,
.sc-single-mail-secondary form input[type="submit"]:hover,
.sc-single-mail-secondary form input[type="submit"]:focus {
    border-color: rgba(236, 8, 104, .65) !important;
    background: rgba(236, 8, 104, .08) !important;
}

.sc-single-mail-empty {
    width: min(100%, 760px);
    margin: 0 auto;
    padding: 28px;
    color: #B8B3B0;
    background: #17181D;
    border: 1px solid rgba(247, 243, 239, .09);
    border-radius: 14px;
    text-align: center;
}

@media (max-width: 680px) {
    main#content {
        padding: 30px 12px 90px !important;
    }

    .sc-single-mail-title h1 {
        font-size: 28px;
    }

    .sc-single-mail-card {
        padding: 18px;
    }

    .sc-single-mail-meta {
        grid-template-columns: 48px minmax(0, 1fr);
        gap: 12px;
    }

    .sc-single-mail-avatar {
        width: 46px;
        height: 46px;
    }

    .sc-single-mail-subject {
        font-size: 20px;
    }

    .sc-single-mail-body {
        min-height: 150px;
        padding: 16px;
    }

    .sc-single-mail-actions {
        align-items: stretch;
        flex-direction: column;
    }

    .sc-single-mail-actions form,
    .sc-single-mail-reply,
    .sc-single-mail-secondary,
    .sc-single-mail-secondary form button,
    .sc-single-mail-secondary form input[type="submit"] {
        width: 100%;
    }
}
</style>
{/literal}

{if empty($msg)}
    <div class="sc-single-mail-empty">
        <p>{lang 'That message was not found.'}</p>
    </div>
{else}
    {* Set Variables *}
    {{ $username_sender = (empty($msg->username)) ? PH7_ADMIN_USERNAME : escape($msg->username) }}
    {{ $firstName_sender = (empty($msg->firstName)) ? PH7_ADMIN_USERNAME : escape($msg->firstName) }}
    {{ $subject = escape(Framework\Security\Ban\Ban::filterWord($msg->title)) }}
    {{ $message = Framework\Parse\Emoticon::init(Framework\Security\Ban\Ban::filterWord($msg->message)) }}
    {{ $is_outbox = ($msg->sender == $member_id) }}
    {{ $is_trash = (($msg->sender == $member_id && $msg->trash == 'sender') || ($msg->recipient == $member_id && $msg->trash == 'recipient') && !$is_outbox) }}
    {{ $is_delete = ($is_outbox || $is_trash) }}
    {{ $set_to = ($is_delete) ? 'setdelete' : 'settrash' }}
    {{ $label_txt = ($is_delete) ? t('Delete') : t('Trash') }}

    <div class="sc-single-mail">
        <div class="sc-single-mail-title">
            <h1>{lang 'Message'}</h1>
        </div>

        <article class="sc-single-mail-card">
            <div class="sc-single-mail-meta">
                <div class="sc-single-mail-avatar">
                    {{ $avatarDesign->get($username_sender, $firstName_sender, null, 52) }}
                </div>

                <div>
                    <p class="sc-single-mail-author">{% $firstName_sender %}</p>
                    <span class="sc-single-mail-date">{% Framework\Date\Various::textTimeStamp($msg->sendDate) %}</span>
                </div>
            </div>

            <h2 class="sc-single-mail-subject">{% $subject %}</h2>

            <div class="sc-single-mail-body">
                {% $message %}
            </div>

            <div class="sc-single-mail-actions">
                <a class="sc-single-mail-reply" href="{{ $design->url('mail','main','compose',"$username_sender,$subject") }}">{lang 'Reply'}</a>
                <span class="sc-single-mail-secondary">{{ LinkCoreForm::display($label_txt, 'mail', 'main', $set_to, array('id'=>$msg->messageId)) }}</span>
                {if $is_trash}
                    <span class="sc-single-mail-secondary">{{ LinkCoreForm::display(t('Move to Inbox'), 'mail', 'main', 'setrestore', array('id'=>$msg->messageId)) }}</span>
                {/if}
            </div>
        </article>
    </div>
{/if}
