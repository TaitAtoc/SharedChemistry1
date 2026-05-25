{literal}
<style>
    main#content:has(.sc-legal-page),
    body main#content#content:has(.sc-legal-page) {
        max-width: none !important;
        padding: 0 !important;
        background: #08080b !important;
    }

    body:has(.sc-info-page) .navbar.navbar-fixed-top {
        min-height: 104px !important;
        border: 0 !important;
        background: rgba(8, 8, 11, .96) !important;
        box-shadow: 0 12px 34px rgba(0, 0, 0, .28) !important;
    }

    body:has(.sc-info-page) .navbar.navbar-fixed-top > .container {
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        gap: 32px !important;
        min-height: 104px !important;
        padding-top: 12px !important;
        padding-bottom: 12px !important;
    }

    body:has(.sc-info-page) .navbar-header {
        display: flex !important;
        align-items: center !important;
        flex: 0 0 auto !important;
        min-height: 80px !important;
        margin: 0 !important;
    }

    body:has(.sc-info-page) #logo.navbar-brand.sharedchemistry-member-logo {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-start !important;
        height: auto !important;
        min-height: 80px !important;
        margin: 0 !important;
        padding: 0 18px 0 0 !important;
        float: none !important;
        line-height: 1 !important;
    }

    body:has(.sc-info-page) #logo .sharedchemistry-logo-link {
        display: inline-flex !important;
        align-items: center !important;
        width: 300px !important;
        max-width: 32vw !important;
        height: auto !important;
        margin: 0 !important;
        padding: 0 !important;
        transform: none !important;
    }

    body:has(.sc-info-page) #logo .sharedchemistry-header-logo {
        display: block !important;
        width: 300px !important;
        max-width: 100% !important;
        max-height: none !important;
        height: auto !important;
        margin: 0 !important;
        object-fit: contain !important;
        transform: none !important;
    }

    body:has(.sc-info-page) #navbar.navbar-collapse {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-end !important;
        flex: 1 1 auto !important;
        min-height: 80px !important;
        margin: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        box-shadow: none !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-end !important;
        gap: 22px !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li {
        display: flex !important;
        align-items: center !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li > a {
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        min-height: 40px !important;
        margin: 0 !important;
        padding: 10px 16px !important;
        border-radius: 8px !important;
        line-height: 1.2 !important;
        white-space: nowrap !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li > a.sharedchemistry-nav-join {
        background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
        color: #fff !important;
        box-shadow: 0 12px 30px rgba(236, 8, 104, .25) !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li > a.sharedchemistry-nav-signin {
        border: 1px solid rgba(255, 188, 10, .44) !important;
        background: rgba(247, 243, 239, .04) !important;
        color: #ffbc0a !important;
    }

    body:has(.sc-info-page) #navbar .navbar-nav > li > a.sharedchemistry-nav-blog {
        border: 1px solid rgba(247, 243, 239, .14) !important;
        background: rgba(247, 243, 239, .035) !important;
        color: #f7f3ef !important;
    }

    .sc-legal-page,
    .sc-legal-page * {
        box-sizing: border-box;
    }

    .sc-legal-page {
        width: 100%;
        overflow: hidden;
        background:
            radial-gradient(circle at 18% 5%, rgba(236, 8, 104, .16), transparent 30%),
            radial-gradient(circle at 82% 14%, rgba(255, 188, 10, .11), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    .sc-legal-wrap {
        width: min(1080px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-legal-hero {
        padding: 94px 0 50px;
    }

    .sc-legal-kicker {
        margin: 0 0 12px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-legal-title {
        max-width: 820px;
        margin: 0;
        color: #fff8f1;
        font-size: clamp(40px, 5vw, 68px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1;
    }

    .sc-legal-lede,
    .sc-legal-updated,
    .sc-legal-contact-note {
        max-width: 840px;
        margin: 18px 0 0;
        color: #d7d2ce;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-legal-updated {
        color: #ffbc0a;
        font-size: 14px;
        font-weight: 800;
    }

    .sc-legal-contact-note a,
    .sc-legal-contact-note a:visited,
    .sc-legal-section a,
    .sc-legal-section a:visited,
    .sc-legal-contact a,
    .sc-legal-contact a:visited {
        color: #ffbc0a !important;
        font-weight: 800;
        text-decoration: none !important;
    }

    .sc-legal-contact-note a:hover,
    .sc-legal-contact-note a:focus,
    .sc-legal-section a:hover,
    .sc-legal-section a:focus,
    .sc-legal-contact a:hover,
    .sc-legal-contact a:focus {
        color: #fff8f1 !important;
        text-decoration: none !important;
    }

    .sc-legal-index {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 12px;
        margin: 32px 0 0;
        padding: 18px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 16px;
        background: rgba(18, 18, 24, .72);
    }

    .sc-legal-index a,
    .sc-legal-index a:visited,
    .sc-legal-policy-link,
    .sc-legal-policy-link:visited {
        display: block;
        padding: 10px 12px;
        border-radius: 8px;
        background: rgba(247, 243, 239, .045);
        color: #f7f3ef !important;
        font-size: 13px;
        font-weight: 800;
        line-height: 1.3;
        text-decoration: none !important;
    }

    .sc-legal-index a:hover,
    .sc-legal-index a:focus,
    .sc-legal-policy-link:hover,
    .sc-legal-policy-link:focus {
        background: rgba(236, 8, 104, .20);
        color: #fff8f1 !important;
    }

    .sc-legal-card {
        margin: 18px 0;
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 16px;
        background: linear-gradient(180deg, rgba(247, 243, 239, .07), rgba(247, 243, 239, .035));
        box-shadow: 0 20px 50px rgba(0, 0, 0, .24);
    }

    .sc-legal-section h2 {
        margin: 0 0 14px;
        color: #fff8f1;
        font-size: clamp(24px, 2.5vw, 34px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.12;
    }

    .sc-legal-section p {
        margin: 12px 0 0;
        color: #c9c2bd;
        font-size: 15px;
        line-height: 1.72;
    }

    .sc-legal-list {
        display: grid;
        gap: 10px;
        margin: 14px 0 0;
        padding: 0;
        list-style: none;
    }

    .sc-legal-list li {
        position: relative;
        padding-left: 22px;
        color: #c9c2bd;
        font-size: 15px;
        line-height: 1.65;
    }

    .sc-legal-list li:before {
        content: "";
        position: absolute;
        top: .7em;
        left: 0;
        width: 8px;
        height: 8px;
        border-radius: 50%;
        background: #ec0868;
        box-shadow: 0 0 20px rgba(236, 8, 104, .60);
    }

    .sc-legal-detail {
        margin-top: 16px;
        padding: 18px;
        border: 1px solid rgba(255, 188, 10, .20);
        border-radius: 12px;
        background: rgba(255, 188, 10, .06);
    }

    .sc-legal-policy-grid {
        display: grid;
        grid-template-columns: repeat(2, minmax(0, 1fr));
        gap: 12px;
        margin-top: 16px;
    }

    .sc-legal-contact {
        margin: 34px auto 72px;
        padding: 34px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 18px;
        background:
            linear-gradient(135deg, rgba(236, 8, 104, .20), rgba(255, 188, 10, .10)),
            #121218;
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-legal-contact p {
        color: #d7d2ce;
    }

    @media (max-width: 900px) {
        body:has(.sc-info-page) .navbar.navbar-fixed-top,
        body:has(.sc-info-page) .navbar.navbar-fixed-top > .container,
        body:has(.sc-info-page) .navbar-header,
        body:has(.sc-info-page) #logo.navbar-brand.sharedchemistry-member-logo,
        body:has(.sc-info-page) #navbar.navbar-collapse {
            min-height: 0 !important;
            height: auto !important;
        }

        body:has(.sc-info-page) .navbar.navbar-fixed-top > .container {
            display: grid !important;
            justify-items: center !important;
            gap: 12px !important;
            padding-top: 12px !important;
            padding-bottom: 12px !important;
        }

        body:has(.sc-info-page) .navbar-header,
        body:has(.sc-info-page) #navbar.navbar-collapse {
            width: 100% !important;
            justify-content: center !important;
        }

        body:has(.sc-info-page) #logo.navbar-brand.sharedchemistry-member-logo {
            justify-content: center !important;
            padding: 0 !important;
        }

        body:has(.sc-info-page) #logo .sharedchemistry-logo-link,
        body:has(.sc-info-page) #logo .sharedchemistry-header-logo {
            width: min(300px, 82vw) !important;
            max-width: 82vw !important;
        }

        body:has(.sc-info-page) #navbar .navbar-nav {
            justify-content: center !important;
            flex-wrap: wrap !important;
            gap: 10px 14px !important;
            width: 100% !important;
        }

        body:has(.sc-info-page) #navbar .navbar-nav > li > a {
            min-height: 42px !important;
            padding: 10px 14px !important;
        }

        .sc-legal-index {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 680px) {
        .sc-legal-wrap {
            width: min(100% - 20px, 1080px);
        }

        .sc-legal-hero {
            padding: 72px 0 42px;
        }

        .sc-legal-index,
        .sc-legal-policy-grid {
            grid-template-columns: 1fr;
            padding: 14px;
        }

        .sc-legal-card,
        .sc-legal-contact {
            padding: 22px;
        }
    }
</style>
{/literal}

<div class="sc-legal-page sc-info-page">
    <section class="sc-legal-hero sc-legal-wrap">
        <p class="sc-legal-kicker">{lang 'SharedChemistry Legal Notice'}</p>
        <h1 class="sc-legal-title">{lang 'Legal Notice'}</h1>
        <p class="sc-legal-lede">{lang 'This Legal Notice provides information about SharedChemistry, website ownership, hosting, copyright, third-party links, member content, and how to contact us.'}</p>
        <p class="sc-legal-updated">{lang 'Last updated: Apr 24, 2026'}</p>
        <p class="sc-legal-contact-note">{lang 'Questions about this notice can be sent to'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>

        <nav class="sc-legal-index" aria-label="Legal Notice sections">
            <a href="#publisher">{lang 'Website Publisher'}</a>
            <a href="#administration">{lang 'Site Administration'}</a>
            <a href="#hosting">{lang 'Website Hosting'}</a>
            <a href="#about">{lang 'About SharedChemistry'}</a>
            <a href="#third-party-links">{lang 'Third-Party Links'}</a>
            <a href="#links-to-site">{lang 'Links to SharedChemistry'}</a>
            <a href="#copyright">{lang 'Copyright'}</a>
            <a href="#member-content">{lang 'Member Content'}</a>
            <a href="#private-media">{lang 'Private Media'}</a>
            <a href="#accuracy">{lang 'Accuracy'}</a>
            <a href="#reports">{lang 'Reports and Legal Contact'}</a>
            <a href="#related-policies">{lang 'Related Policies'}</a>
        </nav>
    </section>

    <section class="sc-legal-section sc-legal-wrap">
        <article class="sc-legal-card" id="publisher">
            <h2>{lang 'Website Publisher'}</h2>
            <p><strong>{lang 'SharedChemistry'}</strong></p>
            <p>{lang 'SharedChemistry operates the website available at'} <a href="https://sharedchemistry.com/">https://sharedchemistry.com/</a> {lang 'and related pages, features, and services.'}</p>
            <p>{lang 'Contact:'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a></p>
        </article>

        <article class="sc-legal-card" id="administration">
            <h2>{lang 'Managing Editor / Site Administration'}</h2>
            <p><strong>{lang 'SharedChemistry Website Administration'}</strong></p>
            <p>{lang 'The SharedChemistry website is managed by the SharedChemistry administration team.'}</p>
            <p>{lang 'Contact:'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a></p>
        </article>

        <article class="sc-legal-card" id="hosting">
            <h2>{lang 'Website Hosting'}</h2>
            <p><strong>{lang 'WebHostingBuzz'}</strong></p>
            <p>{lang 'The SharedChemistry website is hosted through WebHostingBuzz.'}</p>
            <p>{lang 'Private hosting information, server credentials, account details, database details, and access credentials are not published on this page.'}</p>
        </article>

        <article class="sc-legal-card" id="about">
            <h2>{lang 'About SharedChemistry'}</h2>
            <p>{lang 'SharedChemistry is a private adult couples community built for couple profiles, member-to-member communication, privacy-focused access, and couple-to-couple connection.'}</p>
            <ul class="sc-legal-list">
                <li>{lang 'SharedChemistry is intended for adults only.'}</li>
                <li>{lang 'The community is couples-focused and designed for privacy and discretion.'}</li>
                <li>{lang 'Member content is posted by members and is not guaranteed by SharedChemistry.'}</li>
            </ul>
        </article>

        <article class="sc-legal-card" id="third-party-links">
            <h2>{lang 'Third-Party Links'}</h2>
            <p>{lang 'SharedChemistry may contain links to third-party websites or services. Third-party sites are not controlled by SharedChemistry.'}</p>
            <ul class="sc-legal-list">
                <li>{lang 'SharedChemistry is not responsible for third-party content, resources, availability, terms, privacy policies, security, or practices.'}</li>
                <li>{lang 'Members should review the terms and privacy policy of any third-party site before using it.'}</li>
                <li>{lang 'Use of third-party links is at the discretion of each user.'}</li>
            </ul>
        </article>

        <article class="sc-legal-card" id="links-to-site">
            <h2>{lang 'Links to SharedChemistry From Other Sites'}</h2>
            <p>{lang 'Other websites may link to SharedChemistry. SharedChemistry does not control those external websites.'}</p>
            <ul class="sc-legal-list">
                <li>{lang 'A link to SharedChemistry from another website does not mean SharedChemistry approves, endorses, or is responsible for that website.'}</li>
                <li>{lang 'SharedChemistry may request removal of links that misrepresent the site, create confusion, or are used in a harmful or misleading way.'}</li>
            </ul>
        </article>

        <article class="sc-legal-card" id="copyright">
            <h2>{lang 'Copyright and Site Materials'}</h2>
            <p>{lang 'SharedChemistry branding, page layouts, design, text, graphics, and site materials are protected where applicable.'}</p>
            <ul class="sc-legal-list">
                <li>{lang 'Users may not copy, reproduce, modify, republish, upload, transmit, scrape, sell, or distribute SharedChemistry site materials without permission.'}</li>
                <li>{lang 'This does not give members the right to copy content posted by other members.'}</li>
            </ul>
        </article>

        <article class="sc-legal-card" id="member-content">
            <h2>{lang 'Member Content'}</h2>
            <p>{lang 'Members may upload or submit profile text, photos, videos, messages, and other content.'}</p>
            <ul class="sc-legal-list">
                <li>{lang 'Members are responsible for content they upload, post, or send.'}</li>
                <li>{lang 'Members must have permission and rights to upload any content they provide.'}</li>
                <li>{lang 'SharedChemistry may remove content that violates the Terms of Use, Privacy Policy, member safety, or site rules.'}</li>
            </ul>
        </article>

        <article class="sc-legal-card" id="private-media">
            <h2>{lang 'Private Photos, Private Videos, and Member Media'}</h2>
            <p>{lang 'Private photos and private videos remain member content. Access to private media does not give permission to copy, download, screenshot, screen-record, save, repost, publish, distribute, sell, or share it.'}</p>
            <ul class="sc-legal-list">
                <li>{lang 'Members must not copy or distribute private media posted by another member without clear permission from the member or couple who posted it.'}</li>
                <li>{lang 'Misuse of private media may result in account restriction, account termination, and further action where appropriate.'}</li>
                <li>{lang 'Concerns about private media misuse should be sent to'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</li>
            </ul>
        </article>

        <article class="sc-legal-card" id="accuracy">
            <h2>{lang 'Accuracy of Information'}</h2>
            <p>{lang 'SharedChemistry tries to keep legal and site information accurate and updated. Some information may change over time.'}</p>
            <p>{lang 'SharedChemistry does not guarantee that every page, member profile, third-party link, or piece of member content is complete, accurate, current, or error-free.'}</p>
        </article>

        <article class="sc-legal-card" id="reports">
            <h2>{lang 'Reports and Legal Contact'}</h2>
            <p>{lang 'Members can contact SharedChemistry about legal notices, copyright issues, member content concerns, or private media misuse at'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>
            <div class="sc-legal-detail">
                <p>{lang 'Please include:'}</p>
                <ul class="sc-legal-list">
                    <li>{lang 'The page URL or profile URL.'}</li>
                    <li>{lang 'A clear description of the issue.'}</li>
                    <li>{lang 'Screenshots if relevant.'}</li>
                    <li>{lang 'Contact details for follow-up.'}</li>
                </ul>
            </div>
        </article>

        <article class="sc-legal-card" id="related-policies">
            <h2>{lang 'Related Policies'}</h2>
            <p>{lang 'These pages explain related rules, privacy and discretion expectations, and support options for the SharedChemistry private couples community.'}</p>
            <div class="sc-legal-policy-grid">
                <a class="sc-legal-policy-link" href="{{ $design->url('page','main','terms') }}">{lang 'Terms of Use'}</a>
                <a class="sc-legal-policy-link" href="{{ $design->url('page','main','privacy') }}">{lang 'Privacy Policy'}</a>
                <a class="sc-legal-policy-link" href="{{ $design->url('page','main','helpus') }}">{lang 'Help'}</a>
                <a class="sc-legal-policy-link" href="{{ $design->url('page','main','faq') }}">{lang 'FAQ'}</a>
                <a class="sc-legal-policy-link" href="{{ $design->url('contact','contact','index') }}">{lang 'Contact Support'}</a>
            </div>
        </article>
    </section>

    <section class="sc-legal-contact sc-legal-wrap">
        <p class="sc-legal-kicker">{lang 'Support'}</p>
        <h2>{lang 'Contact SharedChemistry'}</h2>
        <p>{lang 'For legal notice questions, copyright concerns, member content reports, or private media misuse, contact'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>
    </section>
</div>
