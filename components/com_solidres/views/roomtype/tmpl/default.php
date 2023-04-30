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
 * /templates/TEMPLATENAME/html/com_solidres/roomtype/default.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

require_once JPATH_SITE . '/components/com_solidres/helpers/route.php';

$solidresMedia = SRFactory::get('solidres.media.media');
?>

<div id="solidres" class="<?php echo SR_UI ?> single_room_type_view">

    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <h3><?php echo $this->item->name; ?></h3>
        </div>
    </div>

    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
			<?php echo $this->item->description; ?>
        </div>
    </div>

    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <div class="unstyled more_desc" id="more_desc_<?php echo $this->item->id ?>">
	            <?php
	            echo SRLayoutHelper::render('roomtype.customfields', ['roomType' => $this->item]);
	            ?>
            </div>
        </div>
    </div>

    <div class="<?php echo SR_UI_GRID_CONTAINER ?> call_to_action">
        <div class="<?php echo SR_UI_GRID_COL_12 ?>">
            <p>
                <a class="btn <?php echo SR_UI_BTN_DEFAULT ?> btn-large"
                   href="<?php echo SolidresHelperRoute::getReservationAssetRoute($this->item->reservation_asset_id, $this->item->id); ?>">
					<?php echo JText::_('SR_SINGLE_ROOM_TYPE_VIEW_CALL_TO_ACTION') ?>
                </a>
            </p>
        </div>
    </div>

	<?php echo $this->defaultGallery; ?>

</div>