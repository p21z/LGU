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

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory as CMSFactory;
use Joomla\CMS\MVC\Model\BaseDatabaseModel;
use Joomla\CMS\User\User;
use Joomla\Utilities\ArrayHelper;

defined('_JEXEC') or die;

/**
 * Reservation Asset model.
 *
 * @package       Solidres
 * @subpackage    ReservationAsset
 * @since         0.1.0
 */
class SolidresModelReservationAsset extends JModelAdmin
{
	public $typeAlias = 'com_solidres.property';

	private static $taxesCache = [];

	private static $countriesCache = [];

	private static $currenciesCache = [];

	private static $customersCache = [];

	/**
	 * Constructor.
	 *
	 * @param    array An optional associative array of configuration settings.
	 *
	 * @see        JController
	 * @since      1.6
	 */
	public function __construct($config = array())
	{
		parent::__construct($config);

		$this->event_after_delete  = 'onReservationAssetAfterDelete';
		$this->event_after_save    = 'onReservationAssetAfterSave';
		$this->event_before_delete = 'onReservationAssetBeforeDelete';
		$this->event_before_save   = 'onReservationAssetBeforeSave';
		$this->event_change_state  = 'onReservationAssetChangeState';
	}

	/**
	 * Method to test whether a record can be deleted.
	 *
	 * @param    object    A record object.
	 *
	 * @return    boolean    True if allowed to delete the record. Defaults to the permission set in the component.
	 * @since    1.6
	 */
	protected function canDelete($record)
	{
		$user = JFactory::getUser();

		if (JFactory::getApplication()->isClient('administrator'))
		{
			return parent::canDelete($record);
		}
		else
		{
			return SRUtilities::isAssetPartner($user->get('id'), $record->id);
		}
	}

	/**
	 * Method to test whether a record can be deleted.
	 *
	 * @param    object    A record object.
	 *
	 * @return    boolean    True if allowed to change the state of the record. Defaults to the permission set in the component.
	 * @since    1.6
	 */
	protected function canEditState($record)
	{
		$user = JFactory::getUser();

		if (JFactory::getApplication()->isClient('administrator'))
		{
			return parent::canEditState($record);
		}
		else
		{
			return SRUtilities::isAssetPartner($user->get('id'), $record->id);
		}
	}

	/**
	 * Returns a Table object, always creating it.
	 *
	 * @param   string  $type    The table type to instantiate
	 * @param   string  $prefix  A prefix for the table class name. Optional.
	 * @param   array   $config  Configuration array for model. Optional.
	 *
	 * @return  JTable    A database object
	 */
	public function getTable($type = 'ReservationAsset', $prefix = 'SolidresTable', $config = array())
	{
		return JTable::getInstance($type, $prefix, $config);
	}

	/**
	 * Method to get the record form.
	 *
	 * @param    array   $data     An optional array of data for the form to interogate.
	 * @param    boolean $loadData True if the form is to load its own data (default case), false if not.
	 *
	 * @return    JForm    A JForm object on success, false on failure
	 * @since    1.6
	 */
	public function getForm($data = array(), $loadData = true)
	{
		$form = $this->loadForm('com_solidres.reservationasset',
			'reservationasset',
			array('control' => 'jform', 'load_data' => $loadData));

		if (empty($form))
		{
			return false;
		}

		$payments = $form->getFieldsets('payments');
		$id       = (int) $form->getValue('id', null, 0);

		foreach ($payments as $name => $fieldset)
		{
			foreach ($form->getFieldset($name) as $field)
			{
				$form->load(
					'<form>
						<fields name="payments">
							<fieldset name="' . $name . '">
								<field
									name="' . $name . '_base_rate"
									type="list"
									label="SR_FIELD_PAYMENT_BASE_RATE_LABEL"
									description="SR_FIELD_PAYMENT_BASE_RATE_DESC"
									default="0">
									<option value="0">SR_FIELD_PAYMENT_BASE_RATE_NOT_SET</option>
									<option value="1">SR_FIELD_PAYMENT_BASE_RATE_ADD</option>
									<option value="2">SR_FIELD_PAYMENT_BASE_RATE_SUB</option>
									<option value="3">SR_FIELD_PAYMENT_BASE_RATE_ADD_PERCENT</option>
									<option value="4">SR_FIELD_PAYMENT_BASE_RATE_SUB_PERCENT</option>
								</field>
								<field
									name="' . $name . '_base_rate_value"
									type="text"
									label="SR_FIELD_PAYMENT_BASE_RATE_VALUE_LABEL"
									description="SR_FIELD_PAYMENT_BASE_RATE_VALUE_DESC"
									default=""
									filter="float"
									showon="' . $name . '_base_rate!:0"/>
								
								<field
					                name="' . $name . '_visibility"
					                type="list"
					                label="SR_PAYMENT_VISIBILITY_LABEL"
					                description="SR_PAYMENT_VISIBILITY_DESC"
					                default="0"
						        >
						        	<option value="0">SR_PAYMENT_VISIBILITY_ALL</option>
						            <option value="1">SR_PAYMENT_VISIBILITY_FRONTEND</option>
						            <option value="2">SR_PAYMENT_VISIBILITY_BACKEND</option>
						        </field>
							</fieldset>
						</fields>
					</form>'
				);
			}
		}

		if ($id > 0)
		{
			JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_menus/tables');
			$menuTable = JTable::getInstance('Menu');

			if ($menuTable->load(array(
				'component_id' => JComponentHelper::getComponent('com_solidres')->id,
				'link'         => 'index.php?option=com_solidres&view=reservationasset&id=' . $id,
				'type'         => 'component',
				'client_id'    => 0,
			))
			)
			{
				$form->removeField('add_to_menu');
				$form->removeField('add_to_menutype');
				$form->removeField('menu_title');
				$form->removeField('menu_alias');
				$form->setValue('menu_id', null, $menuTable->id);
			}

			if ($loadData && !empty($payments))
			{

				$db    = $this->getDbo();
				$query = $db->getQuery(true)
					->select('a.data_key, a.data_value')
					->from($db->qn('#__sr_config_data', 'a'))
					->where('a.data_key LIKE ' . $db->q('payments/%'))
					->where('a.scope_id = ' . (int) $id);

				$db->setQuery($query);

				if ($data = $db->loadObjectList())
				{
					$paymentData = array();

					foreach ($data as $value)
					{
						$key   = trim(basename($value->data_key), '/');
						$value = $value->data_value;

						if (!is_numeric($value))
						{
							$arrValue = @json_decode($value, true);

							if (json_last_error() == JSON_ERROR_NONE && is_array($arrValue))
							{
								$value = $arrValue;
							}
						}

						$paymentData[$key] = $value;
					}

					$form->bind(array('payments' => $paymentData));
				}
			}
		}

		return $form;
	}

