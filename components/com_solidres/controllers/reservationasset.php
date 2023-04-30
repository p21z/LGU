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

use Joomla\CMS\Language\Text;

/**
 * @package       Solidres
 * @subpackage    ReservationAsset
 * @since         0.1.0
 */
class SolidresControllerReservationAsset extends JControllerLegacy
{
	private $context;

	protected $reservationDetails;

	public function __construct($config = array())
	{
		$config['model_path'] = JPATH_COMPONENT_ADMINISTRATOR . '/models';

		parent::__construct($config);

		$this->context        = 'com_solidres.reservation.process';
		$this->solidresConfig = JComponentHelper::getParams('com_solidres');

		// $raid is preferred because it does not conflict with core Joomla multilingual feature
		$this->reservationAssetId = $this->input->getUint('raid');
		if (empty($this->reservationAssetId))
		{
			$this->reservationAssetId = $this->input->getUint('id');
		}

		// Get the default currency
		JTable::addIncludePath(JPATH_COMPONENT_ADMINISTRATOR . '/tables', 'SolidresTable');
		$tableAsset = JTable::getInstance('ReservationAsset', 'SolidresTable');
		$tableAsset->load($this->reservationAssetId);

		$this->app->setUserState($this->context . '.currency_id', $tableAsset->currency_id);
		$this->app->setUserState($this->context . '.deposit_required', $tableAsset->deposit_required);
		$this->app->setUserState($this->context . '.deposit_is_percentage', $tableAsset->deposit_is_percentage);
		$this->app->setUserState($this->context . '.deposit_amount', $tableAsset->deposit_amount);
		$this->app->setUserState($this->context . '.deposit_by_stay_length', $tableAsset->deposit_by_stay_length);
		$this->app->setUserState($this->context . '.deposit_include_extra_cost', $tableAsset->deposit_include_extra_cost);
		$this->app->setUserState($this->context . '.tax_id', $tableAsset->tax_id);
		$this->app->setUserState($this->context . '.booking_type', $tableAsset->booking_type);
		$this->app->setUserState($this->context . '.partner_id', $tableAsset->partner_id);

		if (isset($tableAsset->params))
		{
			$this->app->setUserState($this->context . '.asset_params', json_decode($tableAsset->params, true));
		}

		$this->app->setUserState($this->context . '.origin', JText::_('SR_RESERVATION_ORIGIN_DIRECT'));
		$this->app->setUserState($this->context . '.asset_category_id', $tableAsset->category_id);
		$this->app->setUserState($this->context . '.price_includes_tax', $tableAsset->price_includes_tax);

		$lang = JFactory::getLanguage();
		$lang->load('com_solidres_category_' . $tableAsset->category_id, JPATH_COMPONENT);
	}

	/**
	 * Method to get a model object, loading it if required.
	 *
	 * @param string $name   The model name. Optional.
	 * @param string $prefix The class prefix. Optional.
	 * @param array  $config Configuration array for model. Optional.
	 *
	 * @return    object    The model.
	 * @since    1.5
	 */
	public function getModel($name = 'ReservationAsset', $prefix = 'SolidresModel', $config = array())
	{
		return parent::getModel($name, $prefix, $config);
	}

