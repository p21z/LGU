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
 * /templates/TEMPLATENAME/html/com_solidres/customer/default.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

$uri = JUri::getInstance();
$config = JFactory::getConfig();
$tzoffset = $config->get('offset');
$timezone = new DateTimeZone($tzoffset);
$displayData['customer_id'] = $this->modelReservations->getState('filter.customer_id');
?>
<?php echo SRLayoutHelper::render('customer.navbar', $displayData); ?>

<form action="<?php echo JUri::getInstance()->toString() ?>" method="post" name="adminForm" id="adminForm">
	<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<div class="<?php echo SR_UI_GRID_COL_4 ?>">
			<select class="form-select" name="filter_state" onchange="document.getElementById('adminForm').submit()">
				<option value=""><?php echo JText::_('SR_CUSTOMER_DASHBOARD_FILTER_ALL_STATUSES') ?></option>
				<option <?php echo $this->modelReservations->getState('filter.state') == 4 ? 'selected' : '' ;?> value="4"><?php echo JText::_('SR_CUSTOMER_DASHBOARD_FILTER_CANCELLED_STATUSES') ?></option>
			</select>
		</div>
		<div class="<?php echo SR_UI_GRID_COL_4 ?>">
			<select class="form-select" name="filter_location" onchange="document.getElementById('adminForm').submit()">
				<option value=""><?php echo JText::_('SR_CUSTOMER_DASHBOARD_FILTER_ALL_CITIES') ?></option>
				<?php
				foreach ($this->filterLocations as $location) :
					$selected = '';
					if (strtolower($this->modelReservations->getState('filter.location')) == strtolower($location['city'])) :
						$selected = 'selected';
					endif;
				?>
				<option <?php echo $selected ?> value="<?php echo $location['city'] ?>"><?php echo $location['city'] ?></option>
				<?php
				endforeach;
				?>
			</select>
		</div>
		<div class="<?php echo SR_UI_GRID_COL_4 ?>">
			<select class="form-select" name="filter_reservation_asset_id" onchange="document.getElementById('adminForm').submit()">
				<option value=""><?php echo JText::_('SR_CUSTOMER_DASHBOARD_FILTER_ALL_ASSETS') ?></option>
				<?php
				foreach ($this->filterAssets as $asset) :
					$selected = '';
					if (strtolower($this->modelReservations->getState('filter.reservation_asset_id')) == strtolower($asset['id'])) :
						$selected = 'selected';
					endif;
					?>
					<option <?php echo $selected ?> value="<?php echo $asset['id'] ?>"><?php echo $asset['name'] ?></option>
				<?php
				endforeach;
				?>
			</select>
		</div>
	</div>
	<input type="hidden" name="filter_clear" value="0" />
</form>

<?php if ($this->unapprovedReservations > 0) : ?>
<div class="alert">
	<?php echo JText::plural('SR_UNDER_REVIEW_RESERVATION_WARNING', $this->unapprovedReservations) ?>
</div>
<?php endif ?>

<?php
if (!empty($this->reservations)) :
    $assets = array();
    $media = array();
	foreach ($this->reservations as $reservation) :

		if (!$reservation->is_approved) continue;

		// Caching is needed
		if (!isset($assets[$reservation->reservation_asset_id])) :
            $assetTable = JTable::getInstance('ReservationAsset', 'SolidresTable');
			$assetTable->load($reservation->reservation_asset_id);
			$assets[$reservation->reservation_asset_id] = $assetTable;

			$mediaListModel = JModelLegacy::getInstance('MediaList', 'SolidresModel', array('ignore_request' => true));
			$mediaListModel->setState('filter.reservation_asset_id', $reservation->reservation_asset_id);
			$mediaListModel->setState('filter.room_type_id', NULL);
			$media[$reservation->reservation_asset_id] = $mediaListModel->getItems();
        endif;
