{literal}
<style>
    main#content:has(.sc-about-page),
    body main#content#content:has(.sc-about-page) {
        max-width: none !important;
        padding: 0 !important;
        background: #08080b !important;
    }

    .sc-about-page,
    .sc-about-page * {
        box-sizing: border-box;
    }

    .sc-about-page {
        position: relative;
        width: 100%;
        overflow: hidden;
        background:
            radial-gradient(circle at 18% 8%, rgba(236, 8, 104, .22), transparent 32%),
            radial-gradient(circle at 82% 20%, rgba(255, 188, 10, .16), transparent 30%),
            linear-gradient(180deg, #08080b 0%, #111116 48%, #07070a 100%);
        color: #f7f3ef;
        font-family: inherit;
    }

    .sc-about-wrap {
        width: min(1160px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-about-hero {
        display: grid;
        grid-template-columns: minmax(0, .95fr) minmax(320px, 1.05fr);
        gap: 42px;
        align-items: center;
        min-height: 640px;
        padding: 96px 0 72px;
    }

    .sc-about-kicker {
        margin: 0 0 14px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-about-title {
        margin: 0;
        color: #fff8f1;
        font-size: clamp(42px, 5.3vw, 76px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: .98;
    }

    .sc-about-lede {
        max-width: 610px;
        margin: 24px 0 0;
        color: #d7d2ce;
        font-size: 18px;
        line-height: 1.7;
    }

    .sc-about-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 14px;
        margin-top: 34px;
    }

    .sc-about-button,
    .sc-about-button:visited {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        min-height: 48px;
        padding: 13px 20px;
        border-radius: 8px;
        color: #fff;
        font-size: 14px;
        font-weight: 800;
        line-height: 1.2;
        text-decoration: none !important;
        text-shadow: none;
    }

    .sc-about-button-primary,
    .sc-about-button-primary:visited {
        border: 0;
        background: linear-gradient(90deg, #ec0868, #ff5a3d);
        box-shadow: 0 18px 44px rgba(236, 8, 104, .28);
    }

    .sc-about-button-secondary,
    .sc-about-button-secondary:visited {
        border: 1px solid rgba(247, 243, 239, .18);
        background: rgba(247, 243, 239, .06);
        color: #f7f3ef;
    }

    .sc-about-button:hover,
    .sc-about-button:focus {
        color: #fff;
        text-decoration: none !important;
        transform: translateY(-1px);
    }

    .sc-about-media {
        position: relative;
        min-width: 0;
    }

    .sc-about-media:before {
        content: "";
        position: absolute;
        inset: -18px;
        border-radius: 22px;
        background: linear-gradient(135deg, rgba(236, 8, 104, .28), rgba(255, 188, 10, .16));
        filter: blur(18px);
        opacity: .72;
    }

    .sc-about-image {
        position: relative;
        display: block;
        width: 100%;
        height: auto;
        max-height: 620px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 18px;
        box-shadow: 0 28px 80px rgba(0, 0, 0, .52);
    }

    .sc-about-section {
        padding: 64px 0;
    }

    .sc-about-intro {
        display: grid;
        grid-template-columns: minmax(0, .75fr) minmax(280px, .45fr);
        gap: 34px;
        align-items: start;
    }

    .sc-about-section h2 {
        margin: 0;
        color: #fff8f1;
        font-size: clamp(30px, 3.4vw, 46px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.08;
    }

    .sc-about-section p {
        margin: 16px 0 0;
        color: #c9c2bd;
        font-size: 16px;
        line-height: 1.72;
    }

    .sc-about-note {
        padding: 24px;
        border: 1px solid rgba(255, 188, 10, .18);
        border-radius: 12px;
        background: rgba(255, 188, 10, .06);
        color: #f7f3ef;
    }

    .sc-about-feature {
        display: grid;
        grid-template-columns: minmax(320px, .9fr) minmax(0, 1fr);
        gap: 42px;
        align-items: center;
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .09);
        border-radius: 16px;
        background: rgba(18, 18, 24, .78);
        box-shadow: 0 24px 60px rgba(0, 0, 0, .30);
    }

    .sc-about-feature .sc-about-image {
        max-height: 520px;
        object-fit: cover;
    }

    .sc-about-list {
        display: grid;
        gap: 12px;
        margin: 24px 0 0;
        padding: 0;
        list-style: none;
    }

    .sc-about-list li {
        position: relative;
        padding-left: 22px;
        color: #e4ddd7;
        font-size: 15px;
        line-height: 1.55;
    }

    .sc-about-list li:before {
        content: "";
        position: absolute;
        top: .65em;
        left: 0;
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: #ec0868;
        box-shadow: 0 0 20px rgba(236, 8, 104, .62);
    }

    .sc-about-card-grid {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 18px;
        margin-top: 30px;
    }

    .sc-about-card {
        min-height: 210px;
        padding: 26px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 14px;
        background: linear-gradient(180deg, rgba(247, 243, 239, .07), rgba(247, 243, 239, .035));
        box-shadow: 0 20px 50px rgba(0, 0, 0, .24);
    }

    .sc-about-card h3 {
        margin: 0;
        color: #ffbc0a;
        font-size: 20px;
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.18;
    }

    .sc-about-card p {
        margin-top: 14px;
        font-size: 15px;
        line-height: 1.65;
    }

    .sc-about-cta {
        display: grid;
        grid-template-columns: minmax(0, 1fr) minmax(320px, .78fr);
        gap: 38px;
        align-items: center;
        padding: 32px;
        border-radius: 18px;
        background:
            linear-gradient(135deg, rgba(236, 8, 104, .22), rgba(255, 188, 10, .10)),
            #121218;
        border: 1px solid rgba(247, 243, 239, .10);
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-about-cta .sc-about-image {
        max-height: 460px;
        object-fit: cover;
    }

    .sc-about-signin {
        display: inline-flex;
        margin-left: 16px;
        color: #ffbc0a !important;
        font-weight: 800;
        text-decoration: none !important;
    }

    .sc-about-signin:hover,
    .sc-about-signin:focus {
        color: #fff8f1 !important;
        text-decoration: none !important;
    }

    @media (max-width: 900px) {
        .sc-about-hero,
        .sc-about-intro,
        .sc-about-feature,
        .sc-about-cta {
            grid-template-columns: 1fr;
        }

        .sc-about-hero {
            min-height: 0;
            padding: 72px 0 52px;
        }

        .sc-about-card-grid {
            grid-template-columns: 1fr;
        }

        .sc-about-feature,
        .sc-about-cta {
            padding: 20px;
        }
    }

    @media (max-width: 560px) {
        .sc-about-wrap {
            width: min(100% - 20px, 1160px);
        }

        .sc-about-hero {
            padding-top: 54px;
        }

        .sc-about-actions,
        .sc-about-button {
            width: 100%;
        }

        .sc-about-image {
            border-radius: 12px;
        }

        .sc-about-section {
            padding: 44px 0;
        }

        .sc-about-cta .sc-about-actions {
            display: grid;
        }

        .sc-about-signin {
            margin: 4px 0 0;
        }
    }
</style>
{/literal}

<div class="sc-about-page">
    <section class="sc-about-hero sc-about-wrap">
        <div class="sc-about-copy">
            <p class="sc-about-kicker">{lang 'SharedChemistry for private couples'}</p>
            <p class="sc-about-title">{lang 'Real couples. Real chemistry. Private connection.'}</p>
            <p class="sc-about-lede">{lang 'SharedChemistry is a couples-only connection space for meeting, flirting, talking, and building trust with people who understand the rhythm of a shared profile.'}</p>
            <div class="sc-about-actions">
                <a class="sc-about-button sc-about-button-primary" href="{{ $design->url('user', 'signup', 'step1') }}">{lang 'Create your couple profile'}</a>
                <a class="sc-about-button sc-about-button-secondary" href="{{ $design->url('user', 'main', 'login') }}" data-load="ajax">{lang 'Sign in'}</a>
            </div>
        </div>
        <div class="sc-about-media">
            <img class="sc-about-image" src="{url_tpl_img}sharedchemistry/about/about-1.png" alt="{lang 'Stylish couple sharing a private SharedChemistry moment'}" />
        </div>
    </section>

    <section class="sc-about-section sc-about-wrap">
        <div class="sc-about-intro">
            <div>
                <h2>{lang 'A couples community built around chemistry.'}</h2>
                <p>{lang 'SharedChemistry gives private couples a calmer way to discover other couples, show personality, and move into real conversation without the noise of endless fake browsing.'}</p>
            </div>
            <div class="sc-about-note">
                <p>{lang 'It is social, direct, and chemistry-first: a place to feel the room, decide your pace, and connect as a couple.'}</p>
            </div>
        </div>
    </section>

    <section class="sc-about-section sc-about-wrap">
        <div class="sc-about-feature">
            <img class="sc-about-image" src="{url_tpl_img}sharedchemistry/about/about-2.png" alt="{lang 'Couples enjoying a private social chemistry setting'}" loading="lazy" />
            <div>
                <p class="sc-about-kicker">{lang 'Party energy, private pace'}</p>
                <h2>{lang 'From profile to conversation, naturally.'}</h2>
                <p>{lang 'Meet other couples, build comfort, and flirt with intention. SharedChemistry keeps the mood member-only and social, so connection can grow before anything moves further.'}</p>
                <ul class="sc-about-list">
                    <li>{lang 'Discover couples who feel aligned with your style and boundaries.'}</li>
                    <li>{lang 'Move from interest to conversation without forcing the moment.'}</li>
                    <li>{lang 'Keep the energy playful, polished, and couple-first.'}</li>
                </ul>
            </div>
        </div>
    </section>

    <section class="sc-about-section sc-about-wrap">
        <h2>{lang 'Designed for trust, discretion, and real connection.'}</h2>
        <div class="sc-about-card-grid">
            <article class="sc-about-card">
                <h3>{lang 'Couples only'}</h3>
                <p>{lang 'Profiles are shaped around two people, so the conversation starts with who you are together.'}</p>
            </article>
            <article class="sc-about-card">
                <h3>{lang 'Member-focused privacy'}</h3>
                <p>{lang 'The experience is built for a more private couples community, with practical controls and a calmer member feel.'}</p>
            </article>
            <article class="sc-about-card">
                <h3>{lang 'Real chemistry'}</h3>
                <p>{lang 'SharedChemistry is organized around attraction, conversation, and couples-only connection instead of empty scrolling.'}</p>
            </article>
        </div>
    </section>

    <section class="sc-about-section sc-about-wrap">
        <div class="sc-about-cta">
            <div>
                <p class="sc-about-kicker">{lang 'The next invitation'}</p>
                <h2>{lang 'For couples who want something more social, more exciting, and more real.'}</h2>
                <p>{lang 'Create a couple profile, share your chemistry, and start meeting private couples who are here for genuine connection.'}</p>
                <div class="sc-about-actions">
                    <a class="sc-about-button sc-about-button-primary" href="{{ $design->url('user', 'signup', 'step1') }}">{lang 'Create your couple profile'}</a>
                    <a class="sc-about-signin" href="{{ $design->url('user', 'main', 'login') }}" data-load="ajax">{lang 'Sign in'}</a>
                </div>
            </div>
            <img class="sc-about-image" src="{url_tpl_img}sharedchemistry/about/about-3.png" alt="{lang 'Celebratory SharedChemistry invitation for private couples'}" loading="lazy" />
        </div>
    </section>
</div>
