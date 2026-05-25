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
    main#content{max-width:1180px!important;margin:0 auto!important;padding:0 15px!important;padding-top:32px!important;background:transparent!important;border:0!important;box-shadow:none!important}
    .sc-public-profile{margin-top:0!important;padding-top:0!important;color:#f4f1f6}
    .sc-public-profile *{box-sizing:border-box}
    .sc-profile-photo-strip{display:grid;grid-template-columns:repeat(5,minmax(150px,1fr));gap:12px;margin:0 0 18px}
    .sc-profile-photo-slot{display:flex;flex-direction:column;gap:8px;align-items:center;justify-content:space-between;min-height:206px;padding:10px;border:1px solid rgba(255,255,255,.12);border-radius:8px;background:#100f14;overflow:hidden}
    .sc-profile-photo-frame{display:flex;align-items:center;justify-content:center;width:150px;height:150px;min-height:150px;border-radius:0;background:#0d0c11;overflow:hidden}
    .sc-profile-photo-frame img{display:block;width:150px;max-width:none;height:150px;max-height:150px;object-fit:cover;border:0;border-radius:0}
    .sc-profile-photo-frame a{display:flex!important;align-items:center!important;justify-content:center!important;width:150px!important;height:150px!important;text-decoration:none!important}
    .sc-profile-photo-frame .picture_block{margin:0!important;max-width:100%!important}
    .sc-profile-photo-label{display:block;width:100%;color:#d9d2dc;font-size:12px;font-weight:bold;line-height:1.2;text-align:center}
    .sc-profile-photo-empty{display:flex;align-items:center;justify-content:center;width:150px;min-height:150px;padding:12px;color:#8f8794;font-size:12px;font-weight:bold;line-height:1.35;text-align:center}
    .sc-public-profile .sc-profile-photo-frame,
    .sc-public-profile .sc-profile-photo-frame a,
    .sc-public-profile .sc-profile-photo-frame .picture_block,
    .sc-public-profile .sc-profile-photo-frame img{width:150px!important;height:150px!important;max-width:none!important;max-height:150px!important;object-fit:cover!important;border-radius:0!important}
    /* SC_PUBLIC_PROFILE_PHOTO_150_SQUARE_V1_ACTIVE */
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
    .sc-verify-couple-wrap{position:relative;display:inline-block}
    .sc-verify-couple-tooltip{display:none;position:absolute;left:0;bottom:calc(100% + 10px);z-index:20;width:260px;padding:10px 12px;border:1px solid rgba(255,255,255,.14);border-radius:8px;background:#202127;color:#f7f3ef;font-size:13px;line-height:1.35;box-shadow:0 10px 28px rgba(0,0,0,.35)}
    .sc-verify-couple-wrap:hover .sc-verify-couple-tooltip,
    .sc-verify-couple-wrap:focus-within .sc-verify-couple-tooltip{display:block}
    .sc-verify-modal-overlay{position:fixed;inset:0;z-index:10000;display:flex;align-items:center;justify-content:center;padding:120px 18px 24px;background:rgba(5,4,7,.72);opacity:0;visibility:hidden;pointer-events:none;transition:opacity .18s ease,visibility .18s ease}
    .sc-verify-modal-overlay.is-open{opacity:1;visibility:visible;pointer-events:auto}
    .sc-verify-modal{width:min(100%,560px)}
    .sc-verify-modal-card{position:relative;padding:26px;border:1px solid rgba(255,255,255,.13);border-radius:12px;background:#17181d;color:#f7f3ef;box-shadow:0 28px 80px rgba(0,0,0,.58)}
    .sc-verify-modal-close{position:absolute;top:12px;right:12px;display:inline-flex;align-items:center;justify-content:center;width:34px;height:34px;border:1px solid rgba(255,255,255,.12);border-radius:8px;background:#202127;color:#f7f3ef;font-size:20px;line-height:1;cursor:pointer}
    .sc-verify-modal-close:hover,.sc-verify-modal-close:focus{border-color:#ffbc0a;color:#ffbc0a}
    .sc-verify-modal-card h2{margin:0 44px 10px 0;color:#fff;font-size:24px;line-height:1.2}
    .sc-verify-modal-card p{margin:0 0 16px;color:#b8b3b0;font-size:14px;line-height:1.5}
    .sc-verify-modal-textarea{display:block;width:100%;min-height:170px;margin:0;padding:12px;border:1px solid rgba(255,255,255,.16);border-radius:10px;background:#101114;color:#f7f3ef;font-size:14px;line-height:1.45;resize:vertical}
    .sc-verify-modal-textarea:focus{outline:0;border-color:#ec0868;box-shadow:0 0 0 3px rgba(236,8,104,.18)}
    .sc-verify-modal-actions{display:flex;justify-content:flex-end;gap:10px;margin-top:16px}
    .sc-verify-modal-submit,.sc-verify-modal-cancel{display:inline-flex;align-items:center;justify-content:center;min-height:42px;padding:10px 16px;border-radius:10px;font-size:14px;font-weight:bold;line-height:1.2;cursor:pointer}
    .sc-verify-modal-submit{border:0;background:linear-gradient(90deg,#ec0868,#c200fb);color:#fff}
    .sc-verify-modal-submit:hover,.sc-verify-modal-submit:focus{background:linear-gradient(90deg,#f32482,#d035ff)}
    .sc-verify-modal-cancel{border:1px solid rgba(247,243,239,.18);background:#202127;color:#f7f3ef}
    .sc-verify-modal-cancel:hover,.sc-verify-modal-cancel:focus{border-color:#ffbc0a;color:#ffbc0a}
    .sc-verify-modal-message{display:none;margin-top:12px!important;color:#ffbc0a!important;font-size:13px!important;line-height:1.4!important}
    .sc-verify-modal-message.is-visible{display:block}
    body.sc-verify-modal-open{overflow:hidden}
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
    .sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-grid{display:flex!important;flex-wrap:wrap!important;align-items:flex-start!important;justify-content:flex-start!important;gap:28px!important;margin:0!important;padding:0!important}
    .sc-public-profile .sc-profile-verified-card{display:flex!important;flex-direction:column!important;align-items:center!important;justify-content:flex-start!important;width:170px!important;min-width:170px!important;max-width:170px!important;margin:0!important;padding:0!important;text-align:center!important}
    .sc-public-profile .sc-profile-verified-avatar{position:relative!important;display:block!important;width:150px!important;height:150px!important;margin:0 auto!important;background:#101114!important}
    .sc-public-profile .sc-profile-verified-avatar img{display:block!important;width:150px!important;height:150px!important;max-width:none!important;max-height:none!important;object-fit:cover!important;border:0!important;border-radius:0!important;box-shadow:none!important}
    .sc-public-profile .sc-profile-verified-note{display:none;position:absolute;left:0;bottom:calc(100% + 10px);z-index:12;width:260px;padding:10px 12px;border:1px solid rgba(255,255,255,.14);border-radius:8px;background:#202127;color:#f7f3ef;font-size:13px;line-height:1.35;text-align:left;box-shadow:0 10px 28px rgba(0,0,0,.35)}
    .sc-public-profile .sc-profile-verified-avatar:hover .sc-profile-verified-note,
    .sc-public-profile .sc-profile-verified-avatar:focus-within .sc-profile-verified-note{display:block}
    .sc-public-profile .sc-profile-verified-reviewer{display:block;margin:0 0 7px;color:#ffbc0a;font-weight:bold;line-height:1.3}
    .sc-public-profile .sc-profile-verified-review-text{display:block;color:#f7f3ef;white-space:pre-line}
    .sc-public-profile a.sc-profile-verified-name,
    .sc-public-profile a.sc-profile-verified-name:visited{display:block!important;width:100%!important;margin:10px 0 0!important;padding:0!important;color:#ffbc0a!important;font-size:18px!important;font-weight:400!important;line-height:1.25!important;text-align:center!important;text-decoration:none!important;text-shadow:none!important;white-space:normal!important}
    .sc-public-profile a.sc-profile-verified-name:hover,
    .sc-public-profile a.sc-profile-verified-name:focus{color:#f7f3ef!important;text-decoration:none!important}
    .sc-public-profile .sc-profile-private-media-showcase{display:grid!important;grid-template-columns:300px minmax(0,1fr)!important;gap:24px!important;align-items:stretch!important;width:100%!important;margin:0 0 16px!important;padding:22px!important;border:1px solid rgba(255,255,255,.09)!important;border-radius:8px!important;background:#17151c!important;box-shadow:0 14px 36px rgba(0,0,0,.28)!important;color:#f4f1f6!important;box-sizing:border-box!important}
    .sc-public-profile .sc-profile-private-media-left{display:flex!important;flex-direction:column!important;gap:18px!important;width:300px!important;max-width:300px!important;min-width:300px!important}
    .sc-public-profile .sc-profile-private-media-side-card{display:block!important;width:100%!important;max-width:300px!important;margin:0!important;padding:14px!important;box-sizing:border-box!important;border:1px solid rgba(255,255,255,.1)!important;border-radius:8px!important;background:#100f14!important;text-align:left!important}
    .sc-public-profile .sc-profile-private-media-side-card h2{display:block!important;width:100%!important;margin:8px 0 0!important;color:#f4f1f6!important;font-size:15px!important;font-weight:bold!important;line-height:1.25!important;text-align:left!important;text-transform:none!important;letter-spacing:0!important}
    .sc-public-profile .sc-profile-private-media-grid{display:block!important;width:100%!important;margin:0!important;padding:0!important}
    .sc-public-profile .sc-profile-private-media-item{display:block!important;width:100%!important;margin:0!important;padding:0!important;text-align:left!important}
    .sc-public-profile .sc-profile-private-media-thumb,
    .sc-public-profile .sc-profile-private-media-thumb:visited{position:relative!important;display:block!important;width:100%!important;height:auto!important;margin:0!important;overflow:hidden!important;border:0!important;border-radius:6px!important;background:#101114!important;text-decoration:none!important;box-shadow:none!important}
    .sc-public-profile .sc-profile-private-media-side-card img{width:100%!important;height:auto!important;max-height:210px!important;object-fit:cover!important;display:block!important;max-width:none!important;border:0!important;border-radius:6px!important;box-shadow:none!important}
    .sc-public-profile .sc-profile-private-media-thumb.is-locked img{filter:saturate(.65) brightness(.72)!important}
    .sc-public-profile .sc-profile-private-media-video .sc-profile-private-media-thumb:not(.is-locked):after{content:"";position:absolute;left:50%;top:50%;width:0;height:0;margin:-14px 0 0 -9px;border-top:14px solid transparent;border-bottom:14px solid transparent;border-left:21px solid rgba(255,255,255,.9);filter:drop-shadow(0 2px 7px rgba(0,0,0,.45))}
    .sc-public-profile .sc-profile-private-media-feature{display:block!important;width:100%!important;min-width:0!important;padding:8px!important;box-sizing:border-box!important;border:1px solid rgba(255,255,255,.1)!important;border-radius:8px!important;background:#100f14!important}
    .sc-public-profile .sc-profile-private-media-feature-img{width:100%!important;height:100%!important;min-height:500px!important;max-height:650px!important;object-fit:cover!important;display:block!important;border:0!important;border-radius:6px!important;box-shadow:none!important}
    #sc-public-profile-private-redo {
        display: grid !important;
        grid-template-columns: 280px minmax(0, 1fr) !important;
        gap: 24px !important;
        align-items: stretch !important;
        width: 100% !important;
        max-width: 100% !important;
        margin: 0 0 18px !important;
        padding: 20px !important;
        box-sizing: border-box !important;
        border: 1px solid rgba(255,255,255,.09) !important;
        border-radius: 8px !important;
        background: #17151c !important;
        box-shadow: 0 14px 36px rgba(0,0,0,.28) !important;
    }

    #sc-public-profile-private-redo .sc-private-redo-left {
        display: flex !important;
        flex-direction: column !important;
        gap: 16px !important;
        width: 280px !important;
        min-width: 280px !important;
        max-width: 280px !important;
    }

    #sc-public-profile-private-redo .sc-private-redo-card {
        display: block !important;
        width: 100% !important;
        max-width: 280px !important;
        margin: 0 !important;
        padding: 12px !important;
        box-sizing: border-box !important;
        border: 1px solid rgba(255,255,255,.1) !important;
        border-radius: 8px !important;
        background: #100f14 !important;
    }

    #sc-public-profile-private-redo .sc-private-redo-thumb {
        display: block !important;
        width: 100% !important;
        height: 155px !important;
        overflow: hidden !important;
        border-radius: 6px !important;
        background: #050407 !important;
        text-decoration: none !important;
    }

    #sc-public-profile-private-redo .sc-private-redo-thumb img {
        display: block !important;
        width: 100% !important;
        height: 155px !important;
        max-width: 100% !important;
        max-height: 155px !important;
        object-fit: cover !important;
        border: 0 !important;
        border-radius: 6px !important;
    }

    #sc-public-profile-private-redo .sc-private-redo-card h2 {
        margin: 8px 0 0 !important;
        padding: 0 !important;
        color: #f4f1f6 !important;
        font-size: 15px !important;
        font-weight: 700 !important;
        line-height: 1.2 !important;
        text-align: left !important;
    }

    #sc-public-profile-private-redo .sc-private-redo-feature {
        display: block !important;
        width: 100% !important;
        min-width: 0 !important;
        padding: 8px !important;
        box-sizing: border-box !important;
        border: 1px solid rgba(255,255,255,.1) !important;
        border-radius: 8px !important;
        background: #100f14 !important;
    }

    #sc-public-profile-private-redo .sc-private-redo-feature-img {
        display: block !important;
        width: 100% !important;
        height: 100% !important;
        min-height: 360px !important;
        max-height: 520px !important;
        object-fit: cover !important;
        border: 0 !important;
        border-radius: 6px !important;
    }
    .sc-empty{color:#8f8794!important;font-style:italic}
    #cboxOverlay.sc-profile-colorbox-overlay{background:#050407!important;opacity:.9!important}
    #colorbox.sc-profile-colorbox,
    #colorbox.sc-profile-colorbox #cboxWrapper,
    #colorbox.sc-profile-colorbox #cboxContent,
    #colorbox.sc-profile-colorbox #cboxLoadedContent{overflow:visible!important}
    #colorbox.sc-profile-colorbox{background:transparent!important}
    #colorbox.sc-profile-public-photo-colorbox{
        position: fixed !important;
        top: 130px !important;
        left: 50% !important;
        transform: translateX(-50%) !important;
    }
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
    #colorbox.sc-profile-public-photo-colorbox #cboxLoadedContent img,
    #colorbox.sc-profile-public-photo-colorbox .cboxPhoto{
        max-width: 400px !important;
        max-height: 533px !important;
        width: auto !important;
        height: auto !important;
        object-fit: contain !important;
        border: 0 !important;
        outline: 0 !important;
        border-radius: 0 !important;
        box-shadow: none !important;
    }
    /* SC_PUBLIC_PROFILE_COLORBOX_POSITION_CLOSE_BORDER_CSS_V1_ACTIVE */
    /* SC_PUBLIC_PROFILE_POPUP_IMAGE_SIZE_MATCH_GOOD_V1_ACTIVE */
    #colorbox.sc-profile-public-photo-colorbox #cboxClose{
        position: absolute !important;
        top: 10px !important;
        right: 10px !important;
        bottom: auto !important;
        left: auto !important;
        z-index: 9999 !important;
        width: auto !important;
        height: auto !important;
        min-width: 0 !important;
        min-height: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        background: transparent !important;
        background-image: none !important;
        color: #101114 !important;
        font-size: 0 !important;
        font-weight: 900 !important;
        line-height: 1 !important;
        text-indent: 0 !important;
        text-decoration: none !important;
        box-shadow: none !important;
        cursor: pointer !important;
        overflow: visible !important;
    }
    #colorbox.sc-profile-public-photo-colorbox #cboxClose:before{
        content: "X" !important;
        display: block !important;
        color: #101114 !important;
        font-size: 32px !important;
        font-weight: 900 !important;
        line-height: 1 !important;
    }
    /* SC_PUBLIC_PROFILE_POPUP_CLOSE_X_POSITION_ONLY_V1_ACTIVE */
    #colorbox.sc-profile-colorbox #cboxTitle,
    #colorbox.sc-profile-colorbox #cboxCurrent{display:none!important;height:0!important;margin:0!important;padding:0!important;overflow:hidden!important;font-size:0!important;line-height:0!important;color:transparent!important}
    @media (max-width:991px){
        .sc-profile-photo-strip{grid-template-columns:repeat(3,minmax(0,1fr))}
        .sc-profile-grid{grid-template-columns:1fr}
    }
    @media (max-width:767px){
        main#content{padding:0 10px!important;padding-top:24px!important}
        .sc-verify-modal-overlay{align-items:flex-start;padding:92px 12px 18px}
        .sc-verify-modal-card{padding:22px 16px 18px}
        .sc-verify-modal-card h2{font-size:21px}
        .sc-verify-modal-actions{flex-direction:column}
        .sc-verify-modal-submit,.sc-verify-modal-cancel{width:100%}
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
        .sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-grid{display:grid!important;grid-template-columns:repeat(2,minmax(0,1fr))!important;gap:20px 12px!important}
        .sc-public-profile .sc-profile-verified-card{width:100%!important;min-width:0!important;max-width:none!important}
        .sc-public-profile .sc-profile-verified-avatar,
        .sc-public-profile .sc-profile-verified-avatar img{width:130px!important;height:130px!important}
        .sc-public-profile .sc-profile-verified-note{left:50%;width:min(260px, calc(100vw - 36px));transform:translateX(-50%)}
        .sc-public-profile .sc-profile-private-media-showcase{grid-template-columns:1fr!important;gap:16px!important;padding:16px!important}
        .sc-public-profile .sc-profile-private-media-left{width:100%!important;max-width:100%!important;min-width:0!important}
        .sc-public-profile .sc-profile-private-media-side-card{max-width:100%!important}
        .sc-public-profile .sc-profile-private-media-feature-img{min-height:auto!important;max-height:none!important}
        .sc-profile-button{width:100%}
    }
    @media screen and (max-width: 640px) {
        #sc-public-profile-private-redo {
            grid-template-columns: 1fr !important;
            gap: 16px !important;
            padding: 14px !important;
        }

        #sc-public-profile-private-redo .sc-private-redo-left {
            width: 100% !important;
            min-width: 0 !important;
            max-width: 100% !important;
        }

        #sc-public-profile-private-redo .sc-private-redo-thumb,
        #sc-public-profile-private-redo .sc-private-redo-thumb img {
            height: 180px !important;
            max-height: 180px !important;
        }

        #sc-public-profile-private-redo .sc-private-redo-feature-img {
            height: auto !important;
            min-height: 0 !important;
            max-height: none !important;
        }
    }
</style>
{/literal}

<div class="sc-public-profile" itemscope="itemscope" itemtype="http://schema.org/Person">
    <div class="sc-profile-photo-strip">
        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                {* SC_PUBLIC_PROFILE_MAIN_PHOTO_DATA_POPUP_V1_ACTIVE *}
                {{ ob_start(); (new AvatarDesignCore)->lightBox($username, $first_name, $sex, 400); $main_photo_html = ob_get_clean(); if (stripos($main_photo_html, 'data-popup=') === false) { $main_photo_html = preg_replace('/<a\b(?![^>]*\bdata-popup=)/i', '<a data-popup="image"', $main_photo_html, 1); } echo $main_photo_html; }}
            </div>
            <span class="sc-profile-photo-label">{lang 'Main Photo'}</span>
        </div>

        {{ $photo1 = isset($public_profile_photos[1]) ? $public_profile_photos[1] : null }}
        <div class="sc-profile-photo-slot">
            <div class="sc-profile-photo-frame">
                {if !empty($photo1)}
                    {{ $photo_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 400) }}
                    {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo1, 400) }}
                    {* SC_PUBLIC_PROFILE_POPUP_USES_400_IMAGE_V1_ACTIVE *}
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
                    {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo2, 400) }}
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
                    {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo3, 400) }}
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
                    {{ $photo_full_url = (new ScPublicProfilePhoto)->getPhotoUrl($username, $photo4, 400) }}
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
                    <span class="sc-verify-couple-wrap">
                        <a class="sc-profile-button sc-profile-verify-button" href="#" data-sc-verify-open="1">
                            {lang 'Verify Couple'}
                        </a>
                        <span class="sc-verify-couple-tooltip">
                            {lang 'Verify a couple you have met or played with. Add a short note about your experience.'}
                        </span>
                    </span>
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

    {if !$is_own_profile}
        <div class="sc-verify-modal-overlay" data-sc-verify-overlay="1" aria-hidden="true">
            <div class="sc-verify-modal" role="dialog" aria-modal="true" aria-labelledby="sc-verify-modal-title">
                <div class="sc-verify-modal-card">
                    <button class="sc-verify-modal-close" type="button" data-sc-verify-close="1" aria-label="{lang 'Close'}">&times;</button>
                    <h2 id="sc-verify-modal-title">{lang 'Tell Us About This Couple'}</h2>
                    <p>{lang 'Share a short note about your real experience with this couple. Keep it classy.'}</p>
                    <form class="sc-verify-modal-form" action="#" method="post" data-sc-verify-form="1">
                        <input type="hidden" name="verified_profile_id" value="{% $id %}" />
                        <input type="hidden" name="security_token" value="{% $verification_csrf_token %}" />
                        <textarea class="sc-verify-modal-textarea" name="verification_note" placeholder="{lang 'Write a short note about your experience...'}"></textarea>
                        <div class="sc-verify-modal-actions">
                            <button class="sc-verify-modal-submit" type="submit">{lang 'Submit Verification'}</button>
                            <button class="sc-verify-modal-cancel" type="button" data-sc-verify-close="1">{lang 'Cancel'}</button>
                        </div>
                        <p class="sc-verify-modal-message" data-sc-verify-message="1" role="status" aria-live="polite"></p>
                    </form>
                </div>
            </div>
        </div>
    {/if}

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

    <!-- SC_FORCE_PRIVATE_REDO_LAYOUT_V4_CONTAIN_NO_CROP_ACTIVE -->
    <!-- SC_PUBLIC_PROFILE_PRIVATE_MEDIA_BLOCK_REDO -->
    <!-- SC_PUBLIC_PROFILE_PRIVATE_MEDIA_STATE {privateMediaStateComment} -->
    <div id="sc-public-profile-private-redo" class="sc-private-redo-layout" data-sc-layout-proof="forced-grid-v4-contain-no-crop" style="display:grid!important;grid-template-columns:280px minmax(0,1fr)!important;gap:24px!important;align-items:stretch!important;width:100%!important;max-width:100%!important;box-sizing:border-box!important;margin:0 0 18px!important;padding:20px!important;">
        <div class="sc-private-redo-left" data-sc-left-proof="280px-column" style="display:flex!important;flex-direction:column!important;gap:16px!important;width:280px!important;min-width:280px!important;max-width:280px!important;">
            <section class="sc-private-redo-card sc-private-redo-photos" data-sc-card-proof="private-photos-280px" style="display:block!important;width:100%!important;max-width:280px!important;box-sizing:border-box!important;padding:12px!important;">
                {if !empty($privatePhotoLink)}
                    <a class="sc-private-redo-thumb" href="{privatePhotoLink}" title="{lang 'Private Photos'}" data-sc-private-link-proof="photos-viewer-link-v1" style="display:block!important;width:100%!important;height:280px!important;max-height:280px!important;overflow:hidden!important;">
                        <img src="{privatePhotoPlaceholder}" alt="{lang 'Private Photos'}" loading="lazy" style="display:block!important;width:100%!important;height:280px!important;max-height:280px!important;object-fit:contain!important;background:#050407!important;" />
                    </a>
                {else}
                    <span class="sc-private-redo-thumb {if !$canViewPrivatePhotos}is-locked{/if}" aria-label="{lang 'Private Photos'}" style="display:block!important;width:100%!important;height:280px!important;max-height:280px!important;overflow:hidden!important;">
                        <img src="{privatePhotoPlaceholder}" alt="{lang 'Private Photos'}" loading="lazy" style="display:block!important;width:100%!important;height:280px!important;max-height:280px!important;object-fit:contain!important;background:#050407!important;" />
                    </span>
                {/if}
            </section>

            <section class="sc-private-redo-card sc-private-redo-videos" data-sc-card-proof="private-videos-280px" style="display:block!important;width:100%!important;max-width:280px!important;box-sizing:border-box!important;padding:12px!important;">
                {if !empty($privateVideoLink)}
                    <a class="sc-private-redo-thumb" href="{privateVideoLink}" title="{lang 'Private Videos'}" data-sc-private-link-proof="videos-viewer-link-v1" style="display:block!important;width:100%!important;height:280px!important;max-height:280px!important;overflow:hidden!important;">
                        <img src="{privateVideoPlaceholder}" alt="{lang 'Private Videos'}" loading="lazy" style="display:block!important;width:100%!important;height:280px!important;max-height:280px!important;object-fit:contain!important;background:#050407!important;" />
                    </a>
                {else}
                    <span class="sc-private-redo-thumb {if !$canViewPrivateVideos}is-locked{/if}" aria-label="{lang 'Private Videos'}" style="display:block!important;width:100%!important;height:280px!important;max-height:280px!important;overflow:hidden!important;">
                        <img src="{privateVideoPlaceholder}" alt="{lang 'Private Videos'}" loading="lazy" style="display:block!important;width:100%!important;height:280px!important;max-height:280px!important;object-fit:contain!important;background:#050407!important;" />
                    </span>
                {/if}
            </section>
        </div>

        <section class="sc-private-redo-feature" data-sc-feature-proof="sharing-right-column-contain" style="display:flex!important;align-items:stretch!important;justify-content:center!important;width:100%!important;height:100%!important;min-height:0!important;min-width:0!important;box-sizing:border-box!important;padding:8px!important;background:#100f14!important;">
            <img class="sc-private-redo-feature-img" data-sc-image-proof="sharing-contain-no-crop" src="/templates/themes/base/img/sharedchemistry/private-media/sharing-is-caring-couples.png" alt="{lang 'Sharing is caring'}" loading="lazy" style="display:block!important;width:100%!important;height:100%!important;min-height:0!important;max-height:none!important;object-fit:contain!important;object-position:center center!important;background:#050407!important;" />
        </section>
    </div>
    <!-- SC_FORCE_PRIVATE_REDO_LAYOUT_V4_CONTAIN_NO_CROP_END -->
    <div class="sc-profile-grid">
{literal}
<style id="sc-profile-friends-final-css">
.sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid {
    display: flex !important;
    flex-wrap: wrap !important;
    align-items: flex-start !important;
    justify-content: flex-start !important;
    gap: 28px !important;
    margin: 0 !important;
    padding: 0 !important;
}

.sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid > a.sc-profile-friend-card,
.sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid > a.sc-profile-friend-card:visited {
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: flex-start !important;
    width: 170px !important;
    min-width: 170px !important;
    max-width: 170px !important;
    float: none !important;
    clear: none !important;
    margin: 0 !important;
    padding: 0 !important;
    background: transparent !important;
    border: 0 !important;
    box-shadow: none !important;
    text-align: center !important;
    text-decoration: none !important;
}

.sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-avatar {
    display: block !important;
    width: 150px !important;
    height: 150px !important;
    margin: 0 auto !important;
    overflow: hidden !important;
}

.sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-avatar img {
    display: block !important;
    width: 150px !important;
    height: 150px !important;
    max-width: none !important;
    max-height: none !important;
    object-fit: cover !important;
}

.sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-info {
    display: block !important;
    width: 100% !important;
    margin: 10px 0 0 !important;
    padding: 0 !important;
    text-align: center !important;
}

.sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-name {
    display: block !important;
    width: 100% !important;
    color: #ffbc0a !important;
    font-size: 18px !important;
    line-height: 1.25 !important;
    text-align: center !important;
    white-space: normal !important;
}

.sc-public-profile .sc-profile-card.sc-profile-friends-card a.sc-profile-card-action,
.sc-public-profile .sc-profile-card.sc-profile-friends-card a.sc-profile-card-action:visited {
    display: flex !important;
    width: fit-content !important;
    margin: 90px auto 0 !important;
    justify-content: center !important;
    color: #ffbc0a !important;
    background: transparent !important;
    border: 0 !important;
}

@media screen and (max-width: 767px) {
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid {
        display: grid !important;
        grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
        gap: 20px 12px !important;
    }

    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-grid > a.sc-profile-friend-card {
        width: 100% !important;
        min-width: 0 !important;
        max-width: none !important;
    }

    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-avatar,
    .sc-public-profile .sc-profile-card.sc-profile-friends-card .sc-profile-friend-avatar img {
        width: 130px !important;
        height: 130px !important;
    }

    .sc-public-profile .sc-profile-card.sc-profile-friends-card a.sc-profile-card-action {
        margin-top: 44px !important;
    }
}
</style>
{/literal}
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

{literal}
<style id="sc-public-verified-friends-final-css">
.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card {
    overflow: visible !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-grid {
    display: grid !important;
    grid-template-columns: repeat(3, 150px) !important;
    align-items: start !important;
    justify-content: start !important;
    gap: 28px !important;
    margin: 0 !important;
    padding: 0 !important;
    overflow: visible !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-card {
    display: flex !important;
    flex-direction: column !important;
    align-items: center !important;
    justify-content: flex-start !important;
    width: 150px !important;
    min-width: 150px !important;
    max-width: 150px !important;
    float: none !important;
    clear: none !important;
    margin: 0 !important;
    padding: 0 !important;
    text-align: center !important;
    overflow: visible !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-avatar {
    position: relative !important;
    display: block !important;
    width: 150px !important;
    height: 150px !important;
    margin: 0 auto !important;
    padding: 0 !important;
    overflow: visible !important;
    background: #101114 !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-avatar img {
    display: block !important;
    width: 150px !important;
    height: 150px !important;
    max-width: none !important;
    max-height: none !important;
    object-fit: cover !important;
    border: 0 !important;
    border-radius: 0 !important;
    box-shadow: none !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-note {
    display: none !important;
    position: absolute !important;
    left: 0 !important;
    bottom: calc(100% + 10px) !important;
    z-index: 100 !important;
    width: 270px !important;
    padding: 11px 13px !important;
    border: 1px solid rgba(255,255,255,.14) !important;
    border-radius: 8px !important;
    background: #202127 !important;
    color: #f7f3ef !important;
    font-size: 13px !important;
    line-height: 1.35 !important;
    text-align: left !important;
    white-space: normal !important;
    box-shadow: 0 10px 28px rgba(0,0,0,.35) !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-avatar:hover .sc-profile-verified-note,
.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-avatar:focus-within .sc-profile-verified-note {
    display: block !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-reviewer {
    display: block !important;
    margin: 0 0 7px !important;
    color: #ffbc0a !important;
    font-weight: bold !important;
    line-height: 1.3 !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-review-text {
    display: block !important;
    color: #f7f3ef !important;
    white-space: pre-line !important;
}

.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card a.sc-profile-verified-name,
.sc-public-profile .sc-profile-card.sc-profile-verified-friends-card a.sc-profile-verified-name:visited {
    display: block !important;
    width: 150px !important;
    margin: 10px 0 0 !important;
    padding: 0 !important;
    color: #ffbc0a !important;
    font-size: 18px !important;
    line-height: 1.25 !important;
    text-align: center !important;
    text-decoration: none !important;
    white-space: normal !important;
}

@media screen and (max-width: 767px) {
    .sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-grid {
        grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
        gap: 20px 12px !important;
    }

    .sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-card,
    .sc-public-profile .sc-profile-card.sc-profile-verified-friends-card a.sc-profile-verified-name {
        width: 100% !important;
        min-width: 0 !important;
        max-width: none !important;
    }

    .sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-avatar,
    .sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-avatar img {
        width: 130px !important;
        height: 130px !important;
    }

    .sc-public-profile .sc-profile-card.sc-profile-verified-friends-card .sc-profile-verified-note {
        left: 50% !important;
        width: min(270px, calc(100vw - 36px)) !important;
        transform: translateX(-50%) !important;
    }
}
</style>
{/literal}
        <section class="sc-profile-card sc-profile-verified-friends-card">
            <h2>{lang 'Verified Friends'}</h2>
            {if !empty($profile_verified_friends)}
                <div class="sc-profile-verified-grid">
                    {each $verified in $profile_verified_friends}
                        <div class="sc-profile-verified-card">
                            <span class="sc-profile-verified-avatar" tabindex="0">
                                <img src="{% $verified->avatarUrl %}" alt="{% escape($verified->displayName) %}" loading="lazy" onerror="this.onerror=null;this.src='{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png';" />
                                <span class="sc-profile-verified-note">
                                    <span class="sc-profile-verified-reviewer">{lang 'Verified by'} {% escape($verified->reviewerDisplayName) %}</span>
                                    <span class="sc-profile-verified-review-text">{% nl2br(escape($verified->note)) %}</span>
                                </span>
                            </span>
                            <a class="sc-profile-verified-name" href="{% $verified->profileUrl %}">{% escape($verified->displayName) %}</a>
                        </div>
                    {/each}
                </div>
            {else}
                <p>{lang 'Verified couple cards will appear here after this couple verifies couples they have met.'}</p>
            {/if}
        </section>
    </div>
</div>

{* SC_PUBLIC_PROFILE_DIRECT_COLORBOX_ASSET_V1_ACTIVE *}
<script src="{url_root}static/js/jquery/box.js"></script>

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

        var $verifyOverlay = $('.sc-verify-modal-overlay[data-sc-verify-overlay="1"]');
        var $verifyOpen = $('[data-sc-verify-open="1"]');

        if ($verifyOverlay.length) {
            var closeVerifyModal = function() {
                $verifyOverlay.removeClass('is-open').attr('aria-hidden', 'true');
                $('body').removeClass('sc-verify-modal-open');
            };

            var openVerifyModal = function() {
                $verifyOverlay.addClass('is-open').attr('aria-hidden', 'false');
                $('body').addClass('sc-verify-modal-open');
                $verifyOverlay.find('[data-sc-verify-message="1"]').removeClass('is-visible').text('');
                window.setTimeout(function() {
                    $verifyOverlay.find('.sc-verify-modal-textarea').trigger('focus');
                }, 50);
            };

            $verifyOpen.on('click.scVerifyCouple', function(event) {
                event.preventDefault();
                openVerifyModal();
            });

            $verifyOverlay.on('click.scVerifyCouple', function(event) {
                if ($(event.target).is($verifyOverlay)) {
                    closeVerifyModal();
                }
            });

            $verifyOverlay.find('[data-sc-verify-close="1"]').on('click.scVerifyCouple', function(event) {
                event.preventDefault();
                closeVerifyModal();
            });

            $verifyOverlay.find('[data-sc-verify-form="1"]').on('submit.scVerifyCouple', function(event) {
                event.preventDefault();
                var $form = $(this);
                var $message = $verifyOverlay.find('[data-sc-verify-message="1"]');
                var $submit = $form.find('.sc-verify-modal-submit');

                $message.removeClass('is-visible').text('');
                $submit.prop('disabled', true);

                $.post(pH7Url.base + 'cool-profile-page/asset/ajax/CoupleVerification', $form.serialize(), function(response) {
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

                    $message
                        .text(data.txt || 'Verification saved.')
                        .addClass('is-visible');
                }).fail(function() {
                    $message
                        .text('Unable to save verification. Please try again.')
                        .addClass('is-visible');
                }).always(function() {
                    $submit.prop('disabled', false);
                });
            });

            $(document).on('keydown.scVerifyCouple', function(event) {
                if (event.key === 'Escape' && $verifyOverlay.hasClass('is-open')) {
                    closeVerifyModal();
                }
            });
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
                '#colorbox.sc-profile-public-photo-colorbox #cboxLoadedContent img,#colorbox.sc-profile-public-photo-colorbox .cboxPhoto{max-width:400px!important;max-height:533px!important;width:auto!important;height:auto!important;object-fit:contain!important;border-radius:0!important}' +
                '#colorbox.sc-profile-colorbox #cboxTitle,#colorbox.sc-profile-colorbox #cboxCurrent{display:none!important;height:0!important;margin:0!important;padding:0!important;overflow:hidden!important;font-size:0!important;line-height:0!important;color:transparent!important}' +
            '</style>').appendTo('head');
        }

        var $publicPhotoLinks = $('.sc-profile-photo-strip a[data-popup="image"]');
        var $privateMediaLinks = $('.sc-profile-private-media-photo a[data-popup="image"]');
        var $links = $publicPhotoLinks.add($privateMediaLinks);

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

            $publicPhotoLinks.colorbox({
                maxWidth: '400px',
                maxHeight: '533px',
                scrolling: false,
                transition: 'fade',
                photo: true,
                title: '',
                onOpen: function() {
                    $('#colorbox').addClass('sc-profile-colorbox sc-profile-public-photo-colorbox');
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
                        return (s || '') + ';display:block!important;margin:0 auto!important;max-width:400px!important;max-height:533px!important;width:auto!important;height:auto!important;object-fit:contain!important;border:0!important;border-radius:0!important;box-shadow:0 0 0 5px #8f4dff!important;';
                    });
                },
                onClosed: function() {
                    $('#colorbox').removeClass('sc-profile-colorbox sc-profile-public-photo-colorbox');
                    $('#cboxOverlay').removeClass('sc-profile-colorbox-overlay');
                }
            });

            $privateMediaLinks.colorbox({
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
