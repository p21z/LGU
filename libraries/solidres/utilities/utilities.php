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

/**
 * Utilities handler class
 *
 * @package       Solidres
 * @subpackage    Utilities
 */
class SRUtilities
{
	public static function translateDayWeekName($inputs)
	{
		$dayMapping = self::getDayMapping();

		foreach ($inputs as $input)
		{
			$input->w_day_name = $dayMapping[$input->w_day];
		}

		return $inputs;
	}

	public static function translateText($text)
	{
		if (strpos($text, '{lang') !== false)
		{
			$text = self::filterText($text);
		}

		return $text;
	}

	public static function getTariffDetailsScaffoldings($config = array())
	{
		$scaffoldings = array();

		$dayMapping = self::getDayMapping();

		// If this is package per person or package per room
		if ($config['type'] == 2 || $config['type'] == 3)
		{
			$scaffoldings[0]             = new stdClass();
			$scaffoldings[0]->id         = null;
			$scaffoldings[0]->tariff_id  = $config['tariff_id'];
			$scaffoldings[0]->price      = null;
			$scaffoldings[0]->w_day      = 8;
			$scaffoldings[0]->guest_type = $config['guest_type'];
			$scaffoldings[0]->from_age   = null;
			$scaffoldings[0]->to_age     = null;
			$scaffoldings[0]->date       = null;

			return $scaffoldings;
		}
		else // For normal complex tariff
		{
			if ($config['mode'] == 0) // Mode = Week
			{
				for ($i = 0; $i < 7; $i++)
				{
					$scaffoldings[$i]             = new stdClass();
					$scaffoldings[$i]->id         = null;
					$scaffoldings[$i]->tariff_id  = $config['tariff_id'];
					$scaffoldings[$i]->price      = null;
					$scaffoldings[$i]->w_day      = $i;
					$scaffoldings[$i]->w_day_name = $dayMapping[$i];
					$scaffoldings[$i]->guest_type = $config['guest_type'];
					$scaffoldings[$i]->from_age   = (isset($config['guest_type']) && strpos($config['guest_type'], 'child') !== false) ? 0 : null;
					$scaffoldings[$i]->to_age     = (isset($config['guest_type']) && strpos($config['guest_type'], 'child') !== false) ? 10 : null;
					$scaffoldings[$i]->date       = null;
				}

				return $scaffoldings;
			}
			else // Mode = Day
			{
				$tariffDates                                                    = self::calculateWeekDay($config['valid_from'], $config['valid_to']);
				$resultsSortedPerMonth                                          = array();
				$resultsSortedPerMonth[date('Y-m', strtotime($tariffDates[0]))] = array();

				foreach ($tariffDates as $i => $tariffDate)
				{
					$scaffoldings[$i]             = new stdClass();
					$scaffoldings[$i]->id         = null;
					$scaffoldings[$i]->tariff_id  = $config['tariff_id'];
					$scaffoldings[$i]->price      = null;
					$scaffoldings[$i]->w_day      = date('w', strtotime($tariffDate));
					$scaffoldings[$i]->w_day_name = $dayMapping[$scaffoldings[$i]->w_day];
					$scaffoldings[$i]->guest_type = $config['guest_type'];
					$scaffoldings[$i]->from_age   = (strpos($config['guest_type'], 'child') !== false) ? 0 : null;
					$scaffoldings[$i]->to_age     = (strpos($config['guest_type'], 'child') !== false) ? 10 : null;
					$scaffoldings[$i]->date       = $tariffDate;

					$currentMonth = date('Y-m', strtotime($tariffDate));
					if (!isset($resultsSortedPerMonth[$currentMonth]))
					{
						$resultsSortedPerMonth[$currentMonth] = array();
					}

					$scaffoldings[$i]->w_day_label          = $dayMapping[$scaffoldings[$i]->w_day] . ' ' . date('d', strtotime($scaffoldings[$i]->date));
					$scaffoldings[$i]->is_weekend           = SRUtilities::isWeekend($scaffoldings[$i]->date);
					$scaffoldings[$i]->is_today             = SRUtilities::isToday($scaffoldings[$i]->date);
					$resultsSortedPerMonth[$currentMonth][] = $scaffoldings[$i];
				}

				return $resultsSortedPerMonth;
			}
		}


	}

