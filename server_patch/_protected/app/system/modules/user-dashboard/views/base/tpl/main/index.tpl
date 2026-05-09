<div class="row">
    {* "My Profile" block don't really fit well on small mobile devices, so ignore it if it's the case *}
    {if !$browser->isMobile()}
        <div class="left col-xs-12 col-sm-4 col-md-3">
            <h2>{lang 'My Profile'}</h2>
            <div class="picture_block" itemscope="itemscope" itemtype="http://schema.org/Person">
                <a itemprop="image" aria-hidden="true" href="{% $public_avatar_url %}" title="{% ucfirst($username) %}" data-popup="image">
                    <img src="{% $public_avatar_url %}" alt="{% ucfirst($username) %}" title="{% ucfirst($first_name) %}" class="img_picture" />
                </a>
            </div>

            <div class="public-photos-strip">
                <h3>{lang 'Public Photos'}</h3>
                <div class="public-photos-grid">
                    <a class="public-photo-tile" href="{% $public_avatar_url %}" title="{lang 'Profile Photo'}" data-popup="image">
                        <img src="{% $public_avatar_url %}" alt="{lang 'Profile Photo'}" />
                    </a>

                    {each $photo in $public_photos}
                        <a class="public-photo-tile" href="{{ $design->url('picture', 'main', 'photo', "$photo->username,$photo->albumId,$photo->title,$photo->pictureId") }}" title="{% $photo->title %}">
                            <img src="{url_data_sys_mod}picture/img/{% $photo->username %}/{% $photo->albumId %}/{% str_replace('original', '400', $photo->file) %}" alt="{% $photo->title %}" />
                        </a>
                    {/each}
                </div>

                {if $is_picture_enabled}
                    <p class="public-photos-manage">
                        <a href="{{ $design->url('picture', 'main', 'addalbum') }}" title="{lang 'Add Photos'}">
                            <i class="fa fa-plus-circle"></i> {lang 'Add Photos'}
                        </a>
                        <a href="{{ $design->url('picture', 'main', 'albums', $username) }}" title="{lang 'Manage Photos'}">
                            <i class="fa fa-picture-o"></i> {lang 'Manage Photos'}
                        </a>
                    </p>
                {/if}
            </div>

            <style scoped="scoped">
                .public-photos-strip{margin:15px 0}
                .public-photos-strip h3{margin:0 0 8px;font-size:15px}
                .public-photos-grid{display:grid;grid-template-columns:repeat(5,1fr);gap:5px}
                .public-photo-tile{display:block;position:relative;overflow:hidden;background:#222;border-radius:3px;aspect-ratio:1/1}
                .public-photo-tile img{width:100%;height:100%;object-fit:cover;display:block}
                .public-photos-manage{margin:8px 0 0;font-size:12px}
                .public-photos-manage a{display:inline-block;margin-right:8px}
            </style>

            <ul>
                <li>
                    <a href="{% (new UserCore)->getProfileLink($username) %}" title="{lang 'View Public Profile'}">
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
    {/if}

    <div class="left col-xs-12 col-sm-6 col-md-6">
        <h2 class="center underline">{lang 'The Latest Users'}</h2>
        {{ $userDesignModel->profilesBlock() }}

        {if $is_friend_enabled}
            <h2 class="center underline">{lang 'My friends'}</h2>
            <div class="content" id="friend">
                <script>
                    var url_friend_block = '{{ $design->url('friend','main','index',$username) }}';
                    $('#friend').load(url_friend_block + ' #friend_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        <h2 class="center underline">{lang 'Visitors who visited my profile'}</h2>
        <div class="content" id="visitor">
            <script>
                var url_visitor_block = '{{ $design->url('user','visitor','index',$username) }}';
                $('#visitor').load(url_visitor_block + ' #visitor_block');
            </script>
        </div>
        <div class="clear"></div>

        {if $is_picture_enabled}
            <h2 class="center underline">{lang 'My photo albums'}</h2>
            <div class="content" id="picture">
                <script>
                    var url_picture_block = '{{ $design->url('picture','main','albums',$username) }}';
                    $('#picture').load(url_picture_block + ' #picture_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        {if $is_video_enabled}
            <h2 class="center underline">{lang 'My video albums'}</h2>
            <div class="content" id="video">
                <script>
                    var url_video_block = '{{ $design->url('video','main','albums',$username) }}';
                    $('#video').load(url_video_block + ' #video_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        {if $is_forum_enabled}
            <h2 class="center underline">{lang 'My discussions'}</h2>
            <div class="content" id="forum">
                <script>
                    var url_forum_block = '{{ $design->url('forum','forum','showpostbyprofile',$username) }}';
                    $('#forum').load(url_forum_block + ' #forum_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        {if $is_note_enabled}
            <h2 class="center underline">{lang 'My notes'}</h2>
            <div class="content" id="note">
                <script>
                    var url_note_block = '{{ $design->url('note','main','author',$username) }}';
                    $('#note').load(url_note_block + ' #note_block');
                </script>
            </div>
            <div class="clear"></div>
        {/if}

        <h2 class="center underline italic s_tMarg">
            {lang 'Quick User Search'}
        </h2>
        {{ SearchUserCoreForm::quick() }}
    </div>

    <div class="left col-xs-12 col-sm-2 col-md-3">
        <h2>{lang 'The Latest News'}</h2>
        <div id="wall"></div>
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
