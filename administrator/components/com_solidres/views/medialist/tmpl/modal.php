<?php
/**
 ------------------------------------------------------------------------
 SOLIDRES - Accommodation booking extension for Joomla
 ------------------------------------------------------------------------
 * @author    Solidres Team <contact@solidres.com>
 * @website   https://www.solidres.com
 * @copyright Copyright (C) 2013 Solidres. All Rights Reserved.
 * @license   GNU General Public License version 3, or later
 ------------------------------------------------------------------------
 */

defined('_JEXEC') or die;

JFactory::getDocument()->addStyleDeclaration('	
	div[data-media-id].media-selected{
		border-color: #E91E63; 		
	}
');

?>

<div id="solidres">
    <div id="media-content">
		<?php require_once __DIR__ . '/library.php'; ?>
    </div>
</div>