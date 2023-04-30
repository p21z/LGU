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

use Joomla\CMS\Factory;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Date\Date;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Table\Table;

HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));
HTMLHelper::_('script', 'com_solidres/assets/datePicker/localization/jquery.ui.datepicker-' . Factory::getLanguage()->getTag() . '.js', array('version' => SRVersion::getHashVersion(), 'relative' => true));
Table::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/tables');
JLoader::register('SRUtilities', SRPATH_LIBRARY . '/utilities/utilities.php');
JLoader::register('SRLayoutHelper', JPATH_ADMINISTRATOR . '/components/com_solidres/helpers/layout.php');
SRLayoutHelper::addIncludePath(JPATH_SITE . '/components/com_solidres/layouts');

$lang                   = Factory::getLanguage();
$app                    = Factory::getApplication();
$context                = 'com_solidres.reservation.process';
$checkin                = $app->getUserState($context . '.checkin');
$checkout               = $app->getUserState($context . '.checkout');
$roomsOccupancyOptions  = $app->getUserState($context . '.room_opt', array());
$prioritizingRoomTypeId = $app->getUserState($context . '.prioritizing_room_type_id', 0);

$tableAsset = Table::getInstance('ReservationAsset', 'SolidresTable');
$tableAsset->load(array('default' => 1, 'state' => 1));
if (empty($tableAsset->id) || $tableAsset->id <= 0)
{
	echo '<div class="alert alert-error">' . Text::_('SR_MOD_CHECKAVAILABILITY_NO_DEFAULT_ASSET_FOUND') . '</div>';

	return;
}

$enableRoomTypeDropdown         = $params->get('enable_roomtype_dropdown', 0);
$allowedCheckinDays             = $params->get('allowed_checkin_days', [0, 1, 2, 3, 4, 5, 6]);
$enableGeneralAvailabilityRange = $params->get('enable_general_availability_daterange', 0);
$availableFrom                  = $params->get('available_from', '');
$availableTo                    = $params->get('available_to', '');

if ($enableRoomTypeDropdown)
{
	JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');
	$roomTypesModel = JModelLegacy::getInstance('RoomTypes', 'SolidresModel', array('ignore_request' => true));
	$roomTypesModel->setState('filter.reservation_asset_id', $tableAsset->id);
	$roomTypesModel->setState('list.select', 'r.id, r.name');
	$roomTypesModel->setState('filter.state', '1');
	$roomTypesModel->setState('filter.is_hub_dashboard', false);
	$roomTypes = $roomTypesModel->getItems();
}

$config               = Factory::getConfig();
$solidresConfig       = ComponentHelper::getParams('com_solidres');
$minDaysBookInAdvance = $solidresConfig->get('min_days_book_in_advance', 0);
$maxDaysBookInAdvance = $solidresConfig->get('max_days_book_in_advance', 0);
$minLengthOfStay      = $solidresConfig->get('min_length_of_stay', 1);
$datePickerMonthNum   = $solidresConfig->get('datepicker_month_number', 3);
$weekStartDay         = $solidresConfig->get('week_start_day', 1);
$dateFormat           = $solidresConfig->get('date_format', 'd-m-Y');

$tzoffset    = $config->get('offset');
$timezone    = new DateTimeZone($tzoffset);

if ($enableGeneralAvailabilityRange) :
	$availableFromDate = Date::getInstance($availableFrom, null);
	$availableToDate   = Date::getInstance($availableTo, null);
	$dateCheckInMin    = Date::getInstance($availableFrom)->setTimezone($timezone);
	$dateCheckInMax    = Date::getInstance($availableTo)->setTimezone($timezone);
else :
	$dateCheckInMin = Date::getInstance();
endif;

if (!isset($checkin) && !$enableGeneralAvailabilityRange) :
	$dateCheckInMin->add(new DateInterval('P' . ($minDaysBookInAdvance) . 'D'))->setTimezone($timezone);
endif;
$dateCheckOut = Date::getInstance($dateCheckInMin->format('Y-m-d'), $timezone);
if (!isset($checkout)) :
	$dateCheckOut->add(new DateInterval('P' . ($minLengthOfStay) . 'D'))->setTimezone($timezone);
