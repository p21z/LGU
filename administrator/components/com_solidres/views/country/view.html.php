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
 * View to edit a country.
 *
 * @package       Solidres
 * @subpackage    Country
 * @since         0.1.0
 */
class SolidresViewCountry extends JViewLegacy
{
	protected $state;
	protected $item;
	protected $form;

	public function display($tpl = null)
	{
		$this->state = $this->get('State');
		$this->form  = $this->get('Form');

		if ($errors = $this->get('Errors'))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));

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
		JFactory::getApplication()->input->set('hidemainmenu', true);
		include JPATH_COMPONENT . '/helpers/toolbar.php';
		HTMLHelper::addIncludePath(JPATH_COMPONENT . '/helpers/html');
		$user       = JFactory::getUser();
		$id         = $this->form->getValue('id');
		$isNew      = ($id == 0);
		$checkedOut = !($this->form->getValue('checked_out') == 0 || $this->form->getValue('checked_out') == $user->get('id'));
		$canDo      = SolidresHelper::getActions('', $this->form->getValue('id'));

		if ($isNew)
		{
			ToolbarHelper::title(JText::_('SR_ADD_NEW_COUNTRY'));
		}
		else
		{
			ToolbarHelper::title(JText::_('SR_EDIT_COUNTRY'));
		}

		// If not checked out, can save the item.
		if (!$checkedOut && $canDo->get('core.edit'))
		{
			ToolbarHelper::apply('country.apply');
			ToolbarHelper::save('country.save');
			ToolbarHelper::save2new('country.save2new');
		}

		// If an existing item, can save to a copy.
		if (!$isNew && $canDo->get('core.create'))
		{
			ToolbarHelper::save2copy('country.save2copy');
		}

		ToolbarHelper::cancel('country.cancel', empty($id) ? 'JToolbar_Cancel' : 'JToolbar_Close');

		if (SR_ISJ4)
		{
			ToolbarHelper::inlinehelp();
		}
	}
}
