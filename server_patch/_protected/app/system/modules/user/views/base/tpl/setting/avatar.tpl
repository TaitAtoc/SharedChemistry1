{literal}
<style>
    body main#content#content:has(.sc-avatar-photo-manager) {
        padding-top: 132px !important;
        padding-left: 15px !important;
        padding-right: 15px !important;
    }

    main#content .sc-avatar-photo-manager,
    main#content .sc-avatar-photo-manager * {
        box-sizing: border-box;
    }

    main#content .sc-avatar-photo-manager {
        color: #f7f3ef;
    }

    main#content .sc-avatar-photo-card {
        padding: 15px;
        border: 1px solid rgba(247, 243, 239, .08);
        border-radius: 10px;
        background: #17181d;
        box-shadow: 0 16px 34px rgba(0, 0, 0, .24);
    }

    main#content .sc-avatar-photo-heading {
        margin: 0 0 12px;
    }

    main#content .sc-avatar-photo-heading h2 {
        margin: 0;
        color: #f7f3ef;
        font-size: 19px;
        line-height: 1.25;
        letter-spacing: 0;
    }

    main#content .sc-avatar-photo-heading p {
        margin: 6px 0 0;
        color: #b8b3b0;
        line-height: 1.5;
    }

    main#content .sc-avatar-photo-strip {
        display: grid !important;
        grid-template-columns: repeat(5, minmax(120px, 1fr)) !important;
        gap: 12px !important;
        align-items: stretch !important;
        width: 100% !important;
        min-width: 0;
    }

    main#content .sc-avatar-photo-slot {
        display: flex !important;
        flex-direction: column !important;
        gap: 7px !important;
        min-width: 0;
        min-height: 100%;
        padding: 8px !important;
        border: 1px solid rgba(247, 243, 239, .10) !important;
        border-radius: 8px !important;
        background: #100f14 !important;
        overflow: hidden;
    }

    main#content .sc-avatar-photo-frame {
        position: relative;
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        width: 100% !important;
        height: 126px !important;
        min-height: 126px !important;
        padding-top: 6px !important;
        overflow: hidden !important;
        border-radius: 7px !important;
        background: #0d0c11 !important;
    }

    main#content .sc-avatar-photo-frame a {
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        width: 100% !important;
        height: calc(100% - 6px) !important;
        text-decoration: none !important;
    }

    main#content .sc-avatar-photo-frame img {
        display: block !important;
        width: 100% !important;
        height: 100% !important;
        max-width: none !important;
        max-height: none !important;
        margin: 0 !important;
        border: 0 !important;
        border-radius: 7px !important;
        object-fit: cover !important;
        object-position: center 35% !important;
    }

    main#content .sc-avatar-photo-frame .picture_block {
        display: flex !important;
        align-items: center !important;
        justify-content: center !important;
        width: 100% !important;
        max-width: 100% !important;
        height: calc(100% - 6px) !important;
        margin: 0 !important;
    }

    main#content .sc-avatar-photo-placeholder-note {
        position: absolute;
        left: 7px;
        right: 7px;
        bottom: 7px;
        display: block;
        padding: 4px 6px;
        border-radius: 999px;
        background: rgba(16, 17, 20, .78);
        color: #f7f3ef;
        font-size: 10px;
        font-weight: 700;
        line-height: 1.2;
        text-align: center;
    }

    main#content .sc-avatar-photo-label {
        display: block;
        width: 100%;
        min-height: 26px;
        margin: 0;
        color: #d9d2dc;
        font-size: 11px;
        font-weight: 700;
        line-height: 1.2;
        text-align: center;
    }

    main#content .sc-avatar-photo-controls {
        display: grid !important;
        gap: 6px !important;
        width: 100% !important;
        min-width: 0;
        margin-top: auto !important;
    }

    main#content .sc-avatar-photo-controls form,
    main#content .sc-avatar-photo-controls fieldset,
    main#content .sc-avatar-photo-controls .pfbc-form,
    main#content .sc-avatar-photo-controls .form-horizontal,
    main#content .sc-avatar-photo-controls .form-inline {
        display: grid !important;
        gap: 6px !important;
        width: 100% !important;
        max-width: none !important;
        min-width: 0 !important;
        margin: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        background: transparent !important;
        box-shadow: none !important;
    }

    main#content .sc-avatar-photo-controls .control-group,
    main#content .sc-avatar-photo-controls .controls,
    main#content .sc-avatar-photo-controls .form-group,
    main#content .sc-avatar-photo-controls .form-actions,
    main#content .sc-avatar-photo-controls .pfbc-element,
    main#content .sc-avatar-photo-controls .pfbc-form-group,
    main#content .sc-avatar-photo-controls .pfbc-buttons,
    main#content .sc-avatar-photo-controls .btn-group,
    main#content .sc-avatar-photo-controls div[id^="pfbc-element-"] {
        display: grid !important;
        gap: 5px !important;
        width: 100% !important;
        max-width: none !important;
        min-width: 0 !important;
        margin: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        float: none !important;
        clear: both !important;
        text-align: center !important;
        background: transparent !important;
    }

    main#content .sc-avatar-photo-controls .pfbc-label {
        margin: 0 0 3px !important;
        padding: 0 !important;
    }

    main#content .sc-avatar-photo-controls label {
        display: block !important;
        margin: 0 !important;
        color: #b8b3b0 !important;
        font-size: 10px !important;
        font-weight: 700 !important;
        line-height: 1.25 !important;
        text-align: left !important;
    }

    main#content .sc-avatar-photo-controls input[type="file"] {
        display: block !important;
        width: 100% !important;
        min-height: 32px !important;
        box-sizing: border-box !important;
        padding: 6px !important;
        border: 1px solid rgba(247, 243, 239, .12) !important;
        border-radius: 8px !important;
        background: #101114 !important;
        color: #f7f3ef !important;
        font-size: 11px !important;
        box-shadow: none !important;
        text-shadow: none !important;
    }

    main#content .sc-avatar-photo-controls input[type="submit"],
    main#content .sc-avatar-photo-controls button,
    main#content .sc-avatar-photo-controls .btn,
    main#content .sc-avatar-photo-controls a.btn {
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        width: 100% !important;
        min-height: 32px !important;
        box-sizing: border-box !important;
        margin: 0 !important;
        padding: 7px 9px !important;
        border: 0 !important;
        border-radius: 8px !important;
        background: #ec0868 !important;
        background-image: none !important;
        color: #f7f3ef !important;
        float: none !important;
        clear: both !important;
        font-size: 11px !important;
        font-weight: 700 !important;
        line-height: 1.2 !important;
        text-align: center !important;
        text-decoration: none !important;
        text-shadow: none !important;
        white-space: normal !important;
        box-shadow: none !important;
    }

    main#content .sc-avatar-photo-controls input[type="submit"]:hover,
    main#content .sc-avatar-photo-controls button:hover,
    main#content .sc-avatar-photo-controls .btn:hover,
    main#content .sc-avatar-photo-controls a.btn:hover,
    main#content .sc-avatar-photo-controls input[type="submit"]:focus,
    main#content .sc-avatar-photo-controls button:focus,
    main#content .sc-avatar-photo-controls .btn:focus,
    main#content .sc-avatar-photo-controls a.btn:focus {
        background: #c200fb !important;
        color: #f7f3ef !important;
        outline: none !important;
    }

    main#content .sc-avatar-photo-controls .sc-public-photo-delete-wrap input[type="submit"],
    main#content .sc-avatar-photo-controls .sc-public-photo-delete-wrap button {
        border: 1px solid rgba(255, 188, 10, .36) !important;
        background: #202127 !important;
        color: #ffbc0a !important;
    }

    main#content .sc-avatar-photo-controls .sc-public-photo-delete-wrap input[type="submit"]:hover,
    main#content .sc-avatar-photo-controls .sc-public-photo-delete-wrap button:hover,
    main#content .sc-avatar-photo-controls .sc-public-photo-delete-wrap input[type="submit"]:focus,
    main#content .sc-avatar-photo-controls .sc-public-photo-delete-wrap button:focus {
        border-color: #ec0868 !important;
        background: #2a1723 !important;
        color: #f7f3ef !important;
    }

    @media (max-width: 1100px) {
        main#content .sc-avatar-photo-strip {
            grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
        }
    }

    @media (max-width: 760px) {
        body main#content#content:has(.sc-avatar-photo-manager) {
            padding-top: 118px !important;
            padding-left: 10px !important;
            padding-right: 10px !important;
        }

        main#content .sc-avatar-photo-strip {
            grid-template-columns: 1fr !important;
        }

        main#content .sc-avatar-photo-card {
            padding: 14px;
        }
    }
