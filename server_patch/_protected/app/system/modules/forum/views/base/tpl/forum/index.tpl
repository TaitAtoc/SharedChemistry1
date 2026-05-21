{literal}
<style>
    html body main#content#content:has(.sc-forum-home-v1),
    html body main#content:has(.sc-forum-home-v1) {
        margin-top: 0 !important;
        padding-top: 24px !important;
    }

    .sc-forum-home-v1 {
        margin: 0 auto !important;
        padding: 0 !important;
        max-width: 1180px;
        color: #f7f3ef;
        text-align: left;
    }

    .sc-forum-home-v1 * {
        box-sizing: border-box;
    }

    .sc-forum-hero {
        margin: 0 0 28px;
        padding: 34px;
        border: 1px solid rgba(233, 187, 99, .22);
        border-radius: 8px;
        background:
            linear-gradient(135deg, rgba(233, 187, 99, .13), rgba(224, 88, 121, .08) 42%, rgba(24, 25, 29, .96)),
            #18191d;
        box-shadow: 0 22px 70px rgba(0, 0, 0, .28);
    }

    .sc-forum-eyebrow {
        display: inline-flex;
        align-items: center;
        gap: 8px;
        margin: 0 0 12px;
        color: #e9bb63;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0;
        text-transform: uppercase;
    }

    .sc-forum-hero h1 {
        margin: 0;
        color: #fff8ef;
        font-size: 42px;
        font-weight: 800;
        line-height: 1.12;
        letter-spacing: 0;
    }

    .sc-forum-hero p {
        margin: 14px 0 0;
        max-width: 720px;
        color: #d9d1ca;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-forum-category {
        margin: 0 0 34px;
    }

    .sc-forum-category-head {
        display: flex;
        align-items: center;
        justify-content: space-between;
        gap: 16px;
        margin: 0 0 14px;
    }

    .sc-forum-category-title {
        margin: 0;
        color: #fff8ef;
        font-size: 22px;
        font-weight: 760;
        line-height: 1.25;
        letter-spacing: 0;
    }

    .sc-forum-admin-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 8px;
        align-items: center;
    }

    .sc-forum-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 16px;
    }

    .sc-forum-card {
        display: flex;
        min-height: 228px;
        flex-direction: column;
        justify-content: space-between;
        padding: 22px;
        border: 1px solid rgba(247, 243, 239, .1);
        border-radius: 8px;
        background: linear-gradient(180deg, rgba(255, 255, 255, .055), rgba(255, 255, 255, .025)), #17181c;
        box-shadow: 0 18px 44px rgba(0, 0, 0, .26);
    }

    .sc-forum-card:hover {
        border-color: rgba(233, 187, 99, .36);
        transform: translateY(-1px);
        transition: border-color .18s ease, transform .18s ease;
    }

    .sc-forum-card-label {
        display: inline-flex;
        width: fit-content;
        margin: 0 0 12px;
        padding: 5px 9px;
        border: 1px solid rgba(224, 88, 121, .26);
        border-radius: 999px;
        color: #f0b8c5;
        font-size: 12px;
        font-weight: 700;
        letter-spacing: 0;
    }

    .sc-forum-card-title {
        margin: 0 0 10px;
        color: #fff8ef;
        font-size: 20px;
        font-weight: 760;
        line-height: 1.28;
        letter-spacing: 0;
    }

    .sc-forum-card-title a,
    .sc-forum-card-title a:visited {
        color: inherit;
        text-decoration: none;
    }

    .sc-forum-card-title a:hover,
    .sc-forum-card-title a:focus {
        color: #e9bb63;
        text-decoration: none;
    }

    .sc-forum-card-desc {
        margin: 0;
        color: #cfc7bf;
        font-size: 14px;
        line-height: 1.65;
    }

    .sc-forum-card-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 10px;
        align-items: center;
        margin-top: 20px;
    }

    .sc-forum-btn,
    .sc-forum-btn:visited {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 38px;
        padding: 9px 14px;
        border: 1px solid rgba(233, 187, 99, .34);
        border-radius: 6px;
        background: rgba(233, 187, 99, .1);
        color: #ffe0a3;
        font-size: 13px;
        font-weight: 750;
        line-height: 1.2;
        text-decoration: none;
    }

    .sc-forum-btn:hover,
    .sc-forum-btn:focus {
        border-color: rgba(233, 187, 99, .64);
        background: rgba(233, 187, 99, .18);
        color: #fff2d6;
        text-decoration: none;
    }

    .sc-forum-btn-secondary,
    .sc-forum-btn-secondary:visited {
        border-color: rgba(224, 88, 121, .34);
        background: rgba(224, 88, 121, .1);
        color: #ffd6df;
    }

    .sc-forum-empty,
    .sc-forum-error {
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .1);
        border-radius: 8px;
        background: #17181c;
        color: #d9d1ca;
        font-size: 16px;
        line-height: 1.6;
        text-align: center;
    }

    .sc-forum-pagination {
        margin: 26px 0 0;
        text-align: center;
    }

    .sc-forum-admin-panel {
        margin: 28px 0 0;
        padding: 18px;
        border: 1px solid rgba(247, 243, 239, .1);
        border-radius: 8px;
        background: rgba(255, 255, 255, .035);
    }

    @media (max-width: 980px) {
        .sc-forum-grid {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 680px) {
        .sc-forum-hero {
            padding: 24px;
        }

        .sc-forum-hero h1 {
            font-size: 34px;
        }

        .sc-forum-category-head {
            align-items: flex-start;
            flex-direction: column;
        }

        .sc-forum-grid {
            grid-template-columns: 1fr;
        }
    }
</style>
{/literal}

<!-- SC_FORUM_HOME_REDESIGN_V1_ACTIVE -->
<section class="sc-forum-home-v1">
    <div class="sc-forum-hero">
        <p class="sc-forum-eyebrow">SharedChemistry Community</p>
        <h1>Discussions</h1>
        <p>Talk with other couples, share ideas, ask questions, and plan real connections.</p>
    </div>

    {if empty($error)}
        {if empty($categories) OR empty($forums)}
            <div class="sc-forum-empty">Discussion areas are being prepared.</div>
        {else}
            <div id="sc-forum-areas">
                {each $category in $categories}
                    <section class="sc-forum-category">
                        <div class="sc-forum-category-head">
                            <h2 class="sc-forum-category-title">{% escape($category->title, true) %}</h2>
                            {if AdminCore::auth()}
                                <div class="sc-forum-admin-actions">
                                    <a class="btn btn-default btn-sm" href="{{ $design->url('forum', 'admin', 'editcategory', $category->categoryId) }}">{lang 'Edit'}</a>
                                    {{ $design->popupLinkConfirm(t('Delete'), 'forum', 'admin', 'deletecategory', $category->categoryId, 'btn btn-default btn-sm') }}
                                </div>
                            {/if}
                        </div>

                        <div class="sc-forum-grid">
                            {each $forum in $forums}
                                {if $category->categoryId == $forum->categoryId}
                                    <article class="sc-forum-card">
                                        <div>
                                            <span class="sc-forum-card-label">Discussion Area</span>
                                            <h3 class="sc-forum-card-title">
                                                <a href="{{ $design->url('forum', 'forum', 'topic', "$forum->name,$forum->forumId") }}">
                                                    {% escape($forum->name, true) %}
                                                </a>
                                            </h3>
                                            <p class="sc-forum-card-desc">{% escape($forum->description, true) %}</p>
                                        </div>

                                        <div class="sc-forum-card-actions">
                                            <a class="sc-forum-btn" href="{{ $design->url('forum', 'forum', 'topic', "$forum->name,$forum->forumId") }}">Open Area</a>
                                            {if $is_user_auth}
                                                <a class="sc-forum-btn sc-forum-btn-secondary" rel="nofollow" href="{{ $design->url('forum', 'forum', 'addtopic', "$forum->name,$forum->forumId") }}">Start a Discussion</a>
                                            {/if}
                                            {if AdminCore::auth()}
                                                <a class="btn btn-default btn-sm" href="{{ $design->url('forum', 'admin', 'editforum', $forum->forumId) }}">{lang 'Edit'}</a>
                                                {{ $design->popupLinkConfirm(t('Delete'), 'forum', 'admin', 'deleteforum', $forum->forumId, 'btn btn-default btn-sm') }}
                                            {/if}
                                        </div>
                                    </article>
                                {/if}
                            {/each}
                        </div>
                    </section>
                {/each}
            </div>

            <div class="sc-forum-pagination">
                {main_include 'page_nav.inc.tpl'}
            </div>
        {/if}
    {else}
        <div class="sc-forum-error">{error}</div>
    {/if}

    {if AdminCore::auth()}
        <div class="sc-forum-admin-panel">
            <div class="sc-forum-admin-actions">
                <a class="btn btn-default btn-md" href="{{ $design->url('forum', 'admin', 'addcategory') }}">{lang 'Add Category'}</a>
                <a class="btn btn-default btn-md" href="{{ $design->url('forum', 'admin', 'addforum') }}">{lang 'Add Forum'}</a>
            </div>
        </div>
    {/if}
</section>
<!-- SC_FORUM_HOME_REDESIGN_V1_END -->
