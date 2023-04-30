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
 * /templates/TEMPLATENAME/html/com_solidres/myreservation/edit.php
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
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;

$lang = Factory::getLanguage();
$lang->load('plg_solidrespayment_' . $this->form->getValue('payment_method_id'), JPATH_PLUGINS . '/solidrespayment/' . $this->form->getValue('payment_method_id'));

$isDiscountPreTax = $this->form->getValue('discount_pre_tax');

$baseCurrency           = new SRCurrency(0, $this->form->getValue('currency_id'));
$totalExtraPriceTaxIncl = $this->form->getValue('total_extra_price_tax_incl');
$totalExtraPriceTaxExcl = $this->form->getValue('total_extra_price_tax_excl');
$totalExtraTaxAmount    = $totalExtraPriceTaxIncl - $totalExtraPriceTaxExcl;
$totalPaid              = $this->form->getValue('total_paid');
$deposit                = $this->form->getValue('deposit_amount');

$subTotal = clone $baseCurrency;
$subTotal->setValue($this->form->getValue('total_price_tax_excl') - $this->form->getValue('total_single_supplement'));

$totalSingleSupplement = clone $baseCurrency;
$totalSingleSupplement->setValue($this->form->getValue('total_single_supplement'));

$totalDiscount = clone $baseCurrency;
$totalDiscount->setValue($this->form->getValue('total_discount'));

$tax = clone $baseCurrency;
$tax->setValue($this->form->getValue('tax_amount'));
$touristTax = clone $baseCurrency;
$touristTax->setValue($this->form->getValue('tourist_tax_amount'));
$totalFee = clone $baseCurrency;
$totalFee->setValue($this->form->getValue('total_fee'));
$totalExtraPriceTaxExclDisplay = clone $baseCurrency;
$totalExtraPriceTaxExclDisplay->setValue($totalExtraPriceTaxExcl);
$totalExtraTaxAmountDisplay = clone $baseCurrency;
$totalExtraTaxAmountDisplay->setValue($totalExtraTaxAmount);
$grandTotal = clone $baseCurrency;
if ($isDiscountPreTax) :
	$grandTotalAmount = $this->form->getValue('total_price_tax_excl') - $this->form->getValue('total_discount') + $this->form->getValue('tax_amount') + $totalExtraPriceTaxIncl;
else :
	$grandTotalAmount = $this->form->getValue('total_price_tax_excl') + $this->form->getValue('tax_amount') - $this->form->getValue('total_discount') + $totalExtraPriceTaxIncl;
endif;

$grandTotalAmount += $this->form->getValue('tourist_tax_amount', 0);
$grandTotalAmount += $this->form->getValue('total_fee', 0);
/*$grandTotalAmount += $this->form->getValue('payment_method_surcharge', 0);
$grandTotalAmount -= $this->form->getValue('payment_method_discount', 0);*/
$grandTotal->setValue($grandTotalAmount);

$depositAmount = clone $baseCurrency;
$depositAmount->setValue(isset($deposit) ? $deposit : 0);
$totalPaidAmount = clone $baseCurrency;
$totalPaidAmount->setValue(isset($totalPaid) ? $totalPaid : 0);

$couponCode       = $this->form->getValue('coupon_code');
$reservationId    = $this->form->getValue('id');
$reservationState = $this->form->getValue('state');
$paymentStatus    = $this->form->getValue('payment_status');
$bookingType      = $this->form->getValue('booking_type', 0);

$reservationStatusesList = SolidresHelper::getStatusesList(0);
$paymentStatusesList     = SolidresHelper::getStatusesList(1);
$reservationStatuses     = $reservationStatusesColors = $paymentStatuses = $paymentsColor = $source = array();

foreach ($reservationStatusesList as $status)
{
	$reservationStatuses[$status->value]       = $status->text;
	$reservationStatusesColors[$status->value] = $status->color_code;
}

