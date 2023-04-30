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

echo $this->form->renderField('name');
echo $this->form->renderField('alias');
echo $this->form->renderField('reservation_asset_id');
echo $this->form->renderField('is_private');
echo $this->form->renderField('is_master');
echo $this->form->renderField('occupancy_max');
echo $this->form->renderField('occupancy_adult');
echo $this->form->renderField('occupancy_child');
echo $this->form->renderField('occupancy_child_age_range');

?>

<div class="<?php echo SR_UI_FORM_ROW ?>">
	<div class="control-label">
    <?php echo $this->form->getLabel('coupon_id'); ?>
	</div>
    <div class="<?php echo SR_UI_FORM_FIELD ?>">
        <div id="coupon-selection-holder">
            <?php echo $this->form->getInput('coupon_id'); ?>
        </div>
    </div>
</div>

<div class="<?php echo SR_UI_FORM_ROW ?>">
	<div class="control-label">
    <?php echo $this->form->getLabel('extra_id'); ?>
	</div>
    <div class="<?php echo SR_UI_FORM_FIELD ?>">
        <div id="extra-selection-holder">
            <?php echo $this->form->getInput('extra_id'); ?>
        </div>
    </div>
</div>

<?php
echo $this->form->renderField('state');
echo $this->form->renderField('description');