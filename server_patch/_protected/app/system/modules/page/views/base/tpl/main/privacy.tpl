{literal}
<style>
    main#content:has(.sc-privacy-page),
    body main#content#content:has(.sc-privacy-page) {
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

    .sc-privacy-page,
    .sc-privacy-page * {
        box-sizing: border-box;
    }

    .sc-privacy-page {
        width: 100%;
        overflow: hidden;
        background:
            radial-gradient(circle at 18% 5%, rgba(236, 8, 104, .16), transparent 30%),
            radial-gradient(circle at 82% 14%, rgba(255, 188, 10, .11), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    .sc-privacy-wrap {
        width: min(1080px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-privacy-hero {
        padding: 94px 0 50px;
    }

    .sc-privacy-kicker {
        margin: 0 0 12px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-privacy-title {
        max-width: 820px;
        margin: 0;
        color: #fff8f1;
        font-size: clamp(40px, 5vw, 68px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1;
    }

    .sc-privacy-lede,
    .sc-privacy-updated,
    .sc-privacy-contact-note {
        max-width: 840px;
        margin: 18px 0 0;
        color: #d7d2ce;
        font-size: 17px;
        line-height: 1.7;
    }

    .sc-privacy-updated {
        color: #ffbc0a;
        font-size: 14px;
        font-weight: 800;
    }

    .sc-privacy-contact-note a,
    .sc-privacy-contact-note a:visited,
    .sc-privacy-section a,
    .sc-privacy-section a:visited {
        color: #ffbc0a !important;
        font-weight: 800;
        text-decoration: none !important;
    }

    .sc-privacy-contact-note a:hover,
    .sc-privacy-contact-note a:focus,
    .sc-privacy-section a:hover,
    .sc-privacy-section a:focus {
        color: #fff8f1 !important;
        text-decoration: none !important;
    }

    .sc-privacy-index {
        display: grid;
        grid-template-columns: repeat(3, minmax(0, 1fr));
        gap: 12px;
        margin: 32px 0 0;
        padding: 18px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 16px;
        background: rgba(18, 18, 24, .72);
    }

    .sc-privacy-index a,
    .sc-privacy-index a:visited {
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

    .sc-privacy-index a:hover,
    .sc-privacy-index a:focus {
        background: rgba(236, 8, 104, .20);
        color: #fff8f1 !important;
    }

    .sc-privacy-card {
        margin: 18px 0;
        padding: 28px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 16px;
        background: linear-gradient(180deg, rgba(247, 243, 239, .07), rgba(247, 243, 239, .035));
        box-shadow: 0 20px 50px rgba(0, 0, 0, .24);
    }

    .sc-privacy-section h2 {
        margin: 0 0 14px;
        color: #fff8f1;
        font-size: clamp(24px, 2.5vw, 34px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.12;
    }

    .sc-privacy-section p {
        margin: 12px 0 0;
        color: #c9c2bd;
        font-size: 15px;
        line-height: 1.72;
    }

    .sc-privacy-list {
        display: grid;
        gap: 10px;
        margin: 14px 0 0;
        padding: 0;
        list-style: none;
    }

    .sc-privacy-list li {
        position: relative;
        padding-left: 22px;
        color: #c9c2bd;
        font-size: 15px;
        line-height: 1.65;
    }

    .sc-privacy-list li:before {
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

    .sc-privacy-warning {
        margin-top: 16px;
        padding: 18px;
        border: 1px solid rgba(255, 188, 10, .20);
        border-radius: 12px;
        background: rgba(255, 188, 10, .06);
    }

    .sc-privacy-contact {
        margin: 34px auto 72px;
        padding: 34px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 18px;
        background:
            linear-gradient(135deg, rgba(236, 8, 104, .20), rgba(255, 188, 10, .10)),
            #121218;
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-privacy-contact p {
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

        .sc-privacy-index {
            grid-template-columns: repeat(2, minmax(0, 1fr));
        }
    }

    @media (max-width: 680px) {
        .sc-privacy-wrap {
            width: min(100% - 20px, 1080px);
        }

        .sc-privacy-hero {
            padding: 72px 0 42px;
        }

        .sc-privacy-index {
            grid-template-columns: 1fr;
            padding: 14px;
        }

        .sc-privacy-card,
        .sc-privacy-contact {
            padding: 22px;
        }
    }
</style>
{/literal}

<div class="sc-privacy-page sc-info-page">
    <section class="sc-privacy-hero sc-privacy-wrap">
        <p class="sc-privacy-kicker">{lang 'SharedChemistry Privacy Policy'}</p>
        <p class="sc-privacy-title">{lang 'Privacy Policy'}</p>
        <p class="sc-privacy-lede">{lang 'This Privacy Policy explains how SharedChemistry collects, uses, stores, and protects information connected with accounts, couple profiles, messages, photos, private media, verification features, support requests, and site use.'}</p>
        <p class="sc-privacy-updated">{lang 'Last updated: Apr 24, 2026'}</p>
        <p class="sc-privacy-contact-note">{lang 'Questions about privacy, account data, or private media concerns can be sent to'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>

        <nav class="sc-privacy-index" aria-label="Privacy sections">
            <a href="#overview">{lang 'Overview'}</a>
            <a href="#collect">{lang 'Information collected'}</a>
            <a href="#use">{lang 'How information is used'}</a>
            <a href="#visibility">{lang 'Profile visibility'}</a>
            <a href="#media">{lang 'Private media'}</a>
            <a href="#consent">{lang 'Consent'}</a>
            <a href="#messages">{lang 'Messages'}</a>
            <a href="#safety">{lang 'Reports and safety'}</a>
            <a href="#cookies">{lang 'Cookies and logs'}</a>
            <a href="#sharing">{lang 'Sharing information'}</a>
            <a href="#retention">{lang 'Retention and deletion'}</a>
            <a href="#contact">{lang 'Contact'}</a>
        </nav>
    </section>

    <section class="sc-privacy-section sc-privacy-wrap">
        <article class="sc-privacy-card" id="overview">
            <h2>{lang '1. Overview'}</h2>
            <p>{lang 'SharedChemistry respects member privacy and discretion. SharedChemistry is a private adult couples community, and this policy applies to the website, member accounts, couple profiles, messages, uploaded content, support requests, and related site features.'}</p>
            <p>{lang 'By using the site, members agree to this Privacy Policy.'}</p>
        </article>

        <article class="sc-privacy-card" id="collect">
            <h2>{lang '2. Information We Collect'}</h2>
            <ul class="sc-privacy-list">
                <li>{lang 'Account details such as username, couple nickname, email address, password credentials, and registration details.'}</li>
                <li>{lang 'Couple profile information such as profile text, location details, interests, preferences, photos, verification-related details, and profile settings.'}</li>
                <li>{lang 'Communication information such as messages, friend requests, reports, support page submissions, and support emails.'}</li>
                <li>{lang 'Uploaded content such as public photos, private photos, private videos, profile images, and other member media.'}</li>
                <li>{lang 'Technical information such as browser type, device type, IP address, operating system, pages visited, session data, cookies, and error logs.'}</li>
                <li>{lang 'Payment or membership information if paid features are added later, handled through payment processors where applicable.'}</li>
            </ul>
        </article>

        <article class="sc-privacy-card" id="use">
            <h2>{lang '3. How We Use Information'}</h2>
            <ul class="sc-privacy-list">
                <li>{lang 'To create and manage member accounts.'}</li>
                <li>{lang 'To display couple profiles and member features.'}</li>
                <li>{lang 'To operate messaging, friend requests, verification features, profile views, private media access, and other site features.'}</li>
                <li>{lang 'To respond to support requests.'}</li>
                <li>{lang 'To improve site performance, security, and member experience.'}</li>
                <li>{lang 'To prevent spam, fake accounts, abuse, harassment, unauthorized access, and rule violations.'}</li>
                <li>{lang 'To send account-related notices or important service updates.'}</li>
                <li>{lang 'To comply with site rules and applicable obligations.'}</li>
            </ul>
        </article>

        <article class="sc-privacy-card" id="visibility">
            <h2>{lang '4. Couple Profiles and Member Visibility'}</h2>
            <p>{lang 'Profile information is used to help other members understand who they are connecting with. Members control what they choose to include in their profile.'}</p>
            <p>{lang 'Members should not place personal contact details, addresses, workplace details, or identifying information in public-facing profile sections unless they are comfortable with other members seeing it.'}</p>
            <p>{lang 'SharedChemistry may display profile details to signed-in members or other areas of the site according to site settings and features.'}</p>
        </article>

        <article class="sc-privacy-card" id="media">
            <h2>{lang '5. Public Photos, Private Photos, Private Videos, and Member Media'}</h2>
            <p>{lang 'Public photos may be visible to other members depending on site settings. Private photos and private videos are intended for controlled member access only.'}</p>
            <ul class="sc-privacy-list">
                <li>{lang 'Access to private media does not mean ownership or permission to copy, download, screenshot, screen-record, repost, distribute, publish, sell, or share that media.'}</li>
                <li>{lang "Members must not copy, download, screenshot, screen-record, repost, distribute, publish, sell, or share another member's private photos or private videos without clear permission from the member or couple who posted them."}</li>
                <li>{lang 'Members should think carefully before uploading private or sensitive content.'}</li>
                <li>{lang 'For any photo that could be considered sexual in nature, SharedChemistry recommends using no-face images or blurred faces.'}</li>
                <li>{lang 'For any video that could be considered sexual in nature, SharedChemistry recommends that the video does not show anything that could identify the participants.'}</li>
                <li>{lang 'Members should avoid showing faces, tattoos, distinctive marks, location clues, documents, mirrors, screens, metadata clues, voices, backgrounds, or anything else that could identify them or another participant.'}</li>
                <li>{lang "It is each member's responsibility to protect themselves and others when uploading photos, videos, or private media."}</li>
                <li>{lang 'Members must have consent from every person shown in uploaded content.'}</li>
                <li>{lang 'Members must not upload media of another person without permission.'}</li>
                <li>{lang 'If a member believes private media has been copied, saved, shared, or misused without permission, they should contact'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a> {lang 'with details.'}</li>
            </ul>
            <div class="sc-privacy-warning">
                <p>{lang 'Private media can feel controlled inside the site, but every upload carries practical privacy risk. Choose what you share carefully and protect the identity of everyone involved.'}</p>
            </div>
        </article>

        <article class="sc-privacy-card" id="consent">
            <h2>{lang "6. Consent and Other People's Information"}</h2>
            <ul class="sc-privacy-list">
                <li>{lang "Members must not upload another person's photos, videos, personal information, messages, or identifying details without permission."}</li>
                <li>{lang "A member creating a couple profile should have their partner's permission to represent the couple."}</li>
                <li>{lang "Members should not expose another person's identity, location, contact details, workplace, or private life without consent."}</li>
                <li>{lang 'SharedChemistry may remove content or restrict accounts where consent issues are reported or suspected.'}</li>
            </ul>
        </article>

        <article class="sc-privacy-card" id="messages">
            <h2>{lang '7. Messages and Private Communication'}</h2>
            <p>{lang 'Messages are intended for private member-to-member communication. SharedChemistry may store messages as needed to operate the service.'}</p>
            <p>{lang 'Members should not share or publish private messages outside the site without permission. Reported messages may be reviewed for support, moderation, abuse prevention, or safety reasons.'}</p>
        </article>

        <article class="sc-privacy-card" id="safety">
            <h2>{lang '8. Reports, Blocking, Moderation, and Safety'}</h2>
            <p>{lang 'Members may report behavior, profiles, messages, or content. Reports may include profile URLs, screenshots, messages, member names, and explanations.'}</p>
            <p>{lang 'SharedChemistry may review reports, remove content, restrict accounts, suspend accounts, or take other action. Blocking or reporting tools may store related data so the feature can work.'}</p>
        </article>

        <article class="sc-privacy-card" id="cookies">
            <h2>{lang '9. Cookies and Tracking'}</h2>
            <p>{lang 'The site may use cookies and similar technologies for login sessions, preferences, security, analytics, spam prevention, and site performance.'}</p>
            <p>{lang 'Members can adjust browser cookie settings, but some site features may not work properly if cookies are disabled.'}</p>
        </article>

        <article class="sc-privacy-card" id="logs">
            <h2>{lang '10. Technical Data and Security Logs'}</h2>
            <p>{lang 'SharedChemistry may collect technical logs to protect the site, troubleshoot problems, detect abuse, and improve performance. This may include IP addresses, browser details, device information, page requests, timestamps, errors, and security events.'}</p>
        </article>

        <article class="sc-privacy-card" id="protect">
            <h2>{lang '11. How We Protect Information'}</h2>
            <p>{lang 'SharedChemistry uses reasonable security measures to protect account data, passwords, member information, and uploaded content. No website can guarantee perfect security.'}</p>
            <p>{lang 'Members should use strong passwords, protect their own login access, and be careful when deciding what private media or identifying details to upload.'}</p>
        </article>

        <article class="sc-privacy-card" id="sharing">
            <h2>{lang '12. Sharing Information'}</h2>
            <ul class="sc-privacy-list">
                <li>{lang 'SharedChemistry does not sell member personal information.'}</li>
                <li>{lang 'Information may be shared with service providers that help operate the website, hosting, email delivery, security, payments if added later, analytics, or support tools.'}</li>
                <li>{lang 'Information may be disclosed if needed to enforce rules, protect members, respond to abuse, comply with obligations, or address security issues.'}</li>
                <li>{lang 'Aggregated or non-identifying information may be used to understand site performance or improve the service.'}</li>
            </ul>
        </article>

        <article class="sc-privacy-card" id="third-party">
            <h2>{lang '13. Third-Party Websites and Links'}</h2>
            <p>{lang 'The site may contain links to third-party websites or services. SharedChemistry is not responsible for third-party privacy practices, content, or policies. Members should review third-party policies before using those services.'}</p>
        </article>

        <article class="sc-privacy-card" id="ads">
            <h2>{lang '14. Advertising'}</h2>
            <p>{lang "If ads or promotional placements are used in the future, third-party advertising partners may use cookies or similar technologies. SharedChemistry's Privacy Policy does not control third-party advertiser practices."}</p>
        </article>

        <article class="sc-privacy-card" id="age">
            <h2>{lang '15. Children and Age Restrictions'}</h2>
            <p>{lang 'SharedChemistry is for adults only. Members must be 18 or older. The site is not intended for children or anyone under 18, and SharedChemistry does not knowingly collect information from anyone under 18.'}</p>
            <p>{lang 'Accounts suspected of being underage may be removed.'}</p>
        </article>

        <article class="sc-privacy-card" id="retention">
            <h2>{lang '16. Data Retention'}</h2>
            <p>{lang 'SharedChemistry keeps information as long as needed to operate accounts, provide services, handle support, enforce rules, prevent abuse, maintain backups, and meet obligations.'}</p>
            <p>{lang 'Deleted content or accounts may not disappear instantly from backups, logs, cached data, or records needed for safety and abuse prevention.'}</p>
        </article>

        <article class="sc-privacy-card" id="account">
            <h2>{lang '17. Account Access, Updates, and Deletion'}</h2>
            <p>{lang 'Members can update certain account and profile information through account or profile settings. Some details, such as email address, may require support assistance or may be restricted for account safety and spam prevention.'}</p>
            <p>{lang 'Members may delete their account where available through privacy or settings. Account deletion may be permanent and irrecoverable. Some records may remain where needed for security, abuse prevention, legal compliance, backups, or site integrity.'}</p>
        </article>

        <article class="sc-privacy-card" id="international">
            <h2>{lang '18. International Use'}</h2>
            <p>{lang 'Members may access SharedChemistry from different locations. Data may be stored or processed where SharedChemistry, its hosting provider, or service providers operate.'}</p>
            <p>{lang 'By using the site, members understand that information may be processed outside their own country or region.'}</p>
        </article>

        <article class="sc-privacy-card" id="changes">
            <h2>{lang '19. Changes to This Privacy Policy'}</h2>
            <p>{lang 'SharedChemistry may update this Privacy Policy from time to time. The updated date will be revised when changes are made. Continued use of the site after changes means acceptance of the updated Privacy Policy.'}</p>
        </article>

        <article class="sc-privacy-card" id="contact">
            <h2>{lang '20. Contact'}</h2>
            <p>{lang 'Questions about this Privacy Policy, privacy practices, account data, or private media concerns can be sent to'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>.</p>
        </article>
    </section>

    <section class="sc-privacy-contact sc-privacy-wrap">
        <p class="sc-privacy-kicker">{lang 'Understanding'}</p>
        <h2>{lang 'Final Statement'}</h2>
        <p>{lang 'By using SharedChemistry, you confirm that you have read and understood this Privacy Policy.'}</p>
    </section>
</div>
