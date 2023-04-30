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

?>

<?php if (SRPlugin::isEnabled('hub')) : ?>
    <div id="facility-selection-holder">
		<?php echo $this->form->getInput('commission_rate_id'); ?>
    </div>
<?php endif ?>



