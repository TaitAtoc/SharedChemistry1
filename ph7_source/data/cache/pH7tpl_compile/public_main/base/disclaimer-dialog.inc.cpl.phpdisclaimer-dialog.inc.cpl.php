<?php 
namespace PH7;
defined('PH7') or exit('Restricted access');
/*
Created on 2026-04-24 07:22:51
Compiled file from: /home/sharedchemistry/public_html/templates/themes/base/tpl/disclaimer-dialog.inc.tpl
Template Engine: PH7Tpl version 1.6.0 by Pierre-Henry Soria
*/
/**
 * @author     Pierre-Henry Soria
 * @email      hello@ph7builder.com
 * @link       https://ph7builder.com
 * @copyright  (c) 2011-2026, Pierre-Henry Soria. All Rights Reserved.
 */
?><?php $terms_url = Framework\Mvc\Router\Uri::get('page', 'main', 'terms') ; $privacy_url = Framework\Mvc\Router\Uri::get('page', 'main', 'privacy') ;?><div id="disclaimer-dialog"> <div class="center"> <h1> <?php echo t('Welcome to %site_name% ❤️'); ?> </h1> <p class="italic"> <?php echo t('This site contains sexually-oriented adult materials which may be offensive to some viewers.'); ?> </p> <p class="bold"> <?php echo t('To continue, please acknowledge and confirm you are over <span class="underline">18</span>.'); ?> </p> <p> <button id="agree-over18" class="btn btn-success btn-lg"> <?php echo t('I am over 18'); ?> </button> <button id="disagree-under18" class="btn btn-secondary btn-lg"> <?php echo t('I am under 18'); ?> </button> </p> <p> <small> <?php echo t('By entering to "%site_url%", you are agreeing to the <a href="%0%" target="_blank" rel="nofollow">Terms of Use</a> and <a href="%1%" target="_blank" rel="nofollow">Privacy Policy</a>.', $terms_url, $privacy_url); ?> </small> </p> </div></div><div id="disclaimer-background"></div>