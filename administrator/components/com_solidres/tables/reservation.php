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
 * Reservation table
 *
 * @package       Solidres
 * @subpackage    Reservation
 * @since         0.1.0
 */
class SolidresTableReservation extends JTable
{
	function __construct(JDatabaseDriver $db)
	{
		parent::__construct('#__sr_reservations', 'id', $db);

		$this->setColumnAlias('published', 'state');
	}

	/**
	 * Method to perform sanity checks on the Table instance properties to ensure they are safe to store in the database.
	 *
	 * Child classes should override this method to make sure the data they are storing in the database is safe and as expected before storage.
	 *
	 * @return  boolean  True if the instance is sane and able to be stored in the database.
	 *
	 * @since   11.1
	 */
	public function check()
	{
		$context      = 'com_solidres.reservation.process';
		$hubDashboard = JFactory::getApplication()->getUserState($context . '.hub_dashboard', 0);

		if (!JFactory::getApplication()->isClient('site') || $hubDashboard)
		{
			return true;
		}

		$query = $this->_db->getQuery(true);

		$hashKeys = array(
			'payment_method_id',
			'coupon_id',
			'customer_title',
			'customer_firstname',
			'customer_middlename',
			'customer_lastname',
			'customer_email',
			'customer_phonenumber',
			'customer_mobilephone',
			'customer_company',
			'customer_address1',
			'customer_address2',
			'customer_city',
			'customer_zipcode',
			'customer_country_id',
			'customer_geo_state_id',
			'customer_vat_number',
			'customer_ip',
			'checkin',
			'checkout',
			'currency_id',
			'currency_code',
			'total_price',
			'total_price_tax_incl',
			'total_price_tax_excl',
			'total_extra_price',
			'total_extra_price_tax_incl',
			'total_extra_price_tax_excl',
			'total_discount',
			'note',
			'reservation_asset_id',
			'reservation_asset_name',
			'deposit_amount',
			'tax_amount',
			'booking_type',
			'total_single_supplement',
			'origin',
			'cm_id',
			'cm_channel_order_id'
		);

		$hashKeysFloat = array(
			'total_price',
			'total_price_tax_incl',
			'total_price_tax_excl',
			'total_extra_price',
			'total_extra_price_tax_incl',
			'total_extra_price_tax_excl',
			'total_discount',
			'deposit_amount',
			'tax_amount',
			'total_single_supplement'
		);

		$hashData = array();
		foreach ($hashKeys as $hashKey)
		{
			if (in_array($hashKey, $hashKeysFloat))
			{
				$hashData[] = floatval($this->$hashKey);
			}
			else
			{
				$hashData[] = $this->$hashKey;
			}
		}
		$thisHashString = $this->generateReservationHash($hashData);

		$query->select(implode(', ', $hashKeys))
			->from($this->_db->quoteName('#__sr_reservations'))
			->order('created_date DESC');

		$reservations = $this->_db->setQuery($query, 0, 5)->loadAssocList();

		foreach ($reservations as $reservation)
		{
			foreach ($reservation as $k => $v)
			{
				if (in_array($k, $hashKeysFloat))
				{
					$reservation[$k] = floatval($v);
				}
			}

			if ($thisHashString == $this->generateReservationHash(array_values($reservation)))
			{
				return false;
			}
		}

		return true;
	}

	private function generateReservationHash($data)
	{
		return md5(implode(':', $data));
	}

	/**
	 * Overload the store method
	 *
	 * @param    boolean $updateNulls Toggle whether null values should be updated.
	 *
	 * @return    boolean    True on success, false on failure.
	 * @since    1.6
	 */
	public function store($updateNulls = false)
	{
		$date    = JFactory::getDate();
		$user    = JFactory::getUser();
		$resCode = SRPlugin::isEnabled('rescode');
		$isNew   = empty($this->id);

		if (!$isNew)
		{
			$this->modified_date = $date->toSql();
			$this->modified_by   = $user->get('id');
		}
		else
		{
			if (!intval($this->created_date))
			{
				$this->created_date = $date->toSql();
			}
			if (empty($this->created_by))
			{
				$this->created_by = $user->get('id');
			}
		}

		if (empty($this->code))
		{
			// Make sure the code is not empty.
			$this->code = SRFactory::get('solidres.reservation.reservation')->getCode($this->created_date);
		}

		// Prepare some NULL value
		if (empty($this->coupon_id))
		{
			$this->coupon_id = null;
		}

		if (empty($this->customer_id))
		{
			$this->customer_id = null;
		}

		if (empty($this->accessed_date))
		{
			$this->accessed_date = '0000-00-00 00:00:00';
		}

		if (empty($this->customer_geo_state_id))
		{
			$this->customer_geo_state_id = null;
		}

		if (empty($this->tourist_tax_amount))
		{
			$this->tourist_tax_amount = null;
		}

		$this->checkin  = JFactory::getDate($this->checkin)->toSql();
		$this->checkout = JFactory::getDate($this->checkout)->toSql();

		if ($result = parent::store($updateNulls))
		{
			if ($resCode && $isNew)
			{
				JPluginHelper::importPlugin('solidres', 'rescode');
				JFactory::getApplication()->triggerEvent('onSolidresGenerateReservationCode', array($this, true));
			}
		}

		return $result;
	}