	/* Translate custom field by using language tag. Author: isApp.it Team */
	public static function getLagnCode()
	{
		$lang_codes = JLanguageHelper::getLanguages('lang_code');
		$lang_code  = $lang_codes[JFactory::getLanguage()->getTag()]->sef;

		return $lang_code;
	}

	/* Translate custom field by using language tag. Author: isApp.it Team */
	public static function filterText($text)
	{
		if (strpos($text, '{lang') === false) return $text;
		$lang_code = self::getLagnCode();
		$regex     = "#{lang " . $lang_code . "}(.*?){\/lang}#is";
		$text      = preg_replace($regex, '$1', $text);
		$regex     = "#{lang [^}]+}.*?{\/lang}#is";
		$text      = preg_replace($regex, '', $text);

		return $text;
	}

	/**
	 * This simple function return a correct javascript date format pattern based on php date format pattern
	 *
	 **/
	public static function convertDateFormatPattern($input)
	{
		$mapping = array(
			'd-m-Y'     => 'dd-mm-yy',
			'd/m/Y'     => 'dd/mm/yy',
			'd M Y'     => 'dd M yy',
			'd F Y'     => 'dd MM yy',
			'D, d M Y'  => 'D, dd M yy',
			'l, d F Y'  => 'DD, dd MM yy',
			'Y-m-d'     => 'yy-mm-dd',
			'm-d-Y'     => 'mm-dd-yy',
			'm/d/Y'     => 'mm/dd/yy',
			'M d, Y'    => 'M dd, yy',
			'F d, Y'    => 'MM dd, yy',
			'D, M d, Y' => 'D, M dd, yy',
			'l, F d, Y' => 'DD, MM dd, yy',
		);

		return $mapping[$input];
	}

	/**
	 * Get an array of week days in the period between $from and $to
	 *
	 * @param    string   From date
	 * @param    string   To date
	 *
	 * @return   array      An array in format array(0 => 'Y-m-d', 1 => 'Y-m-d')
	 */
	public static function calculateWeekDay($from, $to)
	{
		$datetime1 = new DateTime($from);
		$interval  = self::calculateDateDiff($from, $to);
		$weekDays  = array();

		$weekDays[] = $datetime1->format('Y-m-d');

		for ($i = 1; $i <= (int) $interval; $i++)
		{
			$weekDays[] = $datetime1->modify('+1 day')->format('Y-m-d');
		}

		return $weekDays;
	}

	/**
	 * Calculate the number of day from a given range
	 *
	 * Note: DateTime is PHP 5.3 only
	 *
	 * @param  string $from   Begin of date range
	 * @param  string $to     End of date range
	 * @param  string $format The format indicator
	 *
	 * @return string
	 */
	public static function calculateDateDiff($from, $to, $format = '%a')
	{
		$datetime1 = new DateTime($from ?? 'now');
		$datetime2 = new DateTime($to ?? 'now');

		$interval = $datetime1->diff($datetime2);

		return $interval->format($format);
	}

	public static function getReservationStatusList($config = array())
	{
		// Build the active state filter options.
		$options = array();

		foreach (SolidresHelper::getStatusesList(0) as $status)
		{
			$options[] = JHtml::_('select.option', $status->value, $status->text);
		}

		$options[] = JHtml::_('select.option', '', 'JALL');

		return $options;
	}

	public static function getReservationPaymentStatusList($config = array())
	{
		// Build the active state filter options.
		$options = array();

		foreach (SolidresHelper::getStatusesList(1) as $status)
		{
			$options[] = JHtml::_('select.option', $status->value, $status->text);
		}

		$options[] = JHtml::_('select.option', '', 'JALL');

		return $options;
	}

	public static function removeArrayElementsExcept(&$array, $keyToRemain)
	{
		foreach ($array as $key => $val)
		{
			if ($key != $keyToRemain)
			{
				unset($array[$key]);
			}
		}
	}

