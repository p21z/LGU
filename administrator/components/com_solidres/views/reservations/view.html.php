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

/**
 * Reservation view class
 *
 * @package       Solidres
 * @subpackage    Reservation
 * @since         0.1.0
 */
class SolidresViewReservations extends JViewLegacy
{
	protected $state;
	protected $items;
	protected $pagination;

	public function display($tpl = null)
	{
		$this->state          = $this->get('State');
		$this->items          = $this->get('Items');
		$this->pagination     = $this->get('Pagination');
		$this->filterForm     = $this->get('FilterForm');
		$this->activeFilters  = $this->get('ActiveFilters');
		$this->solidresConfig = JComponentHelper::getParams('com_solidres');
		$this->dateFormat     = $this->solidresConfig->get('date_format', 'd-m-Y');

		if ($errors = $this->get('Errors'))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));

		if (SRPlugin::isEnabled('channelmanager'))
		{
			JLoader::register('plgSolidresChannelManager', SRPATH_LIBRARY . '/channelmanager/channelmanager.php');
		}

		$this->addToolbar();

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

		ToolbarHelper::title(JText::_('SR_MANAGE_RESERVATION'));

		if ($canDo->get('core.create'))
		{
			ToolbarHelper::addNew('reservationbase.add');
		}

		if ($canDo->get('core.edit'))
		{
			ToolbarHelper::custom('reservationbase.edit', 'eye', '', 'JTOOLBAR_VIEW', true);
			ToolbarHelper::custom('reservationbase.amend', 'edit', '', 'JTOOLBAR_AMEND', true);
			ToolbarHelper::custom('reservations.export', 'download', '', 'SR_RESERVATION_EXPORT', true);
		}

		if ($state->get('filter.state') == [$this->solidresConfig->get('trashed_state', -2)] && $canDo->get('core.delete'))
		{
			ToolbarHelper::deleteList('', 'reservations.delete', 'JTOOLBAR_EMPTY_TRASH');
		}
		else if ($canDo->get('core.edit.state'))
		{
			ToolbarHelper::trash('reservations.trash');
		}

		SRToolBarHelper::printTable();

		if ($canDo->get('core.admin'))
		{
			ToolbarHelper::preferences('com_solidres');
		}
	}
}
