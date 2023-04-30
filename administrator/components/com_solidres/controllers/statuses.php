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

class SolidresControllerStatuses extends JControllerAdmin
{
	protected $view_list = 'statuses';
	protected $view_item = 'status';

	public function getModel($name = 'Status', $prefix = 'SolidresModel', $config = array())
	{
		return parent::getModel($name, $prefix, $config);
	}
}