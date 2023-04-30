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

/**
 * Customer list controller class (JSON format).
 *
 * @package     Solidres
 * @subpackage	Customer
 * @since		0.1.0
 */
class SolidresControllerCustomers extends JControllerAdmin
{
	/**
     * Method to find customers based on customer code or user name or email
     * Used with AJAX and JSON
     *
     * @return json object
     */
    public function find()
    {
		$searchTerm = JFactory::getApplication()->input->get('term', '', 'string');
		$db = JFactory::getDbo();
		$model = JModelLegacy::getInstance('Customers', 'SolidresModel', array('ignore_request' => true));
		$model->setState('list.select', 'a.id, u.id as user_id, CONCAT(u.name, " (", a.id, " - " , (CASE WHEN ' . $db->quoteName('g.name') . ' IS NOT NULL THEN '.$db->quoteName('g.name').' ELSE '.$db->quote(JText::_('SR_GENERAL_CUSTOMER_GROUP')).' END ), ") ") as label,
	                                        CONCAT(u.name, " (", a.id, " - " , (CASE WHEN ' . $db->quoteName('g.name') . ' IS NOT NULL THEN '.$db->quoteName('g.name').' ELSE '.$db->quote(JText::_('SR_GENERAL_CUSTOMER_GROUP')).' END ), ") ") as value');
		$model->setState('filter.searchterm', $searchTerm );

		echo json_encode($model->getItems());
    }
}