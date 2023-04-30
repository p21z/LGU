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
 * /templates/TEMPLATENAME/html/layouts/com_solidres/asset/roomtypeform.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

extract($displayData);

$subLayout = SRLayoutHelper::getInstance();
$subLayout->addIncludePath(JPATH_COMPONENT . '/components/com_solidres/layouts');

?>

<div class="<?php echo SR_UI_GRID_CONTAINER ?> room-form-item">
    <div class="<?php echo SR_UI_GRID_COL_10 ?> <?php echo SR_UI_GRID_OFFSET_2 ?>">
        <div class="<?php echo SR_UI_GRID_CONTAINER ?> room_index_form_heading">
            <h4><?php echo $costPrefix ?>: <span class="tariff_<?php echo $identity ?>">0</span>
                <a href="javascript:void(0)"
                   class="toggle_breakdown"
                   data-target="<?php echo $identity ?>">
                    <?php echo Text::_('SR_VIEW_TARIFF_BREAKDOWN') ?>
                </a>
                <span style="display: none" class="breakdown" id="breakdown_<?php echo $identity ?>"></span>
            </h4>
        </div>
        <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
            <div class="<?php echo SR_UI_GRID_COL_7 ?> order-12 order-sm-12 order-md-1">
	            <?php if ($roomType->params['show_guest_name_field'] == 1) : ?>
                    <input name="<?php echo $inputNamePrefix ?>[guest_fullname]"
			            <?php echo $roomType->params['guest_name_optional'] == 0 ? 'required' : '' ?>
                           type="text"
                           class="form-control mb-3"
                           value="<?php echo $currentRoomIndex['guest_fullname'] ?? '' ?>"
                           placeholder="<?php echo Text::_('SR_GUEST_NAME') ?>"/>
	            <?php endif ?>

	            <?php if (!empty($htmlSmokingOption)) : ?>
                    <?php echo $htmlSmokingOption ?>
	            <?php endif ?>

	            <?php echo $subLayout->render('asset.roomtypeform_customfields', $displayData); ?>

            </div>

            <div class="<?php echo SR_UI_GRID_COL_5 ?> order-1 order-sm-1 order-md-12">
                <div class="occupancy-selection">
	                <?php if ($roomType->params['show_adult_option'] == 1) : ?>
                        <select
                                data-raid="<?php echo $assetId ?>"
                                data-roomtypeid="<?php echo $roomTypeId ?>"
                                data-tariffid="<?php echo $tariffId ?>"
                                data-adjoininglayer="<?php echo $adjoiningLayer ?>"
                                data-roomindex="<?php echo $i ?>"
                                data-max="<?php echo $pMax ?>"
                                data-min="<?php echo $pMin ?>"
                                name="<?php echo $inputNamePrefix ?>[adults_number]"
                                required
                                data-identity="<?php echo $identity ?>"
                                class="form-select mb-3 adults_number occupancy_max_constraint occupancy_max_constraint_<?php echo $identityReversed ?> occupancy_adult_<?php echo $identity ?> trigger_tariff_calculating">
			                <?php echo $htmlAdultSelection ?>
                        </select>
	                <?php
	                else :
		                if (!$showGuestOption) : ?>
                            <input type="hidden"
                                   data-raid="<?php echo $assetId ?>"
                                   data-roomtypeid="<?php echo $roomTypeId ?>"
                                   data-tariffid="<?php echo $tariffId ?>"
                                   data-adjoininglayer="<?php echo $adjoiningLayer ?>"
                                   data-roomindex="<?php echo $i ?>"
                                   data-max="<?php echo $pMax ?>"
                                   data-min="<?php echo $pMin ?>"
                                   name="<?php echo $inputNamePrefix ?>[adults_number]"
                                   class="adults_number occupancy_max_constraint occupancy_max_constraint_<?php echo $identityReversed ?> occupancy_adult_<?php echo $identity ?> trigger_tariff_calculating"
                                   value="1"
                                   data-identity="<?php echo $identity ?>"
                            />
		                <?php endif ?>
	                <?php endif ?>
	                <?php if ($roomType->params['show_child_option'] == 1 && $roomType->occupancy_child > 0) : ?>
                        <select
                                data-raid="<?php echo $assetId ?>"
                                data-roomtypeid="<?php echo $roomTypeId ?>"
                                data-roomindex="<?php echo $i ?>"
                                data-max="<?php echo $pMax ?>"
                                data-min="<?php echo $pMin ?>"
                                data-tariffid="<?php echo $tariffId ?>"
                                data-adjoininglayer="<?php echo $adjoiningLayer ?>"
                                data-identity="<?php echo $identity ?>"
                                name="<?php echo $inputNamePrefix ?>[children_number]"
                                class="form-select mb-3 children_number occupancy_max_constraint occupancy_max_constraint_<?php echo $identityReversed ?> reservation-form-child-quantity trigger_tariff_calculating occupancy_child_<?php echo $identity ?>">
			                <?php echo $htmlChildSelection ?>
                        </select>
	                <?php endif ?>
	                <?php if ($showGuestOption) : ?>
                        <select
                                data-raid="<?php echo $assetId ?>"
                                data-roomtypeid="<?php echo $roomTypeId ?>"
                                data-tariffid="<?php echo $tariffId ?>"
                                data-adjoininglayer="<?php echo $adjoiningLayer ?>"
                                data-roomindex="<?php echo $i ?>"
                                data-max="<?php echo $pMax ?>"
                                data-min="<?php echo $pMin ?>"
                                name="<?php echo $inputNamePrefix ?>[guests_number]"
                                required
                                data-identity="<?php echo $identity ?>"
                                class="form-select mb-3 guests_number trigger_tariff_calculating">
			                <?php echo $htmlGuestSelection ?>
                        </select>
	                <?php endif; ?>
                    <div class="alert alert-warning"
                         id="error_<?php echo $identityReversed ?>"
                         style="display: none">
		                <?php echo Text::sprintf('SR_ROOM_OCCUPANCY_CONSTRAINT_NOT_SATISFIED', $tariff->p_min, $tariff->p_max) ?>
                    </div>
                    <div class="child-age-details <?php echo(empty($htmlChildrenAges) ? 'nodisplay' : '') ?>">
                        <p><?php echo Text::_('SR_AGE_OF_CHILD_AT_CHECKOUT') ?></p>
                        <ul class="unstyled list-unstyled"><?php echo $htmlChildrenAges ?></ul>
                    </div>
                </div>
            </div>
        </div>

        <?php if (is_array($extras) && count($extras) > 0) : ?>
        <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
            <div class="<?php echo SR_UI_GRID_COL_12 ?>">
                <?php echo $subLayout->render('asset.roomtypeform_extras', $displayData); ?>
            </div>
        </div>
        <?php endif ?>

        <div class="d-grid gap-2">
            <button data-step="room"
                    type="submit"
                    class="btn btn-success">
                <i class="fa fa-arrow-right"></i>
			    <?php echo Text::_('SR_NEXT') ?>
            </button>
        </div>
    </div>
</div>
