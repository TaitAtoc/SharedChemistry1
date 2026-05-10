<style scoped="scoped">
    header .ad_468_60,
    .ad_468_60{display:none!important;height:0!important;min-height:0!important;margin:0!important;padding:0!important;overflow:hidden!important}
    header #headings{max-width:1180px;margin:0 auto;padding:0 15px}
    main#content{max-width:1180px;margin:0 auto;padding:8px 15px 0!important}
    .navbar .container{max-width:1180px;width:100%}
    .navbar-collapse{padding-left:0;padding-right:0}
    .navbar-nav > li > a{padding-left:8px!important;padding-right:8px!important;font-size:13px;white-space:nowrap}
    .sc-dashboard{margin-top:-2px;color:#f4f1f6}
    .sc-dashboard-card{background:#17151c;border:1px solid rgba(255,255,255,.08);border-radius:8px;box-shadow:0 14px 36px rgba(0,0,0,.28);padding:16px;margin-bottom:18px}
    .sc-dashboard-card h2{margin:0 0 10px;color:#fff;font-size:20px;line-height:1.25;border:0;text-decoration:none}
    .sc-dashboard-card p{margin:0 0 14px;color:#d9d2dc;font-size:14px;line-height:1.45}
    .sc-profile-card{text-align:left}
    .sc-profile-card h2{margin-bottom:14px}
    .sc-public-photo-row{display:grid;grid-template-columns:repeat(5,minmax(0,1fr));gap:10px;margin-bottom:14px}
    .sc-public-photo-slot{display:flex;align-items:center;justify-content:center;min-height:132px;border:1px solid rgba(255,255,255,.12);border-radius:8px;background:#100f14;color:#bdb3c1;font-size:13px;text-align:center;overflow:hidden}
    .sc-public-photo-slot.is-avatar{background:#0e0d12}
    .sc-public-photo-slot .picture_block{margin:0!important;max-width:100%}
    .sc-public-photo-slot .picture_block img{display:block;border-radius:8px;max-width:100%;height:auto;border:0}
    .sc-profile-actions{list-style:none;margin:0;padding:0;display:flex;flex-wrap:wrap;gap:8px}
    .sc-profile-actions li{margin:0;padding:0}
    .sc-profile-actions a,
    .sc-dashboard-button{display:inline-flex;align-items:center;justify-content:center;border-radius:6px;padding:9px 12px;background:#24212b;border:1px solid rgba(255,255,255,.1);color:#f5edf6;text-align:center;font-size:13px;line-height:1.25;text-decoration:none!important}
    .sc-profile-actions a:hover,
    .sc-dashboard-button:hover{background:#2e2935;color:#fff;text-decoration:none}
    .sc-profile-actions i{margin-right:6px;color:#ff4fa0}
    .sc-profile-actions .sc-main-profile-link,
    .sc-dashboard-button.is-primary{background:#ff2f8d;border-color:#ff2f8d;color:#fff;font-weight:bold}
    .sc-profile-actions .sc-main-profile-link:hover,
    .sc-dashboard-button.is-primary:hover{background:#ff4fa0;border-color:#ff4fa0;color:#fff}
    .sc-profile-actions .sc-main-profile-link i{color:#fff}
    .sc-dashboard-grid{display:grid;grid-template-columns:repeat(3,minmax(0,1fr));gap:16px}
    .sc-dashboard-actions{display:flex;flex-wrap:wrap;gap:8px}
    @media (min-width:768px){.navbar-toggle{display:none!important}}
    @media (max-width:991px){.navbar-nav > li > a{padding-left:6px!important;padding-right:6px!important;font-size:12px}}
    @media (max-width:767px){header #headings,main#content{padding-left:10px!important;padding-right:10px!important}.navbar-toggle{display:block!important}.sc-dashboard-card{padding:14px}.sc-public-photo-row{grid-template-columns:repeat(2,minmax(0,1fr))}.sc-dashboard-grid{grid-template-columns:1fr}.sc-profile-actions a,.sc-dashboard-button{width:100%}}
</style>

<div class="row sc-dashboard">
    <div class="left col-xs-12">
        <div class="sc-dashboard-card sc-profile-card">
            <h2>{lang 'Our Profile'}</h2>
            <div class="sc-public-photo-row">
                <div class="sc-public-photo-slot is-avatar">
            {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}
                </div>
                <div class="sc-public-photo-slot">{lang 'Public photo 2'}</div>
                <div class="sc-public-photo-slot">{lang 'Public photo 3'}</div>
                <div class="sc-public-photo-slot">{lang 'Public photo 4'}</div>
                <div class="sc-public-photo-slot">{lang 'Public photo 5'}</div>
            </div>

            <ul class="sc-profile-actions">
                <li>
                    <a class="sc-main-profile-link" href="{% (new UserCore)->getProfileLink($username) %}" title="{lang 'View Public Profile'}">
                        <i class="fa fa-user fa-fw"></i> {lang 'View Public Profile'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','edit') }}" title="{lang 'Edit My Profile'}">
                        <i class="fa fa-cog fa-fw"></i> {lang 'Edit Profile'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','avatar') }}" title="{lang 'Change My Profile Photo'}">
                        <i class="fa fa-upload"></i> {lang 'Profile Photo'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('picture','main','albums',$username) }}" title="{lang 'Public Photos'}" data-load="ajax">
                        <i class="fa fa-picture-o"></i> {lang 'Public Photos'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','setting','edit') }}" title="{lang 'Private Photos and Videos'}">
                        <i class="fa fa-lock"></i> {lang 'Private Photos & Videos'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('mail','main','inbox') }}" title="{lang 'Messages'}">
                        <i class="fa fa-envelope-o"></i> {lang 'Messages'}
                    </a>
                </li>
                <li>
                    <a href="{{ $design->url('user','account','index') }}" title="{lang 'Account'}">
                        <i class="fa fa-user"></i> {lang 'Account'}
                    </a>
                </li>
            </ul>
        </div>
    </div>

    <div class="left col-xs-12">
        <div class="sc-dashboard-grid">
            <div class="sc-dashboard-card">
                <h2>{lang 'Profile Summary'}</h2>
                <p>{lang 'Review the details other couples will see on your public profile.'}</p>
                <a class="sc-dashboard-button is-primary" href="{{ $design->url('user','setting','edit') }}">{lang 'Edit Couple Profile'}</a>
            </div>

            <div class="sc-dashboard-card">
                <h2>{lang 'Public Profile'}</h2>
                <p>{lang 'Check how your couple profile appears to other members.'}</p>
                <a class="sc-dashboard-button is-primary" href="{% (new UserCore)->getProfileLink($username) %}">{lang 'View Public Profile'}</a>
            </div>

            <div class="sc-dashboard-card">
                <h2>{lang 'Private Media'}</h2>
                <p>{lang 'Add private photos and videos you only share by choice.'}</p>
                <div class="sc-dashboard-actions">
                    <a class="sc-dashboard-button" href="{{ $design->url('user','setting','edit') }}">{lang 'Private Photos'}</a>
                    <a class="sc-dashboard-button" href="{{ $design->url('user','setting','edit') }}">{lang 'Private Videos'}</a>
                </div>
            </div>
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
