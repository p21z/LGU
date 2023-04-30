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

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

$lang = JFactory::getLanguage();
$lang->load('plg_solidrespayment_' . $this->form->getValue('payment_method_id'), JPATH_PLUGINS . '/solidrespayment/' . $this->form->getValue('payment_method_id'));

$checkin  = $this->form->getValue('checkin');
$checkout = $this->form->getValue('checkout');
if ($this->form->getValue('id') > 0)
{
	$isDiscountPreTax = $this->form->getValue('discount_pre_tax');

	$totalExtraPriceTaxIncl = $this->form->getValue('total_extra_price_tax_incl');
	$totalExtraPriceTaxExcl = $this->form->getValue('total_extra_price_tax_excl');
	$totalExtraTaxAmount    = $totalExtraPriceTaxIncl - $totalExtraPriceTaxExcl;
	$totalPaid              = $this->form->getValue('total_paid');
	$deposit                = $this->form->getValue('deposit_amount');

	$subTotal = clone $this->baseCurrency;
	$subTotal->setValue($this->form->getValue('total_price_tax_excl'));

	$totalDiscount = clone $this->baseCurrency;
	$totalDiscount->setValue($this->form->getValue('total_discount'));

	$tax = clone $this->baseCurrency;
	$tax->setValue($this->form->getValue('tax_amount'));
	$totalExtraPriceTaxExclDisplay = clone $this->baseCurrency;
	$totalExtraPriceTaxExclDisplay->setValue($totalExtraPriceTaxExcl);
	$totalExtraTaxAmountDisplay = clone $this->baseCurrency;
	$totalExtraTaxAmountDisplay->setValue($totalExtraTaxAmount);
	$grandTotal = clone $this->baseCurrency;

	if ($isDiscountPreTax) :
		$grandTotal->setValue($this->form->getValue('total_price_tax_excl') - $this->form->getValue('total_discount') + $this->form->getValue('tax_amount') + $totalExtraPriceTaxIncl);
	else :
		$grandTotal->setValue($this->form->getValue('total_price_tax_excl') + $this->form->getValue('tax_amount') - $this->form->getValue('total_discount') + $totalExtraPriceTaxIncl);
	endif;

	$depositAmount = clone $this->baseCurrency;
	$depositAmount->setValue(isset($deposit) ? $deposit : 0);
	$totalPaidAmount = clone $this->baseCurrency;
	$totalPaidAmount->setValue(isset($totalPaid) ? $totalPaid : 0);

	$couponCode       = $this->form->getValue('coupon_code');
	$this->reservationId    = $this->form->getValue('id');
	$reservationState = $this->form->getValue('state');
	$paymentStatus    = $this->form->getValue('payment_status');
}

$script =
	' Solidres.jQuery(function($) {
		var checkin, checkout, reservation_id, assetid, requesturl, available_rooms_holder, state, payment_status;
		available_rooms_holder = $(".room");
		var doValidate = function() {
			checkin = $("#checkin").val();
			checkout = $("#checkout").val();
			state = $("#state").val();
			payment_status = $("#payment_status").val();
			reservation_id = ' . ($this->form->getValue('id', null, 0)) . ';
			assetid = $("#reservation_asset_id").val();
			customer_id = 0;
			if ($("#customer_id").length) {
				customer_id = $("#customer_id").val();
			}			
			requesturl = Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservation" + (Solidres.context == "frontend" ? "" : "base") + ".getAvailableRooms&checkin=" + checkin + "&checkout="+ checkout + "&id=" + reservation_id + "&assetid=" + assetid + "&state=" + state + "&payment_status=" + payment_status + "&customer_id=" + customer_id;
			if (checkin.length == 0 || checkout.length == 0 || assetid.length == 0) {
				alert("Please make sure that you selected property, start date and end date.");
				return false;
			} else {
				return true;
			}
		};

		$("#reservation_load_available_rooms").click(function() {
			var isFormValid = doValidate();
			if (isFormValid) {
			$(".reservation-single-step-holder").removeClass("nodisplay").addClass("nodisplay");
				available_rooms_holder.addClass("nodisplay");
				$(".processing").removeClass("nodisplay");
				$.ajax({
					url : requesturl,
					success : function(html) {
						available_rooms_holder.empty().html(html);
						available_rooms_holder.find("input.reservation_room_select").each(function() {
							var self = $(this);
							/*if (self.is(":checked")) {
								self.parents(".room_selection_wrapper").find("select.tariff_selection").trigger("change");
							}*/
						});
						$(".processing").addClass("nodisplay");
						available_rooms_holder.removeClass("nodisplay");
						isAtLeastOneRoomSelected();
						$(".extras_row_roomtypeform input:checkbox").trigger("change");
					}
				});
			}
		});
		
		$(document).on("click", "#sr-reservation-form-room button[type=\'submit\']", function (e) {		    
		    var form = $("#sr-reservation-form-room");
		    var roomFields = form.find(".reservation_room_select:checked:not([disabled])").parents(".room_selection_wrapper").find("[name^=\'jform[roomFields]\']");
		    
		    if (roomFields.length) {
		        var validator = form.validate();		        
		        roomFields.each(function(){		        
		            validator.element(this);
		        });
		        
		        if (!form.valid()) {
		            e.preventDefault();
		            e.stopPropagation();
		            $("html, body").animate({
		                scrollTop: roomFields.filter(".error").parents(".room_selection_wrapper").offset().top
		            }, 400);
		            
		            return false;
		        }
		        
		        validator.destroy();		        
		    }
		});
		
	});';
