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
use Joomla\CMS\Router\Route;
use Joomla\CMS\Language\Text;

$paymentMethodTxnId     = $this->form->getValue('payment_method_txn_id');
$isDiscountPreTax       = $this->form->getValue('discount_pre_tax');
$totalExtraPriceTaxIncl = $this->form->getValue('total_extra_price_tax_incl');
$totalExtraPriceTaxExcl = $this->form->getValue('total_extra_price_tax_excl');
$totalExtraTaxAmount    = $totalExtraPriceTaxIncl - $totalExtraPriceTaxExcl;
$totalPaid              = $this->form->getValue('total_paid', 0);
$deposit                = $this->form->getValue('deposit_amount', 0);

$subTotal = clone $this->baseCurrency;
$subTotal->setValue($this->form->getValue('total_price_tax_excl') - $this->form->getValue('total_single_supplement'));

$totalSingleSupplement = clone $this->baseCurrency;
$totalSingleSupplement->setValue($this->form->getValue('total_single_supplement'));

$totalDiscount = clone $this->baseCurrency;
$totalDiscount->setValue($this->form->getValue('total_discount'));

$tax = clone $this->baseCurrency;
$tax->setValue($this->form->getValue('tax_amount'));
$touristTax = clone $this->baseCurrency;
$touristTax->setValue($this->form->getValue('tourist_tax_amount'));
$totalFee = clone $this->baseCurrency;
$totalFee->setValue($this->form->getValue('total_fee'));
$paymentMethodSurcharge = clone $this->baseCurrency;
$paymentMethodSurcharge->setValue($this->form->getValue('payment_method_surcharge'));
$paymentMethodDiscount = clone $this->baseCurrency;
$paymentMethodDiscount->setValue($this->form->getValue('payment_method_discount'));
$totalExtraPriceTaxExclDisplay = clone $this->baseCurrency;
$totalExtraPriceTaxExclDisplay->setValue($totalExtraPriceTaxExcl);
$totalExtraTaxAmountDisplay = clone $this->baseCurrency;
$totalExtraTaxAmountDisplay->setValue($totalExtraTaxAmount);

$grandTotal = clone $this->baseCurrency;
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

$depositAmount = clone $this->baseCurrency;
$depositAmount->setValue($deposit ?? 0);
$totalPaidAmount = clone $this->baseCurrency;
$totalPaidAmount->setValue($totalPaid);
$totalDueAmount = clone $this->baseCurrency;
$totalDueAmount->setValue($grandTotalAmount - $totalPaid);

$couponCode          = $this->form->getValue('coupon_code');
$this->reservationId = $this->form->getValue('id');
$reservationState    = $this->form->getValue('state');
$paymentStatus       = $this->form->getValue('payment_status');
$bookingType         = $this->form->getValue('booking_type', 0);

$reservationMeta = [];
if (!empty($this->form->getValue('reservation_meta')))
{
	$reservationMeta = json_decode($this->form->getValue('reservation_meta'), true);
}

$appliedDiscountHtml = '';
if ($this->form->getValue('total_discount') > 0 && isset($reservationMeta['applied_discounts']))
{
	foreach ($reservationMeta['applied_discounts'] as $appliedDiscount)
	{
		if (!isset($appliedDiscount['amount']))
		{
			continue;
		}

		$appliedDiscountLine = clone $this->baseCurrency;
		$appliedDiscountLine->setValue($appliedDiscount['amount']);
		$appliedDiscountHtml .= '<li class="sub-line-item" style="display: none"><label>|- ' . $appliedDiscount['title'] . '</label><span>' . $appliedDiscountLine->format() . '</span></li>';
	}
}

?>