foreach ($paymentStatusesList as $status)
{
	$paymentStatuses[$status->value] = $status->text;
	$paymentsColor[$status->value]   = $status->color_code;
}


$config                     = Factory::getConfig();
$timezone                   = new DateTimeZone($config->get('offset'));
$id                         = $this->form->getValue('id');
$paymentMethodTxnId         = $this->form->getValue('payment_method_txn_id');
$displayData['customer_id'] = $this->form->getValue('customer_id');

?>

<div id="solidres" class="<?php echo SR_UI ?>">

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<div class="<?php echo SR_UI_GRID_COL_12 ?>">
		<?php echo SRLayoutHelper::render('customer.navbar', $displayData); ?>
	</div>
</div>

<?php if ($this->canCancel) : ?>
    <div class="alert alert-info">
        <?php echo Text::sprintf('SR_CANCEL_UNTIL', $this->cancelUntil->format($this->dateFormat)) ?>
    </div>
<?php endif ?>

<?php if ($this->canAmend) : ?>
    <div class="alert alert-info">
        <?php echo Text::sprintf('SR_AMEND_UNTIL', $this->amendUntil->format($this->dateFormat)) ?>
    </div>
<?php endif ?>

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<div class="<?php echo SR_UI_GRID_COL_12 ?>">
		<?php echo JToolbar::getInstance()->render();; ?>
	</div>
