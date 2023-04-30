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
 * /templates/TEMPLATENAME/html/com_solidres/apartment/default_amenities.php
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

?>
<div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
    <div class="<?php echo SR_UI_GRID_COL_12; ?>">
        <h2 class="leader"><?php echo Text::_('SR_AMENITIES'); ?></h2>

        <?php if (!empty($this->property->facilities)): ?>
            <?php echo SRLayoutHelper::render('facility.facility', ['facilities' => $this->property->facilities]); ?>
        <?php endif; ?>
        <?php if (!empty($this->roomType->facilities)): ?>
            <?php echo SRLayoutHelper::render('facility.facility', ['facilities' => $this->roomType->facilities]); ?>
        <?php endif; ?>

    </div>
</div>