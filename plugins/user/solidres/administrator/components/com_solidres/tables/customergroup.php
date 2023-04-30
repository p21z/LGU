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

use Joomla\Utilities\ArrayHelper;

/**
 * Customer group table class
 *
 * @package     Solidres
 * @subpackage	CustomerGroup
 * @since		0.1.0
 */
class SolidresTableCustomerGroup extends JTable
{
	function __construct(JDatabaseDriver $db)
	{
		parent::__construct('#__sr_customer_groups', 'id', $db);

		$this->setColumnAlias('published', 'state');
	}

	/**
	 * Method to delete a row from the database table by primary key value.
	 *
	 * @param   mixed    $pk  An optional primary key value to delete.  If not set the
	 *                        instance property value is used.
	 *
	 * @return  boolean  True on success.
	 * @since   0.3.0
	 */
	public function delete($pk = null)
	{
		$k = $this->_tbl_key;
		$pk = (is_null($pk)) ? $this->$k : $pk;
		$query = $this->_db->getQuery(true);
		JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'UsersModel');

		// Take care of Customer records
		$query->select('COUNT(id)')->from($this->_db->quoteName('#__sr_customers'))->where('customer_group_id = ' . $pk);
		$this->_db->setQuery($query);
		$result = (int) $this->_db->loadResult();
		if($result > 0)
		{
			$e = new JException(JText::sprintf('SR_ERROR_CUSTOMER_GROUP_CONTAINS_CUSTOMER', $this->name));
			$this->setError($e);
			return false;
		}

		// Delete all prices
		$query->clear();
		$query->delete($this->_db->quoteName('#__sr_tariff_details'));
		$query->where('tariff_id IN (SELECT id FROM '.$this->_db->quoteName('#__sr_tariffs').' WHERE customer_group_id = ' . $this->_db->quote($pk) .')');
		$this->_db->setQuery($query)->execute();

		$query->clear();
		$query->delete($this->_db->quoteName('#__sr_tariffs'))->where('customer_group_id = ' . $this->_db->quote($pk));
		$this->_db->setQuery($query)->execute();

		// Take care of Coupon
		$couponsModel = JModelLegacy::getInstance('Coupons', 'SolidresModel', array('ignore_request' => true));
		$couponModel = JModelLegacy::getInstance('Coupon', 'SolidresModel', array('ignore_request' => true));
		$couponsModel->setState('filter.customer_group_id', $pk);
		$coupons = $couponsModel->getItems();

		foreach ($coupons as $coupon)
		{
			$couponModel->delete($coupon->id);
		}

		// Delete it
		return parent::delete($pk);
	}
}

