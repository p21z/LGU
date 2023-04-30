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
 * /templates/TEMPLATENAME/html/layouts/com_solidres/asset/coupon_form.php
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

extract($displayData);

$enableCoupon = $asset->params['enable_coupon'] ?? 0;

if ($enableCoupon && !$isFresh) :
?>
<div class="coupon">
    <div class="<?php echo SR_UI_INPUT_APPEND ?>">
        <input type="text" name="coupon_code" class="form-control" id="coupon_code"
               placeholder="<?php echo JText::_('SR_COUPON_ENTER') ?>"/>
        <div class="<?php echo SR_UI_INPUT_GROUP_APPEND ?>">
            <button id="coupon_code_check" class="btn <?php echo SR_UI_BTN_DEFAULT ?>"
                    type="button"><?php echo JText::_('SR_COUPON_CHECK') ?></button>
        </div>
    </div>
    <?php if (isset($coupon)) : ?>
    <span class="help-block form-text">
    <?php echo JText::_('SR_APPLIED_COUPON') ?>
        <span class="label label-success badge badge-success">
        <?php echo $coupon['coupon_name'] ?>
        </span>&nbsp;
        <a id="sr-remove-coupon" href="javascript:void(0)" data-couponid="<?php echo $coupon['coupon_id'] ?>">
            <?php echo JText::_('SR_REMOVE') ?>
        </a>
    </span>
    <?php endif ?>
</div>
<?php
Factory::getDocument()->addScriptDeclaration("
    Solidres.jQuery(function ($) {
        $('#coupon_code_check').click(function () {
            var self = $('input#coupon_code');
            var coupon_code = self.val();
            if (coupon_code) {
                $.ajax({
                    type: 'POST',
                    url: window.location.pathname,
                    data: 'option=com_solidres&format=json&task=coupon.isValid&coupon_code=' + coupon_code + '&raid=' + $('input[name=\"id\"]').val(),
                    success: function (response) {
                        self.parent().next('span').remove();
                        self.parent().after(response.message);
                        if (!response.status) {
                            $('#apply-coupon').attr('disabled', 'disabled');
                        } else {
                            $('#apply-coupon').removeAttr('disabled');
                        }
                    },
                    dataType: 'JSON'
                });
            }
        });
    });
");

endif;