</div>

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
<div id="sr_panel_right" class="sr_form_view <?php echo SR_UI_GRID_COL_12 ?>">
<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<div class="<?php echo SR_UI_GRID_COL_12 ?> reservation-detail-box">
		<h3><?php echo Text::_("SR_GENERAL_INFO")?></h3>
		<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
			<div class="<?php echo SR_UI_GRID_COL_6 ?>">

				<ul class="reservation-details list-unstyled">
					<li><label><?php echo Text::_("SR_CODE")?></label>  <span class="label <?php echo $badges[$reservationState] ?>"><?php echo $this->form->getValue('code') ?></span> </li>
					<li><label><?php echo Text::_("SR_RESERVATION_ASSET_NAME")?></label>  <?php echo $this->form->getValue('reservation_asset_name') ?></li>
					<li><label><?php echo Text::_("SR_CHECKIN")?></label>  <?php echo JDate::getInstance($this->form->getValue('checkin'), $timezone)->format($this->dateFormat, true); ?></li>
					<li><label><?php echo Text::_("SR_CHECKOUT")?></label> <?php echo JDate::getInstance($this->form->getValue('checkout'), $timezone)->format($this->dateFormat, true); ?></li>
					<li>
						<label><?php echo Text::_("SR_LENGTH_OF_STAY")?></label>
						<?php
						if ($bookingType == 0) :
							echo Text::plural('SR_NIGHTS', $this->lengthOfStay);
						else :
							echo Text::plural('SR_DAYS', $this->lengthOfStay + 1);
						endif;
						?>
					</li>
					<li><label><?php echo Text::_("SR_CREATED_DATE")?></label> <?php
	                                echo JDate::getInstance($this->form->getValue('created_date'), $timezone)
		                                ->format($this->dateFormat, true);
	                                ?></li>
					<li><label><?php echo Text::_("SR_PAYMENT_TYPE")?></label> <?php echo Text::_('SR_PAYMENT_METHOD_' . $this->form->getValue('payment_method_id'))  ?></li>
					<li>
						<label><?php echo Text::_("SR_STATUS")?></label>
						<strong style="color: <?php echo $reservationStatusesColors[$reservationState] ?>"><?php echo $reservationStatuses[$reservationState] ?></strong>
					</li>
					<li>
						<label><?php echo Text::_("SR_RESERVATION_PAYMENT_STATUS")?></label>
						<strong style="color: <?php echo $paymentsColor[$paymentStatus] ?>"><?php echo isset($paymentStatuses[$paymentStatus]) ? $paymentStatuses[$paymentStatus] : 'N/A' ?></strong>
					</li>
					<li>
						<label>
							<?php echo Text::_("SR_NOTES")?>
						</label>
						<?php echo $this->form->getValue('note') ?>
					</li>
				</ul>
			</div>

			<div class="<?php echo SR_UI_GRID_COL_6 ?>">
				<ul class="reservation-details list-unstyled">
					<li><label><?php echo Text::_('SR_RESERVATION_SUB_TOTAL') ?></label> <span><?php echo $subTotal->format() ?></span></li>
					<?php if ($this->form->getValue('total_single_supplement', 0) >0 ) : ?>
						<li><label><?php echo Text::_('SR_RESERVATION_TOTAL_SINGLE_SUPPLEMENT') ?></label> <span><?php echo $totalSingleSupplement->format() ?></span></li>
					<?php endif ?>
					<?php if (isset($isDiscountPreTax) && $isDiscountPreTax == 1 ) : ?>
						<li><label><?php echo Text::_('SR_RESERVATION_TOTAL_DISCOUNT') ?></label> <span><?php echo '-' . $totalDiscount->format() ?></span></li>
					<?php endif ?>
					<li><label><?php echo Text::_('SR_RESERVATION_TAX') ?></label> <span><?php echo $tax->format() ?></span></li>
					<?php if (isset($isDiscountPreTax) && $isDiscountPreTax == 0) : ?>
						<li><label><?php echo Text::_('SR_RESERVATION_TOTAL_DISCOUNT') ?></label> <span><?php echo '-' . $totalDiscount->format() ?></span></li>
					<?php endif ?>
					<li><label><?php echo Text::_('SR_RESERVATION_EXTRA_TAX_EXCL') ?></label> <span><?php echo $totalExtraPriceTaxExclDisplay->format() ?></span></li>
					<li><label><?php echo Text::_('SR_RESERVATION_EXTRA_TAX_AMOUNT') ?></label> <span><?php echo $totalExtraTaxAmountDisplay->format() ?></span></li>
					<li><label><?php echo JText::_('SR_TOURIST_TAX_AMOUNT') ?></label> <span><?php echo $touristTax->format() ?></span></li>
					<li><label><?php echo JText::_('SR_TOTAL_FEE_AMOUNT') ?></label>
						<span>
								<?php echo $totalFee->format() ?>
						</span>
					</li>
					<li><label><?php echo Text::_('SR_RESERVATION_GRAND_TOTAL') ?></label> <span><?php echo $grandTotal->format() ?></span></li>
					<li><label><?php echo Text::_('SR_RESERVATION_DEPOSIT_AMOUNT') ?></label> <span><?php echo $depositAmount->format() ?></span></li>
					<li>
						<label><?php echo Text::_('SR_RESERVATION_TOTAL_PAID') ?></label>
									<span>
										<?php echo $totalPaidAmount->format() ?>
									</span>
					</li>
					<li><label><?php echo Text::_('SR_RESERVATION_COUPON_CODE') ?></label> <span><?php echo !empty($couponCode) ? $couponCode : 'N/A' ?></span></li>
				</ul>
			</div>
		</div>
	</div>
