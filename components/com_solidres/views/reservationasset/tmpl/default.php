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
 * /templates/TEMPLATENAME/html/com_solidres/reservationasset/default.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Factory;

$menuId = '&Itemid=' . Factory::getApplication()->input->get('Itemid', '', 'uint');
?>
<div id="solidres" class="<?php echo SR_UI ?> reservation_asset_default <?php echo SR_LAYOUT_STYLE ?>">
    <?php if (!empty($this->checkin) && !empty($this->checkout)) : ?>
    <div class="booking-summary">
        <div class="fcol">
            <p class="<?php echo $this->item->roomsOccupancyOptionsCount > 0 ? 'dline' : 'sline' ?>">
                <?php echo Text::sprintf('SR_BOOKING_SUMMARY_DATES', $this->checkinFormatted, $this->checkoutFormatted) ?>
            </p>
	        <?php if ($this->item->roomsOccupancyOptionsCount > 0) : ?>
            <p class="<?php echo $this->item->roomsOccupancyOptionsCount > 0 ? 'dline last' : 'sline' ?>">
	            <?php echo Text::sprintf('SR_BOOKING_SUMMARY_GUESTS', $this->item->roomsOccupancyOptionsAdults, $this->item->roomsOccupancyOptionsChildren) ?>
            </p>
	        <?php endif ?>
        </div>
        <div class="scol">
            <p class="sr-align-center"><a href="javascript:void(0)" class="open-overlay"><span class="overview-cost-grandtotal">0</span> <i class="fa fa-chevron-down"></i></a></p>
        </div>
    </div>
    <?php endif ?>
    <div class="reservation_asset_item clearfix">
		<?php if ($this->item->params['only_show_reservation_form'] == 0 && !$this->isAmending) : ?>
            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_9 ?>">
                    <h1>
						<?php echo $this->escape($this->item->name) . ' '; ?>
						<?php
                        if ($this->item->rating > 0) :
                            echo '<span class="rating-wrapper">' . str_repeat('<i class="rating fa fa-star"></i> ', $this->item->rating) . '</span>';
                        endif;
                        ?>
                    </h1>
                </div>
                <div class="<?php echo SR_UI_GRID_COL_3 ?>">
					<?php echo $this->events->afterDisplayAssetName; ?>
                </div>
            </div>
            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_12 ?>">
					<span class="address_1 reservation_asset_subinfo">
					<?php
					echo $this->item->address_1 . ', ' .
						(!empty($this->item->city) ? $this->item->city . ', ' : '') .
						(!empty($this->item->geostate_code_2) ? $this->item->geostate_code_2 . ' ' : '') .
						(!empty($this->item->postcode) ? $this->item->postcode . ', ' : '') .
						$this->item->country_name
					?>
                        <a class="show_map"
                           href="<?php echo Route::_('index.php?option=com_solidres&task=map.show&id=' . $this->item->id . $menuId) ?>">
							<?php echo Text::_('SR_SHOW_MAP') ?>
						</a>
					</span>

					<?php if (!empty($this->item->address_2)) : ?>
                        <span class="address_2 reservation_asset_subinfo">
						<?php echo $this->item->address_2; ?>
					</span>
					<?php endif ?>

					<?php if (!empty($this->item->phone)) : ?>
                        <span class="phone reservation_asset_subinfo">
						<?php echo Text::_('SR_PHONE') . ': <a href="tel:' . $this->item->phone . '">' . $this->item->phone . '</a>'; ?>
					</span>
					<?php endif ?>

					<?php if (!empty($this->item->fax)) : ?>
                        <span class="fax reservation_asset_subinfo">
						<?php echo Text::_('SR_FAX') . ': ' . $this->item->fax; ?>
					</span>
					<?php endif ?>

                    <span class="social_network reservation_asset_subinfo clearfix">
						<?php
                        $socialNetworks = ['facebook', 'twitter', 'instagram', 'linkedin', 'pinterest', 'slideshare', 'vimeo', 'youtube'];
                        $socialIconsSuffixes = ['instagram' => ''];
                        $iconPrefix = SR_ISJ4 ? 'fab' : 'fa';

                        foreach ($socialNetworks as $socialNetwork) :
	                        if (!empty($this->item->reservationasset_extra_fields[$socialNetwork . '_link'])
		                        && $this->item->reservationasset_extra_fields[$socialNetwork . '_show'] == 1) :
                                echo '<a href="' . $this->item->reservationasset_extra_fields[$socialNetwork . '_link'] .'"
                                   target="_blank">
                                   <i class="' . $iconPrefix . ' fa-' . $socialNetwork . ($socialIconsSuffixes[$socialNetwork] ?? '-square') . '"></i> 
                                   </a>';
	                        endif;
                        endforeach;
						?>

					</span>
                </div>
            </div>

            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_12 ?>">
					<?php echo $this->defaultGallery; ?>
                </div>
            </div>

            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_12 ?>">
					<?php
					echo HTMLHelper::_(SR_UITAB . '.startTabSet', 'asset-info', ['active' => 'asset-desc', 'recall' => true]);

					if (!empty($this->item->description) || !empty($this->item->facilities)) :
						echo HTMLHelper::_(SR_UITAB . '.addTab', 'asset-info', 'asset-desc', Text::_('SR_DESCRIPTION', true));

						echo SRLayoutHelper::render('asset.description', [
							'property' => $this->item,
						]);

						echo HTMLHelper::_(SR_UITAB . '.endTab');
					endif;

					if (isset($this->item->feedbacks->render) && !empty($this->item->feedbacks->render)) :
						echo HTMLHelper::_(SR_UITAB . '.addTab', 'asset-info', 'asset-feedback', Text::_('SR_REVIEWS', true));
						echo $this->item->feedbacks->render;
						echo HTMLHelper::_(SR_UITAB . '.endTab');

						echo HTMLHelper::_(SR_UITAB . '.addTab', 'asset-info', 'asset-feedback-scores', Text::_('SR_FEEDBACK_SCORES', true));
						echo $this->item->feedbacks->scores;
						echo HTMLHelper::_(SR_UITAB . '.endTab');
					endif;

					echo HTMLHelper::_(SR_UITAB . '.endTabSet');
					?>
                </div>
            </div>

		<?php endif ?>

		<?php echo $this->events->beforeDisplayAssetForm; ?>
		<?php if (SRPlugin::isEnabled('user') && $this->showLoginBox && !$this->isAmending) : ?>
            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_12 ?>">
                    <div class="alert alert-info sr-login-form">
						<?php
						if (!Factory::getUser()->get('id')) :
							echo $this->loadTemplate('login');
						else:
							echo $this->loadTemplate('userinfo');
						endif;
						?>
                    </div>
                </div>
            </div>
		<?php endif; ?>

        <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
            <div class="<?php echo SR_UI_GRID_COL_12 ?>">
				<?php echo $this->loadTemplate('roomtype'); ?>
            </div>
        </div>

        <?php if (!$this->isAmending) : ?>
        <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
            <div class="<?php echo SR_UI_GRID_COL_12 ?>">
				<?php echo $this->loadTemplate('information'); ?>
            </div>
        </div>
        <?php endif ?>

		<?php echo $this->events->afterDisplayAssetForm; ?>
		<?php if ($this->showPoweredByLink) : ?>
            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_12 ?> powered">
                    <p>
                        Powered by <a target="_blank" title="Solidres - A hotel booking extension for Joomla"
                                      href="https://www.solidres.com">Solidres</a>
                    </p>
                </div>
            </div>
		<?php endif ?>
    </div>
</div>
