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
 * /templates/TEMPLATENAME/html/com_solidres/tracking/default.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Toolbar\Toolbar;
JLoader::register('SolidresHelper', JPATH_ADMINISTRATOR . '/components/com_solidres/helpers/helper.php');

$trackingCode  = $this->state->get('trackingCode');
$trackingEmail = $this->state->get('trackingEmail');
$showMessage   = $this->state->get('showMessage');
$config        = ComponentHelper::getParams('com_solidres');

?>
<div id="solidres">
    <div class="<?php echo SR_UI; ?> sr-exp-tracking-wrap">
		<?php if ($this->params->get('show_tracking_form', 1)): ?>
            <div class="well">
				<?php echo SRLayoutHelper::render('tracking.tracking', array(
					'trackingCode'  => $trackingCode,
					'trackingEmail' => $trackingEmail,
					'menuId'        => $this->menuId,
				)); ?>
            </div>
		<?php endif; ?>
        <div class="sr-exp-tracking-result">
			<?php if ($trackingCode && $showMessage): ?>
                <div class="alert alert-<?php echo $this->reservation ? 'success' : 'warning'; ?>">
                    <a class="close" data-dismiss="alert">×</a>
                    <div class="alert-message">
						<?php if ($this->reservation): ?>
                            <i class="fa fa-check-circle"></i>
							<?php echo JText::sprintf('SR_TRACKING_RESERVATION_FOUND_FORMAT', $trackingCode); ?>
						<?php else: ?>
                            <i class="fa fa-exclamation-triangle"></i>
							<?php echo JText::sprintf('SR_TRACKING_RESERVATION_NOT_FOUND_MSG', $trackingCode); ?>
						<?php endif; ?>
                    </div>
                </div>
			<?php endif; ?>
			<?php if ($this->reservation):
				$isDiscountPreTax = $this->reservation->discount_pre_tax;
				$baseCurrency = new SRCurrency(0, $this->reservation->currency_id);
				$totalExtraPriceTaxIncl = $this->reservation->total_extra_price_tax_incl;
				$totalExtraPriceTaxExcl = $this->reservation->total_extra_price_tax_excl;
				$totalExtraTaxAmount = $totalExtraPriceTaxIncl - $totalExtraPriceTaxExcl;
				$totalPaid = $this->reservation->total_paid;
				$deposit = $this->reservation->deposit_amount;
				$subTotal = clone $baseCurrency;
				$subTotal->setValue($this->reservation->total_price_tax_excl - $this->reservation->total_single_supplement);
				$totalSingleSupplement = clone $baseCurrency;
				$totalSingleSupplement->setValue($this->reservation->total_single_supplement);
				$totalDiscount = clone $baseCurrency;
				$totalDiscount->setValue($this->reservation->total_discount);
				$tax = clone $baseCurrency;
				$tax->setValue($this->reservation->tax_amount);
				$totalExtraPriceTaxExclDisplay = clone $baseCurrency;
				$totalExtraPriceTaxExclDisplay->setValue($totalExtraPriceTaxExcl);
				$totalExtraTaxAmountDisplay = clone $baseCurrency;
				$totalExtraTaxAmountDisplay->setValue($totalExtraTaxAmount);
				$grandTotal = clone $baseCurrency;

				if ($isDiscountPreTax)
				{
					$grandTotal->setValue($this->reservation->total_price_tax_excl - $this->reservation->total_discount + $this->reservation->tax_amount + $totalExtraPriceTaxIncl);
				}
				else
				{
					$grandTotal->setValue($this->reservation->total_price_tax_excl + $this->reservation->tax_amount - $this->reservation->total_discount + $totalExtraPriceTaxIncl);
				}

				$depositAmount = clone $baseCurrency;
				$depositAmount->setValue(isset($deposit) ? $deposit : 0);
				$totalPaidAmount = clone $baseCurrency;
				$totalPaidAmount->setValue(isset($totalPaid) ? $totalPaid : 0);

				$couponCode       = $this->reservation->coupon_code;
				$reservationState = $this->reservation->state;
				$paymentStatus    = $this->reservation->payment_status;
				$bookingType      = $this->reservation->booking_type;
				$statuses         = [];
				$statusesColor    = [];
				$paymentStatuses  = [];
				$paymentsColor    = [];

                foreach (SolidresHelper::getStatusesList(0, 0) as $state)
                {
                    $statuses[$state->value]      = $state->text;
                    $statusesColor[$state->value] = $state->color_code;
                }

				foreach(SolidresHelper::getStatusesList(1, 0) as $state)
				{
					$paymentStatuses[$state->value] = $state->text;
					$paymentsColor[$state->value]   = $state->color_code;
				}

				$dateFormat       = $config->get('date_format', 'd-m-Y');
				$solidresRoomType = SRFactory::get('solidres.roomtype.roomtype');
				$lengthOfStay     = (int) $solidresRoomType->calculateDateDiff($this->reservation->checkin, $this->reservation->checkout);

				if ($this->hasToolbar)
                {
                    echo Toolbar::getInstance()->render();
                }

				?>
                <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                    <div class="<?php echo SR_UI_GRID_COL_12 ?> reservation-detail-box">
                        <h3><?php echo JText::_('SR_GENERAL_INFO') ?></h3>
                        <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                            <div class="<?php echo SR_UI_GRID_COL_6 ?>">
                                <ul class="reservation-details">
                                    <li>
                                        <label>
											<?php echo JText::_('SR_CODE'); ?>
                                        </label>
                                        <strong style="color: <?php echo $statusesColor[$reservationState] ?>; font-weight: bold">
											<?php echo $this->reservation->code; ?>
                                        </strong>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_ASSET_NAME'); ?>
                                        </label>
										<?php echo $this->reservation->reservation_asset_name; ?>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_CHECKIN'); ?>
                                        </label>
										<?php echo JHtml::_('date', $this->reservation->checkin, $dateFormat, null); ?>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_CHECKOUT'); ?>
                                        </label>
										<?php echo JHtml::_('date', $this->reservation->checkout, $dateFormat, null); ?>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_LENGTH_OF_STAY'); ?>
                                        </label>
										<?php if ($bookingType == 0) : ?>
											<?php echo JText::plural('SR_NIGHTS', $lengthOfStay); ?>
										<?php else: ?>
											<?php echo JText::plural('SR_DAYS', $lengthOfStay + 1); ?>
										<?php endif; ?>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_CREATED_DATE'); ?>
                                        </label>
										<?php echo JHtml::_('date', $this->reservation->created_date, $dateFormat); ?>

                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_PAYMENT_TYPE'); ?>
                                        </label>
										<?php echo JText::_('SR_PAYMENT_METHOD_' . $this->reservation->payment_method_id); ?>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_STATUS'); ?>
                                        </label>
										<?php echo $statuses[$reservationState] ?>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_PAYMENT_STATUS'); ?>
                                        </label>

                                        <?php if (isset($paymentStatuses[$paymentStatus])): ?>
                                        <div style="display: inline-block; color: <?php echo $paymentsColor[$paymentStatus]; ?>">
								            <strong><?php echo $paymentStatuses[$paymentStatus]; ?></strong>
                                        </div>
                                        <?php else: ?>
                                            <?php echo 'N/A'; ?>
                                        <?php endif; ?>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_NOTES'); ?>
                                        </label>
										<?php echo $this->reservation->note; ?>
                                    </li>
                                </ul>
                            </div>

                            <div class="<?php echo SR_UI_GRID_COL_6 ?>">
                                <ul class="reservation-details list-unstyled">
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_SUB_TOTAL'); ?>
                                        </label>
                                        <span>
                                            <?php echo $subTotal->format(); ?>
                                        </span>
                                    </li>
									<?php if ($this->reservation->total_single_supplement > 0) : ?>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_RESERVATION_TOTAL_SINGLE_SUPPLEMENT'); ?>
                                            </label>
                                            <span>
                                                <?php echo $totalSingleSupplement->format(); ?>
                                            </span>
                                        </li>
									<?php endif; ?>
									<?php if (isset($isDiscountPreTax) && $isDiscountPreTax == 1) : ?>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_RESERVATION_TOTAL_DISCOUNT'); ?>
                                            </label>
                                            <span>
                                                <?php echo '-' . $totalDiscount->format() ?></span>
                                        </li>
									<?php endif; ?>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_TAX'); ?>
                                        </label>
                                        <span>
                                            <?php echo $tax->format(); ?>
                                        </span>
                                    </li>
									<?php if (isset($isDiscountPreTax) && $isDiscountPreTax == 0) : ?>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_RESERVATION_TOTAL_DISCOUNT'); ?>
                                            </label>
                                            <span>
                                                <?php echo '-' . $totalDiscount->format(); ?>
                                            </span>
                                        </li>
									<?php endif ?>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_EXTRA_TAX_EXCL'); ?>
                                        </label>
                                        <span>
                                            <?php echo $totalExtraPriceTaxExclDisplay->format(); ?>
                                        </span>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_EXTRA_TAX_AMOUNT'); ?>
                                        </label>
                                        <span>
                                            <?php echo $totalExtraTaxAmountDisplay->format(); ?>
                                        </span>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_GRAND_TOTAL'); ?>
                                        </label>
                                        <span>
                                            <?php echo $grandTotal->format(); ?>
                                        </span>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_DEPOSIT_AMOUNT'); ?>
                                        </label>
                                        <span>
                                            <?php echo $depositAmount->format(); ?>
                                        </span>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_TOTAL_PAID'); ?>
                                        </label>
                                        <span>
										<?php echo $totalPaidAmount->format(); ?>
									</span>
                                    </li>
                                    <li>
                                        <label>
											<?php echo JText::_('SR_RESERVATION_COUPON_CODE'); ?>
                                        </label>
                                        <span>
                                            <?php echo !empty($couponCode) ? $couponCode : 'N/A'; ?>
                                        </span>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                    <div class="<?php echo SR_UI_GRID_COL_12 ?> reservation-detail-box">
                        <h3>
							<?php echo JText::_('SR_CUSTOMER_INFO'); ?>
                        </h3>
						<?php
						$context           = 'com_solidres.customer.' . (int) $this->reservation->customer_id;
						if (SRPlugin::isEnabled('customfield')
							&& ($customFields = SRCustomFieldHelper::getValues(array('context' => $context)))):
							$customFieldLength = count($customFields);
							$partialNumber = ceil($customFieldLength / 2);
							?>
                            <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
                                <div class="<?php echo SR_UI_GRID_COL_6; ?>">
                                    <ul class="reservation-details list-unstyled">
										<?php for ($i = 0; $i <= $partialNumber; $i++): ?>
                                            <li>
                                                <label>
													<?php echo JText::_($customFields[$i]->title); ?>
                                                </label>
												<?php echo trim($customFields[$i]->value); ?>
                                            </li>
										<?php endfor; ?>
                                    </ul>
                                </div>
                                <div class="<?php echo SR_UI_GRID_COL_6 ?>">
                                    <ul class="reservation-details list-unstyled">
										<?php for ($i = $partialNumber + 1; $i < $customFieldLength; $i++): ?>
                                            <li>
                                                <label>
													<?php echo JText::_($customFields[$i]->title); ?>
                                                </label>
												<?php echo trim($customFields[$i]->value); ?>
                                            </li>
										<?php endfor; ?>
                                    </ul>
                                </div>
                            </div>
						<?php else: ?>
                            <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
                                <div class="<?php echo SR_UI_GRID_COL_6; ?>">
                                    <ul class="reservation-details list-unstyled">
                                        <li>
                                            <label>
												<?php echo JText::_('SR_CUSTOMER_TITLE'); ?>
                                            </label>
											<?php echo $this->reservation->customer_title; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_FIRSTNAME'); ?>
                                            </label>
											<?php echo $this->reservation->customer_firstname; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_MIDDLENAME') ?>
                                            </label>
											<?php echo $this->reservation->customer_middlename; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_LASTNAME'); ?>
                                            </label>
											<?php echo $this->reservation->customer_lastname; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_EMAIL'); ?>
                                            </label>
											<?php echo $this->reservation->customer_email; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_PHONE'); ?>
                                            </label>
											<?php echo $this->reservation->customer_phonenumber; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_MOBILEPHONE'); ?>
                                            </label>
											<?php echo $this->reservation->customer_mobilephone; ?>
                                        </li>
                                    </ul>
                                </div>
                                <div class="<?php echo SR_UI_GRID_COL_6; ?>">
                                    <ul class="reservation-details list-unstyled">
                                        <li>
                                            <label>
												<?php echo JText::_('SR_COMPANY'); ?>
                                            </label>
											<?php echo $this->reservation->customer_company; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_CUSTOMER_ADDRESS1'); ?>
                                            </label>
											<?php echo $this->reservation->customer_address1; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_CUSTOMER_ADDRESS2'); ?>
                                            </label>
											<?php echo $this->reservation->customer_address2; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_CUSTOMER_CITY'); ?>
                                            </label>
											<?php echo $this->reservation->customer_city; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_CUSTOMER_ZIPCODE'); ?>
                                            </label>
											<?php echo $this->reservation->customer_zipcode; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_FIELD_COUNTRY_LABEL'); ?>
                                            </label>
											<?php echo $this->reservation->customer_country_name; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_VAT_NUMBER'); ?>
                                            </label>
											<?php echo $this->reservation->customer_vat_number; ?>
                                        </li>
                                    </ul>
                                </div>
                            </div>
						<?php endif; ?>
                    </div>
                </div>

                <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
                    <div class="<?php echo SR_UI_GRID_COL_12; ?> reservation-detail-box booked_room_extra_info">

                        <h3>
							<?php echo JText::_('SR_ROOM_EXTRA_INFO'); ?>
                        </h3>
						<?php foreach ($this->reservation->reserved_room_details as $room) :
							$totalRoomCost = 0;
							?>
                            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                                <div class="<?php echo SR_UI_GRID_COL_6 ?>">
									<?php
									echo '<h4>' . $room->room_type_name . ' (' . $room->room_label . ')</h4>' ?>
                                    <ul>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_GUEST_FULLNAME'); ?>
                                            </label>
											<?php echo $room->guest_fullname; ?>
                                        </li>
                                        <li>
											<?php if (is_array($room->other_info)) : ?>
												<?php foreach ($room->other_info as $info) : ?>
													<?php if (substr($info->key, 0, 7) == 'smoking'): ?>
                                                        <label>
															<?php echo JText::_('SR_' . $info->key) . ($info->value == '' ? JText::_('SR_NO_PREFERENCES') : ($info->value == 1 ? JText::_('SR_YES') : JText::_('SR_NO'))); ?>
                                                        </label>
													<?php endif; ?>
												<?php endforeach; ?>
											<?php endif; ?>
                                        </li>
                                        <li>
                                            <label>
												<?php echo JText::_('SR_ADULT_NUMBER'); ?>
                                            </label>
											<?php echo $room->adults_number; ?>
                                        </li>
                                        <li>
                                            <label class="toggle_child_ages">
												<?php echo JText::_('SR_CHILDREN_NUMBER'); ?>
												<?php echo $room->children_number > 0 ? '<i class="icon-plus-2 fa fa-plus"></i>' : '' ?>
                                            </label>
											<?php echo $room->children_number; ?>
											<?php if (is_array($room->other_info)) : ?>
                                                <ul class="unstyled" id="booked_room_child_ages" style="display: none">
													<?php foreach ($room->other_info as $info) : ?>
														<?php if (substr($info->key, 0, 7) == 'smoking'): ?>
                                                            <li>
																<?php echo JText::_('SR_' . $info->key) . ': ' . ': ' . JText::plural('SR_CHILD_AGE_SELECTION', $info->value); ?>
                                                            </li>
														<?php endif; ?>
													<?php endforeach; ?>
                                                </ul>
											<?php endif; ?>
                                        </li>
                                    </ul>
                                </div>
                                <div class="<?php echo SR_UI_GRID_COL_6; ?>">
                                    <div class="booked_room_cost_wrapper">
										<?php
										$roomPriceCurrency = clone $baseCurrency;
										$roomPriceCurrency->setValue($room->room_price_tax_incl);
										$totalRoomCost += $room->room_price_tax_incl;

										?>
                                        <ul class="unstyled">
                                            <li>
                                                <label>
													<?php echo JText::_('SR_BOOKED_ROOM_COST') ?>
                                                    <span class="icon-help"
                                                          title="<?php echo strip_tags($room->tariff_title) . ' - ' . strip_tags($room->tariff_description); ?>">
                                                    </span>
                                                </label>
                                                <span class="booked_room_cost">
                                                    <?php echo $roomPriceCurrency->format(); ?>
                                                </span>
                                            </li>
											<?php if (!empty($room->extras)) : ?>
												<?php foreach ($room->extras as $extra) :
													$extraPriceCurrency = clone $baseCurrency;
													$extraPriceCurrency->setValue($extra->extra_price);
													$totalRoomCost += $extra->extra_price;
													?>
                                                    <li>
                                                        <label>
															<?php echo $extra->extra_name . ' (x' . $extra->extra_quantity . ')' ?>
                                                        </label>
                                                        <span class="booked_room_extra_cost">
                                                            <?php echo $extraPriceCurrency->format(); ?>
                                                        </span>
                                                    </li>
												<?php endforeach; ?>
											<?php endif; ?>
                                            <li>
                                                <label>
                                                    <strong>
														<?php echo JText::_('SR_BOOKED_ROOM_COST_TOTAL'); ?>
                                                    </strong>
                                                </label>
                                                <span class="booked_room_cost">
									                <strong>
                                                        <?php
                                                        $totalRoomCostCurrency = clone $baseCurrency;
                                                        $totalRoomCostCurrency->setValue($totalRoomCost);
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
                <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
                    <div class="<?php echo SR_UI_GRID_COL_12; ?> reservation-detail-box">
                        <h3>
							<?php echo JText::_('SR_RESERVATION_OTHER_INFO'); ?>
                        </h3>
						<?php if (!empty($this->reservation->extras)): ?>
                            <table class="table table-condensed">
                                <thead>
                                <tr>
                                    <th>
										<?php echo JText::_('SR_RESERVATION_ROOM_EXTRA_NAME'); ?>
                                    </th>
                                    <th>
										<?php echo JText::_('SR_RESERVATION_ROOM_EXTRA_QUANTITY'); ?>
                                    </th>
                                    <th>
										<?php echo JText::_('SR_RESERVATION_ROOM_EXTRA_PRICE'); ?>
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
								<?php foreach ($this->reservation->extras as $extra) : ?>
                                    <tr>
                                        <td>
											<?php echo $extra->extra_name ?>
                                        </td>
                                        <td>
											<?php echo $extra->extra_quantity ?>
                                        </td>
                                        <td>
											<?php
											$extraPriceCurrencyPerBooking = clone $baseCurrency;
											$extraPriceCurrencyPerBooking->setValue($extra->extra_price);
											echo $extraPriceCurrencyPerBooking->format();
											?>
                                        </td>
                                    </tr>
								<?php endforeach; ?>
                                </tbody>
                            </table>
						<?php endif; ?>
                    </div>
                </div>

                <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
                    <div class="<?php echo SR_UI_GRID_COL_12; ?> reservation-detail-box">
                        <h3><?php echo JText::_('SR_RESERVATION_NOTE_BACKEND'); ?></h3>
                        <div class="reservation-note-holder">
							<?php if (!empty($this->reservation->notes)) : ?>
								<?php foreach ($this->reservation->notes as $note) : ?>
                                    <blockquote>
                                        <p>
											<?php echo $note->text; ?>
                                        </p>
                                        <small>
											<?php echo $note->created_date; ?> by <?php echo $note->username; ?>
                                        </small>
                                    </blockquote>
								<?php endforeach; ?>
							<?php else: ?>
                                <div class="alert alert-info">
									<?php echo JText::_('SR_CUSTOMER_DASHBOARD_NO_NOTE'); ?>
                                </div>
							<?php endif; ?>
                        </div>
                    </div>
                </div>
			<?php endif; ?>
        </div>
    </div>
	<?php if ($config->get('show_solidres_copyright', 1)) : ?>
        <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
            <div class="<?php echo SR_UI_GRID_COL_12; ?> powered">
                <p>Powered by <a href="https://www.solidres.com" target="_blank">Solidres</a></p>
            </div>
        </div>
	<?php endif ?>
</div>