	/**
	 * Check to see this user is asset's partner or not
	 *
	 * @param $joomlaUserId
	 * @param $assetId
	 *
	 * @return bool
	 *
	 */
	public static function isAssetPartner($joomlaUserId, $assetId)
	{
		static $checked = [];
		$joomlaUserId   = (int) $joomlaUserId;
		$assetId        = (int) $assetId;
		$key            = $joomlaUserId .':' . $assetId;

		if (isset($checked[$key]))
		{
			return $checked[$key];
		}

		$db = JFactory::getDbo();

		if (SRPlugin::isEnabled('hub'))
		{
			$query = $db->getQuery(true)
				->select('COUNT(*)')
				->from($db->quoteName('#__sr_property_staff_xref', 'a'))
				->where('a.property_id = ' . $assetId)
				->where('a.staff_id = ' . $joomlaUserId);

			if ($db->setQuery($query)->loadResult())
			{
				$checked[$key] = true;

				return $checked[$key];
			}
		}

		$query = $db->getQuery(true)
			->select('COUNT(*)')
			->from($db->quoteName('#__sr_reservation_assets', 'a'))
			->join('INNER', $db->quoteName('#__sr_customers', 'a2') . ' ON a2.id = a.partner_id')
			->where('a.id = ' . $assetId)
			->where('a2.user_id = ' . $joomlaUserId);
		$checked[$key] = $db->setQuery($query)->loadResult() ? true : false;

		return $checked[$key];
	}

	/**
	 * Check to see if any of the given user groups is a Solidres partner group
	 *
	 * @param $joomlaUserGroups
	 *
	 * @return boolean
	 *
	 * @since 1.9.0
	 */
	public static function isPartnerGroups($joomlaUserGroups)
	{
		$solidresConfig    = JComponentHelper::getParams('com_solidres');
		$partnerUserGroups = $solidresConfig->get('partner_user_groups', array());
		$partnerUserGroups = array_values($partnerUserGroups);

		if (count(array_intersect($partnerUserGroups, $joomlaUserGroups)) == 0)
		{
			return false;
		}

		return true;
	}

	/**
	 * Get the partner ID from the current logged in user
	 *
	 * @return bool
	 *
	 * @since 1.9.0
	 */
	public static function getPartnerId()
	{
		static $partnerId = null;

		if (null === $partnerId)
		{
			// Default is not partner
			$partnerId = false;
			$user      = JFactory::getUser();

			if (SRPlugin::isEnabled('user')
				&& self::isPartnerGroups($user->getAuthorisedGroups())
			)
			{
				// Get the customer ID by query
				// We don't need to use JTable because JTable will do many things.
				$db    = JFactory::getDbo();
				$query = $db->getQuery(true)
					->select('a.id')
					->from($db->quoteName('#__sr_customers', 'a'))
					->where('a.user_id = ' . (int) $user->id);

				if ($customerId = $db->setQuery($query)->loadResult())
				{
					$partnerId = (int) $customerId;
				}
			}
		}

		return $partnerId;
	}

	public static function isApplicableForAdjoiningTariffs($roomTypeId, $checkIn, $checkOut, $excludes = array())
	{
		$result = array();

		$dbo = JFactory::getDbo();

		$tableName      = $dbo->quoteName('#__sr_tariffs');
		$checkInQuoted  = $dbo->quote($checkIn);
		$checkOutQuoted = $dbo->quote($checkOut);
		$excludeList1   = '';
		$excludeList2   = '';
		if (!empty($excludes))
		{
			$excludeList1 = ' AND t1.id NOT IN (' . implode(',', $excludes) . ')';
			$excludeList2 = ' AND t2.id NOT IN (' . implode(',', $excludes) . ')';
		}

		$query = "
				(SELECT DISTINCT t1.id
				FROM $tableName AS t1
				WHERE t1.valid_to >= $checkInQuoted AND t1.valid_to <= $checkOutQuoted
				AND t1.valid_from <= $checkInQuoted AND t1.state = 1 AND t1.room_type_id = $roomTypeId
				$excludeList1
				LIMIT 1)
				UNION ALL
				(SELECT DISTINCT t2.id
				FROM $tableName AS t2
				WHERE t2.valid_from <= $checkOutQuoted AND t2.valid_from >= $checkInQuoted
				AND t2.valid_to >= $checkOutQuoted AND t2.state = 1 AND t2.room_type_id = $roomTypeId
				$excludeList2
				LIMIT 1)
				";

		$tariffIds = $dbo->setQuery($query)->loadObjectList();

		if (count($tariffIds) == 2)
		{
			$query = "SELECT datediff(t2.valid_from, t1.valid_to) FROM $tableName AS t1, $tableName AS t2 
						WHERE t1.id = {$tariffIds[0]->id} AND t2.id = {$tariffIds[1]->id}";

			if ($dbo->setQuery($query)->loadResult() == 1)
			{
				$result = array($tariffIds[0]->id, $tariffIds[1]->id);
			}
		}

		return $result;
	}

