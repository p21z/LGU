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
$srMedia    = SRFactory::get('solidres.media.media');
$dateFormat = JComponentHelper::getParams('com_solidres')->get('date_format', 'd-m-Y');
?>
<div id="media-lib-wrap">
	<?php if (empty($displayData['items'])): ?>
        <div class="alert alert-warning">
			<?php echo JText::_('SR_SEARCH_FOUND_NOTHING'); ?>
        </div>
	<?php else: ?>
        <div class="media-lib-items grid">
			<?php foreach ($displayData['items'] as $item):
				$nameEscape = htmlspecialchars($item->name, ENT_COMPAT, 'UTF-8');
				$isImage = $srMedia->isImage($item->mime_type);
				$isDocument = $srMedia->isDocument($item->mime_type);
				$isVideo = $srMedia->isVideo($item->mime_type);

				if ($isImage || $isDocument || $isVideo):
					?>
                    <div class="media-lib-item" data-media-id="<?php echo $item->id; ?>"
                         data-media-value="<?php echo htmlspecialchars($item->value, ENT_COMPAT, 'UTF-8'); ?>">
						<?php if ($isImage): ?>
                            <img src="<?php echo $srMedia->getMediaUrl($item->value, 'asset_small'); ?>"
                                 id="sr_media_<?php echo $item->id; ?>"
                                 class="media-file"
                                 title="<?php echo $nameEscape; ?>"
                                 alt="<?php echo $nameEscape; ?>"/>
						<?php elseif ($isDocument): ?>
                            <img src="<?php echo SRURI_MEDIA . '/assets/images/document.png'; ?>"
                                 id="sr_media_<?php echo $item->id; ?>"
                                 class="media-file"
                                 title="<?php echo $nameEscape; ?>"
                                 alt="<?php echo $nameEscape; ?>"/>
						<?php else: ?>
                            <img src="<?php echo SRURI_MEDIA . '/assets/images/video.png'; ?>"
                                 id="sr_media_<?php echo $item->id; ?>"
                                 class="media-file"
                                 title="<?php echo $nameEscape; ?>"
                                 alt="<?php echo $nameEscape; ?>"/>
						<?php endif; ?>
                        <label>
                            <input class="media-checkbox" type="checkbox" name="media[]"
                                   value="<?php echo $item->id; ?>"/>
							<?php echo ucfirst($item->name); ?>
                        </label>
                    </div>
				<?php endif; ?>
			<?php endforeach; ?>
        </div>
	<?php endif; ?>
</div>