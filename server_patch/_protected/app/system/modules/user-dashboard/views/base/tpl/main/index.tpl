<style scoped="scoped">
    header .ad_468_60,
    .ad_468_60{display:none!important;height:0!important;min-height:0!important;margin:0!important;padding:0!important;overflow:hidden!important}
    header #headings{max-width:1180px;margin:0 auto;padding:0 15px}
    main#content{max-width:1180px;margin:0 auto;padding:8px 15px 0!important}
    .navbar .container{max-width:1180px;width:100%}
    .navbar-brand#logo{height:auto;padding:7px 15px 6px}
    .navbar-brand#logo h1{line-height:1}
    .navbar #logo .sharedchemistry-logo-link{display:block!important;width:230px!important;height:58px!important;margin:0!important;padding:0!important;overflow:hidden!important;background:url("{url_tpl_img}sharedchemistry/sharedchemistry-header-logo.png") left center / contain no-repeat!important;text-indent:-9999px!important}
    .navbar #logo .sharedchemistry-header-logo,
    .navbar #logo .sharedchemistry-logo-link span{display:none!important}
    .navbar-collapse{padding-left:0;padding-right:0}
    .navbar-nav > li > a{padding-left:8px!important;padding-right:8px!important;font-size:13px;white-space:nowrap}
    .sc-dashboard{margin-top:-2px;color:#f4f1f6}
    .sc-dashboard-card{background:#17151c;border:1px solid rgba(255,255,255,.08);border-radius:8px;box-shadow:0 14px 36px rgba(0,0,0,.28);padding:16px;margin-bottom:18px}
    .sc-dashboard-card h2{margin:0 0 14px;color:#fff;font-size:20px;line-height:1.25;border:0;text-decoration:none}
    .sc-profile-card{text-align:center}
    .sc-profile-card h2{margin-bottom:10px}
    .sc-profile-card .picture_block{margin:0 auto 10px}
    .sc-profile-card .picture_block img{border-radius:8px;max-width:100%;height:auto;border:1px solid rgba(255,255,255,.12)}
    .sc-profile-actions{list-style:none;margin:12px 0 0;padding:0;display:grid;grid-template-columns:1fr;gap:8px}
    .sc-profile-actions li{margin:0;padding:0}
    .sc-profile-actions a{display:block;border-radius:6px;padding:9px 10px;background:#24212b;border:1px solid rgba(255,255,255,.1);color:#f5edf6;text-align:left;font-size:13px;line-height:1.25}
    .sc-profile-actions a:hover{background:#2e2935;color:#fff;text-decoration:none}
    .sc-profile-actions i{margin-right:6px;color:#ff4fa0}
    .sc-profile-actions .sc-main-profile-link{background:#ff2f8d;border-color:#ff2f8d;color:#fff;text-align:center;font-weight:bold;font-size:14px}
    .sc-profile-actions .sc-main-profile-link:hover{background:#ff4fa0;border-color:#ff4fa0;color:#fff}
    .sc-profile-actions .sc-main-profile-link i{color:#fff}
    .sc-search-card h2,
    .sc-news-card h2{text-align:left}
    .sc-search-card form{margin:0}
    .sc-search-card input,
    .sc-search-card select,
    .sc-search-card textarea{max-width:100%;background:#100f14!important;color:#fff!important;border:1px solid rgba(255,255,255,.16)!important;border-radius:5px!important}
    .sc-search-card input[type="submit"],
    .sc-search-card button{background:#ff2f8d!important;border-color:#ff2f8d!important;color:#fff!important;border-radius:6px!important}
    .sc-news-card #wall{min-height:120px}
    @media (min-width:768px){.navbar-toggle{display:none!important}.sc-profile-actions{grid-template-columns:1fr 1fr}.sc-profile-actions li:first-child{grid-column:1/-1}}
    @media (max-width:991px){.navbar-nav > li > a{padding-left:6px!important;padding-right:6px!important;font-size:12px}.navbar #logo .sharedchemistry-logo-link{width:190px!important;height:52px!important}}
    @media (max-width:767px){header #headings,main#content{padding-left:10px!important;padding-right:10px!important}.navbar #logo .sharedchemistry-logo-link{width:172px!important;height:48px!important}.navbar-toggle{display:block!important}.sc-dashboard-card{padding:14px}}
</style>

<div class="row sc-dashboard">
    {* "My Profile" block don't really fit well on small mobile devices, so ignore it if it's the case *}
    {if !$browser->isMobile()}
        <div class="left col-xs-12 col-sm-4 col-md-4">
            <div class="sc-dashboard-card sc-profile-card">
            <h2>{lang 'My Profile'}</h2>
            {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}

            <ul class="sc-profile-actions">
                <li>
                    <a class="sc-main-profile-link" href="{% (new UserCore)->getProfileLink($username) %}" title="{lang 'View Public Profile'}">
                        <i class="fa fa-user fa-fw"></i> {lang 'View Public Profile'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','avatar') }}" title="{lang 'Change My Profile Photo'}">
                        <i class="fa fa-upload"></i> {lang 'Profile Photo'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','edit') }}" title="{lang 'Edit My Profile'}">
                        <i class="fa fa-cog fa-fw"></i> {lang 'Edit Profile'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','design') }}" title="{lang 'My Wallpaper'}">
                        <i class="fa fa-picture-o"></i> {lang 'Design Profile'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','notification') }}" title="{lang 'My Email Notification Settings'}">
                        <i class="fa fa-envelope-o"></i> {lang 'Notifications'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','privacy') }}" title="{lang 'My Privacy Settings'}">
                        <i class="fa fa-user-secret"></i> {lang 'Privacy Setting'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('payment','main','info') }}" title="{lang 'My Membership'}">
                        <i class="fa fa-credit-card"></i> {lang 'Membership Details'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','password') }}" title="{lang 'Change My Password'}">
                        <i class="fa fa-key fa-fw"></i> {lang 'Change Password'}
                    </a>
                </li>
            </ul>
            </div>
        </div>
    {/if}

    <div class="left col-xs-12 col-sm-5 col-md-5">
        <div class="sc-dashboard-card sc-search-card">
            <h2>{lang 'Search Couples'}</h2>
            {{ SearchUserCoreForm::quick() }}
        </div>
    </div>

    <div class="left col-xs-12 col-sm-3 col-md-3">
        <div class="sc-dashboard-card sc-news-card">
            <h2>{lang 'The Latest News'}</h2>
            <div id="wall"></div>
        </div>
    </div>
</div>

<script>
    $(document).ready(function() {
        $('ul.zoomer_pic').slick({
            dots: true,
            infinite: false,
            slidesToShow: 6,
            slidesToScroll: 6,
            adaptiveHeight: true
        })
    });
</script>
