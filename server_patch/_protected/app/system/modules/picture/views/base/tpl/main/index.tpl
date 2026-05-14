<style>
body {
    background: #151217;
    color: #f4edf4;
}

.sc-gallery {
    max-width: 1180px;
    margin: 0 auto;
    padding: 18px 12px 36px;
    color: #f4edf4;
}

.sc-gallery a {
    color: #f4a9ce;
}

.sc-gallery-header {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 16px;
    margin-bottom: 18px;
}

.sc-gallery-title {
    margin: 0;
    font-size: 30px;
    line-height: 1.2;
    color: #fff7fb;
}

.sc-upload {
    position: relative;
}

.sc-upload summary {
    display: inline-flex;
    align-items: center;
    min-height: 42px;
    padding: 0 18px;
    border: 0;
    border-radius: 8px;
    background: linear-gradient(135deg, #d64c8a, #8754d8);
    color: #fff;
    font-weight: 700;
    cursor: pointer;
    list-style: none;
}

.sc-upload summary::-webkit-details-marker {
    display: none;
}

.sc-upload-panel,
.sc-photo-card,
.sc-comments-card {
    border: 1px solid rgba(255, 255, 255, .11);
    border-radius: 8px;
    background: #211b25;
    box-shadow: 0 16px 36px rgba(0, 0, 0, .22);
}

.sc-upload-panel {
    position: absolute;
    right: 0;
    z-index: 5;
    width: 320px;
    margin-top: 10px;
    padding: 16px;
}

.sc-field {
    display: block;
    width: 100%;
    margin-bottom: 12px;
    color: #d9ced8;
    text-align: left;
}

.sc-field input,
.sc-field textarea {
    width: 100%;
    margin-top: 6px;
    padding: 10px 12px;
    border: 1px solid rgba(255, 255, 255, .14);
    border-radius: 8px;
    background: #17131a;
    color: #fff;
}

.sc-button {
    display: inline-flex;
    align-items: center;
    justify-content: center;
    min-height: 40px;
    padding: 0 16px;
    border: 0;
    border-radius: 8px;
    background: linear-gradient(135deg, #d64c8a, #8754d8);
    color: #fff;
    font-weight: 700;
}

.sc-alert {
    margin-bottom: 16px;
    padding: 12px 14px;
    border: 1px solid rgba(214, 76, 138, .35);
    border-radius: 8px;
    background: rgba(214, 76, 138, .12);
    color: #ffd8e9;
}

.sc-photo-card {
    overflow: hidden;
}

.sc-selected-photo {
    display: flex;
    justify-content: center;
    min-height: 420px;
    background: #0f0c12;
}

.sc-selected-photo img {
    display: block;
    max-width: 100%;
    max-height: 70vh;
    object-fit: contain;
}

.sc-photo-info {
    display: flex;
    align-items: center;
    justify-content: space-between;
    gap: 12px;
    padding: 16px 18px;
    border-top: 1px solid rgba(255, 255, 255, .09);
}

.sc-photo-info h3 {
    margin: 0 0 4px;
    color: #fff7fb;
    font-size: 20px;
}

.sc-muted {
    color: #a99dac;
}

.sc-thumb-strip {
    display: flex;
    gap: 10px;
    overflow-x: auto;
    padding: 14px;
    border-top: 1px solid rgba(255, 255, 255, .09);
    background: #19151d;
}

.sc-thumb {
    flex: 0 0 auto;
    width: 96px;
    height: 96px;
    border: 2px solid transparent;
    border-radius: 8px;
    overflow: hidden;
    background: #0f0c12;
}

.sc-thumb.is-active {
    border-color: #d64c8a;
}

.sc-thumb img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.sc-comments-card {
    margin-top: 18px;
    padding: 18px;
}

.sc-comment {
    display: flex;
    gap: 12px;
    padding: 14px 0;
    border-bottom: 1px solid rgba(255, 255, 255, .09);
}

.sc-comment:last-of-type {
    border-bottom: 0;
}

.sc-comment-body {
    flex: 1;
    text-align: left;
}

.sc-comment-name {
    color: #fff7fb;
    font-weight: 700;
}

.sc-comment-text {
    margin-top: 6px;
    color: #f4edf4;
}

.sc-comment-form {
    margin-top: 18px;
}

.sc-empty {
    padding: 42px 18px;
    text-align: center;
}

@media (max-width: 767px) {
    .sc-gallery-header,
    .sc-photo-info {
        align-items: stretch;
        flex-direction: column;
    }

    .sc-upload-panel {
        position: static;
        width: 100%;
    }

    .sc-selected-photo {
        min-height: 260px;
    }
}
</style>

<div class="sc-gallery">
    <div class="sc-gallery-header">
        <h1 class="sc-gallery-title">{lang 'Shared Photo Gallery'}</h1>

        <details class="sc-upload">
            <summary>{lang 'Upload Photo'}</summary>
            <form class="sc-upload-panel" method="post" action="{{ $design->url('picture', 'main', 'index') }}" enctype="multipart/form-data">
                <input type="hidden" name="public_gallery_action" value="upload" />
                <input type="hidden" name="security_token" value="{% $csrf_token %}" />

                <label class="sc-field">
                    {lang 'Photo title'}
                    <input type="text" name="title" maxlength="64" />
                </label>

                <label class="sc-field">
                    {lang 'Image'}
                    <input type="file" name="photo" accept="image/*" required="required" />
                </label>

                <button class="sc-button" type="submit">{lang 'Upload Photo'}</button>
            </form>
        </details>
    </div>

    {if !empty($gallery_error)}
        <div class="sc-alert">{gallery_error}</div>
    {/if}

    {if !empty($selected_photo)}
        <section class="sc-photo-card">
            <div class="sc-selected-photo">
                <img src="{url_data_sys_mod}picture/img/{% $selected_photo->username %}/{% $selected_photo->albumId %}/{% str_replace('original', '1200', $selected_photo->file) %}" alt="{% escape($selected_photo->title) %}" />
            </div>

            <div class="sc-photo-info">
                <div>
                    <h3>{% escape(Framework\Security\Ban\Ban::filterWord($selected_photo->title)) %}</h3>
                    <div class="sc-muted">
                        {lang 'Uploaded by'} {{ $design->getProfileLink($selected_photo->username) }}
                    </div>
                </div>
                <div class="sc-muted">
                    {% Framework\Date\Various::textTimeStamp($selected_photo->createdDate) %}
                </div>
            </div>

            <div class="sc-thumb-strip">
                {each $photo in $photos}
                    <a class="sc-thumb {if $photo->pictureId == $selected_photo->pictureId}is-active{/if}" href="{{ $design->url('picture', 'main', 'index') }}?selected_photo_id={% $photo->pictureId %}">
                        <img src="{url_data_sys_mod}picture/img/{% $photo->username %}/{% $photo->albumId %}/{% str_replace('original', '400', $photo->file) %}" alt="{% escape($photo->title) %}" />
                    </a>
                {/each}
            </div>
        </section>

        <section class="sc-comments-card">
            <h3>{lang 'Comments'}</h3>

            {if empty($comments)}
                <p class="sc-muted">{lang 'No comments yet.'}</p>
            {else}
                {each $com in $comments}
                    <div class="sc-comment">
                        <div>
                            {{ $avatarDesign->get($com->username, $com->firstName, $com->sex, 48) }}
                        </div>
                        <div class="sc-comment-body">
                            <div>
                                <span class="sc-comment-name">{% escape($com->firstName) %}</span>
                                <span class="sc-muted">{% Framework\Date\Various::textTimeStamp($com->createdDate) %}</span>
                            </div>
                            {{ $comment_text = nl2br(escape(Framework\Security\Ban\Ban::filterWord($com->comment), true)) }}
                            <div class="sc-comment-text">{comment_text}</div>
                        </div>
                    </div>
                {/each}
            {/if}

            <form class="sc-comment-form" method="post" action="{{ $design->url('picture', 'main', 'index') }}?selected_photo_id={% $selected_photo->pictureId %}">
                <input type="hidden" name="public_gallery_action" value="comment" />
                <input type="hidden" name="picture_id" value="{% $selected_photo->pictureId %}" />
                <input type="hidden" name="security_token" value="{% $csrf_token %}" />

                <label class="sc-field">
                    {lang 'Add a comment'}
                    <textarea name="comment" rows="4" maxlength="500" required="required"></textarea>
                </label>

                <button class="sc-button" type="submit">{lang 'Post Comment'}</button>
            </form>
        </section>
    {else}
        <section class="sc-photo-card sc-empty">
            <h3>{lang 'No photos yet.'}</h3>
            <p class="sc-muted">{lang 'Upload the first shared member photo.'}</p>
        </section>
    {/if}
</div>
