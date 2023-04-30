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
 * Coupon model.
 *
 * @package       Solidres
 * @subpackage    Coupon
 * @since         0.1.0
 */
class SolidresModelCoupon extends JModelAdmin
{
	/**
	 * Constructor.
	 *
	 * @param    array An optional associative array of configuration settings.
	 *
	 * @see        JController
	 * @since      1.6
	 */
	public function __construct($config = array())
	{
		parent::__construct($config);


		$this->event_after_delete  = 'onCouponAfterDelete';
		$this->event_after_save    = 'onCouponAfterSave';
		$this->event_before_delete = 'onCouponBeforeDelete';
		$this->event_before_save   = 'onCouponBeforeSave';
		$this->event_change_state  = 'onCouponChangeState';
	}

	protected function populateState()
	{
		$app = JFactory::getApplication();

		// Load state from the request.
		$pk = $app->input->getInt('id');
		$this->setState('coupon.id', $pk);
	}

	protected function getAssetIds($couponId)
	{
		$db    = $this->getDbo();
		$query = $db->getQuery(true)
			->select('a.item_id')
			->from($db->qn('#__sr_coupon_item_xref', 'a'))
			->innerJoin($db->qn('#__sr_coupons', 'a2') . ' ON a2.id = a.coupon_id')
			->where('a2.scope = 0 AND a.coupon_id = ' . (int) $couponId);
		$db->setQuery($query);

		return $db->loadColumn();
	}

	/**
	 * Method to test whether a record can be deleted.
	 *
	 * @param    object    A record object.
	 *
	 * @return    boolean    True if allowed to delete the record. Defaults to the permission set in the component.
	 * @since    1.6
	 */
	protected function canDelete($record)
	{
		$user = JFactory::getUser();
		$app  = JFactory::getApplication();

		if ($app->isClient('site') && ($assetIds = $this->getAssetIds($record->id)))
		{
			$userId = $user->get('id');

			foreach ($assetIds as $assetId)
			{
				if (!SRUtilities::isAssetPartner($userId, $assetId))
				{
					return false;
				}
			}

			return true;
		}

		return parent::canDelete($record);
	}

	/**
	 * Method to test whether a record can be deleted.
	 *
	 * @param    object    A record object.
	 *
	 * @return    boolean    True if allowed to change the state of the record. Defaults to the permission set in the component.
	 * @since    1.6
	 */
	protected function canEditState($record)
	{
		$user = JFactory::getUser();
		$app  = JFactory::getApplication();

		if ($app->isClient('site') && ($assetIds = $this->getAssetIds($record->id)))
		{
			$userId = $user->get('id');

			foreach ($assetIds as $assetId)
			{
				if (!SRUtilities::isAssetPartner($userId, $assetId))
				{
					return false;
				}
			}

			return true;
		}

		return parent::canEditState($record);
	}

	/**
	 * Returns a reference to the a Table object, always creating it.
	 *
	 * @param    type    The table type to instantiate
	 * @param    string    A prefix for the table class name. Optional.
	 * @param    array    Configuration array for model. Optional.
	 *
	 * @return    JTable    A database object
	 * @since    1.6
	 */
	public function getTable($type = 'Coupon', $prefix = 'SolidresTable', $config = array())
	{
		return JTable::getInstance($type, $prefix, $config);
	}

	/**
	 * Method to get the record form.
	 *
	 * @param    array   $data     An optional array of data for the form to interogate.
	 * @param    boolean $loadData True if the form is to load its own data (default case), false if not.
	 *
	 * @return    JForm    A JForm object on success, false on failure
	 * @since    1.6
	 */
	public function getForm($data = array(), $loadData = true)
	{
		// Get the form.
		$form = $this->loadForm('com_solidres.coupon', 'coupon', array('control' => 'jform', 'load_data' => $loadData));
		if (empty($form))
		{
			return false;
		}

		return $form;
	}

	/**
	 * Method to get a single record.
	 *
	 * @param    integer    The id of the primary key.
	 *
	 * @return    mixed    Object on success, false on failure.
	 * @since    1.6
	 */
	public function getItem($pk = null)
	{
		$item = parent::getItem($pk);

		if ($item->id)
		{
			$config                   = JFactory::getConfig();
			$tzoffset                 = $config->get('offset');
			$item->valid_from         = JFactory::getDate($item->valid_from, $tzoffset)->toUnix();
			$item->valid_to           = JFactory::getDate($item->valid_to, $tzoffset)->toUnix();
			$item->valid_from_checkin = JFactory::getDate($item->valid_from_checkin, $tzoffset)->toUnix();
			$item->valid_to_checkin   = JFactory::getDate($item->valid_to_checkin, $tzoffset)->toUnix();

			$db    = JFactory::getDbo();
			$query = $db->getQuery(true)
				->select('a.item_id')
				->from($db->qn('#__sr_coupon_item_xref', 'a'))
				->innerJoin($db->qn('#__sr_coupons', 'a2') . ' ON a2.id = a.coupon_id')
				->where('a2.scope = 0 AND a.coupon_id = ' . (int) $item->id);
			$db->setQuery($query);

			if ($itemIds = $db->loadColumn())
			{
				$item->reservation_asset_id = $itemIds;
			}
			else
			{
				if (empty($item->reservation_asset_id))
				{
					$item->reservation_asset_id = array();
				}
				else
				{
					$item->reservation_asset_id = array($item->reservation_asset_id);
				}
			}
		}

		return $item;
	}

	/**
	 * Prepare and sanitise the table prior to saving.
	 *
	 * @since    1.6
	 */
	protected function prepareTable($table)
	{
		if ($table->customer_group_id === '' || $table->customer_group_id === 'NULL')
		{
			$table->customer_group_id = null;
		}

		if ($table->quantity === '')
		{
			$table->quantity = null;
		}
	}

