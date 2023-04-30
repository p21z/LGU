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
 * /templates/TEMPLATENAME/html/layouts/com_solidres/asset/breakdown.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

extract($displayData);

switch ($tariff['type']) :
	case 0:
	default:
		$tempKeyWeekDay = null;
		$totalBreakDown = count($tariff['tariff_break_down']);
		for ($key = 0; $key <= $totalBreakDown; $key++) :
			if ($key % 6 == 0 && $key == 0) : ?>
                <div class="<?php echo SR_UI_GRID_CONTAINER ?> breakdown-row">
			<?php elseif ($key % 6 == 0 && $key != $totalBreakDown) : ?>
                </div><div class="<?php echo SR_UI_GRID_CONTAINER ?> breakdown-row">
			<?php elseif ($key == $totalBreakDown) : ?>
                </div>
			<?php endif;

			if ($key < $totalBreakDown) :
				$priceOfDayDetails = $tariff['tariff_break_down'][$key];
				$tempKeyWeekDay = key($priceOfDayDetails);
				?>
                <div class="<?php echo SR_UI_GRID_COL_2 ?>">
                    <p class="breakdown-wday"><?php echo $dayMapping[$tempKeyWeekDay] ?></p>
                    <span class="<?php echo $tariffBreakDownNetOrGross ?>">
					<?php echo $priceOfDayDetails[$tempKeyWeekDay][$tariffBreakDownNetOrGross]->format() ?>
					</span>
                </div>
			<?php endif;
		endfor;
		break;
	case 1:
		$tempKeyWeekDay = null;
		$totalBreakDown = count($tariff['tariff_break_down']);
		for ($key = 0; $key <= $totalBreakDown; $key++) :

			if ($key % 6 == 0 && $key == 0) : ?>
                <div class="<?php echo SR_UI_GRID_CONTAINER ?> breakdown-row">
			<?php elseif ($key % 6 == 0 && $key != $totalBreakDown) : ?>
                </div><div class="<?php echo SR_UI_GRID_CONTAINER ?> breakdown-row">
			<?php elseif ($key == $totalBreakDown) : ?>
                </div>
			<?php endif;

			if ($key < $totalBreakDown) :
				$priceOfDayDetails = $tariff['tariff_break_down'][$key];
				$tempKeyWeekDay = key($priceOfDayDetails); ?>
                <div class="<?php echo SR_UI_GRID_COL_2 ?>">
                    <p class="breakdown-wday"><?php echo $dayMapping[$tempKeyWeekDay] ?></p>
                    <p class="breakdown-adult"><?php echo JText::_('SR_ADULT') ?></p>
                    <span class="<?php echo $tariffBreakDownNetOrGross ?>">
						<?php echo $priceOfDayDetails[$tempKeyWeekDay][$tariffBreakDownNetOrGross . '_adults']->format() ?>
					</span>
					<?php if ($roomType->occupancy_child > 0) : ?>
                        <p class="breakdown-child"><?php echo JText::_('SR_CHILD') ?></p>
                        <span class="<?php echo $tariffBreakDownNetOrGross ?>">
						<?php echo $priceOfDayDetails[$tempKeyWeekDay][$tariffBreakDownNetOrGross . '_children']->format() ?>
					</span>
					<?php endif ?>
                </div>
			<?php endif;
		endfor;
		break;
	case 2:
		$tempKeyWeekDay = null;
		$totalBreakDown = count($tariff['tariff_break_down']);
		for ($key = 0; $key <= $totalBreakDown; $key++) :

			if ($key % 6 == 0 && $key == 0) : ?>
                <div class="<?php echo SR_UI_GRID_CONTAINER ?> breakdown-row">
			<?php elseif ($key % 6 == 0 && $key != $totalBreakDown) : ?>
                </div><div class="<?php echo SR_UI_GRID_CONTAINER ?> breakdown-row">
			<?php elseif ($key == $totalBreakDown) : ?>
                </div>
			<?php endif;

			if ($key < $totalBreakDown) :
				$priceOfDayDetails = $tariff['tariff_break_down'][$key];
				$tempKeyWeekDay = key($priceOfDayDetails);
				?>
                <div class="<?php echo SR_UI_GRID_COL_2 ?>">
					<span class="<?php echo $tariffBreakDownNetOrGross ?>">
					<?php echo $priceOfDayDetails[$tempKeyWeekDay][$tariffBreakDownNetOrGross]->format() ?>
					</span>
                </div>
			<?php endif;
		endfor;
		break;
	case 3:
		$tempKeyWeekDay = null;
		$totalBreakDown = count($tariff['tariff_break_down']);
		for ($key = 0; $key <= $totalBreakDown; $key++) :
			if ($key % 6 == 0 && $key == 0) : ?>
                <div class="<?php echo SR_UI_GRID_CONTAINER ?> breakdown-row">
			<?php elseif ($key % 6 == 0 && $key != $totalBreakDown) : ?>
                </div><div class="<?php echo SR_UI_GRID_CONTAINER ?> breakdown-row">
			<?php elseif ($key == $totalBreakDown) : ?>
                </div>
			<?php endif;

			if ($key < $totalBreakDown) :
				$priceOfDayDetails = $tariff['tariff_break_down'][$key];
				$tempKeyWeekDay = key($priceOfDayDetails);
				?>
                <div class="<?php echo SR_UI_GRID_COL_2 ?>">
                    <p class="breakdown-adult"><?php echo JText::_('SR_ADULT') ?></p>
                    <span class="<?php echo $tariffBreakDownNetOrGross ?>">
						<?php echo $priceOfDayDetails[$tempKeyWeekDay][$tariffBreakDownNetOrGross . '_adults']->format() ?>
					</span>
					<?php if ($roomType->occupancy_child > 0) : ?>
                        <p class="breakdown-child"><?php echo JText::_('SR_CHILD') ?></p>
                        <span class="<?php echo $tariffBreakDownNetOrGross ?>">
						<?php echo $priceOfDayDetails[$tempKeyWeekDay][$tariffBreakDownNetOrGross . '_children']->format() ?>
					</span>
					<?php endif ?>
                </div>
			<?php endif;
		endfor;
		break;
