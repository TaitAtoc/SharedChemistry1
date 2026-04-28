<?php 
namespace PH7;
defined('PH7') or exit('Restricted access');
/*
Created on 2026-04-24 07:00:21
Compiled file from: /home/sharedchemistry/public_html/templates/themes/base/tpl/headings.inc.tpl
Template Engine: PH7Tpl version 1.6.0 by Pierre-Henry Soria
*/
/**
 * @author     Pierre-Henry Soria
 * @email      hello@ph7builder.com
 * @link       https://ph7builder.com
 * @copyright  (c) 2011-2026, Pierre-Henry Soria. All Rights Reserved.
 */
?><div class="center" id="headings"> <?php foreach(['h1' => 'h1_title', 'h2' => 'h2_title', 'h3' => 'h3_title', 'h4' => 'h4_title'] as $heading => $headingVar) { ?> <?php if(!empty($$headingVar)) { ?> <<?php echo $heading; ?>><?php echo $$headingVar ;?></<?php echo $heading; ?>> <?php } ?> <?php } ?></div>