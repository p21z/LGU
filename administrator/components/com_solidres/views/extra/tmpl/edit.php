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
use Joomla\CMS\Router\Route;
use Joomla\CMS\Language\Text;

HTMLHelper::_('behavior.formvalidator');

JFactory::getDocument()->addScriptDeclaration('
	Joomla.submitbutton = function(task)
	{
		if (task == "extra.cancel" || document.formvalidator.isValid(document.getElementById("item-form")))
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
                <form action="<?php echo Route::_('index.php?option=com_solidres&view=extra&layout=edit&id=' . $this->form->getValue('id')) ?>" method="post"
                      name="adminForm" id="item-form" class="form-validate form-horizontal">
					<?php echo HTMLHelper::_(SR_UITAB . '.startTabSet', 'ExtraTab', array('active' => 'general', 'recall' => true)) ?>

					<?php echo HTMLHelper::_(SR_UITAB . '.addTab', 'ExtraTab', 'general', Text::_('SR_NEW_GENERAL_INFO', true)) ?>
					<?php echo $this->form->renderFieldset('general') ?>
					<?php echo HTMLHelper::_(SR_UITAB . '.endTab') ?>

					<?php echo HTMLHelper::_(SR_UITAB . '.addTab', 'ExtraTab', 'params', Text::_('JGLOBAL_FIELDSET_PUBLISHING', true)) ?>

					<?php foreach ($this->form->getFieldsets('params') as $name => $fieldSet): ?>
						<?php echo $this->form->renderFieldset($name); ?>
					<?php endforeach; ?>

                    <?php if (SRPlugin::isEnabled('advancedextra')): ?>
	                    <?php echo $this->form->renderField('enable_available_dates', 'params'); ?>
	                    <?php echo $this->form->renderField('available_dates', 'params'); ?>
                    <?php endif; ?>

					<?php echo HTMLHelper::_(SR_UITAB . '.endTab') ?>

					<?php echo HTMLHelper::_(SR_UITAB . '.endTabSet') ?>
                    <input type="hidden" name="task" value=""/>
					<?php echo HTMLHelper::_('form.token'); ?>
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
	
