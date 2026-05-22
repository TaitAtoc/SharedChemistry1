{literal}
<style>
    html body main#content#content:has(.sc-discussions-home-v1),
    html body main#content:has(.sc-discussions-home-v1) {
        margin-top: 0 !important;
        padding-top: 24px !important;
    }

    .sc-discussions-home-v1 {
        max-width: 1180px;
        margin: 0 auto !important;
        padding: 0 0 34px !important;
        color: #fff8ef;
        text-align: left;
    }

    .sc-discussions-home-v1 * {
        box-sizing: border-box;
    }

    .sc-discussions-home-v1 header {
        margin: 0 0 24px;
        padding: 34px;
        border: 1px solid rgba(233, 187, 99, .24);
        border-radius: 8px;
        background:
            radial-gradient(circle at top left, rgba(224, 88, 121, .24), transparent 34%),
            linear-gradient(135deg, rgba(233, 187, 99, .15), rgba(22, 17, 23, .96) 56%, rgba(10, 8, 12, .98));
        box-shadow: 0 22px 70px rgba(0, 0, 0, .32);
    }

    .sc-discussions-home-v1 h1 {
        margin: 0;
        color: #fff8ef;
        font-size: 42px;
        font-weight: 800;
        line-height: 1.12;
        letter-spacing: 0;
    }

    .sc-discussions-home-v1 header p {
        max-width: 720px;
        margin: 14px 0 0;
        color: #ddd2c8;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-discussions-home-v1 h2 {
        margin: 30px 0 16px;
        color: #ffe0a3;
        font-size: 18px;
        font-weight: 800;
        letter-spacing: 0;
    }

    .sc-discussions-grid {
        display: grid !important;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)) !important;
        gap: 22px !important;
        align-items: stretch !important;
    }

    .sc-discussions-card {
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

    .sc-discussions-card:hover {
        border-color: rgba(224, 88, 121, .58);
        box-shadow: 0 26px 70px rgba(224, 88, 121, .16), 0 22px 58px rgba(0, 0, 0, .42);
        transform: translateY(-2px);
    }

    .sc-discussions-title {
        margin: 0 0 12px;
        color: #fff8ef;
        font-size: 22px;
        font-weight: 800;
        line-height: 1.24;
        letter-spacing: 0;
        text-shadow: 0 2px 18px rgba(0, 0, 0, .72);
    }

    .sc-discussions-title a,
    .sc-discussions-title a:visited {
        color: inherit;
        text-decoration: none;
    }

    .sc-discussions-desc {
        margin: 0;
        color: #f0e8df;
        font-size: 14px;
        line-height: 1.65;
        text-shadow: 0 2px 14px rgba(0, 0, 0, .72);
    }

    .sc-discussions-meta {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        margin: 16px 0 0;
        color: #d8c3cb;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0;
        text-transform: uppercase;
    }

    .sc-discussions-meta span {
        padding: 6px 8px;
        border: 1px solid rgba(255, 255, 255, .12);
        border-radius: 8px;
        background: rgba(0, 0, 0, .28);
    }

    .sc-discussions-button,
    .sc-discussions-button:visited {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: fit-content;
        min-height: 42px;
        margin-top: 22px;
        padding: 10px 16px;
        border: 0;
        border-radius: 8px;
        background: #e9bb63;
        color: #1b1217;
        font-size: 14px;
        font-weight: 900;
        line-height: 1.2;
        text-decoration: none;
        box-shadow: 0 12px 28px rgba(233, 187, 99, .22);
    }

    .sc-discussions-button.is-disabled {
        opacity: .55;
        pointer-events: none;
    }

    .sc-discussions-empty {
        margin-top: 18px;
        padding: 18px 20px;
        border: 1px solid rgba(233, 187, 99, .22);
        border-radius: 8px;
        background: rgba(20, 15, 20, .88);
        color: #f0e8df;
    }

    @media screen and (max-width: 767px) {
        .sc-discussions-home-v1 {
            padding: 0 14px 28px !important;
        }

        .sc-discussions-home-v1 header {
            padding: 24px;
        }

        .sc-discussions-home-v1 h1 {
            font-size: 34px;
        }

        .sc-discussions-grid {
            grid-template-columns: 1fr !important;
        }
    }
</style>
{/literal}

<!-- SC_DISCUSSIONS_HOME_TEMPLATE_V1_ACTIVE -->
<section class="sc-discussions-home-v1">
    <header>
        <h1>Discussions</h1>
        <p>Talk with other couples, share ideas, ask questions, and plan real connections.</p>
    </header>

    <h2>Recent Discussions</h2>
    <div class="sc-discussions-grid">
        <article class="sc-discussions-card">
            <div>
                <h2 class="sc-discussions-title">Start a New Topic</h2>
                <p class="sc-discussions-desc">Start a new conversation and invite other couples to join in.</p>
            </div>
            {if !empty($sc_start_forum)}
                <a class="sc-discussions-button" rel="nofollow" href="{{ $design->url('forum', 'forum', 'addtopic', "$sc_start_forum->name,$sc_start_forum->forumId") }}">Start a New Topic</a>
            {else}
                <span class="sc-discussions-button is-disabled">Start a New Topic</span>
            {/if}
        </article>

        {if !empty($sc_discussion_topics)}
            {each $topic in $sc_discussion_topics}
                <article class="sc-discussions-card">
                    <div>
                        <h3 class="sc-discussions-title">
                            <a href="{{ $design->url('forum', 'forum', 'post', "$topic->name,$topic->forumId,$topic->title,$topic->topicId") }}">
                                {% escape($topic->title, true) %}
                            </a>
                        </h3>
                        {if !empty($topic->short_description)}
                            <p class="sc-discussions-desc">{% escape($topic->short_description, true) %}</p>
                        {else}
                            <p class="sc-discussions-desc">{% substr(escape(strip_tags($topic->message), true), 0, 160) %}</p>
                        {/if}
                        <div class="sc-discussions-meta">
                            {if !empty($topic->profileId)}
                                <span>Profile {% $topic->profileId %}</span>
                            {/if}
                            <span>{% $dateTime->get($topic->createdDate)->dateTime() %}</span>
                            {if !empty($topic->photo_count)}
                                <span>{% $topic->photo_count %} photo(s)</span>
                            {/if}
                        </div>
                    </div>
                    <a class="sc-discussions-button" href="{{ $design->url('forum', 'forum', 'post', "$topic->name,$topic->forumId,$topic->title,$topic->topicId") }}">Join the Discussion</a>
                </article>
            {/each}
        {/if}
    </div>

    {if empty($sc_discussion_topics)}
        <div class="sc-discussions-empty">No discussions have been started yet.</div>
    {/if}
</section>
<!-- SC_DISCUSSIONS_HOME_TEMPLATE_V1_END -->
