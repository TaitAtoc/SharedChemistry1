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

        .sc-invite-box {
            padding: 34px;
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
    </style>
    {/literal}

    <div class="sc-invite-box">
        <h1 class="sc-invite-title">{lang 'Invite Trusted Couples'}</h1>
        <p class="sc-invite-copy">{lang 'Invite people you trust to discover SharedChemistry. Only invite adults who may be a genuine fit for a private couples community.'}</p>
        <p class="sc-invite-helper">{lang 'Add up to 10 email addresses, separated by commas.'}</p>
        <div class="sc-invite-form">
            {{ InviteForm::display() }}
        </div>
    </div>
</div>
