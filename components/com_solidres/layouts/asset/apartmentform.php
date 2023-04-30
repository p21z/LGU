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
 * /templates/TEMPLATENAME/html/layouts/com_solidres/asset/apartmentform.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.12.0
 */

defined('_JEXEC') or die;

extract($displayData);

$subLayout = SRLayoutHelper::getInstance();
$subLayout->addIncludePath(JPATH_COMPONENT . '/components/com_solidres/layouts');
?>

<div class="room-form-item">
    <div class="occupancy-selection">
		<?php if (!$showGuestOption) : ?>
            <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
				<?php if ($roomType->params['show_adult_option'] == 1) : ?>
                    <div class="<?php echo SR_UI_GRID_COL_6 ?>">
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
                                class="form-select adults_number occupancy_max_constraint occupancy_max_constraint_<?php echo $identityReversed ?> occupancy_adult_<?php echo $identity ?> trigger_tariff_calculating">
							<?php echo $htmlAdultSelection ?>
                        </select>
                    </div>

				<?php else : ?>
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
				<?php if ($roomType->params['show_child_option'] == 1 && $roomType->occupancy_child > 0) : ?>
                    <div class="<?php echo SR_UI_GRID_COL_6 ?>">
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
                                class="form-select children_number occupancy_max_constraint occupancy_max_constraint_<?php echo $identityReversed ?> reservation-form-child-quantity trigger_tariff_calculating occupancy_child_<?php echo $identity ?>">
							<?php echo $htmlChildSelection ?>
                        </select>
                    </div>

				<?php endif ?>
            </div>
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
                    class="form-select guests_number trigger_tariff_calculating mb-3">
				<?php echo $htmlGuestSelection ?>
            </select>
		<?php endif; ?>
        <div class="alert alert-warning"
             id="error_<?php echo $identityReversed ?>"
             style="display: none">
			<?php echo JText::sprintf('SR_ROOM_OCCUPANCY_CONSTRAINT_NOT_SATISFIED', $tariff->p_min, $tariff->p_max) ?>
        </div>
        <div class="child-age-details <?php echo(empty($htmlChildrenAges) ? 'nodisplay' : '') ?>">
            <p><?php echo JText::_('SR_AGE_OF_CHILD_AT_CHECKOUT') ?></p>
            <ul class="unstyled list-unstyled"><?php echo $htmlChildrenAges ?></ul>
        </div>

    </div> <!-- occupancy-selection -->

	<?php if ($roomType->params['show_guest_name_field'] == 1) : ?>
        <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
            <div class="<?php echo SR_UI_GRID_COL_12 ?>">
                <input name="<?php echo $inputNamePrefix ?>[guest_fullname]"
					<?php echo $roomType->params['guest_name_optional'] == 0 ? 'required' : '' ?>
                       type="text"
                       class="form-control"
                       value="<?php echo $currentRoomIndex['guest_fullname'] ?? '' ?>"
                       placeholder="<?php echo JText::_('SR_GUEST_NAME') ?>"/>
            </div>
        </div>
	<?php endif ?>

	<?php if (!empty($htmlSmokingOption)) : ?>
        <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
            <div class="<?php echo SR_UI_GRID_COL_12 ?>">
				<?php echo $htmlSmokingOption; ?>
            </div>
        </div>
	<?php endif ?>

	<?php

	if (!empty($roomFields))
	{
		foreach ($roomFields as $roomField)
		{
			$field             = clone $roomField;
			$field->field_name = 'roomFields][' . $tariffId . '][' . $field->id . '][' . $i;
			$field->inputId    = 'roomFields-' . $tariffId . '-' . $field->id . '-' . $i;
			$field->id         = $field->inputId;

			if (isset($reservationDetails->room['roomFields'][$tariffId][$roomField->id][$i]))
			{
				$field->value = $reservationDetails->room['roomFields'][$tariffId][$roomField->id][$i];
			}

			echo SRCustomFieldHelper::render($field);
			unset($field);
		}
	}
	?>

	<?php echo $subLayout->render('asset.roomtypeform_extras', $displayData); ?>

</div>