	/**
	 * Get the html output according to the room type quantity selection
	 *
	 * This output contains room specific form like adults and children's quantity (including children's ages) as well
	 * as some other information like room preferences like smoking and room's extra items
	 *
	 * @return string
	 */
	public function getRoomTypeForm($return = 0)
	{
		$solidresRoomType        = SRFactory::get('solidres.roomtype.roomtype');
		$showTaxIncl             = $this->solidresConfig->get('show_price_with_tax', 0);
		$childMaxAge             = $this->solidresConfig->get('child_max_age_limit', 17);
		$confirmationState       = $this->solidresConfig->get('confirm_state', 5);
		$extrasDefaultVisibility = $this->solidresConfig->get('extras_default_visibility', 1);
		$roomTypeId              = $this->input->get('rtid', 0, 'int');
		$raId                    = $this->input->get('raid', 0, 'int');
		$tariffId                = $this->input->get('tariffid', 0, 'int');
		$adjoiningLayer          = $this->input->get('adjoininglayer', 0, 'int');
		$quantity                = $this->input->get('quantity', 0, 'int');
		$type                    = $this->input->get('type', 0, 'int');
		$bookingType             = $solidresRoomType->getBookingType($roomTypeId);
		$modelRoomType           = $this->getModel('RoomType');
		$modelTariff             = $this->getModel('Tariff');
		$roomType                = $modelRoomType->getItem($roomTypeId);
		$tariff                  = $modelTariff->getItem($tariffId);
		$modelExtras             = $this->getModel('Extras', 'SolidresModel', array('ignore_request' => true));
		$modelExtras->setState('filter.room_type_id', $roomTypeId);
		$modelExtras->setState('filter.state', 1);
		$modelExtras->setState('filter.show_price_with_tax', $showTaxIncl);
		$modelExtras->setState('list.start', 0);
		$modelExtras->setState('list.limit', 0);
		$extras = $modelExtras->getItems();

		// Early arrival checking
		$checkin                     = $this->app->getUserState($this->context . '.checkin');
		$checkout                    = $this->app->getUserState($this->context . '.checkout');
		$allowedEarlyArrivalExtraIds = array();

		if (is_array($extras))
		{
			$advancedExtra    = SRPlugin::isEnabled('advancedextra');

			foreach ($extras as $i => $extra)
			{
				$extraParams          = new Joomla\Registry\Registry($extra->params);
				$enableAvailableDates = $extraParams->get('enable_available_dates', 0);

				if ($advancedExtra && $enableAvailableDates)
				{
					$availableDates = json_decode($extraParams->get('available_dates', '{}'), true) ?: [];

					try
					{
						$checkinDate  = JFactory::getDate($checkin);
						$checkoutDate = JFactory::getDate($checkout);
						$isAvailable  = true;

						while ($checkinDate->toUnix() <= $checkoutDate->toUnix())
						{
							if (!in_array($checkinDate->format('Y-m-d'), $availableDates))
							{
								$isAvailable = false;
								break;
							}

							$checkinDate->add(new DateInterval('P1D'));
						}

						if (!$isAvailable)
						{
							unset($extras[$i]);
							continue;
						}
					}
					catch (Exception $e)
					{

					}
				}

				if (8 != $extra->charge_type)
				{
					continue;
				}

				$distance   = $extraParams->get('previous_checkout_distance', 1);
				$newCheckin = (new DateTime($checkin))->modify("-$distance day");

				$availableRooms              = $solidresRoomType->getListAvailableRoom($roomTypeId, $newCheckin->format('Y-m-d'), $checkout, $bookingType, 0, $confirmationState);
				$totalRoomTypeAvailableRooms = is_array($availableRooms) ? count($availableRooms) : 0;
				$extra->allow_early_arrival  = false;

				if ($totalRoomTypeAvailableRooms >= $quantity)
				{
					$extra->allow_early_arrival    = true;
					$allowedEarlyArrivalExtraIds[] = $extra->id;
				}
			}

			$extras = array_values($extras);
		}

		$this->app->setUserState($this->context . '.allowed_early_arrival_extra_ids', $allowedEarlyArrivalExtraIds);

		$this->reservationDetails = $this->app->getUserState($this->context);

		if (!isset($roomType->params['show_adult_option']))
		{
			$roomType->params['show_adult_option'] = 1;
		}

		$showGuestOption = $roomType->params['show_guest_option'] ?? 0;

		if (!isset($roomType->params['show_child_option']))
		{
			$roomType->params['show_child_option'] = 1;
		}

		if (!isset($roomType->params['show_smoking_option']))
		{
			$roomType->params['show_smoking_option'] = 1;
		}

		if (!isset($roomType->params['show_guest_name_field']))
		{
			$roomType->params['show_guest_name_field'] = 1;
		}

		if (!isset($roomType->params['guest_name_optional']))
		{
			$roomType->params['guest_name_optional'] = 0;
		}

		$form = SRLayoutHelper::getInstance();

		$displayData = array(
			'assetId'                 => $raId,
			'roomTypeId'              => $roomTypeId,
			'tariffId'                => $tariffId,
			'quantity'                => $quantity,
			'roomType'                => $roomType,
			'reservationDetails'      => $this->reservationDetails,
			'extras'                  => $extras,
			'childMaxAge'             => $childMaxAge,
			'tariff'                  => $tariff,
			'adjoiningLayer'          => $adjoiningLayer,
			'type'                    => $type,
			'extrasDefaultVisibility' => $extrasDefaultVisibility
		);

		$roomFields = [];

		if (SRPlugin::isEnabled('customfield'))
		{
			$categories = isset($this->reservationDetails->asset_category_id) ? [$this->reservationDetails->asset_category_id] : [];
			$roomFields = SRCustomFieldHelper::findFields(['context' => 'com_solidres.room'], $categories);
		}

		$displayData['roomFields']      = $roomFields;
		$displayData['showGuestOption'] = $showGuestOption;

		for ($i = 0; $i < $quantity; $i++)
		{
			$currentRoomIndex                = $this->reservationDetails->room['room_types'][$roomTypeId][$tariffId][$i] ?? null;
			$identity                        = $roomType->id . '_' . $tariffId . '_' . $i;
			$displayData['currentRoomIndex'] = $currentRoomIndex;
			$displayData['identity']         = $identity;
			$displayData['identityReversed'] = $i . '_' . $tariffId . '_' . $roomType->id;
			$displayData['i']                = $i;
			$displayData['pMax']             = isset($tariff->p_max) && $tariff->p_max > 0 ? $tariff->p_max : $roomType->occupancy_max;
			$displayData['pMin']             = isset($tariff->p_min) && $tariff->p_min > 0 ? $tariff->p_min : 0;
			$displayData['inputNamePrefix']  = "jform[room_types][$roomTypeId][$tariffId][$i]";
			$displayData['costPrefix']       = ($roomType->params['is_exclusive'] ?? 0) ? Text::_('SR_COST') : Text::_($roomType->is_private ? 'SR_ROOM' : 'SR_BED') . ' ' . ($i + 1);

			// Html for adult selection
			$htmlAdultSelection = '';
			if ($roomType->params['show_adult_option'] == 1)
			{
				for ($j = 1; $j <= $roomType->occupancy_adult; $j++)
				{
					$disabled = '';
					$selected = '';
					if (isset($currentRoomIndex['adults_number']))
					{
						$selected = $currentRoomIndex['adults_number'] == $j ? 'selected' : '';
					}
					elseif (isset($this->reservationDetails->room_opt[$i + 1]))
					{
						if (isset($this->reservationDetails->room_opt[$i + 1]['adults']))
						{
							$selected = $this->reservationDetails->room_opt[$i + 1]['adults'] == $j ? 'selected' : '';
						}
					}
					else
					{
						if (!empty($tariff->p_min))
						{
							if ($j == $tariff->p_min)
							{
								$selected = 'selected';
							}
						}
						else
						{
							if ($j == 1)
							{
								$selected = 'selected';
							}
						}
					}

					if (!empty($tariff->p_min) && $j < $tariff->p_min)
					{
						$disabled = 'disabled';
					}

					if (!empty($tariff->p_max) && $j > $tariff->p_max)
					{
						$disabled = 'disabled';
					}

					$htmlAdultSelection .= '<option ' . $disabled . ' ' . $selected . ' value="' . $j . '">' . JText::plural('SR_SELECT_ADULT_QUANTITY', $j) . '</option>';
				}
			}

			$htmlGuestSelection = '';

			if ($showGuestOption == 1)
			{
				for ($j = 1; $j <= $roomType->occupancy_max; $j++)
				{
					$disabled = '';
					$selected = '';
					if (isset($currentRoomIndex['guests_number']))
					{
						$selected = $currentRoomIndex['guests_number'] == $j ? 'selected' : '';
					}
					elseif (isset($this->reservationDetails->room_opt[$i + 1]))
					{
						if (isset($this->reservationDetails->room_opt[$i + 1]['guests']))
						{
							$selected = $this->reservationDetails->room_opt[$i + 1]['guests'] == $j ? 'selected' : '';
						}
					}
					else
					{
						if (!empty($tariff->p_min))
						{
							if ($j == $tariff->p_min)
							{
								$selected = 'selected';
							}
						}
						else
						{
							if ($j == 1)
							{
								$selected = 'selected';
							}
						}
					}

					if (!empty($tariff->p_min) && $j < $tariff->p_min)
					{
						$disabled = 'disabled';
					}

					if (!empty($tariff->p_max) && $j > $tariff->p_max)
					{
						$disabled = 'disabled';
					}

					$htmlGuestSelection .= '<option ' . $disabled . ' ' . $selected . ' value="' . $j . '">'
						. JText::plural('SR_SELECT_GUEST_QUANTITY', $j)
						. '</option>';
				}
			}

			// Html for children selection
			$htmlChildSelection = '';
			$htmlChildrenAges   = '';
			// Only show child option if it is enabled and the child quantity > 0
			if ($roomType->params['show_child_option'] == 1 && $roomType->occupancy_child > 0)
			{
				$htmlChildSelection .= '<option value="">' . JText::_('SR_CHILD') . '</option>';

				for ($j = 1; $j <= $roomType->occupancy_child; $j++)
				{
					$selected2 = '';
					if (isset($currentRoomIndex['children_number']))
					{
						$selected2 = $currentRoomIndex['children_number'] == $j ? 'selected' : '';
					}
					elseif (isset($this->reservationDetails->room_opt[$i + 1]))
					{
						if (isset($this->reservationDetails->room_opt[$i + 1]['children']))
						{
							$selected2 = $this->reservationDetails->room_opt[$i + 1]['children'] == $j ? 'selected' : '';
						}
					}
					$htmlChildSelection .= '
				<option ' . $selected2 . ' value="' . $j . '">' . JText::plural('SR_SELECT_CHILD_QUANTITY', $j) . '</option>
			';
				}

				// Html for children ages, show if there was previous session data or from room_opt variables
				if (isset($currentRoomIndex['children_ages']) || isset($this->reservationDetails->room_opt[$i + 1]))
				{
					$childDropBoxCount = 0;
					if (isset($currentRoomIndex['children_ages']))
					{
						$childDropBoxCount = count($currentRoomIndex['children_ages']);
					}
					elseif (isset($this->reservationDetails->room_opt[$i + 1]))
					{
						if (isset($this->reservationDetails->room_opt[$i + 1]['children']))
						{
							$childDropBoxCount = $this->reservationDetails->room_opt[$i + 1]['children'];
						}
					}

					for ($j = 0; $j < $childDropBoxCount; $j++)
					{
						$htmlChildrenAges .= '
					<li>
						<p>' . JText::_('SR_CHILD') . ' ' . ($j + 1) . '</p>
						<select name="' . $displayData['inputNamePrefix'] . '[children_ages][' . $j . ']"
							data-raid="' . $raId . '"
							data-roomtypeid="' . $roomTypeId . '"
							data-tariffid="' . $tariffId . '"
							data-roomindex="' . $i . '"
							class="form-select mb-3 child_age_' . $identity . '_' . $j . ' trigger_tariff_calculating"
							required
						>';
						$htmlChildrenAges .= '<option value=""></option>';
						for ($age = 0; $age <= $childMaxAge; $age++)
						{
							$selectedAge = '';
							if (isset($currentRoomIndex['children_ages']) && $age == $currentRoomIndex['children_ages'][$j])
							{
								$selectedAge = 'selected';
							}
							$htmlChildrenAges .= '<option ' . $selectedAge . ' value="' . $age . '">' . JText::plural('SR_CHILD_AGE_SELECTION', $age) . '</option>';
						}

						$htmlChildrenAges .= '
						</select>
					</li>';
					}
				}
			}

			// Smoking
			$htmlSmokingOption = '';
			if ($roomType->params['show_smoking_option'] == 1)
			{
				$selectedNonSmoking = '';
				$selectedSmoking    = '';
				if (isset($currentRoomIndex['preferences']['smoking']))
				{
					if ($currentRoomIndex['preferences']['smoking'] == 0)
					{
						$selectedNonSmoking = 'selected';
					}
					else
					{
						$selectedSmoking = 'selected';
					}
				}
				$htmlSmokingOption = '
			<select class="form-select mb-3" name="' . $displayData['inputNamePrefix'] . '[preferences][smoking]">
				<option value="">' . JText::_('SR_SMOKING') . '</option>
				<option ' . $selectedNonSmoking . ' value="0">' . JText::_('SR_NON_SMOKING_ROOM') . '</option>
				<option ' . $selectedSmoking . ' value="1">' . JText::_('SR_SMOKING_ROOM') . '</option>
			</select>
		';
			}

			$displayData['htmlAdultSelection'] = $htmlAdultSelection;
			$displayData['htmlSmokingOption']  = $htmlSmokingOption;
			$displayData['htmlChildrenAges']   = $htmlChildrenAges;
			$displayData['htmlChildSelection'] = $htmlChildSelection;
			$displayData['htmlGuestSelection'] = $htmlGuestSelection;

			if (1 == $type)
			{
				$roomTypeForm = $form->render(
					'asset.apartmentform',
					$displayData
				);
			}
			else
			{
				$roomTypeForm = $form->render(
					'asset.roomtypeform' . ((defined('SR_LAYOUT_STYLE') && SR_LAYOUT_STYLE != '') ? '_' . SR_LAYOUT_STYLE : ''),
					$displayData
				);
			}

			if ($return)
			{
				return $roomTypeForm;
			}
			else
			{
				echo $roomTypeForm;
			}
		}

		$this->app->close();
	}

