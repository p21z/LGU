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
$rootUrl    = JUri::root(true);
?>
<div id="media-lib-wrap">
	<?php if (empty($displayData['items'])): ?>
        <div class="alert alert-warning">
			<?php echo JText::_('SR_SEARCH_FOUND_NOTHING'); ?>
        </div>
	<?php else: ?>
        <div class="media-lib-items list">
            <table class="table table-bordered table-striped">
                <thead>
                <tr>
                    <th width="75">#</th>
                    <th><?php echo JText::_('SR_HEADING_NAME'); ?></th>
                    <th><?php echo JText::_('SR_HEADING_SIZE'); ?></th>
                    <th><?php echo JText::_('SR_HEADING_DIMENSION'); ?></th>
                    <th><?php echo JText::_('SR_HEADING_CREATED_AT'); ?></th>
                    <th width="1%"><?php echo JText::_('SR_HEADING_ID'); ?></th>
                </tr>
                </thead>
                <tbody>
				<?php foreach ($displayData['items'] as $item):
					$nameEscape = htmlspecialchars($item->name, ENT_COMPAT, 'UTF-8');
					$isImage = $srMedia->isImage($item->mime_type);
					$isDocument = $srMedia->isDocument($item->mime_type);
					$isVideo = $srMedia->isVideo($item->mime_type);
					$fileName = JPATH_ROOT . '/media/com_solidres/assets/images/system/' . $item->value;

					if ($isImage)
					{
						$info      = getimagesize($fileName);
						$dimension = $info[0] . 'x' . $info[1];
					}
					else
					{
						$dimension = '';
					}

					if ($isImage || $isDocument || $isVideo):
						?>
                        <tr>
                            <td>
								<?php if ($isImage): ?>
                                    <img src="<?php echo $srMedia->getMediaUrl($item->value, 'asset_small'); ?>"
                                         id="sr_media_<?php echo $item->id; ?>"
                                         class="media-file"
                                         title="<?php echo $nameEscape; ?>"
                                         alt="<?php echo $nameEscape; ?>"
                                         width="75"/>
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
                            </td>
                            <td>
                                <div class="media-lib-item" data-media-id="<?php echo $item->id; ?>"
                                     data-media-value="<?php echo htmlspecialchars($item->value, ENT_COMPAT, 'UTF-8'); ?>">
                                    <label>
                                        <input class="media-checkbox" type="checkbox" name="media[]"
                                               value="<?php echo $item->id; ?>"/>
										<?php echo ucfirst($item->name); ?>
                                    </label>
                                </div>
                            </td>
                            <td>
								<?php echo filesize($fileName); ?>
                            </td>
                            <td>
								<?php if ($dimension): ?>
									<?php echo $dimension; ?>
								<?php endif; ?>
                            </td>
                            <td>
								<?php echo JHtml::_('date', $item->created_date, $dateFormat); ?>
                            </td>
                            <td>
								<?php echo $item->id; ?>
                            </td>
                        </tr>
					<?php endif; ?>
				<?php endforeach; ?>
                </tbody>
            </table>
        </div>
	<?php endif; ?>
</div>