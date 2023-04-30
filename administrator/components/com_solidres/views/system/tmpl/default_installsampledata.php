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

defined('_JEXEC') or die;

use Joomla\CMS\Language\Text;

?>
<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
    <div class="<?php echo SR_UI_GRID_COL_12 ?>">
        <h3>Sample data</h3>
        <div class="alert alert-block alert-warning">
			<?php if ($this->hasExistingData > 0) : ?>
                <p>Your Solidres tables already have data.</p>
			<?php else : ?>
                <h4><?php echo Text::_('SR_SYSTEM_INSTALL_SAMPLE_DATA_WARNING') ?></h4>
				<?php echo Text::_('SR_SYSTEM_INSTALL_SAMPLE_DATA_WARNING_MESSAGE') ?>
                <a href="<?php echo JRoute::_('index.php?option=com_solidres&task=system.installsampledata') ?>"
                   class="btn btn-large btn-info">
					<?php echo Text::_('SR_SYSTEM_INSTALL_SAMPLE_DATA_WARNING_BTN') ?>
                </a>
			<?php endif ?>
        </div>
    </div>
</div>