	/**
	 * Get the availability calendar
	 *
	 * The number of months to be displayed in configured in component's options
	 *
	 * @return string
	 */
	public function getAvailabilityCalendar()
	{
		JLoader::register('SRCalendar', SRPATH_LIBRARY . '/utilities/calendar.php');
		$roomTypeId    = $this->input->get('id', 0, 'int');
		$weekStartDay  = $this->solidresConfig->get('week_start_day', 1) == 1 ? 'monday' : 'sunday';
		$calendarStyle = $this->solidresConfig->get('availability_calendar_style', 1) == 1 ? 'modern' : 'legacy';

		$calendar = new SRCalendar(array('start_day' => $weekStartDay, 'style' => $calendarStyle, 'room_type_id' => $roomTypeId));
		$html     = '';
		$html     .= '<span class="legend-busy"></span> ' . JText::_('SR_AVAILABILITY_CALENDAR_BUSY');
		$html     .= ' <span class="legend-restricted"></span> ' . JText::_('SR_AVAILABILITY_CALENDAR_RESTRICTED');
		$period   = $this->solidresConfig->get('availability_calendar_month_number', 6);
		for ($i = 0; $i < $period; $i++)
		{
			if ($i % 3 == 0 && $i == 0)
			{
				$html .= '<div class="' . SR_UI_GRID_CONTAINER . '">';
			}
			else if ($i % 3 == 0)
			{
				$html .= '</div><div class="' . SR_UI_GRID_CONTAINER . '">';
			}

			$year  = date('Y', strtotime('first day of this month +' . $i . ' month'));
			$month = date('n', strtotime('first day of this month +' . $i . ' month'));
			$html  .= '<div class="' . SR_UI_GRID_COL_4 . '">' . $calendar->generate($year, $month) . '</div>';
		}

		echo $html;

		$this->app->close();
	}

