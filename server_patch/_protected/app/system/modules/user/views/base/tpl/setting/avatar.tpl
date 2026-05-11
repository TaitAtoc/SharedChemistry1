<div class="sc-settings-photo-panel">
    {{ $public_profile_photos = (new ScPublicProfilePhoto)->getPhotos((int)(new Framework\Session\Session)->get('member_id')) }}

    <section class="sc-settings-photo-card sc-settings-photo-card--main">
        <div class="sc-settings-photo-copy">
            <h2>{lang 'Main profile photo'}</h2>
            <p>{lang 'This is the primary photo shown throughout SharedChemistry.'}</p>
        </div>

        <div class="sc-settings-photo-main">
            {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}
        </div>

        <div class="sc-settings-photo-actions">
            {if $is_admin_auth AND !$is_user_auth}
                {{ LinkCoreForm::display(t('Remove main profile photo'), null, null, null, array('del'=>1)) }}
            {else}
                {{ LinkCoreForm::display(t('Remove main profile photo'), 'user', 'setting', 'avatar', array('del'=>1)) }}
            {/if}

            {{ AvatarForm::display() }}
        </div>
    </section>

    <section class="sc-settings-photo-card">
        <div class="sc-settings-photo-copy">
            <h2>{lang 'Public profile photos'}</h2>
            <p>{lang 'Add up to four public-facing couple photos. These are visible on your public profile and are separate from private photos and videos.'}</p>
        </div>

        <div class="sc-settings-public-photo-grid">
            {{ $photo1 = isset($public_profile_photos[1]) ? $public_profile_photos[1] : null }}
            <article class="sc-settings-public-photo-slot">
                <div class="sc-settings-public-photo-preview">
                    {if !empty($photo1)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 1'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 1'}" />
                        </a>
                    {else}
                        <span>{lang 'No photo yet'}</span>
                    {/if}
                </div>
                <h3>{lang 'Public profile photo 1'}</h3>
                {{ PublicProfilePhotoForm::display(1, $photo1) }}
            </article>

            {{ $photo2 = isset($public_profile_photos[2]) ? $public_profile_photos[2] : null }}
            <article class="sc-settings-public-photo-slot">
                <div class="sc-settings-public-photo-preview">
                    {if !empty($photo2)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 2'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 2'}" />
                        </a>
                    {else}
                        <span>{lang 'No photo yet'}</span>
                    {/if}
                </div>
                <h3>{lang 'Public profile photo 2'}</h3>
                {{ PublicProfilePhotoForm::display(2, $photo2) }}
            </article>

            {{ $photo3 = isset($public_profile_photos[3]) ? $public_profile_photos[3] : null }}
            <article class="sc-settings-public-photo-slot">
                <div class="sc-settings-public-photo-preview">
                    {if !empty($photo3)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 3'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 3'}" />
                        </a>
                    {else}
                        <span>{lang 'No photo yet'}</span>
                    {/if}
                </div>
                <h3>{lang 'Public profile photo 3'}</h3>
                {{ PublicProfilePhotoForm::display(3, $photo3) }}
            </article>

            {{ $photo4 = isset($public_profile_photos[4]) ? $public_profile_photos[4] : null }}
            <article class="sc-settings-public-photo-slot">
                <div class="sc-settings-public-photo-preview">
                    {if !empty($photo4)}
                        {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 400) }}
                        {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 1000) }}
                        <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 4'}">
                            <img src="{% $photo_url %}" alt="{lang 'Public profile photo 4'}" />
                        </a>
                    {else}
                        <span>{lang 'No photo yet'}</span>
                    {/if}
                </div>
                <h3>{lang 'Public profile photo 4'}</h3>
                {{ PublicProfilePhotoForm::display(4, $photo4) }}
            </article>
        </div>
    </section>
</div>
