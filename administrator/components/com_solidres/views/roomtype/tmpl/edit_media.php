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

$media = $this->form->getValue('media');
?>

<?php if (isset($media) && count($media) > 0) : ?>
    <div class="alert alert-info">
        <i class="icon-lamp"></i> <?php echo Text::_('SR_CHECK_SAVE_DELETE_INFO') ?>
    </div>
<?php else : ?>
    <div class="alert alert-info">
        <i class="icon-lamp"></i> <?php echo Text::_('SR_NO_MEDIA_FOUND') ?>
    </div>
<?php endif; ?>


<fieldset class="adminform" id="mediafset">
    <ul id="media-holder" class="media-container media-sortable">
		<?php
		if (isset($media)) :
			foreach ($media as $item) :
				?>
                <li data-order="<?php echo $item->weight ?>">
                    <input type="hidden" name="jform[mediaId][]" value="<?php echo $item->id ?>">
                    <img title="<?php echo $item->name ?>"
                         alt="<?php echo $item->name ?>"
                         id="sr_media_<?php echo $item->id ?>"
                         src="<?php echo $this->solidresMedia->getMediaUrl($item->value, 'roomtype_small') ?>"/>
					<?php echo $item->name ?>
                    <p>
                        <button type="button" class="btn-remove btn btn-danger btn-sm">
                            <i class="fa fa-trash"></i>
                        </button>
                    </p>
                </li>
			<?php
			endforeach;
		endif;
		?>
    </ul>
</fieldset>