	/**
	 * Method to get the data that should be injected in the form.
	 *
	 * @return    mixed    The data for the form.
	 * @since    1.6
	 */
	protected function loadFormData()
	{
		// Check the session for previously entered form data.
		$data = JFactory::getApplication()->getUserState('com_solidres.edit.coupon.data', array());

		if (empty($data))
		{
			$data = $this->getItem();
		}

		return $data;
	}

	/**
	 *
	 * This is just an overridden methods to let the model know that it need to update the NULL data
	 *
	 * Method to save the form data.
	 *
	 * @param   array $data The form data.
	 *
	 * @return  boolean  True on success, False on error.
	 *
	 * @since   12.2
	 */
	public function save($data)
	{
		$table = $this->getTable();
		$key   = $table->getKeyName();
		$pk    = (!empty($data[$key])) ? $data[$key] : (int) $this->getState($this->getName() . '.id');
		$isNew = true;

		// Include the content plugins for the on save events.
		JPluginHelper::importPlugin('content');

		// Allow an exception to be thrown.
		try
		{
			// Load the row if saving an existing record.
			if ($pk > 0)
			{
				$table->load($pk);
				$isNew = false;
			}

			$itemIds = array();

			if (!empty($data['reservation_asset_id']))
			{
				foreach ($data['reservation_asset_id'] as $itemId)
				{
					$itemId = (int) $itemId;

					if ($itemId > 0 && !in_array($itemId, $itemIds))
					{
						$itemIds[] = $itemId;
					}
				}
			}

			$data['reservation_asset_id'] = null;
			$db         = JFactory::getDbo();
			$isSite     = JFactory::getApplication()->isClient('site');
			$partnerIds = SRUtilities::getPartnerIds();

			if ($isSite && !$isNew && $partnerIds)
			{
				$query = $db->getQuery(true)
					->select('a.id')
					->from($db->quoteName('#__sr_coupons', 'a'))
					->join('INNER', $db->quoteName('#__sr_coupon_item_xref', 'a2') . ' ON a2.coupon_id = a.id')
					->join('INNER', $db->quoteName('#__sr_reservation_assets', 'a3') . ' ON a3.id = a2.item_id')
					->where('a.scope = 0 AND (a3.partner_id IS NULL OR a3.partner_id < 1 OR a3.partner_id NOT IN (' . join(',', $partnerIds) . '))');
				$notInIds = $db->setQuery($query)->loadColumn();

				if ($notInIds && in_array($pk, $notInIds))
				{
					$this->setError(JText::sprintf('SR_ERR_THE_COUPON_IS_NOT_YOUR_MSG_FORMAT', $data['coupon_code']));

					return false;
				}
			}

			// Bind the data.
			if (!$table->bind($data))
			{
				$this->setError($table->getError());

				return false;
			}

			// Prepare the row for saving
			$this->prepareTable($table);

			// Check the data.
			if (!$table->check())
			{
				$this->setError($table->getError());

				return false;
			}

			// Trigger the onContentBeforeSave event.
			$result = JFactory::getApplication()->triggerEvent($this->event_before_save, array($this->option . '.' . $this->name, $table, $isNew));
			if (in_array(false, $result, true))
			{
				$this->setError($table->getError());

				return false;
			}

			// Store the data.
			if (!$table->store(true))
			{
				$this->setError($table->getError());

				return false;
			}

			$couponId  = (int) $table->id;

			if ($isSite && $partnerIds)
			{
				$query = $db->getQuery(true)
					->select('a.item_id')
					->from($db->qn('#__sr_coupon_item_xref', 'a'))
					->innerJoin($db->qn('#__sr_coupons', 'a2') . ' ON a2.id = a.coupon_id')
					->innerJoin($db->qn('#__sr_reservation_assets', 'a3') . ' ON a3.id = a.item_id')
					->where('a2.scope = 0 AND a.coupon_id = ' . $couponId)
					->where('(a3.partner_id IS NULL OR a3.partner_id < 1 OR a3.partner_id NOT IN (' . join(',', $partnerIds) . '))');
				$db->setQuery($query);

				if ($prevItemIds = $db->loadColumn())
				{
					$itemIds = array_merge($prevItemIds, $itemIds);
					$itemIds = ArrayHelper::toInteger($itemIds);
					$itemIds = ArrayHelper::arrayUnique($itemIds);
				}
			}

			$query = $db->getQuery(true)
				->delete($db->qn('#__sr_coupon_item_xref'))
				->where($db->qn('coupon_id') . ' = ' . $couponId);
			$db->setQuery($query)
				->execute();

			if ($itemIds)
			{
				$query->clear()
					->insert($db->qn('#__sr_coupon_item_xref'))
					->columns($db->qn(array('coupon_id', 'item_id')));

				foreach ($itemIds as $itemId)
				{
					$query->values($couponId . ', ' . $itemId);
				}

				$db->setQuery($query)
					->execute();
			}

			// Clean the cache.
			$this->cleanCache();

			// Trigger the onContentAfterSave event.
			JFactory::getApplication()->triggerEvent($this->event_after_save, array($this->option . '.' . $this->name, $table, $isNew));
		}
		catch (Exception $e)
		{
			$this->setError($e->getMessage());

			return false;
		}

		$pkName = $table->getKeyName();

		if (isset($table->$pkName))
		{
			$this->setState($this->getName() . '.id', $table->$pkName);
		}
		$this->setState($this->getName() . '.new', $isNew);

		return true;
	}
}
