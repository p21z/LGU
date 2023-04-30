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
 * /templates/TEMPLATENAME/html/com_solidres/reservationasset/default_checkavailability.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Factory;
use Joomla\CMS\Date\Date;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Language\Text;

$config                = Factory::getConfig();
$datePickerMonthNum    = $this->config->get('datepicker_month_number', 3);
$weekStartDay          = $this->config->get('week_start_day', 1);
$roomsOccupancyOptions = $this->app->getUserState($this->context . '.room_opt', array());

$dateCheckIn = Date::getInstance();
if (empty($this->checkin)) :
	$dateCheckIn->add(new DateInterval('P' . ($this->minDaysBookInAdvance) . 'D'))->setTimezone($this->timezone);
endif;

$dateCheckOut = Date::getInstance();
if (empty($this->checkout)) :
	$dateCheckOut->add(new DateInterval('P' . ($this->minDaysBookInAdvance + $this->minLengthOfStay) . 'D'))->setTimezone($this->timezone);
endif;

$jsDateFormat               = SRUtilities::convertDateFormatPattern($this->dateFormat);
$roomsOccupancyOptionsCount = count($roomsOccupancyOptions);
$maxRooms                   = $this->item->params['max_room_number'] ?? 10;
$maxAdults                  = $this->item->params['max_adult_number'] ?? 10;
$maxChildren                = $this->item->params['max_child_number'] ?? 10;
$hideRoomQuantity           = $this->item->params['hide_room_quantity'] ?? 0;
$mergeAdultChild            = $this->item->params['merge_adult_child'] ?? 0;

$defaultCheckinDate  = '';
$defaultCheckoutDate = '';
if (!empty($this->checkin))
{
	$this->checkinModule  = Date::getInstance($this->checkin, $this->timezone);
	$this->checkoutModule = Date::getInstance($this->checkout, $this->timezone);
	// These variables are used to set the defaultDate of datepicker
	$defaultCheckinDate  = $this->checkinModule->format('Y-m-d', true);
	$defaultCheckoutDate = $this->checkoutModule->format('Y-m-d', true);
}

if (!empty($defaultCheckinDate)) :
	$defaultCheckinDateArray    = explode('-', $defaultCheckinDate);
	$defaultCheckinDateArray[1] -= 1; // month in javascript is less than 1 in compare with month in PHP
endif;

if (!empty($defaultCheckoutDate)) :
	$defaultCheckoutDateArray    = explode('-', $defaultCheckoutDate);
	$defaultCheckoutDateArray[1] -= 1; // month in javascript is less than 1 in compare with month in PHP
endif;

