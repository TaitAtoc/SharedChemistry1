{literal}
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
    flex-wrap: wrap;
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
    width: 340px;
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

.sc-carousel-stage {
    position: relative;
    background: radial-gradient(circle at center, #201827 0, #0f0c12 68%);
}

.sc-selected-photo {
    display: flex;
    align-items: center;
    justify-content: center;
    min-height: 280px;
    padding: 22px 64px;
}

.sc-selected-photo img {
    display: block;
    max-width: 100%;
    max-height: 520px;
    object-fit: contain;
}

.sc-carousel-arrow {
    position: absolute;
    top: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    width: 46px;
    height: 58px;
    border: 1px solid rgba(255, 255, 255, .15);
    border-radius: 8px;
    background: rgba(15, 12, 18, .78);
    color: #fff !important;
    font-size: 34px;
    line-height: 1;
    text-decoration: none;
    transform: translateY(-50%);
}

.sc-carousel-arrow:hover,
.sc-carousel-arrow:focus {
    background: linear-gradient(135deg, #d64c8a, #8754d8);
    color: #fff !important;
    text-decoration: none;
}

.sc-carousel-arrow.is-disabled {
    cursor: default;
    opacity: .28;
    pointer-events: none;
}

.sc-carousel-prev {
    left: 12px;
}

.sc-carousel-next {
    right: 12px;
}

.sc-photo-info {
    display: flex;
    align-items: flex-start;
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

.sc-caption {
    margin-top: 8px;
    color: #d9ced8;
}

.sc-thumb-strip {
    display: flex;
    gap: 10px;
    overflow-x: auto;
    padding: 14px 16px;
    border-top: 1px solid rgba(255, 255, 255, .09);
    background: #19151d;
    scrollbar-color: #d64c8a #0f0c12;
}

.sc-thumb {
    flex: 0 0 auto;
    width: 82px;
    height: 82px;
    border: 2px solid transparent;
    border-radius: 8px;
    overflow: hidden;
    background: #0f0c12;
}

.sc-thumb.is-active {
    border-color: #d64c8a;
    box-shadow: 0 0 0 2px rgba(135, 84, 216, .55);
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

.sc-comments-title {
    margin: 0 0 8px;
    color: #fff7fb;
    font-size: 20px;
}

.sc-comment {
    display: flex;
    align-items: flex-start;
    gap: 12px;
    padding: 14px 0;
    border-bottom: 1px solid rgba(255, 255, 255, .09);
}

.sc-comment-avatar {
    flex: 0 0 48px;
    width: 48px;
    height: 48px;
    overflow: hidden;
    border-radius: 50%;
    background: #0f0c12;
}

.sc-gallery .sc-comment-avatar img,
.sc-gallery .sc-comment img,
.sc-gallery .sc-comment-avatar picture,
.sc-gallery .sc-comment-avatar a img {
    width: 48px !important;
    height: 48px !important;
    max-width: 48px !important;
    max-height: 48px !important;
    object-fit: cover !important;
    border-radius: 50% !important;
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

.sc-comment-meta {
    display: flex;
    flex-wrap: wrap;
    gap: 8px;
    align-items: baseline;
}

.sc-comment-text {
    margin-top: 6px;
    color: #f4edf4;
}

.sc-comment-form {
    margin-top: 18px;
    padding-top: 16px;
    border-top: 1px solid rgba(255, 255, 255, .09);
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
        padding: 18px 52px;
    }

    .sc-gallery-title {
        font-size: 25px;
    }

    .sc-carousel-arrow {
        width: 38px;
        height: 50px;
        font-size: 28px;
    }
}
</style>
{/literal}

<div class="sc-gallery">
    <div class="sc-gallery-header">
        <h1 class="sc-gallery-title">{lang 'Shared Photo Gallery'}</h1>

        <details class="sc-upload">
            <summary>{lang 'Upload Photo'}</summary>
            <form class="sc-upload-panel" method="post" action="{url_root}photo-gallery" enctype="multipart/form-data">
                <input type="hidden" name="sc_gallery_action" value="upload" />
                <input type="hidden" name="security_token" value="{% $csrf_token %}" />

                <label class="sc-field">
                    {lang 'Photo title'}
                    <input type="text" name="title" maxlength="120" />
                </label>

                <label class="sc-field">
                    {lang 'Caption'}
                    <textarea name="caption" rows="3" maxlength="500"></textarea>
                </label>

                <label class="sc-field">
                    {lang 'Image'}
                    <input type="file" name="photo" accept="image/jpeg,image/png,image/webp" required="required" />
                </label>

                <button class="sc-button" type="submit">{lang 'Upload Photo'}</button>
            </form>
        </details>
    </div>

    {if !empty($gallery_error)}
        <div class="sc-alert">{% escape($gallery_error) %}</div>
    {/if}

    {if !empty($selected_photo)}
        <section class="sc-photo-card">
            <div class="sc-carousel-stage">
                {if !empty($previous_photo)}
                    <a class="sc-carousel-arrow sc-carousel-prev" href="{url_root}photo-gallery?photo_id={% $previous_photo->photoId %}" aria-label="{lang 'Previous'}">&lsaquo;</a>
                {else}
                    <span class="sc-carousel-arrow sc-carousel-prev is-disabled" aria-hidden="true">&lsaquo;</span>
                {/if}

                <div class="sc-selected-photo">
                    <img src="{image_base_url}{% escape($selected_photo->fileName) %}" alt="{% escape($selected_photo->title) %}" />
                </div>

                {if !empty($next_photo)}
                    <a class="sc-carousel-arrow sc-carousel-next" href="{url_root}photo-gallery?photo_id={% $next_photo->photoId %}" aria-label="{lang 'Next'}">&rsaquo;</a>
                {else}
                    <span class="sc-carousel-arrow sc-carousel-next is-disabled" aria-hidden="true">&rsaquo;</span>
                {/if}
            </div>

            <div class="sc-photo-info">
                <div>
                    <h3>{% escape($selected_photo->title) %}</h3>
                    <div class="sc-muted">
                        {lang 'Uploaded by'} {{ $design->getProfileLink($selected_photo->username) }}
                    </div>
                    {if !empty($selected_photo->caption)}
                        <div class="sc-caption">{% escape($selected_photo->caption) %}</div>
                    {/if}
                </div>
                <div class="sc-muted">
                    {% Framework\Date\Various::textTimeStamp($selected_photo->createdAt) %}
                </div>
            </div>

            <div class="sc-thumb-strip">
                {each $photo in $photos}
                    <a class="sc-thumb {if $photo->photoId == $selected_photo->photoId}is-active{/if}" href="{url_root}photo-gallery?photo_id={% $photo->photoId %}">
                        <img src="{image_base_url}{% escape($photo->fileName) %}" alt="{% escape($photo->title) %}" />
                    </a>
                {/each}
            </div>
        </section>

        <section class="sc-comments-card">
            <h3 class="sc-comments-title">{lang 'Comments'}</h3>

            {if empty($comments)}
                <p class="sc-muted">{lang 'No comments yet.'}</p>
            {else}
                {each $com in $comments}
                    <div class="sc-comment">
                        <div class="sc-comment-avatar">
                            {{ $avatarDesign->get($com->username, $com->firstName, $com->sex, 48) }}
                        </div>
                        <div class="sc-comment-body">
                            <div class="sc-comment-meta">
                                <span class="sc-comment-name">{% escape($com->firstName) %}</span>
                                <span class="sc-muted">{% Framework\Date\Various::textTimeStamp($com->createdAt) %}</span>
                            </div>
                            {{ $comment_text = nl2br(escape($com->commentText, true)) }}
                            <div class="sc-comment-text">{comment_text}</div>
                        </div>
                    </div>
                {/each}
            {/if}

            <form class="sc-comment-form" method="post" action="{url_root}photo-gallery?photo_id={% $selected_photo->photoId %}">
                <input type="hidden" name="sc_gallery_action" value="comment" />
                <input type="hidden" name="photo_id" value="{% $selected_photo->photoId %}" />
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