	public function getCheckInOutForm()
	{
		$systemConfig             = JFactory::getConfig();
		$datePickerMonthNum       = $this->solidresConfig->get('datepicker_month_number', 3);
		$weekStartDay             = $this->solidresConfig->get('week_start_day', 1);
		$dateFormat               = $this->solidresConfig->get('date_format', 'd-m-Y');
		$tzoffset                 = $systemConfig->get('offset');
		$tariffId                 = $this->input->getUInt('tariff_id', 0);
		$roomtypeId               = $this->input->getUInt('roomtype_id', 0);
		$assetId                  = $this->input->getUInt('id', 0);
		$itemId                   = $this->input->getUInt('Itemid', 0);
		$type                     = $this->input->getUInt('type', 0); // 1 is for the new apartment layout
		$modelTariff              = JModelLegacy::getInstance('Tariff', 'SolidresModel', array('ignore_request' => true));
		$tariff                   = $modelTariff->getItem($tariffId);
		$this->reservationDetails = $this->app->getUserState($this->context);
		$timezone                 = new DateTimeZone($tzoffset);
		$checkin                  = $this->reservationDetails->checkin ?? null;
		$checkout                 = $this->reservationDetails->checkout ?? null;

		$currentSelectedTariffs                = $this->app->getUserState($this->context . '.current_selected_tariffs');
		$currentSelectedTariffs[$roomtypeId][] = $tariffId;
		$this->app->setUserState($this->context . '.current_selected_tariffs', $currentSelectedTariffs);

		$jsDateFormat = SRUtilities::convertDateFormatPattern($dateFormat);
		$bookingType  = $this->app->getUserState($this->context . '.booking_type');

		$form = SRLayoutHelper::getInstance();

		$displayData = array(
			'tariff'               => $tariff,
			'assetId'              => $assetId,
			'roomTypeId'           => $roomtypeId,
			'checkIn'              => $checkin,
			'checkOut'             => $checkout,
			'minDaysBookInAdvance' => $this->solidresConfig->get('min_days_book_in_advance', 0),
			'maxDaysBookInAdvance' => $this->solidresConfig->get('max_days_book_in_advance', 0),
			'minLengthOfStay'      => $this->solidresConfig->get('min_length_of_stay', 1),
			'timezone'             => $timezone,
			'itemId'               => $itemId,
			'datePickerMonthNum'   => $datePickerMonthNum,
			'weekStartDay'         => $weekStartDay,
			'dateFormat'           => $dateFormat, // default format d-m-y
			'jsDateFormat'         => $jsDateFormat,
			'bookingType'          => $bookingType,
			'enableAutoScroll'     => $this->solidresConfig->get('enable_auto_scroll', 1),
			'type'                 => $type,
		);

		// For apartment layout
		if (1 == $type)
		{
			$this->input->set('rtid', $roomtypeId);
			$this->input->set('raid', $assetId);
			$this->input->set('tariffid', $tariffId);
			$this->input->set('adjoininglayer', 0);
			$this->input->set('quantity', 1);
			$this->input->set('type', 1); // For apartment

			$displayData['roomTypeForm'] = $this->getRoomTypeForm(1);
		}

		echo $form->render(
			'asset.checkinoutform',
			$displayData
		);

		$this->app->close();
	}

