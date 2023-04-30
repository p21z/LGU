<?php
/*------------------------------------------------------------------------
  Solidres - Hotel booking extension for Joomla
  ------------------------------------------------------------------------
  @Author    Solidres Team
  @Website   http://www.solidres.com
  @Copyright Copyright (C) 2013 - 2016 Solidres. All Rights Reserved.
  @License   GNU General Public License version 3, or later
------------------------------------------------------------------------*/
defined('_JEXEC') or die;

$solidresMedia = SRFactory::get('solidres.media.media');

?>
<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
	<?php if (!empty($displayData['media'])) : ?>
		<div class="main-photo <?php echo SR_UI_GRID_COL_5 ?>">
			<a class="sr-photo"
			   href="<?php echo $solidresMedia->getMediaUrl( $displayData['media'][0]->value ); ?>">
				<img src="<?php echo $solidresMedia->getMediaUrl( $displayData['media'][0]->value, 'asset_medium' ); ?>"
					alt="<?php echo $displayData['alt_attr'] ?>" />
			</a>
		</div>
	<?php endif; ?>

	<div class="other-photos clearfix <?php echo SR_UI_GRID_COL_7 ?>">
		<?php foreach ($displayData['media'] as $media) : ?>
			<a class="sr-photo" href="<?php echo $solidresMedia->getMediaUrl( $media->value ); ?>">
				<img class="photo"
				     src="<?php echo $solidresMedia->getMediaUrl( $media->value, 'asset_small' ); ?>"
				     alt="<?php echo $displayData['alt_attr'] ?>" />
			</a>
		<?php endforeach; ?>
	</div>
</div>