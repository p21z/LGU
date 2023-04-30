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

if (SRPlugin::isEnabled('statistics'))
{
	require_once SRPlugin::getAdminPath('statistics') . '/views/calendars/view.html.php';
}
else
{
	class SolidresViewCalendars extends JViewLegacy
	{
		public function display($tpl = null)
		{
			$this->addToolbar();
			$this->setLayout('notice');

			parent::display($tpl);
		}

		protected function addToolbar()
		{
			ToolbarHelper::title(JText::_('SR_STATISTICS_CALENDARS'));
			SRToolBarHelper::customLink('index.php?option=com_solidres', 'JToolbar_Close', 'arrow-left');
		}
	}
}