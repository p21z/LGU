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

JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');
JLoader::register('SRUtilities', SRPATH_LIBRARY . '/utilities/utilities.php');
use Joomla\CMS\HTML\Helpers\Sidebar;

/**
 * Solidres Helper class
 *
 * @since        0.1.0
 */
class SolidresHelper
{
	public static $extention = 'com_solidres';

	/**
	 * Gets a list of the actions that can be performed
	 *
	 * @param    int $categoryId           The category ID.
	 * @param   int  $reservation_asset_id The reservation asset_id
	 *
	 * @return    JObject
	 */
	public static function getActions($categoryId = 0, $reservation_asset_id = 0)
	{
		$user   = JFactory::getUser();
		$result = new JObject;

		if (empty($reservation_asset_id) && empty($categoryId))
		{
			$assetName = 'com_solidres';
		}
		else if (empty($reservation_asset_id) && !empty($categoryId))
		{
			$assetName = 'com_solidres.category.' . (int) $categoryId;
		}
		else if (!empty($reservation_asset_id) && empty($categoryId))
		{
			$assetName = 'com_solidres.reservationasset.' . (int) $reservation_asset_id;
		}

		$actions = array(
			'core.admin', 'core.manage', 'core.create', 'core.edit', 'core.edit.state', 'core.delete'
		);

		foreach ($actions as $action)
		{
			$result->set($action, $user->authorise($action, $assetName));
		}

		return $result;
	}

