{literal}
<style>
    #sc-blog-index-v1,
    #sc-blog-index-v1 * {
        box-sizing: border-box;
    }

    #sc-blog-index-v1 {
        width: min(1180px, calc(100vw - 48px));
        margin: 0 auto;
        padding: 34px 0 72px;
        color: #f7f3ef;
    }

    #sc-blog-index-v1 a {
        color: inherit;
    }

    #sc-blog-index-v1 .sc-blog-hero,
    #sc-blog-index-v1 .sc-blog-empty,
    #sc-blog-index-v1 .sc-blog-card {
        border: 1px solid rgba(247, 243, 239, .09);
        border-radius: 8px;
        background: #17181d;
        box-shadow: 0 16px 34px rgba(0, 0, 0, .24);
    }

    #sc-blog-index-v1 .sc-blog-hero {
        margin-bottom: 22px;
        padding: 28px;
    }

    #sc-blog-index-v1 h1 {
        margin: 0 0 10px;
        color: #fff;
        font-size: 38px;
        font-weight: 800;
        line-height: 1.12;
    }

    #sc-blog-index-v1 .sc-blog-intro,
    #sc-blog-index-v1 .sc-blog-empty p {
        max-width: 760px;
        margin: 0;
        color: #b8b3b0;
        font-size: 16px;
        line-height: 1.55;
    }

    #sc-blog-index-v1 .sc-blog-error {
        margin: 0 0 16px;
        padding: 14px 16px;
        border: 1px solid rgba(236, 8, 104, .42);
        border-radius: 8px;
        background: rgba(236, 8, 104, .12);
        color: #ffd2e4;
    }

    #sc-blog-index-v1 .sc-blog-grid {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
        gap: 16px;
    }

    #sc-blog-index-v1 .sc-blog-card {
        display: flex;
        min-width: 0;
        overflow: hidden;
        flex-direction: column;
    }

    #sc-blog-index-v1 .sc-blog-image {
        display: block;
        width: 100%;
        aspect-ratio: 16 / 9;
        overflow: hidden;
        background: #101114;
    }

    #sc-blog-index-v1 .sc-blog-image img {
        display: block;
        width: 100%;
        height: 100%;
        border: 0;
        object-fit: cover;
    }

    #sc-blog-index-v1 .sc-blog-card-body {
        display: flex;
        flex: 1;
        flex-direction: column;
        gap: 10px;
        padding: 18px;
    }

    #sc-blog-index-v1 .sc-blog-date {
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        text-transform: uppercase;
    }

    #sc-blog-index-v1 h2 {
        margin: 0;
        color: #fff;
        font-size: 21px;
        line-height: 1.22;
    }

    #sc-blog-index-v1 .sc-blog-excerpt {
        flex: 1;
        margin: 0;
        color: #cbc4c0;
        font-size: 14px;
        line-height: 1.55;
    }

    #sc-blog-index-v1 .sc-blog-read-more {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        width: fit-content;
        min-height: 40px;
        margin-top: 4px;
        padding: 10px 16px;
        border-radius: 999px;
        background: #ec0868;
        background-image: linear-gradient(90deg, #ec0868, #c200fb);
        color: #fff;
        font-weight: 800;
        text-decoration: none;
    }

    #sc-blog-index-v1 .sc-blog-read-more:hover,
    #sc-blog-index-v1 .sc-blog-read-more:focus {
        color: #fff;
        text-decoration: none;
    }

    #sc-blog-index-v1 .sc-blog-empty {
        padding: 28px;
    }

    @media (max-width: 700px) {
        #sc-blog-index-v1 {
            width: min(100%, calc(100vw - 24px));
            padding: 24px 0 60px;
        }

        #sc-blog-index-v1 .sc-blog-hero {
            padding: 22px;
        }

        #sc-blog-index-v1 h1 {
            font-size: 31px;
        }
    }
</style>
{/literal}

<!-- SC_BLOG_INDEX_V1_ACTIVE -->
<div id="sc-blog-index-v1">
    <section class="sc-blog-hero">
        <h1>{lang 'SharedChemistry Blog'}</h1>
        <p class="sc-blog-intro">{lang 'Articles, updates, and thoughtful guidance for the SharedChemistry community.'}</p>
    </section>

    {if !empty($blog_error)}
        <p class="sc-blog-error">{blog_error}</p>
    {/if}

    {if empty($posts)}
        <section class="sc-blog-empty">
            <h2>{lang 'Fresh articles are on the way.'}</h2>
            <p>{lang 'Published posts will appear here as soon as they are ready.'}</p>
        </section>
    {else}
        <section class="sc-blog-grid">
            {each $post in $posts}
                <article class="sc-blog-card">
                    {if !empty($post->featured_image)}
                        <a class="sc-blog-image" href="{% $post->blogUrl %}" title="{% escape($post->title) %}">
                            <img src="{% $post->featured_image %}" alt="{% escape($post->title) %}" loading="lazy" />
                        </a>
                    {/if}
                    <div class="sc-blog-card-body">
                        {if !empty($post->displayDate)}
                            <time class="sc-blog-date" datetime="{% $post->published_at %}">{% $post->displayDate %}</time>
                        {/if}
                        <h2><a href="{% $post->blogUrl %}">{% escape($post->title) %}</a></h2>
                        <p class="sc-blog-excerpt">{% escape($post->excerpt) %}</p>
                        <a class="sc-blog-read-more" href="{% $post->blogUrl %}">{lang 'Read More'}</a>
                    </div>
                </article>
            {/each}
        </section>
    {/if}
</div>
<!-- SC_BLOG_INDEX_V1_END -->
