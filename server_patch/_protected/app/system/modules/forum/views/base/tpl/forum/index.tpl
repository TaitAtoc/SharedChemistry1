{literal}
<style>
    html body main#content#content:has(.sc-forum-real-home-v1),
    html body main#content:has(.sc-forum-real-home-v1) {
        margin-top: 0 !important;
        padding-top: 24px !important;
    }

    .sc-forum-real-home-v1 {
        max-width: 1180px;
        margin: 0 auto !important;
        padding: 0 0 34px !important;
        color: #fff8ef;
        text-align: left;
    }

    .sc-forum-real-home-v1 * {
        box-sizing: border-box;
    }

    .sc-forum-real-home-v1 header {
        margin: 0 0 24px;
        padding: 34px;
        border: 1px solid rgba(233, 187, 99, .24);
        border-radius: 8px;
        background:
            radial-gradient(circle at top left, rgba(224, 88, 121, .24), transparent 34%),
            linear-gradient(135deg, rgba(233, 187, 99, .15), rgba(22, 17, 23, .96) 56%, rgba(10, 8, 12, .98));
        box-shadow: 0 22px 70px rgba(0, 0, 0, .32);
    }

    .sc-forum-real-home-v1 h1 {
        margin: 0;
        color: #fff8ef;
        font-size: 42px;
        font-weight: 800;
        line-height: 1.12;
        letter-spacing: 0;
    }

    .sc-forum-real-home-v1 header p {
        max-width: 720px;
        margin: 14px 0 0;
        color: #ddd2c8;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-forum-real-home-v1 h2 {
        margin: 30px 0 16px;
        color: #ffe0a3;
        font-size: 18px;
        font-weight: 800;
        letter-spacing: 0;
    }

    .sc-forum-real-grid {
        display: grid !important;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)) !important;
        gap: 22px !important;
        align-items: stretch !important;
    }

    .sc-forum-real-card {
        position: relative;
        display: flex !important;
        min-height: 242px !important;
        flex-direction: column !important;
        justify-content: space-between !important;
        overflow: hidden;
        padding: 24px;
        border: 1px solid rgba(233, 187, 99, .28);
        border-radius: 8px;
        background-color: #171017;
        background-image:
            linear-gradient(135deg, rgba(12, 8, 12, .86), rgba(42, 15, 32, .72) 46%, rgba(7, 6, 9, .92)),
            url('/templates/themes/base/img/sharedchemistry/discussion-box-image.png');
        background-position: center;
        background-size: cover;
        box-shadow: 0 22px 58px rgba(0, 0, 0, .38);
        transition: border-color .18s ease, box-shadow .18s ease, transform .18s ease;
    }

    .sc-forum-real-card:hover {
        border-color: rgba(224, 88, 121, .58);
        box-shadow: 0 26px 70px rgba(224, 88, 121, .16), 0 22px 58px rgba(0, 0, 0, .42);
        transform: translateY(-2px);
    }

    .sc-forum-real-title {
        margin: 0 0 12px;
        color: #fff8ef;
        font-size: 22px;
        font-weight: 800;
        line-height: 1.24;
        letter-spacing: 0;
        text-shadow: 0 2px 18px rgba(0, 0, 0, .72);
    }

    .sc-forum-real-title a,
    .sc-forum-real-title a:visited {
        color: inherit;
        text-decoration: none;
    }

    .sc-forum-real-desc {
        margin: 0;
        color: #f0e8df;
        font-size: 14px;
        line-height: 1.65;
        text-shadow: 0 2px 14px rgba(0, 0, 0, .72);
    }

    .sc-forum-real-meta {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin: 16px 0 0;
        color: #d8c3cb;
        font-size: 12px;
        line-height: 1.4;
    }

    .sc-forum-real-button,
    .sc-forum-real-button:visited {
        display: inline-flex;
        width: fit-content;
        min-height: 40px;
        align-items: center;
        justify-content: center;
        margin-top: 22px;
        padding: 10px 16px;
        border: 1px solid rgba(233, 187, 99, .52);
        border-radius: 6px;
        background: linear-gradient(135deg, rgba(233, 187, 99, .28), rgba(224, 88, 121, .2));
        color: #fff3dc;
        font-size: 13px;
        font-weight: 800;
        line-height: 1.2;
        text-decoration: none;
        box-shadow: 0 12px 30px rgba(0, 0, 0, .24);
    }

    .sc-forum-real-button:hover,
    .sc-forum-real-button:focus {
        border-color: rgba(255, 224, 163, .86);
        color: #fffaf0;
        text-decoration: none;
    }

    .sc-forum-real-empty {
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .1);
        border-radius: 8px;
        background: #171017;
        color: #ddd2c8;
        text-align: center;
    }

    @media (max-width: 680px) {
        .sc-forum-real-home-v1 header {
            padding: 24px;
        }

        .sc-forum-real-home-v1 h1 {
            font-size: 34px;
        }

        .sc-forum-real-grid {
            grid-template-columns: 1fr !important;
        }
    }
