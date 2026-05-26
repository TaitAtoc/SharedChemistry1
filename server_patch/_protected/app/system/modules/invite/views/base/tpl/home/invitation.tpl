<div id="block_page" class="sc-invite-modal">
    {literal}
    <style>
        #cboxOverlay {
            background: #050407 !important;
            opacity: .86 !important;
        }

        #colorbox:has(.sc-invite-modal),
        #colorbox:has(.sc-invite-modal) * {
            box-sizing: border-box !important;
        }

        #colorbox:has(.sc-invite-modal) {
            width: min(560px, calc(100vw - 32px)) !important;
            max-width: calc(100vw - 32px) !important;
            overflow: visible !important;
            background: transparent !important;
        }

        #colorbox:has(.sc-invite-modal) #cboxWrapper,
        #colorbox:has(.sc-invite-modal) #cboxContent,
        #colorbox:has(.sc-invite-modal) #cboxLoadedContent {
            width: 100% !important;
            max-width: calc(100vw - 32px) !important;
            height: auto !important;
            overflow: visible !important;
            background: transparent !important;
            border: 0 !important;
        }

        #colorbox:has(.sc-invite-modal) #cboxTopLeft,
        #colorbox:has(.sc-invite-modal) #cboxTopCenter,
        #colorbox:has(.sc-invite-modal) #cboxTopRight,
        #colorbox:has(.sc-invite-modal) #cboxMiddleLeft,
        #colorbox:has(.sc-invite-modal) #cboxMiddleRight,
        #colorbox:has(.sc-invite-modal) #cboxBottomLeft,
        #colorbox:has(.sc-invite-modal) #cboxBottomCenter,
        #colorbox:has(.sc-invite-modal) #cboxBottomRight {
            display: none !important;
            width: 0 !important;
            height: 0 !important;
            background: transparent !important;
        }

        #colorbox:has(.sc-invite-modal) #cboxClose {
            position: absolute !important;
            top: 12px !important;
            right: 12px !important;
            bottom: auto !important;
            left: auto !important;
            z-index: 10000 !important;
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            width: 36px !important;
            height: 36px !important;
            margin: 0 !important;
            padding: 0 !important;
            border: 1px solid rgba(247, 243, 239, .18) !important;
            border-radius: 50% !important;
            background: rgba(8, 8, 11, .88) !important;
            background-image: none !important;
            color: #f7f3ef !important;
            text-indent: -9999px !important;
            box-shadow: 0 14px 34px rgba(0, 0, 0, .42) !important;
            overflow: hidden !important;
            cursor: pointer !important;
        }

        #colorbox:has(.sc-invite-modal) #cboxClose:before,
        #colorbox:has(.sc-invite-modal) #cboxClose:after {
            content: "";
            position: absolute;
            top: 17px;
            left: 10px;
            width: 15px;
            height: 2px;
            border-radius: 999px;
            background: #f7f3ef;
        }

        #colorbox:has(.sc-invite-modal) #cboxClose:before {
            transform: rotate(45deg);
        }

        #colorbox:has(.sc-invite-modal) #cboxClose:after {
            transform: rotate(-45deg);
        }

        body.sc-invite-direct-page main#content:has(.sc-invite-modal),
        body.sc-invite-direct-page main#content#content:has(.sc-invite-modal) {
            max-width: none !important;
            padding: 154px 16px 78px !important;
            background:
                radial-gradient(circle at 18% 4%, rgba(236, 8, 104, .18), transparent 30%),
                radial-gradient(circle at 82% 10%, rgba(255, 188, 10, .12), transparent 28%),
                linear-gradient(180deg, #08080b 0%, #121218 52%, #07070a 100%) !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top {
            min-height: 104px !important;
            border: 0 !important;
            background: rgba(8, 8, 11, .96) !important;
            box-shadow: 0 12px 34px rgba(0, 0, 0, .28) !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container {
            display: flex !important;
            align-items: center !important;
            justify-content: space-between !important;
            gap: 32px !important;
            min-height: 104px !important;
            padding-top: 12px !important;
            padding-bottom: 12px !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) .navbar-header {
            display: flex !important;
            align-items: center !important;
            flex: 0 0 auto !important;
            min-height: 80px !important;
            margin: 0 !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo {
            display: flex !important;
            align-items: center !important;
            justify-content: flex-start !important;
            height: auto !important;
            min-height: 80px !important;
            margin: 0 !important;
            padding: 0 18px 0 0 !important;
            float: none !important;
            line-height: 1 !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #logo .sharedchemistry-logo-link {
            display: inline-flex !important;
            align-items: center !important;
            width: 300px !important;
            max-width: 32vw !important;
            height: auto !important;
            margin: 0 !important;
            padding: 0 !important;
            transform: none !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #logo .sharedchemistry-header-logo {
            display: block !important;
            width: 300px !important;
            max-width: 100% !important;
            max-height: none !important;
            height: auto !important;
            margin: 0 !important;
            object-fit: contain !important;
            transform: none !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
            display: flex !important;
            align-items: center !important;
            justify-content: flex-end !important;
            flex: 1 1 auto !important;
            min-height: 80px !important;
            margin: 0 !important;
            padding: 0 !important;
            border: 0 !important;
            box-shadow: none !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar .navbar-nav {
            display: flex !important;
            align-items: center !important;
            justify-content: flex-end !important;
            gap: 22px !important;
            margin: 0 !important;
            padding: 0 !important;
            float: none !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar .navbar-nav > li {
            display: flex !important;
            align-items: center !important;
            margin: 0 !important;
            padding: 0 !important;
            float: none !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            min-height: 40px !important;
            margin: 0 !important;
            padding: 10px 16px !important;
            border-radius: 8px !important;
            line-height: 1.2 !important;
            white-space: nowrap !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-join {
            background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
            color: #fff !important;
            box-shadow: 0 12px 30px rgba(236, 8, 104, .25) !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-signin {
            border: 1px solid rgba(255, 188, 10, .44) !important;
            background: rgba(247, 243, 239, .04) !important;
            color: #ffbc0a !important;
        }

        body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a.sharedchemistry-nav-blog {
            border: 1px solid rgba(247, 243, 239, .14) !important;
            background: rgba(247, 243, 239, .035) !important;
            color: #f7f3ef !important;
        }

        .sc-invite-modal {
            width: min(560px, calc(100vw - 32px));
            max-width: calc(100vw - 32px);
            max-height: min(820px, calc(100vh - 32px));
            margin: 0 auto;
            overflow-x: hidden;
            overflow-y: auto;
            border: 1px solid rgba(247, 243, 239, .12);
            border-radius: 18px;
            background:
                radial-gradient(circle at 15% 0%, rgba(236, 8, 104, .22), transparent 32%),
                radial-gradient(circle at 90% 12%, rgba(255, 188, 10, .16), transparent 30%),
                linear-gradient(180deg, #15151b 0%, #0a0a0e 100%);
            color: #f7f3ef;
            box-shadow: 0 30px 90px rgba(0, 0, 0, .52);
        }

        body.sc-invite-direct-page .sc-invite-modal {
            width: min(640px, calc(100vw - 32px));
            max-width: calc(100vw - 32px);
            max-height: none;
            margin: 0 auto;
            overflow: visible;
            border-radius: 18px;
        }

        .sc-invite-box {
            padding: 34px;
        }

        body.sc-invite-direct-page .sc-invite-box {
            padding: 42px 42px 38px;
        }

        .sc-invite-title {
            margin: 0;
            color: #fff8f1;
            font-size: clamp(30px, 6vw, 42px);
            font-weight: 800;
            letter-spacing: 0;
            line-height: 1;
        }

        .sc-invite-copy {
            margin: 14px 0 10px;
            color: #d7d2ce;
            font-size: 15px;
            line-height: 1.7;
        }

        .sc-invite-helper {
            margin: 0 0 24px;
            color: #ffbc0a;
            font-size: 13px;
            font-weight: 800;
            line-height: 1.5;
        }

        .sc-invite-form form,
        .sc-invite-form .pfbc-form {
            width: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            border: 0 !important;
            border-radius: 0 !important;
            background: transparent !important;
            box-shadow: none !important;
            color: #f7f3ef !important;
        }

        .sc-invite-form label,
        .sc-invite-form .pfbc-label,
        .sc-invite-form legend {
            display: block !important;
            margin: 0 0 8px !important;
            color: #f7f3ef !important;
            font-size: 13px !important;
            font-weight: 800 !important;
            line-height: 1.3 !important;
            text-shadow: none !important;
        }

        .sc-invite-form input:not([type=image]):not([type=range]):not([type=hidden]),
        .sc-invite-form textarea,
        .sc-invite-form select {
            width: 100% !important;
            max-width: 100% !important;
            min-height: 46px !important;
            margin: 0 !important;
            padding: 12px 14px !important;
            border: 1px solid rgba(247, 243, 239, .18) !important;
            border-radius: 8px !important;
            background: rgba(8, 8, 11, .70) !important;
            color: #f7f3ef !important;
            font-size: 15px !important;
            line-height: 1.45 !important;
            text-shadow: none !important;
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .04) !important;
            white-space: normal !important;
        }

        .sc-invite-form textarea {
            min-height: 92px !important;
            max-height: 180px !important;
            resize: vertical !important;
        }

        .sc-invite-form textarea[name="to"] {
            min-height: 72px !important;
            max-height: 120px !important;
        }

        .sc-invite-form input:focus,
        .sc-invite-form textarea:focus,
        .sc-invite-form select:focus {
            border-color: rgba(255, 188, 10, .72) !important;
            outline: 0 !important;
            box-shadow: 0 0 0 3px rgba(255, 188, 10, .14) !important;
        }

        .sc-invite-form div[id^="pfbc-element-"],
        .sc-invite-form .form-group,
        .sc-invite-form p {
            width: 100% !important;
            max-width: 100% !important;
            margin: 0 0 16px !important;
            padding: 0 !important;
            overflow: visible !important;
        }

        body.sc-invite-direct-page .sc-invite-form div[id^="pfbc-element-"],
        body.sc-invite-direct-page .sc-invite-form .form-group,
        body.sc-invite-direct-page .sc-invite-form p {
            margin-bottom: 18px !important;
        }

        .sc-invite-form small,
        .sc-invite-form .help-block,
        .sc-invite-form .description {
            display: block !important;
            margin-top: 7px !important;
            color: #d7d2ce !important;
            font-size: 12px !important;
            line-height: 1.45 !important;
        }

        .sc-invite-form .input_error {
            float: none !important;
            display: block !important;
            min-height: 0 !important;
            margin: 7px 0 0 !important;
            color: #ff8b7d !important;
            font-size: 12px !important;
            line-height: 1.4 !important;
        }

        .sc-invite-form .captcha {
            display: block !important;
            width: 100% !important;
            max-width: 100% !important;
            height: auto !important;
            min-height: 54px !important;
            margin: 8px 0 10px !important;
            padding: 8px !important;
            border: 1px solid rgba(247, 243, 239, .16) !important;
            border-radius: 8px !important;
            background: rgba(247, 243, 239, .92) !important;
            object-fit: contain !important;
        }

        .sc-invite-form .captcha_button,
        .sc-invite-form input[type=image] {
            float: none !important;
            display: inline-flex !important;
            width: auto !important;
            max-width: 42px !important;
            height: 42px !important;
            margin: 0 0 10px !important;
            padding: 8px !important;
            border: 1px solid rgba(255, 188, 10, .36) !important;
            border-radius: 8px !important;
            background: rgba(247, 243, 239, .08) !important;
            vertical-align: middle !important;
        }

        .sc-invite-form input[type=submit],
        .sc-invite-form button {
            display: inline-flex !important;
            align-items: center !important;
            justify-content: center !important;
            width: auto !important;
            min-width: 148px !important;
            min-height: 46px !important;
            margin: 4px 10px 0 0 !important;
            padding: 12px 18px !important;
            border: 1px solid rgba(255, 188, 10, .38) !important;
            border-radius: 8px !important;
            background: rgba(247, 243, 239, .055) !important;
            color: #ffbc0a !important;
            font-size: 14px !important;
            font-weight: 800 !important;
            line-height: 1.2 !important;
            text-shadow: none !important;
            box-shadow: none !important;
            cursor: pointer !important;
        }

        .sc-invite-form input[type=submit],
        .sc-invite-form button[type=submit] {
            border-color: transparent !important;
            background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
            color: #fff !important;
            box-shadow: 0 14px 34px rgba(236, 8, 104, .24) !important;
        }

        .sc-invite-form input[type=submit]:hover,
        .sc-invite-form input[type=submit]:focus,
        .sc-invite-form button:hover,
        .sc-invite-form button:focus {
            transform: translateY(-1px);
        }

        @media (max-width: 560px) {
            .sc-invite-modal {
                width: min(100vw - 20px, 560px);
                max-width: calc(100vw - 20px);
                max-height: calc(100vh - 20px);
                border-radius: 14px;
            }

            .sc-invite-box {
                padding: 28px 20px 22px;
            }

            .sc-invite-form input[type=submit],
            .sc-invite-form button {
                width: 100% !important;
                margin-right: 0 !important;
            }
        }

        @media (max-width: 900px) {
            body.sc-invite-direct-page main#content:has(.sc-invite-modal),
            body.sc-invite-direct-page main#content#content:has(.sc-invite-modal) {
                padding-top: 178px !important;
            }

            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top,
            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container,
            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) .navbar-header,
            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo,
            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
                min-height: 0 !important;
                height: auto !important;
            }

            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) .navbar.navbar-fixed-top > .container {
                display: grid !important;
                justify-items: center !important;
                gap: 12px !important;
                padding-top: 12px !important;
                padding-bottom: 12px !important;
            }

            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) .navbar-header,
            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar.navbar-collapse {
                width: 100% !important;
                justify-content: center !important;
            }

            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #logo.navbar-brand.sharedchemistry-member-logo {
                justify-content: center !important;
                padding: 0 !important;
            }

            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #logo .sharedchemistry-logo-link,
            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #logo .sharedchemistry-header-logo {
                width: min(300px, 82vw) !important;
                max-width: 82vw !important;
            }

            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar .navbar-nav {
                justify-content: center !important;
                flex-wrap: wrap !important;
                gap: 10px 14px !important;
                width: 100% !important;
            }

            body.sc-invite-direct-page:has(.sharedchemistry-nav-join) #navbar .navbar-nav > li > a {
                min-height: 42px !important;
                padding: 10px 14px !important;
            }
        }

        @media (max-width: 680px) {
            body.sc-invite-direct-page main#content:has(.sc-invite-modal),
            body.sc-invite-direct-page main#content#content:has(.sc-invite-modal) {
                padding: 170px 10px 54px !important;
            }

            body.sc-invite-direct-page .sc-invite-box {
                padding: 32px 20px 26px;
            }
        }
    </style>
    {/literal}

    <div class="sc-invite-box">
        <h1 class="sc-invite-title">{lang 'Invite Trusted Couples'}</h1>
        <p class="sc-invite-copy">{lang 'Invite people you trust to discover SharedChemistry. Only invite adults who may be a genuine fit for a private couples community.'}</p>
        <p class="sc-invite-helper">{lang 'Add up to 10 email addresses, separated by commas.'}</p>
        <div class="sc-invite-form">
            {{ InviteForm::display() }}
        </div>
        {literal}
        <script>
            (function () {
                var block = document.getElementById('block_page');
                if (block && block.className.indexOf('sc-invite-modal') !== -1 && !(block.closest && block.closest('#colorbox'))) {
                    document.body.className += document.body.className ? ' sc-invite-direct-page' : 'sc-invite-direct-page';
                }

                var secureInviteAction = function () {
                    var forms = document.querySelectorAll('.sc-invite-modal form');
                    for (var i = 0; i < forms.length; i++) {
                        var action = forms[i].getAttribute('action') || '';
                        if (action.indexOf('http://sharedchemistry.com/') === 0) {
                            forms[i].setAttribute('action', action.replace('http://sharedchemistry.com/', 'https://sharedchemistry.com/'));
                        }
                    }
                };

                secureInviteAction();
                document.addEventListener('submit', function (event) {
                    if (event.target && event.target.closest && event.target.closest('.sc-invite-modal')) {
                        secureInviteAction();
                    }
                }, true);
            }());
        </script>
        {/literal}
    </div>
</div>