JFactory::getDocument()->addScriptDeclaration($script);

$config               = JFactory::getConfig();
$minDaysBookInAdvance = $this->solidresConfig->get('min_days_book_in_advance', 0);
$maxDaysBookInAdvance = $this->solidresConfig->get('max_days_book_in_advance', 0);
$minLengthOfStay      = $this->solidresConfig->get('min_length_of_stay', 1);
$datePickerMonthNum   = $this->solidresConfig->get('datepicker_month_number', 3);
$weekStartDay         = $this->solidresConfig->get('week_start_day', 1);
$dateFormat           = $this->solidresConfig->get('date_format', 'd-m-Y');

$tzoffset    = $config->get('offset');
$timezone    = new DateTimeZone($tzoffset);
$dateCheckIn = JDate::getInstance();
if (!isset($checkin)) :
	$dateCheckIn->add(new DateInterval('P' . ($minDaysBookInAdvance) . 'D'))->setTimezone($timezone);
endif;
$dateCheckOut = JDate::getInstance();
if (!isset($checkout)) :
	$dateCheckOut->add(new DateInterval('P' . ($minDaysBookInAdvance + $minLengthOfStay) . 'D'))->setTimezone($timezone);
endif;

$jsDateFormat = SRUtilities::convertDateFormatPattern($dateFormat);
//$roomsOccupancyOptionsCount = count($roomsOccupancyOptions);
/*$maxRooms = $params->get('max_room_number', 10);
$maxAdults = $params->get('max_adult_number', 10);
$maxChildren = $params->get('max_child_number', 10);*/

$defaultCheckinDate  = '';
$defaultCheckoutDate = '';
if (isset($checkin))
{
	$checkinModule  = JDate::getInstance($checkin, $timezone);
	$checkoutModule = JDate::getInstance($checkout, $timezone);
	// These variables are used to set the defaultDate of datepicker
	$defaultCheckinDate  = $checkinModule->format('Y-m-d', true);
	$defaultCheckoutDate = $checkoutModule->format('Y-m-d', true);
}

if (!empty($defaultCheckinDate)) :
	$defaultCheckinDateArray    = explode('-', $defaultCheckinDate);
	$defaultCheckinDateArray[1] -= 1; // month in javascript is less than 1 in compare with month in PHP
endif;

if (!empty($defaultCheckoutDate)) :
	$defaultCheckoutDateArray    = explode('-', $defaultCheckoutDate);
	$defaultCheckoutDateArray[1] -= 1; // month in javascript is less than 1 in compare with month in PHP
endif;

HTMLHelper::_('script', 'com_solidres/assets/datePicker/localization/jquery.ui.datepicker-' . JFactory::getLanguage()->getTag() . '.js', array('version' => SRVersion::getHashVersion(), 'relative' => true));

