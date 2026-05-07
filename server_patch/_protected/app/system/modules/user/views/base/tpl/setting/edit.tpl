<style>
body {
    background: #0f1014 !important;
}

#logo,
#menu,
#top,
#header,
.navbar,
.top_menu,
.top-menu,
.header,
.breadcrumb,
.gray_bar,
.grey_bar {
    display: none !important;
}

.sharedchemistry-edit-logo {
    max-width: 1060px;
    margin: 36px auto 10px;
    padding: 0 18px;
    text-align: center;
}

.sharedchemistry-edit-logo img {
    display: block;
    width: min(360px, 78vw);
    height: auto;
    margin: 0 auto;
}

.sharedchemistry-edit-progress {
    max-width: 760px;
    margin: 18px auto 24px;
    padding: 0 18px;
}

.sharedchemistry-edit-progress__track {
    height: 18px;
    overflow: hidden;
    border-radius: 999px;
    background: #21191f;
    border: 1px solid rgba(255, 85, 126, .34);
    box-shadow: inset 0 1px 4px rgba(0, 0, 0, .42);
}

.sharedchemistry-edit-progress__fill {
    width: 100%;
    height: 100%;
    border-radius: inherit;
    background: linear-gradient(90deg, #ec2f67, #ff6f91);
}

.sharedchemistry-edit-progress__text {
    margin-top: 8px;
    color: #ff9bb4;
    font-size: 13px;
    font-weight: 700;
    letter-spacing: 0;
    text-align: center;
}

.sharedchemistry-edit {
    max-width: 1060px;
    margin: 18px auto 56px;
    padding: 0 18px;
    color: #f7edf0;
}

.sharedchemistry-edit__hero,
.sharedchemistry-edit__card,
.sharedchemistry-edit__media-card {
    background: #19171b;
    border: 1px solid rgba(255, 84, 126, .22);
    border-radius: 22px;
    box-shadow: 0 24px 60px rgba(0, 0, 0, .28);
}

.sharedchemistry-edit__hero {
    padding: 30px 34px;
    margin-bottom: 22px;
    text-align: center;
}

.sharedchemistry-edit__hero h1,
.sharedchemistry-edit__section h2,
.sharedchemistry-edit__card h2 {
    margin: 0;
    color: #fff;
}

.sharedchemistry-edit__hero h1 {
    font-size: 34px;
    line-height: 1.2;
}

.sharedchemistry-edit__hero p,
.sharedchemistry-edit__section p,
.sharedchemistry-edit__media-card p,
.sharedchemistry-edit__helper {
    color: #d9c9cf;
}

.sharedchemistry-edit__hero p {
    max-width: 720px;
    margin: 14px auto 0;
    font-size: 16px;
    line-height: 1.6;
}

.sharedchemistry-edit__media-card {
    padding: 22px;
}

.sharedchemistry-edit .sc-profile-section {
    background: rgba(255, 255, 255, .035);
    border: 1px solid rgba(255, 255, 255, .08);
    border-radius: 18px;
    padding: 22px;
}

.sharedchemistry-edit .sc-profile-section h2,
.sharedchemistry-edit__media-card h3 {
    font-size: 20px;
    line-height: 1.25;
}

.sharedchemistry-edit .sc-profile-section p,
.sharedchemistry-edit__media-card p {
    margin: 9px 0 0;
    line-height: 1.55;
}

.sharedchemistry-edit .sc-profile-form-grid {
    display: grid;
    grid-template-columns: minmax(0, 1fr);
    gap: 18px;
}

.sharedchemistry-edit .sc-profile-field-row {
    margin-top: 14px;
}

.sharedchemistry-edit .sc-profile-helper {
    margin: 8px 0 0;
    color: #d9c9cf;
}

.sharedchemistry-edit .sc-profile-checks ul,
.sharedchemistry-edit .sc-profile-checks ol {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 8px 18px;
    margin-top: 12px;
}

.sharedchemistry-edit .sc-profile-checks li {
    margin: 0;
}

.sharedchemistry-edit__card {
    padding: 28px;
}

.sharedchemistry-edit__card h2 {
    font-size: 24px;
    margin-bottom: 7px;
}

.sharedchemistry-edit__helper {
    margin: 0 0 20px;
    line-height: 1.55;
}

.sharedchemistry-edit__form-wrap form,
.sharedchemistry-edit__form-wrap .pfbc-form {
    max-width: none;
}

.sharedchemistry-edit__form-wrap label {
    color: #f8edf1;
}

.sharedchemistry-edit__form-wrap input[type="text"],
.sharedchemistry-edit__form-wrap input[type="email"],
.sharedchemistry-edit__form-wrap input[type="url"],
.sharedchemistry-edit__form-wrap input[type="tel"],
.sharedchemistry-edit__form-wrap input[type="password"],
.sharedchemistry-edit__form-wrap input[type="number"],
.sharedchemistry-edit__form-wrap select,
.sharedchemistry-edit__form-wrap textarea {
    border-radius: 12px;
    border: 1px solid rgba(255, 255, 255, .16);
    background-color: #242128;
    color: #fff;
}

.sharedchemistry-edit__form-wrap textarea {
    min-height: 120px;
}

.sharedchemistry-edit__form-wrap button,
.sharedchemistry-edit__form-wrap input[type="submit"] {
    border-radius: 999px;
    background: #f04472;
    border-color: #f04472;
    color: #fff;
    padding-left: 22px;
    padding-right: 22px;
}

.sharedchemistry-edit__media {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
    margin-top: 22px;
}

.sharedchemistry-edit__media-card h3 {
    margin: 0;
    color: #fff;
}

.sharedchemistry-edit__actions {
    display: flex;
    flex-wrap: wrap;
    gap: 10px;
    margin-top: 16px;
}

.sharedchemistry-edit__button,
.sharedchemistry-edit__placeholder {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 38px;
    padding: 8px 16px;
    border-radius: 999px;
    font-weight: 700;
}

.sharedchemistry-edit__button {
    background: #f04472;
    color: #fff;
    border: 1px solid #f04472;
}

.sharedchemistry-edit__button:hover,
.sharedchemistry-edit__button:focus {
    color: #fff;
    background: #ff5d88;
    border-color: #ff5d88;
}

.sharedchemistry-edit__placeholder {
    background: rgba(255, 255, 255, .06);
    color: #d9c9cf;
    border: 1px dashed rgba(255, 255, 255, .18);
}

@media (min-width: 780px) {
    .sharedchemistry-edit .sc-profile-form-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .sharedchemistry-edit .sc-profile-section--wide {
        grid-column: 1 / -1;
    }
}

@media (max-width: 779px) {
    .sharedchemistry-edit-logo {
        margin-top: 24px;
    }

    .sharedchemistry-edit {
        margin-top: 22px;
        padding: 0 12px;
    }

    .sharedchemistry-edit__hero,
    .sharedchemistry-edit__card,
    .sharedchemistry-edit .sc-profile-section,
    .sharedchemistry-edit__media-card {
        border-radius: 16px;
        padding: 20px;
    }

    .sharedchemistry-edit__hero h1 {
        font-size: 28px;
    }

    .sharedchemistry-edit__media {
        grid-template-columns: 1fr;
    }

    .sharedchemistry-edit .sc-profile-checks ul,
    .sharedchemistry-edit .sc-profile-checks ol {
        grid-template-columns: 1fr;
    }
}
</style>

<div class="sharedchemistry-edit-logo">
    <img src="{url_tpl_img}sharedchemistry/sharedchemistry-header-logo.png" alt="SharedChemistry" />
</div>

<div class="sharedchemistry-edit-progress" aria-label="Profile setup progress">
    <div class="sharedchemistry-edit-progress__track">
        <div class="sharedchemistry-edit-progress__fill"></div>
    </div>
    <div class="sharedchemistry-edit-progress__text">100% - STEP 5/5</div>
</div>

<div class="sharedchemistry-edit">
    <section class="sharedchemistry-edit__hero">
        <h1>Complete Your Couple Profile</h1>
        <p>Add the details that help other couples understand who you are, what you enjoy, and who you would like to meet.</p>
    </section>

    <section class="sharedchemistry-edit__card">
        <div class="sharedchemistry-edit__form-wrap">
            {{ EditForm::display() }}
        </div>
    </section>

    <div class="sharedchemistry-edit__media">
        <section class="sharedchemistry-edit__media-card">
            <h3>Public profile photos</h3>
            <p>Your main profile photo is already set from signup. You can add up to 4 more public profile photos later.</p>
            <div class="sharedchemistry-edit__actions">
                <a class="sharedchemistry-edit__button" href="{{ $design->url('picture', 'main', 'addalbum') }}">Add public photos</a>
            </div>
        </section>

        <section class="sharedchemistry-edit__media-card">
            <h3>Private photos and videos</h3>
            <p>Private media will be added in a later step. You will be able to control what other couples can see.</p>
            <div class="sharedchemistry-edit__actions">
                <span class="sharedchemistry-edit__placeholder">Private photos coming soon</span>
                <span class="sharedchemistry-edit__placeholder">Private videos coming soon</span>
            </div>
        </section>
    </div>
</div>
