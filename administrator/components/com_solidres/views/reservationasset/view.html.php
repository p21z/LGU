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

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Toolbar\ToolbarHelper;

/**
 * View to edit a reservation asset.
 *
 * @package       Solidres
 * @subpackage    ReservationAsset
 * @since         0.1.0
 */
class SolidresViewReservationAsset extends JViewLegacy
{
	protected $form;

	public function display($tpl = null)
	{
		$this->form = $this->get('Form');

		if ($errors = $this->get('Errors'))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		$this->lat           = $this->form->getValue('lat', '');
		$this->lng           = $this->form->getValue('lng', '');
		$this->solidresMedia = SRFactory::get('solidres.media.media');

		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));
		JLoader::register('SRSystemHelper', JPATH_LIBRARIES . '/solidres/system/helper.php');

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
		$user       = JFactory::getUser();
		$id         = $this->form->getValue('id');
		$isNew      = ($id == 0);
		$checkedOut = !($this->form->getValue('checked_out') == 0 || $this->form->getValue('checked_out') == $user->get('id'));
		$canDo      = SolidresHelper::getActions('', $id);

		if ($isNew)
		{
			ToolbarHelper::title(JText::_('SR_ADD_NEW_ASSET'));
		}
		else
		{
			ToolbarHelper::title(JText::sprintf('SR_EDIT_ASSET', $this->form->getValue('name')));
		}

		// If not checked out, can save the item.
		if (!$checkedOut && $canDo->get('core.edit'))
		{
			ToolbarHelper::apply('reservationasset.apply');
			ToolbarHelper::save('reservationasset.save');
			ToolbarHelper::save2new('reservationasset.save2new');
		}

		// If an existing item, can save to a copy.
		if (!$isNew && $canDo->get('core.create'))
		{
			ToolbarHelper::save2copy('reservationasset.save2copy');
		}

		if ($menuId = (int) $this->form->getValue('menu_id'))
		{
			$bar    = JToolBar::getInstance();
			$app    = JApplicationCms::getInstance('site');
			$router = $app::getRouter('site');
			$uri    = $router->build('index.php?Itemid=' . $menuId);

			$bar->appendButton('Link', 'eye', 'SR_VIEW_MENU_IN_FRONEND', str_replace('administrator/', '', $uri->toString()));
		}

		ToolbarHelper::cancel('reservationasset.cancel', empty($id) ? 'JToolbar_Cancel' : 'JToolbar_Close');

		SRToolBarHelper::mediaManager();

		if (SR_ISJ4)
		{
			ToolbarHelper::inlinehelp();
		}
	}
}