<h3><?php echo Text::_('SR_GENERAL_INFO', true) ?></h3>

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
    <div class="<?php echo SR_UI_GRID_COL_6 ?>">

        <ul class="reservation-details">
            <li>
                <label><?php echo Text::_("SR_CODE") ?></label>
                <strong style="color: <?php echo $this->statusesColor[$this->form->getValue('state')] ?>; font-weight: bold">
					<?php echo $this->form->getValue('code') ?>
                </strong>
            </li>
            <li>
                <label><?php echo Text::_("SR_RESERVATION_ASSET_NAME") ?></label>
				<?php
				$assetLink = Route::_('index.php?option=com_solidres&view=reservationasset&layout=edit&id=' . $this->form->getValue('reservation_asset_id'));
				echo "<a href=\"$assetLink\">" . $this->form->getValue('reservation_asset_name') . "</a>" ?>
            </li>
            <li>
                <label><?php echo Text::_("SR_CHECKIN") ?></label>
				<?php echo HTMLHelper::_('date', $this->form->getValue('checkin'), $this->dateFormat, null); ?>
            </li>
            <li>
                <label><?php echo Text::_("SR_CHECKOUT") ?></label>
				<?php echo HTMLHelper::_('date', $this->form->getValue('checkout'), $this->dateFormat, null); ?>
            </li>
            <li>
                <label><?php echo Text::_("SR_LENGTH_OF_STAY") ?></label>
				<?php
				if ($bookingType == 0) :
					echo Text::plural('SR_NIGHTS', $this->lengthOfStay);
				else :
					echo Text::plural('SR_DAYS', $this->lengthOfStay + 1);
				endif;
				?>
            </li>
            <li>
                <label><?php echo Text::_("SR_STATUS") ?></label>
                <a href="#"
                   id="state"
                   data-type="select"
                   data-pk="<?php echo $this->reservationId ?>"
                   data-name="state"
                   data-value="<?php echo $reservationState ?>"
                   data-original-title=""
                   style="font-weight: bold; color: <?php echo $this->statusesColor[$reservationState] ?>">
	                <?php echo $this->statuses[$reservationState] ?>
                </a>
            </li>
            <li>
                <label><?php echo Text::_("SR_RESERVATION_ORIGIN") ?></label>
                <a href="#"
                   id="origin"
                   data-type="select"
                   data-name="origin"
                   data-pk="<?php echo $this->reservationId ?>"
                   data-value="<?php echo $this->originValue ?>"
                   data-original-title=""><?php echo $this->originText ?></a>
            </li>
            <li>
                <label><?php echo Text::_("SR_CREATED_DATE") ?></label>
				<?php
				echo HTMLHelper::_('date', $this->form->getValue('created_date'), $this->dateFormat, true);
				echo isset($this->createdByUser) ? Text::_("SR_CREATED_BY_LBL") . $this->createdByUser->get('username') : '';
				echo ' (<i title="' . Text::_('SR_IP_DESC') . '">' . Text::_('SR_IP') . ': ' . $this->form->getValue('customer_ip') . '</i>, <i title="' . Text::_('SR_LANGUAGE_DESC') . '">' . Text::_('SR_LANGUAGE') . ': ' . $this->form->getValue('customer_language') . '</i>, <i title="' . Text::_('SR_IS_MOBILE_DESC') . '">' . Text::_('SR_IS_MOBILE') . ': ' . ($this->isMobile === '1' ? Text::_('JYES') : (is_null($this->isMobile) ? 'N/A' : Text::_('JNO'))) . '</i>)';
				?>
            </li>
            <li>
                <label><?php echo Text::_("SR_PAYMENT_TYPE") ?></label> <?php echo !empty($this->paymentMethodId) ? $this->paymentMethodLabel : 'N/A' ?>
            </li>
            <li>
                <label><?php echo Text::_("SR_RESERVATION_PAYMENT_STATUS") ?></label>
                <a href="#"
                   id="payment_status"
                   data-type="select"
                   data-name="payment_status"
                   data-pk="<?php echo $this->reservationId ?>"
                   data-value="<?php echo $paymentStatus ?>"
                   data-original-title=""
                   style="font-weight: bold; color: <?php echo $this->paymentsColor[$paymentStatus] ?? '' ?>">
					<?php if (isset($this->paymentStatuses[$paymentStatus])): ?>
							<?php echo $this->paymentStatuses[$paymentStatus]; ?>
					<?php else: ?>
						<?php echo 'N/A'; ?>
					<?php endif; ?>
                </a>

				<?php
				$channelPaymentCollect = $this->form->getValue('cm_payment_collect', '');
				if (SRPlugin::isEnabled('channelmanager') && !empty($channelPaymentCollect)) :
					echo ' (' . Text::_('SR_CHANNEL_PAYMENT_COLLECT_' . ($channelPaymentCollect == 0 ? 'PROPERTY' : 'CHANNEL')) . ')';
				endif;
				?>
            </li>
            <li>
                <label><?php echo Text::_("SR_RESERVATION_PAYMENT_TXN_ID") ?></label>
                <a href="#"
                   id="payment_method_txn_id"
                   data-name="payment_method_txn_id"
                   data-type="input"
                   data-pk="<?php echo $this->reservationId ?>"
                   data-value="<?php echo $paymentMethodTxnId ?>"
                   data-original-title=""><?php echo $paymentMethodTxnId ?? 'N/A' ?></a>
            </li>
            <li>
                <label><?php echo Text::_('SR_RESERVATION_COUPON_CODE') ?></label> <?php echo !empty($couponCode) ? $couponCode : 'N/A' ?>
            </li>
        </ul>
    </div>

    <div class="<?php echo SR_UI_GRID_COL_6 ?>">
        <ul class="reservation-details">
            <li><label><?php echo Text::_('SR_RESERVATION_SUB_TOTAL') ?></label>
                <span><?php echo $subTotal->format() ?></span></li>
			<?php if ($this->form->getValue('total_single_supplement', 0) > 0) : ?>
                <li><label><?php echo Text::_('SR_RESERVATION_TOTAL_SINGLE_SUPPLEMENT') ?></label>
                    <span><?php echo $totalSingleSupplement->format() ?></span></li>
			<?php endif ?>
			<?php if (isset($isDiscountPreTax) && $isDiscountPreTax == 1) : ?>
                <li class="toggle-discount-sub-lines">
                    <label><?php echo Text::_('SR_RESERVATION_TOTAL_DISCOUNT') ?></label>
                    <span><a href="#"
                        id="total_discount"
                        data-name="total_discount"
                        data-type="input"
                        data-pk="<?php echo $this->reservationId ?>"
                        data-value="<?php echo $totalDiscount->getValue(true) ?>">
		                <?php echo '-' . $totalDiscount->format() ?>
                    </a></span></li>
				<?php echo $appliedDiscountHtml ?>
			<?php endif ?>
            <li><label><?php echo Text::_('SR_RESERVATION_TAX') ?></label>
                <span><?php echo $tax->format() ?></span></li>
			<?php if (isset($isDiscountPreTax) && $isDiscountPreTax == 0) : ?>
                <li class="toggle-discount-sub-lines">
                    <label><?php echo Text::_('SR_RESERVATION_TOTAL_DISCOUNT') ?></label>
                    <span><a href="#"
                             id="total_discount"
                             data-name="total_discount"
                             data-type="input"
                             data-pk="<?php echo $this->reservationId ?>"
                             data-value="<?php echo $totalDiscount->getValue(true) ?>">
		                <?php echo '-' . $totalDiscount->format() ?>
                    </a></span></li>
				<?php echo $appliedDiscountHtml ?>
			<?php endif ?>
            <li><label><?php echo Text::_('SR_RESERVATION_EXTRA_TAX_EXCL') ?></label>
                <span><?php echo $totalExtraPriceTaxExclDisplay->format() ?></span></li>
            <li><label><?php echo Text::_('SR_RESERVATION_EXTRA_TAX_AMOUNT') ?></label>
                <span><?php echo $totalExtraTaxAmountDisplay->format() ?></span></li>
			<?php if (!empty($this->paymentMethodId)) : ?>
                <li>
                    <label><?php echo Text::sprintf("SR_PAYMENT_METHOD_SURCHARGE_AMOUNT", $this->paymentMethodLabel) ?></label>
                    <span><?php echo $paymentMethodSurcharge->format() ?></span></li>
                <li>
                    <label><?php echo Text::sprintf("SR_PAYMENT_METHOD_DISCOUNT_AMOUNT", $this->paymentMethodLabel) ?></label>
                    <span><?php echo '-' . $paymentMethodDiscount->format() ?></span></li>
			<?php endif ?>
            <li><label><?php echo Text::_('SR_TOURIST_TAX_AMOUNT') ?></label>
                <span><?php echo $touristTax->format() ?></span></li>
            <li><label><?php echo Text::_('SR_TOTAL_FEE_AMOUNT') ?></label>
                <span>
                    <a href="#"
                       id="total_fee"
                       data-name="total_fee"
                       data-type="input"
                       data-pk="<?php echo $this->reservationId ?>"
                       data-value="<?php echo $totalFee->getValue(true) ?>">
                        <?php echo $totalFee->format() ?>
                    </a>
                </span>
            </li>
            <li><label><?php echo Text::_('SR_RESERVATION_GRAND_TOTAL') ?></label>
                <span><?php echo $grandTotal->format() ?></span></li>
            <li><label><?php echo Text::_('SR_RESERVATION_DEPOSIT_AMOUNT') ?></label>
                <span>
                    <a href="#"
                       id="deposit_amount"
                       data-name="deposit_amount"
                       data-type="input"
                       data-pk="<?php echo $this->reservationId ?>"
                       data-value="<?php echo $depositAmount->getValue(true) ?>">
                        <?php echo $depositAmount->format() ?>
                    </a>
                </span></li>
            <li>
                <label><?php echo Text::_('SR_RESERVATION_TOTAL_PAID') ?></label>
                <span>
                    <a href="#"
                       id="total_paid"
                       data-type="input"
                       data-name="total_paid"
                       data-pk="<?php echo $this->reservationId ?>"
                       data-value="<?php echo $totalPaidAmount->getValue(true) ?>">
                        <?php echo $totalPaidAmount->format() ?>
                    </a>
                </span>
            </li>
            <li><label><?php echo Text::_('SR_RESERVATION_DUE_AMOUNT') ?></label> <span
                        id="total_due"><?php echo $totalDueAmount->format() ?></span></li>
        </ul>
    </div>
</div>
