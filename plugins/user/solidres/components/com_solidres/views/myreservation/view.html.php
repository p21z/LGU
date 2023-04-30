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

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\CMS\Table\Table;
use Joomla\CMS\Toolbar\ToolbarHelper;

/**
 * View to edit a Reservation in front end
 *
 * @package     Solidres
 * @subpackage	Reservation
 * @since		0.6.0
 */
class SolidresViewMyReservation extends SRViewLegacy
{
	protected $state;
	protected $form;
	protected $returnPage;
	protected $invoiceTable;
	protected $id;
	protected $reservationAssetId;
	public $itemid = 0;
	protected $fields = [];

	public function display($tpl = null)
	{
		$this->state              = $this->get('State');
		$this->form               = $this->get('Form');
		$this->returnPage         = $this->getModel()->getReturnPage();
		$this->id                 = $this->form->getValue('id');
		$this->reservationAssetId = $this->form->getValue('reservation_asset_id');
		$app                      = Factory::getApplication();
		$this->itemid             = $app->input->get('Itemid', 0);
		$formParams               = $this->form->getValue('params');
		$language                 = Factory::getLanguage();

		if (!in_array($this->form->getValue('payment_method_id'), ['paylater', 'bankwire']))
		{
			$language->load('plg_solidrespayment_' . $this->form->getValue('payment_method_id'), JPATH_ADMINISTRATOR, null, 1);
		}

		if (count($errors = $this->get('Errors')))
		{
			throw new Exception(implode(PHP_EOL, $errors), 500);
		}

		Text::script("SR_RESERVATION_NOTE_NOTIFY_CUSTOMER");
		Text::script("SR_RESERVATION_NOTE_DISPLAY_IN_FRONTEND");

		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', ['version' => SRVersion::getHashVersion(), 'relative' => true]);
		$language->load('plg_solidres_invoice', JPATH_ADMINISTRATOR, null, 1);
		$language->load('com_solidres', JPATH_ADMINISTRATOR . '/components/com_solidres', null, 1);

		$authorised = $formParams->{'access-edit'};

		if ($authorised !== true)
		{
			$app->enqueueMessage(Text::_('JERROR_ALERTNOAUTHOR'), 'error');
			$app->setHeader('status', 403, true);

			return false;
		}

		$solidresRoomType        = SRFactory::get('solidres.roomtype.roomtype');
		$this->lengthOfStay      = (int) $solidresRoomType->calculateDateDiff($this->form->getValue('checkin'), $this->form->getValue('checkout'));
		$this->config            = ComponentHelper::getParams('com_solidres');
		$this->showPoweredByLink = $this->config->get('show_solidres_copyright', '1');
		$this->dateFormat        = $this->config->get('date_format', 'd-m-Y');

		if (SRPlugin::isEnabled('invoice'))
		{
			PluginHelper::importPlugin('solidres');
			$this->invoiceTable = $app->triggerEvent('onSolidresLoadReservation', [$this->form->getValue('id')]);
		}

		if (SRPlugin::isEnabled('hub'))
		{
			SRLayoutHelper::addIncludePath([
				SRPlugin::getLayoutPath('hub') . '/layouts',
			]);
		}

		SRLayoutHelper::addIncludePath([
			SRPlugin::getLayoutPath('user') . '/layouts',
			SRPlugin::getSitePath('user') . '/layouts',
		]);

		if (SRPlugin::isEnabled('customfield'))
		{
			$db    = Factory::getDbo();
			$query = $db->getQuery(true)
				->select('a.category_id')
				->from($db->quoteName('#__sr_reservation_assets', 'a'))
				->where('a.id = ' . (int) $this->reservationAssetId);
			$db->setQuery($query);

			if ($cid = $db->loadResult())
			{
				$this->fields = SRCustomFieldHelper::findFields(['context' => 'com_solidres.customer'], [$cid]);
			}
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
		JLoader::register('Joomla\\CMS\\Toolbar\\ToolbarHelper', JPATH_LIBRARIES . '/src/Toolbar/ToolbarHelper.php');
		ToolbarHelper::back();

		Table::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/tables');
		$tableAsset = Table::getInstance('ReservationAsset', 'SolidresTable');
		$tableAsset->load($this->reservationAssetId);
		$this->canAmend  = true;
		$this->canCancel = true;

		$propertyParams  = json_decode($tableAsset->params, true);
		$amendThreshold  = isset($propertyParams['amend_threshold']) && !empty($propertyParams['amend_threshold']) ? $propertyParams['amend_threshold'] : 15;
		$cancelThreshold = isset($propertyParams['cancel_threshold']) && !empty($propertyParams['cancel_threshold']) ? $propertyParams['cancel_threshold'] : 15;

		$this->amendUntil  = (new DateTime($this->form->getValue('checkin')))
			->sub(new DateInterval('P' . $amendThreshold . 'D'));
		$this->cancelUntil = (new DateTime($this->form->getValue('checkin')))
			->sub(new DateInterval('P' . $cancelThreshold . 'D'));

		$checkIn  = new DateTime($this->form->getValue('checkin'));
		$today    = new DateTime(date('Y-m-d'));
		$interval = $checkIn->diff($today)->format('%a');

		if ($interval < $amendThreshold || $this->amendUntil < $today)
		{
			$this->canAmend = false;
		}

		if ($interval < $cancelThreshold
			|| $this->cancelUntil < $today
			|| $this->form->getValue('state') == ComponentHelper::getParams('com_solidres')->get('cancel_state', 4)
			|| !Factory::getUser()->authorise('core.edit.state', 'com_solidres'))
		{
			$this->canCancel = false;
		}

		if ($this->canCancel)
		{
			ToolbarHelper::link('index.php?option=com_solidres&task=myreservation.cancelReservation&Itemid=' . $this->itemid . '&id=' . $this->form->getValue('id') . '&return=' . $this->returnPage, 'SR_CANCEL_RESERVATION', 'cancel-circle');
		}

		if ($this->canAmend)
		{
			ToolbarHelper::link('index.php?option=com_solidres&task=myreservation.amend&Itemid=' . $this->itemid . '&id=' . $this->form->getValue('id') . '&return=' . $this->returnPage, 'JTOOLBAR_AMEND', 'edit');
		}
	}
}
