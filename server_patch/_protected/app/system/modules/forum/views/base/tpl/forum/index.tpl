{literal}
<style>
    html body main#content#content:has(.sc-forum-home-v2),
    html body main#content:has(.sc-forum-home-v2) {
        margin-top: 0 !important;
        padding-top: 24px !important;
    }

    .sc-forum-home-v2 {
        margin: 0 auto !important;
        padding: 0 !important;
        max-width: 1180px;
        color: #fff8ef;
        text-align: left;
    }

    .sc-forum-home-v2 * {
        box-sizing: border-box;
    }

    .sc-forum-home-v2 > header {
        margin: 0 0 28px;
        padding: 34px;
        border: 1px solid rgba(233, 187, 99, .24);
        border-radius: 8px;
        background:
            radial-gradient(circle at top left, rgba(224, 88, 121, .24), transparent 34%),
            linear-gradient(135deg, rgba(233, 187, 99, .15), rgba(22, 17, 23, .96) 56%, rgba(10, 8, 12, .98)),
            #120d14;
        box-shadow: 0 22px 70px rgba(0, 0, 0, .32);
    }

    .sc-forum-home-v2 > header > p:first-child {
        display: inline-flex;
        align-items: center;
        margin: 0 0 12px;
        color: #e9bb63;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: 0;
        text-transform: uppercase;
    }

    .sc-forum-home-v2 h1 {
        margin: 0;
        color: #fff8ef;
        font-size: 42px;
        font-weight: 800;
        line-height: 1.12;
        letter-spacing: 0;
    }

    .sc-forum-home-v2 > header > p:last-child {
        margin: 14px 0 0;
        max-width: 720px;
        color: #ddd2c8;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-forum-grid-v2 {
        display: grid !important;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)) !important;
        gap: 22px !important;
        align-items: stretch !important;
        margin-top: 28px !important;
    }

    .sc-forum-card-v2 {
        position: relative;
        display: flex !important;
        width: 100% !important;
        min-height: 228px !important;
        flex-direction: column !important;
        justify-content: space-between !important;
        overflow: hidden;
        padding: 24px;
        border: 1px solid rgba(233, 187, 99, .28);
        border-radius: 8px;
        background-color: #171017;
        background-position: center;
        background-size: cover;
        box-shadow: 0 22px 58px rgba(0, 0, 0, .38);
        isolation: isolate;
        transition: border-color .18s ease, box-shadow .18s ease, transform .18s ease;
    }

    .sc-forum-card-v2::before {
        content: "";
        position: absolute;
        inset: 0;
        z-index: -1;
        background: linear-gradient(180deg, rgba(255, 255, 255, .12), transparent 32%, rgba(0, 0, 0, .22));
        opacity: .72;
    }

    .sc-forum-card-v2:hover {
        border-color: rgba(224, 88, 121, .58);
        box-shadow: 0 26px 70px rgba(224, 88, 121, .16), 0 22px 58px rgba(0, 0, 0, .42);
        transform: translateY(-2px);
    }

    .sc-forum-card-bg {
        background-image:
            linear-gradient(135deg, rgba(12, 8, 12, .86), rgba(42, 15, 32, .72) 46%, rgba(7, 6, 9, .92)),
            url('/templates/themes/base/img/sharedchemistry/discussion-box-image.png');
    }

    .sc-forum-card-title {
        margin: 0 0 12px;
        color: #fff8ef;
        font-size: 22px;
        font-weight: 800;
        line-height: 1.24;
        letter-spacing: 0;
        text-shadow: 0 2px 18px rgba(0, 0, 0, .7);
    }

    .sc-forum-card-title a,
    .sc-forum-card-title a:visited {
        color: inherit;
        text-decoration: none;
    }

    .sc-forum-card-title a:hover,
    .sc-forum-card-title a:focus {
        color: #ffe0a3;
        text-decoration: none;
    }

    .sc-forum-card-desc {
        margin: 0;
        color: #f0e8df;
        font-size: 14px;
        line-height: 1.65;
        text-shadow: 0 2px 14px rgba(0, 0, 0, .72);
    }

    .sc-forum-card-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        align-items: center;
        margin-top: 24px;
    }

    .sc-forum-card-actions a,
    .sc-forum-card-actions a:visited,
    .sc-forum-card-actions span {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 40px;
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

    .sc-forum-card-actions a:hover,
    .sc-forum-card-actions a:focus {
        border-color: rgba(255, 224, 163, .86);
        background: linear-gradient(135deg, rgba(233, 187, 99, .38), rgba(224, 88, 121, .3));
        color: #fffaf0;
        text-decoration: none;
    }

    .sc-forum-card-actions span {
        cursor: not-allowed;
        opacity: .62;
    }

    .sc-forum-new-topic-card {
        border-color: rgba(224, 88, 121, .42);
    }

    .sc-forum-home-v2 > p {
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .1);
        border-radius: 8px;
        background: #171017;
        color: #ddd2c8;
        font-size: 16px;
        line-height: 1.6;
        text-align: center;
    }

    .sc-forum-home-v2 > nav {
        margin: 26px 0 0;
        text-align: center;
    }

    .sc-forum-home-v2 > footer {
        margin: 28px 0 0;
        padding: 18px;
        border: 1px solid rgba(247, 243, 239, .1);
        border-radius: 8px;
        background: rgba(255, 255, 255, .035);
    }

    @media (max-width: 980px) {
        .sc-forum-grid-v2 {
            grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
        }
    }

    @media (max-width: 680px) {
        .sc-forum-home-v2 > header {
            padding: 24px;
        }

        .sc-forum-home-v2 h1 {
            font-size: 34px;
        }

        .sc-forum-grid-v2 {
            grid-template-columns: 1fr !important;
        }

        .sc-forum-card-v2 {
            min-height: 238px !important;
        }
    }