	/**
	 * Method to get the data that should be injected in the form.
	 *
	 * @return    mixed    The data for the form.
	 * @since    1.6
	 */
	protected function loadFormData()
	{
		// Check the session for previously entered form data.
		$data = JFactory::getApplication()->getUserState('com_solidres.edit.reservationasset.data', array());

		if (empty($data))
		{
			$data = $this->getItem();

			// Staffs data
			if ($data->id)
			{
				$db    = $this->getDbo();
				$query = $db->getQuery(true)
					->select($db->quoteName('staff_id'))
					->from($db->quoteName('#__sr_property_staff_xref'))
					->where($db->quoteName('property_id') . ' = ' . (int) $data->id)
					->order($db->quoteName('id') . ' ASC');
				$db->setQuery($query);

				if ($staffs = $db->loadColumn())
				{
					$data->staffs = [];
					$jUser        = new User;

					foreach ($staffs as $staffId)
					{
						$staffId = (int) $staffId;

						if ($staffId > 0 && $jUser->load($staffId))
						{
							$data->staffs[] = [
								'staff_id'       => $staffId,
								'staff_group_id' => array_values($jUser->groups),
							];
						}
					}
				}
			}
		}

		// Get the dispatcher and load the users plugins.
		JPluginHelper::importPlugin('solidres');

		// Trigger the data preparation event.
		JFactory::getApplication()->triggerEvent('onReservationAssetPrepareData', array('com_solidres.reservationasset', $data));

		return $data;
	}

	/**
	 * Method to allow derived classes to preprocess the form.
	 *
	 * @param   JForm  $form  A JForm object.
	 * @param   mixed  $data  The data expected for the form.
	 * @param   string $group The name of the plugin group to import (defaults to "content").
	 *
	 * @return  void
	 *
	 * @see     JFormField
	 * @since   12.2
	 * @throws  Exception if there is an error in the form event.
	 */
	protected function preprocessForm(\JForm $form, $data, $group = 'extension')
	{
		// Import the appropriate plugin group.
		JPluginHelper::importPlugin($group);
		JPluginHelper::importPlugin('solidres');
		JPluginHelper::importPlugin('solidrespayment');

		// Trigger the form preparation event.
		JFactory::getApplication()->triggerEvent('onReservationAssetPrepareForm', array($form, $data));
	}

