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

/**
 * Reservation Asset controller class.
 *
 * @package       Solidres
 * @subpackage    ReservationAsset
 * @since         0.1.0
 */
class SolidresControllerReservationAssetBase extends JControllerLegacy
{
	private $context;

	protected $reservationDetails;

	public function __construct($config = array())
	{
		$config['model_path'] = JPATH_COMPONENT_ADMINISTRATOR . '/models';
		$this->context = 'com_solidres.reservation.process';
		parent::__construct($config);
	}

	/**
	 * Method to get a model object, loading it if required.
	 *
	 * @param    string $name   The model name. Optional.
	 * @param    string $prefix The class prefix. Optional.
	 * @param    array  $config Configuration array for model. Optional.
	 *
	 * @return    object    The model.
	 * @since    1.5
	 */
	public function getModel($name = 'ReservationAsset', $prefix = 'SolidresModel', $config = array())
	{
		return parent::getModel($name, $prefix, $config);
	}

	/**
	 * Recalculate the tariff according to guest's room selection (adult number, child number, child's ages, extra items)
	 *
	 * @return string
	 */
	public function calculateTariff()
	{
		JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/tables');
		$solidresParams = JComponentHelper::getParams('com_solidres');
		$srRoomType     = SRFactory::get('solidres.roomtype.roomtype');

		$adultNumber    = $this->input->get('adult_number', 0, 'int');
		$childNumber    = $this->input->get('child_number', 0, 'int');
		$guestNumber    = $this->input->get('guest_number', 0, 'int');
		$roomTypeId     = $this->input->get('room_type_id', 0, 'int');
		$roomIndex      = $this->input->get('room_index', 0, 'int');
		$extrasSelected = $this->input->get('extras', array(), 'array');
		$raId           = $this->input->get('raid', 0, 'int');
		$tariffId       = $this->input->get('tariff_id', 0, 'int');
		$adjoiningLayer = $this->input->get('adjoining_layer', 0, 'int');
		$checkIn        = $this->input->get('checkin', '', 'string');
		$checkOut       = $this->input->get('checkout', '', 'string');
		$type           = $this->input->get('type', '', 'string');

		if ($guestNumber > 0)
		{
			$adultNumber = $guestNumber;
		}

		// When reservation is made in backend, there is no room index, instead of that we use room id
		if ($roomIndex == 'undefined')
		{
			$roomIndex = $this->input->get('room_id', 0, 'int');
		}

		$currencyId       = $this->app->getUserState($this->context . '.currency_id', null);
		$taxId            = $this->app->getUserState($this->context . '.tax_id');
		$bookingType      = $this->app->getUserState($this->context . '.booking_type');
		$priceIncludesTax = $this->app->getUserState($this->context . '.price_includes_tax', 0);
		$coupon           = $this->app->getUserState($this->context . '.coupon');
		$partnerId        = $this->app->getUserState($this->context . '.partner_id', null);

		if (empty($checkIn))
		{
			$checkIn = $this->app->getUserState($this->context . '.checkin');
		}

		if (empty($checkOut))
		{
			$checkOut = $this->app->getUserState($this->context . '.checkout');
		}

		if (empty($checkIn) || empty($checkOut))
		{
			echo json_encode([]);
			$this->app->close();
		}

		if (is_null($currencyId))
		{
			$tableAsset = JTable::getInstance('ReservationAsset', 'SolidresTable');
			$tableAsset->load($raId);
			$currencyId = $tableAsset->currency_id;
		}

		$dayMapping                = SRUtilities::getDayMapping();
		$showTaxIncl               = $solidresParams->get('show_price_with_tax', 0);
		$isDiscountPreTax          = $solidresParams->get('discount_pre_tax', 0);
		$numberDecimalPoints       = $solidresParams->get('number_decimal_points', 2);
		$commissionRatePerProperty = $solidresParams->get('commissionRatePerProperty', 0);
		$tariffBreakDownNetOrGross = $showTaxIncl == 1 ? 'net' : 'gross';
		$solidresCurrency          = new SRCurrency(0, $currencyId);

		if ($this->app->isClient('administrator'))
		{
			JFactory::getLanguage()->load('com_solidres', JPATH_SITE . '/components/com_solidres');
		}

		// Get imposed taxes
		$imposedTaxTypes = array();
		if (!empty($taxId))
		{
			$taxModel          = JModelLegacy::getInstance('Tax', 'SolidresModel', array('ignore_request' => true));
			$imposedTaxTypes[] = $taxModel->getItem($taxId);
		}

		// Get discount
		$discounts = array();
		if (SRPlugin::isEnabled('discount'))
		{
			$discountModel = JModelLegacy::getInstance('Discounts', 'SolidresModel', array('ignore_request' => true));
			$discountModel->setState('filter.reservation_asset_id', $raId);
			$discountModel->setState('filter.valid_from', $checkIn);
			$discountModel->setState('filter.valid_to', $checkOut);
			$discountModel->setState('filter.state', 1);
			$discountModel->setState('filter.type', array(0, 2, 3, 8, 9));
			$discounts = $discountModel->getItems();
		}

		// Get commission rates (Type = Commission is charged on top of the base cost)
		$commissionRates          = [];
		$partnerJoomlaUserGroupId = 0;
		if (SRPlugin::isEnabled('hub'))
		{
			JModelLegacy::addIncludePath(SRPlugin::getAdminPath('hub') . '/models', 'SolidresModel');
			$commissionRatesModel = JModelLegacy::getInstance('Commissionrates', 'SolidresModel', array('ignore_request' => true));
			$commissionRatesModel->setState('filter.scope', 0);
			$commissionRatesModel->setState('filter.state', 1);
			$commissionRatesModel->setState('filter.type', 1);

			$commissionRates          = $commissionRatesModel->getItems();
			$partnerJoomlaUserGroupId = CommissionHelper::getPartnerJoomlaUserGroup($partnerId);
		}

		// Get customer information
		$user            = JFactory::getUser();
		$customerGroupId = null;
		if (SRPlugin::isEnabled('user'))
		{
			JTable::addIncludePath(SRPlugin::getAdminPath('user') . '/tables');
			$customerTable = JTable::getInstance('Customer', 'SolidresTable');
			$customerTable->load(array('user_id' => $user->id));
			$customerGroupId = $customerTable->customer_group_id;
		}

		$couponIsValid = false;
		if (isset($coupon) && is_array($coupon))
		{
			$srCoupon       = SRFactory::get('solidres.coupon.coupon');
			$jconfig        = JFactory::getConfig();
			$tzoffset       = $jconfig->get('offset');
			$currentDate    = JFactory::getDate(date('Y-M-d'), $tzoffset)->toUnix();
			$checkinToCheck = JFactory::getDate(date('Y-M-d', strtotime($checkIn)), $tzoffset)->toUnix();
			$couponIsValid  = $srCoupon->isValid($coupon['coupon_code'], $raId, $currentDate, $checkinToCheck, $customerGroupId);
		}

		$stayLength = $originalStayLength = (int) SRUtilities::calculateDateDiff($checkIn, $checkOut);
		if ($bookingType == 1)
		{
			$stayLength++;
		}

		// Build the config values
		$tariffConfig = array(
			'booking_type'                 => $bookingType,
			'adjoining_tariffs_mode'       => $solidresParams->get('adjoining_tariffs_mode', 0),
			'child_room_cost_calc'         => $solidresParams->get('child_room_cost_calc', 1),
			'adjoining_layer'              => $adjoiningLayer,
			'price_includes_tax'           => $priceIncludesTax,
			'stay_length'                  => $stayLength,
			'allow_free'                   => $solidresParams->get('allow_free_reservation', 0),
			'number_decimal_points'        => $numberDecimalPoints,
			'commission_rates'             => $commissionRates,
			'partner_joomla_user_group_id' => $partnerJoomlaUserGroupId,
			'commission_rate_per_property' => $commissionRatePerProperty,
			'property_id'                  => $raId
		);

		// Calculate single supplement
		$roomTypeModel = JModelLegacy::getInstance('RoomType', 'SolidresModel', array('ignore_request' => true));
		$roomType      = $roomTypeModel->getItem($roomTypeId);
		if (isset($roomType->params['enable_single_supplement'])
			&&
			$roomType->params['enable_single_supplement'] == 1)
		{
			$tariffConfig['enable_single_supplement']     = true;
			$tariffConfig['single_supplement_value']      = $roomType->params['single_supplement_value'];
			$tariffConfig['single_supplement_is_percent'] = $roomType->params['single_supplement_is_percent'];
		}
		else
		{
			$tariffConfig['enable_single_supplement'] = false;
		}

		// Get children ages
		$childAges = array();
		for ($i = 0; $i < $childNumber; $i++)
		{
			$childAge = $this->input->get('child_age_' . $roomTypeId . '_' . $tariffId . '_' . $roomIndex . '_' . $i, '', 'string');
			if ($childAge != '')
			{
				$childAges[] = (int) $childAge;
			}
		}

		// Search for complex tariff first, if no complex tariff found, we will search for Standard Tariff
		if (SRPlugin::isEnabled('complextariff'))
		{
			$tariff = $srRoomType->getPrice($roomTypeId, $customerGroupId, $imposedTaxTypes, false, true, $checkIn, $checkOut, $solidresCurrency, $couponIsValid ? $coupon : null, $adultNumber, $childNumber, $childAges, $stayLength, (isset($tariffId) && $tariffId > 0 ? $tariffId : null), $discounts, $isDiscountPreTax, $tariffConfig);
		}
		else
		{
			$tariff = $srRoomType->getPrice($roomTypeId, $customerGroupId, $imposedTaxTypes, true, false, $checkIn, $checkOut, $solidresCurrency, $couponIsValid ? $coupon : null, $adultNumber, 0, array(), $stayLength, $tariffId, $discounts, $isDiscountPreTax, $tariffConfig);
		}

		if ($showTaxIncl)
		{
			$shownTariff                 = $tariff['total_price_tax_incl_discounted_formatted'];
			$shownTariffBeforeDiscounted = $tariff['total_price_tax_incl_formatted'];
		}
		else
		{
			$shownTariff                 = $tariff['total_price_tax_excl_discounted_formatted'];
			$shownTariffBeforeDiscounted = $tariff['total_price_tax_excl_formatted'];
		}

		// Get selected extra items
		$extras = array();
		if (!empty($extrasSelected))
		{
			foreach ($extrasSelected as $extraId)
			{
				$extras[$extraId]['quantity'] = $this->input->get('extra_' . $roomTypeId . '_' . $tariffId . '_' . $roomIndex . '_' . $extraId, '1', 'int');
			}
		}

		$totalExtraCostTaxIncl          = 0;
		$totalExtraCostTaxExcl          = 0;
		$totalExtraCostDailyRateTaxIncl = 0;
		$totalExtraCostDailyRateTaxExcl = 0;
		$totalExtraCost                 = 0;
		$totalExtraDailyRateCost        = 0;
		if (!empty($extras))
		{
			$extraModel = JModelLegacy::getInstance('Extra', 'SolidresModel', array('ignore_request' => true));

			foreach ($extras as $extraId => &$extraDetails)
			{
				$extra                                 = $extraModel->getItem($extraId);
				$extraDetails['price']                 = $extra->price;
				$extraDetails['price_tax_incl']        = $extra->price_tax_incl;
				$extraDetails['price_tax_excl']        = $extra->price_tax_excl;
				$extraDetails['price_adult']           = $extra->price_adult;
				$extraDetails['price_adult_tax_incl']  = $extra->price_adult_tax_incl;
				$extraDetails['price_adult_tax_excl']  = $extra->price_adult_tax_excl;
				$extraDetails['price_child']           = $extra->price_child;
				$extraDetails['price_child_tax_incl']  = $extra->price_child_tax_incl;
				$extraDetails['price_child_tax_excl']  = $extra->price_child_tax_excl;
				$extraDetails['name']                  = $extra->name;
				$extraDetails['charge_type']           = $extra->charge_type;
				$extraDetails['adults_number']         = $adultNumber;
				$extraDetails['children_number']       = $childNumber;
				$extraDetails['stay_length']           = $originalStayLength;
				$extraDetails['booking_type']          = $bookingType;
				$extraDetails['number_decimal_points'] = $numberDecimalPoints;
				$extraDetails['price_includes_tax']    = $extra->price_includes_tax;

				if (in_array($extraDetails['charge_type'], array(7, 8)))
				{
					continue;
				}

				$solidresExtra = new SRExtra($extraDetails);
				$costs         = $solidresExtra->calculateExtraCost();

				$totalExtraCostTaxIncl += $costs['total_extra_cost_tax_incl'];
				$totalExtraCostTaxExcl += $costs['total_extra_cost_tax_excl'];

				$extraDetails['total_extra_cost_tax_incl'] = $costs['total_extra_cost_tax_incl'];
				$extraDetails['total_extra_cost_tax_excl'] = $costs['total_extra_cost_tax_excl'];
				$extraDetails['total_extra_cost']          = $showTaxIncl ? $extraDetails['total_extra_cost_tax_incl'] : $extraDetails['total_extra_cost_tax_excl'];
			}

			// Calculate the price for extra item charge type Percentage of room daily rate
			foreach ($extras as $extraId => &$extraDetails)
			{
				$extra                                 = $extraModel->getItem($extraId);
				$extraDetails['price']                 = $extra->price;
				$extraDetails['price_tax_incl']        = $extra->price_tax_incl;
				$extraDetails['price_tax_excl']        = $extra->price_tax_excl;
				$extraDetails['price_adult']           = $extra->price_adult;
				$extraDetails['price_adult_tax_incl']  = $extra->price_adult_tax_incl;
				$extraDetails['price_adult_tax_excl']  = $extra->price_adult_tax_excl;
				$extraDetails['price_child']           = $extra->price_child;
				$extraDetails['price_child_tax_incl']  = $extra->price_child_tax_incl;
				$extraDetails['price_child_tax_excl']  = $extra->price_child_tax_excl;
				$extraDetails['name']                  = $extra->name;
				$extraDetails['charge_type']           = $extra->charge_type;
				$extraDetails['adults_number']         = $adultNumber;
				$extraDetails['children_number']       = $childNumber;
				$extraDetails['stay_length']           = $originalStayLength;
				$extraDetails['booking_type']          = $bookingType;
				$extraDetails['number_decimal_points'] = $numberDecimalPoints;

				if (!in_array($extraDetails['charge_type'], array(7, 8)))
				{
					continue;
				}

				$extraDetails['room_rate_tax_incl'] = $tariff['total_price_tax_incl_discounted_formatted']->getValue();
				$extraDetails['room_rate_tax_excl'] = $tariff['total_price_tax_excl_discounted_formatted']->getValue();

				$solidresExtra = new SRExtra($extraDetails);
				$costs         = $solidresExtra->calculateExtraCost();

				$totalExtraCostDailyRateTaxIncl += $costs['total_extra_cost_tax_incl'];
				$totalExtraCostDailyRateTaxExcl += $costs['total_extra_cost_tax_excl'];

				$extraDetails['total_extra_cost_tax_incl'] = $totalExtraCostDailyRateTaxIncl;
				$extraDetails['total_extra_cost_tax_excl'] = $totalExtraCostDailyRateTaxExcl;
				$extraDetails['total_extra_cost']          = $showTaxIncl ? $extraDetails['total_extra_cost_tax_incl'] : $extraDetails['total_extra_cost_tax_excl'];
			}

			if ($showTaxIncl)
			{
				$totalExtraCost          = $totalExtraCostTaxIncl;
				$totalExtraDailyRateCost = $totalExtraCostDailyRateTaxIncl;
			}
			else
			{
				$totalExtraCost          = $totalExtraCostTaxExcl;
				$totalExtraDailyRateCost = $totalExtraCostDailyRateTaxExcl;
			}

			$totalExtraCostFormat = clone $solidresCurrency;
			$totalExtraCostFormat->setValue($totalExtraCost);
			$totalExtraDailyRateCostFormat = clone $solidresCurrency;
			$totalExtraDailyRateCostFormat->setValue($totalExtraDailyRateCost);
		}

		if ($showTaxIncl)
		{
			if ($totalExtraCostTaxIncl > 0)
			{
				$shownTariff->setValue($shownTariff->getValue() + $totalExtraCostFormat->getValue(), false);
			}

			if ($totalExtraCostDailyRateTaxIncl > 0)
			{
				$shownTariff->setValue($shownTariff->getValue() + $totalExtraDailyRateCostFormat->getValue(), false);
			}
		}
		else
		{
			if ($totalExtraCostTaxExcl > 0)
			{
				$shownTariff->setValue($shownTariff->getValue() + $totalExtraCostFormat->getValue(), false);
			}

			if ($totalExtraCostDailyRateTaxExcl > 0)
			{
				$shownTariff->setValue($shownTariff->getValue() + $totalExtraDailyRateCostFormat->getValue(), false);
			}
		}

		$displayData = array(
			'tariff'                      => $tariff,
			'dayMapping'                  => $dayMapping,
			'extras'                      => $extras,
			'tariffBreakDownNetOrGross'   => $tariffBreakDownNetOrGross,
			'showTaxIncl'                 => $showTaxIncl,
			'shownTariffBeforeDiscounted' => $shownTariffBeforeDiscounted,
			'solidresCurrency'            => $solidresCurrency,
			'roomType'                    => $roomType,
			'grandTotal'                  => $shownTariff->format()
		);

		$assetCategoryId = $this->app->getUserState($this->context . '.asset_category_id', null);

		if (!is_null($assetCategoryId))
		{
			JFactory::getLanguage()->load('com_solidres_category_' . $assetCategoryId, JPATH_COMPONENT);
		}

		$tariffBreakDownHtml = SRLayoutHelper::getInstance()->render(
			'asset.breakdown' . ($type ? '_apartment' : ''),
			$displayData
		);

		echo json_encode(array(
			'room_index'                       => $roomIndex,
			'room_index_tariff'                => array(
				'id'        => !empty($shownTariff) ? $shownTariff->getId() : null,
				'activeId'  => !empty($shownTariff) ? $shownTariff->getActiveId() : null,
				'code'      => !empty($shownTariff) ? $shownTariff->getCode() : null,
				'sign'      => !empty($shownTariff) ? $shownTariff->getSign() : null,
				'name'      => !empty($shownTariff) ? $shownTariff->getName() : null,
				'rate'      => !empty($shownTariff) ? $shownTariff->getRate() : null,
				'value'     => !empty($shownTariff) ? $shownTariff->getValue() : null,
				'formatted' => !empty($shownTariff) ? $shownTariff->format() : null
			),
			'room_index_tariff_breakdown_html' => $tariffBreakDownHtml
		));

		$this->app->close();
	}
}