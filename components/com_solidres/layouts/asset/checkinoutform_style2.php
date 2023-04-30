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
 * /templates/TEMPLATENAME/html/layouts/com_solidres/asset/checkinoutform_style2.php
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

?>

<div class="inner sr-datepickers">
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_4 ?>">
			<?php
			echo SRLayoutHelper::render('field.datepicker', [
				'fieldLabel'            => 'SR_SEARCH_CHECKIN_DATE',
				'fieldName'             => 'checkin',
				'fieldClass'            => 'checkin_roomtype',
				'fieldAttr'             => [
					'data-placeholder' => Text::_('SR_CHECKIN_PLACEHOLDER')
				],
				'datePickerInlineClass' => 'checkin_datepicker_inline',
				'dateUserFormat'        => '',
				'dateDefaultFormat'     => ''
			]);
			?>
        </div>
        <div class="<?php echo SR_UI_GRID_COL_4 ?>">
			<?php
			echo SRLayoutHelper::render('field.datepicker', [
				'fieldLabel'            => 'SR_SEARCH_CHECKOUT_DATE',
				'fieldName'             => 'checkout',
				'fieldAttr'             => [
					'data-placeholder' => Text::_('SR_CHECKOUT_PLACEHOLDER')
				],
				'fieldClass'            => 'checkout_roomtype',
				'datePickerInlineClass' => 'checkout_datepicker_inline',
				'dateUserFormat'        => '',
				'dateDefaultFormat'     => ''
			]);
			?>
        </div>
        <div class="<?php echo SR_UI_GRID_COL_4 ?>">
            <div class="d-grid">
                <input type="hidden" name="fts" value="<?php echo time() ?>"/>
                <label>&nbsp;</label>
                <button class="btn btn-block btn-primary searchbtn"
                        data-roomtypeid="<?php echo $roomTypeId ?>"
                        data-tariffid="<?php echo $tariff->id ?>" type="button"
                        disabled>
                    <i class="fa fa-search "></i> <?php echo Text::_('SR_SEARCH') ?>
                </button>
            </div>
        </div>
    </div>
</div>