	/**
	 * Method to get a single record.
	 *
	 * @param    int $pk The id of the primary key.
	 *
	 * @return    mixed    Object on success, false on failure.
	 *
	 * @since    0.1.0
	 */
	public function getItem($pk = null)
	{
		$item = parent::getItem($pk);

		$app = JFactory::getApplication();

		if ($item->id)
		{
			$isHubDashboard   = $this->getState('hub_dashboard', false);
			$propertyInfoOnly = $this->getState('property_info_only', false);

			// Flag if this property is an apartment
			$item->isApartment = (isset($item->params['is_apartment']) && 1 == $item->params['is_apartment']);

			// Load item tags
			$item->tags = new JHelperTags;
			$item->tags->getTagIds($item->id, $this->typeAlias);

			// Convert the metadata field to an array.
			$registry = new JRegistry;
			$registry->loadString($item->metadata, 'JSON');
			$item->metadata = $registry->toArray();

			// Get the dispatcher and load the extension plugins.
			JPluginHelper::importPlugin('extension');
			JPluginHelper::importPlugin('solidres');
			JPluginHelper::importPlugin('solidrespayment');

			$solidresConfig          = JComponentHelper::getParams('com_solidres');
			$enableAdjoiningTariffs  = $solidresConfig->get('enable_adjoining_tariffs', 1);
			$adjoiningTariffShowDesc = $solidresConfig->get('adjoining_tariffs_show_desc', 0);
			$confirmationState       = $solidresConfig->get('confirm_state', 5);

			$roomtypesModel = JModelLegacy::getInstance('RoomTypes', 'SolidresModel', array('ignore_request' => true));
			$extrasModel    = JModelLegacy::getInstance('Extras', 'SolidresModel', array('ignore_request' => true));
			$mediaListModel = JModelLegacy::getInstance('MediaList', 'SolidresModel', array('ignore_request' => true));
			$tariffsModel   = JModelLegacy::getInstance('Tariffs', 'SolidresModel', array('ignore_request' => true));
			$tariffModel    = JModelLegacy::getInstance('Tariff', 'SolidresModel', array('ignore_request' => true));
			$context        = 'com_solidres.reservation.process';

			// Get country name
			if (!isset(self::$countriesCache[$item->country_id]))
			{
				$countryTable = JTable::getInstance('Country', 'SolidresTable');
				$countryTable->load($item->country_id);

				self::$countriesCache[$item->country_id] = $countryTable;
			}

			$item->country_name = self::$countriesCache[$item->country_id]->name;

			// Get state name
			$stateTable = JTable::getInstance('State', 'SolidresTable');
			$stateTable->load($item->geo_state_id);
			$item->geostate_name   = $stateTable->name;
			$item->geostate_code_2 = $stateTable->code_2;

			// Get currency name
			if (!isset(self::$currenciesCache[$item->currency_id]))
			{
				$currencyTable = JTable::getInstance('Currency', 'SolidresTable');
				$currencyTable->load($item->currency_id);
				self::$currenciesCache[$item->currency_id] = $currencyTable;
			}

			$item->currency_name = self::$currenciesCache[$item->currency_id]->currency_name;
			$item->currency_code = self::$currenciesCache[$item->currency_id]->currency_code;
			$item->currency_sign = self::$currenciesCache[$item->currency_id]->sign;

			$item->roomTypes = [];
			if (!$propertyInfoOnly)
			{
				$roomtypesModel->setState('filter.reservation_asset_id', $item->id);
				$roomtypesModel->setState('filter.state', '1');
				$roomtypesModel->setState('filter.is_hub_dashboard', $isHubDashboard);
				$item->roomTypes = $roomtypesModel->getItems();
			}

			if ($app->isClient('administrator') || $isHubDashboard)
			{
				$extrasModel->setState('filter.reservation_asset_id', $item->id);
				$item->extras = $extrasModel->getItems();
			}

			$item->partner_name = '';
			if (SRPlugin::isEnabled('user'))
			{
				JModelLegacy::addIncludePath(SRPlugin::getAdminPath('user') . '/models', 'SolidresModel');

				if (!isset(self::$customersCache[$item->partner_id]))
				{
					$customerModel      = JModelLegacy::getInstance('Customer', 'SolidresModel', array('ignore_request' => true));
					self::$customersCache[$item->partner_id] = $customerModel->getItem($item->partner_id);
				}

				$item->partner_name = self::$customersCache[$item->partner_id]->firstname
					. " " . self::$customersCache[$item->partner_id]->middlename
					. " " . self::$customersCache[$item->partner_id]->lastname;
			}

			$mediaListModel->setState('filter.reservation_asset_id', $item->id);
			$mediaListModel->setState('filter.room_type_id', null);
			$item->media = $mediaListModel->getItems();

			//  For front end tasks //
			$srRoomType = SRFactory::get('solidres.roomtype.roomtype');
			$checkin    = $this->getState('checkin');
			$checkout   = $this->getState('checkout');

			// Hard code the number of selected adult
			$adult = 1;
			$child = 0;

			// Total available rooms for a whole asset
			$item->totalAvailableRoom = 0;

			// Total max occupancy for a whole asset = total available room * occupancy max of each room
			$item->totalOccupancyMax      = 0;
			$item->totalOccupancyAdult    = 0;
			$item->totalOccupancyChildren = 0;

			// Get the current selected tariffs if available
			$tariffs    = $this->getState('tariffs');
			$stayLength = (int) SRUtilities::calculateDateDiff($checkin, $checkout);
			if ($item->booking_type == 1)
			{
				$stayLength++;
			}

			// Get imposed taxes
			$imposedTaxTypes = array();
			$item->taxes     = array();
			if (!empty($item->tax_id))
			{
				if (!isset(self::$taxesCache[$item->tax_id]))
				{
					$taxModel  = JModelLegacy::getInstance('Tax', 'SolidresModel', array('ignore_request' => true));
					self::$taxesCache[$item->tax_id] = $taxModel->getItem($item->tax_id);
				}

				$imposedTaxTypes[] = self::$taxesCache[$item->tax_id];
			}

			if (count($imposedTaxTypes) > 0)
			{
				$item->taxes = $imposedTaxTypes;
			}

			// Get customer information
			$user            = JFactory::getUser();
			$customerGroupId = null; // Non-registered/Public/Non-loggedin customer

			if (SRPlugin::isEnabled('user') && $user->id > 0)
			{
				$customerTable = JTable::getInstance('Customer', 'SolidresTable');
				$customerTable->load(array('user_id' => $user->id));
				$customerGroupId = $customerTable->customer_group_id;
			}

			$solidresCurrency = new SRCurrency(0, $item->currency_id);
			$showPriceWithTax = $this->getState('show_price_with_tax', 0);

			$roomsOccupancyOptions               = $this->getState('room_opt', array());
			$item->roomsOccupancyOptionsAdults   = 0;
			$item->roomsOccupancyOptionsChildren = 0;
			$item->roomsOccupancyOptionsGuests   = 0;
			$item->roomsOccupancyOptionsCount    = count($roomsOccupancyOptions);
			foreach ($roomsOccupancyOptions as $roomOccupancyOptions)
			{
				if (isset($roomOccupancyOptions['guests']))
				{
					$item->roomsOccupancyOptionsGuests += $roomOccupancyOptions['guests'];
				}
				else
				{
					$item->roomsOccupancyOptionsAdults   += $roomOccupancyOptions['adults'];
					$item->roomsOccupancyOptionsChildren += $roomOccupancyOptions['children'];
				}
			}

			// For apartment booking, number of search room type (apartment) is 1.
			// In this simple scenario, let apply the searched adult and children number into tariffs
			if ($item->roomsOccupancyOptionsCount == 1)
			{
				if (isset($roomsOccupancyOptions[1]['guests']))
				{
					$adult = $roomsOccupancyOptions[1]['guests'];
					$child = 0;
				}
				else
				{
					$adult = $roomsOccupancyOptions[1]['adults'] ?? 1;
					$child = $roomsOccupancyOptions[1]['children'] ?? 0;
				}
			}
			else
			{
				if (isset($roomsOccupancyOptions[1]['guests']))
				{
					$guestsUQ = array_unique(array_column($roomsOccupancyOptions, 'guests'));

					if (1 == count($guestsUQ))
					{
						$adult = $guestsUQ[0];
						$child = 0;
					}
				}
				else
				{
					$adultUQ    = array_unique(array_column($roomsOccupancyOptions, 'adults'));
					$childrenUQ = array_unique(array_column($roomsOccupancyOptions, 'children'));

					if (1 == count($adultUQ) && 1 == count($childrenUQ))
					{
						$adult = $adultUQ[0];
						$child = $childrenUQ[0];
					}
				}
			}

			$showUnavailableRoomType = $item->params['show_unavailable_roomtype'] ?? 0;

			// Get discount
			$discounts        = array();
			$isDiscountPreTax = $solidresConfig->get('discount_pre_tax', 0);
			if (SRPlugin::isEnabled('discount'))
			{
				JModelLegacy::addIncludePath(SRPlugin::getAdminPath('discount') . '/models', 'SolidresModel');
				$discountModel = JModelLegacy::getInstance('Discounts', 'SolidresModel', array('ignore_request' => true));
				$discountModel->setState('filter.reservation_asset_id', $item->id);
				$discountModel->setState('filter.valid_from', $checkin);
				$discountModel->setState('filter.valid_to', $checkout);
				$discountModel->setState('filter.state', 1);
				$discountModel->setState('filter.type', array(0, 2, 3, 8, 9));
				$discounts = $discountModel->getItems();
			}

			// Get the current reservation id if we are amending an existing reservation
			$reservationId = $this->getState('reservation_id', 0);

			// Master/Slave check
			$isMasterSlaveMode = false;
			if (!empty($checkin) && !empty($checkout))
			{
				$isMasterUnavailable     = false;
				$isSlaveUnavailableCount = 0;
				$roomTypesAvailability   = [];

				for ($i = 0, $n = count($item->roomTypes); $i < $n; $i++)
				{
					$tmpId                                               = $item->roomTypes[$i]->id;
					$isMaster                                            = $item->roomTypes[$i]->is_master;
					$listAvailableRoom                                   = $srRoomType->getListAvailableRoom($tmpId, $checkin, $checkout, $item->booking_type, $reservationId, $confirmationState);
					$roomTypesAvailability[$tmpId]['totalAvailableRoom'] = is_array($listAvailableRoom) ? count($listAvailableRoom) : 0;

					if ($isMaster)
					{
						$isMasterSlaveMode = true;
					}

					if ($isMaster && $roomTypesAvailability[$tmpId]['totalAvailableRoom'] < $item->roomTypes[$i]->number_of_room)
					{
						$isMasterUnavailable = true;
					}

					if (!$isMaster && $roomTypesAvailability[$tmpId]['totalAvailableRoom'] < $item->roomTypes[$i]->number_of_room)
					{
						$isSlaveUnavailableCount++;
					}
				}
			}

			for ($i = 0, $n = count($item->roomTypes); $i < $n; $i++)
			{
				$roomTypeId = $item->roomTypes[$i]->id;
				$mediaListModel->setState('filter.reservation_asset_id', null);
				$mediaListModel->setState('filter.room_type_id', $roomTypeId);
				$item->roomTypes[$i]->media = $mediaListModel->getItems();

				// Get room type params
				if (isset($item->roomTypes[$i]->params))
				{
					$item->roomTypes[$i]->params = json_decode($item->roomTypes[$i]->params, true);
				}

				// For each room type, we load all relevant tariffs for front end user selection
				// When complex tariff plugin is not enabled, load standard tariff
				$standardTariffs              = null;
				$item->roomTypes[$i]->tariffs = array();
				$tariffsModel->setState('list.ordering', 't.ordering');
				$tariffsModel->setState('list.direction', 'asc');

				if (!SRPlugin::isEnabled('complexTariff'))
				{
					$tariffsModel->setState('filter.date_constraint', null);
					$tariffsModel->setState('filter.room_type_id', $roomTypeId);
					$tariffsModel->setState('filter.customer_group_id', null);
					$tariffsModel->setState('filter.default_tariff', 1);
					$tariffsModel->setState('filter.state', 1);
					$standardTariff                      = $tariffsModel->getItems();
					$item->roomTypes[$i]->standardTariff = null;
					if (isset($standardTariff[0]->id))
					{
						$item->roomTypes[$i]->tariffs[] = $tariffModel->getItem($standardTariff[0]->id);
					}
				}
				else // When complex tariff plugin is enabled
				{
					$complexTariffs = null;
					$tariffsModel->setState('filter.room_type_id', $roomTypeId);
					$tariffsModel->setState('filter.customer_group_id', $customerGroupId);
					$tariffsModel->setState('filter.default_tariff', false);
					$tariffsModel->setState('filter.state', 1);
					$tariffsModel->setState('filter.show_expired', 0);

					// Only load complex tariffs that matched the checkin->checkout range.
					// Check in and check out must always use format "Y-m-d"
					if (!empty($checkin) && !empty($checkout))
					{
						$tariffsModel->setState('filter.valid_from', date('Y-m-d', strtotime($checkin)));
						$tariffsModel->setState('filter.valid_to', date('Y-m-d', strtotime($checkout)));
						$tariffsModel->setState('filter.stay_length', $stayLength);
					}

					$complexTariffs = $tariffsModel->getItems();
					foreach ($complexTariffs as $complexTariff)
					{
						if (!empty($checkin) && !empty($checkout))
						{
							// If limit checkin field is set, we have to make sure that it is matched
							if (!empty($complexTariff->limit_checkin))
							{
								$areValidDatesForTariffLimit = SRUtilities::areValidDatesForTariffLimit($checkin, $checkout, $complexTariff->limit_checkin);

								// If the current check in date does not match the allowed check in dates, we ignore this tariff
								if (!$areValidDatesForTariffLimit)
								{
									continue;
								}
							}

							// If this tariff does not match with number of people requirement, remove it
							$areValidDatesForOccupancy = SRUtilities::areValidDatesForOccupancy($complexTariff, $roomsOccupancyOptions);
							if (!$areValidDatesForOccupancy)
							{
								continue;
							}

							// Check for valid interval
							$areValidDatesForInterval = SRUtilities::areValidDatesForInterval($complexTariff, $stayLength, $item->booking_type);
							if (!$areValidDatesForInterval)
							{
								continue;
							}

							// Check for valid length of stay, only support Rate per room per stay with mode = Day
							if ($complexTariff->type == 0 && $complexTariff->mode == 1)
							{
								$areValidDatesForLengthOfStay = SRUtilities::areValidDatesForLenghtOfStay($complexTariff, $checkin, $checkout, $stayLength, $item->booking_type);
								if (!$areValidDatesForLengthOfStay)
								{
									continue;
								}
							}
						}

						$item->roomTypes[$i]->tariffs[] = $tariffModel->getItem($complexTariff->id);
					}
				}

				if (!empty($checkin) && !empty($checkout))
				{
					$coupon  = $app->getUserState($context . '.coupon');

					if ($isMasterSlaveMode)
					{
						if (isset($isMasterUnavailable) && $isMasterUnavailable)
						{
							// If Master room type is unavailable, then all Slave room types are unavailable, regardless of their availability
							if (0 == $item->roomTypes[$i]->is_master)
							{
								$item->roomTypes[$i]->totalAvailableRoom = 0;
							}
						}
						elseif (isset($isSlaveUnavailableCount) && $isSlaveUnavailableCount > 0)
						{
							// If any Slave room type is unavailable, then the Master room type is unavailable, regardless of its availability
							if (1 == $item->roomTypes[$i]->is_master)
							{
								$item->roomTypes[$i]->totalAvailableRoom = 0;
							}
							else // Fall back to default case
							{
								$item->roomTypes[$i]->totalAvailableRoom = $roomTypesAvailability[$roomTypeId]['totalAvailableRoom'];
							}
						}
						else // Fall back to default case
						{
							$item->roomTypes[$i]->totalAvailableRoom = $roomTypesAvailability[$roomTypeId]['totalAvailableRoom'];
						}
					}
					else
					{
						$item->roomTypes[$i]->totalAvailableRoom = $roomTypesAvailability[$roomTypeId]['totalAvailableRoom'];
					}

					// Check for limit booking, if all rooms are locked, we can remove this room type without checking further
					// This is for performance purpose
					if ($item->roomTypes[$i]->totalAvailableRoom == 0 && !$showUnavailableRoomType)
					{
						unset($item->roomTypes[$i]);
						continue;
					}

					// Holds all available tariffs (filtered) that takes checkin/checkout into calculation to be showed in front end
					$availableTariffs                      = array();
					$item->roomTypes[$i]->availableTariffs = array();

					if ($item->roomTypes[$i]->totalAvailableRoom > 0)
					{
						// Build the config values
						$tariffConfig = array(
							'booking_type'                => $item->booking_type,
							'adjoining_tariffs_mode'      => $solidresConfig->get('adjoining_tariffs_mode', 0),
							'child_room_cost_calc'        => $solidresConfig->get('child_room_cost_calc', 1),
							'adjoining_tariffs_show_desc' => $adjoiningTariffShowDesc,
							'price_includes_tax'          => $item->price_includes_tax,
							'stay_length'                 => $stayLength,
							'allow_free'                  => $solidresConfig->get('allow_free_reservation', 0),
							'number_decimal_points'       => $solidresConfig->get('number_decimal_points', 2)
						);

						if (isset($item->roomTypes[$i]->params['enable_single_supplement'])
							&&
							$item->roomTypes[$i]->params['enable_single_supplement'] == 1)
						{
							$tariffConfig['enable_single_supplement']     = true;
							$tariffConfig['single_supplement_value']      = $item->roomTypes[$i]->params['single_supplement_value'];
							$tariffConfig['single_supplement_is_percent'] = $item->roomTypes[$i]->params['single_supplement_is_percent'];
						}
						else
						{
							$tariffConfig['enable_single_supplement'] = false;
						}

						$showNumberRemainingRooms = $item->roomTypes[$i]->params['show_number_remaining_rooms'] ?? 1;

						$item->roomTypes[$i]->isLastChance = false;
						if ($item->roomTypes[$i]->totalAvailableRoom == 1 && $showNumberRemainingRooms && $item->roomTypes[$i]->number_of_room > 1)
						{
							$item->roomTypes[$i]->isLastChance = true;
						}

						if (SRPlugin::isEnabled('complexTariff'))
						{
							if (!empty($item->roomTypes[$i]->tariffs))
							{
								foreach ($item->roomTypes[$i]->tariffs as $filteredComplexTariff)
								{
									$tariffConfig['tariffObj'] = $filteredComplexTariff;
									$availableTariffs[]        = $srRoomType->getPrice($roomTypeId, $customerGroupId, $imposedTaxTypes, false, true, $checkin, $checkout, $solidresCurrency, $coupon, $adult, $child, array(), $stayLength, $filteredComplexTariff->id, $discounts, $isDiscountPreTax, $tariffConfig);
								}
							}

							if ($enableAdjoiningTariffs) // Does not work for package type
							{
								$isApplicableAdjoiningTariffs = SRUtilities::isApplicableForAdjoiningTariffs($roomTypeId, $checkin, $checkout);

								$tariffAdjoiningLayer          = 0;
								$isApplicableAdjoiningTariffs2 = array();

								while (count($isApplicableAdjoiningTariffs) == 2)
								{
									$tariffCount = 1;
									$isValidPair = true;
									foreach ($isApplicableAdjoiningTariffs as $joinedTariffId)
									{
										$joinTariffForCheck = $tariffModel->getItem($joinedTariffId);

										// For case when the checkout match the joined tariff valid_from, let ignore it
										// because it is a checkout day => not count
										if ($tariffCount == 2)
										{
											$tmpValidFrom = date('Y-m-d', strtotime($joinTariffForCheck->valid_from));
											if ($tmpValidFrom == $checkout)
											{
												continue;
											}
										}

										if (!empty($joinTariffForCheck->limit_checkin) && !empty($checkin) && !empty($checkout) && $tariffCount == 1)
										{
											$areValidDatesForTariffLimit = SRUtilities::areValidDatesForTariffLimit($checkin, $checkout, $joinTariffForCheck->limit_checkin);
											if (!$areValidDatesForTariffLimit)
											{
												$isValidPair = false;
												break;
											}
										}

										$areValidDatesForOccupancy = SRUtilities::areValidDatesForOccupancy($joinTariffForCheck, $roomsOccupancyOptions);
										if (!$areValidDatesForOccupancy)
										{
											$isValidPair = false;
											break;
										}

										// Check for valid interval
										$areValidDatesForInterval = SRUtilities::areValidDatesForInterval($joinTariffForCheck, $stayLength, $item->booking_type);
										if (!$areValidDatesForInterval)
										{
											$isValidPair = false;
											break;
										}

										$tariffCount++;
									}

									$isApplicableAdjoiningTariffs2 = array_merge($isApplicableAdjoiningTariffs, $isApplicableAdjoiningTariffs2);

									if ($isValidPair)
									{
										$tariffConfig['adjoining_layer'] = $tariffAdjoiningLayer;
										$availableTariffs[]              = $srRoomType->getPrice($roomTypeId, $customerGroupId, $imposedTaxTypes, false, true, $checkin, $checkout, $solidresCurrency, $coupon, $adult, $child, array(), $stayLength, null, $discounts, $isDiscountPreTax, $tariffConfig);
									}

									$isApplicableAdjoiningTariffs = SRUtilities::isApplicableForAdjoiningTariffs($roomTypeId, $checkin, $checkout, $isApplicableAdjoiningTariffs2);
									if (empty($isApplicableAdjoiningTariffs))
									{
										break;
									}
									$tariffAdjoiningLayer++;
								}
							}
						}
						else
						{
							$availableTariffs[] = $srRoomType->getPrice($roomTypeId, $customerGroupId, $imposedTaxTypes, true, false, $checkin, $checkout, $solidresCurrency, $coupon, 0, 0, array(), $stayLength, $item->roomTypes[$i]->tariffs[0]->id, $discounts, $isDiscountPreTax, $tariffConfig);
						}

						foreach ($availableTariffs as $availableTariff)
						{
							$id = $availableTariff['id'];
							if ($showPriceWithTax)
							{
								$item->roomTypes[$i]->availableTariffs[$id]['val']          = $availableTariff['total_price_tax_incl_discounted_formatted'];
								$item->roomTypes[$i]->availableTariffs[$id]['val_original'] = $availableTariff['total_price_tax_incl_formatted'];
							}
							else
							{
								$item->roomTypes[$i]->availableTariffs[$id]['val']          = $availableTariff['total_price_tax_excl_discounted_formatted'];
								$item->roomTypes[$i]->availableTariffs[$id]['val_original'] = $availableTariff['total_price_tax_excl_formatted'];
							}
							$item->roomTypes[$i]->availableTariffs[$id]['tariffTaxIncl']         = $availableTariff['total_price_tax_incl_discounted_formatted'];
							$item->roomTypes[$i]->availableTariffs[$id]['tariffTaxInclOriginal'] = $availableTariff['total_price_tax_incl_formatted'];
							$item->roomTypes[$i]->availableTariffs[$id]['tariffTaxExcl']         = $availableTariff['total_price_tax_excl_discounted_formatted'];
							$item->roomTypes[$i]->availableTariffs[$id]['tariffTaxExclOriginal'] = $availableTariff['total_price_tax_excl_formatted'];
							$item->roomTypes[$i]->availableTariffs[$id]['tariffIsAppliedCoupon'] = $availableTariff['is_applied_coupon'];
							$item->roomTypes[$i]->availableTariffs[$id]['tariffType']            = $availableTariff['type'];
							$item->roomTypes[$i]->availableTariffs[$id]['tariffBreakDown']       = $availableTariff['tariff_break_down'];
							$item->roomTypes[$i]->availableTariffs[$id]['dMin']                  = $availableTariff['d_min'];
							$item->roomTypes[$i]->availableTariffs[$id]['dMax']                  = $availableTariff['d_max'];
							$item->roomTypes[$i]->availableTariffs[$id]['adults']                = $adult;
							$item->roomTypes[$i]->availableTariffs[$id]['children']              = $child;
							$item->roomTypes[$i]->availableTariffs[$id]['qMin']                  = $availableTariff['q_min'];
							$item->roomTypes[$i]->availableTariffs[$id]['qMax']                  = $availableTariff['q_max'];

							// Useful for looping with Hub
							$item->roomTypes[$i]->availableTariffs[$id]['tariffTitle']       = $availableTariff['title'];
							$item->roomTypes[$i]->availableTariffs[$id]['tariffDescription'] = $availableTariff['description'];
							// For adjoining cases
							$item->roomTypes[$i]->availableTariffs[$id]['tariffAdjoiningLayer'] = $availableTariff['adjoining_layer'];
						}

						if ($item->roomTypes[$i]->occupancy_max > 0)
						{
							$item->totalOccupancyMax += $item->roomTypes[$i]->occupancy_max * $item->roomTypes[$i]->totalAvailableRoom;
						}
						else
						{
							$item->totalOccupancyMax += ($item->roomTypes[$i]->occupancy_adult + $item->roomTypes[$i]->occupancy_child) * $item->roomTypes[$i]->totalAvailableRoom;
						}

						$tariffsForFilter = array();
						if (is_array($item->roomTypes[$i]->availableTariffs))
						{
							foreach ($item->roomTypes[$i]->availableTariffs as $tariffId => $tariffInfo)
							{
								if (is_null($tariffInfo['val']))
								{
									continue;
								}
								$tariffsForFilter[$tariffId] = $tariffInfo['val']->getValue();
							}
						}

						// Remove tariffs that has the same price
						$tariffsForFilter = array_unique($tariffsForFilter);
						foreach ($item->roomTypes[$i]->availableTariffs as $tariffId => $tariffInfo)
						{
							$uniqueTariffIds = array_keys($tariffsForFilter);
							if (!in_array($tariffId, $uniqueTariffIds))
							{
								unset($item->roomTypes[$i]->availableTariffs[$tariffId]);
							}
						}

						// Take overlapping mode into consideration
						$overlappingTariffsMode      = $solidresConfig->get('overlapping_tariffs_mode', 0);
						$tariffsForFilterOverlapping = $tariffsForFilter;
						asort($tariffsForFilterOverlapping); // from lowest to highest
						$tariffsForFilterOverlappingKeys = array_keys($tariffsForFilterOverlapping);
						$lowestTariffId                  = null;
						$highestTariffId                 = null;
						switch ($overlappingTariffsMode)
						{
							case 0:
								break;
							case 1: // Lowest
								$lowestTariffId = current($tariffsForFilterOverlappingKeys);
								SRUtilities::removeArrayElementsExcept($item->roomTypes[$i]->availableTariffs, $lowestTariffId);
								break;
							case 2: // Highest
								$highestTariffId = end($tariffsForFilterOverlappingKeys);
								SRUtilities::removeArrayElementsExcept($item->roomTypes[$i]->availableTariffs, $highestTariffId);
								break;
						}


						if (SRPlugin::isEnabled('hub'))
						{
							$origin = $this->getState('origin');
							if ($origin == 'hubsearch')
							{
								if (empty($tariffsForFilter) && !$showUnavailableRoomType)
								{
									unset($item->roomTypes[$i]);
									continue;
								}
							}

							if (!empty($tariffsForFilter))
							{
								$filterConditions = array(
									'tariffs_for_filter' => $tariffsForFilter,
								);

								if ($stayLength > 0)
								{
									$filterConditions['stay_length'] = $stayLength;
								}

								$filteringResults = $app->triggerEvent('onReservationAssetFilterRoomType', array(
									'com_solidres.reservationasset',
									$item,
									$this->getState(),
									$filterConditions
								));

								$qualifiedTariffs = array();
								$roomTypeMatched  = true;

								if (is_array($filteringResults))
								{
									foreach ($filteringResults as $result)
									{
										if (!is_array($result))
										{
											continue;
										}

										$qualifiedTariffs = $result;

										if (count($qualifiedTariffs) <= 0) // No qualified tariffs
										{
											$roomTypeMatched = false;
											continue;
										}
									}
								}

								if (!$roomTypeMatched && !$showUnavailableRoomType)
								{
									unset($item->roomTypes[$i]);
									continue;
								}
								else // This room type is matched but we have to check if all tariffs are matched or just some matched?
								{
									if (!empty($qualifiedTariffs) && count($qualifiedTariffs) != count($item->roomTypes[$i]->availableTariffs))
									{
										foreach ($item->roomTypes[$i]->availableTariffs as $k => $v)
										{
											if (!isset($qualifiedTariffs[$k]))
											{
												unset($item->roomTypes[$i]->availableTariffs[$k]);
											}
										}
									}
								}
							}
						} // End logic of Hub's filtering
					}

					// If this room type has no available tariffs, it is equal to no availability therefore don't count
					// this room type's rooms
					if (!empty($item->roomTypes[$i]->availableTariffs))
					{
						$item->totalAvailableRoom += $item->roomTypes[$i]->totalAvailableRoom;
					}
					else
					{
						if (!$showUnavailableRoomType)
						{
							unset($item->roomTypes[$i]);
							continue;
						}
					}

					if (SRPlugin::isEnabled('flexsearch'))
					{
						$app->triggerEvent('onRoomTypeProcessFlexSearch', array('com_solidres.roomtype', $item->roomTypes[$i], $checkin, $checkout, $item->booking_type, $roomsOccupancyOptions, $solidresCurrency, $imposedTaxTypes, $item, $this->state));

						if (isset($item->roomTypes[$i]->otherAvailableDates)
							&& empty($item->roomTypes[$i]->otherAvailableDates)
							&& (!$showUnavailableRoomType || (isset($origin) && $origin == 'hubsearch'))
						)
						{
							unset($item->roomTypes[$i]);
						}
					}
				} // End of case when check in and check out is available

				// Get custom fields
				if (isset($item->roomTypes[$i]))
				{
					$app->triggerEvent('onRoomTypePrepareData', array('com_solidres.roomtype', $item->roomTypes[$i]));
				}

			} // End room type loop

			// If guest search for specific room type, let show it first
			$roomTypeId = $app->getUserState($context . '.prioritizing_room_type_id', 0);
			if ($roomTypeId > 0)
			{
				foreach ($item->roomTypes as $key => $roomType)
				{
					if ($roomTypeId == $roomType->id)
					{
						$targetRoomType = $roomType;
						unset($item->roomTypes[$key]);
						array_unshift($item->roomTypes, $targetRoomType);
					}
				}
			}

			$app->setUserState($context . '.current_selected_tariffs', $tariffs);

			// Compute view access permissions.
			if ($access = $this->getState('filter.access'))
			{
				// If the access filter has been set, we already know this user can view.
				$item->params->set('access-view', true);
			}
			else
			{
				// If no access filter is set, the layout takes some responsibility for display of limited information.
				$groups = $user->getAuthorisedViewLevels();

				$item->params['access-view'] = in_array($item->access, $groups);
			}
		}

		// Trigger the data preparation event.
		$app->triggerEvent('onReservationAssetPrepareData', array('com_solidres.reservationasset', $item));

		return $item;
	}

