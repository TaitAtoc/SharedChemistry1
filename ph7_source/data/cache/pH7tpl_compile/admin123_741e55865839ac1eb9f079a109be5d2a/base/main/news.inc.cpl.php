<?php 
namespace PH7;
defined('PH7') or exit('Restricted access');
/*
Created on 2026-04-24 07:03:11
Compiled file from: /home/sharedchemistry/public_html/_protected/app/system/modules/admin123/views/base/tpl/main/news.inc.tpl
Template Engine: PH7Tpl version 1.6.0 by Pierre-Henry Soria
*/
/**
 * @author     Pierre-Henry Soria
 * @email      hello@ph7builder.com
 * @link       https://ph7builder.com
 * @copyright  (c) 2011-2026, Pierre-Henry Soria. All Rights Reserved.
 */
?><div class="center"> <h2 class="underline"> <?php echo t('Latest <a href="%software_website%" title="%software_name%">pH7Builder Software</a>\'s News'); ?> </h2> <?php XmlDesignCore::softwareNews(10) ;?> <p class="s_tMarg italic"> <a href="<?php echo $software_blog_url; ?>"><?php echo t('» Read more news! «'); ?></a> 🗞 </p></div>