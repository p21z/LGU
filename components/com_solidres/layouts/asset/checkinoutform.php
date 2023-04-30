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

/*
 * This layout file can be overridden by copying to:
 *
 * /templates/TEMPLATENAME/html/layouts/com_solidres/asset/checkinoutform.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Session\Session;

extract($displayData);

$solidresRoomType    = SRFactory::get('solidres.roomtype.roomtype');
$solidresReservation = SRFactory::get('solidres.reservation.reservation');
$isStandardTariff    = $tariff->valid_from == '00-00-0000' && $tariff->valid_to == '00-00-0000';
$showDateInfo        = !empty($checkIn) && !empty($checkOut);

// Since v2.6.0, the maximum months in date picker is 2
$datePickerMonthNum = $datePickerMonthNum > 2 ? 2 : $datePickerMonthNum;

// An integer array of all enabled checkin days in a week
$enabledCheckinDays = $tariff->limit_checkin;

// If valid from is in the past, switch valid from to now
// (need to take min days book in advance into consideration)
$now = strtotime("now");
if ($now > strtotime($tariff->valid_from)) :
	$tariff->valid_from = date('d-m-Y', $now);
endif;

$unavailableDates = array();
$tariffStartDate  = (new DateTime($tariff->valid_from))->modify('first day of this month');

if ($maxDaysBookInAdvance > 0) :
	$tariffEndDate = (new DateTime($tariff->valid_from))->modify("+$maxDaysBookInAdvance days");
	$tmpEndDate    = (new DateTime($tariff->valid_to));
	if ($tariffEndDate > $tmpEndDate) :
		$tariffEndDate = $tmpEndDate;

	    // Reset the value to match the reality
		$maxDaysBookInAdvance = SRUtilities::calculateDateDiff($tariff->valid_from, $tariff->valid_to);
	endif;

	$tariffEndDate->modify('first day of next month');
else:
	$tariffEndDate = (new DateTime($tariff->valid_to))->modify('first day of next month');
endif;

$tariffDateInterval = DateInterval::createFromDateString('1 month');
$tariffPeriod       = new DatePeriod($tariffStartDate, $tariffDateInterval, $tariffEndDate);

foreach ($tariffPeriod as $period) :
	$unavailableDatesPeriod = $solidresRoomType->getUnavailableDates(
		$roomTypeId,
		$period->format('Y'),
		$period->format('m')
	);

	$unavailableDates = array_merge($unavailableDates, $unavailableDatesPeriod);
endforeach;

$checkInDates = array();
foreach ($unavailableDates as $unavailableDate) :
	if ($solidresReservation->hasCheckIn($roomTypeId, $unavailableDate)) :
		$checkInDates[] = $unavailableDate;
	endif;
endforeach;

$limitBookingStartDates = array();
foreach ($unavailableDates as $unavailableDate) :
	if ($solidresReservation->hasLimitBookingStartDate($roomTypeId, $unavailableDate)) :
		$limitBookingStartDates[] = $unavailableDate;
	endif;
endforeach;

if (!$isStandardTariff) :
	$dayDiff = SRUtilities::calculateDateDiff(JDate::getInstance('now', $timezone)->format('d-m-Y'), $tariff->valid_from);
	if ($dayDiff < $minDaysBookInAdvance) :
		$dateCheckIn = JDate::getInstance($tariff->valid_from, $timezone)->add(new DateInterval('P' . ($minDaysBookInAdvance - $dayDiff) . 'D'));
	else :
		$dateCheckIn = JDate::getInstance($tariff->valid_from, $timezone);
	endif;
	$dateCheckOut = JDate::getInstance($tariff->valid_from, $timezone);
else :
	$dateCheckIn  = JDate::getInstance('now', $timezone)->add(new DateInterval('P' . ($minDaysBookInAdvance) . 'D'));
	$dateCheckOut = JDate::getInstance('now', $timezone);
endif;

// Try to find the minimum default check in date
$defaultMinCheckInDate = $dateCheckIn;
if (!empty($enabledCheckinDays)) :
	$tempDayInfo = getdate($defaultMinCheckInDate->format('U'));
	while (!in_array($tempDayInfo['wday'], $enabledCheckinDays)) :
		$defaultMinCheckInDate->add(new DateInterval('P1D'));
		$tempDayInfo = getdate($defaultMinCheckInDate->format('U'));
	endwhile;
endif;

// Try to find the minimum default check out date
// Switch to the new default min check in date, for Package
// $defaultMinCheckInDate already contains $minDaysBookInAdvance
$defaultMinCheckOutDate = clone $defaultMinCheckInDate;
if (!is_null($tariff->d_min)) :
	$defaultMinCheckOutDate->add(new DateInterval('P' . ($bookingType == 0 ? $tariff->d_min : ($tariff->d_min > 0 ? $tariff->d_min - 1 : $tariff->d_min)) . 'D'));
else : // For standard tariff
	$defaultMinCheckOutDate->add(new DateInterval('P1D'));
endif;
$defaultMaxCheckOutDateString = '';
if (!is_null($tariff->d_max)) :
	$defaultMaxCheckOutDate = clone $defaultMinCheckInDate;
	$defaultMaxCheckOutDate->add(new DateInterval('P' . ($bookingType == 0 ? $tariff->d_max : $tariff->d_max - 1) . 'D'));
	$defaultMaxCheckOutDateString = $defaultMaxCheckOutDate->format('Y-m-d', true);
endif;

$defaultMinCheckOutDateString = $defaultMinCheckOutDate->format('Y-m-d', true);

JHtml::_('script', 'com_solidres/assets/datePicker/localization/jquery.ui.datepicker-' . JFactory::getLanguage()->getTag() . '.js', array('version' => SRVersion::getHashVersion(), 'relative' => true));

$displayData['is_standard_tariff'] = $isStandardTariff;

if (0 == $type) :
    echo SRLayoutHelper::getInstance()->render(
        'asset.checkinoutform' . ((defined('SR_LAYOUT_STYLE') && SR_LAYOUT_STYLE != '') ? '_' . SR_LAYOUT_STYLE : '_style1'),
        $displayData
    );
else :
	echo SRLayoutHelper::getInstance()->render(
		'asset.checkinoutform_apartment',
		$displayData
	);
endif;

/*if ($tariff->type <= 1) :
    echo SRLayoutHelper::getInstance()->render(
        'asset.checkinoutform' . ((defined('SR_LAYOUT_STYLE') && SR_LAYOUT_STYLE != '') ? '_' . SR_LAYOUT_STYLE : '_style1'),
        $displayData
    );
else :
    echo SRLayoutHelper::getInstance()->render(
        'asset.checkinoutform_date_blocks_2',
        array_merge($displayData, array(
            'defaultMinCheckInDate' => $defaultMinCheckInDate,
            'defaultMinCheckOutDate' => $defaultMinCheckOutDate
        ))
    );
endif;*/

