{literal}
<style>
    main#content .sc-meet-people,
    main#content .sc-meet-people * {
        box-sizing: border-box;
    }

    main#content:has(.sc-meet-people) {
        width: min(1280px, calc(100vw - 48px)) !important;
        max-width: none !important;
        margin-left: auto !important;
        margin-right: auto !important;
        padding-top: 140px !important;
        padding-bottom: 80px !important;
    }

    main#content .sc-meet-people {
        display: grid;
        grid-template-columns: minmax(260px, 285px) minmax(0, 1fr);
        gap: 18px;
        align-items: start;
        width: 100%;
        max-width: 1280px;
        margin: 0 auto;
        color: #f7f3ef;
    }

    main#content .sc-meet-search {
        position: sticky;
        top: 86px;
        min-width: 0;
        padding: 18px;
        border: 1px solid rgba(247, 243, 239, .08);
        border-radius: 10px;
        background: #17181d;
        box-shadow: 0 16px 34px rgba(0, 0, 0, .24);
    }

    main#content .sc-meet-search h2 {
        margin: 0 0 14px;
        color: #f7f3ef;
        font-size: 20px;
        line-height: 1.25;
        letter-spacing: 0;
    }

    main#content .sc-meet-search form,
    main#content .sc-meet-search fieldset,
    main#content .sc-meet-search .pfbc-form {
        display: grid !important;
        gap: 12px !important;
        width: 100% !important;
        max-width: none !important;
        margin: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        background: transparent !important;
        box-shadow: none !important;
    }

    main#content .sc-meet-search #form_search #pfbc-element-0,
    main#content .sc-meet-search #form_search > p.center {
        display: none !important;
    }

    main#content .sc-meet-search div[id^="pfbc-element-"],
    main#content .sc-meet-search .pfbc-element,
    main#content .sc-meet-search .pfbc-buttons {
        width: 100% !important;
        max-width: none !important;
        margin: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        background: transparent !important;
        text-align: left !important;
    }

    main#content .sc-meet-search .pfbc-label {
        margin: 0 0 5px !important;
        padding: 0 !important;
    }

    main#content .sc-meet-search label,
    main#content .sc-meet-search .pfbc-label label {
        display: block !important;
        margin: 0 !important;
        color: #b8b3b0 !important;
        font-size: 12px !important;
        font-weight: 700 !important;
        line-height: 1.25 !important;
        text-align: left !important;
    }

    main#content .sc-meet-search input[type="text"],
    main#content .sc-meet-search input[type="number"],
    main#content .sc-meet-search select {
        width: 100% !important;
        min-height: 38px !important;
        box-sizing: border-box !important;
        border: 1px solid rgba(247, 243, 239, .14) !important;
        border-radius: 8px !important;
        background: #101114 !important;
        color: #f7f3ef !important;
        box-shadow: none !important;
        text-shadow: none !important;
    }

    main#content .sc-meet-search input[type="checkbox"] {
        accent-color: #ec0868;
    }

    main#content .sc-meet-search .pfbc-buttons button,
    main#content .sc-meet-search button,
    main#content .sc-meet-search input[type="submit"] {
        display: inline-flex !important;
        align-items: center !important;
        justify-content: center !important;
        width: 100% !important;
        min-height: 40px !important;
        margin: 0 !important;
        padding: 10px 14px !important;
        border: 0 !important;
        border-radius: 10px !important;
        background: #ec0868 !important;
        background-image: none !important;
        color: #f7f3ef !important;
        font-weight: 700 !important;
        text-align: center !important;
        text-shadow: none !important;
        box-shadow: none !important;
    }

    main#content .sc-meet-search .pfbc-buttons button:hover,
    main#content .sc-meet-search button:hover,
    main#content .sc-meet-search input[type="submit"]:hover,
    main#content .sc-meet-search .pfbc-buttons button:focus,
    main#content .sc-meet-search button:focus,
    main#content .sc-meet-search input[type="submit"]:focus {
        background: #c200fb !important;
        color: #f7f3ef !important;
        outline: none !important;
    }

    main#content .sc-meet-results {
        min-width: 0;
        width: 100%;
    }

    main#content .sc-meet-grid {
        display: grid;
        grid-template-columns: repeat(auto-fill, minmax(170px, 1fr));
        gap: 16px;
        width: 100%;
        min-width: 0;
        margin: 0;
        padding: 0;
        list-style: none;
    }

    main#content .sc-meet-card {
        min-width: 0;
        overflow: hidden;
        border: 1px solid rgba(247, 243, 239, .08);
        border-radius: 10px;
        background: #17181d;
        color: #f7f3ef;
        box-shadow: 0 12px 28px rgba(0, 0, 0, .22);
    }

    main#content .sc-meet-card figure {
        display: grid;
        gap: 9px;
        margin: 0;
        padding: 10px;
    }

    main#content .sc-meet-avatar {
        position: relative;
        display: flex;
        align-items: center;
        justify-content: center;
        width: 100%;
        aspect-ratio: 1 / 1;
        overflow: hidden;
        border-radius: 8px;
        background: #101114;
    }

    main#content .sc-meet-avatar img,
    main#content .sc-meet-avatar .avatar,
    main#content .sc-meet-avatar .picture_block {
        display: block !important;
        width: 100% !important;
        max-width: 100% !important;
        height: 100% !important;
        max-height: none !important;
        margin: 0 !important;
        border: 0 !important;
        border-radius: 8px !important;
        object-fit: cover !important;
        object-position: center 35% !important;
        box-shadow: none !important;
    }

    main#content .sc-meet-avatar .picture_block a,
    main#content .sc-meet-avatar a {
        display: block !important;
        width: 100% !important;
        height: 100% !important;
    }

    main#content .sc-meet-status {
        position: absolute;
        right: 8px;
        top: 8px;
        z-index: 2;
    }

    main#content .sc-meet-status .user_status {
        display: block !important;
        width: 14px !important;
        height: 14px !important;
        margin: 0 !important;
        padding: 0 !important;
    }

    main#content .sc-meet-status .user_status span {
        display: block !important;
        width: 14px !important;
        height: 14px !important;
        overflow: hidden !important;
        border: 2px solid #101114 !important;
        border-radius: 999px !important;
        background: #ff2d20 !important;
        color: transparent !important;
        font-size: 0 !important;
        line-height: 0 !important;
        text-indent: -999px !important;
        box-shadow: 0 0 0 1px rgba(247, 243, 239, .12), 0 3px 8px rgba(0, 0, 0, .3) !important;
    }

    main#content .sc-meet-status .user_status span.green {
        background: #18e35f !important;
    }

    main#content .sc-meet-status .user_status span.red,
    main#content .sc-meet-status .user_status span.gray,
    main#content .sc-meet-status .user_status span.orange {
        background: #ff2d20 !important;
    }

    main#content .sc-meet-meta {
        display: grid;
        gap: 5px;
        min-width: 0;
        text-align: center;
    }

    main#content .sc-meet-name {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 5px;
        min-width: 0;
        color: #f7f3ef;
        font-size: 14px;
        font-weight: 800;
        line-height: 1.2;
        text-decoration: none;
    }

    main#content .sc-meet-name:hover,
    main#content .sc-meet-name:focus {
        color: #ffbc0a;
        text-decoration: none;
    }

    main#content .sc-meet-location {
        display: inline-flex;
        align-items: center;
        justify-content: center;
        gap: 5px;
        color: #b8b3b0;
        font-size: 12px;
        line-height: 1.25;
    }

    main#content .sc-meet-location img {
        width: 16px;
        height: auto;
        margin: 0;
        border: 0;
        box-shadow: none;
    }

    main#content .sc-meet-empty {
        margin: 0;
        padding: 22px;
        border: 1px solid rgba(247, 243, 239, .08);
        border-radius: 10px;
        background: #17181d;
        color: #b8b3b0;
        text-align: center;
    }

    main#content .sc-meet-results .pagination,
    main#content .sc-meet-results .pages {
        margin-top: 18px;
    }

    @media (max-width: 900px) {
        main#content .sc-meet-people {
            grid-template-columns: minmax(220px, 260px) minmax(0, 1fr);
            gap: 16px;
        }

        main#content .sc-meet-grid {
            grid-template-columns: repeat(auto-fill, minmax(150px, 1fr));
        }
    }

    @media (max-width: 700px) {
        main#content:has(.sc-meet-people) {
            width: calc(100vw - 24px) !important;
            padding-top: 100px !important;
            padding-bottom: 70px !important;
        }

        main#content .sc-meet-people {
            grid-template-columns: 1fr;
        }

        main#content .sc-meet-search {
            position: static;
        }
    }
