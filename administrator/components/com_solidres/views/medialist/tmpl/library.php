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

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Router\Route;

?>

<form action="<?php Route::_('index.php?option=com_solidres'); ?>" method="post" name="adminForm"
      id="medialibraryform">
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_6 ?>">
            <button id="media-library-delete" class="toolbar btn btn-outline-success" type="submit">
                <i class="fa fa-trash"></i>
				<?php echo Text::_('SR_MEDIA_DELETE_BTN'); ?>
            </button>
            <button id="media-library-insert" class="toolbar btn btn-outline-success">
                <i class="fa fa-plus"></i>
				<?php echo Text::_('SR_MEDIA_INSERT_BTN'); ?>
            </button>
            <button id="media-select-all" class="toolbar btn btn-outline-success" type="button">
                <i class="fa fa-check-square-o"></i>
				<?php echo Text::_('SR_MEDIA_SELECT_ALL_BTN'); ?>
            </button>
            <button id="media-deselect-all" class="toolbar btn btn-outline-success" type="button">
                <i class="fa fa-square-o"></i>
				<?php echo Text::_('SR_MEDIA_DESELECT_ALL_BTN'); ?>
            </button>
            <button id="media-upload" class="toolbar btn btn-info" type="button">
                <i class="fa fa-upload"></i>
				<?php echo Text::_('SR_SYSTEM_UPLOAD_FILE'); ?>
            </button>
            <button id="media-toggle" class="toolbar btn btn-outline-secondary" type="button"
                    data-view-mode="<?php echo $this->layoutId == 'solidres.media.list' ? 'list' : 'grid'; ?>">
				<?php if ($this->layoutId == 'solidres.media.list'): ?>
                    <i class="fa fa-th-large"></i>
				<?php else: ?>
                    <i class="fa fa-list"></i>
				<?php endif; ?>
            </button>
        </div>
        <div class="<?php echo SR_UI_GRID_COL_6 ?>">
            <div class="<?php echo SR_UI_INPUT_APPEND ?> pull-right">
                <input class="form-control" id="mediasearch" type="text" name="q" value="">
                <button class="btn btn-outline-success" type="submit"><?php echo Text::_('SR_SEARCH'); ?></button>
                <button class="btn btn-outline-success" type="reset"><?php echo Text::_('SR_RESET'); ?></button>
            </div>
        </div>
    </div>

    <div id="media-messsage"></div>

    <div id="sr-upload-content">
		<?php require_once __DIR__ . '/form.php'; ?>
    </div>

    <div class="pagination">
		<?php echo $this->pagination->getPagesLinks(); ?>
    </div>

    <div id="medialibrary" class="clearfix">
		<?php echo SRLayoutHelper::render($this->layoutId, array('items' => $this->items)); ?>
    </div>

    <input type="hidden" name="task" value="media.delete"/>
    <input type="hidden" name="format" value="json"/>
	<?php echo HTMLHelper::_('form.token'); ?>
</form>