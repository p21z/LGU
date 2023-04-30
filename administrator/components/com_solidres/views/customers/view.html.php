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
 * Customers view class
 *
 * @package       Solidres
 * @subpackage    Customer
 * @since         0.1.0
 */
class SolidresViewCustomers extends JViewLegacy
{
	protected $state;
	protected $items;
	protected $pagination;

	public function display($tpl = null)
	{
		if (SRPlugin::isEnabled('user'))
		{
			$this->state         = $this->get('State');
			$this->items         = $this->get('Items');
			$this->pagination    = $this->get('Pagination');
			$this->filterForm    = $this->get('FilterForm');
			$this->activeFilters = $this->get('ActiveFilters');
			$this->user          = JFactory::getUser();
			$this->userId        = $this->user->get('id');
			$this->listOrder     = $this->state->get('list.ordering');
			$this->listDirn      = $this->state->get('list.direction');

			HTMLHelper::_('script', 'multiselect.js');
			HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));

			if ($errors = $this->get('Errors'))
			{
				throw new Exception(implode("\n", $errors), 500);
			}

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
		$canDo = SolidresHelper::getActions();

		ToolbarHelper::title(JText::_('SR_MANAGE_CUSTOMERS'));

		if ($canDo->get('core.create'))
		{
			ToolbarHelper::addNew('customer.add');
		}
		if ($canDo->get('core.edit'))
		{
			ToolbarHelper::editList('customer.edit');
		}

		if ($canDo->get('core.edit.state'))
		{
			ToolbarHelper::unpublish('customers.block', 'SR_TOOLBAR_BLOCK', true);
			ToolbarHelper::custom('customers.unblock', 'unblock.png', 'unblock_f2.png', 'SR_TOOLBAR_UNBLOCK', true);
		}

		if ($canDo->get('core.delete'))
		{
			ToolbarHelper::deleteList('', 'customers.delete', 'JTOOLBAR_DELETE');
		}
	}

	/**
	 * Build an array of block/unblock user states to be used by jgrid.state,
	 * State options will be different for any user
	 * and for currently logged in user
	 *
	 * @param   boolean $self True if state array is for currently logged in user
	 *
	 * @return  array  a list of possible states to display
	 *
	 * @since  0.3.0
	 */
	public function blockStates($self = false)
	{
		if ($self)
		{
			$states = array(
				1 => array(
					'task'           => 'unblock',
					'text'           => '',
					'active_title'   => 'SR_CUSTOMERS_CUSTOMER_FIELD_BLOCK_DESC',
					'inactive_title' => '',
					'tip'            => true,
					'active_class'   => 'unpublish',
					'inactive_class' => 'unpublish'
				),
				0 => array(
					'task'           => 'block',
					'text'           => '',
					'active_title'   => '',
					'inactive_title' => 'SR_CUSTOMERS_CUSTOMERS_ERROR_CANNOT_BLOCK_SELF',
					'tip'            => true,
					'active_class'   => 'publish',
					'inactive_class' => 'publish'
				)
			);
		}
		else
		{
			$states = array(
				1 => array(
					'task'           => 'unblock',
					'text'           => '',
					'active_title'   => 'SR_CUSTOMER_TOOLBAR_UNBLOCK',
					'inactive_title' => '',
					'tip'            => true,
					'active_class'   => 'unpublish',
					'inactive_class' => 'unpublish'
				),
				0 => array(
					'task'           => 'block',
					'text'           => '',
					'active_title'   => 'SR_CUSTOMERS_CUSTOMER_FIELD_BLOCK_DESC',
					'inactive_title' => '',
					'tip'            => true,
					'active_class'   => 'publish',
					'inactive_class' => 'publish'
				)
			);
		}

		return $states;
	}
}
