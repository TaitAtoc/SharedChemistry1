<?php 
namespace PH7;
defined('PH7') or exit('Restricted access');
/*
Created on 2026-04-24 07:03:11
Compiled file from: /home/sharedchemistry/public_html/_protected/app/system/modules/admin123/views/base/tpl/main/index.tpl
Template Engine: PH7Tpl version 1.6.0 by Pierre-Henry Soria
*/
/**
 * @author     Pierre-Henry Soria
 * @email      hello@ph7builder.com
 * @link       https://ph7builder.com
 * @copyright  (c) 2011-2026, Pierre-Henry Soria. All Rights Reserved.
 */
?><?php if($show_get_started_section) { ?> <?php $this->display($this->getCurrentController() . PH7_DS . 'get_started_intro.inc.tpl', $this->registry->path_module_views . PH7_TPL_MOD_NAME . PH7_DS); } $this->display($this->getCurrentController() . PH7_DS . 'stat.tpl', $this->registry->path_module_views . PH7_TPL_MOD_NAME . PH7_DS); if($is_news_feed) { ?> <br /><hr /><br /> <?php $this->display($this->getCurrentController() . PH7_DS . 'news.inc.tpl', $this->registry->path_module_views . PH7_TPL_MOD_NAME . PH7_DS); } ?>