</style>
{/literal}

<!-- SC_FORUM_HOME_CARD_GRID_FIX_V3_ACTIVE -->
<section class="sc-forum-home-v2">
    <header>
        <p>SharedChemistry Community</p>
        <h1>Discussions</h1>
        <p>Talk with other couples, share ideas, ask questions, and plan real connections.</p>
    </header>

    {if empty($error)}
        {if empty($categories) OR empty($forums)}
            <p>Discussion areas are being prepared.</p>
        {else}
            <div id="sc-forum-areas" class="sc-forum-grid-v2">
                {each $sc_forum_index => $forum in $forums}
                    {if $sc_forum_index == 0}
                        <article class="sc-forum-card-v2 sc-forum-card-bg sc-forum-new-topic-card">
                            <div>
                                <h2 class="sc-forum-card-title">Start a New Topic</h2>
                                <p class="sc-forum-card-desc">Start a new conversation and invite other couples to join in.</p>
                            </div>

                            <div class="sc-forum-card-actions">
                                <a rel="nofollow" href="{{ $design->url('forum', 'forum', 'addtopic', "$forum->name,$forum->forumId") }}">Start a New Topic</a>
                            </div>
                        </article>
                    {/if}

                    <article class="sc-forum-card-v2 sc-forum-card-bg">
                        <div>
                            <h2 class="sc-forum-card-title">
                                <a href="{{ $design->url('forum', 'forum', 'topic', "$forum->name,$forum->forumId") }}">
                                    {% escape($forum->name, true) %}
                                </a>
                            </h2>
                            <p class="sc-forum-card-desc">{% escape($forum->description, true) %}</p>
                        </div>

                        <div class="sc-forum-card-actions">
                            <a href="{{ $design->url('forum', 'forum', 'topic', "$forum->name,$forum->forumId") }}">Join the Discussion</a>
                        </div>
                    </article>
                {/each}
            </div>

            <nav>
                {main_include 'page_nav.inc.tpl'}
            </nav>
        {/if}
    {else}
        <p>{error}</p>
    {/if}

    {if AdminCore::auth()}
        <footer>
            <a class="btn btn-default btn-md" href="{{ $design->url('forum', 'admin', 'addcategory') }}">{lang 'Add Category'}</a>
            <a class="btn btn-default btn-md" href="{{ $design->url('forum', 'admin', 'addforum') }}">{lang 'Add Forum'}</a>
        </footer>
    {/if}
</section>
<!-- SC_FORUM_HOME_CARD_GRID_FIX_V3_END -->