HTMLHelper::_('script', 'com_solidres/assets/datePicker/localization/jquery.ui.datepicker-' . Factory::getLanguage()->getTag() . '.js', array('version' => SRVersion::getHashVersion(), 'relative' => true));
Factory::getDocument()->addScriptDeclaration('
	Solidres.jQuery(function($) {
		var minLengthOfStay = ' . $this->minLengthOfStay . ';
		var checkAvailabilityForm = $("#sr-checkavailability-form-asset-' . $this->item->id . '");
		var checkout = checkAvailabilityForm.find(".checkout_datepicker_inline_module").datepicker({
			minDate : "+' . ($this->minDaysBookInAdvance + $this->minLengthOfStay) . '",
			numberOfMonths : ' . $datePickerMonthNum . ',
			showButtonPanel : true,
			dateFormat : "' . $jsDateFormat . '",
			firstDay: ' . $weekStartDay . ',
			' . (!empty($this->checkout) ? 'defaultDate: new Date(' . implode(',', $defaultCheckoutDateArray) . '),' : '') . '
			onSelect: function() {
				checkAvailabilityForm.find("input[name=\'checkout\']").val($.datepicker.formatDate("yy-mm-dd", $(this).datepicker("getDate")));
				checkAvailabilityForm.find(".checkout_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", $(this).datepicker("getDate"))).attr("readonly", "readonly");
				checkAvailabilityForm.find(".checkout_datepicker_inline_module").slideToggle();
				checkAvailabilityForm.find(".checkin_module").removeClass("disabledCalendar");
			}
		});
		var checkin = checkAvailabilityForm.find(".checkin_datepicker_inline_module").datepicker({
			minDate : "+' . $this->minDaysBookInAdvance . 'd",
			' . ($this->maxDaysBookInAdvance > 0 ? 'maxDate: "+' . ($this->maxDaysBookInAdvance) . '",' : '') . '
			numberOfMonths : ' . $datePickerMonthNum . ',
			showButtonPanel : true,
			dateFormat : "' . $jsDateFormat . '",
			' . (!empty($this->checkin) ? 'defaultDate: new Date(' . implode(',', $defaultCheckinDateArray) . '),' : '') . '
			onSelect : function() {
				var currentSelectedDate = $(this).datepicker("getDate");
				var checkoutMinDate = $(this).datepicker("getDate", "+1d");
				checkoutMinDate.setDate(checkoutMinDate.getDate() + minLengthOfStay);
				checkout.datepicker( "option", "minDate", checkoutMinDate );
				checkout.datepicker( "setDate", checkoutMinDate);
				
				checkAvailabilityForm.find("input[name=\'checkin\']").val($.datepicker.formatDate("yy-mm-dd", currentSelectedDate));
				checkAvailabilityForm.find("input[name=\'checkout\']").val($.datepicker.formatDate("yy-mm-dd", checkoutMinDate));
				
				checkAvailabilityForm.find(".checkin_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", currentSelectedDate)).attr("readonly", "readonly");
				checkAvailabilityForm.find(".checkout_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", checkoutMinDate)).attr("readonly", "readonly");
				checkAvailabilityForm.find(".checkin_datepicker_inline_module").slideToggle();
				checkAvailabilityForm.find(".checkout_module").removeClass("disabledCalendar");
			},
			firstDay: ' . $weekStartDay . '
		});
		$(".ui-datepicker").addClass("notranslate");
		checkAvailabilityForm.find(".checkin_module").click(function() {
			if (!$(this).hasClass("disabledCalendar")) {
				checkAvailabilityForm.find(".checkin_datepicker_inline_module").slideToggle("slow", function() {
					if ($(this).is(":hidden")) {
						checkAvailabilityForm.find(".checkout_module").removeClass("disabledCalendar");
					} else {
						checkAvailabilityForm.find(".checkout_module").addClass("disabledCalendar");
					}
				});
			}
		});
		
		checkAvailabilityForm.find(".checkout_module").click(function() {
			if (!$(this).hasClass("disabledCalendar")) {
				checkAvailabilityForm.find(".checkout_datepicker_inline_module").slideToggle("slow", function() {
					if ($(this).is(":hidden")) {
						checkAvailabilityForm.find(".checkin_module").removeClass("disabledCalendar");
					} else {
						checkAvailabilityForm.find(".checkin_module").addClass("disabledCalendar");
					}
				});
			}
		});
		
		checkAvailabilityForm.find(".room_quantity").change(function() {
			var curQuantity = $(this).val();
			checkAvailabilityForm.find(".room_num_row").each(function( index ) {
				var index2 = index + 1;
				if (index2 <= curQuantity) {
				checkAvailabilityForm.find("#room_num_row_" + index2).show();
				checkAvailabilityForm.find("#room_num_row_" + index2 + " select").removeAttr("disabled");
			} else {
				checkAvailabilityForm.find("#room_num_row_" + index2).hide();
				checkAvailabilityForm.find("#room_num_row_" + index2 + " select").attr("disabled", "disabled");
			}
			});
		});
		
		if (checkAvailabilityForm.find(".room_quantity").val() > 0) {
			checkAvailabilityForm.find(".room_quantity").trigger("change");
		}
	});
');

$enableRoomQuantity = $this->item->params['enable_room_quantity_option'] ?? 0;

?>