	/**
	 * Method to delete a row from the database table by primary key value.
	 *
	 * @param    mixed $pk An optional primary key value to delete.  If not set the
	 *                     instance property value is used.
	 *
	 * @return    boolean    True on success.
	 * @since    0.1.0
	 * @link     http://docs.joomla.org/JTable/delete
	 */
	public function delete($pk = null)
	{
		$query = $this->_db->getQuery(true);

		// Take care of relationship with Room in Reservation
		$query->select('id')->from($this->_db->quoteName('#__sr_reservation_room_xref'))->where('reservation_id = ' . $this->_db->quote($pk));
		$reservationRoomIds = $this->_db->setQuery($query)->loadColumn();
		$fieldEnabled       = SRPlugin::isEnabled('customfield');

		foreach ($reservationRoomIds as $reservationRoomId)
		{
			$query->clear();
			$query->delete($this->_db->quoteName('#__sr_reservation_room_details'))->where('reservation_room_id = ' . $this->_db->quote($reservationRoomId));
			$this->_db->setQuery($query)->execute();

			if ($fieldEnabled)
			{
				SRCustomFieldHelper::cleanValues(array('context' => 'com_solidres.room.' . $reservationRoomId));
			}
		}

		$query->clear();
		$query->delete($this->_db->quoteName('#__sr_reservation_room_xref'))->where('reservation_id = ' . $this->_db->quote($pk));
		$this->_db->setQuery($query)->execute();

		// Take care of relationship with Room and Extra in Reservation
		$query->clear();
		$query->delete($this->_db->quoteName('#__sr_reservation_room_extra_xref'))->where('reservation_id = ' . $this->_db->quote($pk));
		$this->_db->setQuery($query)->execute();

		// Take care of Reservation Notes
		$query->clear();
		$query->delete($this->_db->quoteName('#__sr_reservation_notes'))->where('reservation_id = ' . $this->_db->quote($pk));
		$this->_db->setQuery($query)->execute();

		// Take care of Reservation's Per booking extra items
		$query->clear();
		$query->delete($this->_db->quoteName('#__sr_reservation_extra_xref'))->where('reservation_id = ' . $this->_db->quote($pk));
		$this->_db->setQuery($query)->execute();

		// Take care of related Invoices
		if (SRPlugin::isEnabled('invoice'))
		{
			$query->clear();
			$query->delete($this->_db->quoteName('#__sr_invoices'))->where('reservation_id = ' . $this->_db->quote($pk));
			$this->_db->setQuery($query)->execute();
		}

		if (SRPlugin::isEnabled('feedback'))
		{
			JTable::addIncludePath(SR_PLUGIN_FEEDBACK_ADMINISTRATOR . '/tables');
			$tableFeedback = JTable::getInstance('Feedback', 'SolidresTable');
			if ($tableFeedback->load(array('reservation_id' => $pk)))
			{
				$fId = (int) $tableFeedback->get('id');
				$tableFeedback->delete($fId);
			}
		}

		if ($fieldEnabled)
		{
			SRCustomFieldHelper::cleanValues(array('context' => 'com_solidres.customer.' . $pk));
		}

		// Delete itself
		return parent::delete($pk);
	}

	public function recordAccess($pk)
	{
		$accessedDate = JFactory::getDate()->toSql();
		$query        = $this->_db->getQuery(true)
			->update($this->_tbl)
			->set($this->_db->quoteName($this->getColumnAlias('accessed_date')) . ' = ' . $this->_db->quote($accessedDate))
			->where($this->_db->quoteName('id') . ' = ' . (int) $pk);
		$this->_db->setQuery($query);
		$this->_db->execute();

		// Set table values in the object.
		$this->accessed_date = $accessedDate;

		return true;
	}

	/**
	 * Method to load a row from the database by primary key and bind the fields
	 * to the JTable instance properties.
	 *
	 * @param   mixed   $keys    An optional primary key value to load the row by, or an array of fields to match.  If not
	 *                           set the instance property value is used.
	 * @param   boolean $reset   True to reset the default values before loading the new row.
	 *
	 * @return  boolean  True if successful. False if row not found.
	 *
	 * @link    https://docs.joomla.org/JTable/load
	 * @since   11.1
	 * @throws  InvalidArgumentException
	 * @throws  RuntimeException
	 * @throws  UnexpectedValueException
	 */
	public function load($keys = null, $reset = true)
	{
		$result = parent::load($keys, $reset);

		if ($result && SRPlugin::isEnabled('channelmanager'))
		{
			JLoader::register('plgSolidresChannelManager', SRPATH_LIBRARY . '/channelmanager/channelmanager.php');

			if (isset(plgSolidresChannelManager::$channelKeyMapping[$this->cm_provider][$this->origin]))
			{
				$this->origin = plgSolidresChannelManager::$channelKeyMapping[$this->cm_provider][$this->origin];
			}
		}

		return $result;
	}

	/**
	 * Method to check a row out if the necessary properties/fields exist.
	 *
	 * To prevent race conditions while editing rows in a database, a row can be checked out if the fields 'checked_out' and 'checked_out_time'
	 * are available. While a row is checked out, any attempt to store the row by a user other than the one who checked the row out should be
	 * held until the row is checked in again.
	 *
	 * @param   integer  $userId  The Id of the user checking out the row.
	 * @param   mixed    $pk      An optional primary key value to check out.  If not set the instance property value is used.
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   1.7.0
	 * @throws  \UnexpectedValueException
	 */
	public function checkOut($userId, $pk = null)
	{
		$solidresConfig = \Joomla\CMS\Component\ComponentHelper::getParams('com_solidres');
		$customerUserGroups = $solidresConfig->get('customer_user_groups', 2);
		$currentUserGroups = \Joomla\CMS\User\UserHelper::getUserGroups($userId);
		$matchedGroups = array_intersect($currentUserGroups, $customerUserGroups);
		$isFrontEnd = \Joomla\CMS\Factory::getApplication()->isClient('site');

		// Disable the checkout feature for front end customer user groups
		if (count($matchedGroups) > 0 && $isFrontEnd)
		{
			return true;
		}
		else
		{
			return parent::checkOut($userId, $pk);
		}
	}
}

