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
 * View to edit a Reservation.
 *
 * @package       Solidres
 * @subpackage    Reservation
 * @since         0.1.0
 */
class SolidresViewReservation extends JViewLegacy
{
	protected $state;
	protected $form;
	protected $invoiceTable;
	protected $reservationAsset;

	public function display($tpl = null)
	{
		Factory::getLanguage()->load('com_solidres', JPATH_SITE . '/components/com_solidres');

		$model                        = $this->getModel();
		$this->state                  = $model->getState();
		$this->form                   = $model->getForm();
		$this->solidresConfig         = JComponentHelper::getParams('com_solidres');
		$this->dateFormat             = $this->solidresConfig->get('date_format', 'd-m-Y');
		$this->customer_id            = $this->form->getValue('customer_id', 0);
		$this->customerIdentification = '';
		$this->defaultAssetId         = 0;
		$this->totalPublishedAssets   = 0;
		$this->isMobile               = $this->form->getValue('customer_ismobile', null);

		if ($this->form->getValue('id') > 0)
		{
			$this->baseCurrency = new SRCurrency(0, $this->form->getValue('currency_id'));
		}

		$this->createdByUser = null;
		if ($this->form->getValue('created_by', 0))
		{
			$this->createdByUser = Factory::getUser($this->form->getValue('created_by'));
		}

		$assetModel  = JModelLegacy::getInstance('ReservationAsset', 'SolidresModel');
		$assetsModel = JModelLegacy::getInstance('ReservationAssets', 'SolidresModel', array('ignore_request' => true));
		if ($this->form->getValue('reservation_asset_id', 0) > 0)
		{
			$this->reservationAsset = $assetModel->getItem($this->form->getValue('reservation_asset_id', 0));
		}
		else
		{
			$assetsModel->setState('filter.state', 1);
			$this->totalPublishedAssets = count($assetsModel->getItems());

			if ($this->totalPublishedAssets == 1)
			{
				$this->defaultAssetId = SRUtilities::getDefaultAssetId();
			}
		}

		$this->bookingRequireApproval = $this->reservationAsset->params['booking_require_approval'] ?? 0;

		if ($this->customer_id > 0 && SRPlugin::isEnabled('user'))
		{
			JModelLegacy::addIncludePath(SRPlugin::getAdminPath('user') . '/models', 'SolidresModel');
			$customerModel                = JModelLegacy::getInstance('Customer', 'SolidresModel');
			$customer                     = $customerModel->getItem($this->customer_id);
			$this->customerIdentification = $customer->name . ' ( ' . $customer->id . ' - ' . (empty($customer->customer_group_name) ? Text::_('SR_GENERAL_CUSTOMER_GROUP') : $customer->customer_group_name) . ' )';
		}

		if ($errors = $this->get('Errors'))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		Factory::getDocument()->addScriptDeclaration('
			Solidres.child_max_age_limit = ' . $this->solidresConfig->get('child_max_age_limit', 17) . ';
			Solidres.jQuery(function($) {
				$("a#payment-data-delete-btn").on(\'click\', function(e){
				    if (confirm("' . Text::_('SR_DELETE_RESERVATION_PAYMENT_DATA_CONFIRM') . '") != true) {
				        e.preventDefault();
				    }
				});
			});
		');

		Text::script("SR_RESERVATION_NOTE_NOTIFY_CUSTOMER");
		Text::script("SR_RESERVATION_NOTE_DISPLAY_IN_FRONTEND");
		Text::script('SR_PROCESSING');
		Text::script('SR_NEXT');
		Text::script('SR_CHILD');
		Text::script('SR_CHILD_AGE_SELECTION_JS');
		Text::script('SR_CHILD_AGE_SELECTION_1_JS');
		Text::script('SR_WARN_ONLY_LETTERS_N_SPACES_MSG');
		Text::script('SR_WARN_INVALID_EXPIRATION_MSG');

		JPluginHelper::importPlugin('solidres');

		$jsOptions = ['version' => SRVersion::getHashVersion(), 'relative' => true];
		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', $jsOptions);
		SRHtml::_('jquery.popover');
		SRHtml::_('jquery.datepicker');

		$this->lengthOfStay = (int) SRUtilities::calculateDateDiff($this->form->getValue('checkin'), $this->form->getValue('checkout'));
		if (SRPlugin::isEnabled('invoice'))
		{
			$this->invoiceTable = Factory::getApplication()->triggerEvent('onSolidresLoadReservation', array($this->form->getValue('id')));
		}

		Factory::getApplication()->triggerEvent('onSolidresReservationViewLoad', array(&$this->form));

		$this->addToolbar();

		$model->recordAccess();

		if (!empty($this->reservationAsset->category_id))
		{
			Factory::getLanguage()->load('com_solidres_category_' . $this->reservationAsset->category_id, JPATH_SITE . '/components/com_solidres');
		}

		$this->reservationStatusesList = SolidresHelper::getStatusesList(0);
		$this->paymentStatusesList     = SolidresHelper::getStatusesList(1);
		$this->statuses                = $this->paymentStatuses = $this->statusesColor = $this->paymentsColor = $source = $this->originsList = [];

		foreach ($this->reservationStatusesList as $status)
		{
			$this->statuses[$status->value]      = $status->text;
			$this->statusesColor[$status->value] = $status->color_code;
		}

		foreach ($this->paymentStatusesList as $status)
		{
			$this->paymentStatuses[$status->value] = $status->text;
			$this->paymentsColor[$status->value]   = $status->color_code;
		}

		$originId = $this->form->getValue('origin_id', null, 0);

		foreach (SolidresHelper::getOriginsList() as $originItem)
		{
			$this->originsList[$originItem->id] = [
				'value' => $originItem->id,
				'text'  => $originItem->name,
			];
		}

		if (isset($this->originsList[$originId]))
		{
			$this->originValue = $this->originsList[$originId]['value'];
			$this->originText  = $this->originsList[$originId]['text'];
		}
		else
		{
			$this->originValue = $this->originText = $this->form->getValue('origin');
		}

		$this->paymentMethodId = $this->form->getValue('payment_method_id', '');
		$this->user            = Factory::getUser();
		$this->canEdit         = $this->user->authorise('core.edit', 'com_solidres');

		if (!empty($this->paymentMethodId))
		{
			Factory::getLanguage()->load('plg_solidrespayment_' . $this->paymentMethodId, JPATH_PLUGINS . '/solidrespayment/' . $this->paymentMethodId);
		}

		$this->assetId            = (int) $this->form->getValue('reservation_asset_id');
		$this->reservationId      = (int) $this->form->getValue('id');
		$this->paymentMethodLabel = Text::_('SR_PAYMENT_METHOD_' . $this->paymentMethodId);
		$this->fieldEnabled       = SRPlugin::isEnabled('customfield');
		$this->cid                = $this->reservationAsset->category_id ?? [];

		$this->roomFields = false;
		if ($this->fieldEnabled)
		{
			$this->roomFields = SRCustomFieldHelper::findFields(['context' => 'com_solidres.room'], [$this->cid], $this->form->getValue('customer_language') ?: null);
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
		Factory::getApplication()->input->set('hidemainmenu', true);
		$id         = $this->form->getValue('id');
		$isNew      = ($id == 0);
		$isApproved = $this->form->getValue('is_approved');
		$checkInOut = $this->form->getValue('checkinout_status', '');
		$bar        = JToolbar::getInstance();
		$today      = new DateTime();
		$checkout   = new DateTime($this->form->getValue('checkout'));
		$today->setTime(0, 0, 0);
		$checkout->setTime(0, 0, 0);

		$approveLabel = '';
		if ($this->bookingRequireApproval)
		{
			$approveLabel = $isApproved ? Text::_('SR_RESERVATION_APPROVED') : Text::_('SR_RESERVATION_NOT_APPROVED');
		}

		ToolbarHelper::title($isNew ? Text::_('SR_ADD_NEW_RESERVATION') : Text::_('SR_EDIT_RESERVATION') . ' ' . $this->form->getValue('code') . ' ' . $approveLabel);

		if ($this->_layout == 'edit')
		{
			$bar->appendButton('Link', 'pencil', 'JTOOLBAR_AMEND', JRoute::_('index.php?option=com_solidres&task=reservationbase.amend&id=' . $id));

			if ($checkInOut == '' && $checkout >= $today)
			{
				$bar->appendButton('Link', 'key', 'SR_CHECKIN', JRoute::_('index.php?option=com_solidres&task=reservationbase.doCheckInOut&id=' . $id));
			}

			if ($checkInOut == 1 && $checkout >= $today)
			{
				$bar->appendButton('Link', 'sign-out', 'SR_CHECKOUT', JRoute::_('index.php?option=com_solidres&task=reservationbase.doCheckInOut&id=' . $id));
			}

			if ($checkInOut != '' && $checkInOut == 0 && $checkout >= $today)
			{
				$bar->appendButton('Link', 'recycle', 'SR_RESET_CHECKINOUT', JRoute::_('index.php?option=com_solidres&task=reservationbase.doCheckInOut&id=' . $id . '&reset=1'));
			}

			if ($this->bookingRequireApproval)
			{
				if (!$isApproved)
				{
					$bar->appendButton('Link', 'publish', 'JTOOLBAR_APPROVE', JRoute::_('index.php?option=com_solidres&task=reservationbase.approve&id=' . $id));
				}
			}

			if ($id && SRPLugin::isEnabled('feedback'))
			{
				JLoader::register('SolidresFeedBackHelper', SRPlugin::getAdminPath('feedback') . '/helpers/feedback.php');

				if (!SolidresFeedBackHelper::hasFeedback(0, $id))
				{
					$bar->appendButton('Link', 'comments', 'SR_SEND_REQUEST_FEEDBACK', JRoute::_('index.php?option=com_solidres&task=feedback.sendRequestFeedback&scope=0&reservationId=' . $id . '&' . JSession::getFormToken() . '=1'));
				}
			}
		}

		if (empty($id))
		{
			ToolbarHelper::cancel('reservationbase.cancel');
		}
		else
		{
			if ($this->_layout == 'edit2')
			{
				$bar->appendButton('Link', 'eye', 'JTOOLBAR_VIEW', JRoute::_('index.php?option=com_solidres&task=reservationbase.edit&id=' . $id));
			}

			ToolbarHelper::cancel('reservationbase.cancel', 'JTOOLBAR_CLOSE');

			$bar->appendButton('Link', 'download', 'SR_VOUCHER', JRoute::_('index.php?option=com_solidres&task=reservationbase.downloadVoucher&id=' . $id . '&' . JSession::getFormToken() . '=1'));

			if (SRPlugin::isEnabled('invoice') && Factory::getUser()->authorise('core.reservation.manage', 'com_solidres'))
			{
				$fileData = SRPlugin::getAdminPath('invoice') . '/views/registrationcard/data.json';

				if (is_file($fileData))
				{
					$printLink = JRoute::_('index.php?option=com_solidres&view=registrationcard&layout=print&tmpl=component&reservationId=' . $id, false);

					$bar->appendButton('Custom', '<a href="' . $printLink . '" onclick="window.open(this.href,\'win2\',\'status=no,toolbar=no,scrollbars=yes,titlebar=no,menubar=no,resizable=yes,width=640,height=480,directories=no,location=no\'); return false;" class="btn btn-small"><i class="icon-print"></i> ' . Text::_('SR_INVOICE_PRINT_REGISTRATION_CARD') . '</a>');
				}
			}
		}
	}
}