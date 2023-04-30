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
 * /templates/TEMPLATENAME/html/layouts/com_solidres/asset/payments.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.13.1
 */

defined('_JEXEC') or die;

extract($displayData);
use Joomla\CMS\Language\Text;

// Show available payment methods
$solidresPaymentConfigData = new SRConfig(array('scope_id' => $assetId));

$availablePaymentPlugins = [];
foreach ($solidresPaymentPlugins as $paymentPlugin) :
	$visibility = $solidresPaymentConfigData->get('payments/' . $paymentPlugin->element . '/' . $paymentPlugin->element . '_visibility', 0);

	if (
		($isGuestMakingReservation && in_array($visibility, [0, 1]))
		||
		(!$isGuestMakingReservation && in_array($visibility, [0, 2]))
	)
	{
		$availablePaymentPlugins[] = $paymentPlugin->element;
	}
endforeach;

$availablePaymentPluginsCount = 0;
foreach ($availablePaymentPlugins as $plugin) :
	$enabled = $solidresPaymentConfigData->get('payments/' . $plugin . '/' . $plugin . '_enabled');
	if ($enabled) :
		$availablePaymentPluginsCount++;
	endif;
endforeach;

if (!$isGuestMakingReservation) :
	if (!$isNew) :
		$processOnlinePaymentCheck = '';
	else :
		$processOnlinePaymentCheck = 'checked';
	endif;
endif;
?>
<div <?php echo $availablePaymentPluginsCount == 0 || $isAmending ? 'style="display: none"' : '' ?>>
    <h3 class="mt-3 px-3">
		<?php echo Text::_('SR_PAYMENT_INFO') ?>
		<?php if (!$isGuestMakingReservation) : ?>
            <input type="checkbox" name="jform[processonlinepayment]" value="1"
                   id="processonlinepayment" data-target="payment_method_wrapper"
				<?php echo $processOnlinePaymentCheck ?>
            />
			<?php echo Text::_('SR_RESERVATION_AMEND_PROCESS_ONLINE_PAYMENT') ?>
		<?php endif ?>
    </h3>
</div>

<div class="payment_method_wrapper px-3 py-3"
	<?php echo ($availablePaymentPluginsCount == 0 || $isAmending || (!$isGuestMakingReservation && $processOnlinePaymentCheck == '')) ? 'style="display: none"' : '' ?>>
    <ul class="unstyled list-unstyled payment_method_list">
		<?php
		foreach ($solidresPaymentPlugins as $paymentPlugin) :
			$paymentPluginId = $paymentPlugin->element;

			if (!in_array($paymentPluginId, $availablePaymentPlugins)) continue;

			$paymentConfigPath = 'payments/' . $paymentPluginId . '/' . $paymentPluginId;

			if ($solidresPaymentConfigData->get($paymentConfigPath . '_enabled')) :
				$checked = '';
				if (isset($reservationDetails->guest["payment_method_id"])) :
					if ($reservationDetails->guest["payment_method_id"] == $paymentPluginId) :
						$checked = "checked";
					endif;
				else :
					if ($solidresPaymentConfigData->get($paymentConfigPath . '_is_default') == 1):
						$checked = "checked";
					endif;
				endif;

				// Load custom payment plugin field template if it is available, otherwise just render it normally
				$fieldTemplatePath = JPATH_PLUGINS . '/solidrespayment/' . $paymentPluginId . '/form/field.php';

				if (SRPayment::hasCardForm($paymentPlugin->element)):
					$cardFormData = [
						'checked'                   => $checked,
						'element'                   => $paymentPlugin->element,
						'solidresPaymentConfigData' => $solidresPaymentConfigData,
						'reservationDetails'        => $reservationDetails,
					];
					echo '<li>' . SRLayoutHelper::render('payment.cardform', $cardFormData) . '</li>';
                elseif (file_exists($fieldTemplatePath)) :
					@ob_start();
					include $fieldTemplatePath;
					echo @ob_get_clean();
				else :
					$dataAttr = function ($k, $v) {
						return (SR_ISJ4 ? 'data-bs-' : 'data-') . $k . '="' . htmlspecialchars($v) .'"';
					};
					?>
                    <li>
                        <input id="payment_method_<?php echo $paymentPluginId ?>"
                               type="radio"
                               name="jform[payment_method_id]"
                               value="<?php echo $paymentPluginId ?>"
                               class="form-check-input payment_method_radio reload-sum"
							<?php echo $checked ?>
                        />
                        <span class="popover_payment_methods"
                                      <?php echo $dataAttr('content', SRUtilities::translateText($solidresPaymentConfigData->get($paymentConfigPath . '_frontend_message'))) ?>
							<?php echo $dataAttr('title', Text::_('SR_PAYMENT_METHOD_' . $paymentPluginId)) ?>
							<?php echo $dataAttr('toggle', 'popover') ?>
                                >
							        <?php echo Text::_('SR_PAYMENT_METHOD_' . $paymentPluginId) ?>
                                    <i class="fa fa-question-circle"></i>
						</span>
                    </li>
				<?php
				endif;

			endif;
		endforeach;
		?>
    </ul>
</div>