endswitch;
?>

<table class="table table-bordered">
    <tr>
        <td><?php echo JText::_('SR_ROOM_X_COST') ?></td>
        <td class="sr-align-right">
			<?php
			if ($tariff['total_single_supplement'] != 0) :// We allow negative value for single supplement
				$shownTariffBeforeDiscounted->setValue($shownTariffBeforeDiscounted->getValue() - $tariff['total_single_supplement']);
			endif;
			echo $shownTariffBeforeDiscounted->format();
			?>
        </td>
    </tr>
	<?php if ($tariff['total_single_supplement'] != 0) : // We allow negative value for single supplement ?>
        <tr>
            <td><?php echo JText::_('SR_ROOM_X_SINGLE_SUPPLEMENT_AMOUNT') ?></td>
            <td class="sr-align-right"><?php echo $tariff['total_single_supplement_formatted']->format() ?></td>
        </tr>
	<?php endif;

	foreach ($extras as $extra) :
		$tempExtraCost = clone $solidresCurrency;
		$tempExtraCost->setValue($extra['total_extra_cost']);
		?>
        <tr>
            <td><?php echo $extra['name'] ?></td>
            <td class="sr-align-right"><?php echo $tempExtraCost->format() ?></td>
        </tr>
	<?php endforeach;

	if ($tariff['total_discount'] > 0) : ?>
        <tr>
            <td><?php echo JText::_('SR_ROOM_X_DISCOUNTED_AMOUNT') ?></td>
            <td class="sr-align-right"><?php echo $tariff['total_discount_formatted']->format() ?></td>
        <tr>
        <tr>
            <td><?php echo JText::_('SR_ROOM_X_DISCOUNTED_COST') ?></td>
            <td class="sr-align-right"><?php echo $tariff['total_price_tax_' . ($showTaxIncl == 1 ? 'incl' : 'excl') . '_discounted_formatted']->format() ?></td>
        </tr>
	<?php endif; ?>

</table>