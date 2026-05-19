<!-- SC_PRIVATE_PHOTOS_TEMPLATE_LOADED -->
{literal}
<style>
body,main#content{background:#101114!important}
main#content{max-width:1180px!important;margin:0 auto!important;padding:132px 15px 48px!important;border:0!important;box-shadow:none!important}
.sc-private-media{color:#f7f3ef}
.sc-private-media *{box-sizing:border-box}
.sc-private-media__hero,.sc-private-media__card{border:1px solid rgba(247,243,239,.08);border-radius:8px;background:#17181d;box-shadow:0 20px 54px rgba(0,0,0,.34)}
.sc-private-media__hero{padding:28px 32px;margin-bottom:18px}
.sc-private-media__hero h1,.sc-private-media__card h2{margin:0;color:#f7f3ef;line-height:1.2}
.sc-private-media__hero h1{font-size:32px}
.sc-private-media__hero p,.sc-private-media__helper{margin:10px 0 0;color:#b8b3b0;line-height:1.55}
.sc-private-media__grid{display:grid;grid-template-columns:minmax(0,1fr);gap:18px}
.sc-private-media__card{padding:24px}
.sc-private-media__upload{display:flex;flex-wrap:wrap;align-items:center;gap:12px;margin-top:16px;padding:18px;border:1px dashed rgba(236,8,104,.5);border-radius:8px;background:#101114}
.sc-private-media__upload input[type=file]{width:min(100%,420px);color:#f7f3ef}
.sc-private-media__button{display:inline-flex;align-items:center;justify-content:center;min-height:40px;padding:10px 18px;border:0;border-radius:8px;background:linear-gradient(90deg,#ec0868,#c200fb);color:#f7f3ef;font-weight:800;cursor:pointer}
.sc-private-media__notice{margin:0 0 14px;padding:11px 13px;border-radius:8px;background:rgba(70,214,111,.12);color:#b8f2c6}
.sc-private-media__error{margin:0 0 14px;padding:11px 13px;border-radius:8px;background:rgba(216,76,89,.16);color:#ffc8ce}
.sc-private-media__gallery{display:grid;grid-template-columns:repeat(4,minmax(0,1fr));gap:14px;margin-top:16px}
.sc-private-media__thumb{position:relative;display:block;aspect-ratio:1/1;overflow:hidden;border-radius:0;background:#101114}
.sc-private-media__thumb img{display:block;width:100%;height:100%;object-fit:cover;border:0}
.sc-private-media__empty{color:#8f8a88;font-style:italic}
.sc-private-access-list{display:grid;grid-template-columns:repeat(2,minmax(0,1fr));gap:12px;margin-top:16px}
.sc-private-access-card{display:grid;gap:10px;padding:14px;border:1px solid rgba(247,243,239,.10);border-radius:8px;background:#101114}
.sc-private-access-name{color:#f7f3ef;font-weight:800}
.sc-private-access-toggle{display:flex;align-items:center;justify-content:space-between;gap:12px;min-height:42px;padding:9px 11px;border:1px solid rgba(236,8,104,.28);border-radius:8px;background:#202127;color:#f7f3ef;font-weight:700}
.sc-private-access-toggle input{width:18px;height:18px;margin:0;accent-color:#ec0868}
@media(max-width:900px){.sc-private-media__gallery{grid-template-columns:repeat(3,minmax(0,1fr))}}
@media(max-width:700px){main#content{padding:112px 10px 32px!important}.sc-private-media__hero,.sc-private-media__card{padding:20px}.sc-private-media__gallery,.sc-private-access-list{grid-template-columns:repeat(2,minmax(0,1fr))}}
</style>
{/literal}

<!-- Template variables:
     $privatePhotos: owner gallery items with url and hasAccess properties.
     $accessRecipients: friend/verified-friend rows with profileId, displayName, and photoAccess.
     Locked public-profile rendering is handled elsewhere; this owner page only exposes URLs to the owner. -->
<div class="sc-private-media">
    <section class="sc-private-media__hero">
        <h1>{lang 'Private Photos'}</h1>
        <p>{lang 'Upload private photos and choose which trusted couples can view them.'}</p>
    </section>

    {if !empty($private_media_message)}
        <p class="sc-private-media__notice">{private_media_message}</p>
    {/if}
    {if !empty($private_media_error)}
        <p class="sc-private-media__error">{private_media_error}</p>
    {/if}

    <div class="sc-private-media__grid">
        <section class="sc-private-media__card">
            <h2>{lang 'Upload'}</h2>
            <p class="sc-private-media__helper">{lang 'Drag a file onto the chooser or select a photo from your device.'}</p>
            <form class="sc-private-media__upload" action="" method="post" enctype="multipart/form-data">
                <input type="hidden" name="security_token" value="{% $private_media_csrf_token %}" />
                <input type="hidden" name="private_media_action" value="upload" />
                <input type="file" name="private_media_file" accept="image/jpeg,image/png,image/webp,image/gif" required="required" />
                <button class="sc-private-media__button" type="submit">{lang 'Upload Photo'}</button>
            </form>
        </section>

        <section class="sc-private-media__card">
            <h2>{lang 'Gallery'}</h2>
            {if !empty($privatePhotos)}
                <div class="sc-private-media__gallery">
                    {each $photo in $privatePhotos}
                        <span class="sc-private-media__thumb">
                            {if $photo->hasAccess}
                                <img src="{% $photo->url %}" alt="{lang 'Private photo'}" loading="lazy" onerror="this.onerror=null;this.src='{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png';" />
                            {else}
                                <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Locked private photo'}" loading="lazy" />
                            {/if}
                        </span>
                    {/each}
                </div>
            {else}
                <p class="sc-private-media__empty">{lang 'No private photos uploaded yet.'}</p>
            {/if}
        </section>

        <section class="sc-private-media__card">
            <h2>{lang 'Access Control'}</h2>
            <p class="sc-private-media__helper">{lang 'Grant or revoke private photo access for friends and verified friends.'}</p>
            <form action="" method="post">
                <input type="hidden" name="security_token" value="{% $private_media_csrf_token %}" />
                <input type="hidden" name="private_media_action" value="permissions" />
                {if !empty($accessRecipients)}
                    <div class="sc-private-access-list">
                        {each $recipient in $accessRecipients}
                            <div class="sc-private-access-card">
                                <span class="sc-private-access-name">{% escape($recipient->displayName) %}</span>
                                <!-- Photo access for profile ID {% $recipient->profileId %}. Field: private_media_access[{% $recipient->profileId %}][photo]. -->
                                <label class="sc-private-access-toggle" for="private_photo_access_{% $recipient->profileId %}">
                                    <span>{lang 'Allow Private Media Access'}</span>
                                    <input id="private_photo_access_{% $recipient->profileId %}" type="checkbox" name="private_media_access[{% $recipient->profileId %}][photo]" value="1" {if $recipient->photoAccess}checked="checked"{/if} />
                                </label>
                            </div>
                        {/each}
                    </div>
                    <button class="sc-private-media__button" type="submit">{lang 'Save Permissions'}</button>
                {else}
                    <p class="sc-private-media__empty">{lang 'Friends and verified friends will appear here.'}</p>
                {/if}
            </form>
        </section>
    </div>
</div>