	public static function getCouponOptions()
	{
		$options = array();
		$model   = JModelLegacy::getInstance('Coupons', 'SolidresModel', array('ignore_request' => true));
		$model->setState('filter.state', 1);
		$results   = $model->getItems();
		$options[] = JHTML::_('select.option', '', JText::_('- Select a coupon -'));

		if (!empty($results))
		{
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->coupon_name);
			}
		}

		return $options;
	}

	public static function getCurrencyOptions()
	{
		$options = array();
		$model   = JModelLegacy::getInstance('Currencies', 'SolidresModel', array('ignore_request' => true));

		$model->setState('filter.state', 1);
		$model->setState('list.ordering', 'u.currency_name');
		$results = $model->getItems();

		if (!empty($results))
		{
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->currency_name);
			}
		}

		return $options;
	}

	public static function getCustomerGroupOptions($showAll = true)
	{
		$options = array();
		$results = array();
		if (SRPlugin::isEnabled('user'))
		{
			$model = JModelLegacy::getInstance('CustomerGroups', 'SolidresModel', array('ignore_request' => true));
			$model->setState('list.start', 0);
			$model->setState('list.limit', 0);
			$model->setState('filter.state', 1);
			$model->setState('list.ordering', 'a.name');
			$results = $model->getItems();
		}

		if ($showAll)
		{
			$options[] = JHTML::_('select.option', -1, JText::_('SR_FILTER_ALL'));
		}

		$options[] = JHTML::_('select.option', 'NULL', JText::_('SR_GENERAL_CUSTOMER_GROUP'));

		if (!empty($results))
		{
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->name);
			}
		}

		return $options;
	}

	/**
	 * Get asset <option> to build <select>
	 *
	 * @param bool $showAll Display the show all option
	 *
	 * @return array $options An array of <option>
	 * @throws Exception
	 */
	public static function getReservationAssetOptions($showAll = true)
	{
		$options = array();
		$raModel = JModelLegacy::getInstance('ReservationAssets', 'SolidresModel', array('ignore_request' => true));
		$raModel->setState('list.select', 'a.id, a.name');
		$raModel->setState('list.start', 0);
		$raModel->setState('list.limit', 0);
		$raModel->setState('filter.state', 1);
		$raModel->setState('list.ordering', 'a.name');
		$raModel->setState('hub.ignore', true);

		if (JFactory::getApplication()->isClient('site'))
		{
			$user = JFactory::getUser();
			JTable::addIncludePath(SRPlugin::getAdminPath('user') . '/tables');
			JModelLegacy::addIncludePath(SRPlugin::getAdminPath('user') . '/models', 'SolidresModel');
			$customerTable = JTable::getInstance('Customer', 'SolidresTable');
			$customerTable->load(array('user_id' => $user->get('id')));
			$raModel->setState('filter.partner_id', $customerTable->id);
		}

		$results = $raModel->getItems();

		if ($showAll)
		{
			$options[] = JHTML::_('select.option', '', '&nbsp;');
		}

		if (!empty($results))
		{
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->name);
			}
		}

		return $options;
	}

	/**
	 * Get country select <option>
	 *
	 * @return array $option An array of country <option>
	 */
	public static function getCountryOptions()
	{
		$options        = array();
		$countriesModel = JModelLegacy::getInstance('Countries', 'SolidresModel', array('ignore_request' => true));

		$countriesModel->setState('list.start', 0);
		$countriesModel->setState('list.limit', 0);
		$countriesModel->setState('filter.state', 1);
		$countriesModel->setState('list.ordering', 'r.name');
		$results = $countriesModel->getItems();

		usort($results, function ($a, $b) {
			return strcmp($a->name, $b->name);
		});

		$options[] = JHTML::_('select.option', '', JText::_('SR_FIELD_COUNTRY_SELECT'));

		if (!empty($results))
		{
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->name);
			}
		}

		return $options;
	}

	public static function getTaxOptions($assetId = 0, $countryId = 0)
	{
		$options = array();
		$model   = JModelLegacy::getInstance('Taxes', 'SolidresModel', array('ignore_request' => true));

		$model->setState('list.start', 0);
		$model->setState('list.limit', 0);
		$model->setState('filter.state', 1);
		$model->setState('list.ordering', 'r.name');
		if ($assetId > 0)
		{
			$model->setState('filter.reservation_asset_id', $assetId);
		}

		if ($countryId > 0)
		{
			$model->setState('filter.country_id', $countryId);
		}

		$results = $model->getItems();

		$options[] = JHTML::_('select.option', '', '&nbsp;');

		if (!empty($results))
		{
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->name . ' (' . $item->rate * 100 . '%)');
			}
		}

		return $options;
	}

	/**
	 * Get all state of a specific country
	 *
	 * @param    int $country_id The country ID
	 *
	 * @return    array    An array of country <option>
	 */
	public static function getGeoStateOptions($country_id)
	{
		$options        = array();
		$geoStatesModel = JModelLegacy::getInstance('States', 'SolidresModel', array('ignore_request' => true));
		$geoStatesModel->setState('list.start', 0);
		$geoStatesModel->setState('list.limit', 0);
		$geoStatesModel->setState('filter.state', 1);
		$geoStatesModel->setState('list.ordering', 'name');

		if ($country_id > 0)
		{
			$geoStatesModel->setState('filter.country_id', $country_id);
		}

		$results = $geoStatesModel->getItems();

		if (!empty($results))
		{
			$options[] = JHTML::_('select.option', null, JText::_('SR_SELECT'));
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->name);
			}
		}

		return $options;
	}

	/**
	 * Get all state of a specific country
	 *
	 * @param    int    $reservationAssetId The reservation asset ID
	 * @param    string $format
	 *
	 * @return    array    An array of room types <option>
	 */
	public static function getRoomTypeOptions($reservationAssetId, $format = 'html')
	{
		$options = array();
		$user    = JFactory::getUser();

		if (JFactory::getApplication()->isClient('site') && !SRUtilities::isAssetPartner($user->get('id'), $reservationAssetId))
		{
			return $options;
		}

		$model = JModelLegacy::getInstance('RoomTypes', 'SolidresModel', array('ignore_request' => true));
		$model->setState('list.start', 0);
		$model->setState('list.limit', 0);
		$model->setState('filter.state', 1);
		$model->setState('list.ordering', 'name');

		if ($reservationAssetId > 1)
		{
			$model->setState('filter.reservation_asset_id', $reservationAssetId);
		}

		$results = $model->getItems();

		if (!empty($results))
		{
			if ($format == 'html')
			{
				foreach ($results as $item)
				{
					$options[] = JHTML::_('select.option', $item->id, $item->name);
				}

				return $options;
			}
		}

		return $results;
	}

	public static function getGalleryOptions()
	{
		$dbo     = JFactory::getDbo();
		$options = array();
		$query   = $dbo->getQuery(true);
		$query->select('*')
			->from($dbo->quoteName('#__extensions'))
			->where($dbo->quoteName('folder') . ' = ' . $dbo->quote('solidres'))
			->where($dbo->quoteName('enabled') . ' = 1')
			->where($dbo->quoteName('element') . ' LIKE ' . $dbo->quote('%gallery%') . ' OR ' . $dbo->quoteName('element') . ' LIKE ' . $dbo->quote('%slideshow%'));

		$dbo->setQuery($query);

		$results = $dbo->loadObjectList();

		if (!empty($results))
		{
			$options[] = JHTML::_('select.option', null, JText::_('SR_SELECT_DEFAULT_GALLERY'));
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->element, $item->element);
			}
		}

		return $options;
	}

	public static function getPaymentPluginOptions($listOnly = true, $includeBuiltIn = false)
	{
		$dbo     = JFactory::getDbo();
		$options = array();
		$query   = $dbo->getQuery(true);
		$query->select('*')
			->from($dbo->quoteName('#__extensions'))
			->where($dbo->quoteName('folder') . ' = ' . $dbo->quote('solidrespayment'))
			->where($dbo->quoteName('enabled') . ' = 1');

		$dbo->setQuery($query);

		$results = $dbo->loadObjectList();

		if ($listOnly)
		{
			return $results;
		}

		if (!empty($results))
		{
			$options[] = JHTML::_('select.option', null, JText::_('SR_SELECT_PAYMENT_METHODS'));

			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->element, $item->element);
			}
		}

		return $options;
	}

	public static function getCustomerOptions($showAll = true)
	{
		$options = array();
		$results = array();

		if (SRPlugin::isEnabled('user'))
		{
			JModelLegacy::addIncludePath(SRPlugin::getAdminPath('user') . '/models', 'SolidresModel');
			$model = JModelLegacy::getInstance('Customers', 'SolidresModel', array('ignore_request' => true));
			$model->setState('list.start', 0);
			$model->setState('list.limit', 0);
			$model->setState('filter.state', 0);
			$model->setState('list.ordering', 'jname');
			$results = $model->getItems();
		}

		if ($showAll)
		{
			$options[] = JHTML::_('select.option', -1, JText::_('SR_FILTER_ALL'));
		}

		$options[] = JHTML::_('select.option', '', JText::_('SR_FIELD_CUSTOMER_SELECT_LABEL'));

		if (!empty($results))
		{
			foreach ($results as $item)
			{
				$options[] = JHTML::_('select.option', $item->id, $item->jname);
			}
		}

		return $options;
	}

	public static function getStatusesList($type = 0, $scope = 0)
	{
		static $statuses = array();

		if (!isset($statuses[$scope . ':' . $type]))
		{
			$statusModel = JModelLegacy::getInstance('Statuses', 'SolidresModel', array('ignore_request' => true));
			$statusModel->setState('list.select', 'a.id, a.code AS value, a.label AS text, a.color_code, a.email_text');
			$statusModel->setState('filter.state', 1);
			$statusModel->setState('filter.scope', $scope);
			$statusModel->setState('filter.type', $type);
			$statusModel->setState('list.ordering', 'a.ordering');
			$statusModel->setState('list.direction', 'asc');
			$statuses[$scope . ':' . $type] = $statusModel->getItems();
		}

		return $statuses[$scope . ':' . $type];
	}

	public static function savePaymentHistory(array $data, $checkOwner = true)
	{
		JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');
		$model = JModelLegacy::getInstance('PaymentHistory', 'SolidresModel', array('ignore_request' => true));

		if (!$model->save($data, $checkOwner))
		{
			JFactory::getApplication()->enqueueMessage($model->getError(), 'error');

			return false;
		}

		return true;
	}

	/**
	 * @param $reservationId
	 * @param $scope
	 * @param $paymentType 0 is for guest payment, 1 is for commission payout
	 *
	 *
	 * @since 2.12.0
	 *
	 */
	public static function displayPaymentHistory($reservationId, $scope = 0, $paymentType = 0)
	{
		$db    = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select('a.id, a.currency_id, a.payment_method_id AS element')
			->where('a.id = ' . (int) $reservationId);

		if ($scope)
		{
			JPluginHelper::importPlugin('experiencepayment');
			$query->select('a.experience_id AS scopeId, a2.element')
				->from($db->qn('#__sr_experience_reservations', 'a'))
				->leftJoin($db->qn('#__extensions', 'a2') . ' ON a2.extension_id = a.payment_method_id');
		}
		else
		{
			JPluginHelper::importPlugin('solidrespayment');
			$query->select('a.reservation_asset_id AS scopeId')
				->from($db->qn('#__sr_reservations', 'a'));
		}

		$db->setQuery($query);
		$reservation = $db->loadObject();

		if (!is_object($reservation))
		{
			throw new RuntimeException('Reservation ID not found.');
		}

		/**
		 * @var Joomla\CMS\Form\Form        $form
		 * @var SolidresModelPaymentHistory $model
		 */

		JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');
		$model = JModelLegacy::getInstance('PaymentHistory', 'SolidresModel', array('ignore_request' => true));
		$model->setState('filter.search', 'reservation:' . $reservation->id);
		$model->setState('filter.scope', $scope);
		$model->setState('filter.payment_type', $paymentType);
		$model->setState('list.ordering', 'a.payment_date');
		$model->setState('list.direction', 'DESC');
		$model->setState('list.start', 0);
		$model->setState('list.limit', 0);
		$form    = $model->getForm();
		$xmlList = $form->getXml()->xpath('//field[@name="payment_method_id"]');

		if ($payments = $model->getPaymentElements($scope, $reservation->scopeId))
		{
			foreach ($payments as $value => $text)
			{
				$option = $xmlList[0]->addChild('option', $text);
				$option->addAttribute('value', $value);
			}
		}

		$form->setFieldAttribute('payment_status', 'scope', $scope);
		$form->setValue('scope', null, $scope);
		$form->setValue('payment_type', null, $paymentType);
		$form->setValue('payment_method_id', null, $reservation->element);
		$form->setValue('reservation_id', null, $reservation->id);
		$form->setValue('currency_id', null, $reservation->currency_id);

		echo SRLayoutHelper::render('solidres.paymenthistory', [
			'form'         => $form,
			'paymentItems' => $model->getItems(),
			'payments'     => $payments,
			'scope'        => $scope,
			'paymentType'  => $paymentType
		]);
	}

	public static function getOriginsList($scope = 0)
	{
		JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');
		$model = JModelLegacy::getInstance('Origins', 'SolidresModel', ['ignore_request' => true]);
		$model->setState('filter.state', 1);
		$model->setState('filter.scope', $scope);
		$model->setState('list.start', 0);
		$model->setState('list.limit', 0);

		return $model->getItems();
	}

	public static function addSubmenu($vName)
	{
		Sidebar::addEntry(
			JText::_('SR_SUBMENU_ASSETS_CATEGORY'),
			'index.php?option=com_categories&extension=com_solidres',
			$vName == 'categories'
		);

		if ($vName == 'categories')
		{
			JToolbarHelper::title(
				JText::sprintf('COM_CATEGORIES_CATEGORIES_TITLE', JText::_('com_solidres')),
				'solidres-categories');
		}

		Sidebar::addEntry(
			JText::_('SR_SUBMENU_ASSETS_LIST'),
			'index.php?option=com_solidres&view=reservationassets',
			$vName == 'reservationassets'
		);

		Sidebar::addEntry(
			JText::_('SR_SUBMENU_ROOM_TYPE_LIST'),
			'index.php?option=com_solidres&view=roomtypes',
			$vName == 'roomtypes'
		);

		Sidebar::addEntry(
			JText::_('SR_SUBMENU_RESERVATIONS_LIST'),
			'index.php?option=com_solidres&view=reservations',
			$vName == 'reservations'
		);
	}
}