	public static function getUpdates()
	{
		$file = JPATH_ADMINISTRATOR . '/components/com_solidres/views/system/cache/updates.json';

		if (file_exists($file)
			&& ($raw = file_get_contents($file))
			&& ($updates = json_decode($raw, true))
			&& json_last_error() == JSON_ERROR_NONE
		)
		{
			return $updates;
		}

		return array();
	}

	/**
	 * Gets the update site Ids for our extension.
	 *
	 * @return    mixed    An array of Ids or null if the query failed.
	 */
	public static function getUpdateSiteIds($extensionId)
	{
		$db    = JFactory::getDbo();
		$query = $db->getQuery(true)
			->select($db->qn('update_site_id'))
			->from($db->qn('#__update_sites_extensions'))
			->where($db->qn('extension_id') . ' = ' . $db->q($extensionId));
		$db->setQuery($query);
		$updateSiteIds = $db->loadColumn(0);

		return $updateSiteIds;
	}

	public static function isWeekend($date)
	{
		$WeekMonDay = JComponentHelper::getParams('com_solidres')->get('week_start_day', '1') === '1';
		$dayNFormat = (int) date('N', strtotime($date));

		if ($WeekMonDay)
		{
			return in_array($dayNFormat, array(6, 7));
		}

		return in_array($dayNFormat, array(5, 6));
	}

	public static function isToday($date)
	{
		return date('Y-m-d') == date('Y-m-d', strtotime($date));
	}

	public static function getCustomerGroupId()
	{
		JModelLegacy::addIncludePath(JPATH_COMPONENT_ADMINISTRATOR . '/models', 'SolidresModel');
		$user            = JFactory::getUser();
		$customerGroupId = null;

		if (SR_PLUGIN_USER_ENABLED && $user->id > 0)
		{
			$customerModel   = JModelLegacy::getInstance('Customer', 'SolidresModel', array('ignore_request' => true));
			$customer        = $customerModel->getItem(array('user_id' => $user->id));
			$customerGroupId = ($customer) ? $customer->customer_group_id : null;
		}

		return $customerGroupId;
	}

	public static function getReservationStatus($status = null)
	{
		$statuses = array();

		foreach (SolidresHelper::getStatusesList(0, 0) as $state)
		{
			$statuses[$state->value] = $state->text;
		}

		if (!empty($status))
		{
			return $statuses[$status];
		}

		return $statuses;
	}

	public static function areValidDatesForTariffLimit($checkin, $checkout, $tariffLimitCheckin, $tariffLimitCheckout = '')
	{
		if (is_array($tariffLimitCheckin))
		{
			$limitCheckinArray = $tariffLimitCheckin;
		}
		else
		{
			$limitCheckinArray = json_decode($tariffLimitCheckin, true);
		}

		$checkinDate = new DateTime($checkin);
		$dayInfo     = getdate($checkinDate->format('U'));

		// If the current check in date does not match the allowed check in dates, we ignore this tariff
		if (!in_array($dayInfo['wday'], $limitCheckinArray))
		{
			return false;
		}

		return true;
	}

