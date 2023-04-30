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

use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\HTML\HTMLHelper;

if (!SRPlugin::isEnabled('customfield'))
{
	class SolidresViewCustomfields extends JViewLegacy
	{
		function display($tpl = null)
		{
			$this->addToolbar();

			parent::display($tpl);
		}

		protected function addToolbar()
		{
			ToolbarHelper::title(JText::_('SR_SUBMENU_CUSTOM_FIELDS'));
			include JPATH_COMPONENT . '/helpers/toolbar.php';
			SRToolBarHelper::customLink('index.php?option=com_solidres', 'JToolbar_Close', 'fa fa-arrow-left');
		}
	}
}
else
{
	require_once SR_PLUGIN_CUSTOMFIELD_ADMINISTRATOR . '/views/customfields/view.html.php';
}