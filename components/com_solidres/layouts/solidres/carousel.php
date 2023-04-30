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
 * /templates/TEMPLATENAME/html/layouts/com_solidres/solidres/carousel.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.12.1
 */

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

extract($displayData);

?>

<div id="<?php echo $id ?>" class="carousel slide <?php echo $class ?? '' ?>" data-bs-ride="carousel">
    <div class="carousel-inner">
    <?php
    $countItems = count($items);

    if (isset($itemLimit) && $countItems > $itemLimit) :
	    $countItems = $itemLimit;
    endif;

    for ($i = 0; $i < $countItems; $i++) :
        ?>
        <div class="<?php echo SR_UI_CAROUSEL_ITEM ?> <?php echo $i == 0 ? 'active' : '' ?>">
            <?php if (isset($linkItem) && $linkItem) : ?>
            <a class="sr-photo-<?php echo $objectId ?> <?php echo $linkClass ?? '' ?>"
               href="<?php echo $linkUrl ?? $solidresMedia->getMediaUrl($items[$i]->value); ?>"
               <?php echo $linkAttr ?? '' ?>
            >
            <?php endif ?>
                <img src="<?php echo isset($itemBaseUrl) ? $itemBaseUrl . '/' . $items[$i] :  $solidresMedia->getMediaUrl($items[$i]->value, 'roomtype_medium'); ?>"
                     alt="<?php echo $objectName ?>"/>

            <?php if (isset($linkItem) && $linkItem) : ?>
            </a>
            <?php endif ?>
        </div>
        <?php
    endfor; ?>
    </div>

    <?php if (isset($showIndicators) && $showIndicators) : ?>

    <div class="carousel-indicators">
	    <?php for ($i = 0, $n = count($items); $i < $n; $i++): ?>
        <button type="button" data-bs-target="#<?php echo $id ?>" data-bs-slide-to="<?php echo $i ?>" class="active" aria-current="true" aria-label="<?php echo $i ?>"></button>
	    <?php endfor; ?>
    </div>

    <?php endif ?>

    <?php if ($countItems > 1) : ?>
        <button class="carousel-control-prev" type="button" data-bs-target="#<?php echo $id ?>" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden"><?php echo Text::_('JPREVIOUS') ?></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#<?php echo $id ?>" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden"><?php echo Text::_('JNEXT') ?></span>
        </button>
    <?php endif; ?>
</div>