	/**
	 * A protected method to get a set of ordering conditions.
	 *
	 * @param    object    A record object.
	 *
	 * @return    array    An array of conditions to add to add to ordering queries.
	 * @since    1.6
	 */
	protected function getReorderConditions($table = null)
	{
		$condition   = array();
		$condition[] = 'category_id = ' . (int) $table->category_id;

		return $condition;
	}

	/**
	 * Method to save the form data.
	 *
	 * @param    array    The form data.
	 *
	 * @return    boolean    True on success.
	 * @since    1.6
	 */
	public function save($data)
	{
		$table   = $this->getTable();
		$key     = $table->getKeyName();
		$pk      = (!empty($data[$key])) ? $data[$key] : (int) $this->getState($this->getName() . '.id');
		$isNew   = true;
		$app     = JFactory::getApplication();
		$isAdmin = $app->isClient('administrator');

		if (!empty($data['tags']) && $data['tags'][0] != '')
		{
			$table->newTags = $data['tags'];
		}

		JPluginHelper::importPlugin('extension');
		JPluginHelper::importPlugin('solidres');
		JPluginHelper::importPlugin('solidrespayment');

		// Load the row if saving an existing record.
		if ($pk > 0)
		{
			$table->load($pk);
			$isNew = false;
		}

		if ((int) $data['category_id'] == 0)
		{
			if (empty($data['category_name']))
			{
				$this->setError(JText::_('SR_ERROR_CATEGORY_NAME_IS_EMPTY'));

				return false;
			}

			JLoader::register('CategoriesHelper', JPATH_ADMINISTRATOR . '/components/com_categories/helpers/categories.php');

			$categoryTable              = array();
			$categoryTable['title']     = $data['category_name'];
			$categoryTable['parent_id'] = 1;
			$categoryTable['published'] = 1;
			$categoryTable['language']  = '*';
			$categoryTable['extension'] = 'com_solidres';

			$data['category_id'] = CategoriesHelper::createCategory($categoryTable);
		}

		// Bind the data.
		if (!$table->bind($data))
		{
			$this->setError($table->getError());

			return false;
		}

		// Prepare the row for saving
		$this->prepareTable($table);

		// Check the data.
		if (!$table->check())
		{
			$this->setError($table->getError());

			return false;
		}

		// Make sure that there is at least 01 published default payment method for this property
		if (isset($data['payments']))
		{
			$foundDefaultPaymentMethod = 0;
			foreach ($data['payments'] as $pKey => $pVal)
			{
				if (strpos($pKey, 'is_default') !== false && $pVal == 1)
				{
					if ($data['payments'][substr($pKey, 0, -11) . '_enabled'] == 1)
					{
						$foundDefaultPaymentMethod ++;
					}
				}
			}

			if ($foundDefaultPaymentMethod == 0)
			{
				$this->setError(JText::_('SR_DEFAULT_PAYMENT_METHOD_REQUIRED'));

				return false;
			}
			else if ($foundDefaultPaymentMethod > 1)
			{
				$this->setError(JText::_('SR_DEFAULT_PAYMENT_METHOD_UNIQUE'));

				return false;
			}
		}

		// Trigger the onContentBeforeSave event.
		$result = $app->triggerEvent($this->event_before_save, array($data, $table, $isNew));
		if (in_array(false, $result, true))
		{
			$this->setError($this->getError());

			return false;
		}

		// Store the data.
		if (!($result = $table->store(true)))
		{
			$this->setError($table->getError());

			return false;
		}

		// Staffs
		if ((SRPlugin::isEnabled('hub') || SRPlugin::isEnabled('api')) && $isAdmin)
		{
			$db         = $this->getDbo();
			$propertyId = (int) $table->id;
			$query      = $db->getQuery(true)
				->delete($db->quoteName('#__sr_property_staff_xref'))
				->where($db->quoteName('property_id') . ' = ' . $propertyId);
			$db->setQuery($query)
				->execute();

			if (!empty($data['staffs']))
			{
				/** @var UsersModelUser $usersModel */
				CMSFactory::getLanguage()->load('com_users');
				BaseDatabaseModel::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_users/models', 'UsersModel');
				$usersModel = BaseDatabaseModel::getInstance('User', 'UsersModel', ['ignore_request' => true]);
				$jUser      = new User;
				$values     = [];

				foreach ($data['staffs'] as $staff)
				{
					if (!is_array($staff)
						|| !isset($staff['staff_id'])
						|| !$jUser->load($staff['staff_id'])
					)
					{
						continue;
					}

					if ($jUser->block)
					{
						$app->enqueueMessage(JText::sprintf('SR_HUB_WARN_USER_IS_BLOCKED_FORMAT', $jUser->name, $jUser->username), 'warning');
						continue;
					}

					$values[] = $propertyId . ',' . (int) $staff['staff_id'];

					if (empty($staff['staff_group_id']))
					{
						$groups = [];
					}
					else
					{
						$groups = ArrayHelper::arrayUnique(ArrayHelper::toInteger($staff['staff_group_id']));
					}

					$partnerGroups = ComponentHelper::getParams('com_solidres')->get('partner_user_groups', []);
					$groups        = array_intersect($partnerGroups, $groups);
					$updated       = $usersModel->save(
						[
							'id'     => $jUser->id,
							'groups' => $groups,
						]
					);

					if (!$updated)
					{
						$app->enqueueMessage($usersModel->getError(), 'warning');
					}
				}

				if (count($values))
				{
					$query->clear()
						->insert($db->quoteName('#__sr_property_staff_xref'))
						->columns($db->quoteName(['property_id', 'staff_id']))
						->values(ArrayHelper::arrayUnique($values));
					$db->setQuery($query)
						->execute();
				}
			}
		}

		// Clean the cache.
		$this->cleanCache();

		// Trigger the onContentAfterSave event.
		$app->triggerEvent($this->event_after_save, array($data, $table, $result, $isNew));

		if (isset($table->$key))
		{
			$this->setState($this->getName() . '.id', $table->$key);
		}

		$this->setState($this->getName() . '.new', $isNew);

		if (!empty($data['add_to_menu']) && empty($data['menu_id']))
		{
			JFactory::getLanguage()->load('com_menus');
			JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_menus/tables');
			JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_menus/models', 'MenusModel');
			$menuModel = JModelLegacy::getInstance('Item', 'MenusModel', array('ignore_request' => true));
			$save      = $menuModel->save(array(
				'id'           => 0,
				'parent_id'    => 1,
				'published'    => 1,
				'home'         => 0,
				'menutype'     => $data['add_to_menutype'],
				'title'        => $data['menu_title'],
				'alias'        => $data['menu_alias'],
				'type'         => 'component',
				'component_id' => JComponentHelper::getComponent('com_solidres')->id,
				'request'      => array('id' => $pk),
				'link'         => 'index.php?option=com_solidres&view=reservationasset&id=' . $pk,
				'language'     => '*',
			));

			if ($save)
			{
				$app->enqueueMessage(JText::sprintf('SR_CREATED_NEW_MENU_SUCCESS_PLURAL', $data['menu_title']));
			}
			else
			{
				$app->enqueueMessage($menuModel->getError(), 'warning');
			}
		}

		// Payment ordering
		$paymentOrder = $app->input->get('payment_order', array(), 'array');
		$config       = new SRConfig(array('data_namespace' => 'payments/payment_order', 'scope_id' => $table->id));
		$config->set(array('ordering' => json_encode($paymentOrder)));

		return true;
	}

	/**
	 * Increment the hit counter for the article.
	 *
	 * @param   integer  $pk  Optional primary key of the article to increment.
	 *
	 * @return  boolean  True if successful; false otherwise and internal error set.
	 */
	public function hit($pk = 0)
	{
		$input    = JFactory::getApplication()->input;
		$hitcount = $input->getInt('hitcount', 1);

		if ($hitcount)
		{
			$pk = (!empty($pk)) ? $pk : (int) $this->getState('reservationasset.id');

			$table = JTable::getInstance('ReservationAsset', 'SolidresTable');
			$table->hit($pk);
		}

		return true;
	}
}