</style>
{/literal}

<!-- SC_FORUM_REAL_TOPICS_HOME_V1_ACTIVE -->
<section class="sc-forum-real-home-v1">
    <header>
        <h1>Discussions</h1>
        <p>Talk with other couples, share ideas, ask questions, and plan real connections.</p>
    </header>

    {if empty($error)}
        <h2>Recent Discussions</h2>
        <div class="sc-forum-real-grid">
            {if !empty($forums)}
                {each $sc_forum_index => $forum in $forums}
                    {if $sc_forum_index == 0}
                        <article class="sc-forum-real-card">
                            <div>
                                <h2 class="sc-forum-real-title">Start a New Topic</h2>
                                <p class="sc-forum-real-desc">Start a new conversation and invite other couples to join in.</p>
                            </div>
                            <a class="sc-forum-real-button" rel="nofollow" href="{{ $design->url('forum', 'forum', 'addtopic', "$forum->name,$forum->forumId") }}">Start a New Topic</a>
                        </article>
                    {/if}
                {/each}
            {/if}

            <!-- SC_FORUM_HOME_TOPICS_TEMPLATE_V1_ACTIVE -->
            {if !empty($sc_forum_home_topics)}
                {each $topic in $sc_forum_home_topics}
                    <article class="sc-forum-real-card">
                        <div>
                            <h3 class="sc-forum-real-title">
                                <a href="{{ $design->url('forum', 'forum', 'post', "$topic->name,$topic->forumId,$topic->title,$topic->topicId") }}">
                                    {% escape($topic->title, true) %}
                                </a>
                            </h3>
                            {if !empty($topic->short_description)}
                                <p class="sc-forum-real-desc">{% escape($topic->short_description, true) %}</p>
                            {else}
                                <p class="sc-forum-real-desc">{% substr(escape(strip_tags($topic->message), true), 0, 160) %}</p>
                            {/if}
                            <div class="sc-forum-real-meta">
                                {if !empty($topic->username)}
                                    <span>{% escape($topic->username, true) %}</span>
                                {/if}
                                <span>{% $dateTime->get($topic->createdDate)->dateTime() %}</span>
                                {if !empty($topic->photo_count)}
                                    <span>{% $topic->photo_count %} photo(s)</span>
                                {/if}
                            </div>
                        </div>
                        <a class="sc-forum-real-button" href="{{ $design->url('forum', 'forum', 'post', "$topic->name,$topic->forumId,$topic->title,$topic->topicId") }}">Join the Discussion</a>
                    </article>
                {/each}
            {/if}
            <!-- SC_FORUM_HOME_TOPICS_TEMPLATE_V1_END -->
        </div>

        {if empty($sc_forum_home_topics)}
            <div class="sc-forum-real-empty">No discussions have been started yet.</div>
        {/if}
    {else}
        <div class="sc-forum-real-empty">{error}</div>
    {/if}
</section>
<!-- SC_FORUM_REAL_TOPICS_HOME_V1_END -->
