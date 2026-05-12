{if empty($error)}
    <div class="sc-mail-list-shell">
        <form class="sc-mail-list-form" method="post" action="{{ $design->url('mail','main','inbox') }}">
            {{ $designSecurity->inputToken('mail_action') }}

            {* Set Variables *}
            {{ $is_admin = ($is_admin_auth && !$is_user_auth) }}
            {{ $ctrl = ($is_admin) ? 'admin' : 'main' }}

            {if $is_admin}<div class="divShow">{/if}

            <div class="sc-mail-list">
                {each $msg in $msgs}
                    {* Set Variables *}
                    {{ $username_sender = (empty($msg->username)) ? PH7_ADMIN_USERNAME : $msg->username }}
                    {{ $firstName_sender = (empty($msg->firstName)) ? PH7_ADMIN_USERNAME : $msg->firstName }}
                    {{ $subject = escape(substr(Framework\Security\Ban\Ban::filterWord($msg->title, false),0,20), true) }}
                    {{ $message = escape(Framework\Security\Ban\Ban::filterWord($msg->message), true) }}
                    {{ $is_outbox = ($msg->sender == $member_id) }}
                    {{ $is_trash = (($msg->sender == $member_id && $msg->trash == 'sender') || ($msg->recipient == $member_id && $msg->trash == 'recipient') && !$is_outbox && !$is_admin) }}
                    {{ $slug_url = ($is_trash ? 'trash' : ($is_outbox ? 'outbox' : 'inbox')) }}
                    {{ $is_delete = ($is_outbox || $is_trash || $is_admin) }}
                    {{ $move_to = ($is_delete) ? 'delete' : 'trash' }}
                    {{ $label_txt = ($is_delete) ? t('Delete') : t('Trash') }}

                    {if $msg->status == MailModel::UNREAD_STATUS}
                        <div class="sc-mail-card msg_content is-unread" id="mail_{% $msg->messageId %}">
                    {else}
                        <div class="sc-mail-card msg_content" id="mail_{% $msg->messageId %}">
                    {/if}
                        <div class="sc-mail-select">
                            <input type="checkbox" name="action[]" value="{% $msg->messageId %}" />
                        </div>

                        <div class="sc-mail-avatar">
                            {{ $avatarDesign->get($username_sender, $firstName_sender, null, 48) }}
                        </div>

                        {if $is_admin}
                            <a class="sc-mail-main" href="#divShow_{% $msg->messageId %}" title="{lang 'See more'}">
                        {else}
                            <a class="sc-mail-main" href="{{ $design->url('mail','main',$slug_url,$msg->messageId) }}" title="{lang 'See more'}">
                        {/if}
                            <span class="sc-mail-row-top">
                                <span class="sc-mail-sender">{% $firstName_sender %}</span>
                                {if $msg->status == MailModel::UNREAD_STATUS}
                                    <span class="sc-mail-badge">{lang 'New'}</span>
                                {/if}
                            </span>
                            <span class="sc-mail-subject">{% $subject %}</span>
                            <span class="sc-mail-preview">{% substr($message,0,110) %}</span>
                            <span class="sc-mail-date">{% Framework\Date\Various::textTimeStamp($msg->sendDate) %}</span>
                        </a>

                        {if $is_admin}
                            {* Hide the message *}
                            <div class="hidden center" id="divShow_{% $msg->messageId %}">{% $message %}</div>
                        {/if}

                        <div class="sc-mail-actions action">
                            <a class="sc-mail-action" href="{{ $design->url('mail','main','compose',"$username_sender,$subject") }}">{lang 'Reply'}</a>
                            <a class="sc-mail-action is-danger" href="javascript:void(0)" onclick="mail('{% $move_to %}',{% $msg->messageId %},'{% $csrf_token %}')">{% $label_txt %}</a>
                            {if $is_trash}
                                <a class="sc-mail-action" href="javascript:void(0)" onclick="mail('restore',{% $msg->messageId %},'{% $csrf_token %}')">{lang 'Restore'}</a>
                            {/if}
                        </div>
                    </div>
                {/each}
            </div>

            {if $is_admin}
                </div>
            {/if}

            <div class="sc-mail-bulk">
                <label class="sc-mail-bulk-check">
                    <input type="checkbox" name="all_action" />
                    <span>{lang 'Select all'}</span>
                </label>

                <div class="sc-mail-bulk-actions">
                    <button
                        class="sc-mail-bulk-button"
                        type="submit"
                        onclick="return checkChecked()"
                        formaction="{{ $design->url('mail',$ctrl,'set'.$move_to.'all') }}"
                        >{% $label_txt %}
                    </button>
                    {if $is_trash}
                        <button class="sc-mail-bulk-button" type="submit" onclick="return checkChecked(false)" formaction="{{ $design->url('mail',$ctrl,'setrestoreall') }}">{lang 'Move to Inbox'}</button>
                    {/if}
                </div>
            </div>
        </form>
    </div>
    {main_include 'page_nav.inc.tpl'}
{else}
    <div class="sc-mail-empty">
        <p>{error}</p>
    </div>
{/if}
