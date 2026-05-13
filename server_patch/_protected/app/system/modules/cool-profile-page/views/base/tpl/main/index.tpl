{if !empty($img_background)}
    {main_include 'profile_background.inc.tpl'}
{/if}

{literal}
<style>
    body{background:#0f1014!important}
    header #headings,
    #headings,
    header .ad_468_60,
    .ad_468_60,
    main#content + .ad_468_60,
    .gray_bar,
    .grey_bar,
    .grey-bar,
    .gray-bar{display:none!important;height:0!important;min-height:0!important;margin:0!important;padding:0!important;overflow:hidden!important;border:0!important;background:transparent!important}
    main#content{max-width:1180px!important;margin:0 auto!important;padding:150px 15px 0!important;background:transparent!important;border:0!important;box-shadow:none!important}
    .sc-public-profile{color:#f4f1f6}
    .sc-public-profile *{box-sizing:border-box}
    .sc-profile-photo-strip{display:grid;grid-template-columns:repeat(5,minmax(0,1fr));gap:12px;margin:0 0 18px}
    .sc-profile-photo-slot{display:flex;flex-direction:column;gap:8px;align-items:center;justify-content:space-between;min-height:178px;padding:10px;border:1px solid rgba(255,255,255,.12);border-radius:8px;background:#100f14;overflow:hidden}
    .sc-profile-photo-frame{display:flex;align-items:center;justify-content:center;width:100%;min-height:122px;border-radius:7px;background:#0d0c11;overflow:hidden}
    .sc-profile-photo-frame img{display:block;width:100%;max-width:150px;height:122px;max-height:122px;object-fit:cover;border:0;border-radius:7px}
    .sc-profile-photo-frame a{display:flex!important;align-items:center!important;justify-content:center!important;width:100%!important;height:100%!important;text-decoration:none!important}
    .sc-profile-photo-frame .picture_block{margin:0!important;max-width:100%!important}
    .sc-profile-photo-label{display:block;width:100%;color:#d9d2dc;font-size:12px;font-weight:bold;line-height:1.2;text-align:center}
    .sc-profile-photo-empty{display:flex;align-items:center;justify-content:center;width:100%;min-height:122px;padding:12px;color:#8f8794;font-size:12px;font-weight:bold;line-height:1.35;text-align:center}
    .sc-profile-hero,
    .sc-profile-card{background:#17151c;border:1px solid rgba(255,255,255,.09);border-radius:8px;box-shadow:0 14px 36px rgba(0,0,0,.28);color:#f4f1f6}
    .sc-profile-hero{display:grid;grid-template-columns:minmax(0,1fr) minmax(170px,210px);gap:22px;align-items:start;padding:26px;margin:0 0 16px}
    .sc-profile-hero-head{display:flex;align-items:flex-start;justify-content:space-between;gap:18px;margin-bottom:10px}
    .sc-profile-hero h1{margin:0 0 10px;color:#fff;font-size:36px;font-weight:700;line-height:1.15}
    .sc-profile-status{display:inline-flex;align-items:center;gap:7px;min-height:30px;margin-top:3px;padding:6px 10px;border:1px solid rgba(255,255,255,.1);border-radius:999px;background:#24212b;color:#f5edf6;font-size:13px;font-weight:bold;line-height:1.2;white-space:nowrap}
    .sc-profile-status-dot{width:9px;height:9px;border-radius:50%;background:#d84c59;box-shadow:0 0 0 3px rgba(216,76,89,.16)}
    .sc-profile-status.is-online .sc-profile-status-dot{background:#46d66f;box-shadow:0 0 0 3px rgba(70,214,111,.16)}
    .sc-profile-meta{display:flex;flex-wrap:wrap;gap:8px;margin:0 0 14px;padding:0;list-style:none}
    .sc-profile-meta li,
    .sc-chip{display:inline-flex;align-items:center;min-height:30px;padding:6px 10px;border:1px solid rgba(255,255,255,.1);border-radius:999px;background:#24212b;color:#f5edf6;font-size:13px;line-height:1.25}
    .sc-profile-summary{max-width:900px;margin:0;color:#d9d2dc;font-size:15px;line-height:1.55}
    .sc-profile-side{display:grid;gap:16px;justify-items:end}
    .sc-profile-actions{display:grid;gap:12px;width:100%;margin:0}
    .sc-profile-inline-actions{display:flex;flex-wrap:wrap;gap:8px;margin-top:16px}
    .sc-profile-button{display:inline-flex;align-items:center;justify-content:center;width:100%;min-height:44px;padding:11px 16px;border:1px solid rgba(247,243,239,.12);border-radius:12px;background:#202127;color:#f7f3ef;font-size:15px;font-weight:bold;line-height:1.25;text-align:center;text-decoration:none;box-shadow:0 10px 22px rgba(0,0,0,.22);transition:background .18s ease,border-color .18s ease,transform .18s ease}
    .sc-profile-button:hover,
    .sc-profile-button:focus{background:#2a1723;border-color:#ec0868;color:#fff;text-decoration:none;transform:translateY(-1px)}
    .sc-profile-button.is-primary{background:linear-gradient(90deg,#ec0868,#c200fb);border-color:transparent;color:#fff}
    .sc-profile-button.is-primary:hover,
    .sc-profile-button.is-primary:focus{background:linear-gradient(90deg,#f32482,#d035ff);border-color:transparent;color:#fff}
    .sc-public-profile .sc-profile-side .sc-profile-actions a.sc-profile-button,
    .sc-public-profile .sc-profile-side .sc-profile-actions a.sc-profile-button:visited{display:inline-flex!important;width:100%!important;min-height:44px!important;border-radius:12px!important;color:#f7f3ef!important;text-decoration:none!important;text-shadow:none!important}
    .sc-public-profile .sc-profile-side .sc-profile-actions a.sc-profile-button.is-primary,
    .sc-public-profile .sc-profile-side .sc-profile-actions a.sc-profile-button.is-primary:visited{border-color:transparent!important;background:#ec0868!important;background-image:linear-gradient(90deg,#ec0868,#c200fb)!important;color:#f7f3ef!important}
    .sc-public-profile .sc-profile-side .sc-profile-actions a.sc-profile-button:not(.is-primary),
    .sc-public-profile .sc-profile-side .sc-profile-actions a.sc-profile-button:not(.is-primary):visited{border:1px solid rgba(236,8,104,.65)!important;background:#202127!important;background-image:none!important;color:#f7f3ef!important}
    .sc-public-profile .sc-profile-side .sc-profile-actions a.sc-profile-button:hover,
    .sc-public-profile .sc-profile-side .sc-profile-actions a.sc-profile-button:focus{border-color:#c200fb!important;background:#c200fb!important;background-image:none!important;color:#fff!important}
    .sc-public-profile .sc-profile-side .sc-profile-actions > a.sc-profile-action-primary{border-color:transparent!important;background-color:#ec0868!important;background-image:linear-gradient(90deg,#ec0868,#c200fb)!important;color:#f7f3ef!important}
    .sc-public-profile .sc-profile-side .sc-profile-actions > a.sc-profile-action-secondary{border-color:rgba(236,8,104,.72)!important;background-color:#202127!important;background-image:none!important;color:#f7f3ef!important}
    .sc-public-profile .sc-profile-side .sc-profile-actions > a.sc-profile-action-primary:hover,
    .sc-public-profile .sc-profile-side .sc-profile-actions > a.sc-profile-action-primary:focus,
    .sc-public-profile .sc-profile-side .sc-profile-actions > a.sc-profile-action-secondary:hover,
    .sc-public-profile .sc-profile-side .sc-profile-actions > a.sc-profile-action-secondary:focus{border-color:#c200fb!important;background-color:#c200fb!important;background-image:none!important;color:#fff!important}
    .sc-profile-inline-actions .sc-profile-button{width:auto;min-height:34px;padding:8px 12px;border-radius:8px;background:#24212b;font-size:12px;box-shadow:none}
    .sc-public-profile .sc-profile-inline-actions a.sc-profile-verify-button,
    .sc-public-profile .sc-profile-inline-actions a.sc-profile-verify-button:visited{border:1px solid rgba(255,188,10,.48)!important;background:#202127!important;background-image:none!important;color:#ffbc0a!important;text-decoration:none!important;text-shadow:none!important}
    .sc-public-profile .sc-profile-inline-actions a.sc-profile-verify-button:hover,
    .sc-public-profile .sc-profile-inline-actions a.sc-profile-verify-button:focus{border-color:#ffbc0a!important;background:#2a2416!important;color:#f7f3ef!important}
    .sc-profile-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:16px;margin-bottom:16px}
    .sc-profile-grid.is-wide{grid-template-columns:1fr}
    .sc-profile-card{padding:22px}
    .sc-profile-card h2{margin:0 0 12px;color:#fff;font-size:20px;line-height:1.25}
    .sc-profile-card p{margin:0;color:#d9d2dc;font-size:14px;line-height:1.55}
    .sc-profile-person-card{min-height:100%}
    .sc-profile-details{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:8px;margin:0 0 14px}
    .sc-profile-detail{padding:10px;border-radius:7px;background:#100f14;border:1px solid rgba(255,255,255,.08)}
    .sc-profile-detail strong{display:block;margin-bottom:3px;color:#fff;font-size:12px;line-height:1.2}
    .sc-profile-detail span{display:block;color:#d9d2dc;font-size:13px;line-height:1.3}
    .sc-chip-list{display:flex;flex-wrap:wrap;gap:8px;margin:0;padding:0;list-style:none}
    .sc-public-profile .sc-profile-friends-card{padding:28px 32px 34px!important}
    .sc-public-profile .sc-profile-friends-card h2{margin-bottom:24px!important;text-transform:uppercase!important;letter-spacing:0!important}
    .sc-public-profile .sc-profile-friend-grid{display:flex!important;flex-wrap:wrap!important;align-items:flex-start!important;justify-content:flex-start!important;gap:28px!important;margin:0!important;padding:0!important}
    .sc-public-profile a.sc-profile-friend-card,
    .sc-public-profile a.sc-profile-friend-card:visited{display:flex!important;float:none!important;flex-direction:column!important;align-items:center!important;justify-content:flex-start!important;gap:0!important;width:170px!important;min-width:170px!important;max-width:170px!important;margin:0!important;padding:0!important;border:0!important;border-radius:0!important;background:transparent!important;background-image:none!important;color:#ffbc0a!important;text-align:center!important;text-decoration:none!important;text-shadow:none!important;box-shadow:none!important;vertical-align:top!important;transition:color .18s ease,transform .18s ease}
    .sc-public-profile a.sc-profile-friend-card:hover,
    .sc-public-profile a.sc-profile-friend-card:focus{color:#f7f3ef!important;text-decoration:none!important;transform:translateY(-1px)}
    .sc-public-profile .sc-profile-friend-avatar{position:relative!important;display:block!important;flex:0 0 auto!important;width:150px!important;height:150px!important;margin:0 auto!important;overflow:hidden!important;border:0!important;border-radius:0!important;background:#101114!important}
    .sc-public-profile .sc-profile-friend-avatar img{display:block!important;width:150px!important;height:150px!important;max-width:none!important;max-height:none!important;object-fit:cover!important;border:0!important;border-radius:0!important;box-shadow:none!important}
    .sc-public-profile .sc-profile-friend-status{position:absolute!important;right:6px!important;bottom:6px!important;width:11px!important;height:11px!important;border:2px solid #202127!important;border-radius:50%!important;background:#d84c59!important}
    .sc-public-profile .sc-profile-friend-status.is-online{background:#46d66f!important}
    .sc-public-profile .sc-profile-friend-info{display:block!important;float:none!important;width:100%!important;min-width:0!important;margin:10px 0 0!important;padding:0!important;text-align:center!important}
    .sc-public-profile .sc-profile-friend-name{display:block!important;float:none!important;overflow:hidden!important;width:100%!important;margin:0!important;padding:0!important;color:#ffbc0a!important;font-size:18px!important;font-weight:400!important;line-height:1.25!important;text-align:center!important;text-overflow:clip!important;white-space:normal!important}
    .sc-public-profile a.sc-profile-card-action,
    .sc-public-profile a.sc-profile-card-action:visited{display:inline-flex!important;align-items:center!important;justify-content:center!important;margin-top:14px!important;min-height:34px!important;padding:8px 12px!important;border:1px solid rgba(236,8,104,.62)!important;border-radius:8px!important;background:#202127!important;background-image:none!important;color:#f7f3ef!important;font-size:12px!important;font-weight:bold!important;line-height:1.2!important;text-decoration:none!important;text-shadow:none!important;box-shadow:none!important}
    .sc-public-profile a.sc-profile-card-action:hover,
    .sc-public-profile a.sc-profile-card-action:focus{border-color:#c200fb!important;background:#c200fb!important;color:#fff!important;text-decoration:none!important}
    .sc-public-profile .sc-profile-friends-card a.sc-profile-card-action,
    .sc-public-profile .sc-profile-friends-card a.sc-profile-card-action:visited{display:flex!important;width:fit-content!important;margin:90px auto 0!important;justify-content:center!important;border:0!important;background:transparent!important;color:#ffbc0a!important;font-size:15px!important;font-weight:400!important}
    .sc-public-profile .sc-profile-friends-card a.sc-profile-card-action:hover,
    .sc-public-profile .sc-profile-friends-card a.sc-profile-card-action:focus{background:transparent!important;color:#ec7d10!important}
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid{display:flex!important;flex-wrap:wrap!important;align-items:flex-start!important;justify-content:flex-start!important;gap:28px!important;margin:0!important;padding:0!important}
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid > a.sc-profile-friend-card,
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid > a.sc-profile-friend-card:visited{display:flex!important;float:none!important;clear:none!important;flex-direction:column!important;align-items:center!important;justify-content:flex-start!important;width:170px!important;min-width:170px!important;max-width:170px!important;margin:0!important;padding:0!important;border:0!important;background:transparent!important;background-image:none!important;box-shadow:none!important;color:#ffbc0a!important;text-align:center!important;text-decoration:none!important;text-shadow:none!important}
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-avatar{display:block!important;float:none!important;width:150px!important;height:150px!important;margin:0 auto!important;overflow:hidden!important;border:0!important;border-radius:0!important;background:#101114!important}
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-avatar img{display:block!important;width:150px!important;height:150px!important;max-width:none!important;max-height:none!important;object-fit:cover!important;border:0!important;border-radius:0!important;box-shadow:none!important}
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-info{display:block!important;float:none!important;width:100%!important;min-width:0!important;margin:10px 0 0!important;padding:0!important;text-align:center!important}
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-name{display:block!important;float:none!important;width:100%!important;margin:0!important;padding:0!important;color:#ffbc0a!important;font-size:18px!important;font-weight:400!important;line-height:1.25!important;text-align:center!important;white-space:normal!important}
    .sc-public-profile .sc-profile-card.sc-profile-friends-card a.sc-profile-card-action,
    .sc-public-profile .sc-profile-card.sc-profile-friends-card a.sc-profile-card-action:visited{display:flex!important;width:fit-content!important;margin:90px auto 0!important;justify-content:center!important;border:0!important;background:transparent!important;color:#ffbc0a!important}
    .sc-empty{color:#8f8794!important;font-style:italic}
    #cboxOverlay.sc-profile-colorbox-overlay{background:#050407!important;opacity:.9!important}
    #colorbox.sc-profile-colorbox,
    #colorbox.sc-profile-colorbox #cboxWrapper,
    #colorbox.sc-profile-colorbox #cboxContent,
    #colorbox.sc-profile-colorbox #cboxLoadedContent{overflow:visible!important}
    #colorbox.sc-profile-colorbox{background:transparent!important}
    #colorbox.sc-profile-colorbox #cboxWrapper{background:transparent!important}
    #colorbox.sc-profile-colorbox #cboxTopLeft,
    #colorbox.sc-profile-colorbox #cboxTopCenter,
    #colorbox.sc-profile-colorbox #cboxTopRight,
    #colorbox.sc-profile-colorbox #cboxMiddleLeft,
    #colorbox.sc-profile-colorbox #cboxMiddleRight,
    #colorbox.sc-profile-colorbox #cboxBottomLeft,
    #colorbox.sc-profile-colorbox #cboxBottomCenter,
    #colorbox.sc-profile-colorbox #cboxBottomRight{background:transparent!important}
    #colorbox.sc-profile-colorbox #cboxContent{background:#111!important;border:0!important;box-shadow:0 22px 70px rgba(0,0,0,.66)!important;box-sizing:border-box!important}
    #colorbox.sc-profile-colorbox #cboxLoadedContent{margin:0!important;padding:0!important;background:#111!important;border:0!important}
    #colorbox.sc-profile-colorbox #cboxLoadedContent img,
    #colorbox.sc-profile-colorbox .cboxPhoto{display:block!important;margin:0 auto!important;border:0!important;border-radius:6px!important;background:#111!important;box-shadow:0 0 0 5px #8f4dff!important}
    #colorbox.sc-profile-colorbox #cboxTitle,
    #colorbox.sc-profile-colorbox #cboxCurrent{display:none!important;height:0!important;margin:0!important;padding:0!important;overflow:hidden!important;font-size:0!important;line-height:0!important;color:transparent!important}
    @media (max-width:991px){
        .sc-profile-photo-strip{grid-template-columns:repeat(3,minmax(0,1fr))}
        .sc-profile-grid{grid-template-columns:1fr}
    }
    @media (max-width:767px){
        main#content{padding:110px 10px 0!important}
        .sc-profile-photo-strip{grid-template-columns:repeat(2,minmax(0,1fr))}
        .sc-profile-hero{grid-template-columns:1fr;padding:18px}
        .sc-profile-hero-head{display:block}
        .sc-profile-side{justify-items:stretch}
        .sc-profile-status{margin-bottom:12px}
        .sc-profile-hero h1{font-size:28px}
        .sc-profile-details{grid-template-columns:1fr}
        .sc-public-profile .sc-profile-friends-card{padding:22px 18px 28px!important}
        .sc-public-profile .sc-profile-friend-grid{display:grid!important;grid-template-columns:repeat(2,minmax(0,1fr))!important;gap:20px 12px!important}
        .sc-public-profile a.sc-profile-friend-card,
        .sc-public-profile a.sc-profile-friend-card:visited{width:100%!important;min-width:0!important;max-width:none!important}
        .sc-public-profile .sc-profile-friend-avatar,
        .sc-public-profile .sc-profile-friend-avatar img{width:130px!important;height:130px!important}
        .sc-public-profile .sc-profile-friends-card a.sc-profile-card-action,
        .sc-public-profile .sc-profile-friends-card a.sc-profile-card-action:visited{margin-top:44px!important}
        .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid{display:grid!important;grid-template-columns:repeat(2,minmax(0,1fr))!important;gap:20px 12px!important}
        .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid > a.sc-profile-friend-card,
        .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid > a.sc-profile-friend-card:visited{width:100%!important;min-width:0!important;max-width:none!important}
        .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-avatar,
        .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-avatar img{width:130px!important;height:130px!important}
        .sc-public-profile .sc-profile-card.sc-profile-friends-card a.sc-profile-card-action,
        .sc-public-profile .sc-profile-card.sc-profile-friends-card a.sc-profile-card-action:visited{margin-top:44px!important}
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

        {{ $photo1 = isset($public_profile_photos[1]) ? $public_profile_photos[1] : null }}
        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                {if !empty($photo1)}
                    {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 400) }}
                    {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 1000) }}
                    <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 1'}">
                        <img src="{% $photo_url %}" alt="{lang 'Public profile photo 1'}" />
                    </a>
                {else}
                    <img class="sc-profile-photo-placeholder" src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Photo 2 placeholder'}" />
                {/if}
            </div>
            <span class="sc-profile-photo-label">{lang 'Photo 2'}</span>
        </div>

        {{ $photo2 = isset($public_profile_photos[2]) ? $public_profile_photos[2] : null }}
        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                {if !empty($photo2)}
                    {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 400) }}
                    {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 1000) }}
                    <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 2'}">
                        <img src="{% $photo_url %}" alt="{lang 'Public profile photo 2'}" />
                    </a>
                {else}
                    <img class="sc-profile-photo-placeholder" src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Photo 3 placeholder'}" />
                {/if}
            </div>
            <span class="sc-profile-photo-label">{lang 'Photo 3'}</span>
        </div>

        {{ $photo3 = isset($public_profile_photos[3]) ? $public_profile_photos[3] : null }}
        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                {if !empty($photo3)}
                    {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 400) }}
                    {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 1000) }}
                    <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 3'}">
                        <img src="{% $photo_url %}" alt="{lang 'Public profile photo 3'}" />
                    </a>
                {else}
                    <img class="sc-profile-photo-placeholder" src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Photo 4 placeholder'}" />
                {/if}
            </div>
            <span class="sc-profile-photo-label">{lang 'Photo 4'}</span>
        </div>

        {{ $photo4 = isset($public_profile_photos[4]) ? $public_profile_photos[4] : null }}
        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                {if !empty($photo4)}
                    {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 400) }}
                    {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 1000) }}
                    <a href="{% $photo_full_url %}" data-popup="image" title="{lang 'Public profile photo 4'}">
                        <img src="{% $photo_url %}" alt="{lang 'Public profile photo 4'}" />
                    </a>
                {else}
                    <img class="sc-profile-photo-placeholder" src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Photo 5 placeholder'}" />
                {/if}
            </div>
            <span class="sc-profile-photo-label">{lang 'Photo 5'}</span>
        </div>
    </div>

    <section class="sc-profile-hero">
        <div class="sc-profile-main">
            <div class="sc-profile-hero-head">
                <div>
                    <h1 itemprop="name">{profile_title}</h1>
                </div>
            </div>

            <ul class="sc-profile-meta">
                {if !empty($profile_location)}
                    <li>{profile_location}</li>
                {/if}
                {if !empty($profile_age_text)}
                    <li>{lang 'Ages'} {profile_age_text}</li>
                {/if}
                {if !empty($username)}
                    <li>@{username}</li>
                {/if}
            </ul>

            {if !empty($about_us)}
                <p class="sc-profile-summary" itemprop="description">{% nl2br(escape($about_us)) %}</p>
            {else}
                <p class="sc-profile-summary sc-empty">{lang 'Not added yet.'}</p>
            {/if}

            {if !$is_own_profile}
                <div class="sc-profile-inline-actions">
                    <a class="sc-profile-button sc-profile-verify-button" href="#">{lang 'Verify Couple Later'}</a>
                </div>
            {/if}
        </div>

        <div class="sc-profile-side">
            <div class="sc-profile-status {if $is_profile_online}is-online{/if}" aria-label="{profile_status_label}">
                <span class="sc-profile-status-dot"></span>
                <span>{profile_status_label}</span>
            </div>
            {if $is_own_profile}
                <div class="sc-profile-actions sc-profile-owner-actions">
                    <a class="sc-profile-button sc-profile-action-primary is-primary" rel="nofollow" href="{{ $design->url('user','setting','edit') }}">{lang 'Edit Profile'}</a>
                    <a class="sc-profile-button sc-profile-action-secondary" rel="nofollow" href="{{ $design->url('user','setting','avatar') }}">{lang 'Profile Photo'}</a>
                </div>
            {else}
                <div class="sc-profile-actions">
                {if $is_friend_enabled AND !empty($friend_link)}
                    <a class="sc-profile-button sc-profile-action-primary is-primary" rel="nofollow" href="{friend_link}">
                        {if $is_approved_friend}
                            {lang 'Remove Friend'}
                        {elseif $is_pending_friend}
                            {lang 'Manage Friend'}
                        {else}
                            {lang 'Friend Request'}
                        {/if}
                    </a>
                {/if}

                {if $is_mail_enabled AND !empty($mail_link)}
                    <a class="sc-profile-button sc-profile-action-secondary" rel="nofollow" href="{mail_link}">{lang 'Message'}</a>
                {/if}
                </div>
            {/if}
        </div>
    </section>

    <div class="sc-profile-grid">
        <section class="sc-profile-card sc-profile-person-card">
            <h2>{lang 'About Her'}</h2>
            <div class="sc-profile-details">
                {if !empty($her_name)}<div class="sc-profile-detail"><strong>{lang 'Name'}</strong><span>{her_name}</span></div>{/if}
                {if !empty($her_age)}<div class="sc-profile-detail"><strong>{lang 'Age'}</strong><span>{her_age}</span></div>{/if}
                {if !empty($her_ethnicity)}<div class="sc-profile-detail"><strong>{lang 'Ethnicity'}</strong><span>{her_ethnicity}</span></div>{/if}
                {if !empty($her_languages)}<div class="sc-profile-detail"><strong>{lang 'Languages'}</strong><span>{her_languages}</span></div>{/if}
                {if !empty($her_sexuality)}<div class="sc-profile-detail"><strong>{lang 'Sexuality'}</strong><span>{her_sexuality}</span></div>{/if}
                {if !empty($her_experience_level)}<div class="sc-profile-detail"><strong>{lang 'Experience'}</strong><span>{her_experience_level}</span></div>{/if}
            </div>
            {if !empty($about_her)}
                <div class="sc-profile-detail">
                    <strong>{lang 'About'}</strong>
                    <span>{% nl2br(escape($about_her)) %}</span>
                </div>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card sc-profile-person-card">
            <h2>{lang 'About Him'}</h2>
            <div class="sc-profile-details">
                {if !empty($him_name)}<div class="sc-profile-detail"><strong>{lang 'Name'}</strong><span>{him_name}</span></div>{/if}
                {if !empty($him_age)}<div class="sc-profile-detail"><strong>{lang 'Age'}</strong><span>{him_age}</span></div>{/if}
                {if !empty($him_ethnicity)}<div class="sc-profile-detail"><strong>{lang 'Ethnicity'}</strong><span>{him_ethnicity}</span></div>{/if}
                {if !empty($him_languages)}<div class="sc-profile-detail"><strong>{lang 'Languages'}</strong><span>{him_languages}</span></div>{/if}
                {if !empty($him_sexuality)}<div class="sc-profile-detail"><strong>{lang 'Sexuality'}</strong><span>{him_sexuality}</span></div>{/if}
                {if !empty($him_experience_level)}<div class="sc-profile-detail"><strong>{lang 'Experience'}</strong><span>{him_experience_level}</span></div>{/if}
            </div>
            {if !empty($about_him)}
                <div class="sc-profile-detail">
                    <strong>{lang 'About'}</strong>
                    <span>{% nl2br(escape($about_him)) %}</span>
                </div>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid is-wide">
        <section class="sc-profile-card">
            <h2>{lang 'About Us'}</h2>
            {if !empty($about_us)}
                <p>{% nl2br(escape($about_us)) %}</p>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid">
        <section class="sc-profile-card">
            <h2>{lang 'Looking For'}</h2>
            {if !empty($looking_for)}
                <ul class="sc-chip-list">
                    {each $key => $item in $looking_for}
                        <li class="sc-chip">{item}</li>
                    {/each}
                </ul>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Hosting & Travel'}</h2>
            {if !empty($hosting_travel)}
                <ul class="sc-chip-list">
                    {each $key => $item in $hosting_travel}
                        <li class="sc-chip">{item}</li>
                    {/each}
                </ul>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Availability'}</h2>
            {if !empty($availability)}
                <ul class="sc-chip-list">
                    {each $key => $item in $availability}
                        <li class="sc-chip">{item}</li>
                    {/each}
                </ul>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Sexual Interests'}</h2>
            {if !empty($sexual_interests)}
                <ul class="sc-chip-list">
                    {each $key => $item in $sexual_interests}
                        <li class="sc-chip">{item}</li>
                    {/each}
                </ul>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid">
        <section class="sc-profile-card">
            <h2>{lang 'Fantasies'}</h2>
            {if !empty($fantasies)}
                <p>{% nl2br(escape($fantasies)) %}</p>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Boundaries'}</h2>
            {if !empty($boundaries)}
                <p>{% nl2br(escape($boundaries)) %}</p>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid is-wide">
        <section class="sc-profile-card">
            <h2>{lang 'Ideal Match'}</h2>
            {if !empty($ideal_match)}
                <p>{% nl2br(escape($ideal_match)) %}</p>
            {else}
                <p class="sc-empty">{lang 'Not added yet.'}</p>
            {/if}
        </section>
    </div>

    <div class="sc-profile-grid">
        <section class="sc-profile-card sc-profile-friends-card">
            <h2>{lang 'Friends'}</h2>
            {if !empty($profile_friends)}
                <div class="sc-profile-friend-grid">
                    {each $friend in $profile_friends}
                        <a class="sc-profile-friend-card" href="{% $friend->profileUrl %}" title="{% escape($friend->displayName) %}">
                            <span class="sc-profile-friend-avatar">
                                <img src="{% $friend->avatarUrl %}" alt="{% escape($friend->displayName) %}" loading="lazy" onerror="this.onerror=null;this.src='{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png';" />
                                <span class="sc-profile-friend-status {if $friend->isOnline}is-online{/if}" aria-hidden="true"></span>
                            </span>
                            <span class="sc-profile-friend-info">
                                <span class="sc-profile-friend-name">{% escape($friend->displayName) %}</span>
                            </span>
                        </a>
                    {/each}
                </div>
                {if !empty($profile_friends_url)}
                    <a class="sc-profile-card-action" href="{% $profile_friends_url %}">{lang 'View all friends'}</a>
                {/if}
            {else}
                <p class="sc-empty">{lang 'Friend cards will appear here when this couple connects with other couples.'}</p>
            {/if}
        </section>

        <section class="sc-profile-card">
            <h2>{lang 'Verified Friends'}</h2>
            <p>{lang 'Verified couple cards will appear here after trusted couples confirm they know this couple.'}</p>
        </section>
    </div>
</div>

{literal}
<script>
    $(document).ready(function() {
        if (typeof window.friend !== 'function') {
            window.friend = function(type, friendId, securityToken) {
                $.post(pH7Url.base + 'friend/asset/ajax/Friend', {
                    type: type,
                    friendId: friendId,
                    security_token: securityToken
                }, function(response) {
                    var data = response;

                    if (typeof data === 'string') {
                        try {
                            data = $.parseJSON(data);
                        } catch (e) {
                            data = {
                                status: 0,
                                txt: response
                            };
                        }
                    }

                    $('.msg').html(data.txt || '');

                    if (parseInt(data.status, 10) === 1) {
                        window.setTimeout(function() {
                            window.location.reload();
                        }, 650);
                    }
                }).fail(function() {
                    $('.msg').html('{/literal}{lang 'Unable to update friend request. Please try again.'}{literal}');
                });
            };
        }

        if (!document.getElementById('sc-profile-colorbox-style')) {
            $('<style id="sc-profile-colorbox-style">' +
                '#cboxOverlay.sc-profile-colorbox-overlay{background:#050407!important;opacity:.9!important}' +
                '#colorbox.sc-profile-colorbox,#colorbox.sc-profile-colorbox #cboxWrapper,#colorbox.sc-profile-colorbox #cboxContent,#colorbox.sc-profile-colorbox #cboxLoadedContent{overflow:visible!important}' +
                '#colorbox.sc-profile-colorbox{background:transparent!important}' +
                '#colorbox.sc-profile-colorbox #cboxWrapper{background:transparent!important}' +
                '#colorbox.sc-profile-colorbox #cboxTopLeft,#colorbox.sc-profile-colorbox #cboxTopCenter,#colorbox.sc-profile-colorbox #cboxTopRight,#colorbox.sc-profile-colorbox #cboxMiddleLeft,#colorbox.sc-profile-colorbox #cboxMiddleRight,#colorbox.sc-profile-colorbox #cboxBottomLeft,#colorbox.sc-profile-colorbox #cboxBottomCenter,#colorbox.sc-profile-colorbox #cboxBottomRight{background:transparent!important}' +
                '#colorbox.sc-profile-colorbox #cboxContent{background:#111!important;border:0!important;box-shadow:0 22px 70px rgba(0,0,0,.66)!important;box-sizing:border-box!important}' +
                '#colorbox.sc-profile-colorbox #cboxLoadedContent{margin:0!important;padding:0!important;background:#111!important;border:0!important}' +
                '#colorbox.sc-profile-colorbox #cboxLoadedContent img,#colorbox.sc-profile-colorbox .cboxPhoto{display:block!important;margin:0 auto!important;border:0!important;border-radius:6px!important;background:#111!important;box-shadow:0 0 0 5px #8f4dff!important}' +
                '#colorbox.sc-profile-colorbox #cboxTitle,#colorbox.sc-profile-colorbox #cboxCurrent{display:none!important;height:0!important;margin:0!important;padding:0!important;overflow:hidden!important;font-size:0!important;line-height:0!important;color:transparent!important}' +
            '</style>').appendTo('head');
        }

        var $links = $('.sc-profile-photo-strip a[data-popup="image"]');

        if ($.fn.colorbox) {
            $links.each(function() {
                var $link = $(this);
                var oldTitle = $link.attr('title');

                if (oldTitle) {
                    $link.data('old-title', oldTitle);
                }

                $link.attr('title', '');
            });

            $links.off('click');
            $links.removeData('colorbox');

            $links.colorbox({
                maxWidth: '85%',
                maxHeight: '85%',
                scrolling: false,
                transition: 'fade',
                photo: true,
                title: '',
                onOpen: function() {
                    $('#colorbox').addClass('sc-profile-colorbox');
                    $('#cboxOverlay').addClass('sc-profile-colorbox-overlay');
                },
                onComplete: function() {
                    $('#cboxTitle, #cboxCurrent').hide().text('');
                    $('#cboxContent').attr('style', function(i, s) {
                        return (s || '') + ';background:#111!important;border:0!important;overflow:visible!important;box-shadow:0 22px 70px rgba(0,0,0,.66)!important;';
                    });
                    $('#cboxLoadedContent').attr('style', function(i, s) {
                        return (s || '') + ';margin:0!important;padding:0!important;background:#111!important;border:0!important;overflow:visible!important;';
                    });
                    $('#cboxLoadedContent img, .cboxPhoto').attr('style', function(i, s) {
                        return (s || '') + ';display:block!important;margin:0 auto!important;border:0!important;border-radius:6px!important;box-shadow:0 0 0 5px #8f4dff!important;';
                    });
                },
                onClosed: function() {
                    $('#colorbox').removeClass('sc-profile-colorbox');
                    $('#cboxOverlay').removeClass('sc-profile-colorbox-overlay');
                }
            });
        }
    });
</script>
{/literal}
