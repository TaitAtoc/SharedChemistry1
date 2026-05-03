{{ $design->htmlHeader() }}
{{ $design->softwareComment() }}
<html lang="{% $config->values['language']['lang'] %}">
  <head>
    <meta charset="{% $config->values['language']['charset'] %}" />
    <meta name="viewport" content="width=device-width,initial-scale=1" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />

    <!-- Begin Title and Meta info -->
    <title>{if $page_title}{% $str->escape($str->upperFirst($page_title), true) %} - {site_name}{else}{site_name} - {slogan}{/if}</title>
    <meta name="description" content="{% $str->escape($str->upperFirst($meta_description), true) %}" />
    <meta name="keywords" content="{% $str->escape($meta_keywords, true) %}" />
    {main_include 'social-meta-tags.inc.tpl'}
    <meta name="robots" content="{meta_robots}" />
    <link rel="icon" href="{url_relative}favicon.ico" />
    <link rel="canonical" href="{current_url}" />
    <link rel="author" href="{url_root}humans.txt" />
    {if !$is_user_auth}{{ $design->regionalUrls() }}{/if}
    <meta name="author" content="{meta_author}" />
    <meta name="copyright" content="{meta_copyright}" />
    <meta name="category" content="{meta_category}" />
    <meta name="rating" content="{meta_rating}" />
    <meta name="distribution" content="{meta_distribution}" />
    {if $header}{header}{/if}

    {if $is_pwa_enabled}
      <link rel="manifest" href="{{ $design->url('pwa','main','manifest') }}" />
      <meta name="msapplication-config" content="{{ $design->url('pwa','main','browserconfig') }}" />
      {{ $design->staticFiles('js', PH7_LAYOUT . PH7_SYS . PH7_MOD . 'pwa/' . PH7_TPL . PH7_DEFAULT_THEME . PH7_SH . PH7_JS, 'sw-register.js') }}
      {main_include 'pwa-icon-tags.inc.tpl'}
    {/if}

    <!-- Begin Copyright pH7 Dating/Social CMS by Pierre-Henry SORIA, All Rights Reserved -->
    <!-- Do not modify or remove this code! Think of those who spend a lot of time to develop this CMS & Framework for you -->
    <meta name="creator" content="pH7Builder, Pierre-Henry Soria - {software_url}" />
    <meta name="designer" content="pH7Builder, Pierre-Henry Soria - {software_url}" />
    <meta name="generator" content="{software_name}, v{software_version}" />
    <!-- End Copyright -->

    <!-- End Title and Meta -->

    <!-- Begin Sheet CSS -->
    {{ $design->externalCssFile(PH7_URL_STATIC. PH7_CSS . 'js/jquery/smoothness/jquery-ui.css') }}
    {{ $design->externalCssFile(PH7_URL_STATIC. PH7_CSS . 'font-awesome.css') }}
    {{ $design->staticFiles('css', PH7_STATIC . PH7_CSS . 'js/jquery/box', 'box.css') }} {* We have to include box CSS alone because it includes images in its folder *}
    {{ $design->staticFiles('css', PH7_STATIC . PH7_CSS, 'bootstrap.css,bootstrap_customize.css,animate.css') }}
    {{ $design->staticFiles('css', PH7_LAYOUT . PH7_TPL . PH7_TPL_NAME . PH7_SH . PH7_CSS, 'common.css,style.css,layout.css,like.css,color.css,form.css,js/jquery/rating.css,js/jquery/apprise.css,js/jquery/tipTip.css') }}
    {if $top_navbar_type === 'inverse'}
      {{ $design->staticFiles('css', PH7_LAYOUT . PH7_TPL . PH7_TPL_NAME . PH7_SH . PH7_CSS, 'menu_inverse.css') }}
    {else}
      {{ $design->staticFiles('css', PH7_LAYOUT . PH7_TPL . PH7_TPL_NAME . PH7_SH . PH7_CSS, 'menu.css') }}
    {/if}
    <link rel="stylesheet" href="//fonts.googleapis.com/css?family=Open+Sans" />

    {* Custom CSS code *}
    {{ $design->externalCssFile(PH7_RELATIVE.'asset/css/color.css') }}
    {{ $design->externalCssFile(PH7_RELATIVE.'asset/css/style.css') }}

    {if $is_user_auth AND $is_im_enabled}
      {{ $design->staticFiles('css', PH7_LAYOUT . PH7_SYS . PH7_MOD . 'im/' . PH7_TPL . PH7_DEFAULT_THEME . PH7_SH . PH7_CSS, 'messenger.css') }}
    {/if}

    {if $is_disclaimer}
      {{ $design->staticFiles('css', PH7_STATIC . PH7_CSS . PH7_JS, 'disclaimer.css') }}
    {/if}

    <!-- Other sheet CSS for modules etc. -->
    {{ $design->css() }}
    {designModel.files('css')}

    <!-- SharedChemistry emergency fallback styles -->
    <style type="text/css">
      html, body {
        margin: 0;
        padding: 0;
        background: #101114 !important;
        color: #F7F3EF !important;
        font-family: "Open Sans", Arial, Helvetica, sans-serif;
        font-size: 14px;
        line-height: 1.5;
      }
      body {
        min-width: 320px;
      }
      a, a:visited {
        color: #FFBC0A;
        text-decoration: none;
      }
      a:hover, a:focus {
        color: #EC7D10;
        text-decoration: underline;
      }
      h1, h2, h3, h4, h5, h6 {
        color: #F7F3EF;
        margin-top: 0;
        line-height: 1.15;
      }
      p, li, label, small {
        color: #B8B3B0;
      }
      img, video, iframe {
        max-width: 100%;
      }
      .container {
        width: auto;
        max-width: 1160px;
        margin-left: auto;
        margin-right: auto;
        padding-left: 18px;
        padding-right: 18px;
      }
      .row {
        clear: both;
        margin-left: -15px;
        margin-right: -15px;
      }
      .row:after,
      .container:after,
      .sharedchemistry-home-blocks:after,
      .sharedchemistry-top-shell:after,
      .sharedchemistry-landing-stage:after {
        content: "";
        display: table;
        clear: both;
      }
      .col-md-1, .col-md-2, .col-md-3, .col-md-4, .col-md-5, .col-md-6,
      .col-md-7, .col-md-8, .col-md-9, .col-md-10, .col-md-11, .col-md-12,
      .col-xs-1, .col-xs-2, .col-xs-3, .col-xs-4, .col-xs-5, .col-xs-6,
      .col-xs-7, .col-xs-8, .col-xs-9, .col-xs-10, .col-xs-11, .col-xs-12 {
        box-sizing: border-box;
        min-height: 1px;
        padding-left: 15px;
        padding-right: 15px;
      }
      .col-md-3, .col-xs-3 { float: left; width: 25%; }
      .col-md-4, .col-xs-4 { float: left; width: 33.3333%; }
      .col-md-6, .col-xs-6 { float: left; width: 50%; }
      .col-md-8, .col-xs-8 { float: left; width: 66.6667%; }
      .col-md-9, .col-xs-9 { float: left; width: 75%; }
      .col-md-12, .col-xs-12 { float: left; width: 100%; }
      header {
        padding-top: 18px;
      }
      main#content {
        display: block;
        padding-top: 28px;
        padding-bottom: 36px;
      }
      .navbar, .navbar-default, .navbar-inverse {
        clear: both;
        min-height: 64px;
        margin: 0;
        padding: 0;
        border: 0;
        border-bottom: 1px solid #34363F;
        background: #101114 !important;
      }
      .navbar .container {
        max-width: 1180px;
      }
      .navbar-header {
        float: left;
      }
      .navbar-brand, #logo.navbar-brand {
        display: block;
        float: left;
        padding: 18px 15px;
      }
      #logo h1 {
        margin: 0;
        font-size: 22px;
        font-weight: bold;
      }
      #logo h1 a, .navbar #logo a {
        color: #F7F3EF !important;
      }
      .sharedchemistry-logo-link {
        display: inline-block;
        color: #F7F3EF !important;
        text-decoration: none !important;
      }
      .sharedchemistry-header-logo {
        display: inline-block;
        width: 118px;
        height: auto;
        margin: -12px 10px -14px 0;
        vertical-align: middle;
      }
      .sharedchemistry-logo-link span {
        display: inline-block;
        vertical-align: middle;
      }
      .navbar-collapse {
        display: block;
      }
      .nav, .navbar-nav {
        margin: 0;
        padding: 0;
        list-style: none;
      }
      .navbar-nav > li {
        float: left;
        list-style: none;
      }
      .navbar-nav > li > a {
        display: block;
        padding: 20px 11px;
        color: #B8B3B0 !important;
        font-weight: bold;
      }
      .navbar-nav > li > a:hover,
      .navbar-nav > li > a:focus {
        background: #202127 !important;
        color: #F7F3EF !important;
        text-decoration: none;
      }
      .dropdown-menu {
        display: none;
        position: absolute;
        z-index: 1000;
        min-width: 190px;
        margin: 0;
        padding: 8px 0;
        list-style: none;
        border: 1px solid #34363F;
        background: #202127;
      }
      .dropdown:hover > .dropdown-menu {
        display: block;
      }
      .dropdown-menu > li > a {
        display: block;
        padding: 9px 16px;
        color: #B8B3B0 !important;
      }
      .sharedchemistry-nav-join {
        margin-top: 10px;
        margin-left: 8px;
        padding: 10px 17px !important;
        border-radius: 24px;
        background: #EC0868 !important;
        color: #fff !important;
      }
      .sharedchemistry-nav-signin {
        margin-top: 10px;
        padding: 9px 16px !important;
        border: 1px solid #FFBC0A;
        border-radius: 24px;
        color: #F7F3EF !important;
      }
      .sharedchemistry-guest-hero {
        clear: both;
        max-width: 1160px;
        margin: 0 auto;
        padding: 58px 18px 24px;
      }
      .sharedchemistry-guest-brand {
        float: none !important;
        max-width: 760px;
      }
      .sharedchemistry-guest-brand h1 {
        margin-bottom: 18px;
        font-size: 24px;
      }
      .sharedchemistry-hero-logo {
        display: block;
        width: 260px;
        height: auto;
        margin: 0 0 18px;
      }
      .sharedchemistry-guest-brand h1 .sharedchemistry-logo-link span {
        display: none;
      }
      .sharedchemistry-guest-brand h2 {
        max-width: 760px;
        margin: 0 0 18px;
        color: #F7F3EF;
        font-size: 46px;
        font-weight: bold;
      }
      .sharedchemistry-hero-copy {
        max-width: 660px;
        color: #B8B3B0;
        font-size: 18px;
      }
      .sharedchemistry-hero-actions {
        margin-top: 24px;
        margin-bottom: 18px;
      }
      .sharedchemistry-banner-wrap {
        clear: both;
        max-width: 1160px;
        margin: 10px auto 24px;
        padding: 0 18px;
        box-sizing: border-box;
      }
      .sharedchemistry-hero-banner {
        display: block;
        width: 100%;
        height: auto;
        border: 1px solid #34363F;
        border-radius: 14px;
        background: #17181D;
      }
      .sharedchemistry-top-shell {
        clear: both;
        position: relative;
        max-width: 1160px;
        min-height: 132px;
        margin: 0 auto;
        padding: 4px 18px 0;
        box-sizing: border-box;
      }
      .sharedchemistry-top-logo {
        float: left;
        width: 46%;
        margin-top: -2px;
      }
      .sharedchemistry-top-logo h1 {
        margin: 0;
      }
      .sharedchemistry-top-logo .sharedchemistry-logo-link span {
        display: none;
      }
      .sharedchemistry-top-logo-img {
        display: block;
        width: 348px;
        max-width: 100%;
        height: auto;
      }
      .sharedchemistry-guest-top-spacer {
        float: right;
        width: 50%;
        min-height: 118px;
      }
      .sharedchemistry-guest-banner {
        margin-top: 0;
        margin-bottom: 52px;
      }
      .sharedchemistry-landing-stage {
        clear: both;
        max-width: 1160px;
        margin: 0 auto;
      }
      .sharedchemistry-main-left {
        float: left;
        width: 55%;
        box-sizing: border-box;
        padding-right: 38px;
      }
      .sharedchemistry-main-left h2 {
        max-width: 600px;
        margin: 0 0 18px;
        color: #F7F3EF;
        font-size: 43px;
        line-height: 1.14;
        font-weight: bold;
      }
      .sharedchemistry-main-copy {
        max-width: 620px;
        margin: 0 0 22px;
        color: #B8B3B0;
        font-size: 17px;
        line-height: 1.65;
      }
      .sharedchemistry-main-actions {
        margin: 0 0 42px;
      }
      .sharedchemistry-main-actions .btn {
        margin-right: 10px;
        margin-bottom: 10px;
        padding: 12px 22px;
      }
      .sharedchemistry-mask-woman {
        display: block;
        width: 100%;
        max-width: 620px;
        height: auto;
        margin: 0 0 46px;
        border: 1px solid #24262D;
        border-radius: 10px;
        background: #050506;
      }
      .sharedchemistry-community-copy {
        max-width: 760px;
        margin: 0 0 24px;
      }
      .sharedchemistry-community-copy h2 {
        margin-bottom: 22px;
        font-size: 30px;
      }
      .sharedchemistry-community-copy h3 {
        margin-bottom: 18px;
        font-size: 22px;
      }
      .sharedchemistry-community-copy p {
        color: #D0CBC7;
        font-size: 16px;
        line-height: 1.6;
      }
      .sharedchemistry-auto-wrap {
        float: right;
        width: 38%;
        box-sizing: border-box;
      }
      .sharedchemistry-auto-wrap .fadeInLeft {
        display: none !important;
      }
      .sharedchemistry-auto-wrap .fadeInRight {
        float: none !important;
        width: auto !important;
        max-width: none !important;
        margin: 0 !important;
        padding: 0 !important;
      }
      .sharedchemistry-auto-wrap .fadeInRight h1 {
        margin: 0 0 18px;
        color: #F7F3EF !important;
        font-size: 30px;
        line-height: 1.2;
        text-decoration: none !important;
        font-style: normal !important;
      }
      .sharedchemistry-auto-wrap .login_button {
        display: none !important;
      }
      .btn, button, input[type="submit"], input[type="button"] {
        display: inline-block;
        padding: 10px 18px;
        border: 1px solid #3A3C45;
        border-radius: 24px;
        background: #202127;
        color: #F7F3EF !important;
        font-weight: bold;
        cursor: pointer;
      }
      .btn-primary, .btn-success,
      input[type="submit"], button[type="submit"],
      .sharedchemistry-primary-cta {
        border-color: #EC0868 !important;
        background: #EC0868 !important;
        color: #fff !important;
      }
      .btn-primary:hover, .btn-success:hover,
      input[type="submit"]:hover, button[type="submit"]:hover,
      .sharedchemistry-primary-cta:hover {
        border-color: #C200FB !important;
        background: #C200FB !important;
        color: #fff !important;
      }
      .sharedchemistry-secondary-cta {
        border-color: #FFBC0A !important;
        background: #17181D !important;
      }
      .sharedchemistry-home-blocks {
        clear: both;
        margin: 54px 0 12px;
      }
      .sharedchemistry-home-card,
      .box, .block, .panel, .well, .design-box, .thumbnail,
      #form_login_user, #form_join_user, .login_block {
        box-sizing: border-box;
        border: 1px solid #34363F !important;
        border-radius: 10px;
        background: #202127 !important;
        color: #F7F3EF !important;
      }
      .sharedchemistry-home-card {
        float: left;
        width: 23%;
        min-height: 210px;
        height: 210px;
        margin-left: 2%;
        padding: 20px;
      }
      .sharedchemistry-home-card.first {
        margin-left: 0;
      }
      .sharedchemistry-home-card h3 {
        color: #F7F3EF;
        font-size: 18px;
      }
      .sharedchemistry-home-card p {
        color: #B8B3B0;
      }
      #form_login_user, #form_join_user, .login_block {
        margin-top: 18px;
        margin-bottom: 18px;
        padding: 20px !important;
      }
      .login_block {
        position: absolute !important;
        top: 34px;
        right: 50%;
        width: 560px !important;
        margin: 0 -580px 0 0 !important;
        padding: 18px !important;
        background: #202127 !important;
        border-radius: 8px !important;
        z-index: 40;
      }
      .login_block form,
      #form_login_user {
        margin: 0 !important;
        padding: 18px !important;
        border-radius: 8px !important;
        background: #202127 !important;
      }
      #form_login_user .form-group,
      #form_login_user .pfbc-element,
      #form_login_user .control-group {
        margin-bottom: 0;
      }
      #form_login_user input[type="email"],
      #form_login_user input[type="password"] {
        float: left;
        width: 188px !important;
        height: 39px;
        margin: 0 10px 10px 0;
        padding: 8px 12px !important;
        background: #E9F0FF !important;
        color: #101114 !important;
        border-color: #CED7EA !important;
        box-shadow: none !important;
        text-shadow: none !important;
      }
      #form_login_user button,
      #form_login_user input[type="submit"] {
        float: left;
        height: 39px;
        margin: 0 0 10px 0;
        padding: 8px 20px !important;
        border-color: #EC0868 !important;
        background: #EC0868 !important;
        color: #fff !important;
        border-radius: 5px !important;
      }
      #form_login_user:after,
      .login_block form:after {
        content: "";
        display: table;
        clear: both;
      }
      .bt_login_remember,
      .bt_login_forgot {
        float: left !important;
        width: auto !important;
        margin: 4px 24px 0 0 !important;
        padding: 0 !important;
        color: #B8B3B0 !important;
      }
      .bt_login_remember label {
        display: inline !important;
        color: #B8B3B0 !important;
        font-weight: normal !important;
      }
      .bt_login_remember input[type="checkbox"] {
        width: auto !important;
        height: auto !important;
        margin: 0 5px 0 0 !important;
        padding: 0 !important;
        vertical-align: middle;
      }
      .bt_login_forgot a {
        color: #FFBC0A !important;
      }
      .sharedchemistry-auto-wrap #form_join_user,
      .sharedchemistry-auto-wrap .pfbc-form {
        box-sizing: border-box;
        width: 100% !important;
        margin: 0 !important;
        padding: 26px 26px 48px !important;
        border: 1px solid #34363F !important;
        border-radius: 10px !important;
        background: #202127 !important;
      }
      .sharedchemistry-auto-wrap #form_join_user:after {
        content: "";
        display: table;
        clear: both;
      }
      .sharedchemistry-auto-wrap #form_join_user input[type="text"],
      .sharedchemistry-auto-wrap #form_join_user input[type="email"],
      .sharedchemistry-auto-wrap #form_join_user input[type="password"],
      .sharedchemistry-auto-wrap #form_join_user select,
      .sharedchemistry-auto-wrap #form_join_user textarea {
        width: 100% !important;
        box-sizing: border-box !important;
        margin-top: 6px;
        padding: 11px 13px !important;
        background: #111216 !important;
        color: #F7F3EF !important;
        border-color: #3A3C45 !important;
        box-shadow: none !important;
        text-shadow: none !important;
      }
      .sharedchemistry-auto-wrap #form_join_user button,
      .sharedchemistry-auto-wrap #form_join_user input[type="submit"] {
        float: right;
        margin-top: 16px;
        margin-bottom: 8px;
        padding: 13px 24px !important;
        border-radius: 5px !important;
      }
      input, select, textarea, .form-control {
        box-sizing: border-box;
        max-width: 100%;
        padding: 9px 10px;
        border: 1px solid #3A3C45 !important;
        border-radius: 7px;
        background: #111216 !important;
        color: #F7F3EF !important;
      }
      input:focus, select:focus, textarea:focus {
        border-color: #FFBC0A !important;
        outline: none;
      }
      label, legend, .pfbc-label {
        color: #B8B3B0 !important;
      }
      .alert, .msg, .err_msg, .suc_msg {
        margin: 14px 0;
        padding: 12px 14px;
        border: 1px solid #34363F;
        border-radius: 8px;
        background: #202127;
        color: #F7F3EF;
      }
      footer {
        clear: both;
        width: 100%;
        margin: 42px 0 0;
        padding: 26px 18px 24px;
        border-top: 1px solid #34363F;
        background: #17181D !important;
        color: #B8B3B0 !important;
        text-align: center;
        box-sizing: border-box;
      }
      footer p, footer small {
        color: #B8B3B0 !important;
        margin: 8px 0;
      }
      footer a, .bottom_nav a {
        color: #FFBC0A !important;
      }
      footer [role="contentinfo"] {
        max-width: 1160px;
        margin-left: auto;
        margin-right: auto;
      }
      footer .ft_copy {
        float: none !important;
        display: block;
        margin: 0 auto 16px;
        text-align: center;
      }
      footer .ad_728_90,
      footer .ad_468_60 {
        margin-left: auto;
        margin-right: auto;
        text-align: center;
      }
      .bottom_nav {
        float: none !important;
        display: block;
        clear: both;
        max-width: 860px;
        margin: 12px auto 0;
        padding: 12px 0 0;
        border-top: 1px solid #34363F;
        text-align: center;
        line-height: 2;
      }
      .bottom_nav .dropdown_menu,
      .bottom_nav .ft_dm,
      .bottom_nav span,
      .bottom_nav a {
        display: inline-block;
        float: none !important;
        margin: 3px 7px;
        vertical-align: middle;
      }
      .bottom_nav .dropdown_item_css,
      .bottom_nav .dropdown_item {
        display: inline-block;
      }
      .bottom_nav .show_dropdown {
        display: inline !important;
        position: static !important;
        min-width: 0 !important;
        margin: 0 !important;
        padding: 0 !important;
        border: 0 !important;
        background: transparent !important;
        box-shadow: none !important;
      }
      .bottom_nav .show_dropdown li {
        display: inline-block;
        margin: 0 4px;
        list-style: none;
      }
      .bottom_nav .show_dropdown li a {
        display: inline-block;
        padding: 0;
      }
      .bottom_nav .dm_self {
        display: none !important;
      }
      .sharedchemistry-footer-brand {
        display: inline-block;
        margin-right: 14px;
        color: #F7F3EF;
        font-weight: bold;
        vertical-align: middle;
      }
      .sharedchemistry-footer-logo {
        display: inline-block;
        width: 86px;
        height: auto;
        margin: -8px 8px -10px 0;
        vertical-align: middle;
      }
      .sharedchemistry-footer-brand span {
        display: inline-block;
        vertical-align: middle;
      }
      .right.vs_marg {
        float: none !important;
        clear: both;
        width: auto;
        margin: 0;
        padding: 12px 18px 26px;
        background: #17181D;
        color: #8F8A88;
        text-align: center;
      }
      .right.vs_marg small,
      .right.vs_marg a {
        color: #8F8A88 !important;
      }
      #disclaimer-background {
        display: none;
        position: fixed !important;
        top: 0 !important;
        left: 0 !important;
        right: 0 !important;
        bottom: 0 !important;
        width: 100% !important;
        height: 100% !important;
        background: #101114 !important;
        opacity: 0.88;
        z-index: 9998 !important;
      }
      #disclaimer-dialog {
        box-sizing: border-box;
        display: none;
        position: fixed !important;
        top: 8% !important;
        left: 50% !important;
        width: 560px !important;
        max-width: 92% !important;
        margin-left: -280px !important;
        padding: 34px !important;
        border: 1px solid #34363F !important;
        border-radius: 12px !important;
        background: #202127 !important;
        color: #F7F3EF !important;
        z-index: 9999 !important;
      }
      #disclaimer-dialog h1 {
        color: #F7F3EF !important;
      }
      #disclaimer-dialog p {
        color: #B8B3B0 !important;
      }
      #agree-over18 {
        border-color: #EC0868 !important;
        background: #EC0868 !important;
        color: #fff !important;
      }
      #disagree-under18 {
        background: #17181D !important;
        color: #F7F3EF !important;
      }
      @media screen and (max-width: 900px) {
        .col-md-3, .col-md-4, .col-md-6, .col-md-8, .col-md-9, .col-md-12,
        .col-xs-3, .col-xs-4, .col-xs-6, .col-xs-8, .col-xs-9, .col-xs-12,
        .sharedchemistry-home-card {
          float: none;
          width: auto;
          height: auto;
          margin-left: 0;
          margin-bottom: 14px;
        }
        .navbar-header,
        .navbar-nav > li {
          float: none;
        }
        .navbar-nav > li > a {
          padding: 12px 14px;
        }
        .sharedchemistry-guest-brand h2 {
          font-size: 34px;
        }
        .sharedchemistry-header-logo {
          width: 92px;
          margin-top: -8px;
          margin-bottom: -10px;
        }
        .sharedchemistry-hero-logo {
          width: 210px;
        }
        .sharedchemistry-top-shell {
          min-height: 0;
          padding-top: 28px;
        }
        .sharedchemistry-top-logo,
        .sharedchemistry-guest-top-spacer,
        .sharedchemistry-main-left,
        .sharedchemistry-auto-wrap {
          float: none;
          width: auto;
          padding-right: 0;
        }
        .sharedchemistry-top-logo-img {
          width: 260px;
          margin: 0 auto 22px;
        }
        .login_block {
          position: static !important;
          width: auto !important;
          margin: 0 0 22px 0 !important;
        }
        .sharedchemistry-guest-banner {
          margin-bottom: 34px;
        }
        .sharedchemistry-main-left h2 {
          font-size: 34px;
        }
        .sharedchemistry-auto-wrap {
          margin-top: 26px;
        }
        #form_login_user input[type="email"],
        #form_login_user input[type="password"],
        #form_login_user button,
        #form_login_user input[type="submit"],
        .bt_login_remember,
        .bt_login_forgot {
          float: none !important;
          display: block;
          width: 100% !important;
          box-sizing: border-box !important;
          margin-right: 0 !important;
        }
      }
      @media screen and (max-width: 640px) {
        #disclaimer-dialog {
          left: 4% !important;
          right: 4% !important;
          width: auto !important;
          max-width: none !important;
          margin-left: 0 !important;
          top: 5% !important;
          padding: 24px !important;
        }
        .bottom_nav {
          max-width: 100%;
          line-height: 1.8;
        }
        .bottom_nav .dropdown_menu,
        .bottom_nav .ft_dm,
        .bottom_nav span,
        .bottom_nav a,
        .bottom_nav .show_dropdown li {
          margin: 4px 5px;
        }
        .sharedchemistry-main-actions .btn {
          display: block;
          margin-right: 0;
          text-align: center;
        }
      }
    </style>
    <!-- End CSS -->

    <!-- Begin Header JavaScript -->
    <script>var pH7Url={base:'{url_root}',relative:'{url_relative}',tpl:'{url_tpl}',stic:'{url_static}',tplImg:'{url_tpl_img}',tplJs:'{url_tpl_js}',tplMod:'{url_tpl_mod}',data:'{url_data}'};</script>
    {if $is_admin_auth}<script>pH7Url.admin_mod = '{url_admin_mod}';</script>{/if}
    {{ $design->externalJsFile(PH7_URL_STATIC . PH7_JS . 'jquery/jquery.js') }}
    <!-- End Header JavaScript -->

    {{ XmlDesignCore::sitemapHeaderLink() }}
    {{ XmlDesignCore::rssHeaderLinks() }}

    {designModel.analyticsApi()}
  </head>
  <body itemscope="itemscope" itemtype="http://schema.org/WebPage">

    <!-- Begin Header -->
    <header>
      {* If we aren't on the the splash page, then display the menu *}
      {if !$is_guest_homepage}
        {main_include 'top_menu.inc.tpl'}
      {/if}

      <noscript>
        <div class="noscript err_msg">
          {lang}JavaScript is disabled on your Web browser!<br /> Please enable JavaScript via the options of your Web browser in order to use this website.{/lang}
        </div>
      </noscript>

      {if $is_guest_homepage}
          <div class="sharedchemistry-top-shell">
              <div role="banner" id="logo" class="sharedchemistry-top-logo">
                  <h1 itemprop="name">
                      <a href="{{ $design->homePageUrl() }}" class="sharedchemistry-logo-link">
                          <img src="{url_tpl_img}sharedchemistry/logo.png" alt="SharedChemistry" class="sharedchemistry-top-logo-img" />
                          <span>SharedChemistry</span>
                      </a>
                  </h1>
              </div>
              <div class="sharedchemistry-guest-top-spacer"></div>
          </div>
          <div class="sharedchemistry-banner-wrap sharedchemistry-guest-banner">
              <img src="{url_tpl_img}sharedchemistry/banner.png" alt="{lang 'SharedChemistry private couples community'}" class="sharedchemistry-hero-banner" />
          </div>
      {/if}

      {* Heading groups (H1 to H4) *}
      {main_include 'headings.inc.tpl'}

      {* Don't display the top middle banner on the the splash page *}
      {if !$is_guest_homepage}
          <div role="banner" class="center ad_468_60">
              {designModel.ad(468, 60)}
          </div>
      {/if}

      <div class="clear"></div>
    </header>
    <!-- End Header -->

    <!-- Begin Popups -->
    <div id="box">
      <p></p>
    </div>
    <!-- End Popups -->

    <!-- Begin Content -->
    <main role="main" class="container" id="content">
      {* Alert Message *}
      {{ $design->flashMsg() }}
      <div class="msg"></div>

      {* Loading JS Lang *}
      {* The file must be before the content of the site to avoid that the "pH7LangCore"  object is undefined *}
      {{ $lang_file =  Framework\Translate\Lang::getJsFile(PH7_PATH_STATIC . PH7_JS . PH7_LANG) }}
      {{ $design->staticFiles('js', PH7_STATIC . PH7_JS, PH7_LANG . $lang_file) }}

      {if $is_guest_homepage}
        <div class="sharedchemistry-landing-stage">
          <div class="sharedchemistry-main-left">
            <h2>{lang 'A private space for genuine couples'}</h2>
            <p class="sharedchemistry-main-copy">
              {lang 'Create a couple profile, connect at your own pace, and meet other couples in a more private, trusted setting.'}
            </p>
            <p class="sharedchemistry-main-actions">
              <a href="{{ $design->url('user', 'signup', 'step1') }}" class="btn btn-primary sharedchemistry-primary-cta">
                {lang 'Create your couple profile'}
              </a>
              <a href="{{ $design->url('user', 'main', 'login') }}" class="btn btn-default sharedchemistry-secondary-cta" data-load="ajax">
                {lang 'Sign in'}
              </a>
            </p>
            <img src="{url_tpl_img}sharedchemistry/mask-woman.png" alt="{lang 'Private couples community'}" class="sharedchemistry-mask-woman" />
            <div class="sharedchemistry-community-copy">
              <h2>{lang 'A private couples community'}</h2>
              <h3>{lang 'Meet genuine couples near you'}</h3>
              <p>{lang 'Shared Chemistry is a private community for couples who want to meet other couples, build trust, and connect at their own pace.'}</p>
              <p>{lang 'Create a couple profile, share your interests, and meet genuine couples in your city or while travelling.'}</p>
            </div>
          </div>
          <div class="sharedchemistry-auto-wrap">
      {/if}

      {if !empty($manual_include)}
        {manual_include $manual_include}
      {elseif !empty($pOH_not_found)}
        {main_include 'error.inc.tpl'}
      {else}
        {auto_include}
      {/if}

      {if $is_guest_homepage}
          </div>
          <div class="clear"></div>
        </div>
      {/if}

      {if $is_guest_homepage}
        <div class="sharedchemistry-home-blocks">
          <div class="sharedchemistry-home-card first">
            <h3>{lang 'Private by design'}</h3>
            <p>{lang 'A calmer way to explore, with privacy and discretion at the center of the experience.'}</p>
          </div>
          <div class="sharedchemistry-home-card">
            <h3>{lang 'Couple-focused profiles'}</h3>
            <p>{lang 'Create a profile together and represent who you are as a couple, not just as individuals.'}</p>
          </div>
          <div class="sharedchemistry-home-card">
            <h3>{lang 'Discover locally or while travelling'}</h3>
            <p>{lang 'Meet nearby couples at home or make thoughtful connections before your next trip.'}</p>
          </div>
          <div class="sharedchemistry-home-card">
            <h3>{lang 'Built for genuine connections'}</h3>
            <p>{lang 'A warmer, more intentional space for conversations that can move at your pace.'}</p>
          </div>
          <div class="clear"></div>
        </div>
      {/if}
    </main>
    <div role="banner" class="center ad_468_60">
        {designModel.ad(468, 60)}
    </div>
    <!-- End Content -->

    <!-- Begin Footer -->
    <footer>
      <div role="banner" class="center ad_728_90">
          {designModel.ad(728, 90)}
      </div>

      <div role="contentinfo">
        <div class="ft_copy">
          {{ $design->littleSocialMediaWidgets() }}

          <p>
            &copy; <ph:date value="Y" /> <strong>{site_name}</strong>  {{ $design->link() }}
          </p>
        </div>
        {{ $design->langList() }}
        {main_include 'bottom_menu.inc.tpl'}
      </div>

      {if isDebug()}
        <div class="ft">
          <p><small>{{ $design->stat() }}</small></p>
        </div>
        <p class="small dark-red">
          {lang 'WARNING: Your site is in development mode! You can change the mode'} <a href="{{ $design->url(PH7_ADMIN_MOD,'tool','envmode') }}" title="{lang 'Change the Environment Mode'}" class="dark-red">{lang 'here'}</a>
        </p>
      {/if}
    </footer>

    <div class="clear"></div>
    <!-- End Footer -->

    <!-- Begin Footer JavaScript -->
    {{ $design->staticFiles('js', PH7_STATIC . PH7_JS, 'jquery/box.js,jquery/tipTip.js,bootstrap.js,common.js,str.js,holder.js') }}
    {{ $design->staticFiles('js', PH7_LAYOUT . PH7_TPL . PH7_TPL_NAME . PH7_SH . PH7_JS, 'global.js') }}
    {{ $design->externalJsFile(PH7_URL_STATIC . PH7_JS . 'jquery/jquery-ui.js') }} {* UI must be the last here, otherwise the jQueryUI buttons won't work *}

    {* SetUserActivity and User Chat *}
    {if $is_user_auth}
      {{ $design->staticFiles('js', PH7_STATIC . PH7_JS, 'setUserActivity.js,jquery/sound.js') }}

      {if $is_im_enabled}
        {{ $lang_file = Framework\Translate\Lang::getJsFile(PH7_PATH_TPL_SYS_MOD . 'im/' . PH7_TPL . PH7_DEFAULT_THEME . PH7_DS . PH7_JS . PH7_LANG) }}
        {{ $design->staticFiles('js', PH7_LAYOUT . PH7_SYS . PH7_MOD . 'im/' . PH7_TPL . PH7_DEFAULT_THEME . PH7_SH . PH7_JS, PH7_LANG . $lang_file . ',jquery.cookie.js,Messenger.js') }}
      {/if}
    {/if}

    {* Cookie info bar *}
    {if $is_cookie_consent_bar}
      <script src="https://cdn.jsdelivr.net/npm/cookie-bar/cookiebar-latest.min.js?always=1"></script>
    {/if}

    {* JS code Injection *}
    {{ $design->externalJsFile(PH7_RELATIVE.'asset/js/script.js') }}

    <!-- Other JavaScript files for modules etc. -->
    {{ $design->js() }}
    {designModel.files('js')}

    {if $is_user_auth}
      {main_include 'favicon_alert.inc.tpl'}
    {/if}

    <!-- Common Dialogs -->
    {{ $design->message() }}
    {{ $design->error() }}

    {if $is_disclaimer AND !AdminCore::isAdminPanel()}
      {{ $design->staticFiles('js', PH7_STATIC . PH7_JS . 'disclaimer', 'Disclaimer.js,common.js') }}
      {main_include 'disclaimer-dialog.inc.tpl'}
    {/if}
    <!-- End Footer JavaScript -->

{{ $design->htmlFooter() }}
