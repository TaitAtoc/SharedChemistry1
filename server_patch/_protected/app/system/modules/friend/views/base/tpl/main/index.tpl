{literal}
<style>
    body{background:#101114!important}
    main#content{width:min(1080px,calc(100vw - 48px))!important;max-width:none!important;margin:0 auto!important;padding:140px 0 90px!important;background:transparent!important;border:0!important;box-shadow:none!important}
    .sc-friend-page,
    .sc-friend-page *{box-sizing:border-box}
    .sc-friend-page{display:grid;gap:16px;color:#f7f3ef}
    .sc-friend-header{display:flex;align-items:flex-end;justify-content:space-between;gap:18px;padding:22px;border:1px solid rgba(247,243,239,.08);border-radius:10px;background:#17181d;box-shadow:0 16px 34px rgba(0,0,0,.24)}
    .sc-friend-title h1{margin:0 0 6px;color:#f7f3ef;font-size:30px;font-weight:700;line-height:1.15}
    .sc-friend-title p{margin:0;color:#b8b3b0;font-size:14px;line-height:1.45}
    .sc-friend-title a{color:#ffbc0a;text-decoration:none}
    .sc-friend-title a:hover,
    .sc-friend-title a:focus{color:#f7f3ef;text-decoration:none}
    .sc-friend-list{display:grid;gap:12px;margin:0;padding:0;list-style:none}
    .sc-friend-card{display:grid;grid-template-columns:82px minmax(0,1fr) auto;gap:16px;align-items:center;min-width:0;padding:16px;border:1px solid rgba(247,243,239,.08);border-radius:10px;background:#202127;color:#f7f3ef;box-shadow:0 12px 28px rgba(0,0,0,.22)}
    .sc-friend-avatar{position:relative;display:block;width:82px;height:82px;overflow:hidden;border:1px solid rgba(247,243,239,.08);border-radius:12px;background:#101114 url('{/literal}{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png{literal}') center/cover no-repeat;text-decoration:none}
    .sc-friend-avatar img{display:block;width:100%;height:100%;object-fit:cover;border:0!important;border-radius:12px!important;box-shadow:none!important;color:transparent;font-size:0;line-height:0;text-indent:-9999px}
    .sc-friend-info{min-width:0}
    .sc-friend-name{display:inline-flex;max-width:100%;overflow:hidden;color:#f7f3ef;font-size:18px;font-weight:700;line-height:1.25;text-overflow:ellipsis;white-space:nowrap;text-decoration:none}
    .sc-friend-name:hover,
    .sc-friend-name:focus{color:#ffbc0a;text-decoration:none}
    .sc-friend-meta{display:flex;flex-wrap:wrap;gap:8px;margin-top:8px}
    .sc-friend-pill{display:inline-flex;align-items:center;min-height:26px;padding:5px 9px;border:1px solid rgba(247,243,239,.1);border-radius:999px;background:#17181d;color:#b8b3b0;font-size:12px;font-weight:700;line-height:1.2}
    .sc-friend-pill.is-pending{border-color:rgba(255,188,10,.5);color:#ffbc0a}
    .sc-friend-actions{display:flex;align-items:center;justify-content:flex-end;gap:10px;min-width:190px;justify-self:end}
    .sc-friend-button{display:inline-flex!important;align-items:center;justify-content:center;min-width:86px;min-height:38px;padding:9px 13px!important;border:1px solid rgba(247,243,239,.16)!important;border-radius:9px!important;background:#202127!important;background-image:none!important;color:#f7f3ef!important;font-size:13px!important;font-weight:700!important;line-height:1.2!important;text-align:center!important;text-decoration:none!important;text-shadow:none!important;box-shadow:none!important;cursor:pointer;transition:background .18s ease,border-color .18s ease,transform .18s ease}
    .sc-friend-button:hover,
    .sc-friend-button:focus{border-color:#ec0868!important;background:#2a1723!important;color:#fff!important;text-decoration:none!important;transform:translateY(-1px)}
    .sc-friend-button.is-primary{border-color:transparent!important;background:#ec0868!important;background-image:linear-gradient(90deg,#ec0868,#c200fb)!important;color:#fff!important}
    .sc-friend-button.is-primary:hover,
    .sc-friend-button.is-primary:focus{border-color:transparent!important;background:#f32482!important;background-image:linear-gradient(90deg,#f32482,#d035ff)!important;color:#fff!important}
    .sc-friend-tools{display:flex;justify-content:flex-end}
    .sc-friend-empty{padding:18px;border:1px solid rgba(247,243,239,.08);border-radius:10px;background:#17181d;color:#b8b3b0;font-size:14px;line-height:1.5}
    .sc-friend-page .paginator,
    .sc-friend-page .pagination{margin:6px 0 0;text-align:center}
    @media (max-width:767px){
        main#content{width:min(100%,calc(100vw - 20px))!important;padding:108px 0 72px!important}
        .sc-friend-header{display:grid;padding:18px}
        .sc-friend-title h1{font-size:26px}
        .sc-friend-tools{justify-content:stretch}
        .sc-friend-tools .sc-friend-button{width:100%}
        .sc-friend-card{grid-template-columns:66px minmax(0,1fr);align-items:start;padding:14px}
        .sc-friend-avatar{width:64px;height:64px}
        .sc-friend-actions{grid-column:1 / -1;justify-content:stretch;justify-self:stretch;min-width:0}
        .sc-friend-actions .sc-friend-button{width:100%}
    }
</style>
{/literal}

<div class="sc-friend-page" id="friend_block">
    <section class="sc-friend-header">
        <div class="sc-friend-title">
            <h1>{lang 'Manage Friends'}</h1>
            {if empty($error)}
                <p>
                    <a href="{{ $design->url('friend','main','index',$username) }}">{friend_number}</a>
                </p>
            {else}
                <p>{lang 'View and manage your couple connections.'}</p>
            {/if}
        </div>

        <div class="sc-friend-tools">
            <a class="sc-friend-button" href="{{ $design->url('friend','main','search',"$username,$action") }}">
                {lang 'Search for a friend of %0%', $username}
            </a>
        </div>
    </section>

    {if empty($error)}
        <div class="sc-friend-list">
            {each $f in $friends}
                <article class="sc-friend-card" id="friend_{% $f->fdId %}">
                    <a class="sc-friend-avatar" href="{{ $design->url('cool-profile-page','main','index',$f->fdId) }}" aria-label="{lang 'View profile'}">
                        <img src="{{ $design->getUserAvatar($f->username, $f->sex, 150) }}" alt="{% escape($f->username) %}" loading="lazy" onerror="this.onerror=null;this.src='{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png';" />
                    </a>

                    <div class="sc-friend-info">
                        <a class="sc-friend-name" href="{{ $design->url('cool-profile-page','main','index',$f->fdId) }}">
                            {% escape($f->username) %}
                        </a>
                        <div class="sc-friend-meta">
                            {if $f->pending == FriendCoreModel::PENDING_REQUEST}
                                <span class="sc-friend-pill is-pending">{lang 'Pending'}</span>
                            {else}
                                <span class="sc-friend-pill">{lang 'Friend'}</span>
                            {/if}
                        </div>
                    </div>

                    {if $is_user_auth AND $sess_member_id == $member_id}
                        <div class="sc-friend-actions">
                            {if $sess_member_id == $f->friendId AND $f->pending == FriendCoreModel::PENDING_REQUEST}
                                <a class="sc-friend-button is-primary" href="javascript:void(0)" onclick="friend('approval',{% $f->fdId %},'{csrf_token}')">{lang 'Approve'}</a>
                            {/if}
                            <a class="sc-friend-button" href="javascript:void(0)" onclick="friend('delete',{% $f->fdId %},'{csrf_token}')">
                                {if $f->pending == FriendCoreModel::PENDING_REQUEST}
                                    {lang 'Decline'}
                                {else}
                                    {lang 'Delete'}
                                {/if}
                            </a>
                        </div>
                    {/if}
                </article>
            {/each}
        </div>

        {main_include 'page_nav.inc.tpl'}
    {else}
        <p class="sc-friend-empty">{error}</p>
    {/if}
</div>

{literal}
<script>
    (function() {
        var placeholder = '{/literal}{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png{literal}';
        var avatars = document.querySelectorAll('.sc-friend-avatar img');

        for (var i = 0; i < avatars.length; i++) {
            var img = avatars[i];
            var src = img.getAttribute('src') || '';

            if (!src || src.indexOf('_no_picture') !== -1) {
                img.setAttribute('src', placeholder);
            }
        }
    })();
</script>
{/literal}
