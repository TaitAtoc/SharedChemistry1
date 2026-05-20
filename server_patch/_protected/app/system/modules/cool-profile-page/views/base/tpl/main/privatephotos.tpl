<!-- SC_PRIVATE_VIEWER_PHOTOS_V1_ACTIVE -->
<!-- SC_PRIVATE_VIEWER_PHOTOS_V2_UI_FIX_ACTIVE -->
<div id="sc-private-viewer-photos-v1" class="sc-private-viewer-page" data-sc-viewer-proof="private-photos-viewer-v1">
{literal}
<style type="text/css">
    /* SC_PRIVATE_VIEWER_PHOTOS_GAP_FIX_V2 */
    html body main#content#content:has(#sc-private-viewer-photos-v1),
    html body main#content:has(#sc-private-viewer-photos-v1){margin-top: 0!important;padding-top: 24px!important}
    #sc-private-viewer-photos-v1,
    #sc-private-viewer-photos-v1 *{box-sizing:border-box}
    #sc-private-viewer-photos-v1{width:100%;max-width:1180px;margin:0 auto 42px!important;margin-top: 0!important;padding:0 16px!important;color:#f7f3ef}
    #sc-private-viewer-photos-v1 .sc-private-viewer-hero{display:flex;align-items:flex-end;justify-content:space-between;gap:18px;margin:0 0 22px;padding:26px;border:1px solid rgba(255,255,255,.1);border-radius:8px;background:linear-gradient(135deg,#17151c 0%,#100f14 62%,#1d1119 100%);box-shadow:0 18px 46px rgba(0,0,0,.32)}
    #sc-private-viewer-photos-v1 .sc-private-viewer-kicker{display:inline-flex;align-items:center;min-height:26px;padding:5px 10px;margin:0 0 10px;border:1px solid rgba(255,188,10,.38);border-radius:999px;color:#ffbc0a;background:rgba(255,188,10,.08);font-size:12px;font-weight:700;letter-spacing:.04em;text-transform:uppercase}
    #sc-private-viewer-photos-v1 h1{margin:0;color:#fff;font-size:34px;line-height:1.15;font-weight:800}
    #sc-private-viewer-photos-v1 .sc-private-viewer-subtitle{margin:10px 0 0;color:#d9d2dc;font-size:15px;line-height:1.5}
    #sc-private-viewer-photos-v1 .sc-private-viewer-actions{display:flex;flex-wrap:wrap;gap:10px;justify-content:flex-end}
    #sc-private-viewer-photos-v1 .sc-private-viewer-button{display:inline-flex;align-items:center;justify-content:center;min-height:40px;padding:10px 14px;border:1px solid rgba(255,255,255,.12);border-radius:6px;background:#24212b;color:#f7f3ef!important;text-decoration:none!important;font-size:14px;font-weight:700}
    #sc-private-viewer-photos-v1 .sc-private-viewer-button:hover{background:#2e2935;color:#fff!important}
    #sc-private-viewer-photos-v1 .sc-private-viewer-button.is-primary{border-color:#ff2f8d;background:#ff2f8d;color:#fff!important}
    #sc-private-viewer-photos-v1 .sc-private-viewer-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:18px}
    #sc-private-viewer-photos-v1 .sc-private-viewer-photo-card{display:block;margin:0;padding:10px;border:1px solid rgba(255,255,255,.1);border-radius:8px;background:#17151c;box-shadow:0 14px 36px rgba(0,0,0,.28);cursor:pointer}
    #sc-private-viewer-photos-v1 .sc-private-viewer-photo-card img{display:block;width:100%;height:260px;object-fit:cover;border:0;border-radius:6px;background:#050407}
    #sc-private-viewer-photos-v1 .sc-private-viewer-caption{display:block;margin:9px 0 0;color:#d9d2dc;font-size:13px;line-height:1.35}
    #sc-private-viewer-photos-v1 .sc-private-viewer-empty{padding:26px;border:1px solid rgba(255,255,255,.1);border-radius:8px;background:#17151c;color:#d9d2dc;font-size:16px}
    #sc-private-viewer-photos-v1 .sc-private-viewer-locked{padding:34px;border:1px solid rgba(255,47,141,.24);border-radius:8px;background:#17151c;box-shadow:0 18px 46px rgba(0,0,0,.3)}
    #sc-private-viewer-photos-v1 .sc-private-viewer-locked h2{margin:0 0 10px;color:#fff;font-size:28px;line-height:1.2}
    #sc-private-viewer-photos-v1 .sc-private-viewer-locked p{margin:0 0 18px;color:#d9d2dc;font-size:15px;line-height:1.5}
    #sc-private-viewer-photos-v1 .sc-private-viewer-lightbox{position:fixed!important;inset:0!important;z-index:99999!important;display:none;align-items:center!important;justify-content:center!important;padding:32px!important;background:rgba(0,0,0,.88)!important}
    #sc-private-viewer-photos-v1 .sc-private-viewer-lightbox.is-open{display:flex}
    #sc-private-viewer-photos-v1 .sc-private-viewer-lightbox-panel{position:relative!important;width: min(1200px, 94vw)!important;max-width:94vw!important;max-height: 90vh!important;display:flex!important;align-items:center!important;justify-content:center!important;padding:14px!important;border:1px solid rgba(255,255,255,.16)!important;border-radius:14px!important;background:#100f14!important;box-shadow:0 24px 80px rgba(0,0,0,.65)!important}
    #sc-private-viewer-photos-v1 .sc-private-viewer-lightbox-img{display:block!important;width:auto!important;height:auto!important;max-width:calc(94vw - 40px)!important;max-height:calc(90vh - 40px)!important;object-fit: contain!important;border-radius:10px!important;background:#050407}
    #sc-private-viewer-photos-v1 .sc-private-viewer-lightbox-close{position:absolute;top:10px;right:10px;width:36px;height:36px;border:1px solid rgba(255,255,255,.18);border-radius:50%;background:#17151c;color:#fff;font-size:24px;line-height:32px;text-align:center;cursor:pointer}
    @media (max-width:900px){#sc-private-viewer-photos-v1 .sc-private-viewer-grid{grid-template-columns:repeat(2,minmax(0,1fr))}#sc-private-viewer-photos-v1 .sc-private-viewer-hero{align-items:flex-start;flex-direction:column}#sc-private-viewer-photos-v1 .sc-private-viewer-actions{justify-content:flex-start}}
    @media (max-width:620px){#sc-private-viewer-photos-v1{margin-top:0!important;padding:0 12px!important}#sc-private-viewer-photos-v1 h1{font-size:28px}#sc-private-viewer-photos-v1 .sc-private-viewer-grid{grid-template-columns:1fr}#sc-private-viewer-photos-v1 .sc-private-viewer-photo-card img{height:230px}}
</style>
{/literal}

    <section class="sc-private-viewer-hero">
        <div>
            <span class="sc-private-viewer-kicker">{lang 'Private access approved'}</span>
            <h1>{% escape($privateViewerProfileTitle) %} {lang 'Private Photos'}</h1>
            <p class="sc-private-viewer-subtitle">{lang 'A private gallery shared only with approved members.'}</p>
        </div>
        <div class="sc-private-viewer-actions">
            <a class="sc-private-viewer-button" href="{privateViewerProfileUrl}">{lang 'Back to profile'}</a>
            {if !empty($privateViewerMessageUrl)}
                <a class="sc-private-viewer-button is-primary" href="{privateViewerMessageUrl}">{lang 'Message couple'}</a>
            {/if}
        </div>
    </section>

    {if !$privateViewerAccessApproved}
        <section class="sc-private-viewer-locked">
            <h2>{lang 'Private access required'}</h2>
            <p>{lang 'This couple has not granted you access to these private photos yet.'}</p>
            <div class="sc-private-viewer-actions">
                <a class="sc-private-viewer-button" href="{privateViewerProfileUrl}">{lang 'Back to profile'}</a>
                {if !empty($privateViewerMessageUrl)}
                    <a class="sc-private-viewer-button is-primary" href="{privateViewerMessageUrl}">{lang 'Message couple'}</a>
                {/if}
            </div>
        </section>
    {else}
        {if !empty($privateViewerItems)}
            <div class="sc-private-viewer-grid">
                {each $item in $privateViewerItems}
                    <button type="button" class="sc-private-viewer-photo-card" data-sc-private-photo="{% escape($item->url) %}" aria-label="{lang 'Open private photo'}">
                        <img src="{% escape($item->url) %}" data-full="{% escape($item->url) %}" alt="{% escape($item->display_name) %}" loading="lazy" />
                        <span class="sc-private-viewer-caption">{% escape($item->display_name) %}</span>
                    </button>
                {/each}
            </div>
        {else}
            <section class="sc-private-viewer-empty">{lang 'Private photos have not been added yet.'}</section>
        {/if}
    {/if}

    <div class="sc-private-viewer-lightbox" aria-hidden="true">
        <div class="sc-private-viewer-lightbox-panel" role="dialog" aria-modal="true" aria-label="{lang 'Private photo'}">
            <button type="button" class="sc-private-viewer-lightbox-close" aria-label="{lang 'Close'}">&times;</button>
            <img class="sc-private-viewer-lightbox-img" src="" alt="{lang 'Private photo'}" />
        </div>
    </div>

{literal}
<script type="text/javascript">
(function(){
    var root = document.getElementById('sc-private-viewer-photos-v1');
    if (!root) { return; }
    var lightbox = root.querySelector('.sc-private-viewer-lightbox');
    var lightboxImg = root.querySelector('.sc-private-viewer-lightbox-img');
    var closeButton = root.querySelector('.sc-private-viewer-lightbox-close');
    function openLightbox(src) {
        if (!src || !lightbox || !lightboxImg) { return; }
        lightboxImg.src = src;
        lightbox.className += ' is-open';
        lightbox.setAttribute('aria-hidden', 'false');
    }
    function closeLightbox() {
        if (!lightbox || !lightboxImg) { return; }
        lightbox.className = lightbox.className.replace(/\bis-open\b/g, '').replace(/\s{2,}/g, ' ');
        lightbox.setAttribute('aria-hidden', 'true');
        lightboxImg.src = '';
    }
    root.addEventListener('click', function(event) {
        var target = event.target;
        while (target && target !== root && !target.getAttribute('data-sc-private-photo')) {
            target = target.parentNode;
        }
        if (target && target.getAttribute && target.getAttribute('data-sc-private-photo')) {
            var clickedImg = target.querySelector ? target.querySelector('img') : null;
            openLightbox((clickedImg && clickedImg.dataset ? clickedImg.dataset.full : '') || target.getAttribute('data-sc-private-photo'));
            return;
        }
        if (event.target === lightbox || event.target === closeButton) {
            closeLightbox();
        }
    });
    document.addEventListener('keydown', function(event) {
        if (event.key === 'Escape') {
            closeLightbox();
        }
    });
})();
</script>
{/literal}
</div>
<!-- SC_PRIVATE_VIEWER_PHOTOS_V2_UI_FIX_END -->
<!-- SC_PRIVATE_VIEWER_PHOTOS_V1_END -->
