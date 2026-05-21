{literal}
<style>
    html body main#content#content:has(.sc-forum-post-v1),
    html body main#content:has(.sc-forum-post-v1) {
        margin-top: 0 !important;
        padding-top: 24px !important;
    }

    .sc-forum-post-v1 {
        max-width: 1040px;
        margin: 0 auto;
        padding: 0 0 34px;
        color: #fff8ef;
        text-align: left;
    }

    .sc-forum-post-v1 * {
        box-sizing: border-box;
    }

    .sc-forum-post-hero,
    .sc-forum-post-body,
    .sc-forum-post-reply {
        border: 1px solid rgba(233, 187, 99, .22);
        border-radius: 8px;
        background:
            linear-gradient(180deg, rgba(255, 255, 255, .055), rgba(255, 255, 255, .018)),
            #151116;
        box-shadow: 0 20px 58px rgba(0, 0, 0, .34);
    }

    .sc-forum-post-hero {
        margin: 0 0 18px;
        padding: 32px;
        background:
            radial-gradient(circle at top left, rgba(224, 88, 121, .23), transparent 36%),
            linear-gradient(135deg, rgba(233, 187, 99, .14), rgba(21, 16, 22, .96) 58%, rgba(8, 7, 10, .98));
    }

    .sc-forum-post-hero h1 {
        margin: 0;
        color: #fff8ef;
        font-size: 40px;
        font-weight: 800;
        line-height: 1.12;
        letter-spacing: 0;
    }

    .sc-forum-post-hero p {
        margin: 14px 0 0;
        color: #ddd2c8;
        font-size: 15px;
        line-height: 1.7;
    }

    .sc-forum-post-body,
    .sc-forum-post-reply {
        margin: 0 0 18px;
        padding: 28px;
    }

    .sc-forum-post-content {
        color: #f4ece4;
        font-size: 16px;
        line-height: 1.8;
    }

    .sc-forum-post-gallery {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
        gap: 14px;
        margin: 24px 0 0;
    }

    .sc-forum-post-photo {
        display: block;
        overflow: hidden;
        border: 1px solid rgba(233, 187, 99, .22);
        border-radius: 8px;
        background: #0d0b0f;
    }

    .sc-forum-post-photo img {
        display: block;
        width: 100%;
        aspect-ratio: 4 / 3;
        object-fit: cover;
    }

    .sc-forum-post-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        margin-top: 22px;
    }

    .sc-forum-post-actions a,
    .sc-forum-post-actions a:visited {
        display: inline-flex;
        min-height: 38px;
        align-items: center;
        justify-content: center;
        padding: 9px 14px;
        border: 1px solid rgba(233, 187, 99, .52);
        border-radius: 6px;
        background: linear-gradient(135deg, rgba(233, 187, 99, .28), rgba(224, 88, 121, .2));
        color: #fff3dc;
        font-size: 13px;
        font-weight: 800;
        line-height: 1.2;
        text-decoration: none;
    }

    .sc-forum-post-meta {
        margin-top: 18px;
        color: #cfc4ba;
        font-size: 12px;
        line-height: 1.5;
    }

    .sc-forum-post-reply-item {
        margin-top: 18px;
        padding-top: 18px;
        border-top: 1px solid rgba(233, 187, 99, .16);
    }

    @media (max-width: 680px) {
        .sc-forum-post-hero,
        .sc-forum-post-body,
        .sc-forum-post-reply {
            padding: 24px;
        }

        .sc-forum-post-hero h1 {
            font-size: 34px;
        }
    }
</style>
{/literal}

<!-- SC_FORUM_POST_VIEW_V1_ACTIVE -->
<section class="sc-forum-post-v1">
    {if empty($error)}
        {if empty($post->username)}
            {{ $post->username = PH7_GHOST_USERNAME }}
        {/if}

        <header class="sc-forum-post-hero">
            <h1>{% escape($post->title, true) %}</h1>
            {if !empty($post_extra) AND !empty($post_extra->short_description)}
                <p>{% escape($post_extra->short_description, true) %}</p>
            {/if}
            <p class="sc-forum-post-meta">
                {lang 'Posted on %0%', $dateTime->get($post->createdDate)->dateTime()}
                {if !empty($post->username)}
                    - {% escape($post->username, true) %}
                {/if}
            </p>
        </header>

        <article class="sc-forum-post-body">
            <div class="sc-forum-post-content">
                {% Framework\Parse\Emoticon::init(escape($post->message, true)) %}
            </div>

            {if !empty($post_photos)}
                <div class="sc-forum-post-gallery">
                    {each $photo in $post_photos}
                        <a class="sc-forum-post-photo" href="/{% escape($photo->public_path, true) %}" data-popup="image" title="{% escape($photo->original_name, true) %}">
                            <img src="/{% escape($photo->public_path, true) %}" alt="{% escape($photo->original_name, true) %}" />
                        </a>
                    {/each}
                </div>
            {/if}

            <div class="sc-forum-post-actions">
                <a rel="nofollow" href="{{ $design->url('forum', 'forum', 'reply', "$post->name,$post->forumId,$post->title,$post->topicId") }}">{lang 'Reply'}</a>
                {if $is_user_auth AND $member_id == $post->profileId}
                    <a href="{{ $design->url('forum', 'forum', 'edittopic', "$post->name,$post->forumId,$post->title,$post->topicId") }}">{lang 'Edit'}</a>
                    {{ $design->popupLinkConfirm(t('Delete Topic'), 'forum', 'forum', 'deletetopic', $post->topicId.'_'.$post->forumId.'_'.$post->name, 'btn btn-default btn-sm') }}
                {/if}
            </div>
        </article>

        {if !empty($messages)}
            <section class="sc-forum-post-reply">
                <h2>{lang 'Replies'}</h2>
                {each $msg in $messages}
                    {{ $relative_url = Framework\Mvc\Router\Uri::get('forum', 'forum', 'post', "$post->name,$post->forumId,$post->title,$post->topicId") . '#' . $msg->messageId }}
                    <article class="sc-forum-post-reply-item" id="{% $msg->messageId %}">
                        <div class="sc-forum-post-content">
                            {% Framework\Parse\Emoticon::init(Framework\Parse\User::atUsernameToLink(escape($msg->message, true))) %}
                        </div>
                        <p class="sc-forum-post-meta">
                            <a href="{relative_url}">#</a>
                            {lang 'Posted on %0%', $dateTime->get($msg->createdDate)->dateTime()}
                            {if !empty($msg->username)}
                                - {% escape($msg->username, true) %}
                            {/if}
                        </p>
                        {if $is_user_auth AND $member_id == $msg->profileId}
                            <div class="sc-forum-post-actions">
                                <a href="{{ $design->url('forum', 'forum', 'editmessage', "$post->name,$post->forumId,$post->title,$msg->topicId,$msg->messageId") }}">{lang 'Edit'}</a>
                                {{ $design->popupLinkConfirm(t('Delete Post'), 'forum', 'forum', 'deletemessage', $msg->messageId.'_'.$msg->topicId.'_'.$post->forumId.'_'.$post->title.'_'.$post->name, 'btn btn-default btn-sm') }}
                            </div>
                        {/if}
                    </article>
                {/each}
                {main_include 'page_nav.inc.tpl'}
            </section>
        {/if}
    {else}
        <article class="sc-forum-post-body">{error}</article>
    {/if}
</section>
<!-- SC_FORUM_POST_VIEW_V1_END -->
