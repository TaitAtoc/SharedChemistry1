{if !empty($img_background)}
    {main_include 'profile_background.inc.tpl'}
{/if}

{{ $cp = $couple_profile }}
{{ $profile_title = !empty($cp['couple_name']) ? $cp['couple_name'] : (!empty($first_name) ? $first_name : $username) }}
{{ $location_parts = array_filter([$city, $country]) }}
{{ $location_text = !empty($location_parts) ? implode(', ', $location_parts) : '' }}
{{ $age_parts = array_filter([$cp['her_age'], $cp['him_age']]) }}
{{ $age_text = !empty($age_parts) ? implode(' / ', $age_parts) : '' }}
{{ $looking_for = $cp['looking_for'] }}
{{ $hosting_travel = $cp['hosting_travel'] }}
{{ $availability = $cp['availability'] }}
{{ $sexual_interests = $cp['sexual_interests'] }}

{literal}
<style>
    body{background:#0f1014!important}
    main#content{max-width:1180px!important;margin:0 auto!important;padding:34px 15px 0!important;background:transparent!important}
    .sc-public-profile{color:#f4f1f6}
    .sc-public-profile *{box-sizing:border-box}
    .sc-profile-photo-strip{display:grid;grid-template-columns:repeat(5,minmax(0,1fr));gap:12px;margin:0 0 18px}
    .sc-profile-photo-slot{display:flex;flex-direction:column;gap:8px;align-items:center;justify-content:space-between;min-height:178px;padding:10px;border:1px solid rgba(255,255,255,.12);border-radius:8px;background:#100f14;overflow:hidden}
    .sc-profile-photo-frame{display:flex;align-items:center;justify-content:center;width:100%;min-height:122px;border-radius:7px;background:#0d0c11;overflow:hidden}
    .sc-profile-photo-frame img{display:block;width:100%;max-width:150px;height:122px;max-height:122px;object-fit:cover;border:0;border-radius:7px}
    .sc-profile-photo-frame a{display:flex;align-items:center;justify-content:center;width:100%;height:100%}
    .sc-profile-photo-frame .picture_block{margin:0!important;max-width:100%!important}
    .sc-profile-photo-label{display:block;width:100%;color:#d9d2dc;font-size:12px;font-weight:bold;line-height:1.2;text-align:center}
    .sc-profile-hero,
    .sc-profile-card{background:#17151c;border:1px solid rgba(255,255,255,.09);border-radius:8px;box-shadow:0 14px 36px rgba(0,0,0,.28);color:#f4f1f6}
    .sc-profile-hero{padding:24px;margin:0 0 16px}
    .sc-profile-hero h1{margin:0 0 10px;color:#fff;font-size:34px;line-height:1.15}
    .sc-profile-meta{display:flex;flex-wrap:wrap;gap:8px;margin:0 0 14px;padding:0;list-style:none}
    .sc-profile-meta li,
    .sc-chip{display:inline-flex;align-items:center;min-height:30px;padding:6px 10px;border:1px solid rgba(255,255,255,.1);border-radius:999px;background:#24212b;color:#f5edf6;font-size:13px;line-height:1.25}
    .sc-profile-summary{max-width:880px;margin:0;color:#d9d2dc;font-size:15px;line-height:1.55}
    .sc-profile-actions{display:flex;flex-wrap:wrap;gap:8px;margin-top:18px}
    .sc-profile-button{display:inline-flex;align-items:center;justify-content:center;min-height:38px;padding:9px 14px;border:1px solid rgba(255,255,255,.1);border-radius:6px;background:#24212b;color:#f5edf6;font-size:13px;font-weight:bold;line-height:1.25;text-align:center;text-decoration:none}
    .sc-profile-button:hover,
    .sc-profile-button:focus{background:#2e2935;color:#fff;text-decoration:none}
    .sc-profile-button.is-primary{background:#ff2f8d;border-color:#ff2f8d;color:#fff}
    .sc-profile-button.is-primary:hover,
    .sc-profile-button.is-primary:focus{background:#ff4fa0;border-color:#ff4fa0;color:#fff}
    .sc-profile-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:16px;margin-bottom:16px}
    .sc-profile-grid.is-wide{grid-template-columns:1fr}
    .sc-profile-card{padding:20px}
    .sc-profile-card h2{margin:0 0 12px;color:#fff;font-size:20px;line-height:1.25}
    .sc-profile-card p{margin:0;color:#d9d2dc;font-size:14px;line-height:1.55}
    .sc-profile-details{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:8px;margin:0 0 14px}
    .sc-profile-detail{padding:10px;border-radius:7px;background:#100f14;border:1px solid rgba(255,255,255,.08)}
    .sc-profile-detail strong{display:block;margin-bottom:3px;color:#fff;font-size:12px;line-height:1.2}
    .sc-profile-detail span{display:block;color:#d9d2dc;font-size:13px;line-height:1.3}
    .sc-chip-list{display:flex;flex-wrap:wrap;gap:8px;margin:0;padding:0;list-style:none}
    .sc-empty{color:#8f8794!important;font-style:italic}
    @media (max-width:991px){
        .sc-profile-photo-strip{grid-template-columns:repeat(3,minmax(0,1fr))}
        .sc-profile-grid{grid-template-columns:1fr}
    }
    @media (max-width:767px){
        main#content{padding:24px 10px 0!important}
        .sc-profile-photo-strip{grid-template-columns:repeat(2,minmax(0,1fr))}
        .sc-profile-hero{padding:18px}
        .sc-profile-hero h1{font-size:28px}
        .sc-profile-details{grid-template-columns:1fr}
        .sc-profile-button{width:100%}
    }
</style>
{/literal}

<div class="sc-public-profile" itemscope="itemscope" itemtype="http://schema.org/Person">
    <div class="sc-profile-photo-strip">
        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                {{ (new AvatarDesignCore)->lightBox($username, $first_name, $sex, 400) }}
            </div>
            <span class="sc-profile-photo-label">{lang 'Main Photo'}</span>
        </div>

        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public Photo 2'}" />
            </div>
            <span class="sc-profile-photo-label">{lang 'Public Photo 2'}</span>
        </div>

        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public Photo 3'}" />
            </div>
            <span class="sc-profile-photo-label">{lang 'Public Photo 3'}</span>
        </div>

        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public Photo 4'}" />
            </div>
            <span class="sc-profile-photo-label">{lang 'Public Photo 4'}</span>
        </div>

        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public Photo 5'}" />
            </div>
            <span class="sc-profile-photo-label">{lang 'Public Photo 5'}</span>
        </div>
    </div>

    <section class="sc-profile-hero">
        {{ UserDesignCoreModel::userStatus($id) }}
        <h1 itemprop="name">{{ escape($profile_title) }}</h1>

        <ul class="sc-profile-meta">
            {if !empty($location_text)}
                <li>{{ escape($location_text) }}</li>
            {/if}
            {if !empty($age_text)}
                <li>{lang 'Ages'} {{ escape($age_text) }}</li>
            {/if}
            {if !empty($username)}
                <li>@{username}</li>
            {/if}
        </ul>

        {if !empty($cp['about_us'])}
            <p class="sc-profile-summary" itemprop="description">{{ nl2br(escape($cp['about_us'])) }}</p>
        {else}
            <p class="sc-profile-summary sc-empty">{lang 'This couple has not added an About Us summary yet.'}</p>
        {/if}

        <div class="sc-profile-actions">
            {if $is_mail_enabled AND !empty($mail_link) AND !$is_own_profile}
                <a class="sc-profile-button is-primary" rel="nofollow" href="{mail_link}">{lang 'Message'}</a>
            {else}
                <a class="sc-profile-button is-primary" href="#">{lang 'Message'}</a>
            {/if}

            {if $is_friend_enabled AND !empty($friend_link) AND !$is_own_profile}
                <a class="sc-profile-button" rel="nofollow" href="{friend_link}">
                    {if $is_approved_friend}
                        {lang 'Remove Friend'}
                    {elseif $is_pending_friend}
                        {lang 'Manage Friend'}
                    {else}
                        {lang 'Add Friend'}
                    {/if}
                </a>
            {else}
                <a class="sc-profile-button" href="#">{lang 'Add Friend'}</a>
            {/if}

            <a class="sc-profile-button" href="#">{lang 'Verify Couple Later'}</a>
        </div>
    </section>

    <div class="sc-profile-grid is-wide">
        <section class="sc-profile-card">
            <h2>{lang 'About Us'}</h2>
            {if !empty($cp['about_us'])}
                <p>{{ nl2br(escape($cp['about_us'])) }}</p>
            {else}
                <p class="sc-empty">{lang 'No About Us details yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid">
        <section class="sc-profile-card">
            <h2>{lang 'About Her'}</h2>
            <div class="sc-profile-details">
                {if !empty($cp['her_name'])}<div class="sc-profile-detail"><strong>{lang 'Name'}</strong><span>{{ escape($cp['her_name']) }}</span></div>{/if}
                {if !empty($cp['her_age'])}<div class="sc-profile-detail"><strong>{lang 'Age'}</strong><span>{{ escape($cp['her_age']) }}</span></div>{/if}
                {if !empty($cp['her_ethnicity'])}<div class="sc-profile-detail"><strong>{lang 'Ethnicity'}</strong><span>{{ escape($cp['her_ethnicity']) }}</span></div>{/if}
                {if !empty($cp['her_languages'])}<div class="sc-profile-detail"><strong>{lang 'Languages'}</strong><span>{{ escape($cp['her_languages']) }}</span></div>{/if}
                {if !empty($cp['her_sexuality'])}<div class="sc-profile-detail"><strong>{lang 'Sexuality'}</strong><span>{{ escape($cp['her_sexuality']) }}</span></div>{/if}
                {if !empty($cp['her_experience_level'])}<div class="sc-profile-detail"><strong>{lang 'Experience'}</strong><span>{{ escape($cp['her_experience_level']) }}</span></div>{/if}
            </div>
            {if !empty($cp['about_her'])}
                <p>{{ nl2br(escape($cp['about_her'])) }}</p>
            {else}
                <p class="sc-empty">{lang 'No About Her details yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'About Him'}</h2>
            <div class="sc-profile-details">
                {if !empty($cp['him_name'])}<div class="sc-profile-detail"><strong>{lang 'Name'}</strong><span>{{ escape($cp['him_name']) }}</span></div>{/if}
                {if !empty($cp['him_age'])}<div class="sc-profile-detail"><strong>{lang 'Age'}</strong><span>{{ escape($cp['him_age']) }}</span></div>{/if}
                {if !empty($cp['him_ethnicity'])}<div class="sc-profile-detail"><strong>{lang 'Ethnicity'}</strong><span>{{ escape($cp['him_ethnicity']) }}</span></div>{/if}
                {if !empty($cp['him_languages'])}<div class="sc-profile-detail"><strong>{lang 'Languages'}</strong><span>{{ escape($cp['him_languages']) }}</span></div>{/if}
                {if !empty($cp['him_sexuality'])}<div class="sc-profile-detail"><strong>{lang 'Sexuality'}</strong><span>{{ escape($cp['him_sexuality']) }}</span></div>{/if}
                {if !empty($cp['him_experience_level'])}<div class="sc-profile-detail"><strong>{lang 'Experience'}</strong><span>{{ escape($cp['him_experience_level']) }}</span></div>{/if}
            </div>
            {if !empty($cp['about_him'])}
                <p>{{ nl2br(escape($cp['about_him'])) }}</p>
            {else}
                <p class="sc-empty">{lang 'No About Him details yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid">
        <section class="sc-profile-card">
            <h2>{lang 'Looking For'}</h2>
            {if !empty($looking_for)}
                <ul class="sc-chip-list">
                    {each $key => $item in $looking_for}
                        <li class="sc-chip">{{ escape($item) }}</li>
                    {/each}
                </ul>
            {else}
                <p class="sc-empty">{lang 'No looking-for details yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Hosting & Travel'}</h2>
            {if !empty($hosting_travel)}
                <ul class="sc-chip-list">
                    {each $key => $item in $hosting_travel}
                        <li class="sc-chip">{{ escape($item) }}</li>
                    {/each}
                </ul>
            {else}
                <p class="sc-empty">{lang 'No hosting or travel details yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Availability'}</h2>
            {if !empty($availability)}
                <ul class="sc-chip-list">
                    {each $key => $item in $availability}
                        <li class="sc-chip">{{ escape($item) }}</li>
                    {/each}
                </ul>
            {else}
                <p class="sc-empty">{lang 'No availability details yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Sexual Interests'}</h2>
            {if !empty($sexual_interests)}
                <ul class="sc-chip-list">
                    {each $key => $item in $sexual_interests}
                        <li class="sc-chip">{{ escape($item) }}</li>
                    {/each}
                </ul>
            {else}
                <p class="sc-empty">{lang 'No sexual interest details yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid">
        <section class="sc-profile-card">
            <h2>{lang 'Fantasies'}</h2>
            {if !empty($cp['fantasies'])}
                <p>{{ nl2br(escape($cp['fantasies'])) }}</p>
            {else}
                <p class="sc-empty">{lang 'No fantasies shared yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Boundaries'}</h2>
            {if !empty($cp['boundaries'])}
                <p>{{ nl2br(escape($cp['boundaries'])) }}</p>
            {else}
                <p class="sc-empty">{lang 'No boundaries shared yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid is-wide">
        <section class="sc-profile-card">
            <h2>{lang 'Ideal Match'}</h2>
            {if !empty($cp['ideal_match'])}
                <p>{{ nl2br(escape($cp['ideal_match'])) }}</p>
            {else}
                <p class="sc-empty">{lang 'No ideal match details yet.'}</p>
            {/if}
        </section>
    </div>
</div>
