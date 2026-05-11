<style>
html,
body,
#container,
#content,
main#content,
.content,
.main_content,
.main-content {
    background: #101114 !important;
}

#content:has(.sharedchemistry-edit),
main#content:has(.sharedchemistry-edit),
.content:has(.sharedchemistry-edit),
.main_content:has(.sharedchemistry-edit),
.main-content:has(.sharedchemistry-edit),
.center:has(.sharedchemistry-edit) {
    width: auto !important;
    max-width: none !important;
    border: 0 !important;
    border-color: transparent !important;
    box-shadow: none !important;
    background: #101114 !important;
}

#content:has(.sharedchemistry-edit) > .border,
main#content:has(.sharedchemistry-edit) > .border,
#content:has(.sharedchemistry-edit) > .design-box,
main#content:has(.sharedchemistry-edit) > .design-box,
#content:has(.sharedchemistry-edit) > .box,
main#content:has(.sharedchemistry-edit) > .box,
#content:has(.sharedchemistry-edit) > .block,
main#content:has(.sharedchemistry-edit) > .block,
#content:has(.sharedchemistry-edit) > .panel,
main#content:has(.sharedchemistry-edit) > .panel,
#content:has(.sharedchemistry-edit) > .well,
main#content:has(.sharedchemistry-edit) > .well {
    border-color: rgba(247, 243, 239, .08) !important;
    box-shadow: none !important;
    background: #17181d !important;
}

#content:has(.sharedchemistry-edit) ol#toc,
main#content:has(.sharedchemistry-edit) ol#toc {
    display: flex !important;
    flex-wrap: wrap;
    gap: 8px;
    max-width: 1120px;
    margin: 0 auto 14px !important;
    padding: 10px !important;
    list-style: none !important;
    border: 1px solid rgba(247, 243, 239, .08) !important;
    border-radius: 10px !important;
    background: #17181d !important;
    background-image: none !important;
    box-shadow: none !important;
}

#content:has(.sharedchemistry-edit) ol#toc li,
main#content:has(.sharedchemistry-edit) ol#toc li {
    display: block !important;
    float: none !important;
    margin: 0 !important;
    padding: 0 !important;
    border: 0 !important;
    background: transparent !important;
    list-style: none !important;
}

#content:has(.sharedchemistry-edit) ol#toc li:has(a[href="#design"]),
#content:has(.sharedchemistry-edit) ol#toc li:has(a[href="#notification"]),
#content:has(.sharedchemistry-edit) ol#toc li:has(a[href*="/payment/main/info"]),
#content:has(.sharedchemistry-edit) ol#toc li:has(a[href*="payment/main/info"]),
main#content:has(.sharedchemistry-edit) ol#toc li:has(a[href="#design"]),
main#content:has(.sharedchemistry-edit) ol#toc li:has(a[href="#notification"]),
main#content:has(.sharedchemistry-edit) ol#toc li:has(a[href*="/payment/main/info"]),
main#content:has(.sharedchemistry-edit) ol#toc li:has(a[href*="payment/main/info"]) {
    display: none !important;
}

#content:has(.sharedchemistry-edit) ol#toc li a,
main#content:has(.sharedchemistry-edit) ol#toc li a,
#content:has(.sharedchemistry-edit) ol#toc li a.inactive,
main#content:has(.sharedchemistry-edit) ol#toc li a.inactive {
    display: inline-flex !important;
    align-items: center;
    justify-content: center;
    min-height: 36px;
    padding: 8px 13px !important;
    border: 1px solid rgba(247, 243, 239, .10) !important;
    border-radius: 12px !important;
    background: #202127 !important;
    background-image: none !important;
    color: #f7f3ef !important;
    font-weight: 700;
    line-height: 1.2;
    text-decoration: none !important;
    text-shadow: none !important;
    box-shadow: none !important;
}

#content:has(.sharedchemistry-edit) ol#toc li a span,
main#content:has(.sharedchemistry-edit) ol#toc li a span {
    display: inline !important;
    padding: 0 !important;
    border: 0 !important;
    background: transparent !important;
    color: inherit !important;
    text-shadow: none !important;
}

#content:has(.sharedchemistry-edit) ol#toc li a:hover,
#content:has(.sharedchemistry-edit) ol#toc li a:focus,
main#content:has(.sharedchemistry-edit) ol#toc li a:hover,
main#content:has(.sharedchemistry-edit) ol#toc li a:focus {
    border-color: #ec0868 !important;
    background: #2a1723 !important;
    background-image: none !important;
    color: #ffbc0a !important;
}

#content:has(.sharedchemistry-edit) ol#toc li a.active,
main#content:has(.sharedchemistry-edit) ol#toc li a.active {
    border-color: transparent !important;
    background: linear-gradient(90deg, #ec0868, #c200fb) !important;
    color: #f7f3ef !important;
    box-shadow: none !important;
}

.sharedchemistry-edit-logo {
    max-width: 1060px;
    margin: 22px auto 8px;
    padding: 0 20px;
    text-align: center;
}

.sharedchemistry-edit-logo img {
    display: block;
    width: min(360px, 78vw);
    height: auto;
    margin: 0 auto;
}

.sharedchemistry-edit {
    max-width: 1120px;
    margin: 18px auto 64px;
    padding: 0 20px 12px;
    color: #f7f3ef;
    font-family: inherit;
}

.sharedchemistry-edit__hero,
.sharedchemistry-edit__card,
.sharedchemistry-edit__media-card {
    background: #17181d;
    border: 1px solid rgba(247, 243, 239, .08);
    border-radius: 8px;
    box-shadow: 0 20px 54px rgba(0, 0, 0, .34);
}