JFactory::getDocument()->addScriptDeclaration('
	Solidres.jQuery(function($) {
		var minLengthOfStay = ' . $minLengthOfStay . ';
		var checkout = $("#item-form .checkout_datepicker_inline_module").datepicker({
			minDate : "+' . ($minDaysBookInAdvance + $minLengthOfStay) . '",
			numberOfMonths : ' . $datePickerMonthNum . ',
			showButtonPanel : true,
			dateFormat : "' . $jsDateFormat . '",
			firstDay: ' . $weekStartDay . ',
			' . (isset($checkout) ? 'defaultDate: new Date(' . implode(',', $defaultCheckoutDateArray) . '),' : '') . '
			onSelect: function() {
				$("#item-form input#checkout").val($.datepicker.formatDate("yy-mm-dd", $(this).datepicker("getDate")));
				$("#item-form .checkout_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", $(this).datepicker("getDate"))).attr("readonly", "readonly");
				$("#item-form .checkout_datepicker_inline_module").slideToggle();
				$("#item-form .checkin_module").removeClass("disabledCalendar");
			}
		});
		var checkin = $("#item-form .checkin_datepicker_inline_module").datepicker({
			minDate : "+' . $minDaysBookInAdvance . 'd",
			' . ($maxDaysBookInAdvance > 0 ? 'maxDate: "+' . ($maxDaysBookInAdvance) . '",' : '') . '
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

				$("#item-form input#checkin").val($.datepicker.formatDate("yy-mm-dd", currentSelectedDate));
				$("#item-form input#checkout").val($.datepicker.formatDate("yy-mm-dd", checkoutMinDate));

				$("#item-form .checkin_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", currentSelectedDate)).attr("readonly", "readonly");
				$("#item-form .checkout_module").removeAttr("readonly").val($.datepicker.formatDate("' . $jsDateFormat . '", checkoutMinDate)).attr("readonly", "readonly");
				$("#item-form .checkin_datepicker_inline_module").slideToggle();
				$("#item-form .checkout_module").removeClass("disabledCalendar");
			},
			firstDay: ' . $weekStartDay . '
		});
		$(".ui-datepicker").addClass("notranslate");
		$("#item-form .checkin_module").click(function() {
			if (!$(this).hasClass("disabledCalendar")) {
				$(".checkin_datepicker_inline_module").slideToggle("slow", function() {
					if ($(this).is(":hidden")) {
						$("#item-form .checkout_module").removeClass("disabledCalendar");
					} else {
						$("#item-form .checkout_module").addClass("disabledCalendar");
					}
				});
			}
		});

		$("#item-form .checkout_module").click(function() {
			if (!$(this).hasClass("disabledCalendar")) {
				$(".checkout_datepicker_inline_module").slideToggle("slow", function() {
					if ($(this).is(":hidden")) {
						$("#item-form .checkin_module").removeClass("disabledCalendar");
					} else {
						$("#item-form .checkin_module").addClass("disabledCalendar");
					}
				});
			}
		});

		$(".room_quantity").change(function() {
			var curQuantity = $(this).val();
			$(".room_num_row").each(function( index ) {
				var index2 = index + 1;
				if (index2 <= curQuantity) {
					$("#room_num_row_" + index2).show();
					$("#room_num_row_" + index2 + " select").removeAttr("disabled");
				} else {
					$("#room_num_row_" + index2).hide();
					$("#room_num_row_" + index2 + " select").attr("disabled", "disabled");
				}
			});
		});

		if ($(".room_quantity").val() > 0) {
			$(".room_quantity").trigger("change");
		}
		
		$( "#customer_autocomplete" ).autocomplete({
			source: "index.php?option=com_solidres&task=customers.find&format=json",
			minLength: 2,
				select: function( event, ui ) {
				var a = $("#customer_id");
	            if( a.length ) {
	                a.val(ui.item.id);
	            } else {
	                var b = $("<input />", {
	                    "type"  : "hidden",
	                    "value" : ui.item.id,
	                    "name"  : "jform[customer_id]",
	                    "id"    : "customer_id"
	                });
	                b.insertAfter( $( this ) );
	            }
			}
		});
    });
');

