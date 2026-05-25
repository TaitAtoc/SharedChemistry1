<div id="block_page" class="sc-newsletter-modal">
    {literal}
    <style>
        #colorbox:has(.sc-newsletter-modal),
        #colorbox:has(.sc-newsletter-modal) * {
            box-sizing: border-box !important;
        }

        #cboxOverlay {
            background: #050407 !important;
            opacity: .86 !important;
        }

        #colorbox:has(.sc-newsletter-modal) {
            width: min(520px, calc(100vw - 32px)) !important;
            max-width: calc(100vw - 32px) !important;
            overflow: visible !important;
            background: transparent !important;
        }

        #colorbox:has(.sc-newsletter-modal) #cboxWrapper,
        #colorbox:has(.sc-newsletter-modal) #cboxContent,
        #colorbox:has(.sc-newsletter-modal) #cboxLoadedContent {
            width: 100% !important;
            max-width: calc(100vw - 32px) !important;
            height: auto !important;
            overflow: visible !important;
            background: transparent !important;
            border: 0 !important;
        }

        #colorbox:has(.sc-newsletter-modal) #cboxTopLeft,
        #colorbox:has(.sc-newsletter-modal) #cboxTopCenter,
        #colorbox:has(.sc-newsletter-modal) #cboxTopRight,
        #colorbox:has(.sc-newsletter-modal) #cboxMiddleLeft,
        #colorbox:has(.sc-newsletter-modal) #cboxMiddleRight,
        #colorbox:has(.sc-newsletter-modal) #cboxBottomLeft,
        #colorbox:has(.sc-newsletter-modal) #cboxBottomCenter,
        #colorbox:has(.sc-newsletter-modal) #cboxBottomRight {
            display: none !important;
            width: 0 !important;
            height: 0 !important;
            background: transparent !important;
        }

        #colorbox:has(.sc-newsletter-modal) #cboxClose {
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

        #colorbox:has(.sc-newsletter-modal) #cboxClose:before,
        #colorbox:has(.sc-newsletter-modal) #cboxClose:after {
            content: "";
            position: absolute;
            top: 17px;
            left: 10px;
            width: 15px;
            height: 2px;
            border-radius: 999px;
            background: #f7f3ef;
        }

        #colorbox:has(.sc-newsletter-modal) #cboxClose:before {
            transform: rotate(45deg);
        }

        #colorbox:has(.sc-newsletter-modal) #cboxClose:after {
            transform: rotate(-45deg);
        }

        .sc-newsletter-modal {
            width: min(520px, calc(100vw - 32px));
            max-width: calc(100vw - 32px);
            max-height: min(760px, calc(100vh - 32px));
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

        .sc-newsletter-box {
            padding: 34px;
        }

        .sc-newsletter-title {
            margin: 0;
            color: #fff8f1;
            font-size: clamp(30px, 6vw, 42px);
            font-weight: 800;
            letter-spacing: 0;
            line-height: 1;
        }

        .sc-newsletter-copy {
            margin: 14px 0 24px;
            color: #d7d2ce;
            font-size: 15px;
            line-height: 1.7;
        }

        .sc-newsletter-form form,
        .sc-newsletter-form .pfbc-form {
            width: 100% !important;
            margin: 0 !important;
            padding: 0 !important;
            border: 0 !important;
            border-radius: 0 !important;
            background: transparent !important;
            box-shadow: none !important;
            color: #f7f3ef !important;
        }

        .sc-newsletter-form label,
        .sc-newsletter-form .pfbc-label,
        .sc-newsletter-form legend {
            display: block !important;
            margin: 0 0 8px !important;
            color: #f7f3ef !important;
            font-size: 13px !important;
            font-weight: 800 !important;
            line-height: 1.3 !important;
            text-shadow: none !important;
        }

        .sc-newsletter-form input:not([type=image]):not([type=range]):not([type=hidden]),
        .sc-newsletter-form textarea,
        .sc-newsletter-form select {
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
            line-height: 1.35 !important;
            text-shadow: none !important;
            box-shadow: inset 0 1px 0 rgba(255, 255, 255, .04) !important;
            white-space: normal !important;
        }

        .sc-newsletter-form input:focus,
        .sc-newsletter-form textarea:focus,
        .sc-newsletter-form select:focus {
            border-color: rgba(255, 188, 10, .72) !important;
            outline: 0 !important;
            box-shadow: 0 0 0 3px rgba(255, 188, 10, .14) !important;
        }

        .sc-newsletter-form div[id^="pfbc-element-"],
        .sc-newsletter-form .form-group,
        .sc-newsletter-form p {
            width: 100% !important;
            max-width: 100% !important;
            margin: 0 0 16px !important;
            padding: 0 !important;
            overflow: visible !important;
        }

        .sc-newsletter-form .input_error {
            float: none !important;
            display: block !important;
            min-height: 0 !important;
            margin: 7px 0 0 !important;
            color: #ff8b7d !important;
            font-size: 12px !important;
            line-height: 1.4 !important;
        }

        .sc-newsletter-form .captcha {
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

        .sc-newsletter-form .captcha_button,
        .sc-newsletter-form input[type=image] {
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

        .sc-newsletter-form input[type=submit],
        .sc-newsletter-form button {
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

        .sc-newsletter-form input[type=submit][value="Subscribe"],
        .sc-newsletter-form input[type=submit][value*="Subscribe"],
        .sc-newsletter-form button:first-of-type {
            border-color: transparent !important;
            background: linear-gradient(90deg, #ec0868, #f15a3b) !important;
            color: #fff !important;
            box-shadow: 0 14px 34px rgba(236, 8, 104, .24) !important;
        }

        .sc-newsletter-form input[type=submit]:hover,
        .sc-newsletter-form input[type=submit]:focus,
        .sc-newsletter-form button:hover,
        .sc-newsletter-form button:focus {
            transform: translateY(-1px);
        }

        @media (max-width: 520px) {
            .sc-newsletter-modal {
                width: min(100vw - 20px, 520px);
                max-width: calc(100vw - 20px);
                max-height: calc(100vh - 20px);
                border-radius: 14px;
            }

            .sc-newsletter-box {
                padding: 28px 20px 22px;
            }

            .sc-newsletter-form input[type=submit],
            .sc-newsletter-form button {
                width: 100% !important;
                margin-right: 0 !important;
            }
        }
    </style>
    {/literal}

    <div class="sc-newsletter-box">
        <h1 class="sc-newsletter-title">{lang 'SharedChemistry Updates'}</h1>
        <p class="sc-newsletter-copy">{lang 'Get occasional SharedChemistry updates, site news, and member feature announcements.'}</p>
        <div class="sc-newsletter-form">
            {{ SubscriptionForm::display() }}
        </div>
    </div>
</div>
