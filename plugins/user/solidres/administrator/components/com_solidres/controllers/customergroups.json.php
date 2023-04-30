<?php
/**
------------------------------------------------------------------------
SOLIDRES - Accommodation booking extension for Joomla
------------------------------------------------------------------------
 * @author    Solidres Team <contact@solidres.com>
 * @website   https://www.solidres.com
 * @copyright Copyright (C) 2013 - 2020 Solidres. All Rights Reserved.
 * @license   GNU General Public License version 3, or later
------------------------------------------------------------------------
 */

defined('_JEXEC') or die;

/**
 * Customer group list controller class (JSON format).
 *
 * @package     Solidres
 * @subpackage	CustomerGroup
 * @since		0.5.0
 */
class SolidresControllerCustomerGroups extends JControllerLegacy
{
	/**
	 * Method to find customers based on customer code
	 * Used with AJAX and JSON
	 *
	 * @return json object
	 */
	public function getList()
	{
		// TODO at this moment it is no possible to do the UNION with query builder therefore we have to use
		// plain SQL instead
		// https://github.com/joomla/joomla-cms/pull/2735 This pull need to be merged in order to fix this one nicely
		$dbo = JFactory::getDbo();
		$query = "SELECT '' as id, '".JText::_('SR_TARIFF_CUSTOMER_GROUP_GENERAL')."' as name";
		$query .= " UNION ";
		$query .= "SELECT id, name FROM #__sr_customer_groups";
		$results = $dbo->setQuery($query)->loadObjectList();

		echo json_encode($results);
		JFactory::getApplication()->close();
	}
}