?>
<div class="<?php echo SR_UI_GRID_CONTAINER ?> reservation-row">
	<div class="<?php echo SR_UI_GRID_COL_3 ?>">
		<div class="inner-skip-right sr-align-center">
            <?php
            if (isset($media[$reservation->reservation_asset_id][0])) :
                $mediaItem = $media[$reservation->reservation_asset_id][0];
                ?>
			<img src="<?php echo SRURI_MEDIA.'/assets/images/system/thumbnails/1/'.$mediaItem->value; ?>" alt="<?php echo $reservation->reservation_asset_name ?>" />
            <?php endif ?>
		</div>
	</div>
	<div class="<?php echo SR_UI_GRID_COL_5 ?>">
		<div class="inner-skip-left">
			<h3>
				<a href="<?php echo JRoute::_('index.php?option=com_solidres&view=reservationasset&id=' . $reservation->reservation_asset_id)?>">
					<?php echo $reservation->reservation_asset_name ?>
				</a>

				<?php for ($i = 1; $i <= $assets[$reservation->reservation_asset_id]->rating; $i++) : ?>
					<i class="rating fa fa-star"></i>
				<?php endfor ?>
			</h3>

			<?php
			echo $assets[$reservation->reservation_asset_id]->address_1 .', '.
			     (!empty($assets[$reservation->reservation_asset_id]->postcode) ? $assets[$reservation->reservation_asset_id]->postcode.', ' : '').
			     (!empty($assets[$reservation->reservation_asset_id]->city) ? $assets[$reservation->reservation_asset_id]->city : '')//. $asset->country_name
			?>
			<a class="show_map" href="<?php echo JRoute::_('index.php?option=com_solidres&task=map.show&id='.$reservation->reservation_asset_id) ?>">
				<?php echo JText::_('SR_SHOW_MAP') ?>
			</a>

            <?php if ($reservation->state == $this->cancellationState) : ?>
            <p class="reservation-cancelled">
                <?php echo JText::_('SR_USER_DASHBOARD_CANCELLED_BOOKING') ?>
            </p>
            <?php endif ?>

			<p>
				<a class="btn btn-secondary btn-sm" href="<?php echo JRoute::_('index.php?option=com_solidres&task=myreservation.edit&Itemid='.$this->itemid.'&id='. $reservation->id.'&return='.base64_encode($uri))?>">
					<?php echo JText::sprintf('SR_MANAGE_BOOKING', $reservation->code) ?>
				</a>
			</p>
		</div>
	</div>
	<div class="<?php echo SR_UI_GRID_COL_4 ?> checkinout">
		<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
			<div class="<?php echo SR_UI_GRID_COL_6 ?>">
				<div class="inner">
					<span class="dayt">
					<?php echo JDate::getInstance($reservation->checkin, $timezone)->format('l', true) ?>
				</span>
				<span class="dayn">
					<?php echo JDate::getInstance($reservation->checkin, $timezone)->format('j', true) ?>
				</span>
				<span class="montht">
					<?php echo JDate::getInstance($reservation->checkin, $timezone)->format('F', true) ?>
				</span>
				<span class="yearn">
					<?php echo JDate::getInstance($reservation->checkin, $timezone)->format('Y', true) ?>
				</span>
				</div>
			</div>
			<div class="<?php echo SR_UI_GRID_COL_6 ?>">
				<div class="inner">
					<span class="dayt">
					<?php echo JDate::getInstance($reservation->checkout, $timezone)->format('l', true) ?>
				</span>
				<span class="dayn">
					<?php echo JDate::getInstance($reservation->checkout, $timezone)->format('j', true) ?>
				</span>
				<span class="montht">
					<?php echo JDate::getInstance($reservation->checkout, $timezone)->format('F', true) ?>
				</span>
				<span class="yearn">
					<?php echo JDate::getInstance($reservation->checkout, $timezone)->format('Y', true) ?>
				</span>
				</div>
			</div>
		</div>
	</div>
</div>
<?php
	endforeach;
endif;
?>

<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<?php echo $this->pagination->getListFooter(); ?>
</div>


