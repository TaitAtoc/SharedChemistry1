{literal}
<style>
    main#content:has(.sc-faq-page),
    body main#content#content:has(.sc-faq-page) {
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

    .sc-faq-page,
    .sc-faq-page * {
        box-sizing: border-box;
    }

    .sc-faq-page {
        width: 100%;
        overflow: hidden;
        background:
            radial-gradient(circle at 18% 5%, rgba(236, 8, 104, .18), transparent 30%),
            radial-gradient(circle at 82% 14%, rgba(255, 188, 10, .12), transparent 28%),
            linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%);
        color: #f7f3ef;
    }

    .sc-faq-wrap {
        width: min(1160px, calc(100% - 32px));
        margin: 0 auto;
    }

    .sc-faq-hero {
        padding: 94px 0 58px;
    }

    .sc-faq-kicker {
        margin: 0 0 12px;
        color: #ffbc0a;
        font-size: 12px;
        font-weight: 800;
        letter-spacing: .14em;
        line-height: 1.3;
        text-transform: uppercase;
    }

    .sc-faq-title {
        max-width: 820px;
        margin: 0;
        color: #fff8f1;
        font-size: clamp(40px, 5vw, 68px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1;
    }

    .sc-faq-lede {
        max-width: 780px;
        margin: 22px 0 0;
        color: #d7d2ce;
        font-size: 18px;
        line-height: 1.7;
    }

    .sc-faq-actions {
        display: flex;
        flex-wrap: wrap;
        gap: 14px;
        margin-top: 32px;
    }

    .sc-faq-button,
    .sc-faq-button:visited {
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

    .sc-faq-button-primary,
    .sc-faq-button-primary:visited {
        border: 0;
        background: linear-gradient(90deg, #ec0868, #ff5a3d);
        box-shadow: 0 18px 44px rgba(236, 8, 104, .28);
    }

    .sc-faq-button-secondary,
    .sc-faq-button-secondary:visited {
        border: 1px solid rgba(255, 188, 10, .42);
        background: rgba(247, 243, 239, .045);
        color: #ffbc0a;
    }

    .sc-faq-button-muted,
    .sc-faq-button-muted:visited {
        border: 1px solid rgba(247, 243, 239, .16);
        background: rgba(247, 243, 239, .055);
        color: #f7f3ef;
    }

    .sc-faq-button:hover,
    .sc-faq-button:focus {
        color: #fff;
        text-decoration: none !important;
        transform: translateY(-1px);
    }

    .sc-faq-email {
        margin-top: 18px;
        color: #d7d2ce;
        font-size: 15px;
        line-height: 1.6;
    }

    .sc-faq-email a,
    .sc-faq-email a:visited,
    .sc-faq-answer a,
    .sc-faq-answer a:visited {
        color: #ffbc0a !important;
        font-weight: 800;
        text-decoration: none !important;
    }

    .sc-faq-email a:hover,
    .sc-faq-email a:focus,
    .sc-faq-answer a:hover,
    .sc-faq-answer a:focus {
        color: #fff8f1 !important;
        text-decoration: none !important;
    }

    .sc-faq-section {
        padding: 38px 0;
    }

    .sc-faq-section h2 {
        margin: 0 0 20px;
        color: #fff8f1;
        font-size: clamp(28px, 3vw, 40px);
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.08;
    }

    .sc-faq-list {
        display: grid;
        gap: 14px;
    }

    .sc-faq-item {
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 14px;
        background: linear-gradient(180deg, rgba(247, 243, 239, .07), rgba(247, 243, 239, .035));
        box-shadow: 0 20px 50px rgba(0, 0, 0, .24);
        overflow: hidden;
    }

    .sc-faq-question {
        position: relative;
        display: block;
        width: 100%;
        margin: 0;
        padding: 22px 58px 22px 24px;
        color: #fff8f1;
        font-size: 18px;
        font-weight: 800;
        letter-spacing: 0;
        line-height: 1.25;
    }

    .sc-faq-question:after {
        content: "+";
        position: absolute;
        top: 18px;
        right: 24px;
        color: #ffbc0a;
        font-size: 26px;
        line-height: 1;
    }

    .sc-faq-answer {
        padding: 0 24px 24px;
        color: #c9c2bd;
        font-size: 15px;
        line-height: 1.7;
    }

    .sc-faq-answer p {
        margin: 0;
    }

    .sc-faq-cta {
        margin: 36px auto 72px;
        padding: 34px;
        border: 1px solid rgba(247, 243, 239, .10);
        border-radius: 18px;
        background:
            linear-gradient(135deg, rgba(236, 8, 104, .20), rgba(255, 188, 10, .10)),
            #121218;
        box-shadow: 0 30px 80px rgba(0, 0, 0, .38);
    }

    .sc-faq-cta h2 {
        margin: 0;
    }

    .sc-faq-cta p {
        max-width: 760px;
        margin: 14px 0 0;
        color: #d7d2ce;
        font-size: 16px;
        line-height: 1.7;
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

        .sc-faq-hero {
            padding: 72px 0 44px;
        }
    }

    @media (max-width: 680px) {
        .sc-faq-wrap {
            width: min(100% - 20px, 1160px);
        }

        .sc-faq-actions,
        .sc-faq-button {
            width: 100%;
        }

        .sc-faq-section {
            padding: 30px 0;
        }

        .sc-faq-question {
            padding: 20px 50px 20px 18px;
            font-size: 16px;
        }

        .sc-faq-question:after {
            right: 18px;
        }

        .sc-faq-answer {
            padding: 0 18px 20px;
        }

        .sc-faq-cta {
            margin-bottom: 48px;
            padding: 24px;
        }
    }
</style>
{/literal}

<div class="sc-faq-page sc-info-page">
    <section class="sc-faq-hero sc-faq-wrap">
        <p class="sc-faq-kicker">{lang 'SharedChemistry FAQ'}</p>
        <p class="sc-faq-title">{lang 'Frequently Asked Questions'}</p>
        <p class="sc-faq-lede">{lang 'Find quick answers about signing in, building your couples profile, privacy and discretion, photos, messaging, verified couples, and getting help on SharedChemistry.'}</p>
        <div class="sc-faq-actions">
            <a class="sc-faq-button sc-faq-button-primary" href="{{ $design->url('user', 'signup', 'step1') }}">{lang 'Create your couple profile'}</a>
            <a class="sc-faq-button sc-faq-button-secondary" href="{{ $design->url('user', 'main', 'login') }}" data-load="ajax">{lang 'Sign in'}</a>
            <a class="sc-faq-button sc-faq-button-muted" href="{{ $design->url('contact','contact','index') }}">{lang 'Contact support'}</a>
        </div>
        <p class="sc-faq-email">{lang 'For direct support, email:'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a></p>
    </section>

    <section class="sc-faq-section sc-faq-wrap" aria-labelledby="sc-faq-account">
        <h2 id="sc-faq-account">{lang 'Account & Login'}</h2>
        <div class="sc-faq-list">
            <article class="sc-faq-item" id="divShow_1">
                <h3 class="sc-faq-question">{lang "I can't login, or I forgot my username or password."}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'If you cannot sign in, first check that you are using the correct username or email and password. Passwords are case-sensitive, so make sure Caps Lock is not on. If you forgot your password, use the password reset option on the sign-in page. If the reset email does not arrive, check your spam or junk folder. If you still cannot access your account, contact support at'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a> {lang 'and include the username or email address you used to register.'}</p>
                </div>
            </article>
            <article class="sc-faq-item" id="divShow_4">
                <h3 class="sc-faq-question">{lang 'How can I update my email address?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'For safety and spam prevention, email addresses cannot be changed directly from your account settings. This helps protect member accounts and reduces fake or throwaway account changes. If you genuinely need to update your email address, contact support at'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a> {lang 'from the email currently linked to your account if possible. Include your couple nickname and the new email address you want to use.'}</p>
                </div>
            </article>
            <article class="sc-faq-item" id="divShow_3">
                <h3 class="sc-faq-question">{lang 'How can I delete my account?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'If you are absolutely sure you want to delete your account, you can do this from your privacy settings. Account deletion is permanent. Once your account is deleted, your profile, account details, and access may not be recoverable. Before deleting your account, make sure you are ready to permanently remove your SharedChemistry profile.'}</p>
                </div>
            </article>
        </div>
    </section>

    <section class="sc-faq-section sc-faq-wrap" aria-labelledby="sc-faq-profiles">
        <h2 id="sc-faq-profiles">{lang 'Profiles & Photos'}</h2>
        <div class="sc-faq-list">
            <article class="sc-faq-item" id="divShow_2">
                <h3 class="sc-faq-question">{lang 'How can I update my profile?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'You can update your couple profile from your profile or account settings after signing in. Use the profile setup/edit area to update your couple details, profile text, location information, interests, public photos, and other visible profile sections. Keeping your profile clear and genuine helps other couples understand who you are and what kind of connection you are looking for.'}</p>
                </div>
            </article>
            <article class="sc-faq-item">
                <h3 class="sc-faq-question">{lang 'Where do I upload or change photos?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'Photo options are handled inside your profile area after signing in. Public profile photos and private media are separate areas. Public photos help other members recognize your profile, while private media should only be used where access is controlled. If a photo upload does not work, try a smaller image file, refresh the page, or use another browser before contacting support.'}</p>
                </div>
            </article>
            <article class="sc-faq-item">
                <h3 class="sc-faq-question">{lang 'Can I edit my profile later?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'Yes. Your couple profile can be updated after signup. You can return later to improve your profile text, update photos, change interests, or add more detail as your profile becomes more complete.'}</p>
                </div>
            </article>
        </div>
    </section>

    <section class="sc-faq-section sc-faq-wrap" aria-labelledby="sc-faq-connection">
        <h2 id="sc-faq-connection">{lang 'Messaging, Friends & Verification'}</h2>
        <div class="sc-faq-list">
            <article class="sc-faq-item">
                <h3 class="sc-faq-question">{lang 'How do I connect with other couples?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'After signing in, you can browse member areas available to you, view couple profiles, send messages, and manage friend requests. Start with respectful conversation and build comfort naturally. SharedChemistry is designed around real couple-to-couple connection, not random spam.'}</p>
                </div>
            </article>
            <article class="sc-faq-item">
                <h3 class="sc-faq-question">{lang 'What does Verified Couple mean?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang "Verified Couple is a trust signal that helps members identify couples who have been reviewed or confirmed through the site's verification process. It does not mean every detail about a couple is guaranteed. It simply gives members more confidence when deciding who to connect with."}</p>
                </div>
            </article>
            <article class="sc-faq-item" id="divShow_5">
                <h3 class="sc-faq-question">{lang 'How can I deal with someone that is bothering me?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'If someone is bothering, harassing, or making you uncomfortable, block them if the option is available and stop engaging with them. You should also report the issue through the contact form or email'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>. {lang 'Include the profile URL, the member name or couple nickname, and a clear explanation of what happened. Screenshots or message details can also help the support team review the situation.'}</p>
                </div>
            </article>
        </div>
    </section>

    <section class="sc-faq-section sc-faq-wrap" aria-labelledby="sc-faq-privacy">
        <h2 id="sc-faq-privacy">{lang 'Privacy & Safety'}</h2>
        <div class="sc-faq-list">
            <article class="sc-faq-item">
                <h3 class="sc-faq-question">{lang 'Who can see my profile?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'SharedChemistry is designed as a member-focused couples community. Profiles and member areas should be available only to signed-in members where possible. Your public-facing profile information is what other approved or signed-in members may use to decide whether to connect with you. Avoid placing private contact details directly in public profile text.'}</p>
                </div>
            </article>
            <article class="sc-faq-item">
                <h3 class="sc-faq-question">{lang 'Is SharedChemistry for singles or couples?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'SharedChemistry is built around couples and couple-to-couple connection. The site is designed for adult couples who want a more private, social, and chemistry-focused way to meet other couples.'}</p>
                </div>
            </article>
            <article class="sc-faq-item">
                <h3 class="sc-faq-question">{lang 'What should I do if something on the site is not working?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'If a page is broken, a button does not work, or something looks wrong, try refreshing the page first. If the issue continues, contact support. Include the page URL, what you were trying to do, what happened, and whether you were using mobile or desktop. This makes it easier to find and fix the problem.'}</p>
                </div>
            </article>
        </div>
    </section>

    <section class="sc-faq-section sc-faq-wrap" aria-labelledby="sc-faq-about">
        <h2 id="sc-faq-about">{lang 'About SharedChemistry'}</h2>
        <div class="sc-faq-list">
            <article class="sc-faq-item" id="divShow_6">
                <h3 class="sc-faq-question">{lang 'Who developed this web app?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'SharedChemistry is a customized private couples community built for adult couples who want a cleaner, more social, and more chemistry-focused way to connect. The platform is being shaped around real member needs, privacy-focused access, couple profiles, messaging, verified couple features, and a more premium experience than a generic dating site.'}</p>
                </div>
            </article>
            <article class="sc-faq-item">
                <h3 class="sc-faq-question">{lang 'How do I contact SharedChemistry support?'}</h3>
                <div class="sc-faq-answer">
                    <p>{lang 'Use the Contact Support page or email'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a>. {lang 'For account issues, include your couple nickname and the email address linked to your account. For member reports, include the profile URL and a clear explanation of the issue.'}</p>
                </div>
            </article>
        </div>
    </section>

    <section class="sc-faq-cta sc-faq-wrap">
        <p class="sc-faq-kicker">{lang 'Support'}</p>
        <h2>{lang 'Still have a question?'}</h2>
        <p>{lang 'Contact SharedChemistry support if you need help with account access, profile setup, verification, reports, or site problems.'}</p>
        <p class="sc-faq-email">{lang 'For direct support, email:'} <a href="mailto:support@sharedchemistry.com">support@sharedchemistry.com</a></p>
        <div class="sc-faq-actions">
            <a class="sc-faq-button sc-faq-button-primary" href="{{ $design->url('contact','contact','index') }}">{lang 'Contact support'}</a>
        </div>
    </section>
</div>
