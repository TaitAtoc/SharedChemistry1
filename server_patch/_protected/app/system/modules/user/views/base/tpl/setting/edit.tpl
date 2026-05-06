<style>
.sharedchemistry-edit {
    max-width: 1060px;
    margin: 34px auto 56px;
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

.sharedchemistry-edit__grid {
    display: grid;
    grid-template-columns: minmax(0, 1fr);
    gap: 18px;
    margin-bottom: 22px;
}

.sharedchemistry-edit__section,
.sharedchemistry-edit__media-card {
    padding: 22px;
}

.sharedchemistry-edit__section {
    background: rgba(255, 255, 255, .035);
    border: 1px solid rgba(255, 255, 255, .08);
    border-radius: 18px;
}

.sharedchemistry-edit__section h2,
.sharedchemistry-edit__media-card h3 {
    font-size: 20px;
    line-height: 1.25;
}

.sharedchemistry-edit__section p,
.sharedchemistry-edit__media-card p {
    margin: 9px 0 0;
    line-height: 1.55;
}

.sharedchemistry-edit__fields {
    margin-top: 14px;
    display: flex;
    flex-wrap: wrap;
    gap: 9px;
}

.sharedchemistry-edit__field-pill {
    display: inline-flex;
    align-items: center;
    min-height: 32px;
    padding: 6px 11px;
    border-radius: 999px;
    background: rgba(255, 76, 118, .12);
    color: #ffdce4;
    border: 1px solid rgba(255, 76, 118, .24);
    font-size: 13px;
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
.sharedchemistry-edit__form-wrap select,
.sharedchemistry-edit__form-wrap textarea {
    border-radius: 12px;
    border: 1px solid rgba(255, 255, 255, .16);
    background-color: #242128;
    color: #fff;
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
    .sharedchemistry-edit__grid {
        grid-template-columns: repeat(2, minmax(0, 1fr));
    }

    .sharedchemistry-edit__section--wide {
        grid-column: 1 / -1;
    }
}

@media (max-width: 779px) {
    .sharedchemistry-edit {
        margin-top: 22px;
        padding: 0 12px;
    }

    .sharedchemistry-edit__hero,
    .sharedchemistry-edit__card,
    .sharedchemistry-edit__section,
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
}
</style>

<div class="sharedchemistry-edit">
    <section class="sharedchemistry-edit__hero">
        <h1>Complete Your Couple Profile</h1>
        <p>Add the details that help other couples understand who you are, what you enjoy, and who you would like to meet.</p>
    </section>

    <div class="sharedchemistry-edit__grid">
        <section class="sharedchemistry-edit__section">
            <h2>Couple basics</h2>
            <p>Start with the shared details that make your profile feel real and easy to recognize.</p>
            <div class="sharedchemistry-edit__fields">
                <span class="sharedchemistry-edit__field-pill">Couple name</span>
                <span class="sharedchemistry-edit__field-pill">City</span>
                <span class="sharedchemistry-edit__field-pill">Country</span>
            </div>
        </section>

        <section class="sharedchemistry-edit__section">
            <h2>About us</h2>
            <p>Write a short description of you as a couple.</p>
            <div class="sharedchemistry-edit__fields">
                <span class="sharedchemistry-edit__field-pill">about_us</span>
            </div>
        </section>

        <section class="sharedchemistry-edit__section">
            <h2>Her</h2>
            <p>Add a short description of her personality, interests, and what she enjoys.</p>
            <div class="sharedchemistry-edit__fields">
                <span class="sharedchemistry-edit__field-pill">About her</span>
            </div>
        </section>

        <section class="sharedchemistry-edit__section">
            <h2>Him</h2>
            <p>Add a short description of his personality, interests, and what he enjoys.</p>
            <div class="sharedchemistry-edit__fields">
                <span class="sharedchemistry-edit__field-pill">About him</span>
            </div>
        </section>

        <section class="sharedchemistry-edit__section sharedchemistry-edit__section--wide">
            <h2>What you are looking for</h2>
            <p>Share the kind of connection, experience, and couples you would like to meet.</p>
            <div class="sharedchemistry-edit__fields">
                <span class="sharedchemistry-edit__field-pill">looking_for</span>
                <span class="sharedchemistry-edit__field-pill">ideal_match</span>
                <span class="sharedchemistry-edit__field-pill">experience_level</span>
                <span class="sharedchemistry-edit__field-pill">interested_in</span>
            </div>
        </section>
    </div>

    <section class="sharedchemistry-edit__card">
        <h2>Profile details</h2>
        <p class="sharedchemistry-edit__helper">Use the available profile fields below. Existing save processing is unchanged.</p>
        <div class="sharedchemistry-edit__form-wrap">
            {{ EditForm::display() }}
        </div>
    </section>

    <div class="sharedchemistry-edit__media">
        <section class="sharedchemistry-edit__media-card">
            <h3>Public profile photos</h3>
            <p>You can add up to 4 more public profile photos after your main profile picture.</p>
            <div class="sharedchemistry-edit__actions">
                <a class="sharedchemistry-edit__button" href="{{ $design->url('picture', 'main', 'addalbum') }}">Add public photos</a>
            </div>
        </section>

        <section class="sharedchemistry-edit__media-card">
            <h3>Private photos and videos</h3>
            <p>Private media can be uploaded after your profile is saved. You control what other couples can see.</p>
            <div class="sharedchemistry-edit__actions">
                <span class="sharedchemistry-edit__placeholder">Private photo route to be mapped</span>
                <span class="sharedchemistry-edit__placeholder">Private video route to be mapped</span>
            </div>
        </section>
    </div>
</div>
