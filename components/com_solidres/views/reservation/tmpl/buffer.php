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
 * /templates/TEMPLATENAME/html/com_solidres/reservation/buffer.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.12.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

$script = '
    Solidres.jQuery(function($) {
        intervalId = setInterval(function () {
            Solidres.jQuery.ajax({
                method: "GET",
                url: "index.php?option=com_solidres&task=reservation.fetchPaymentStatus&id=' . $this->reservationId . '&code=' . $this->reservationCode . '&format=json&' . JSession::getFormToken() . '=1",
                dataType: "JSON",
                success: function (data) {
                    console.log(data);
                    if (data.completed == 1) {
                        clearInterval(intervalId);
                        location.href = "' . $this->redirectUrl . '";
                    }
                }
            });
        }, 3000);
        
        setTimeout(function() { 
            clearInterval(intervalId);
            location.href = "' . $this->redirectUrl . '"; 
        }, 60000);
    });
';
JFactory::getDocument()->addScriptDeclaration($script);

?>
<div class="payment_processing">
    <h1><?php echo Text::_('SR_PAYMENT_PROCESSING') ?></h1>

    <span class="processing_screen"></span>

    <p><?php echo Text::_('SR_PAYMENT_PROCESSING_NOTE') ?></p>
</div>