	/**
	 * Check the given tariff to see if it satisfy the occupancy options
	 *
	 * @param   $complexTariff          The tariff to check for
	 * @param   $roomsOccupancyOptions  The selected occupancy options (could be for a single room or multi rooms)
	 *
	 * @return  boolean
	 *
	 * @since   2.2.0
	 */
	public static function areValidDatesForOccupancy($complexTariff, $roomsOccupancyOptions)
	{
		if (empty($roomsOccupancyOptions))
		{
			return true;
		}

		$isValidPeopleRange    = true;
		$peopleRangeMatchCount = count($roomsOccupancyOptions);

		foreach ($roomsOccupancyOptions as $roomOccupancyOptions)
		{
			if (isset($roomOccupancyOptions['guests']))
			{
				$totalPeopleRequested = $roomOccupancyOptions['guests'];
			}
			else
			{
				$totalPeopleRequested = $roomOccupancyOptions['adults'] + $roomOccupancyOptions['children'];
			}

			if ($complexTariff->p_min > 0 && $complexTariff->p_max > 0)
			{
				$isValidPeopleRange = $totalPeopleRequested >= $complexTariff->p_min && $totalPeopleRequested <= $complexTariff->p_max;
			}
			elseif (empty($complexTariff->p_min) && $complexTariff->p_max > 0)
			{
				$isValidPeopleRange = $totalPeopleRequested <= $complexTariff->p_max;
			}
			elseif ($complexTariff->p_min > 0 && empty($complexTariff->p_max))
			{
				$isValidPeopleRange = $totalPeopleRequested >= $complexTariff->p_min;
			}

			if (!$isValidPeopleRange)
			{
				$peopleRangeMatchCount--;
			}
		}

		if ($peopleRangeMatchCount == 0)
		{
			return false;
		}

		return true;
	}

	/**
	 * Check the given tariff to see if it satisfy the length of stay (LOS) requirements
	 *
	 * @param   $complexTariff          The tariff to check for
	 * @param   $checkin
	 * @param   $checkout
	 * @param   $lengthOfStay
	 *
	 * @return  boolean
	 *
	 * @since   2.2.0
	 */
	public static function areValidDatesForLenghtOfStay($complexTariff, $checkin, $checkout, $lengthOfStay, $bookingtype = 0)
	{
		$tariffModel = JModelLegacy::getInstance('Tariff', 'SolidresModel', array('ignore_request' => true));
		$tariff      = $tariffModel->getItem($complexTariff->id);

		if (!isset($tariff->details_reindex))
		{
			return false;
		}

		// In type = Rate per person per stay, we only check for the first $type, which is adult 1
		// The rest should follow adult 1 settings
		foreach ($tariff->details_reindex as $type => $dates)
		{
			$checkinDate = new DateTime($checkin);
			$checkinDateFormatted = $checkinDate->format('Y-m-d');

			$minLOS = 0;
			$maxLOS = 0;
			$maxInterval = 0;
			$maxIntervalDate = '';
			for ($i = 0; $i < $lengthOfStay; $i++)
			{
				$dateToCheck          = new DateTime($checkin);
				$dateToCheckFormatted = $dateToCheck->modify('+' . $i . ' day')->format('Y-m-d');

				// Check for per date min LOS and max LOS
				if (!empty($dates[$dateToCheckFormatted]->min_los) && $dates[$dateToCheckFormatted]->min_los > $minLOS)
				{
					$minLOS = $dates[$dateToCheckFormatted]->min_los;
				}

				if (!empty($dates[$dateToCheckFormatted]->max_los) && $dates[$dateToCheckFormatted]->max_los > $maxLOS)
				{
					$maxLOS = $dates[$dateToCheckFormatted]->max_los;
				}

				// Check for per date interval, at this moment we get the max interval for the given searched dates
				// and use it for validating only
				if (!empty($dates[$dateToCheckFormatted]->d_interval) && $dates[$dateToCheckFormatted]->d_interval > $maxInterval)
				{
					$maxInterval = $dates[$dateToCheckFormatted]->d_interval;
					$maxIntervalDate = $dateToCheckFormatted;
				}
			}

			if (empty($minLOS) && empty($maxLOS))
			{
				return true;
			}

			if (!empty($minLOS) && $minLOS > $lengthOfStay)
			{
				return false;
			}

			if (!empty($maxLOS) && $maxLOS < $lengthOfStay)
			{
				return false;
			}

			// Check for per date limit checkin
			$dayInfo     = getdate($checkinDate->format('U'));

			$tariffLimitCheckin = '';
			if (isset($dates[$checkinDateFormatted]))
			{
				$tariffLimitCheckin = $dates[$checkinDateFormatted]->limit_checkin;
			}

			if (!empty($tariffLimitCheckin))
			{
				if (is_array($tariffLimitCheckin))
				{
					$limitCheckinArray = $tariffLimitCheckin;
				}
				else
				{
					$limitCheckinArray = json_decode($tariffLimitCheckin, true);
				}

				// If the current check in date does not match the allowed check in dates, we ignore this tariff
				if (!in_array($dayInfo['wday'], $limitCheckinArray))
				{
					return false;
				}
			}

			// Check for per date interval
			if ($maxInterval > 0 && $dates[$maxIntervalDate]->max_los > 0)
			{
				$intervalThreshold = (int) floor($dates[$maxIntervalDate]->max_los / $maxInterval);
				$intervalSteps     = array();
				for ($intervalCount = 0; $intervalCount <= $intervalThreshold; $intervalCount++)
				{
					$intervalSteps[] = $intervalCount * $maxInterval;
				}

				if ($bookingtype == 1)
				{
					array_unshift($intervalSteps, 1);
				}

				if (!in_array($lengthOfStay, $intervalSteps))
				{
					return false;
				}
			}

			return true;
		}
	}

