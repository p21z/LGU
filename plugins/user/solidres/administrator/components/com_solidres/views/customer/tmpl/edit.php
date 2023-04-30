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
use Joomla\CMS\Plugin\PluginHelper;

HTMLHelper::_('behavior.formvalidator');

JFactory::getDocument()->addScriptDeclaration('
	Joomla.submitbutton = function(task)
	{
		if (task == "customer.cancel" || document.formvalidator.isValid(document.getElementById("item-form")))
		{
			Joomla.submitform(task, document.getElementById("item-form"));
		}
	}
');

?>

<div id="solidres">
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<?php echo SolidresHelperSideNavigation::getSideNavigation($this->getName()); ?>
		<div id="sr_panel_right" class="sr_form_view <?php echo SR_UI_GRID_COL_10 ?>">
			<div class="sr-inner">
				<form enctype="multipart/form-data" action="<?php JRoute::_('index.php?option=com_solidres'); ?>"
                      method="post" name="adminForm" id="item-form" class="form-validate form-horizontal">

					<?php echo JHtml::_(SR_UITAB . '.startTabSet', 'sr-customer', array('active' => 'general', 'recall' => true)) ?>

					<?php echo JHtml::_(SR_UITAB . '.addTab', 'sr-customer', 'general', JText::_('SR_NEW_GENERAL_INFO', true)) ?>
					<?php echo $this->loadTemplate('general') ?>
					<?php echo JHtml::_(SR_UITAB . '.endTab') ?>

					<?php echo JHtml::_(SR_UITAB . '.addTab', 'sr-customer', 'api-keys', JText::_('SR_API_KEYS_LABEL', true)) ?>
                    <?php
                    $fieldSets = $this->form->getFieldsets();

                    foreach ($fieldSets as $name => $fieldSet) :
                        if ($name != 'api') continue;

                        if (!empty($fieldSet->description)) : ?>
                            <div class="tab-description alert alert-info">
                                <span class="icon-info-circle" aria-hidden="true"></span><span class="visually-hidden"><?php echo JText::_('INFO'); ?></span>
                                <?php echo JText::_($fieldSet->description); ?>
                            </div>
                        <?php endif ?>
					    <?php echo $this->form->renderFieldset($name); ?>
                    <?php endforeach; ?>


					<?php echo JHtml::_(SR_UITAB . '.endTab') ?>

                    <?php if (PluginHelper::isEnabled('solidrespayment', 'stripe')) : ?>

	                    <?php echo JHtml::_(SR_UITAB . '.addTab', 'sr-customer', 'customer-stripe', JText::_('SR_CUSTOMER_STRIPE_LABEL', true)) ?>
                        <?php echo $this->loadTemplate('stripe') ?>
	                    <?php echo JHtml::_(SR_UITAB . '.endTab') ?>

                    <?php endif ?>

					<?php echo JHtml::_(SR_UITAB . '.endTabSet') ?>

					<input type="hidden" name="task" value="" />
					<?php echo JHtml::_('form.token'); ?>
				</form>	
			</div>
		</div>
	</div>
	<div class="<?php echo SR_UI_GRID_CONTAINER ?>">
		<div class="<?php echo SR_UI_GRID_COL_12 ?> powered">
			<p>Powered by <a href="https://www.solidres.com" target="_blank">Solidres</a></p>
		</div>
	</div>
</div>
	