endif;

$jsDateFormat               = SRUtilities::convertDateFormatPattern($dateFormat);
$roomsOccupancyOptionsCount = count($roomsOccupancyOptions);
$maxRooms                   = $params->get('max_room_number', 10);
$maxAdults                  = $params->get('max_adult_number', 10);
$maxChildren                = $params->get('max_child_number', 10);
$hideRoomQuantity           = $params->get('hide_room_quantity', 0);
$mergeAdultChild            = $params->get('merge_adult_child', 0);

$defaultCheckinDate  = '';
$defaultCheckoutDate = '';
if (isset($checkin))
{
	$checkinModule  = Date::getInstance($checkin, $timezone);
	$checkoutModule = Date::getInstance($checkout, $timezone);
	// These variables are used to set the defaultDate of datepicker
	$defaultCheckinDate  = $checkinModule->format('Y-m-d', true);
	$defaultCheckoutDate = $checkoutModule->format('Y-m-d', true);
}
else
{
	if (!empty($allowedCheckinDays))
	{
		$defaultMinCheckInDate = Date::getInstance('now', $timezone)->add(new DateInterval('P' . ($minDaysBookInAdvance) . 'D'));
		$tempDayInfo           = getdate($defaultMinCheckInDate->format('U'));
		while (!in_array($tempDayInfo['wday'], $allowedCheckinDays))
		{
			$defaultMinCheckInDate->add(new DateInterval('P1D'));
			$tempDayInfo = getdate($defaultMinCheckInDate->format('U'));
		}
	}
}

if (!empty($defaultCheckinDate)) :
	$defaultCheckinDateArray    = explode('-', $defaultCheckinDate);
	$defaultCheckinDateArray[1] -= 1; // month in javascript is less than 1 in compare with month in PHP
endif;

if (!empty($defaultCheckoutDate)) :
	$defaultCheckoutDateArray    = explode('-', $defaultCheckoutDate);
	$defaultCheckoutDateArray[1] -= 1; // month in javascript is less than 1 in compare with month in PHP
endif;