	/**
	 * Check the given tariff to see if it satisfy the interval requirements
	 *
	 * @param   $complexTariff          The tariff to check for
	 * @param   $stayLength
	 * @param   $bookingtype
	 *
	 * @return  boolean
	 *
	 * @since   2.5.0
	 */
	public static function areValidDatesForInterval($complexTariff, $stayLength, $bookingtype)
	{
		if ($complexTariff->d_interval <= 0 || $complexTariff->d_min <= 0 || $complexTariff->d_max <= 0)
		{
			return true;
		}

		$intervalThreshold = (int) floor($complexTariff->d_max / $complexTariff->d_interval);
		$intervalSteps     = array();
		for ($intervalCount = 0; $intervalCount <= $intervalThreshold; $intervalCount++)
		{
			$intervalSteps[] = $intervalCount * $complexTariff->d_interval;
		}

		if ($bookingtype == 1)
		{
			array_unshift($intervalSteps, 1);
		}

		if (!in_array($stayLength, $intervalSteps))
		{
			return false;
		}

		return true;
	}

	public static function cleanInputArray($input)
	{
		if (!is_array($input) || empty($input))
		{
			return array();
		}

		foreach ($input as $k => $v)
		{
			if (!is_array($v) && !is_object($v))
			{
				$input[$k] = JFilterInput::getInstance()->clean($v);
			}

			if (is_array($v))
			{
				$input[$k] = self::cleanInputArray($v);
			}
		}

		return $input;
	}

	public static function getDefaultAssetId()
	{
		JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/tables');

		$assetTable = JTable::getInstance('ReservationAsset', 'SolidresTable');
		$assetTable->load(array('default' => 1));

		return $assetTable->id;
	}

	public static function getTariffType($tariffId)
	{
		$tariffTable = JTable::getInstance('Tariff', 'SolidresTable');

		if ($tariffId > 0)
		{
			$tariffTable->load($tariffId);

			return $tariffTable->type;
		}

		return false;
	}

	public static function getDayMapping()
	{
		return array(
			'0' => JText::_('sun'),
			'1' => JText::_('mon'),
			'2' => JText::_('tue'),
			'3' => JText::_('wed'),
			'4' => JText::_('thu'),
			'5' => JText::_('fri'),
			'6' => JText::_('sat')
		);
	}

	public static function getTariffTypeMapping()
	{
		return array(
			0 => JText::_('SR_TARIFF_PER_ROOM_PER_NIGHT'),
			1 => JText::_('SR_TARIFF_PER_PERSON_PER_NIGHT'),
			2 => JText::_('SR_TARIFF_PACKAGE_PER_ROOM'),
			3 => JText::_('SR_TARIFF_PACKAGE_PER_PERSON'),
			4 => JText::_('SR_TARIFF_PER_ROOM_TYPE_PER_STAY')
		);
	}

