{literal}
<style>
    body{background:#101114!important}
    main#content{width:min(1080px,calc(100vw - 48px))!important;max-width:none!important;margin:0 auto!important;padding:140px 0 90px!important;background:transparent!important;border:0!important;box-shadow:none!important}
    .sc-chatroom,
    .sc-chatroom *{box-sizing:border-box}
    .sc-chatroom{display:grid;gap:16px;color:#f7f3ef}
    .sc-chatroom-header{padding:22px;border:1px solid rgba(247,243,239,.08);border-radius:10px;background:#17181d;box-shadow:0 16px 34px rgba(0,0,0,.24)}
    .sc-chatroom-header h1{margin:0 0 7px;color:#f7f3ef;font-size:30px;font-weight:800;line-height:1.15}
    .sc-chatroom-header p{margin:0;color:#b8b3b0;font-size:14px;line-height:1.45}
    .sc-chatroom-panel{display:grid;gap:14px;padding:18px;border:1px solid rgba(247,243,239,.08);border-radius:10px;background:#17181d;box-shadow:0 16px 34px rgba(0,0,0,.22)}
    .sc-chatroom-list{display:grid;gap:12px;max-height:540px;overflow:auto;padding:2px 2px 4px}
    .sc-chatroom-message{display:grid;grid-template-columns:52px minmax(0,1fr);gap:12px;align-items:start;padding:14px;border:1px solid rgba(247,243,239,.08);border-radius:10px;background:#202127}
    .sc-chatroom-avatar{display:block;width:52px;height:52px;overflow:hidden;border:1px solid rgba(247,243,239,.08);border-radius:12px;background:#101114 url('{/literal}{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png{literal}') center/cover no-repeat}
    .sc-chatroom-avatar img{display:block;width:100%;height:100%;object-fit:cover;border:0!important;border-radius:12px!important;box-shadow:none!important;color:transparent;font-size:0;line-height:0;text-indent:-9999px}
    .sc-chatroom-meta{display:flex;flex-wrap:wrap;gap:8px;align-items:baseline;margin-bottom:6px}
    .sc-chatroom-name{max-width:100%;overflow:hidden;color:#f7f3ef;font-size:15px;font-weight:800;line-height:1.25;text-overflow:ellipsis;white-space:nowrap}
    .sc-chatroom-time{color:#8f8986;font-size:12px;font-weight:700;line-height:1.25}
    .sc-chatroom-text{margin:0;color:#f7f3ef;font-size:15px;line-height:1.55;overflow-wrap:anywhere;white-space:normal}
    .sc-chatroom-empty,
    .sc-chatroom-error{padding:16px;border:1px solid rgba(247,243,239,.08);border-radius:10px;background:#202127;color:#b8b3b0;font-size:14px;line-height:1.5}
    .sc-chatroom-error{border-color:rgba(236,8,104,.45);color:#ffb8d5}
    .sc-chatroom-form{display:grid;gap:10px;margin:0;padding-top:4px}
    .sc-chatroom-form textarea{display:block;width:100%;min-height:94px;resize:vertical;padding:14px;border:1px solid rgba(247,243,239,.12);border-radius:10px;background:#101114;color:#f7f3ef;font-size:15px;line-height:1.45;box-shadow:none!important}
    .sc-chatroom-form textarea:focus{border-color:rgba(236,8,104,.7);outline:0;box-shadow:0 0 0 3px rgba(236,8,104,.14)!important}
    .sc-chatroom-actions{display:flex;align-items:center;justify-content:space-between;gap:12px}
    .sc-chatroom-helper{color:#8f8986;font-size:12px;font-weight:700}
    .sc-chatroom-send{display:inline-flex!important;align-items:center;justify-content:center;min-width:128px;min-height:42px;padding:10px 18px!important;border:0!important;border-radius:999px!important;background:#ec0868!important;background-image:linear-gradient(90deg,#ec0868,#c200fb)!important;color:#fff!important;font-size:14px!important;font-weight:800!important;line-height:1!important;text-decoration:none!important;text-shadow:none!important;box-shadow:none!important;cursor:pointer}
    .sc-chatroom-send:hover,
    .sc-chatroom-send:focus{background:#f32482!important;background-image:linear-gradient(90deg,#f32482,#d035ff)!important;color:#fff!important}
    @media (max-width:767px){
        main#content{width:min(100%,calc(100vw - 20px))!important;padding:108px 0 72px!important}
        .sc-chatroom-header,
        .sc-chatroom-panel{padding:16px}
        .sc-chatroom-header h1{font-size:26px}
        .sc-chatroom-message{grid-template-columns:44px minmax(0,1fr);padding:12px}
        .sc-chatroom-avatar{width:44px;height:44px}
        .sc-chatroom-actions{align-items:stretch;flex-direction:column}
        .sc-chatroom-send{width:100%}
    }
</style>
{/literal}

<div class="sc-chatroom">
    <section class="sc-chatroom-header">
        <h1>{lang 'Shared Chat Room'}</h1>
        <p>{lang 'Talk with other verified SharedChemistry couples in the shared room.'}</p>
    </section>

    <section class="sc-chatroom-panel">
        {if !empty($chat_error)}
            <p class="sc-chatroom-error">{chat_error}</p>
        {/if}

        {if !$table_ready}
            <p class="sc-chatroom-error">{lang 'The chat room database table has not been created yet.'}</p>
        {else}
            <div class="sc-chatroom-list" data-chatroom-list="1" data-messages-url="{{ $design->url('chat','home','messages') }}" data-avatar-fallback="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" data-empty-text="{lang 'No messages yet. Start the conversation.'}" aria-live="polite">
                {if empty($chat_messages)}
                    <p class="sc-chatroom-empty">{lang 'No messages yet. Start the conversation.'}</p>
                {else}
                    {each $message in $chat_messages}
                        <article class="sc-chatroom-message">
                            <span class="sc-chatroom-avatar">
                                <img src="{% $message->avatarUrl %}" alt="{% escape($message->displayName) %}" loading="lazy" onerror="this.onerror=null;this.src='{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png';" />
                            </span>
                            <div>
                                <div class="sc-chatroom-meta">
                                    <span class="sc-chatroom-name">{% escape($message->displayName) %}</span>
                                    <span class="sc-chatroom-time">{% escape($message->displayTime) %}</span>
                                </div>
                                <p class="sc-chatroom-text">{% escape($message->messageText) %}</p>
                            </div>
                        </article>
                    {/each}
                {/if}
            </div>

            <form class="sc-chatroom-form" method="post" action="/free-chat-room">
                {{ $designSecurity->inputToken('sharedchemistry_chatroom') }}
                <textarea name="message" maxlength="500" required="required" placeholder="{lang 'Write a short message...'}"></textarea>
                <div class="sc-chatroom-actions">
                    <span class="sc-chatroom-helper">{lang 'Maximum 500 characters.'}</span>
                    <button class="sc-chatroom-send" type="submit">{lang 'Send'}</button>
                </div>
            </form>
        {/if}
    </section>
</div>

{literal}
<script>
    (function() {
        var list = document.querySelector('[data-chatroom-list="1"]');

        if (!list || !window.fetch) {
            return;
        }

        var messagesUrl = list.getAttribute('data-messages-url');
        var avatarFallback = list.getAttribute('data-avatar-fallback') || '';
        var emptyText = list.getAttribute('data-empty-text') || '';
        var lastSignature = '';
        var isPolling = false;

        function isNearBottom() {
            return list.scrollHeight - list.scrollTop - list.clientHeight < 80;
        }

        function setText(node, text) {
            node.textContent = text || '';
        }

        function renderMessages(messages) {
            var shouldScroll = isNearBottom();
            var fragment = document.createDocumentFragment();

            if (!messages.length) {
                var empty = document.createElement('p');
                empty.className = 'sc-chatroom-empty';
                setText(empty, emptyText);
                fragment.appendChild(empty);
            } else {
                messages.forEach(function(message) {
                    var article = document.createElement('article');
                    var avatarWrap = document.createElement('span');
                    var avatar = document.createElement('img');
                    var body = document.createElement('div');
                    var meta = document.createElement('div');
                    var name = document.createElement('span');
                    var time = document.createElement('span');
                    var text = document.createElement('p');

                    article.className = 'sc-chatroom-message';
                    avatarWrap.className = 'sc-chatroom-avatar';
                    avatar.src = message.avatarUrl || avatarFallback;
                    avatar.alt = message.displayName || '';
                    avatar.loading = 'lazy';
                    avatar.onerror = function() {
                        this.onerror = null;
                        this.src = avatarFallback;
                    };
                    meta.className = 'sc-chatroom-meta';
                    name.className = 'sc-chatroom-name';
                    time.className = 'sc-chatroom-time';
                    text.className = 'sc-chatroom-text';

                    setText(name, message.displayName);
                    setText(time, message.displayTime);
                    setText(text, message.messageText);

                    avatarWrap.appendChild(avatar);
                    meta.appendChild(name);
                    meta.appendChild(time);
                    body.appendChild(meta);
                    body.appendChild(text);
                    article.appendChild(avatarWrap);
                    article.appendChild(body);
                    fragment.appendChild(article);
                });
            }

            list.innerHTML = '';
            list.appendChild(fragment);

            if (shouldScroll) {
                list.scrollTop = list.scrollHeight;
            }
        }

        function pollMessages() {
            if (isPolling) {
                return;
            }

            isPolling = true;

            fetch(messagesUrl, {
                credentials: 'same-origin',
                headers: {
                    'Accept': 'application/json'
                }
            })
                .then(function(response) {
                    return response.ok ? response.json() : null;
                })
                .then(function(payload) {
                    var messages = payload && payload.messages ? payload.messages : [];
                    var signature = messages.map(function(message) {
                        return message.messageId + ':' + message.displayTime;
                    }).join('|');

                    if (signature !== lastSignature) {
                        lastSignature = signature;
                        renderMessages(messages);
                    }
                })
                .catch(function() {})
                .then(function() {
                    isPolling = false;
                });
        }

        if (isNearBottom()) {
            list.scrollTop = list.scrollHeight;
        }

        pollMessages();
        window.setInterval(pollMessages, 5000);
    })();
</script>
{/literal}