JFactory::getDocument()->addScriptDeclaration('
	Joomla.submitbutton = function(task)
	{
		if (task == "reservationbase.cancel")
		{
			Joomla.submitform(task, document.getElementById("item-form"));
		}
	}
');

?>

<div id="solidres" class="<?php echo SR_UI ?>">
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<?php echo SolidresHelperSideNavigation::getSideNavigation($this->getName()); ?>
        <div id="sr_panel_right" class="sr_form_view <?php echo SR_UI_GRID_COL_10 ?>">
            <form enctype="multipart/form-data"
                  action="<?php echo JUri::base() ?>index.php?option=com_solidres&view=reservations"
                  method="post" name="adminForm" id="item-form" class="form-validate form-horizontal">
                <h1><?php echo Text::_("SR_GENERAL_INFO") ?></h1>
                <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                    <div class="<?php echo SR_UI_GRID_COL_6 ?>">
                        <div class="form-group">
		                    <?php
		                    echo SRLayoutHelper::render('field.datepicker', [
			                    'fieldLabel'            => 'SR_SEARCH_CHECKIN_DATE',
			                    'fieldName'             => 'jform[checkin]',
			                    'fieldClass'            => 'checkin_module',
			                    'fieldId'               => 'checkin',
			                    'datePickerInlineClass' => 'checkin_datepicker_inline_module',
			                    'dateUserFormat'        => isset($checkin) ?
				                    $checkinModule->format($dateFormat, true) :
				                    $dateCheckIn->format($dateFormat, true),
			                    'dateDefaultFormat'     => isset($checkin) ?
				                    $checkinModule->format('Y-m-d', true) :
				                    $dateCheckIn->format('Y-m-d', true)
		                    ]);
		                    ?>
                        </div>
                        <div class="form-group">
		                    <?php
		                    echo SRLayoutHelper::render('field.datepicker', [
			                    'fieldLabel'            => 'SR_SEARCH_CHECKOUT_DATE',
			                    'fieldName'             => 'jform[checkout]',
			                    'fieldClass'            => 'checkout_module',
			                    'fieldId'               => 'checkout',
			                    'datePickerInlineClass' => 'checkout_datepicker_inline_module',
			                    'dateUserFormat'        => isset($checkout) ?
				                    $checkoutModule->format($dateFormat, true) :
				                    $dateCheckOut->format($dateFormat, true),
			                    'dateDefaultFormat'     => isset($checkout) ?
				                    $checkoutModule->format('Y-m-d', true) :
				                    $dateCheckOut->format('Y-m-d', true)
		                    ]);
		                    ?>
                        </div>
                        <div class="form-group">
                            <label><?php echo Text::_("SR_ASSET_NAME") ?></label>
                            <select required id="reservation_asset_id"
                                    name="jform[reservation_asset_id]"
                                    class="form-select">
			                    <?php
			                    if ($this->totalPublishedAssets == 1 && $this->defaultAssetId > 0) :
				                    echo HTMLHelper::_('select.options', SolidresHelper::getReservationAssetOptions(), 'value', 'text', $this->defaultAssetId);
			                    else :
				                    echo HTMLHelper::_('select.options', SolidresHelper::getReservationAssetOptions(), 'value', 'text', $this->form->getValue('reservation_asset_id'));
			                    endif;
			                    ?>
                            </select>
                        </div>

                    </div>
                    <div class="<?php echo SR_UI_GRID_COL_6 ?>">
                        <div class="form-group">
                            <label><?php echo Text::_("SR_STATUS") ?></label>
                            <select id="state" name="jform[state]"
                                    class="form-select">
			                    <?php echo HTMLHelper::_('select.options', SRUtilities::getReservationStatusList(), 'value', 'text', $this->form->getValue('state'), true); ?>
                            </select>
                        </div>
                        <div class="form-group">
                            <label><?php echo Text::_("SR_RESERVATION_PAYMENT_STATUS") ?></label>
                            <select id="payment_status" name="jform[payment_status]"
                                    class="form-select">
			                    <?php echo HTMLHelper::_('select.options', SRUtilities::getReservationPaymentStatusList(), 'value', 'text', $this->form->getValue('payment_status'), true); ?>
                            </select>
                        </div>
                        <div class="form-group">
		                    <?php if (SRPlugin::isEnabled('user')) : ?>
                                <label><?php echo Text::_("SR_RESERVATION_CUSTOMER") ?></label>
                                <input type="text" id="customer_autocomplete"
                                       class="form-control"
                                       value="<?php echo $this->customerIdentification ?>"/>
                                <input type="hidden" id="customer_id" name="jform[customer_id]"
                                       value="<?php echo $this->customer_id ?>">
		                    <?php endif ?>
                        </div>
                    </div>
                </div>
                <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
                    <div class="<?php echo SR_UI_GRID_COL_12 ?>">
                        <div class="d-grid gap-2">
                            <button type="button"
                                    class="btn btn-info"
                                    id="reservation_load_available_rooms"><?php echo Text::_('SR_RESERVATION_RELOAD_AVAILABLE_ROOMS') ?></button>
                        </div>
                    </div>
                </div>

                <input type="hidden" name="task" value=""/>
				<?php echo HTMLHelper::_('form.token'); ?>
            </form>

            <a id="book-form"></a>

            <h1><?php echo Text::_('SR_RESERVATION_PROGRESS_ROOM_RATE_INFO') ?></h1>
            <div class="processing nodisplay"></div>
            <div class="reservation-single-step-holder backend room"></div>

            <h1><?php echo Text::_('SR_RESERVATION_PROGRESS_GUEST_INFO') ?></h1>
            <div class="reservation-single-step-holder guestinfo backend nodisplay"></div>

            <h1><?php echo Text::_('SR_RESERVATION_CONFIRMATION') ?></h1>
            <div class="reservation-single-step-holder backend confirmation nodisplay"></div>

        </div>
    </div>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_12 ?> powered">
            <p>Powered by <a href="https://www.solidres.com" target="_blank">Solidres</a></p>
        </div>
    </div>
</div>