	public function getCheckInOutFormChangeDates()
	{
		$systemConfig             = JFactory::getConfig();
		$tariffId                 = $this->input->getUInt('tariff_id', 0);
		$roomtypeId               = $this->input->getUInt('roomtype_id', 0);
		$assetId                  = $this->input->getUInt('id', 0);
		$itemId                   = $this->input->getUInt('Itemid', 0);
		$return                   = $this->input->getString('return', '');
		$reservationId            = $this->input->getUInt('reservation_id', 0);
		$modelTariff              = JModelLegacy::getInstance('Tariff', 'SolidresModel', array('ignore_request' => true));
		$tariff                   = $modelTariff->getItem($tariffId);
		$this->reservationDetails = $this->app->getUserState($this->context);
		$tzoffset                 = $systemConfig->get('offset');
		$timezone                 = new DateTimeZone($tzoffset);
		/*$checkin = isset($this->reservationDetails->checkin) ? $this->reservationDetails->checkin : NULL;
		$checkout = isset($this->reservationDetails->checkout) ? $this->reservationDetails->checkout : NULL;*/
		$checkin  = $this->input->getString('checkin', '');
		$checkout = $this->input->getString('checkout', '');

		$datePickerMonthNum                    = $this->solidresConfig->get('datepicker_month_number', 3);
		$weekStartDay                          = $this->solidresConfig->get('week_start_day', 1);
		$currentSelectedTariffs                = $this->app->getUserState($this->context . '.current_selected_tariffs');
		$currentSelectedTariffs[$roomtypeId][] = $tariffId;
		$this->app->setUserState($this->context . '.current_selected_tariffs', $currentSelectedTariffs);
		JLoader::register('SRUtilities', SRPATH_LIBRARY . '/utilities/utilities.php');
		$dateFormat   = $this->solidresConfig->get('date_format', 'd-m-Y');
		$jsDateFormat = SRUtilities::convertDateFormatPattern($dateFormat);

		$form = SRLayoutHelper::getInstance();

		$displayData = array(
			'tariff'               => $tariff,
			'assetId'              => $assetId,
			'checkin'              => $checkin,
			'checkout'             => $checkout,
			'minDaysBookInAdvance' => $this->solidresConfig->get('min_days_book_in_advance', 0),
			'maxDaysBookInAdvance' => $this->solidresConfig->get('max_days_book_in_advance', 0),
			'minLengthOfStay'      => $this->solidresConfig->get('min_length_of_stay', 1),
			'timezone'             => $timezone,
			'itemId'               => $itemId,
			'reservationId'        => $reservationId,
			'datePickerMonthNum'   => $datePickerMonthNum,
			'weekStartDay'         => $weekStartDay,
			'dateFormat'           => $dateFormat, // default format d-m-y
			'jsDateFormat'         => $jsDateFormat,
			'return'               => $return
		);

		echo $form->render('asset.changedates', $displayData);

		$this->app->close();
	}


