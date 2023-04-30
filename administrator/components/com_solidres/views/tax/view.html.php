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
 * View to edit a tax.
 *
 * @package       Solidres
 * @subpackage    Tax
 * @since         0.1.0
 */
class SolidresViewTax extends JViewLegacy
{
	protected $state;
	protected $form;

	public function display($tpl = null)
	{
		$model       = $this->getModel();
		$this->state = $model->getState();
		$this->form  = $model->getForm();

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
		$id    = $this->form->getValue('id');
		$isNew = ($id == 0);
		$canDo = SolidresHelper::getActions('', $id);

		if ($isNew)
		{
			ToolbarHelper::title(JText::_('SR_ADD_NEW_TAX'));
		}
		else
		{
			ToolbarHelper::title(JText::sprintf('SR_EDIT_TAX', $this->form->getValue('name')));
		}

		HTMLHelper::addIncludePath(JPATH_COMPONENT . '/helpers/html');

		// If not checked out, can save the item.
		if ($canDo->get('core.edit'))
		{
			ToolbarHelper::apply('tax.apply');
			ToolbarHelper::save('tax.save');
			ToolbarHelper::addNew('tax.save2new', 'JToolbar_Save_and_new');
		}

		// If an existing item, can save to a copy.
		if (!$isNew && $canDo->get('core.create'))
		{
			ToolbarHelper::save2copy('tax.save2copy');
		}

		ToolbarHelper::cancel('tax.cancel', empty($id) ? 'JToolbar_Cancel' : 'JToolbar_Close');

		if (SR_ISJ4)
		{
			ToolbarHelper::inlinehelp();
		}
	}
}
