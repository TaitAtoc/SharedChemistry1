{literal}
<style>
    body{background:#101114!important}
    #headings{display:none!important}
    main#content{max-width:980px!important;margin:0 auto!important;padding:48px 15px 96px!important;background:transparent!important;border:0!important;box-shadow:none!important}
    .sc-compose-page{color:#f7f3ef}
    .sc-compose-page *{box-sizing:border-box}
    .sc-compose-header{max-width:760px;margin:0 auto 18px}
    .sc-compose-header h1{margin:0 0 8px;color:#f7f3ef;font-size:34px;font-weight:700;line-height:1.15;letter-spacing:0}
    .sc-compose-header p{margin:0;color:#b8b3b0;font-size:15px;line-height:1.5}
    .sc-compose-card{max-width:760px;margin:0 auto;padding:28px;border:1px solid rgba(255,255,255,.09);border-radius:12px;background:#17181d;box-shadow:0 22px 60px rgba(0,0,0,.34)}
    .sc-compose-card form,
    .sc-compose-card .pfbc-form,
    .sc-compose-card .form-horizontal{width:100%!important;margin:0!important}
    .sc-compose-card fieldset{margin:0!important;padding:0!important;border:0!important}
    .sc-compose-card legend{display:none!important}
    .sc-compose-card label{display:block!important;width:auto!important;margin:0 0 8px!important;padding:0!important;color:#f7f3ef!important;font-size:13px!important;font-weight:bold!important;line-height:1.35!important;text-align:left!important}
    .sc-compose-card .form-group,
    .sc-compose-card .control-group,
    .sc-compose-card .pfbc-element,
    .sc-compose-card p{margin:0 0 18px!important}
    .sc-compose-card input[type="text"],
    .sc-compose-card input[type="email"],
    .sc-compose-card textarea{display:block!important;width:100%!important;max-width:100%!important;min-height:46px!important;margin:0!important;padding:12px 14px!important;border:1px solid rgba(255,255,255,.14)!important;border-radius:8px!important;background:#202127!important;color:#f7f3ef!important;font-size:15px!important;line-height:1.45!important;box-shadow:none!important;outline:0!important}
    .sc-compose-card textarea{min-height:220px!important;resize:vertical!important}
    .sc-compose-card input[type="text"]:focus,
    .sc-compose-card input[type="email"]:focus,
    .sc-compose-card textarea:focus{border-color:#ec0868!important;box-shadow:0 0 0 3px rgba(236,8,104,.18)!important}
    .sc-compose-card input::placeholder,
    .sc-compose-card textarea::placeholder{color:#8f8987!important;opacity:1!important}
    .sc-compose-card .input_error{display:block!important;margin:7px 0 0!important;color:#ffbc0a!important;font-size:12px!important;line-height:1.35!important}
    .sc-compose-counter{display:block;margin:-9px 0 18px;color:#b8b3b0;font-size:12px;line-height:1.35;text-align:right}
    .sc-compose-card button,
    .sc-compose-card input[type="submit"],
    .sc-compose-card .btn{display:inline-flex!important;align-items:center!important;justify-content:center!important;min-width:150px!important;min-height:44px!important;margin:4px 0 0 auto!important;padding:11px 18px!important;border:0!important;border-radius:8px!important;background:#ec0868!important;background-image:linear-gradient(90deg,#ec0868,#c200fb)!important;color:#fff!important;font-size:15px!important;font-weight:bold!important;line-height:1.2!important;text-align:center!important;text-decoration:none!important;text-shadow:none!important;box-shadow:0 12px 28px rgba(0,0,0,.28)!important}
    .sc-compose-card button:hover,
    .sc-compose-card button:focus,
    .sc-compose-card input[type="submit"]:hover,
    .sc-compose-card input[type="submit"]:focus,
    .sc-compose-card .btn:hover,
    .sc-compose-card .btn:focus{background:#c200fb!important;background-image:none!important;color:#fff!important}
    .sc-compose-card .form-actions,
    .sc-compose-card .controls:last-child,
    .sc-compose-card div:last-child{text-align:right}
    .sc-compose-card table,
    .sc-compose-card tbody,
    .sc-compose-card tr,
    .sc-compose-card td{display:block!important;width:100%!important;border:0!important;background:transparent!important}
    @media (max-width:767px){
        main#content{padding:34px 10px 82px!important}
        .sc-compose-header h1{font-size:28px}
        .sc-compose-card{padding:20px}
        .sc-compose-card textarea{min-height:190px!important}
        .sc-compose-card button,
        .sc-compose-card input[type="submit"],
        .sc-compose-card .btn{width:100%!important;margin-top:8px!important}
        .sc-compose-counter{text-align:left}
    }
</style>
{/literal}

<div class="sc-compose-page">
    <div class="sc-compose-header">
        <h1>{lang 'Send Message'}</h1>
        <p>{lang 'Send a private message to this couple.'}</p>
    </div>

    <div class="sc-compose-card">
        {{ MailForm::display() }}
    </div>
</div>

{literal}
<script>
    $(document).ready(function() {
        var $message = $('#str_msg');

        if ($message.length && !$('.sc-compose-counter').length) {
            var $counter = $('<span class="sc-compose-counter" aria-live="polite"></span>');
            $message.after($counter);

            var updateCounter = function() {
                $counter.text($message.val().length + '/2500');
            };

            $message.on('input keyup change', updateCounter);
            updateCounter();
        }
    });
</script>
{/literal}
