{literal}
<style>
    body{background:#101114!important}
    main#content{width:min(100%,calc(100vw - 40px))!important;max-width:1440px!important;margin:0 auto!important;padding:140px 0 96px!important;background:transparent!important;border:0!important;box-shadow:none!important}
    .sc-admin-users,
    .sc-admin-users *{box-sizing:border-box}
    .sc-admin-users{display:grid;gap:16px;color:#f7f3ef}
    .sc-admin-users-card{overflow:hidden;border:1px solid rgba(247,243,239,.1);border-radius:12px;background:#17181d;box-shadow:0 18px 44px rgba(0,0,0,.3)}
    .sc-admin-users-head{display:flex;align-items:flex-end;justify-content:space-between;gap:18px;padding:22px 24px;border-bottom:1px solid rgba(247,243,239,.08);background:#17181d}
    .sc-admin-users-head h1{margin:0 0 6px;color:#f7f3ef;font-size:30px;font-weight:700;line-height:1.15}
    .sc-admin-users-head p{margin:0;color:#b8b3b0;font-size:14px;line-height:1.45}
    .sc-admin-users-scroll{width:100%;overflow-x:auto;background:#101114}
    .sc-admin-users table{width:100%!important;min-width:1320px!important;margin:0!important;border-collapse:separate!important;border-spacing:0 8px!important;background:#101114!important;color:#f7f3ef!important}
    .sc-admin-users thead th{position:sticky;top:0;z-index:1;padding:12px 10px!important;border:0!important;background:#17181d!important;color:#b8b3b0!important;font-size:11px!important;font-weight:700!important;line-height:1.25!important;text-transform:uppercase;white-space:nowrap}
    .sc-admin-users tbody tr{background:#202127!important}
    .sc-admin-users tbody td{padding:12px 10px!important;border-top:1px solid rgba(247,243,239,.08)!important;border-bottom:1px solid rgba(247,243,239,.08)!important;background:#202127!important;color:#f7f3ef!important;font-size:13px!important;line-height:1.35!important;vertical-align:middle!important}
    .sc-admin-users tbody td:first-child{border-left:1px solid rgba(247,243,239,.08)!important;border-radius:10px 0 0 10px!important}
    .sc-admin-users tbody td:last-child{border-right:1px solid rgba(247,243,239,.08)!important;border-radius:0 10px 10px 0!important}
    .sc-admin-users tfoot th{padding:14px 10px!important;border:0!important;background:#17181d!important;color:#f7f3ef!important;vertical-align:middle!important}
    .sc-admin-users a{color:#ffbc0a!important;text-decoration:none!important;text-shadow:none!important}
    .sc-admin-users a:hover,
    .sc-admin-users a:focus{color:#f7f3ef!important;text-decoration:none!important}
    .sc-admin-users .gray,
    .sc-admin-users .small{color:#b8b3b0!important}
    .sc-admin-users input[type="checkbox"]{width:16px;height:16px;margin:0!important;accent-color:#ec0868}
    .sc-admin-user-email{max-width:220px;overflow:hidden;text-overflow:ellipsis;white-space:nowrap}
    .sc-admin-user-person{min-width:150px}
    .sc-admin-user-avatar img,
    .sc-admin-user-ip img{display:inline-block!important;max-width:42px!important;height:auto!important;border:0!important;border-radius:6px!important;box-shadow:none!important;vertical-align:middle!important}
    .sc-admin-user-actions{min-width:260px!important}
    .sc-admin-user-actions-inner{display:flex;flex-wrap:wrap;gap:7px;align-items:center;justify-content:flex-start}
    .sc-admin-user-actions a,
    .sc-admin-users tfoot .btn,
    .sc-admin-users tfoot button{display:inline-flex!important;align-items:center!important;justify-content:center!important;min-height:30px!important;padding:6px 9px!important;border:1px solid rgba(247,243,239,.16)!important;border-radius:8px!important;background:#17181d!important;background-image:none!important;color:#f7f3ef!important;font-size:11px!important;font-weight:700!important;line-height:1.15!important;text-align:center!important;text-decoration:none!important;text-shadow:none!important;box-shadow:none!important;white-space:nowrap!important}
    .sc-admin-user-actions a:hover,
    .sc-admin-user-actions a:focus,
    .sc-admin-users tfoot .btn:hover,
    .sc-admin-users tfoot .btn:focus,
    .sc-admin-users tfoot button:hover,
    .sc-admin-users tfoot button:focus{border-color:#ec0868!important;background:#2a1723!important;color:#fff!important}
    .sc-admin-user-actions .is-danger a,
    .sc-admin-users tfoot .btn-danger{border-color:rgba(236,8,104,.7)!important;background:#2a1723!important;color:#fff!important}
    .sc-admin-user-actions .is-primary a,
    .sc-admin-users tfoot .is-primary{border-color:transparent!important;background:#ec0868!important;background-image:linear-gradient(90deg,#ec0868,#c200fb)!important;color:#fff!important}
    .sc-admin-users .paginator,
    .sc-admin-users .pagination{margin:6px 0 0;text-align:center}
    @media (max-width:767px){
        main#content{width:min(100%,calc(100vw - 20px))!important;padding:108px 0 76px!important}
        .sc-admin-users-head{display:grid;padding:18px}
        .sc-admin-users-head h1{font-size:26px}
        .sc-admin-users table{min-width:1180px!important}
    }
</style>
{/literal}

<div class="sc-admin-users">
    <section class="sc-admin-users-card">
        <div class="sc-admin-users-head">
            <div>
                <h1>{lang 'Browse Users'}</h1>
                <p>{h3_title}</p>
            </div>
        </div>

        <form method="post" action="{{ $design->url(PH7_ADMIN_MOD, 'user', 'browse') }}">
            {{ $designSecurity->inputToken('user_action') }}

            <div class="sc-admin-users-scroll table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th><input type="checkbox" name="all_action" /></th>
                            <th>{lang 'User ID#'}</th>
                            <th>{lang 'Email Address'}</th>
                            <th>{lang 'User'}</th>
                            <th>{lang 'Profile Photo'}</th>
                            <th>{lang 'IP'}</th>
                            <th>{lang 'Membership Group + ID'}</th>
                            <th>{lang 'Registration Date'}</th>
                            <th>{lang 'Last Activity'}</th>
                            <th>{lang 'Last Edit'}</th>
                            <th>{lang 'Reference'}</th>
                            <th>{lang 'Action'}</th>
                        </tr>
                    </thead>

                    <tfoot>
                        <tr>
                          <th><input type="checkbox" name="all_action" /></th>
                          <th>
                              <button
                                  class="btn btn-default btn-md"
                                  type="submit"
                                  formaction="{{ $design->url(PH7_ADMIN_MOD, 'user', 'banall') }}"
                                  >{lang 'Ban'}
                              </button>
                          </th>
                          <th>
                              <button
                                  class="btn btn-default btn-md"
                                  type="submit"
                                  formaction="{{ $design->url(PH7_ADMIN_MOD, 'user', 'unbanall') }}"
                                  >{lang 'UnBan'}
                              </button>
                          </th>
                          <th>
                              <button
                                  class="btn btn-danger btn-md"
                                  type="submit"
                                  onclick="return checkChecked()"
                                  formaction="{{ $design->url(PH7_ADMIN_MOD, 'user', 'deleteall') }}"
                                  >{lang 'Delete'}
                              </button>
                          </th>
                          <th>
                              <button
                                  class="btn btn-default btn-md"
                                  type="submit"
                                  formaction="{{ $design->url(PH7_ADMIN_MOD, 'user', 'approveall') }}"
                                  >{lang 'Approve'}
                              </button>
                          </th>
                          <th>
                              <button
                                  class="btn btn-default btn-md"
                                  type="submit"
                                  formaction="{{ $design->url(PH7_ADMIN_MOD, 'user', 'disapproveall') }}"
                                  >{lang 'Disapprove'}
                              </button>
                          </th>
                          <th> </th>
                          <th> </th>
                          <th> </th>
                          <th> </th>
                          <th> </th>
                          <th> </th>
                        </tr>
                    </tfoot>

                    <tbody>
                        {each $user in $browse}
                            <tr>
                                <td>
                                    <input type="checkbox" name="action[]" value="{% $user->profileId %}_{% $user->username %}" />
                                </td>
                                <td>{% $user->profileId %}</td>
                                <td class="sc-admin-user-email">
                                    <a href="mailto:{% $user->email %}" title="{lang 'Email the User'}">
                                        {% $user->email %}
                                    </a>
                                </td>
                                <td class="sc-admin-user-person">
                                    {{ $design->getProfileLink($user->username) }}<br />
                                    <span class="gray">{% $user->firstName %}</span>
                                </td>
                                <td class="sc-admin-user-avatar">{{ $avatarDesign->get($user->username, $user->firstName, null, 32) }}</td>
                                <td class="sc-admin-user-ip">
                                    <img src="{{ $design->getSmallFlagIcon(Framework\Geo\Ip\Geo::getCountryCode($user->ip)) }}" title="{lang 'Country Flag'}" alt="{lang 'Country Flag'}" /> {{ $design->ip($user->ip) }}
                                </td>
                                <td>{% $user->membershipName %} ({% $user->groupId %})</td> {* Name of the Membership Group *}
                                <td class="small">{% $dateTime->get($user->joinDate)->dateTime() %}</td>
                                <td class="small">
                                    {if !empty($user->lastActivity)}
                                        {% $dateTime->get($user->lastActivity)->dateTime() %}
                                    {else}
                                        {lang 'No login'}
                                    {/if}
                                </td>
                                <td class="small">
                                    {if !empty($user->lastEdit)}
                                        {% $dateTime->get($user->lastEdit)->dateTime() %}
                                    {else}
                                        {lang 'No editing'}
                                    {/if}
                                </td>
                                <td class="small">{% $user->reference %}</td>
                                <td class="small sc-admin-user-actions">
                                    <div class="sc-admin-user-actions-inner">
                                        <a href="{{ $design->url('user', 'setting', 'edit', $user->profileId) }}" title="{lang "Edit User's Profile Information"}">{lang 'Edit'}</a>
                                        <a href="{{ $design->url('user', 'setting', 'avatar', "$user->profileId,$user->username,$user->firstName,$user->sex", false) }}" title="{lang "Edit User's Profile Photo"}">{lang 'Profile Photo'}</a>
                                        <a href="{{ $design->url('user', 'setting', 'design', "$user->profileId,$user->username,$user->firstName,$user->sex", false) }}" title="{lang "Edit the Wallpaper of the User's Profile Page"}">{lang 'Wallpaper'}</a>
                                        <a href="{{ $design->url(PH7_ADMIN_MOD, 'user', 'password') }}/{% $user->email %}" title="{lang "Edit the User's Password"}">{lang 'Password'}</a>
                                        {if $is_mail_enabled}
                                            <a href="{{ $design->url('mail', 'main', 'compose', $user->username) }}" title="{lang 'Send a message to this user'}">{lang 'Send PM'}</a>
                                        {/if}
                                        <a href="{{ $design->url(PH7_ADMIN_MOD, 'user', 'loginuseras', $user->profileId) }}" title="{lang 'Login as the user (to edit all the user account).'}">{lang 'Login'}</a>

                                        {if $user->ban == UserCore::BAN_STATUS}
                                            <span>{{ $design->popupLinkConfirm(t('UnBan'), PH7_ADMIN_MOD, 'user', 'unban', $user->profileId) }}</span>
                                        {else}
                                            <span class="is-danger">{{ $design->popupLinkConfirm(t('Ban'), PH7_ADMIN_MOD, 'user', 'ban', $user->profileId) }}</span>
                                        {/if}

                                        {if $user->active != RegistrationCore::NO_ACTIVATION}
                                            <span class="is-primary">{{ $design->popupLinkConfirm(t('Approve'), PH7_ADMIN_MOD, 'user', 'approve', $user->profileId) }}</span>
                                            <span>{{ $design->popupLinkConfirm(t('Disapprove (notified user by email)'), PH7_ADMIN_MOD, 'user', 'disapprove', $user->profileId) }}</span>
                                        {/if}

                                        <span class="is-danger">{{ $design->popupLinkConfirm(t('Delete'), PH7_ADMIN_MOD, 'user', 'delete', $user->profileId.'_'.$user->username) }}</span>
                                    </div>
                                </td>
                            </tr>
                        {/each}
                    </tbody>
                </table>
            </div>
        </form>
    </section>

    {if $total_users > UserMilestoneCore::MILLENARIAN}
        {manual_include 'milestone_reached.inc.tpl'}
    {/if}

    {main_include 'page_nav.inc.tpl'}
</div>
