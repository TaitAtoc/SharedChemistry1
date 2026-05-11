<div class="sc-settings-photo-panel">
    {{ $public_profile_photos = (new ScPublicProfilePhoto)->getPhotos((int)(new Framework\Session\Session)->get('member_id')) }}

    <section class="sc-settings-photo-card">
        <div class="sc-settings-photo-copy">
            <h2>{lang 'Profile Photos'}</h2>
            <p>{lang 'Manage the main couple photo and four public-facing profile photos shown on your public profile.'}</p>
        </div>

        <div class="sc-settings-profile-photo-strip">
            <article class="sc-settings-profile-photo-slot">
                <div class="sc-settings-profile-photo-frame">
                    {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}
                </div>
                <h3 class="sc-settings-profile-photo-label">{lang 'Main Photo'}</h3>
                <div class="sc-settings-profile-photo-controls sc-settings-profile-photo-controls--main">
                    {if $is_admin_auth AND !$is_user_auth}
                        {{ LinkCoreForm::display(t('Remove main photo'), null, null, null, array('del'=>1)) }}
                    {else}
                        {{ LinkCoreForm::display(t('Remove main photo'), 'user', 'setting', 'avatar', array('del'=>1)) }}
                    {/if}

                    {{ AvatarForm::display() }}
                </div>
            </article>

            {{ $photo1 = isset($public_profile_photos[1]) ? $public_profile_photos[1] : null }}
            <article class="sc-settings-profile-photo-slot">
                <div class="sc-settings-profile-photo-frame">
                    {if !empty($photo1)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 1'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 1'}" />
                        </a>
                    {else}
                        <span class="sc-settings-profile-photo-empty">{lang 'No public photo yet'}</span>
                    {/if}
                </div>
                <h3 class="sc-settings-profile-photo-label">{lang 'Public Profile Photo 1'}</h3>
                <div class="sc-settings-profile-photo-controls">
                    {{ PublicProfilePhotoForm::display(1, $photo1) }}
                </div>
            </article>

            {{ $photo2 = isset($public_profile_photos[2]) ? $public_profile_photos[2] : null }}
            <article class="sc-settings-profile-photo-slot">
                <div class="sc-settings-profile-photo-frame">
                    {if !empty($photo2)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 2'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 2'}" />
                        </a>
                    {else}
                        <span class="sc-settings-profile-photo-empty">{lang 'No public photo yet'}</span>
                    {/if}
                </div>
                <h3 class="sc-settings-profile-photo-label">{lang 'Public Profile Photo 2'}</h3>
                <div class="sc-settings-profile-photo-controls">
                    {{ PublicProfilePhotoForm::display(2, $photo2) }}
                </div>
            </article>

            {{ $photo3 = isset($public_profile_photos[3]) ? $public_profile_photos[3] : null }}
            <article class="sc-settings-profile-photo-slot">
                <div class="sc-settings-profile-photo-frame">
                    {if !empty($photo3)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 3'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 3'}" />
                        </a>
                    {else}
                        <span class="sc-settings-profile-photo-empty">{lang 'No public photo yet'}</span>
                    {/if}
                </div>
                <h3 class="sc-settings-profile-photo-label">{lang 'Public Profile Photo 3'}</h3>
                <div class="sc-settings-profile-photo-controls">
                    {{ PublicProfilePhotoForm::display(3, $photo3) }}
                </div>
            </article>

            {{ $photo4 = isset($public_profile_photos[4]) ? $public_profile_photos[4] : null }}
            <article class="sc-settings-profile-photo-slot">
                <div class="sc-settings-profile-photo-frame">
                    {if !empty($photo4)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 4'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 4'}" />
                        </a>
                    {else}
                        <span class="sc-settings-profile-photo-empty">{lang 'No public photo yet'}</span>
                    {/if}
                </div>
                <h3 class="sc-settings-profile-photo-label">{lang 'Public Profile Photo 4'}</h3>
                <div class="sc-settings-profile-photo-controls">
                    {{ PublicProfilePhotoForm::display(4, $photo4) }}
                </div>
            </article>
        </div>
    </section>
</div>
