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

defined('_JEXEC') or die('Restricted access');

/**
 * Extras list controller class.
 *
 * @package       Solidres
 * @subpackage    Extra
 * @since         0.1.0
 */
class SolidresControllerExtras extends JControllerAdmin
{
	public function getModel($name = 'Extra', $prefix = 'SolidresModel', $config = array('ignore_request' => true))
	{
		return parent::getModel($name, $prefix, $config);
	}
}