</style>
{/literal}

<div class="sc-avatar-photo-manager">
    {{ $public_profile_photos = (new ScPublicProfilePhoto)->getPhotos((int)(new Framework\Session\Session)->get('member_id')) }}

    <section class="sc-avatar-photo-card">
        <div class="sc-avatar-photo-heading">
            <h2>{lang 'Profile Photos'}</h2>
            <p>{lang 'Manage the main couple photo and four public-facing profile photos shown on your public profile.'}</p>
        </div>

        <div class="sc-avatar-photo-strip">
            <article class="sc-avatar-photo-slot">
                <div class="sc-avatar-photo-frame">
                    {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}
                </div>
                <h3 class="sc-avatar-photo-label">{lang 'Main Photo'}</h3>
                <div class="sc-avatar-photo-controls">
                    {if $is_admin_auth AND !$is_user_auth}
                        {{ LinkCoreForm::display(t('Remove main photo'), null, null, null, array('del'=>1)) }}
                    {else}
                        {{ LinkCoreForm::display(t('Remove main photo'), 'user', 'setting', 'avatar', array('del'=>1)) }}
                    {/if}

                    {{ AvatarForm::display() }}
                </div>
            </article>

            {{ $photo1 = isset($public_profile_photos[1]) ? $public_profile_photos[1] : null }}
            <article class="sc-avatar-photo-slot">
                <div class="sc-avatar-photo-frame">
                    {if !empty($photo1)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 1'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 1'}" />
                        </a>
                    {else}
                        <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public profile photo 1'}" />
                        <span class="sc-avatar-photo-placeholder-note">{lang 'No public photo yet'}</span>
                    {/if}
                </div>
                <h3 class="sc-avatar-photo-label">{lang 'Public Profile Photo 1'}</h3>
                <div class="sc-avatar-photo-controls">
                    {{ PublicProfilePhotoForm::display(1, $photo1) }}
                </div>
            </article>

            {{ $photo2 = isset($public_profile_photos[2]) ? $public_profile_photos[2] : null }}
            <article class="sc-avatar-photo-slot">
                <div class="sc-avatar-photo-frame">
                    {if !empty($photo2)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 2'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 2'}" />
                        </a>
                    {else}
                        <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public profile photo 2'}" />
                        <span class="sc-avatar-photo-placeholder-note">{lang 'No public photo yet'}</span>
                    {/if}
                </div>
                <h3 class="sc-avatar-photo-label">{lang 'Public Profile Photo 2'}</h3>
                <div class="sc-avatar-photo-controls">
                    {{ PublicProfilePhotoForm::display(2, $photo2) }}
                </div>
            </article>

            {{ $photo3 = isset($public_profile_photos[3]) ? $public_profile_photos[3] : null }}
            <article class="sc-avatar-photo-slot">
                <div class="sc-avatar-photo-frame">
                    {if !empty($photo3)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 3'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 3'}" />
                        </a>
                    {else}
                        <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public profile photo 3'}" />
                        <span class="sc-avatar-photo-placeholder-note">{lang 'No public photo yet'}</span>
                    {/if}
                </div>
                <h3 class="sc-avatar-photo-label">{lang 'Public Profile Photo 3'}</h3>
                <div class="sc-avatar-photo-controls">
                    {{ PublicProfilePhotoForm::display(3, $photo3) }}
                </div>
            </article>

            {{ $photo4 = isset($public_profile_photos[4]) ? $public_profile_photos[4] : null }}
            <article class="sc-avatar-photo-slot">
                <div class="sc-avatar-photo-frame">
                    {if !empty($photo4)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 4'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 4'}" />
                        </a>
                    {else}
                        <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public profile photo 4'}" />
                        <span class="sc-avatar-photo-placeholder-note">{lang 'No public photo yet'}</span>
                    {/if}
                </div>
                <h3 class="sc-avatar-photo-label">{lang 'Public Profile Photo 4'}</h3>
                <div class="sc-avatar-photo-controls">
                    {{ PublicProfilePhotoForm::display(4, $photo4) }}
                </div>
            </article>
        </div>
    </section>
</div>
