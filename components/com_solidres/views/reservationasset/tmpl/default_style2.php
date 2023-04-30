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
 * /templates/TEMPLATENAME/html/com_solidres/reservationasset/default_style2.php
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

?>
<div id="solidres" class="<?php echo SR_UI ?> reservation_asset_style <?php echo SR_LAYOUT_STYLE ?>">
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
                <p class="sr-align-center"><a href="javascript:void(0)"><span class="overview-cost-grandtotal">0</span> <i class="fa fa-chevron-down"></i></a></p>
            </div>
        </div>
	<?php endif ?>
    <div class="reservation_asset_item clearfix">
		<?php if ($this->item->params['only_show_reservation_form'] == 0) : ?>
            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_4 ?>">
                    <div class="asset-info">
                        <div class="asset-name">
                            <h1><?php echo $this->escape($this->item->name); ?></h1>
                        </div>
                        <div class="asset-rating">
							<?php echo str_repeat('<i class="rating fa fa-star"></i> ', $this->item->rating) ?>
                        </div>
                        <div class="asset-address_1">
                            <a class="show_map"
                               href="<?php echo Route::_('index.php?option=com_solidres&task=map.show&id=' . $this->item->id) ?>">
                                <i class="fa fa-map-marker"></i>
								<?php
								echo $this->item->address_1 . ', ' .
									(!empty($this->item->city) ? $this->item->city . ', ' : '') .
									(!empty($this->item->postcode) ? $this->item->postcode . ', ' : '') .
									$this->item->country_name
								?>
                            </a>
                        </div>

						<?php if (!empty($this->item->address_2)) : ?>
                            <div class="asset-address_2"><?php echo $this->item->address_2; ?></div>
						<?php endif ?>

                        <div class="asset-wish-list"><?php echo $this->events->afterDisplayAssetName; ?></div>

                        <div class="asset-call-action">
                            <a href="#book-form" class="btn btn-large btn-lg btn-block btn-primary" title="Reserve now">
								<?php echo Text::_('SR_BOOK_NOW'); ?>
                            </a>
                        </div>

                        <div class="asset-contact">
                            <p><i class="fa fa-envelope fa-fw" title="<?php echo Text::_('SR_EMAIL') ?>"></i> <a
                                        href="mailto:<?php echo $this->item->email; ?>"><?php echo $this->item->email; ?></a>
                            </p>

							<?php if (!empty($this->item->phone)) : ?>
                                <p><i class="fa fa-phone-square fa-fw"
                                      title="<?php echo Text::_('SR_PHONE') ?>"></i> <?php echo '<a href="tel:' . $this->item->phone . '">' . $this->item->phone . '</a>'; ?>
                                </p>
							<?php endif ?>

							<?php if (!empty($this->item->fax)) : ?>
                                <p><i class="fa fa-fax fa-fw"
                                      title="<?php echo Text::_('SR_FAX') ?>"></i> <?php echo $this->item->fax; ?></p>
							<?php endif ?>

							<?php if (!empty($this->item->website)) : ?>
                                <p><i class="fa fa-globe fa-fw" title="<?php echo Text::_('SR_WEBSITE') ?>"></i> <a
                                            href="<?php echo $this->item->website; ?>"
                                            target="_blank"><?php echo $this->item->website; ?></a></p>
							<?php endif ?>
                        </div>

                        <div class="asset-social clearfix">
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
					    </div>
                    </div>
                </div>
                <div class="<?php echo SR_UI_GRID_COL_8 ?>">
                    <div class="asset-gallery">
						<?php echo $this->defaultGallery; ?>
                    </div>
                </div>
            </div>

            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_12 ?>">
                    <div class="asset-tabs">
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
            </div>
		<?php endif ?>

		<?php echo $this->events->beforeDisplayAssetForm; ?>
		<?php if (SRPlugin::isEnabled('user') && $this->showLoginBox) : ?>
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
				<?php echo $this->loadTemplate('roomtype' . ((defined('SR_LAYOUT_STYLE') && SR_LAYOUT_STYLE != '') ? '_' . SR_LAYOUT_STYLE : '')); ?>
            </div>
        </div>

        <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
            <div class="<?php echo SR_UI_GRID_COL_12 ?>">
				<?php echo $this->loadTemplate('information'); ?>
            </div>
        </div>

		<?php echo $this->events->afterDisplayAssetForm; ?>
		<?php if ($this->showPoweredByLink) : ?>
            <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
                <div class="<?php echo SR_UI_GRID_COL_12 ?>">
                    <p class="powered">
                        Powered by <a target="_blank"
                                      title="Solidres - A hotel booking extension for Joomla & WordPress"
                                      href="https://www.solidres.com">Solidres</a>
                    </p>
                </div>
            </div>
		<?php endif ?>
    </div>
</div>