Factory::getDocument()->addScriptDeclaration('
	Solidres.jQuery(function($) {
		var minLengthOfStay = ' . $minLengthOfStay . ';
		var enabledCheckinDays = ' . (!empty($allowedCheckinDays) ? json_encode($allowedCheckinDays, JSON_NUMERIC_CHECK) : '[]') . ';
		var mCAForm' . $module->id . ' = $("#sr-checkavailability-form-' . $module->id . '");
		var checkout = mCAForm' . $module->id . '.find(".checkout_datepicker_inline_module").datepicker({
			minDate : "+' . ($minDaysBookInAdvance + $minLengthOfStay) . '",
			numberOfMonths : ' . $datePickerMonthNum . ',
			showButtonPanel : true,
			dateFormat : "' . $jsDateFormat . '",
			firstDay: ' . $weekStartDay . ',
			' . (isset($checkout) ? 'defaultDate: new Date(' . implode(',', $defaultCheckoutDateArray) . '),' : '') . '
			onSelect: function() {
				mCAForm' . $module->id . '.find("input[name=\'checkout\']").val($.datepicker.formatDate("yy-mm-dd", $(this).datepicker("getDate")));
				mCAForm' . $module->id . '.find(".checkout_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", $(this).datepicker("getDate"))).attr("readonly", "readonly");
				mCAForm' . $module->id . '.find(".checkout_datepicker_inline_module").slideToggle();
				mCAForm' . $module->id . '.find(".checkin_module").removeClass("disabledCalendar");
			}
		});
		var checkin = mCAForm' . $module->id . '.find(".checkin_datepicker_inline_module").datepicker({
			minDate : new Date(' . $dateCheckInMin->format('Y') . ',' . ((int) $dateCheckInMin->format('m') - 1) . ',' .  $dateCheckInMin->format('d') . '),
			' . ($enableGeneralAvailabilityRange ? 'maxDate: new Date(' . $dateCheckInMax->format('Y') . ',' . ((int) $dateCheckInMax->format('m') - 1) . ',' . $dateCheckInMax->format('d') . '),' : '') . '
			' . ($maxDaysBookInAdvance > 0 && !$enableGeneralAvailabilityRange ? 'maxDate: "+' . ($maxDaysBookInAdvance) . '",' : '') . '
			numberOfMonths : ' . $datePickerMonthNum . ',
			showButtonPanel : true,
			dateFormat : "' . $jsDateFormat . '",
			' . (isset($checkin) ? 'defaultDate: new Date(' . implode(',', $defaultCheckinDateArray) . '),' : '') . '
			onSelect : function() {
				var currentSelectedDate = $(this).datepicker("getDate");
				var checkoutMinDate = $(this).datepicker("getDate", "+1d");
				checkoutMinDate.setDate(checkoutMinDate.getDate() + minLengthOfStay);
				checkout.datepicker( "option", "minDate", checkoutMinDate );
				checkout.datepicker( "setDate", checkoutMinDate);

				mCAForm' . $module->id . '.find("input[name=\'checkin\']").val($.datepicker.formatDate("yy-mm-dd", currentSelectedDate));
				mCAForm' . $module->id . '.find("input[name=\'checkout\']").val($.datepicker.formatDate("yy-mm-dd", checkoutMinDate));

				mCAForm' . $module->id . '.find(".checkin_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", currentSelectedDate)).attr("readonly", "readonly");
				mCAForm' . $module->id . '.find(".checkout_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", checkoutMinDate)).attr("readonly", "readonly");
				mCAForm' . $module->id . '.find(".checkin_datepicker_inline_module").slideToggle();
				mCAForm' . $module->id . '.find(".checkout_module").removeClass("disabledCalendar");
			},
			firstDay: ' . $weekStartDay . ',
			beforeShowDay: function(date) {
                var day = date.getDay();
                var dateFormatted = $.datepicker.formatDate("yy-mm-dd", date);
                
                if (isValidCheckInDate(day, enabledCheckinDays)) {
                    return [true, "bookable"];
                } else {
                    return [false, "notbookable"];
                }
            }
		});
		$(".ui-datepicker").addClass("notranslate");
		mCAForm' . $module->id . '.find(".checkin_module").click(function() {
			if (!$(this).hasClass("disabledCalendar")) {
				mCAForm' . $module->id . '.find(".checkin_datepicker_inline_module").slideToggle("fast", function() {
					if ($(this).is(":hidden")) {
						mCAForm' . $module->id . '.find(".checkout_module").removeClass("disabledCalendar");
					} else {
						mCAForm' . $module->id . '.find(".checkout_module").addClass("disabledCalendar");
					}
				});
			}
		});
	
		mCAForm' . $module->id . '.find(".checkout_module").click(function() {
			if (!$(this).hasClass("disabledCalendar")) {
				mCAForm' . $module->id . '.find(".checkout_datepicker_inline_module").slideToggle("fast", function() {
					if ($(this).is(":hidden")) {
						mCAForm' . $module->id . '.find(".checkin_module").removeClass("disabledCalendar");
					} else {
						mCAForm' . $module->id . '.find(".checkin_module").addClass("disabledCalendar");
					}
				});
			}
		});

		mCAForm' . $module->id . '.find(".room_quantity").change(function() {
			var curQuantity = $(this).val();
			mCAForm' . $module->id . '.find(".room_num_row").each(function( index ) {
				var index2 = index + 1;
				if (index2 <= curQuantity) {
					mCAForm' . $module->id . '.find("#room_num_row_" + index2).show();
					mCAForm' . $module->id . '.find("#room_num_row_" + index2 + " select").removeAttr("disabled");
				} else {
					mCAForm' . $module->id . '.find("#room_num_row_" + index2).hide();
					mCAForm' . $module->id . '.find("#room_num_row_" + index2 + " select").attr("disabled", "disabled");
				}
			});
		});

		if (mCAForm' . $module->id . '.find(".room_quantity").val() > 0) {
			mCAForm' . $module->id . '.find(".room_quantity").trigger("change");
		}
    });
');

$enableRoomQuantity = $params->get('enable_room_quantity_option', 0);

require JModuleHelper::getLayoutPath('mod_sr_checkavailability', $params->get('layout', 'default'));