.sharedchemistry-edit__hero {
    position: relative;
    overflow: hidden;
    padding: 30px 34px 28px;
    margin-bottom: 18px;
    text-align: left;
}

.sharedchemistry-edit__hero:before {
    content: "";
    position: absolute;
    inset: 0;
    pointer-events: none;
    background:
        linear-gradient(135deg, rgba(236, 8, 104, .22), transparent 34%),
        linear-gradient(90deg, transparent 68%, rgba(255, 188, 10, .10));
    opacity: .9;
}

.sharedchemistry-edit__hero > * {
    position: relative;
}

.sharedchemistry-edit__hero h1,
.sharedchemistry-edit__section h2,
.sharedchemistry-edit__card h2 {
    margin: 0;
    color: #f7f3ef;
}

.sharedchemistry-edit__hero h1 {
    font-size: 32px;
    line-height: 1.2;
    letter-spacing: 0;
}

.sharedchemistry-edit__hero p,
.sharedchemistry-edit__section p,
.sharedchemistry-edit__media-card p,
.sharedchemistry-edit__helper {
    color: #b8b3b0;
}

.sharedchemistry-edit__hero p {
    max-width: 760px;
    margin: 12px 0 0;
    font-size: 16px;
    line-height: 1.6;
}

.sharedchemistry-edit__media-card {
    padding: 22px;
}

.sharedchemistry-edit .sc-profile-section {
    background: #202127;
    border: 1px solid rgba(247, 243, 239, .08);
    border-radius: 8px;
    padding: 24px;
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
    color: #8f8a88;
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
    color: #f7f3ef;
    font-weight: 700;
}

.sharedchemistry-edit__form-wrap .help-block,
.sharedchemistry-edit__form-wrap .description,
.sharedchemistry-edit__form-wrap small {
    color: #8f8a88;
}

.sharedchemistry-edit__form-wrap input[type="text"],
.sharedchemistry-edit__form-wrap input[type="email"],
.sharedchemistry-edit__form-wrap input[type="url"],
.sharedchemistry-edit__form-wrap input[type="tel"],
.sharedchemistry-edit__form-wrap input[type="password"],
.sharedchemistry-edit__form-wrap input[type="number"],
.sharedchemistry-edit__form-wrap select,
.sharedchemistry-edit__form-wrap textarea {
    width: 100%;
    border-radius: 8px;
    border: 1px solid rgba(247, 243, 239, .14);
    background-color: #101114;
    color: #f7f3ef;
    box-shadow: none;
}

.sharedchemistry-edit__form-wrap input:focus,
.sharedchemistry-edit__form-wrap select:focus,
.sharedchemistry-edit__form-wrap textarea:focus {
    border-color: #ec0868;
    box-shadow: 0 0 0 3px rgba(236, 8, 104, .18);
    outline: none;
}

.sharedchemistry-edit__form-wrap input[disabled],
.sharedchemistry-edit__form-wrap select[disabled],
.sharedchemistry-edit__form-wrap textarea[disabled] {
    background-color: #202127;
    color: #8f8a88;
}

.sharedchemistry-edit__form-wrap textarea {
    min-height: 120px;
}

.sharedchemistry-edit__form-wrap input[type="checkbox"],
.sharedchemistry-edit__form-wrap input[type="radio"] {
    width: auto;
    accent-color: #ec0868;
}

.sharedchemistry-edit__form-wrap button,
.sharedchemistry-edit__form-wrap input[type="submit"] {
    border-radius: 8px;
    background: linear-gradient(90deg, #ec0868, #c200fb);
    border: 0;
    color: #f7f3ef;
    padding: 12px 24px;
    font-weight: 800;
    box-shadow: 0 12px 28px rgba(236, 8, 104, .24);
}

.sharedchemistry-edit__form-wrap button:hover,
.sharedchemistry-edit__form-wrap button:focus,
.sharedchemistry-edit__form-wrap input[type="submit"]:hover,
.sharedchemistry-edit__form-wrap input[type="submit"]:focus {
    background: linear-gradient(90deg, #fc2f00, #ec7d10);
    color: #f7f3ef;
}

.sharedchemistry-edit__media {
    display: grid;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    gap: 18px;
    margin-top: 22px;
}

.sharedchemistry-edit__media-card h3 {
    margin: 0;
    color: #f7f3ef;
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
    background: #ec0868;
    color: #f7f3ef;
    border: 1px solid #ec0868;
}

.sharedchemistry-edit__button:hover,
.sharedchemistry-edit__button:focus {
    color: #f7f3ef;
    background: #c200fb;
    border-color: #c200fb;
}

.sharedchemistry-edit__placeholder {
    background: rgba(255, 188, 10, .08);
    color: #b8b3b0;
    border: 1px dashed rgba(255, 188, 10, .32);
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
        margin-top: 16px;
    }

    .sharedchemistry-edit {
        margin-top: 22px;
        padding: 0 12px;
    }

    .sharedchemistry-edit__hero,
    .sharedchemistry-edit__card,
    .sharedchemistry-edit .sc-profile-section,
    .sharedchemistry-edit__media-card {
        border-radius: 8px;
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

<div class="sharedchemistry-edit">
    <section class="sharedchemistry-edit__hero">
        <h1>Edit Couple Profile</h1>
        <p>Keep your public couple profile current, polished, and clear for the couples you want to meet.</p>
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
