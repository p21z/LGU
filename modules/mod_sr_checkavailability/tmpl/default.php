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
 * /templates/TEMPLATENAME/html/mod_sr_checkavailability/default.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;
?>

<form id="sr-checkavailability-form-<?php echo $module->id ?>"
      action="<?php echo JRoute::_('index.php?option=com_solidres&view=reservationasset&id='.$tableAsset->id.'&Itemid='.$params->get('target_itemid'), false)?>"
      method="GET" class="form-stacked sr-validate solidres-module-checkavailability <?php echo SR_UI ?>"
      onsubmit="this.action = ((Solidres.options.get('AutoScroll') == 1) ? this.action + (this.room_type_id != undefined && this.room_type_id.value != '' ? '#srt_' + this.room_type_id.value : '#book-form') : this.action)">
    <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <?php
            echo SRLayoutHelper::render('field.datepicker', [
	            'fieldLabel'            => 'SR_SEARCH_CHECKIN_DATE',
	            'fieldName'             => 'checkin',
	            'fieldClass'            => 'checkin_module',
	            'datePickerInlineClass' => 'checkin_datepicker_inline_module',
	            'dateUserFormat'        => isset($checkin) ?
		            $checkinModule->format($dateFormat, true) :
		            $dateCheckInMin->format($dateFormat, true),
	            'dateDefaultFormat'     => isset($checkin) ?
		            $checkinModule->format('Y-m-d', true) :
		            $dateCheckInMin->format('Y-m-d', true)
            ]);
            ?>
        </div>
    </div>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
	        <?php
	        echo SRLayoutHelper::render('field.datepicker', [
		        'fieldLabel'            => 'SR_SEARCH_CHECKOUT_DATE',
		        'fieldName'             => 'checkout',
		        'fieldClass'            => 'checkout_module',
		        'datePickerInlineClass' => 'checkout_datepicker_inline_module',
		        'dateUserFormat'        => isset($checkout) ?
			        $checkoutModule->format($dateFormat, true) :
			        $dateCheckOut->format($dateFormat, true),
		        'dateDefaultFormat'     => isset($checkout) ?
			        $checkoutModule->format('Y-m-d', true) :
			        $dateCheckOut->format('Y-m-d', true)
	        ]);
	        ?>
        </div>
    </div>

    <?php if ($enableRoomTypeDropdown && !empty($roomTypes)) : ?>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <label><?php echo JText::_('SR_SEARCH_ROOMTYPES') ?></label>
            <select class="form-select" name="room_type_id">
                <option value=""></option>
                <?php
                foreach ($roomTypes as $roomType) :
                    $selected = $prioritizingRoomTypeId == $roomType->id ? 'selected' : '';
                    echo '<option value="' . $roomType->id . '" '.$selected.'>' . $roomType->name . '</option>';
                endforeach;
                ?>
            </select>
        </div>
    </div>
    <?php endif ?>

    <?php if ($enableRoomQuantity) : ?>

    <?php if ($hideRoomQuantity == 0) : ?>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <label><?php echo JText::_('SR_SEARCH_ROOMS') ?></label>
            <select class="form-select room_quantity" name="room_quantity">
                <?php for ($room_num = 1; $room_num <= $maxRooms; $room_num ++) : ?>
                    <option <?php echo $room_num == $roomsOccupancyOptionsCount ? 'selected' : '' ?> value="<?php echo $room_num  ?>"><?php echo $room_num  ?></option>
                <?php endfor ?>
            </select>
        </div>
    </div>
    <?php else : ?>
    <input type="hidden" class="room_quantity" name="room_quantity" value="1" />
    <?php endif ?>

    <?php for ($room_num = 1; $room_num <= $maxRooms; $room_num ++) : ?>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3 room_num_row" id="room_num_row_<?php echo $room_num ?>" style="<?php echo $room_num > 0 ? 'display: none' : '' ?>">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <?php if (!$hideRoomQuantity) : ?>
                <div class="<?php echo SR_UI_GRID_COL_4 ?> room_num_label">
                    <label>&nbsp;</label>
                    <?php echo JText::_('SR_SEARCH_ROOM') ?> <?php echo $room_num  ?>
                </div>
                <?php endif ?>
                <?php if (($hideRoomQuantity && !$mergeAdultChild) || !$hideRoomQuantity) : ?>
                <div class="<?php echo $hideRoomQuantity ? SR_UI_GRID_COL_6 : SR_UI_GRID_COL_4 ?>">
                    <label><?php echo JText::_('SR_SEARCH_ROOM_ADULTS') ?></label>
                    <select <?php echo $room_num > 0 ? 'disabled': '' ?> class="form-select" name="room_opt[<?php echo $room_num ?>][adults]">
                        <?php
                        for ($a = 1; $a <= $maxAdults; $a ++) :
                            $selected = '';
                            if (isset($roomsOccupancyOptions[$room_num]['adults'])
                                &&
                                ($a == $roomsOccupancyOptions[$room_num]['adults'])
                            ) :
                                $selected = 'selected';
                            endif;
                            ?>
                            <option <?php echo $selected ?> value="<?php echo $a ?>"><?php echo $a ?></option>
                        <?php
                        endfor
                        ?>
                    </select>
                </div>
                <div class="<?php echo $hideRoomQuantity ? SR_UI_GRID_COL_6 : SR_UI_GRID_COL_4 ?>">
                    <label><?php echo JText::_('SR_SEARCH_ROOM_CHILDREN') ?></label>
                    <select <?php echo $room_num > 0 ? 'disabled': '' ?> class="form-select" name="room_opt[<?php echo $room_num ?>][children]">
                        <?php
                        for ($c = 0; $c <= $maxChildren; $c ++) :
                            $selected = '';
                            if (isset($roomsOccupancyOptions[$room_num]['children'])
                                &&
                                $c == $roomsOccupancyOptions[$room_num]['children']
                            ) :
                                $selected = 'selected';
                            endif;
                            ?>
                            <option <?php echo $selected ?> value="<?php echo $c ?>"><?php echo $c ?></option>
                        <?php
                        endfor
                        ?>
                    </select>
                </div>
                <?php else : ?>
                <div class="<?php echo SR_UI_GRID_COL_12 ?>">
                    <label><?php echo JText::_('SR_SEARCH_GUESTS') ?></label>
                    <select <?php echo $room_num > 0 ? 'disabled': '' ?> class="form-select" name="room_opt[<?php echo $room_num ?>][guests]">
                        <?php
                        for ($a = 1; $a <= $maxAdults; $a ++) :
                            $selected = '';
                            if (isset($roomsOccupancyOptions[$room_num]['guests'])
                                &&
                                ($a == $roomsOccupancyOptions[$room_num]['guests'])
                            ) :
                                $selected = 'selected';
                            endif;
                            ?>
                            <option <?php echo $selected ?> value="<?php echo $a ?>"><?php echo $a ?></option>
                            <?php
                        endfor
                        ?>
                    </select>
                </div>
                <?php endif ?>
            </div>
        </div>
    </div>
    <?php endfor; ?>
    <?php endif; ?>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?> mb-3">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <div class="d-grid">
                <button class="btn btn-primary" type="submit"><i class="fa fa-search"></i> <?php echo JText::_('SR_SEARCH')?></button>
            </div>
        </div>
    </div>

    <input name="id" value="<?php echo $tableAsset->id ?>" type="hidden" />
    <input type="hidden" name="option" value="com_solidres" />
    <input type="hidden" name="view" value="reservationasset" />
    <input type="hidden" name="Itemid" value="<?php echo $params->get('target_itemid') ?>" />
    <?php echo JHtml::_('form.token'); ?>
</form>