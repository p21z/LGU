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
 * /templates/TEMPLATENAME/html/com_solidres/myprofile/edit.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Toolbar\Toolbar;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Router\Route;

HTMLHelper::_('behavior.formvalidator');
$displayData['customer_id'] = $this->form->getValue('id');

?>

<div id="solidres" class="<?php echo SR_UI ?>">
	<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<div class="<?php echo SR_UI_GRID_COL_12 ?>">
			<?php echo SRLayoutHelper::render('customer.navbar', $displayData); ?>
		</div>
	</div>

	<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<div class="<?php echo SR_UI_GRID_COL_12 ?>">
			<?php echo Toolbar::getInstance()->render(); ?>
		</div>
	</div>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<div id="sr_panel_right" class="sr_form_view <?php echo SR_UI_GRID_COL_12 ?>">
				<div class="sr-inner">
					<script type="text/javascript">
						Joomla.submitbutton = function(task)
						{
							if (task == 'myprofile.cancel' || document.formvalidator.isValid(document.getElementById('adminForm')))
							{
								Joomla.submitform(task);
							}
						}
					</script>
				<form enctype="multipart/form-data" action="<?php Route::_('index.php?option=com_solidres&task=myprofile.edit&id=' . $this->form->getValue('id'), false); ?>" method="post" name="adminForm" id="adminForm" class="form-validate form-horizontal">

					<?php echo JHtml::_('bootstrap.startTabSet', 'sr-profile', array('active' => 'general')) ?>

					<?php echo JHtml::_('bootstrap.addTab', 'sr-profile', 'general', JText::_('SR_NEW_GENERAL_INFO', true)) ?>
					<?php echo $this->loadTemplate('general') ?>
					<?php echo JHtml::_('bootstrap.endTab') ?>

					<?php echo JHtml::_('bootstrap.addTab', 'sr-profile', 'apiKeys', JText::_('SR_API_KEYS_LABEL', true)) ?>
					<?php foreach($this->form->getFieldset('api') as $field): ?>
						<?php echo $field->renderField(); ?>
					<?php endforeach; ?>
					<?php echo JHtml::_('bootstrap.endTab') ?>

					<?php echo JHtml::_('bootstrap.endTabSet') ?>

					<input type="hidden" name="task" value="" />
					<input type="hidden" name="return" value="<?php echo $this->returnPage; ?>" />
					<?php echo HTMLHelper::_('form.token'); ?>	
				</form>
			</div>
		</div>
	</div>
	<?php if ($this->showPoweredByLink) : ?>
	<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<div class="<?php echo SR_UI_GRID_COL_12 ?> powered">
			<p>Powered by <a href="https://www.solidres.com" target="_blank">Solidres</a></p>
		</div>
	</div>
	<?php endif ?>
</div>