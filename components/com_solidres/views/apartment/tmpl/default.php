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
 * /templates/TEMPLATENAME/html/com_solidres/apartment/default.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.12.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Uri\Uri;
use Joomla\CMS\Factory as CMSFactory;

$url     = Uri::getInstance()->toString();
$address = $this->property->address_1 . ', ' .
	(!empty($this->property->city) ? $this->property->city . ', ' : '') .
	(!empty($this->property->geostate_code_2) ? $this->property->geostate_code_2 . ' ' : '') .
	(!empty($this->property->postcode) ? $this->property->postcode . ', ' : '') .
	$this->property->country_name;

?>

<div id="solidres" class="sr-apartment-container <?php echo SR_UI; ?>">
    <div class="booking-summary booking-summary-apartment p-1">
	        <?php if (!empty($this->checkin) && !empty($this->checkout)) : ?>
                <p class="<?php echo $this->item->roomsOccupancyOptionsCount > 0 ? 'dline' : 'sline' ?>">
                    <?php echo Text::sprintf('SR_BOOKING_SUMMARY_DATES', $this->checkinFormatted, $this->checkoutFormatted) ?>
                </p>
                <?php if ($this->item->roomsOccupancyOptionsCount > 0) : ?>
                    <p class="<?php echo $this->item->roomsOccupancyOptionsCount > 0 ? 'dline last' : 'sline' ?>">
                        <?php echo Text::sprintf('SR_BOOKING_SUMMARY_GUESTS', $this->item->roomsOccupancyOptionsAdults, $this->item->roomsOccupancyOptionsChildren) ?>
                    </p>
                <?php endif ?>
	        <?php endif ?>

            <div class="d-grid gap-2">
                <a href="javascript:void(0)" class="btn btn-secondary open-overlay-apartment"><?php echo Text::_('SR_RESERVE') ?> <!--<span class="overview-cost-grandtotal">0</span> <i class="fa fa-chevron-down"></i>--></a>
            </div>
    </div>

    <h1>
		<?php echo $this->escape($this->property->name); ?>
    </h1>

    <div class="sr-apartment-top-info">
        <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
            <div class="<?php echo SR_UI_GRID_COL_10; ?>">
                <p>
                    <?php if (isset($this->property->feedbacks)): ?>
                        <a href="#sr-apartment-review"><?php echo Text::sprintf('SR_APARTMENT_REVIEW_FORMAT', $this->property->reviewScores, $this->property->reviewCount); ?></a>
                    <?php endif; ?> -
                    <?php echo $address; ?>
                </p>
            </div>
            <div class="<?php echo SR_UI_GRID_COL_2; ?>">
	            <?php echo $this->events->afterDisplayAssetName; ?>
            </div>
        </div>
    </div>

	<?php if ($this->gallery): ?>
    <div class="sr-gallery">
        <?php echo $this->gallery; ?>
    </div>
	<?php endif; ?>

    <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
        <div class="<?php echo SR_UI_GRID_COL_8; ?>">
            <div class="sr-apartment-detail-container sr-flex-box">
                <?php if (!empty($this->roomType->roomtype_custom_fields['room_size'])): ?>
                    <div class="sr-apartment-detail">
                        <div class="sr-apartment-detail-label">
                            <i class="fa fa-home fa-2x"></i>
                            <br/><?php echo Text::_('SR_ROOM_SIZE'); ?>
                        </div>
                        <div class="sr-apartment-detail-value">
                            <?php echo SRUtilities::translateText($this->roomType->roomtype_custom_fields['room_size']); ?>
                        </div>
                    </div>
                <?php endif; ?>
                <div class="sr-apartment-detail">
                    <div class="sr-apartment-detail-label">
                        <i class="fa fa-bed fa-2x"></i>
                        <br/><?php echo Text::_('SR_BEDROOM'); ?>
                    </div>
                    <div class="sr-apartment-detail-value">
                        <?php echo $this->roomType->number_of_room; ?>
                    </div>
                </div>
                <?php if (!empty($this->roomType->occupancy_adult)): ?>
                    <div class="sr-apartment-detail">
                        <div class="sr-apartment-detail-label">
                            <i class="fa fa-users fa-2x"></i>
                            <br/><?php echo Text::_('SR_ADULTS'); ?>
                        </div>
                        <div class="sr-apartment-detail-value">
                            <?php echo $this->roomType->occupancy_adult; ?>
                        </div>
                    </div>
                <?php endif; ?>
                <?php if (!empty($this->roomType->occupancy_child)): ?>
                    <div class="sr-apartment-detail">
                        <div class="sr-apartment-detail-label">
                            <i class="fa fa-child fa-2x"></i>
                            <br/><?php echo Text::_('SR_CHILDREN'); ?>
                        </div>
                        <div class="sr-apartment-detail-value">
                            <?php echo $this->roomType->occupancy_child; ?>
                        </div>
                    </div>
                <?php endif; ?>
            </div>

            <?php if (!empty($this->property->description)) : ?>
            <h2 class="leader"><?php echo Text::_('SR_ABOUT_PROPERTY'); ?></h2>
            <?php
            $regex = '#<hr(.*)id="system-readmore"(.*)\/>#iU';
            $intro = $full = '';

            if (preg_match($regex, $this->property->description))
            {
	            list($intro, $full) = preg_split($regex, $this->property->description, 2);

	            echo $intro . '<a href="javascript:void(0)" data-toggle="modal" data-bs-toggle="modal" data-target="#property_desc" data-bs-target="#property_desc">' . Text::_('SR_READMORE') . '</a>';

	            echo HTMLHelper::_(
		            'bootstrap.renderModal',
		            'property_desc',
		            [
			            'title'  => Text::_('SR_ABOUT_THIS_SPACE'),
			            'footer' => '<button type="button" class="btn btn-secondary" data-dismiss="modal" data-bs-dismiss="modal" aria-hidden="true">'
				            . Text::_("JLIB_HTML_BEHAVIOR_CLOSE") . '</button>'
		            ],
		            $intro . $full
	            );
            }
            else
            {
                echo $this->property->description;
            }

            endif;
            ?>

	        <?php echo $this->loadTemplate('availability_calendar') ?>

            <?php echo $this->loadTemplate('amenities') ?>

	        <?php echo $this->loadTemplate('information') ?>

            <?php echo $this->loadTemplate('map') ?>

	        <?php echo $this->loadTemplate('feedback') ?>
        </div>
        <div class="<?php echo SR_UI_GRID_COL_4; ?>">
            <div class="sr-apartment-aside">
                <div class="sr-apartment-box">
                    <a id="book-form"></a>
                    <form enctype="multipart/form-data"
                          class="sr-apartment-form sr-reservation-form sr-validate"
                          action="<?php echo JUri::base() ?>index.php?option=com_solidres&task=reservation.process&step=room&format=json"
                          method="POST">
                        <h3 style="display: none"><?php echo Text::_('SR_YOUR_STAY') ?></h3>
                        <a href="javascript:void(0)" class="sr-close-overlay"><?php echo Text::_('SR_CLOSE') ?></a>
                        <?php
                        if (is_array($this->roomType->tariffs) && count($this->roomType->tariffs) > 0) :
                            if (count($this->roomType->tariffs) > 1) :
                        ?>
                        <select name="rate_plan_id" class="apartment-rateplan-picker form-select mb-3">
                            <?php
                            foreach ($this->roomType->tariffs as $ratePlan) :
                                echo '<option value="' . $ratePlan->id . '">' . $ratePlan->title . '</option>';
                            endforeach;
                            ?>
                        </select>
                        <?php
                            else :
                        ?>
                        <input type="hidden" class="apartment-rateplan-picker" value="<?php echo $this->roomType->tariffs[0]->id ?>" />
                        <?php
                            endif;
                        endif;
                        ?>
                        <div class="apartment-form-holder"></div>
                        <input type="hidden" name="jform[return]" value="<?php echo base64_encode($url); ?>"/>
                        <input type="hidden" name="jform[raid]" value="<?php echo $this->property->id ?>"/>
                        <input type="hidden" name="jform[next_step]" value="guestinfo"/>
                        <input type="hidden" name="jform[static]" value="1"/>
                        <input type="hidden" name="jform[Itemid]" value="<?php echo $this->menu->id ?>"/>
	                    <?php echo JHtml::_('form.token'); ?>
                    </form>
                </div>

	            <?php if (SRPlugin::isEnabled('user') && $this->showLoginBox && !$this->isAmending) : ?>
                <div class="sr-apartment-box">
                    <div class="sr-login-form">
                        <?php
                        if (!CMSFactory::getUser()->get('id')) :
                            echo $this->loadTemplate('login');
                        else:
                            echo $this->loadTemplate('userinfo');
                        endif;
                        ?>
                    </div>
                </div>
	            <?php endif; ?>

                <div class="sr-apartment-box">
                    <p>
						<?php echo Text::_('SR_TALK_TO_US_DESC'); ?>
                    </p>

                    <p>
                        <address>
                            <i class="fa fa-home"></i> <?php echo $address; ?>
                        </address>
                    </p>

					<?php if (!empty($this->property->phone)): ?>
                    <p>
                        <a href="tel:<?php echo $this->property->phone; ?>">
                            <i class="fa fa-phone"></i> <?php echo $this->property->phone; ?>
                        </a>
                    </p>
					<?php endif; ?>

					<?php if (!empty($this->property->fax)): ?>
                    <p>
                        <a>
                            <i class="fa fa-fax"></i> <?php echo $this->property->fax; ?>
                        </a>
                    </p>
					<?php endif; ?>

					<?php if (!empty($this->property->email)): ?>
                    <p>
                        <a href="mailto:<?php echo $this->property->email; ?>">
                            <i class="fa fa-envelope"></i> <?php echo $this->property->email; ?>
                        </a>
                    </p>
					<?php endif; ?>
                </div>
            </div>
        </div>
    </div>
</div>