<form id="sr-checkavailability-form-asset-<?php echo $this->item->id ?>"
      action="<?php echo Route::_('index.php' . ($this->enableAutoScroll ? '#book-form' : ''), false) ?>" method="GET"
      class="form-stacked sr-validate">

    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo $enableRoomQuantity == 0 ? SR_UI_GRID_COL_9 : ($hideRoomQuantity ? SR_UI_GRID_COL_7 : SR_UI_GRID_COL_5) ?>">
                    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                        <div class="<?php echo SR_UI_GRID_COL_6 ?>">
	                        <?php
	                        echo SRLayoutHelper::render('field.datepicker', [
		                        'fieldLabel'            => 'SR_SEARCH_CHECKIN_DATE',
		                        'fieldName'             => 'checkin',
		                        'fieldClass'            => 'checkin_module',
		                        'datePickerInlineClass' => 'checkin_datepicker_inline_module',
		                        'dateUserFormat'        => !empty($this->checkin) ?
			                        $this->checkinModule->format($this->dateFormat, true) :
			                        $dateCheckIn->format($this->dateFormat, true),
		                        'dateDefaultFormat'     => !empty($this->checkin) ?
			                        $this->checkinModule->format('Y-m-d', true) :
			                        $dateCheckIn->format('Y-m-d', true)
	                        ]);
	                        ?>

                        </div>
                        <div class="<?php echo SR_UI_GRID_COL_6 ?>">
	                        <?php
	                        echo SRLayoutHelper::render('field.datepicker', [
		                        'fieldLabel'            => 'SR_SEARCH_CHECKOUT_DATE',
		                        'fieldName'             => 'checkout',
		                        'fieldClass'            => 'checkout_module',
		                        'datePickerInlineClass' => 'checkout_datepicker_inline_module',
		                        'dateUserFormat'        => !empty($this->checkout) ?
			                        $this->checkoutModule->format($this->dateFormat, true) :
			                        $dateCheckOut->format($this->dateFormat, true),
		                        'dateDefaultFormat'     => !empty($this->checkout) ?
			                        $this->checkoutModule->format('Y-m-d', true) :
			                        $dateCheckOut->format('Y-m-d', true)
	                        ]);
	                        ?>
                        </div>
                    </div>
                </div>
                <?php if ($enableRoomQuantity) : ?>
                    <div class="<?php echo $hideRoomQuantity ? SR_UI_GRID_COL_3 : SR_UI_GRID_COL_5 ?>">
                        <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                            <?php if ($hideRoomQuantity == 0) : ?>
                                <div class="<?php echo SR_UI_GRID_COL_3 ?>">
                                    <label><?php echo Text::_('SR_SEARCH_ROOMS') ?></label>
                                    <select class="form-select room_quantity"
                                            name="room_quantity">
                                        <?php for ($room_num = 1; $room_num <= $maxRooms; $room_num++) : ?>
                                            <option <?php echo $room_num == $roomsOccupancyOptionsCount ? 'selected' : '' ?>
                                                    value="<?php echo $room_num ?>"><?php echo $room_num ?></option>
                                        <?php endfor ?>
                                    </select>
                                </div>
                            <?php else : ?>
                                <input type="hidden" class="room_quantity" name="room_quantity" value="1"/>
                            <?php endif ?>
                            <div class="<?php echo $hideRoomQuantity ? SR_UI_GRID_COL_12 : SR_UI_GRID_COL_9 ?>">
                                <?php for ($room_num = 1; $room_num <= $maxRooms; $room_num++) : ?>
                                    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                                        <div class="<?php echo SR_UI_GRID_COL_12 ?> room_num_row"
                                             id="room_num_row_<?php echo $room_num ?>"
                                             style="<?php echo $room_num > 0 ? 'display: none' : '' ?>">
                                            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                                                <?php if (!$hideRoomQuantity) : ?>
                                                    <div class="<?php echo SR_UI_GRID_COL_4 ?>">
                                                        <label style="display: block">&nbsp;</label>
                                                        <?php echo Text::_('SR_SEARCH_ROOM') ?> <?php echo $room_num ?>
                                                    </div>
                                                <?php endif ?>
                                                <?php if (($hideRoomQuantity && !$mergeAdultChild) || !$hideRoomQuantity) : ?>
                                                    <div class="<?php echo $hideRoomQuantity ? SR_UI_GRID_COL_6 : SR_UI_GRID_COL_4 ?>">
                                                        <label><?php echo Text::_('SR_SEARCH_ROOM_ADULTS') ?></label>
                                                        <select <?php echo $room_num > 0 ? 'disabled' : '' ?>
                                                                class="form-select"
                                                                name="room_opt[<?php echo $room_num ?>][adults]">
                                                            <?php
                                                            for ($a = 1; $a <= $maxAdults; $a++) :
                                                                $selected = '';
                                                                if (isset($roomsOccupancyOptions[$room_num]['adults'])
                                                                    &&
                                                                    ($a == $roomsOccupancyOptions[$room_num]['adults'])
                                                                ) :
                                                                    $selected = 'selected';
                                                                endif;
                                                                ?>
                                                                <option <?php echo $selected ?>
                                                                        value="<?php echo $a ?>"><?php echo $a ?></option>
                                                            <?php
                                                            endfor
                                                            ?>
                                                        </select>
                                                    </div>
                                                    <div class="<?php echo $hideRoomQuantity ? SR_UI_GRID_COL_6 : SR_UI_GRID_COL_4 ?>">
                                                        <label><?php echo Text::_('SR_SEARCH_ROOM_CHILDREN') ?></label>
                                                        <select <?php echo $room_num > 0 ? 'disabled' : '' ?>
                                                                class="form-select"
                                                                name="room_opt[<?php echo $room_num ?>][children]">
                                                            <?php
                                                            for ($c = 0; $c <= $maxChildren; $c++) :
                                                                $selected = '';
                                                                if (isset($roomsOccupancyOptions[$room_num]['children'])
                                                                    &&
                                                                    $c == $roomsOccupancyOptions[$room_num]['children']
                                                                ) :
                                                                    $selected = 'selected';
                                                                endif;
                                                                ?>
                                                                <option <?php echo $selected ?>
                                                                        value="<?php echo $c ?>"><?php echo $c ?></option>
                                                            <?php
                                                            endfor
                                                            ?>
                                                        </select>
                                                    </div>
                                                <?php else : ?>
                                                    <div class="<?php echo SR_UI_GRID_COL_12 ?>">
                                                        <label><?php echo Text::_('SR_SEARCH_GUESTS') ?></label>
                                                        <select <?php echo $room_num > 0 ? 'disabled' : '' ?>
                                                                class="form-select"
                                                                name="room_opt[<?php echo $room_num ?>][guests]">
                                                            <?php
                                                            for ($a = 1; $a <= $maxAdults; $a++) :
                                                                $selected = '';
                                                                if (isset($roomsOccupancyOptions[$room_num]['guests'])
                                                                    &&
                                                                    ($a == $roomsOccupancyOptions[$room_num]['guests'])
                                                                ) :
                                                                    $selected = 'selected';
                                                                endif;
                                                                ?>
                                                                <option <?php echo $selected ?>
                                                                        value="<?php echo $a ?>"><?php echo $a ?></option>
                                                            <?php
                                                            endfor
                                                            ?>
                                                        </select>
                                                    </div>
                                                <?php endif ?>
                                            </div>
                                        </div>
                                    </div>
                                <?php endfor; ?>
                            </div>
                        </div>
                    </div>
                <?php endif ?>
                <div class="<?php echo $enableRoomQuantity == 0 ? SR_UI_GRID_COL_3 : SR_UI_GRID_COL_2 ?>">
                    <div class="d-grid">
                        <label>&nbsp;</label>
                        <button class="btn <?php echo SR_UI_BTN_DEFAULT ?> btn-block primary" type="submit"><i
                                    class="fa fa-search"></i> <?php echo Text::_('SR_SEARCH') ?></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <input type="hidden" name="id" value="<?php echo $this->item->id ?>" />
    <input type="hidden" name="option" value="com_solidres"/>
    <input type="hidden" name="view" value="reservationasset"/>
    <input type="hidden" name="Itemid" value="<?php echo $this->itemid ?>"/>
	<?php echo HTMLHelper::_('form.token'); ?>
</form>
