<?php 
namespace PH7;
defined('PH7') or exit('Restricted access');
/*
Created on 2026-04-24 08:27:32
Compiled file from: /home/sharedchemistry/public_html/_protected/app/system/modules/user/views/base/tpl/progressbar.inc.tpl
Template Engine: PH7Tpl version 1.6.0 by Pierre-Henry Soria
*/
/**
 * @author     Pierre-Henry Soria
 * @email      hello@ph7builder.com
 * @link       https://ph7builder.com
 * @copyright  (c) 2011-2026, Pierre-Henry Soria. All Rights Reserved.
 */
?><div class="progress"> <div class="progress-bar progress-bar-striped active" role="progressbar" aria-valuenow="<?php echo $progressbar_percentage; ?>" aria-valuemin="0" aria-valuemax="100" style="width:<?php echo $progressbar_percentage; ?>%" ><?php echo $progressbar_percentage; ?>% - <?php echo t('STEP'); ?> <?php echo $progressbar_step; ?>/<?php echo $progressbar_total_steps; ?> </div></div>