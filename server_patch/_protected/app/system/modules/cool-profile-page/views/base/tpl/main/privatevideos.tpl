<!-- SC_PRIVATE_VIEWER_VIDEOS_V1_ACTIVE -->
<div id="sc-private-viewer-videos-v1" class="sc-private-viewer-page" data-sc-viewer-proof="private-videos-viewer-v1">
{literal}
<style type="text/css">
    #sc-private-viewer-videos-v1,
    #sc-private-viewer-videos-v1 *{box-sizing:border-box}
    #sc-private-viewer-videos-v1{width:100%;max-width:1180px;margin:28px auto 42px;padding:0 16px;color:#f7f3ef}
    #sc-private-viewer-videos-v1 .sc-private-viewer-hero{display:flex;align-items:flex-end;justify-content:space-between;gap:18px;margin:0 0 22px;padding:26px;border:1px solid rgba(255,255,255,.1);border-radius:8px;background:linear-gradient(135deg,#17151c 0%,#100f14 62%,#1d1119 100%);box-shadow:0 18px 46px rgba(0,0,0,.32)}
    #sc-private-viewer-videos-v1 .sc-private-viewer-kicker{display:inline-flex;align-items:center;min-height:26px;padding:5px 10px;margin:0 0 10px;border:1px solid rgba(255,188,10,.38);border-radius:999px;color:#ffbc0a;background:rgba(255,188,10,.08);font-size:12px;font-weight:700;letter-spacing:.04em;text-transform:uppercase}
    #sc-private-viewer-videos-v1 h1{margin:0;color:#fff;font-size:34px;line-height:1.15;font-weight:800}
    #sc-private-viewer-videos-v1 .sc-private-viewer-subtitle{margin:10px 0 0;color:#d9d2dc;font-size:15px;line-height:1.5}
    #sc-private-viewer-videos-v1 .sc-private-viewer-actions{display:flex;flex-wrap:wrap;gap:10px;justify-content:flex-end}
    #sc-private-viewer-videos-v1 .sc-private-viewer-button{display:inline-flex;align-items:center;justify-content:center;min-height:40px;padding:10px 14px;border:1px solid rgba(255,255,255,.12);border-radius:6px;background:#24212b;color:#f7f3ef!important;text-decoration:none!important;font-size:14px;font-weight:700}
    #sc-private-viewer-videos-v1 .sc-private-viewer-button:hover{background:#2e2935;color:#fff!important}
    #sc-private-viewer-videos-v1 .sc-private-viewer-button.is-primary{border-color:#ff2f8d;background:#ff2f8d;color:#fff!important}
    #sc-private-viewer-videos-v1 .sc-private-viewer-grid{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:18px}
    #sc-private-viewer-videos-v1 .sc-private-viewer-video-card{display:block;margin:0;padding:12px;border:1px solid rgba(255,255,255,.1);border-radius:8px;background:#17151c;box-shadow:0 14px 36px rgba(0,0,0,.28)}
    #sc-private-viewer-videos-v1 .sc-private-viewer-video-frame{display:block;width:100%;border-radius:6px;overflow:hidden;background:#050407}
    #sc-private-viewer-videos-v1 .sc-private-viewer-video-frame video{display:block;width:100%;max-height:520px;background:#050407}
    #sc-private-viewer-videos-v1 .sc-private-viewer-caption{display:block;margin:10px 0 0;color:#d9d2dc;font-size:13px;line-height:1.35}
    #sc-private-viewer-videos-v1 .sc-private-viewer-empty{padding:26px;border:1px solid rgba(255,255,255,.1);border-radius:8px;background:#17151c;color:#d9d2dc;font-size:16px}
    #sc-private-viewer-videos-v1 .sc-private-viewer-locked{padding:34px;border:1px solid rgba(255,47,141,.24);border-radius:8px;background:#17151c;box-shadow:0 18px 46px rgba(0,0,0,.3)}
    #sc-private-viewer-videos-v1 .sc-private-viewer-locked h2{margin:0 0 10px;color:#fff;font-size:28px;line-height:1.2}
    #sc-private-viewer-videos-v1 .sc-private-viewer-locked p{margin:0 0 18px;color:#d9d2dc;font-size:15px;line-height:1.5}
    @media (max-width:900px){#sc-private-viewer-videos-v1 .sc-private-viewer-grid{grid-template-columns:1fr}#sc-private-viewer-videos-v1 .sc-private-viewer-hero{align-items:flex-start;flex-direction:column}#sc-private-viewer-videos-v1 .sc-private-viewer-actions{justify-content:flex-start}}
    @media (max-width:620px){#sc-private-viewer-videos-v1{margin-top:18px;padding:0 12px}#sc-private-viewer-videos-v1 h1{font-size:28px}}
</style>
{/literal}

    <section class="sc-private-viewer-hero">
        <div>
            <span class="sc-private-viewer-kicker">{lang 'Private access approved'}</span>
            <h1>{% escape($privateViewerProfileTitle) %} {lang 'Private Videos'}</h1>
            <p class="sc-private-viewer-subtitle">{lang 'A private video gallery shared only with approved members.'}</p>
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
            <p>{lang 'This couple has not granted you access to these private videos yet.'}</p>
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
                    <article class="sc-private-viewer-video-card">
                        <span class="sc-private-viewer-video-frame">
                            <video controls preload="metadata" src="{% escape($item->url) %}"></video>
                        </span>
                        <span class="sc-private-viewer-caption">{% escape($item->display_name) %}</span>
                    </article>
                {/each}
            </div>
        {else}
            <section class="sc-private-viewer-empty">{lang 'Private videos have not been added yet.'}</section>
        {/if}
    {/if}
</div>
<!-- SC_PRIVATE_VIEWER_VIDEOS_V1_END -->