</div>

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<div class="<?php echo SR_UI_GRID_COL_12 ?> reservation-detail-box">
		<h3><?php echo Text::_("SR_CUSTOMER_INFO") ?></h3>
		<?php

		$customFields      = $this->fields;
		$customFieldLength = count($customFields);
		$reservationId     = $this->id;

		if ($customFieldLength):
			SRCustomFieldHelper::setFieldDataValues(SRCustomFieldHelper::getValues(['context' => 'com_solidres.customer.' . $reservationId]));
			$partialNumber     = ceil($customFieldLength / 2);
			$rootUrl           = JUri::root(true);
			$token             = JSession::getFormToken();
			$renderValue       = function ($field) use ($rootUrl, $token, $reservationId) {
				$value = SRCustomFieldHelper::displayFieldValue($field->field_name);

				if ($field->type == 'file')
				{
					$file     = base64_encode($value);
					$fileName = basename($value);

					if (strpos($fileName, '_') !== false)
					{
						$parts    = explode('_', $fileName, 2);
						$fileName = $parts[1];
					}

					$value = '<a href="' . Route::_('index.php?option=com_solidres&task=customfield.downloadFile&file=' . $file . '&' . $token . '=1&reservationId=' . $reservationId, false) . '" style="max-width: 180px" target="_blank">' . $fileName . '</a>';
				}

				return $value;
			};

			?>
			<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
				<div class="<?php echo SR_UI_GRID_COL_6 ?>">
					<ul class="reservation-details list-unstyled">
						<?php for ($i = 0; $i <= $partialNumber; $i++): ?>
							<li>
								<label><?php echo Text::_($customFields[$i]->title); ?></label> <?php echo $renderValue($customFields[$i]); ?>
							</li>
						<?php endfor; ?>
					</ul>
				</div>
				<div class="<?php echo SR_UI_GRID_COL_6 ?>">
					<ul class="reservation-details list-unstyled">
						<?php for ($i = $partialNumber + 1; $i < $customFieldLength; $i++): ?>
							<li>
								<label><?php echo Text::_($customFields[$i]->title); ?></label> <?php echo $renderValue($customFields[$i]); ?>
							</li>
						<?php endfor; ?>
					</ul>
				</div>
			</div>
		<?php else: ?>
			<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
				<div class="<?php echo SR_UI_GRID_COL_6 ?>">
					<ul class="reservation-details list-unstyled">
						<li>
							<label><?php echo Text::_("SR_CUSTOMER_TITLE") ?></label> <?php echo $this->form->getValue('customer_title') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_FIRSTNAME") ?></label> <?php echo $this->form->getValue('customer_firstname') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_MIDDLENAME") ?></label> <?php echo $this->form->getValue('customer_middlename') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_LASTNAME") ?></label> <?php echo $this->form->getValue('customer_lastname') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_EMAIL") ?></label> <?php echo $this->form->getValue('customer_email') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_PHONE") ?></label> <?php echo $this->form->getValue('customer_phonenumber') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_MOBILEPHONE") ?></label> <?php echo $this->form->getValue('customer_mobilephone') ?>
						</li>
					</ul>
				</div>
				<div class="<?php echo SR_UI_GRID_COL_6 ?>">
					<ul class="reservation-details list-unstyled">
						<li>
							<label><?php echo Text::_("SR_COMPANY") ?></label> <?php echo $this->form->getValue('customer_company') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_CUSTOMER_ADDRESS1") ?></label> <?php echo $this->form->getValue('customer_address1') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_CUSTOMER_ADDRESS2") ?></label> <?php echo $this->form->getValue('customer_address2') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_CUSTOMER_CITY") ?></label> <?php echo $this->form->getValue('customer_city') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_CUSTOMER_ZIPCODE") ?></label> <?php echo $this->form->getValue('customer_zipcode') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_FIELD_COUNTRY_LABEL") ?></label> <?php echo $this->form->getValue('customer_country_name') ?>
						</li>
						<li>
							<label><?php echo Text::_("SR_VAT_NUMBER") ?></label> <?php echo $this->form->getValue('customer_vat_number') ?>
						</li>
					</ul>
				</div>
			</div>
		<?php endif; ?>
	</div>