	public static function getCurrencyFormatSets()
	{
		$params   = JComponentHelper::getParams('com_solidres');
		$decimals = $params->get('number_decimal_points', 2);

		return [
			1  => ['decimals' => $decimals, 'dec_points' => '.', 'thousands_sep' => ','], // X0,000.00
			2  => ['decimals' => $decimals, 'dec_points' => ',', 'thousands_sep' => ' '], // 0 000,00X
			3  => ['decimals' => $decimals, 'dec_points' => ',', 'thousands_sep' => '.'], // X0.000,00
			4  => ['decimals' => $decimals, 'dec_points' => '.', 'thousands_sep' => ','], // 0,000.00X
			5  => ['decimals' => $decimals, 'dec_points' => '.', 'thousands_sep' => ' '], // 0 000.00X
			6  => ['decimals' => $decimals, 'dec_points' => '.', 'thousands_sep' => ','], // X 0,000.00
			7  => ['decimals' => $decimals, 'dec_points' => ',', 'thousands_sep' => ' '], // 0 000,00 X
			8  => ['decimals' => $decimals, 'dec_points' => ',', 'thousands_sep' => '.'], // X 0.000,00
			9  => ['decimals' => $decimals, 'dec_points' => '.', 'thousands_sep' => ','], // 0,000.00 X
			10 => ['decimals' => $decimals, 'dec_points' => '.', 'thousands_sep' => ' '], // 0 000.00 X
		];
	}

	/**
	 * Get all properties belong to the current partner/staff
	 * @return array|mixed
	 *
	 * @since version
	 */
	public static function getPropertiesByPartner()
	{
		$partnerId = self::getPartnerId();

		if (!$partnerId || !SRPlugin::isEnabled('hub'))
		{
			return [];
		}

		static $properties = null;

		if (null === $properties)
		{
			$db    = JFactory::getDbo();
			$query = $db->getQuery(true)
				->select('a.property_id')
				->from($db->quoteName('#__sr_property_staff_xref', 'a'))
				->where('a.staff_id = ' . (int) JFactory::getUser()->id);
			$db->setQuery($query);
			$propertyIds = $db->loadColumn();

			$query->clear()
				->select('*')
				->from($db->quoteName('#__sr_reservation_assets', 'a'))
				->where('a.state = 1');

			if ($propertyIds)
			{
				// The active user is a staff user
				$query->where('a.id IN (' . join(',', $propertyIds) . ')');
			}
			else
			{
				// The active user is a partner user
				$query->where('a.partner_id = ' . (int) $partnerId);
			}

			$db->setQuery($query);
			$properties = $db->loadObjectList('id') ?: [];
		}

		return $properties;
	}

	public static function getPropertyPartnerId($propertyId)
	{
		$propertyId = (int) $propertyId;
		$properties = self::getPropertiesByPartner();

		return isset($properties[$propertyId]) ? $properties[$propertyId]->partner_id : false;
	}

	public static function getPartnerIds()
	{
		$partnerIds = [];

		if ($properties = self::getPropertiesByPartner())
		{
			foreach($properties as $property)
			{
				$partnerIds[] = (int) $property->partner_id;
			}
		}

		// Special case when partner does not have properties assigned yet
		if (empty($partnerIds))
		{
			return [self::getPartnerId()];
		}

		return $partnerIds;
	}

