{literal}
<style>
    main#content:has(.sc-terms-page),
    body main#content#content:has(.sc-terms-page) {
        max-width: none !important;
        padding: 0 !important;
        background: #08080b !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top {
        min-height: 104px !important;
        border: 0 !important;
        background: rgba(8, 8, 11, .96) !important;
        box-shadow: 0 12px 34px rgba(0, 0, 0, .28) !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container {
        display: flex !important;
        align-items: center !important;
        justify-content: space-between !important;
        gap: 32px !important;
        min-height: 104px !important;
        padding-top: 12px !important;
        padding-bottom: 12px !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar-header {
        display: flex !important;
        align-items: center !important;
        flex: 0 0 auto !important;
        min-height: 80px !important;
        margin: 0 !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo {
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

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-logo-link {
        display: inline-flex !important;
        align-items: center !important;
        width: 300px !important;
        max-width: 32vw !important;
        height: auto !important;
        margin: 0 !important;
        padding: 0 !important;
        transform: none !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-header-logo {
        display: block !important;
        width: 300px !important;
        max-width: 100% !important;
        max-height: none !important;
        height: auto !important;
        margin: 0 !important;
        object-fit: contain !important;
        transform: none !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
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

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav {
        display: flex !important;
        align-items: center !important;
        justify-content: flex-end !important;
        gap: 22px !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li {
        display: flex !important;
        align-items: center !important;
        margin: 0 !important;
        padding: 0 !important;
        float: none !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a {
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

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-join {
        background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
        color: #fff !important;
        box-shadow: 0 12px 30px rgba(236, 8, 104, .25) !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-signin {
        border: 1px solid rgba(255, 188, 10, .44) !important;
        background: rgba(247, 243, 239, .04) !important;
        color: #ffbc0a !important;
    }

    body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-blog {
        border: 1px solid rgba(247, 243, 239, .14) !important;
        background: rgba(247, 243, 239, .035) !important;
        color: #f7f3ef !important;
    }

    .sc-terms-page,
    .sc-terms-page * {
        box-sizing: border-box;
    }

    .sc-terms-page {
        width: 100%;
        overflow: hidden;
        background:
            radial-gradient(circle at 18% 5%, rgba(236, 8, 104, .16), transparent 30%),
            radial-gradient(circle at 82% 14%, rgba(255, 188, 10, .11), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    .sc-terms-wrap {
        width: min(1080px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-terms-hero {
        padding: 94px 0 50px;
    }

    .sc-terms-kicker {
        margin: 0 0 12px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-terms-title {
        max-width: 820px;
        margin: 0;
        color: #fff8f1;
        font-size: clamp(40px, 5vw, 68px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1;
    }

    .sc-terms-lede,
    .sc-terms-updated,
    .sc-terms-contact-note {
        max-width: 820px;
        margin: 18px 0 0;
        color: #d7d2ce;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-terms-updated {
        color: #ffbc0a;
        font-size: 14px;
        font-weight: 800;
    }

    .sc-terms-contact-note a,
    .sc-terms-contact-note a:visited,
    .sc-terms-section a,
    .sc-terms-section a:visited {
        color: #ffbc0a !important;
        font-weight: 800;
        text-decoration: none !important;
    }

    .sc-terms-contact-note a:hover,
    .sc-terms-contact-note a:focus,
    .sc-terms-section a:hover,
    .sc-terms-section a:focus {
        color: #fff8f1 !important;
        text-decoration: none !important;
    }

    .sc-terms-index {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 12px;
        margin: 32px 0 0;
        padding: 18px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 16px;
        background: rgba(18, 18, 24, .72);
    }

    .sc-terms-index a,
    .sc-terms-index a:visited {
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

    .sc-terms-index a:hover,
    .sc-terms-index a:focus {
        background: rgba(236, 8, 104, .20);
        color: #fff8f1 !important;
    }

    .sc-terms-card {
        margin: 18px 0;
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 16px;
        background: linear-gradient(180deg, rgba(247, 243, 239, .07), rgba(247, 243, 239, .035));
        box-shadow: 0 20px 50px rgba(0, 0, 0, .24);
    }

    .sc-terms-section h2 {
        margin: 0 0 14px;
        color: #fff8f1;
        font-size: clamp(24px, 2.5vw, 34px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.12;
    }

    .sc-terms-section p {
        margin: 12px 0 0;
        color: #c9c2bd;
        font-size: 15px;
        line-height: 1.72;
    }

    .sc-terms-list {
        display: grid;
        gap: 10px;
        margin: 14px 0 0;
        padding: 0;
        list-style: none;
    }

    .sc-terms-list li {
        position: relative;
        padding-left: 22px;
        color: #c9c2bd;
        font-size: 15px;
        line-height: 1.65;
    }

    .sc-terms-list li:before {
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

    .sc-terms-contact {
        margin: 34px auto 72px;
        padding: 34px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 18px;
        background:
            linear-gradient(135deg, rgba(236, 8, 104, .20), rgba(255, 188, 10, .10)),
            #121218;
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-terms-contact p {
        color: #d7d2ce;
    }

    @media (max-width: 900px) {
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar-header,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
            min-height: 0 !important;
            height: auto !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container {
            display: grid !important;
            justify-items: center !important;
            gap: 12px !important;
            padding-top: 12px !important;
            padding-bottom: 12px !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) .navbar-header,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
            width: 100% !important;
            justify-content: center !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo {
            justify-content: center !important;
            padding: 0 !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-logo-link,
        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #logo .sharedchemistry-header-logo {
            width: min(300px, 82vw) !important;
            max-width: 82vw !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav {
            justify-content: center !important;
            flex-wrap: wrap !important;
            gap: 10px 14px !important;
            width: 100% !important;
        }

        body:has(.sc-info-page):has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a {
            min-height: 42px !important;
            padding: 10px 14px !important;
        }

        .sc-terms-index {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 680px) {
        .sc-terms-wrap {
            width: min(100% - 20px, 1080px);
        }

        .sc-terms-hero {
            padding: 72px 0 42px;
        }

        .sc-terms-index {
            grid-template-columns: 1fr;
            padding: 14px;
        }

        .sc-terms-card,
        .sc-terms-contact {
            padding: 22px;
        }
    }
</style>
{/literal}

<div class="sc-terms-page sc-info-page">
    <section class="sc-terms-hero sc-terms-wrap">
        <p class="sc-terms-kicker">{lang 'SharedChemistry Terms of Use'}</p>
        <p class="sc-terms-title">{lang 'Terms of Use'}</p>
        <p class="sc-terms-lede">{lang 'These Terms of Use explain the rules for using SharedChemistry, including accounts, couple profiles, messages, photos, private media, member conduct, and site access.'}</p>
        <p class="sc-terms-updated">{lang 'Last updated: Apr 24, 2026'}</p>
        <p class="sc-terms-contact-note">{lang 'Questions about these Terms can be sent to'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>

        <nav class="sc-terms-index" aria-label="Terms sections">
            <a href="#acceptance">{lang 'Acceptance'}</a>
            <a href="#about">{lang 'About SharedChemistry'}</a>
            <a href="#eligibility">{lang 'Eligibility'}</a>
            <a href="#consent">{lang 'Couple consent'}</a>
            <a href="#content">{lang 'Member content'}</a>
            <a href="#media">{lang 'Private media'}</a>
            <a href="#conduct">{lang 'Prohibited conduct'}</a>
            <a href="#safety">{lang 'Safety'}</a>
            <a href="#payments">{lang 'Payments'}</a>
            <a href="#rights">{lang 'Rights and licenses'}</a>
            <a href="#enforcement">{lang 'Reports'}</a>
            <a href="#contact">{lang 'Contact'}</a>
        </nav>
    </section>

    <section class="sc-terms-section sc-terms-wrap">
        <article class="sc-terms-card" id="acceptance">
            <h2>{lang '1. Acceptance of Terms'}</h2>
            <p>{lang 'By using SharedChemistry, creating a profile, signing in, browsing member areas, sending messages, uploading content, or using any site feature, you agree to these Terms of Use.'}</p>
            <p>{lang 'SharedChemistry may update these Terms by posting the updated version on the site. Continued use after updates means you accept the updated Terms.'}</p>
        </article>

        <article class="sc-terms-card" id="about">
            <h2>{lang '2. About SharedChemistry'}</h2>
            <p>{lang 'SharedChemistry is a private adult couples community designed for adult couples who want to create couple profiles, connect with other couples, message, share selected profile information, and use member features.'}</p>
            <p>{lang 'The site is built around private couples community participation and couple-to-couple connection.'}</p>
        </article>

        <article class="sc-terms-card" id="eligibility">
            <h2>{lang '3. Eligibility'}</h2>
            <ul class="sc-terms-list">
                <li>{lang 'Members must be 18 years or older.'}</li>
                <li>{lang 'Members must provide truthful and accurate information.'}</li>
                <li>{lang 'Users must not misrepresent age, identity, relationship status, or permission to create a couple profile.'}</li>
                <li>{lang 'Accounts are for personal or couple use only.'}</li>
                <li>{lang 'Users are responsible for all activity under their account.'}</li>
            </ul>
        </article>

        <article class="sc-terms-card" id="consent">
            <h2>{lang '4. Couple Profiles and Partner Consent'}</h2>
            <p>{lang 'SharedChemistry is built around couple profiles. A person creating a couple profile must have permission from their partner to represent the couple.'}</p>
            <ul class="sc-terms-list">
                <li>{lang 'Do not upload photos, videos, private media, or personal information of another person without their consent.'}</li>
                <li>{lang 'Do not pretend to be part of a couple if that is not true.'}</li>
                <li>{lang 'SharedChemistry may remove profiles or restrict accounts where consent or authenticity appears questionable.'}</li>
            </ul>
        </article>

        <article class="sc-terms-card" id="security">
            <h2>{lang '5. Account Security'}</h2>
            <p>{lang 'Users are responsible for keeping login details secure. Do not share passwords, do not use another member account, and report suspected unauthorized access to'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>
        </article>

        <article class="sc-terms-card" id="content">
            <h2>{lang '6. Member Content'}</h2>
            <p>{lang 'Member Content includes profile text, public photos, private photos, private videos, messages, comments, verification notes, and anything posted, uploaded, or sent through the site.'}</p>
            <ul class="sc-terms-list">
                <li>{lang 'Members are responsible for the content they post or send.'}</li>
                <li>{lang 'Members must have the right and consent to upload any content they provide.'}</li>
                <li>{lang 'SharedChemistry may remove content that breaks these Terms, creates risk, or harms the member experience.'}</li>
            </ul>
        </article>

        <article class="sc-terms-card" id="media">
            <h2>{lang '7. Public Photos, Private Photos, Private Videos, and Member Media'}</h2>
            <p>{lang 'Public profile photos are intended to help other members understand who they are connecting with. Private photos and private videos are shared only for the access level or member interaction where they are made available.'}</p>
            <ul class="sc-terms-list">
                <li>{lang 'Access to private media does not give permission to copy, download, record, screenshot, screen-record, save, repost, share, publish, sell, distribute, or show that media to anyone else.'}</li>
                <li>{lang 'Members must not download, copy, screenshot, screen-record, repost, distribute, or share private photos or private videos without the clear permission of the member or couple who posted them.'}</li>
                <li>{lang 'Members must not move private content from SharedChemistry to other websites, apps, chats, forums, social media, cloud folders, or personal devices without permission.'}</li>
                <li>{lang "Sharing another member's private media without permission may result in account termination and may be reported where appropriate."}</li>
                <li>{lang 'If a member believes their private media has been copied or shared without consent, they should contact'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a> {lang 'with details.'}</li>
            </ul>
        </article>

        <article class="sc-terms-card" id="messages">
            <h2>{lang '8. Messages and Private Communication'}</h2>
            <p>{lang 'Messages are for respectful member-to-member communication. Do not harass, threaten, spam, pressure, blackmail, shame, or abuse other members.'}</p>
            <ul class="sc-terms-list">
                <li>{lang 'Do not publish, repost, or share private messages outside the site without permission from the person who sent them.'}</li>
                <li>{lang 'Do not use messages to collect personal data, solicit money, promote outside services, or pressure members to move off-site.'}</li>
            </ul>
        </article>

        <article class="sc-terms-card" id="conduct">
            <h2>{lang '9. Prohibited Conduct'}</h2>
            <ul class="sc-terms-list">
                <li>{lang 'Underage users or content involving anyone under 18.'}</li>
                <li>{lang 'Impersonation or fake couple profiles.'}</li>
                <li>{lang 'Harassment, threats, stalking, intimidation, blackmail, doxxing, or coercion.'}</li>
                <li>{lang 'Uploading content without consent.'}</li>
                <li>{lang 'Copying or distributing private photos or private videos without permission.'}</li>
                <li>{lang 'Posting or sending illegal, abusive, hateful, violent, exploitative, or non-consensual content.'}</li>
                <li>{lang 'Spam, scraping, bots, automated friend requests, fake traffic, or automated messages.'}</li>
                <li>{lang 'Commercial advertising, affiliate links, paid promotion, escorting, solicitation, or selling services without written approval.'}</li>
                <li>{lang 'Attempting to bypass privacy controls, access controls, profile restrictions, upload limits, verification systems, or site security.'}</li>
                <li>{lang 'Collecting member names, emails, photos, videos, profile data, or messages for outside use.'}</li>
                <li>{lang 'Uploading malware, scripts, harmful files, or anything that disrupts the site.'}</li>
            </ul>
        </article>

        <article class="sc-terms-card" id="safety">
            <h2>{lang '10. Safety and Offline Meetings'}</h2>
            <p>{lang 'Members are responsible for their own interactions. SharedChemistry does not guarantee the identity, background, intentions, or conduct of members.'}</p>
            <p>{lang 'Members should use judgment when communicating, sharing personal information, or meeting offline. SharedChemistry is not responsible for offline meetings, private arrangements, events, travel, or personal interactions between members.'}</p>
        </article>

        <article class="sc-terms-card" id="events">
            <h2>{lang '11. Events and Offline Activities'}</h2>
            <p>{lang 'If members attend or arrange offline events, parties, meetings, or gatherings, they do so at their own risk. SharedChemistry is not responsible for personal injury, property loss, disputes, or conduct that happens outside the site.'}</p>
            <p>{lang 'If SharedChemistry later lists or promotes official events, extra rules may apply.'}</p>
        </article>

        <article class="sc-terms-card" id="payments">
            <h2>{lang '12. Payments, Membership, and Features'}</h2>
            <p>{lang 'Some features may be free and some may require payment later. SharedChemistry may add, remove, limit, or change features.'}</p>
            <p>{lang 'If paid features are introduced, payment terms will apply. Accounts may be restricted or terminated if payment obligations are not met.'}</p>
        </article>

        <article class="sc-terms-card" id="commercial">
            <h2>{lang '13. Non-Commercial Use'}</h2>
            <p>{lang 'The site is for personal and couple community use. Do not use SharedChemistry for commercial advertising, lead generation, scraping, selling products or services, affiliate promotion, or spam. Any commercial use requires written approval from SharedChemistry.'}</p>
        </article>

        <article class="sc-terms-card" id="rights">
            <h2>{lang '14. Intellectual Property'}</h2>
            <p>{lang 'SharedChemistry owns the site design, branding, code, layouts, graphics, text, and platform content except member content. Users may not copy, reproduce, clone, sell, modify, scrape, or republish SharedChemistry site materials without permission.'}</p>
        </article>

        <article class="sc-terms-card" id="license">
            <h2>{lang '15. License to Display Member Content'}</h2>
            <p>{lang 'By posting content on SharedChemistry, members give SharedChemistry a limited license to display that content on the site as needed to operate the service. This does not mean other members can copy, download, repost, or redistribute that content.'}</p>
            <p>{lang 'Members remain responsible for the content they provide. Removing content may stop future display, but backup and cache limitations may apply.'}</p>
        </article>

        <article class="sc-terms-card" id="copyright">
            <h2>{lang '16. Copyright and Content Complaints'}</h2>
            <p>{lang 'Members must not upload copyrighted content they do not have permission to use. Copyright or content complaints can be sent to'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>
            <p>{lang 'Include the content URL, a description of the issue, proof or explanation of ownership or rights, and contact details.'}</p>
        </article>

        <article class="sc-terms-card" id="enforcement">
            <h2>{lang '17. Reports, Blocking, and Enforcement'}</h2>
            <p>{lang 'Members can block or report users who bother them or break the rules. Reports should include profile URL, member or couple nickname, screenshots if available, and a clear explanation.'}</p>
            <p>{lang 'SharedChemistry may remove content, warn members, restrict features, suspend accounts, or terminate accounts. SharedChemistry may act with or without prior notice where needed.'}</p>
        </article>

        <article class="sc-terms-card" id="deletion">
            <h2>{lang '18. Account Deletion'}</h2>
            <p>{lang 'Members can delete their account from privacy or settings where available. Deletion may be permanent and irrecoverable.'}</p>
            <p>{lang 'Some records may remain where needed for security, abuse prevention, legal compliance, backups, or site integrity.'}</p>
        </article>

        <article class="sc-terms-card" id="disclaimers">
            <h2>{lang '19. Disclaimers'}</h2>
            <p>{lang 'Online interaction and offline meetings carry risk. SharedChemistry is provided as-is and does not guarantee compatibility, successful connections, member conduct, uninterrupted service, or error-free operation.'}</p>
            <p>{lang 'Member content may be inaccurate, offensive, incomplete, or misleading. Members use the site at their own discretion.'}</p>
        </article>

        <article class="sc-terms-card" id="liability">
            <h2>{lang '20. Limitation of Liability'}</h2>
            <p>{lang 'To the fullest extent permitted, SharedChemistry is not liable for indirect, incidental, special, consequential, punitive, or lost-profit damages related to use of the site, member conduct, content, messages, private media, offline meetings, technical issues, or service interruptions.'}</p>
            <p>{lang 'Liability, if any, is limited to the amount paid by the user to SharedChemistry for the relevant service period.'}</p>
        </article>

        <article class="sc-terms-card" id="indemnity">
            <h2>{lang '21. Indemnity'}</h2>
            <p>{lang "Members agree to hold SharedChemistry harmless from claims arising from their use of the site, their content, their interactions, their breach of these Terms, or their violation of another person's rights."}</p>
        </article>

        <article class="sc-terms-card" id="changes">
            <h2>{lang '22. Changes to the Service'}</h2>
            <p>{lang 'SharedChemistry may change, suspend, remove, or limit parts of the site or features at any time.'}</p>
        </article>

        <article class="sc-terms-card" id="contact">
            <h2>{lang '23. Contact'}</h2>
            <p>{lang 'Questions about these Terms can be sent to'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>
        </article>
    </section>

    <section class="sc-terms-contact sc-terms-wrap">
        <p class="sc-terms-kicker">{lang 'Agreement'}</p>
        <h2>{lang 'Final Statement'}</h2>
        <p>{lang 'By using SharedChemistry, you confirm that you have read, understood, and agree to these Terms of Use.'}</p>
    </section>
</div>