</div>

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<div class="<?php echo SR_UI_GRID_COL_12 ?> reservation-detail-box booked_room_extra_info">

		<h3><?php echo Text::_("SR_ROOM_EXTRA_INFO")?></h3>

		<?php
		$reservedRoomDetails = $this->form->getValue('reserved_room_details');
		foreach($reservedRoomDetails as $room) :
			$totalRoomCost = 0;
			?>
			<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
				<div class="<?php echo SR_UI_GRID_COL_6 ?>">
					<?php
					echo '<h4>' . $room->room_type_name . ' (' . $room->room_label . ')</h4>' ?>
					<ul>
						<?php if (isset($room->guest_fullname) && !empty($room->guest_fullname)) : ?>
						<li><label><?php echo Text::_("SR_GUEST_FULLNAME") ?></label> <?php echo $room->guest_fullname ?></li>
						<?php endif ?>
						<li>
							<?php
							if (is_array($room->other_info)) :
								foreach ($room->other_info as $info) :
									if (substr($info->key, 0, 7) == 'smoking') :
										echo '<label>' . Text::_('SR_'.$info->key) . '</label> ' . ($info->value == '' ? Text::_('SR_NO_PREFERENCES') : ($info->value == 1 ? Text::_('SR_YES'): Text::_('SR_NO') )  ) ;
									endif;
								endforeach;
							endif
							?>
						</li>
						<li><label><?php echo Text::_("SR_ADULT_NUMBER") ?></label> <?php echo $room->adults_number ?></li>
						<li>
							<label class="toggle_child_ages"><?php echo Text::_("SR_CHILDREN_NUMBER") ?> <?php echo $room->children_number > 0 ? '<i class="icon-plus-2 fa fa-plus"></i>' : '' ?> </label> <?php echo $room->children_number ?>
							<?php
							if (is_array($room->other_info)) :
								echo '<ul class="unstyled" id="booked_room_child_ages" style="display: none">';
								foreach ($room->other_info as $info) :
									if (substr($info->key, 0, 5) == 'child') :
										echo '<li>' . Text::_('SR_'.$info->key) . ': ' . ': ' . Text::plural('SR_CHILD_AGE_SELECTION', $info->value) .'</li>';
									endif;
								endforeach;
								echo '</ul>';
							endif;
							?>
						</li>
					</ul>
				</div>
				<div class="<?php echo SR_UI_GRID_COL_6 ?>">
					<div class="booked_room_cost_wrapper">
						<?php
						$roomPriceCurrency = clone $baseCurrency;
						$roomPriceCurrency->setValue($room->room_price_tax_incl);
						$totalRoomCost += $room->room_price_tax_incl;
						?>
						<ul class="unstyled">
							<li>
								<label>
									<?php echo Text::_('SR_BOOKED_ROOM_COST') ?>
									<span class="icon-help"
									      title="<?php echo strip_tags($room->tariff_title) . ' - ' . strip_tags($room->tariff_description) ?>">
									</span>
								</label>
								<span class="booked_room_cost"><?php echo $roomPriceCurrency->format() ?></span>
							</li>
							<?php
							if ( isset( $room->extras ) ) :
								foreach ( $room->extras as $extra ) :
									?>
									<li>
										<label><?php echo $extra->extra_name . ' (x' . $extra->extra_quantity . ')' ?></label>
										<?php
										$extraPriceCurrency = clone $baseCurrency;
										$extraPriceCurrency->setValue( $extra->extra_price );
										$totalRoomCost += $extra->extra_price;
										echo '<span class="booked_room_extra_cost">' . $extraPriceCurrency->format( ) . '</span>';
										?>
									</li>
									<?php
								endforeach;
							endif; ?>
							<li>
								<label><strong><?php echo Text::_('SR_BOOKED_ROOM_COST_TOTAL') ?></strong></label>
								<span class="booked_room_cost">
									<strong>
									<?php
									$totalRoomCostCurrency = clone $baseCurrency;
									$totalRoomCostCurrency->setValue( $totalRoomCost );
									echo $totalRoomCostCurrency->format();
									?>
									</strong>
								</span>
							</li>
						</ul>
					</div>
				</div>
			</div>
		<?php endforeach ?>
	</div>
