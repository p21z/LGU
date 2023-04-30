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
use Joomla\CMS\Language\Text;
use Joomla\CMS\Factory;

/**
 * View to edit a RoomType.
 *
 * @package       Solidres
 * @subpackage    RoomType
 * @since         0.1.0
 */
class SolidresViewRoomType extends JViewLegacy
{
	protected $form;
	protected $customerGroups;

	public function display($tpl = null)
	{
		$this->form                 = $this->get('Form');
		$this->nullDate             = Factory::getDbo()->getNullDate();
		$doc                        = Factory::getDocument();
		$params                     = JComponentHelper::getParams('com_solidres');
		$this->currency_id          = $params->get('default_currency_id');
		$this->solidresMedia        = SRFactory::get('solidres.media.media');
		$this->enabledComplexTariff = SRPlugin::isEnabled('user') && SRPlugin::isEnabled('complextariff');

		HTMLHelper::_('jquery.framework');
		SRHtml::_('jquery.datepicker');
		HTMLHelper::_('script', 'jui/cms.js', ['version' => 'auto', 'relative' => true]);
		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', ['version' => SRVersion::getHashVersion(), 'relative' => true]);

		$roomList  = $this->form->getValue('roomList');
		$rowIdRoom = isset($roomList) ? count($roomList) : 0;

		Text::script('SR_FIELD_ROOM_CAN_NOT_DELETE_ROOM');
		$doc->addScriptDeclaration("
			Solidres.jQuery(function($) {
			    $('#toolbar').srRoomType({rowidx : 0, rowIdRoom: $rowIdRoom});
			});
		");

		if ($errors = $this->get('Errors'))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		JPluginHelper::importPlugin('solidres');
		Factory::getApplication()->triggerEvent('onSolidresRoomTypeViewLoad', array(&$this->form));

		$this->addToolbar();

		parent::display($tpl);
	}

	protected function addToolbar()
	{
		Factory::getApplication()->input->set('hidemainmenu', true);
		$user       = Factory::getUser();
		$id         = $this->form->getValue('id');
		$isNew      = ($id == 0);
		$checkedOut = !($this->form->getValue('checked_out') == 0 || $this->form->getValue('checked_out') == $user->get('id'));
		$canDo      = SolidresHelper::getActions('', $id);

		if ($isNew)
		{
			ToolbarHelper::title(Text::_('SR_ADD_NEW_ROOM_TYPE'));
		}
		else
		{
			ToolbarHelper::title(Text::sprintf('SR_EDIT_ROOM_TYPE', $this->form->getValue('name')));
		}

		// If not checked out, can save the item.
		if (!$checkedOut && $canDo->get('core.edit'))
		{
			ToolbarHelper::apply('roomtype.apply');
			ToolbarHelper::save('roomtype.save');
			ToolbarHelper::save2new('roomtype.save2new');
		}

		// If an existing item, can save to a copy.
		if (!$isNew && $canDo->get('core.create'))
		{
			ToolbarHelper::save2copy('roomtype.save2copy');
		}

		ToolbarHelper::cancel('roomtype.cancel', empty($id) ? 'JToolbar_Cancel' : 'JToolbar_Close');

		SRToolBarHelper::mediaManager();

		if (SR_ISJ4)
		{
			ToolbarHelper::inlinehelp();
		}
	}
}
