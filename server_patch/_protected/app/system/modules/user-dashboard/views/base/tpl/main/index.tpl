<div class="row sc-dashboard">
    <div class="left col-xs-12">
        <div class="sc-dashboard-card sc-profile-card">
            <h2>{lang 'Our Profile'}</h2>
            <div class="sc-public-photo-row">
                <div class="sc-public-photo-slot is-avatar">
                    <div class="sc-public-photo-frame">
                        {{ $avatarDesign->lightBox($username, $first_name, $sex, 400) }}
                    </div>
                    <span class="sc-public-photo-label">{lang 'Main Photo'}</span>
                </div>
                <div class="sc-public-photo-slot">
                    <div class="sc-public-photo-frame">
                        <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public Photo 2'}" class="sc-public-photo-placeholder" />
                    </div>
                    <span class="sc-public-photo-label">{lang 'Public Photo 2'}</span>
                </div>
                <div class="sc-public-photo-slot">
                    <div class="sc-public-photo-frame">
                        <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public Photo 3'}" class="sc-public-photo-placeholder" />
                    </div>
                    <span class="sc-public-photo-label">{lang 'Public Photo 3'}</span>
                </div>
                <div class="sc-public-photo-slot">
                    <div class="sc-public-photo-frame">
                        <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public Photo 4'}" class="sc-public-photo-placeholder" />
                    </div>
                    <span class="sc-public-photo-label">{lang 'Public Photo 4'}</span>
                </div>
                <div class="sc-public-photo-slot">
                    <div class="sc-public-photo-frame">
                        <img src="{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png" alt="{lang 'Public Photo 5'}" class="sc-public-photo-placeholder" />
                    </div>
                    <span class="sc-public-photo-label">{lang 'Public Photo 5'}</span>
                </div>
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