	/**
	 * Get the min price from a given tariff and show the formatted result
	 *
	 * @param $tariff
	 * @param $roomType
	 *
	 * @return string
	 *
	 * @since
	 */
	public static function getMinPrice($property, $roomType, $tariff, $showTaxIncl)
	{
		$min           = null;
		$isPrivate     = $roomType->is_private;
		$minStayLength = 0;
		$minPrice      = null;

		switch ($tariff->type)
		{
			case 0: // rate per room per stay
			case 4: // rate per room type per stay

				if ($tariff->mode == 1)
				{
					foreach ($tariff->details['per_room'] as $month => $details)
					{
						foreach ($details as $detail)
						{
							if ((!isset($minPrice) || $minPrice > $detail->price) && $detail->price > 0)
							{
								$minPrice = $detail->price;
							}
						}
					}
				}
				else
				{
					$minPrice = array_reduce($tariff->details['per_room'], function ($t1, $t2) {
						if ($t1->price == 0) return $t2;

						if ($t2->price == 0) return $t1;

						return $t1->price < $t2->price ? $t1 : $t2;
					}, array_shift($tariff->details['per_room']))->price;

				}

				$minStayLength = 1;

				break;
			case 1: // rate per person per stay
				if ($tariff->mode == 1)
				{
					$count = 0;
					foreach ($tariff->details as $type => $dates)
					{
						if ($tariff->p_min > 0 && $count == $tariff->p_min)
						{
							break;
						}

						$min = null;

						foreach ($dates as $month => $details)
						{
							foreach ($details as $detail)
							{
								if ((!isset($min) || $min->price > $detail->price) && $detail->price > 0)
								{
									$min = $detail;
								}
							}
						}

						$minPrice += $min->price;

						$count++;
					}
				}
				else
				{
					$count = 0;
					foreach ($tariff->details as $type => $dates)
					{
						if ($tariff->p_min > 0 && $count == $tariff->p_min)
						{
							break;
						}

						$minPrice += array_reduce($tariff->details[$type], function ($t1, $t2) {
							if ($t1->price == 0) return $t2;

							if ($t2->price == 0) return $t1;

							return $t1->price < $t2->price ? $t1 : $t2;
						}, array_shift($tariff->details[$type]))->price;

						$count++;
					}
				}

				$minStayLength = 1;

				break;
			case 2: // package per room
				$minPrice      = $tariff->details['per_room'][0]->price;
				$minStayLength = $tariff->d_min;
				break;
			case 3: // package per person
				$minPrice      = $tariff->details['adult1'][0]->price;
				$minStayLength = $tariff->d_min;
				break;
			default:
				break;
		}

		// Take single supplement value into consideration
		$enableSingleSupplement = $roomType->params['enable_single_supplement'] ?? 0;

		if ($tariff->p_min <= 1 && $enableSingleSupplement)
		{
			if ($roomType->params['single_supplement_is_percent'])
			{
				$minPrice = $minPrice + ($minPrice * ($roomType->params['single_supplement_value'] / 100));
			}
			else
			{
				$minPrice = $minPrice + $roomType->params['single_supplement_value'];
			}
		}

		// Calculate tax amount
		$totalImposedTaxAmount = 0;
		if (count($property->taxes) > 0)
		{
			foreach ($property->taxes as $taxType)
			{
				if ($property->price_includes_tax == 0)
				{
					$totalImposedTaxAmount += $minPrice * $taxType->rate;
				}
				else
				{
					$totalImposedTaxAmount += $minPrice - ($minPrice / (1 + $taxType->rate));
					$minPrice              -= $totalImposedTaxAmount;
				}
			}
		}
		$minCurrency        = new SRCurrency(0, $property->currency_id);
		$minCurrency->setValue($showTaxIncl ? ($minPrice + $totalImposedTaxAmount) : $minPrice);

		return self::appendPriceSuffix($minCurrency, $tariff->type, $property->booking_type, $minStayLength, null, $isPrivate, ($tariff->p_min > 0 ? $tariff->p_min : 1));
	}

	public static function appendPriceSuffix($price, $tariffType, $bookingType, $minStayLength, $originalPrice = null, $isPrivate = true, $adults = 1, $children = 0)
	{
		if ($tariffType == 0 || $tariffType == 2 || $tariffType == 4)
		{
			$tariffSuffix = JText::_('SR_TARIFF_SUFFIX_PER_' . ($isPrivate ? 'ROOM' : 'BED'));
		}
		else
		{
			$tariffSuffix = JText::plural('SR_TARIFF_SUFFIX_PER_PERSON', ($adults + $children));
		}

		$tariffSuffix .= JText::plural($bookingType == 0 ? 'SR_TARIFF_SUFFIX_NIGHT_NUMBER' : 'SR_TARIFF_SUFFIX_DAY_NUMBER', $minStayLength);

		$strikethrough = '';
		if (!is_null($originalPrice) && $originalPrice->getValue() > 0 && ($originalPrice->getValue() > $price->getValue()))
		{
			$strikethrough .= '<span class="sr-strikethrough">' . $originalPrice->format() . '</span>';
		}

		return '<span class="starting_from">' . JText::_('SR_STARTING_FROM') . '</span><span class="min_tariff">' . $strikethrough . $price->format() . '</span><span class="tariff_suffix">' . $tariffSuffix . '</span>';
	}

	public static function getMapProvider()
	{
		$params = ComponentHelper::getComponent('com_solidres')->getParams();
		$map    = $params->get('map_provider');

		if ($map === null && $params->get('google_map_api_key'))
		{
			return 'OSM';
		}

		return $map;
	}
}
