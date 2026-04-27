<?php 
namespace PH7;
defined('PH7') or exit('Restricted access');
/*
Created on 2026-04-24 08:24:54
Compiled file from: /home/sharedchemistry/public_html/_protected/app/system/modules/user/views/base/tpl/main/user_promo_block.inc.tpl
Template Engine: PH7Tpl version 1.6.0 by Pierre-Henry Soria
*/
/**
 * @author     Pierre-Henry Soria
 * @email      hello@ph7builder.com
 * @link       https://ph7builder.com
 * @copyright  (c) 2011-2026, Pierre-Henry Soria. All Rights Reserved.
 */
?><h1 class="red3 italic underline s_bMarg"><?php echo $slogan; ?></h1><?php if($is_users_block) { ?> <div class="center profiles_window thumb pic_block"> <?php $userDesignModel->profiles(0, $number_profiles) ;?> </div><?php } ?><div class="s_tMarg" id="promo_text"> <h2>Meet genuine couples near you</h2> <?php echo $promo_text; ?></div>