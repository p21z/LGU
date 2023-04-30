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
use Joomla\CMS\Language\Text;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Factory;

/**
 * View to edit a customer group.
 *
 * @package     Solidres
 * @subpackage	CustomerGroup
 * @since		0.1.0
 */
class SolidresViewCustomerGroup extends SRViewLegacy
{
	protected $state;
	protected $form;

	public function display($tpl = null)
	{
		$this->state		= $this->get('State');
		$this->form			= $this->get('Form');

		if (count($errors = $this->get('Errors')))
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
	 * @since	1.6
	 */
	protected function addToolbar()
	{
		Factory::getApplication()->input->set('hidemainmenu', true);
		include JPATH_COMPONENT.'/helpers/toolbar.php';
		$id         = $this->form->getValue('id');
		$isNew		= ($id == 0);
		$canDo		= SolidresHelper::getActions('', $id);
		
		if($isNew)
        {
			ToolbarHelper::title(Text::_('SR_ADD_NEW_CUSTOMERGROUP'));
		}
        else
        {
			ToolbarHelper::title(Text::sprintf('SR_EDIT_CUSTOMERGROUP', $this->form->getValue('name')));
		}
		
		JHtml::addIncludePath(JPATH_COMPONENT.'/helpers/html');

		// If not checked out, can save the item.
		if ($canDo->get('core.edit'))
        {
			ToolbarHelper::apply('customergroup.apply');
			ToolbarHelper::save('customergroup.save');
			ToolbarHelper::save2new('customergroup.save2new');
		}
		
		// If an existing item, can save to a copy.
		if (!$isNew && $canDo->get('core.create'))
        {
			ToolbarHelper::save2copy('customergroup.save2copy');
		}
		
		if (empty($id))
        {
			ToolbarHelper::cancel('customergroup.cancel', 'JToolbar_Cancel');
		}
        else
        {
			ToolbarHelper::cancel('customergroup.cancel', 'JToolbar_Close');
		}

		ToolbarHelper::divider();
	}
}