?>

<script>
    Solidres.jQuery(function ($) {
        function changeCheckButtonState() {
            if ($(".sr-datepickers input[name='checkin']").val()
                &&
                $(".sr-datepickers input[name='checkout']").val()) {
                $(".sr-datepickers .searchbtn").prop("disabled", false);
            } else {
                $(".sr-datepickers .searchbtn").prop("disabled", true);
            }
        }

        function updateCheckinField(value, dateFormat) {
            $('.sr-datepickers input[name="checkin"]').val($.datepicker.formatDate("yy-mm-dd", value));
            $('.checkin_roomtype').removeAttr('readonly').val($.datepicker.formatDate(dateFormat, value)).attr('readonly', 'readonly');

            /*if ($(".apartment-form-holder").length) {
                $(".apartment-form-holder").find(".trigger_tariff_calculating").eq(0).trigger("change");
            }*/
        }

        function updateCheckoutField(value, dateFormat) {
            $('.sr-datepickers input[name="checkout"]').val($.datepicker.formatDate("yy-mm-dd", value));
            $('.checkout_roomtype').removeAttr('readonly').val($.datepicker.formatDate(dateFormat, value)).attr('readonly', 'readonly');

            if ($(".apartment-form-holder").length) {
                $(".apartment-form-holder").find(".trigger_tariff_calculating").eq(0).trigger("change");
            }
        }

        var dateFormat = "<?php echo $jsDateFormat ?>";
        var firstDay = <?php echo $weekStartDay ?>;

		<?php

		if (!$isStandardTariff) :
			$validFrom                    = array_reverse(explode('-', $tariff->valid_from));
			$validFrom[1]                 -= 1;
			$validTo                      = array_reverse(explode('-', $tariff->valid_to));
			$validTo[1]                   -= 1;
			$datePickerMinDateCheckout    = explode('-', $defaultMinCheckOutDateString);
			$datePickerMinDateCheckout[1] -= 1; // In JS, the month index starts from 0, not 1.
			if (!is_null($tariff->d_max)) :
				$datePickerMaxDateCheckout    = explode('-', $defaultMaxCheckOutDateString);
				$datePickerMaxDateCheckout[1] -= 1; // In JS, the month index starts from 0, not 1.
			endif;

			echo '        
        var minLengthOfStay = ' . (!is_null($tariff->d_min) ? ($bookingType == 0 ? $tariff->d_min : $tariff->d_min - 1) : 1) . ';
        var maxLengthOfStay = ' . (!is_null($tariff->d_max) ? ($bookingType == 0 ? $tariff->d_max : $tariff->d_max - 1) : -1) . ';
        var intervalLengthOfStay = ' . ($tariff->d_interval) . ';
        var bookingType = ' . $bookingType . ';
        var ratePlanMode = ' . $tariff->mode . ';
        
        if (maxLengthOfStay > 0) {
            var periodMinMax = maxLengthOfStay - minLengthOfStay;
        }					
        
        if (intervalLengthOfStay > 0 && minLengthOfStay > 0 && maxLengthOfStay > 0) {
            if (bookingType == 0) {
                var threshold = Math.floor(maxLengthOfStay / intervalLengthOfStay);
            } else {
                var threshold = Math.floor((maxLengthOfStay + 1) / intervalLengthOfStay);
            }						
            
            var steps = [];
            for (i = 0; i <= threshold; i++) {
                steps.push(i * intervalLengthOfStay);
            }				
        }
        
        var enabledCheckinDays = ' . (!empty($enabledCheckinDays) ? json_encode($enabledCheckinDays, JSON_NUMERIC_CHECK) : '[]') . ';
        var unavailableDates = ' . (!empty($unavailableDates) ? json_encode($unavailableDates) : '[]') . ';
        var checkInDates = ' . (!empty($checkInDates) ? json_encode($checkInDates) : '[]') . ';
        var limitBookingStartDates = ' . (!empty($limitBookingStartDates) ? json_encode($limitBookingStartDates) : '[]') . ';
        
        var checkInMinDate = new Date(' . implode(', ', $validFrom) . ');
        if ( ' . $dayDiff . ' < ' . $minDaysBookInAdvance . ' ) {
            checkInMinDate.setDate(checkInMinDate.getDate() + ' . ($minDaysBookInAdvance - $dayDiff) . ');
        } else {
            checkInMinDate.setDate(checkInMinDate.getDate());
        }
        var checkInMaxDate = new Date(' . implode(', ', $validTo) . ');
        checkInMaxDate.setDate(checkInMaxDate.getDate() - minLengthOfStay);
        
        var checkout_roomtype = $(".checkout_datepicker_inline").datepicker({
            minDate : new Date(' . implode(', ', $datePickerMinDateCheckout) . '),
            ' . ((!is_null($tariff->d_max)) ? 'maxDate : new Date(' . implode(', ', $datePickerMaxDateCheckout) . '),' : '') . '
            numberOfMonths : ' . $datePickerMonthNum . ',
            showButtonPanel : true,
            dateFormat : dateFormat,
            firstDay: firstDay,
            onSelect: function() {
                updateCheckoutField($(this).datepicker("getDate"), dateFormat);
                $(".checkin_roomtype").removeClass("disabledCalendar");
                $(".checkout_datepicker_inline").slideToggle();
                changeCheckButtonState();
            },
            beforeShowDay: function(date) {
                var currentSelectedDate = $(".checkin_datepicker_inline").datepicker("getDate");
                var testDate3 = new Date(' . implode(', ', $validTo) . ');
                var dateFormatted = $.datepicker.formatDate("yy-mm-dd", date);
                if (date > testDate3 
                    || ($.inArray(dateFormatted, unavailableDates) > -1 
                        && $.inArray(dateFormatted, checkInDates) == -1)
                        && dateFormatted != unavailableDates[0]
                    ) {
                    return [false, "notbookable2"];
                }
                
                if (intervalLengthOfStay > 0 && minLengthOfStay > 0 && maxLengthOfStay > 0) {
                    var diffInDays = Math.round((date - currentSelectedDate)/(24*60*60*1000));
                    if (bookingType == 1) {
                        diffInDays += 1;
                    }
                    if (diffInDays >= 0 && $.inArray(diffInDays,steps) > -1) {
                        return [true, "bookable"];
                    } else {
                        return [false, "notbookable"];
                    }   
                } else {
                    return [true, "bookable"];
                }							
            }
        });

        var checkin_roomtype = $(".checkin_datepicker_inline").datepicker({
            minDate : checkInMinDate,
            maxDate : checkInMaxDate,
            ' . ($maxDaysBookInAdvance > 0 ? 'maxDate: "+' . ($maxDaysBookInAdvance) . '",' : '') . '
            numberOfMonths : ' . $datePickerMonthNum . ',
            showButtonPanel : true,
            dateFormat : dateFormat,
            onSelect : function(dateText, inst) {
                var currentSelectedDate = $(this).datepicker("getDate");
                var checkoutMinDate = $(this).datepicker("getDate", "+1d");
                var checkoutMaxDate = $(this).datepicker("getDate", "+1d");
                
                if (ratePlanMode == 1) {
                    $.ajax({
                        url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=rateplan.findConditions&format=json&id=' . $tariff->id . '&date=" + ($.datepicker.formatDate("yy-mm-dd", currentSelectedDate)) + "&' . Session::getFormToken() . '=1",
                        dataType: "json",
                        success: function(data) {
                            var minLengthOfStay = ' . (!is_null($tariff->d_min) ? ($bookingType == 0 ? $tariff->d_min : $tariff->d_min - 1) : 1) . ';
                            var maxLengthOfStay = ' . (!is_null($tariff->d_max) ? ($bookingType == 0 ? $tariff->d_max : $tariff->d_max - 1) : -1) . ';
                            if (data.min_los > 0) {
                                minLengthOfStay = bookingType == 0 ? data.min_los : data.min_los - 1;
                            }
                            
                            if (data.max_los > 0) {
                                maxLengthOfStay = bookingType == 0 ? data.max_los : data.max_los - 1;
                            }
                            
                            updateCalendar(checkoutMinDate, checkoutMaxDate, currentSelectedDate, minLengthOfStay, maxLengthOfStay);
                        }
                    });
                } else {
                    updateCalendar(checkoutMinDate, checkoutMaxDate, currentSelectedDate, minLengthOfStay, maxLengthOfStay);
                }
            },
            firstDay: firstDay,
            beforeShowDay: function(date) {
                var day = date.getDay();
                var dateFormatted = $.datepicker.formatDate("yy-mm-dd", date);
                
                if (isValidCheckInDate(day, enabledCheckinDays) && $.inArray(dateFormatted, unavailableDates) == -1 ) {
                    return [true, "bookable"];
                } else {
                    return [false, "notbookable"];
                }
            }
        });
        
        function updateCalendar(checkoutMinDate, checkoutMaxDate, currentSelectedDate, minLengthOfStay, maxLengthOfStay) {
            // Set the min selectable checkout date if applicable
            canProcess = true;
            for (i = 1; i <= minLengthOfStay; i ++) {
                checkoutMinDate.setDate(checkoutMinDate.getDate() + 1);
                checkoutMinDateFormatted = $.datepicker.formatDate("yy-mm-dd", checkoutMinDate);
                
                tmpUnavailableDates = unavailableDates;
                
                checkout_roomtype.datepicker("refresh");
                
                if ($.inArray(checkoutMinDateFormatted, tmpUnavailableDates) > -1
                    &&
                    checkoutMinDateFormatted != tmpUnavailableDates[0]
                    &&
                    $.inArray(checkoutMinDateFormatted, checkInDates) == -1
                    &&
                    (
                        (bookingType == 0 && $.inArray(checkoutMinDateFormatted, limitBookingStartDates) == -1)
                        ||
                        (bookingType == 1 && $.inArray(checkoutMinDateFormatted, limitBookingStartDates) > -1)
                    )
                    ) {
                    canProcess = false; // No selectable checkout date
                    break;
                }						
            }
            
            updateCheckinField(currentSelectedDate, dateFormat);
            
            if (!canProcess) {
                $(".checkin_datepicker_inline").slideToggle({
                    complete: function() {
                        $(".sr-datepickers input[name=\'checkout\']").val("");
                        $(".checkout_roomtype").val($(".checkout_roomtype").data("placeholder"));
                        alert("' . JText::_('SR_CHOOSE_ANOTHER_CHECKIN') . '");
                        $(".checkout_roomtype").addClass("disabledCalendar");
                    }
                });
            } else {
                $(".checkin_datepicker_inline").slideToggle();
                checkout_roomtype.datepicker( "option", "minDate", checkoutMinDate );
                checkout_roomtype.datepicker( "setDate", checkoutMinDate);
                
                // Set the max selectable checkout date if applicable
                if (maxLengthOfStay > 0) {
                    for (i = 1; i <= maxLengthOfStay; i ++) {
                        checkoutMaxDate.setDate(checkoutMaxDate.getDate() + 1);	
                        if ($.inArray($.datepicker.formatDate("yy-mm-dd", checkoutMaxDate), unavailableDates) > -1
                            &&
                            $.inArray($.datepicker.formatDate("yy-mm-dd", checkoutMaxDate), checkInDates) == -1) {
                            break;
                        }
                    }
                    var tariffValidTo = new Date(' . implode(', ', $validTo) . ');

                    if (checkoutMaxDate > tariffValidTo) {
                        checkoutMaxDate = tariffValidTo;
                    }
                                                        
                    checkout_roomtype.datepicker( "option", "maxDate", new Date(checkoutMaxDate) );
                }
                                                
                updateCheckoutField(checkoutMinDate, dateFormat);
                $(".checkout_roomtype").removeClass("disabledCalendar");
            }
            
            changeCheckButtonState();
        }';

		else : // For standard tariff
			echo '
        var minLengthOfStay = ' . $minLengthOfStay . ';
        var checkout_roomtype = $(".checkout_datepicker_inline").datepicker({
            minDate : "+' . ($minDaysBookInAdvance + $minLengthOfStay) . '",
            numberOfMonths : ' . $datePickerMonthNum . ',
            showButtonPanel : true,
            dateFormat : dateFormat,
            firstDay: firstDay,
            onSelect: function() {
                $(".sr-datepickers input[name=\'checkout\']").val($.datepicker.formatDate("yy-mm-dd", $(this).datepicker("getDate")));
                $(".checkout_roomtype").removeAttr("readonly").val($.datepicker.formatDate(dateFormat, $(this).datepicker("getDate"))).attr("readonly", "readonly");
                $(".checkout_datepicker_inline").slideToggle();
                $(".checkin_roomtype").removeClass("disabledCalendar");
                changeCheckButtonState();
                if ($(".apartment-form-holder").length) {
                    $(".apartment-form-holder").find(".trigger_tariff_calculating").eq(0).trigger("change");
                }
            }
        });
        var checkin_roomtype = $(".checkin_datepicker_inline").datepicker({
            minDate : "+' . ($minDaysBookInAdvance) . 'd",
            ' . ($maxDaysBookInAdvance > 0 ? 'maxDate: "+' . ($maxDaysBookInAdvance) . '",' : '') . '
            numberOfMonths : ' . $datePickerMonthNum . ',
            showButtonPanel : true,
            dateFormat : dateFormat,
            onSelect : function() {
                var currentSelectedDate = $(this).datepicker("getDate");
                var checkoutMinDate = $(this).datepicker("getDate", "+1d");
                checkoutMinDate.setDate(checkoutMinDate.getDate() + minLengthOfStay);
                checkout_roomtype.datepicker( "option", "minDate", checkoutMinDate );
                checkout_roomtype.datepicker( "setDate", checkoutMinDate);

                $(".sr-datepickers input[name=\'checkin\']").val($.datepicker.formatDate("yy-mm-dd", currentSelectedDate));
                $(".sr-datepickers input[name=\'checkout\']").val($.datepicker.formatDate("yy-mm-dd", checkoutMinDate));

                $(".checkin_roomtype").removeAttr("readonly").val($.datepicker.formatDate(dateFormat, currentSelectedDate)).attr("readonly", "readonly");
                $(".checkout_roomtype").removeAttr("readonly").val($.datepicker.formatDate(dateFormat, checkoutMinDate)).attr("readonly", "readonly");
                $(".checkin_datepicker_inline").slideToggle();
                $(".checkout_roomtype").removeClass("disabledCalendar");
                changeCheckButtonState();
                if ($(".apartment-form-holder").length) {
                    $(".apartment-form-holder").find(".trigger_tariff_calculating").eq(0).trigger("change");
                }
            },
            firstDay: firstDay
        });
        ';
		endif;
		?>
        $(".ui-datepicker").addClass("notranslate");
    });
</script>