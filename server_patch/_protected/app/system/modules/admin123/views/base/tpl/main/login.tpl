{literal}
<style>
    body{background:#101114!important}
    main#content{width:min(100%,760px)!important;max-width:none!important;margin:0 auto!important;padding:145px 20px 96px!important;background:transparent!important;border:0!important;box-shadow:none!important}
    .sc-admin-login,
    .sc-admin-login *{box-sizing:border-box}
    .sc-admin-login{color:#f7f3ef}
    .sc-admin-login-card{width:100%;padding:30px;border:1px solid rgba(247,243,239,.1);border-radius:12px;background:#17181d;box-shadow:0 18px 44px rgba(0,0,0,.34)}
    .sc-admin-login-header{margin:0 0 22px}
    .sc-admin-login-header h1{margin:0 0 7px;color:#f7f3ef;font-size:30px;font-weight:700;line-height:1.15}
    .sc-admin-login-header p{margin:0;color:#b8b3b0;font-size:14px;line-height:1.45}
    .sc-admin-login-form form,
    .sc-admin-login-form fieldset{width:100%!important;margin:0!important;padding:0!important;border:0!important;background:transparent!important;box-shadow:none!important}
    .sc-admin-login-form .pfbc-form,
    .sc-admin-login-form .form-horizontal,
    .sc-admin-login-form .form{width:100%!important;margin:0!important;background:transparent!important}
    .sc-admin-login-form .form-group,
    .sc-admin-login-form .control-group,
    .sc-admin-login-form .pfbc-element{display:block!important;width:100%!important;margin:0 0 16px!important;padding:0!important}
    .sc-admin-login-form label,
    .sc-admin-login-form .control-label{display:block!important;width:100%!important;margin:0 0 7px!important;padding:0!important;color:#f7f3ef!important;font-size:13px!important;font-weight:700!important;line-height:1.25!important;text-align:left!important}
    .sc-admin-login-form .controls,
    .sc-admin-login-form .col-sm-10,
    .sc-admin-login-form .col-md-10{display:block!important;width:100%!important;max-width:none!important;margin:0!important;padding:0!important}
    .sc-admin-login-form input[type="email"],
    .sc-admin-login-form input[type="text"],
    .sc-admin-login-form input[type="password"]{display:block!important;width:100%!important;height:46px!important;margin:0!important;padding:11px 13px!important;border:1px solid rgba(247,243,239,.16)!important;border-radius:9px!important;background:#202127!important;color:#f7f3ef!important;font-size:15px!important;line-height:1.25!important;box-shadow:none!important;outline:0!important}
    .sc-admin-login-form input[type="email"]:focus,
    .sc-admin-login-form input[type="text"]:focus,
    .sc-admin-login-form input[type="password"]:focus{border-color:#ec0868!important;background:#24252d!important;box-shadow:0 0 0 3px rgba(236,8,104,.18)!important}
    .sc-admin-login-form input[type="submit"],
    .sc-admin-login-form button[type="submit"],
    .sc-admin-login-form .btn,
    .sc-admin-login-form .button{display:inline-flex!important;align-items:center!important;justify-content:center!important;min-width:140px!important;min-height:44px!important;margin:4px 0 0!important;padding:11px 18px!important;border:0!important;border-radius:10px!important;background:#ec0868!important;background-image:linear-gradient(90deg,#ec0868,#c200fb)!important;color:#fff!important;font-size:15px!important;font-weight:700!important;line-height:1.2!important;text-align:center!important;text-decoration:none!important;text-shadow:none!important;box-shadow:none!important;cursor:pointer!important}
    .sc-admin-login-form input[type="submit"]:hover,
    .sc-admin-login-form input[type="submit"]:focus,
    .sc-admin-login-form button[type="submit"]:hover,
    .sc-admin-login-form button[type="submit"]:focus,
    .sc-admin-login-form .btn:hover,
    .sc-admin-login-form .btn:focus{background:#f32482!important;background-image:linear-gradient(90deg,#f32482,#d035ff)!important;color:#fff!important;transform:translateY(-1px)}
    .sc-admin-login-links{display:flex;align-items:center;justify-content:space-between;gap:14px;margin:20px 0 0;padding-top:17px;border-top:1px solid rgba(247,243,239,.09)}
    .sc-admin-login-links p{margin:0;color:#b8b3b0;font-size:13px;line-height:1.35}
    .sc-admin-login-links a{color:#ffbc0a!important;font-weight:700;text-decoration:none!important}
    .sc-admin-login-links a:hover,
    .sc-admin-login-links a:focus{color:#f7f3ef!important;text-decoration:none!important}
    .sc-admin-login-ip{color:#b8b3b0!important}
    .sc-admin-login-ip em{color:#f7f3ef!important;font-style:normal}
    @media (max-width:767px){
        main#content{width:min(100%,calc(100vw - 20px))!important;padding:108px 0 76px!important}
        .sc-admin-login-card{padding:22px}
        .sc-admin-login-header h1{font-size:26px}
        .sc-admin-login-form input[type="submit"],
        .sc-admin-login-form button[type="submit"],
        .sc-admin-login-form .btn,
        .sc-admin-login-form .button{width:100%!important}
        .sc-admin-login-links{display:grid;gap:10px}
    }
</style>
{/literal}

<div class="sc-admin-login">
    <section class="sc-admin-login-card">
        <div class="sc-admin-login-header">
            <h1>{lang 'Admin Login'}</h1>
            <p>{lang 'Sign in to manage SharedChemistry.'}</p>
        </div>

        <div class="sc-admin-login-form">
            {{ LoginForm::display() }}
        </div>

        <div class="sc-admin-login-links">
            <p>{{ LostPwdDesignCore::link(PH7_ADMIN_MOD) }}</p>
            <p class="sc-admin-login-ip">{lang 'Your logged IP is:'} <em class="bold">{ip}</em></p>
        </div>
    </section>
</div>
