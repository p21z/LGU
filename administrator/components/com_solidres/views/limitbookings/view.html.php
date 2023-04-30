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

defined('_JEXEC') or die('Restricted access');

use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\HTML\HTMLHelper;

/**
 * Limit Bookings view class
 *
 * @package       Solidres
 * @subpackage    LimitBooking
 * @since         0.6.0
 */
class SolidresViewLimitBookings extends JViewLegacy
{
	protected $state;
	protected $items;
	protected $pagination;

	public function display($tpl = null)
	{
		if (SRPlugin::isEnabled('limitbooking'))
		{
			$this->state         = $this->get('State');
			$this->items         = $this->get('Items');
			$this->pagination    = $this->get('Pagination');
			$this->filterForm    = $this->get('FilterForm');
			$this->activeFilters = $this->get('ActiveFilters');
			$solidresConfig      = JComponentHelper::getParams('com_solidres');
			$this->dateFormat    = $solidresConfig->get('date_format', 'd-m-Y');

			if ($errors = $this->get('Errors'))
			{
				throw new Exception(implode("\n", $errors), 500);
			}

			HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));
			JFactory::getLanguage()->load('plg_solidres_limitbooking', JPATH_ADMINISTRATOR, null, 1);

			$this->addToolbar();
		}

		parent::display($tpl);
	}

	/**
	 * Add the page title and toolbar.
	 *
	 * @since    1.6
	 */
	protected function addToolbar()
	{
		$state = $this->get('State');
		$canDo = SolidresHelper::getActions();

		ToolbarHelper::title(JText::_('SR_MANAGE_LIMITBOOKINGS'));

		if ($canDo->get('core.create'))
		{
			ToolbarHelper::addNew('limitbooking.add');
		}

		if ($canDo->get('core.edit'))
		{
			ToolbarHelper::editList('limitbooking.edit');
		}

		if ($canDo->get('core.edit.state'))
		{
			ToolbarHelper::publish('limitbookings.publish', 'JTOOLBAR_PUBLISH', true);
			ToolbarHelper::unpublish('limitbookings.unpublish', 'JTOOLBAR_UNPUBLISH', true);
		}

		if ($state->get('filter.state') == -2 && $canDo->get('core.delete'))
		{
			ToolbarHelper::deleteList('', 'limitbookings.delete', 'JTOOLBAR_EMPTY_TRASH');
		}
		else if ($canDo->get('core.edit.state'))
		{
			ToolbarHelper::trash('limitbookings.trash');
		}

		if ($canDo->get('core.admin'))
		{
			ToolbarHelper::preferences('com_solidres');
		}
	}
}
