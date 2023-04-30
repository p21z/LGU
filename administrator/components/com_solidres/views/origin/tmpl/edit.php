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
use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory as CMSFactory;

HTMLHelper::_('behavior.formvalidator');
HTMLHelper::_('behavior.keepalive');

CMSFactory::getDocument()->addScriptDeclaration('	
	Joomla.submitbutton = function(task)
	{
		if (task == "origin.cancel" ||  document.formvalidator.isValid(document.getElementById("item-form")))
		{			
			Joomla.submitform(task, document.getElementById("item-form"));
		}
	}
');

?>

<div id="solidres">
    <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
		<?php echo SolidresHelperSideNavigation::getSideNavigation($this->getName()); ?>
        <div id="sr_panel_right" class="sr_form_view <?php echo SR_UI_GRID_COL_10; ?>">
            <div class="sr-inner">
                <form action="<?php echo Route::_('index.php?option=com_solidres&view=origin&layout=edit&id=' . $this->form->getValue('id'), false); ?>"
                      method="post"
                      name="adminForm" id="item-form" class="form-validate form-horizontal">
					<?php echo $this->form->renderFieldset('general'); ?>
                    <input type="hidden" name="task" value=""/>
					<?php echo HTMLHelper::_('form.token'); ?>
                </form>
            </div>
        </div>
    </div>
	<?php if (ComponentHelper::getParams('com_solidres')->get('show_solidres_copyright')): ?>
        <div class="<?php echo SR_UI_GRID_CONTAINER; ?>">
            <div class="<?php echo SR_UI_GRID_COL_12; ?> powered">
                <p>Powered by <a href="https://www.solidres.com" target="_blank">Solidres</a></p>
            </div>
        </div>
	<?php endif; ?>
</div>