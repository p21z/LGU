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
 * Themes view class
 *
 * @package       Solidres
 * @subpackage    Theme
 * @since         0.1.0
 */
class SolidresViewThemes extends JViewLegacy
{
	protected $state;
	protected $items;
	protected $pagination;

	public function display($tpl = null)
	{
		if (SRPlugin::isEnabled('hub'))
		{
			$this->state         = $this->get('State');
			$this->items         = $this->get('Items');
			$this->pagination    = $this->get('Pagination');
			$this->filterForm    = $this->get('FilterForm');
			$this->activeFilters = $this->get('ActiveFilters');

			if ($errors = $this->get('Errors'))
			{
				throw new Exception(implode("\n", $errors), 500);
			}

			HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));

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

		ToolbarHelper::title(JText::_('SR_MANAGE_THEME'));

		if ($canDo->get('core.create'))
		{
			ToolbarHelper::addNew('theme.add');
		}

		if ($canDo->get('core.edit'))
		{
			ToolbarHelper::editList('theme.edit');
		}

		if ($canDo->get('core.edit.state'))
		{
			ToolbarHelper::publish('themes.publish', 'JTOOLBAR_PUBLISH', true);
			ToolbarHelper::unpublish('themes.unpublish', 'JTOOLBAR_UNPUBLISH', true);
		}

		if ($state->get('filter.state') == -2 && $canDo->get('core.delete'))
		{
			ToolbarHelper::deleteList('', 'themes.delete', 'JTOOLBAR_EMPTY_TRASH');
		}
		else if ($canDo->get('core.edit.state'))
		{
			ToolbarHelper::trash('themes.trash');
		}

		if ($canDo->get('core.admin'))
		{
			ToolbarHelper::preferences('com_solidres');
		}
	}
}