	public function startOver()
	{
		$id               = $this->input->getUint('id');
		$Itemid           = $this->input->getUint('Itemid');
		$enableAutoScroll = $this->solidresConfig->get('enable_auto_scroll', 1);

		$this->app->setUserState($this->context . '.room', null);
		$this->app->setUserState($this->context . '.extra', null);
		$this->app->setUserState($this->context . '.guest', null);
		/*$this->app->setUserState($this->context . '.payment', NULL);*/
		$this->app->setUserState($this->context . '.discount', null);
		$this->app->setUserState($this->context . '.deposit', null);
		$this->app->setUserState($this->context . '.coupon', null);
		$this->app->setUserState($this->context . '.token', null);
		$this->app->setUserState($this->context . '.cost', null);
		$this->app->setUserState($this->context . '.checkin', null);
		$this->app->setUserState($this->context . '.checkout', null);
		$this->app->setUserState($this->context . '.room_type_prices_mapping', null);
		$this->app->setUserState($this->context . '.selected_room_types', null);
		$this->app->setUserState($this->context . '.reservation_asset_id', null);
		$this->app->setUserState($this->context . '.current_selected_tariffs', null);
		$this->app->setUserState($this->context . '.room_opt', null);

		$this->setRedirect(JRoute::_('index.php?option=com_solidres&view=reservationasset&id=' . $id . '&Itemid=' . $Itemid . ($enableAutoScroll ? '#book-form' : '') , false));
	}
}