</div>

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<div class="<?php echo SR_UI_GRID_COL_12 ?> reservation-detail-box">
		<h3><?php echo Text::_('SR_RESERVATION_OTHER_INFO') ?></h3>
		<?php
		$extras = $this->form->getValue('extras');
		if (isset($extras)) :
			echo '
						<table class="table table-condensed">
							<thead>
								<th>'. Text::_("SR_RESERVATION_ROOM_EXTRA_NAME") .'</th>
								<th>'. Text::_("SR_RESERVATION_ROOM_EXTRA_QUANTITY") .'</th>
								<th>'. Text::_("SR_RESERVATION_ROOM_EXTRA_PRICE") .'</th>
							</thead>
							<tbody>
											';
			foreach($extras as $extra) :
				echo '<tr>';
				?>
				<td><?php echo $extra->extra_name ?></td>
				<td><?php echo $extra->extra_quantity ?></td>
				<td>
					<?php
					$extraPriceCurrencyPerBooking = clone $baseCurrency;
					$extraPriceCurrencyPerBooking->setValue($extra->extra_price);
					echo $extraPriceCurrencyPerBooking->format();
					?>
				</td>
				<?php
				echo '</tr>';
			endforeach;
			echo '
							</tbody>
						</table>';
		endif;
		?>
	</div>
</div>

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<div class="<?php echo SR_UI_GRID_COL_12 ?> reservation-detail-box">
		<h3><?php echo Text::_('SR_RESERVATION_NOTE_BACKEND') ?></h3>
		<div class="reservation-note-holder">
			<?php
			$notes = $this->form->getValue('notes');
			if (!empty($notes)) :
				foreach ($notes as $note) :
					?>
					<blockquote>
						<p>
							<?php echo $note->text ?>
						</p>
						<small>
							<?php echo $note->created_date ?> by <?php echo $note->username ?>
						</small>
					</blockquote>
				<?php
				endforeach;
			else :
			?>
			<div class="alert alert-info">
				<?php echo Text::_('SR_CUSTOMER_DASHBOARD_NO_NOTE') ?>
			</div>
			<?php
			endif;
			?>
		</div>
	</div>
</div>


</div>
</div>
<?php if ($this->showPoweredByLink) : ?>
<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<div class="<?php echo SR_UI_GRID_COL_12 ?> powered">
		<p>Powered by <a href="https://www.solidres.com" target="_blank">Solidres</a></p>
	</div>
</div>
<?php endif ?>
</div>
<script type="text/javascript">
	Solidres.jQuery(document).ready(function($) {
		$('#item-form').validate();
		$('#solidrestoolbar-calendar button').click(function(e) {
			e.preventDefault();
			var data = {};
			data.tariff_id = 888;
			data.roomtype_id = 999999999;
			data.id = '<?php echo $this->form->getValue('reservation_asset_id') ?>';
			data.Itemid = '<?php echo $this->itemid ?>';
			data.checkin = '<?php echo $this->form->getValue('checkin') ?>';
			data.checkout = '<?php echo $this->form->getValue('checkout') ?>';
			data.reservation_id = '<?php echo $this->form->getValue('id') ?>';
			data.return = '<?php echo $this->returnPage; ?>';

			$.ajax({
				type: 'GET',
				cache: false,
				url: 'index.php?option=com_solidres&task=reservationasset.getCheckInOutFormChangeDates',
				data: data,
				success: function(response) {
					$('#changedatesform').empty().html(response);
				}
			});
		});
	});

	Joomla.submitbutton = function(task) {
		if (task == 'myreservation.cancel') {
			Joomla.submitform(task, document.getElementById('item-form'));
		}
	}
</script>
<form action="<?php Route::_('index.php?option=com_solidres&view=customer'); ?>" method="post" name="adminForm" id="item-form" class="">
	<input type="hidden" name="task" value="" />
	<input type="hidden" name="return" value="<?php echo $this->returnPage; ?>" />
	<input type="hidden" name="id" value="<?php echo $this->form->getValue('id') ?>" />
	<?php echo HTMLHelper::_('form.token'); ?>
</form>