</style>
{/literal}

<div class="sc-meet-people">
    <aside class="sc-meet-search" role="search">
        <h2>{lang 'Quick Search'}</h2>
        {{ SearchUserCoreForm::quick(PH7_WIDTH_SEARCH_FORM) }}
    </aside>

    <section class="sc-meet-results">
        {if empty($users)}
            <p class="sc-meet-empty">{lang 'Whoops! No users found.'}</p>
        {else}
            <div class="sc-meet-grid">
                {each $user in $users}
                    {{ $country_name = t($user->country) }}
                    {{ $age = UserBirthDateCore::getAgeFromBirthDate($user->birthDate) }}

                    {* Sex Icon *}
                    {if $user->sex === GenderTypeUserCore::MALE}
                        {{ $sex_ico = ' <span class=green>&#9794;</span>' }}
                    {elseif $user->sex === GenderTypeUserCore::FEMALE}
                        {{ $sex_ico = ' <span class=pink>&#9792;</span>' }}
                    {else}
                        {{ $sex_ico = '' }}
                    {/if}

                    <article class="sc-meet-card">
                        <figure>
                            <div class="sc-meet-avatar">
                                <div class="sc-meet-status">
                                    {{ UserDesignCoreModel::userStatus($user->profileId) }}
                                </div>
                                {{ $avatarDesign->get($user->username, $user->firstName, $user->sex, 150) }}
                            </div>

                            <figcaption class="sc-meet-meta">
                                <a class="sc-meet-name" href="{% (new UserCore)->getProfileLink($user->username) %}" title="{lang 'Name: %0%', $user->firstName}<br> {lang 'Gender: %0% %1%', t($user->sex), $sex_ico}<br> {lang 'Seeking: %0%', t($user->matchSex)}<br> {lang 'Age: %0%', $age}<br> {lang 'From: %0%', $country_name}<br> {lang 'City: %0%', $str->upperFirst($user->city)}<br> {lang 'State: %0%', $str->upperFirst($user->state)}">
                                    {% $str->extract($user->username, PH7_MAX_USERNAME_LENGTH_SHOWN) %}
                                </a>
                                <span class="sc-meet-location">
                                    <img src="{{ $design->getSmallFlagIcon($user->country) }}" alt="{% $country_name %}" title="{lang 'From %0%', $country_name}" />
                                    {% $country_name %}
                                </span>
                            </figcaption>
                        </figure>

                        {if $is_admin_auth}
                            <p class="small center">
                                <a href="{{ $design->url(PH7_ADMIN_MOD,'user','loginuseras',$user->profileId) }}" title="{lang 'Login As a member'}">{lang 'Login'}</a>
                                {if $user->ban == UserCore::BAN_STATUS}
                                    {{ $design->popupLinkConfirm(t('UnBan'), PH7_ADMIN_MOD, 'user', 'unban', $user->profileId) }}
                                {else}
                                    {{ $design->popupLinkConfirm(t('Ban'), PH7_ADMIN_MOD, 'user', 'ban', $user->profileId) }}
                                {/if}
                                {{ $design->popupLinkConfirm(t('Delete'), PH7_ADMIN_MOD, 'user', 'delete', $user->profileId.'_'.$user->username) }}
                                {{ $design->ip($user->ip) }}
                            </p>
                        {/if}
                    </article>
                {/each}
            </div>

            {main_include 'page_nav.inc.tpl'}
        {/if}
    </section>
</div>

{literal}
<script>
    (function () {
        var meetPeople = document.querySelector('main#content .sc-meet-people');
        var placeholder = '{/literal}{url_tpl_img}sharedchemistry/SharedChemistyAvatar.png{literal}';

        if (!meetPeople) {
            return;
        }

        meetPeople.querySelectorAll('.sc-meet-avatar img').forEach(function (image) {
            var imageSource = image.getAttribute('src') || '';

            if (/(^|\/)(male|female|couple|visitor|admin|ghost)_no_picture(?:-\d+)?\.(?:svg|png|gif|jpe?g)(?:[?#].*)?$/i.test(imageSource)) {
                image.setAttribute('src', placeholder);
            }
        });
    }());
</script>
{/literal}
