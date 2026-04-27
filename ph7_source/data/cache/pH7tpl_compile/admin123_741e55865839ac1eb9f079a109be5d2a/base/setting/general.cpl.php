<?php 
namespace PH7;
defined('PH7') or exit('Restricted access');
/*
Created on 2026-04-24 07:05:39
Compiled file from: /home/sharedchemistry/public_html/_protected/app/system/modules/admin123/views/base/tpl/setting/general.tpl
Template Engine: PH7Tpl version 1.6.0 by Pierre-Henry Soria
*/
/**
 * @author     Pierre-Henry Soria
 * @email      hello@ph7builder.com
 * @link       https://ph7builder.com
 * @copyright  (c) 2011-2026, Pierre-Henry Soria. All Rights Reserved.
 */
?><ol id="toc"> <li><a href="#general"><span><?php echo t('General Settings'); ?></span></a></li> <li><a href="#icon"><span><?php echo t('Logo'); ?></span></a></li> <li><a href="#design"><span><?php echo t('Design (colors)'); ?></span></a></li> <li><a href="#registration"><span><?php echo t('Registration'); ?></span></a></li> <?php if($is_video_enabled OR $is_picture_enabled) { ?> <li><a href="#pic_vid"><span><?php echo t('Picture and Video'); ?></span></a></li> <?php } ?> <li><a href="#moderation"><span><?php echo t('Moderation'); ?></span></a></li> <li><a href="#email"><span><?php echo t('Email'); ?></span></a></li> <li><a href="#security"><span><?php echo t('Security'); ?></span></a></li> <li><a href="#spam"><span><?php echo t('Spam'); ?></span></a></li> <li><a href="#api"><span><?php echo t('API'); ?></span></a></li> <li><a href="#automation"><span><?php echo t('Automation'); ?></span></a></li></ol><?php SettingForm::display() ;?><script> /* Check if the Setting page is loading from 'p=registration' * If so, scroll down to show the "Default Membership Group" first (this is used by the Payment module) */ var sHash = location.hash.substr(1); if (sHash === 'p=registration') { var $target = $('html, body'); $target.animate({scrollTop: $target.height()}, 1000); }</script>