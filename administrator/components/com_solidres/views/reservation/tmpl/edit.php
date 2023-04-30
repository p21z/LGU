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
use Joomla\CMS\Router\Route;
use Joomla\CMS\Language\Text;

/** @var Joomla\CMS\WebAsset\WebAssetManager $wa */
$wa = $this->document->getWebAssetManager();
$wa->useScript('com_solidres.inline-edit');
HTMLHelper::_('behavior.formvalidator');
$script =
	' Solidres.jQuery(function($) {
	    const statusColors = ' . json_encode($this->statusesColor ?: new stdClass) . ';
	    const paymentColors = ' . json_encode($this->paymentsColor ?: new stdClass) . ';
		Solidres.InlineEdit("#state", {
			url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservationbase.save&format=json",
			source: ' . json_encode($this->reservationStatusesList) . ',
			success: function({ success, newValue }) {
			    
                if (!success) {
                    return;
                }
                
		        const newColorCode = statusColors[newValue];
		        
		        if (newColorCode) {
		            this.style.color = newColorCode;
		        }
		    }
		});

		$("#state").on("save", function(e, params) {
		    ' . ((SRPlugin::isEnabled('channelmanager')) ? 'showARIUpdateStatus(' . $this->assetId . ')' : '') . ';
		});

		Solidres.InlineEdit("#payment_status", {
			url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservationbase.save&format=json",
			source: ' . json_encode($this->paymentStatusesList) . ',
			success: function({ success, newValue }) {

                if (!success) {
                    return;
					}
                
		        const newColorCode = paymentColors[newValue];
		        
		        if (newColorCode) {
		            this.style.color = newColorCode;
				}
			}
		});

		Solidres.InlineEdit("#total_paid", {
			url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservationbase.save&format=json",
			initContainer: function(container) {
			    container.style.left = "";
			    container.style.right = "0px";
			},
			success: function({ success, newValue }) {
                if (success) {
                    this.innerText = newValue;
				}
			}
		});
		Solidres.InlineEdit("#total_discount", {
			url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservationbase.save&format=json",
			initContainer: function(container) {
			    container.style.left = "";
			    container.style.right = "0px";
			},
			success: function({ success, newValue }) {
                if (success) {
                    this.innerText = newValue;
				}
			}
		});
		Solidres.InlineEdit("#total_fee", {
			url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservationbase.save&format=json",
			initContainer: function(container) {
			    container.style.left = "";
			    container.style.right = "0px";
			},
			success: function({ success, newValue }) {
                if (success) {
                    this.innerText = newValue;
				}
			}
		});
		Solidres.InlineEdit("#deposit_amount", {
			url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservationbase.save&format=json",
			success: function({ success, newValue }) {
				if (success) {
                    this.innerText = newValue;
                    window.location.reload();
                }
			}
		});
		Solidres.InlineEdit("#payment_method_txn_id", {
			url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservationbase.save&format=json",
			display: function (value, response) {
				if (response) {
					if (response.success == true) {
						$(this).text(response.newValue);
					}
				}
			}
		});
		Solidres.InlineEdit("#origin", {
			url: Joomla.getOptions("system.paths").base + "/index.php?option=com_solidres&task=reservationbase.save&format=json",
			source: ' . json_encode(array_values($this->originsList)) . ',
		});
	});';
Factory::getDocument()->addScriptDeclaration($script);

$config   = Factory::getConfig();
$timezone = new DateTimeZone($config->get('offset'));
$id       = $this->form->getValue('id');

Factory::getDocument()->addScriptDeclaration('
	Joomla.submitbutton = function(task)
	{
		if (task == "reservationbase.cancel" || task == "reservationbase.amend")
		{
			Joomla.submitform(task, document.getElementById("item-form"));
		}
	}
');

?>

<div id="solidres">
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<?php echo SolidresHelperSideNavigation::getSideNavigation($this->getName()); ?>
        <div id="sr_panel_right" class="sr_form_view <?php echo SR_UI_GRID_COL_10 ?>">

			<?php echo HTMLHelper::_(SR_UITAB . '.startTabSet', 'sr-reservation', ['active' => 'general', 'recall' => true]) ?>

			<?php echo HTMLHelper::_(SR_UITAB . '.addTab', 'sr-reservation', 'general', Text::_('SR_NEW_GENERAL_INFO', true)) ?>
			<?php echo $this->loadTemplate('general') ?>
			<?php echo $this->loadTemplate('customer') ?>

			<?php
			$paymentData = $this->form->getValue('payment_data');
			if (!empty($paymentData) && $this->paymentMethodId == 'offline') :
				$paymentData = json_decode($paymentData);
				echo HTMLHelper::_(SR_UITAB . '.addTab', 'sr-reservation', 'customer-payment-info', Text::_('SR_CUSTOMER_PAYMENT_INFO', true));
				echo $this->loadTemplate('customer_payment');
				echo HTMLHelper::_(SR_UITAB . '.endTab');
			endif;
			?>

			<?php echo $this->loadTemplate('room') ?>

			<?php echo HTMLHelper::_(SR_UITAB . '.endTab') ?>

			<?php echo HTMLHelper::_(SR_UITAB . '.addTab', 'sr-reservation', 'invoice', Text::_('SR_INVOICE_INFO', true)) ?>
			<?php echo $this->loadTemplate('invoice') ?>
			<?php echo HTMLHelper::_(SR_UITAB . '.endTab') ?>

			<?php echo HTMLHelper::_(SR_UITAB . '.addTab', 'sr-reservation', 'payment-history', Text::_('SR_PAYMENT_HISTORY', true)) ?>
			<?php echo $this->loadTemplate('paymenthistory') ?>
			<?php echo HTMLHelper::_(SR_UITAB . '.endTab') ?>

			<?php echo HTMLHelper::_(SR_UITAB . '.addTab', 'sr-reservation', 'reservation-note', Text::_('SR_RESERVATION_NOTE_BACKEND', true)) ?>
			<?php echo $this->loadTemplate('note') ?>
			<?php echo HTMLHelper::_(SR_UITAB . '.endTab') ?>

			<?php if (SRPlugin::isEnabled('hub')): ?>
			<?php echo HTMLHelper::_(SR_UITAB . '.addTab', 'sr-reservation', 'commission-payout', Text::_('SR_COMMISSIONS', true)) ?>
			<?php echo $this->loadTemplate('commission_payout') ?>
			<?php echo HTMLHelper::_(SR_UITAB . '.endTab') ?>
			<?php endif; ?>

			<?php echo HTMLHelper::_(SR_UITAB . '.addTab', 'sr-reservation', 'stream', Text::_('SR_STREAM', true)) ?>
			<?php echo $this->loadTemplate('stream') ?>
			<?php echo HTMLHelper::_(SR_UITAB . '.endTab') ?>

			<?php echo HTMLHelper::_(SR_UITAB . '.endTabSet') ?>
        </div>
    </div>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_12 ?> powered">
            <p>Powered by <a href="https://www.solidres.com" target="_blank">Solidres</a></p>
        </div>
    </div>
</div>
<form action="<?php Route::_('index.php?option=com_solidres&view=reservations'); ?>" method="post" name="adminForm"
      id="item-form" class="">
    <input type="hidden" name="task" value=""/>
    <input type="hidden" name="id" value="<?php echo $id > 0 ? $id : '' ?>"/>
	<?php echo HTMLHelper::_('form.token'); ?>
</form>
