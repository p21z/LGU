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
 * Media model
 *
 * @package       Solidres
 * @subpackage    Media
 * @since         0.1.0
 */
class SolidresModelMediaList extends JModelList
{

	/**
	 * Constructor.
	 *
	 * @param    array $config An optional associative array of configuration settings.
	 *
	 * @see        JController
	 * @since      1.6
	 */
	public function __construct($config = array())
	{
		parent::__construct($config);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * This method should only be called once per instantiation and is designed
	 * to be called on the first call to the getState() method unless the model
	 * configuration flag to ignore the request is set.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @param   string $ordering  An optional ordering field.
	 * @param   string $direction An optional direction (asc|desc).
	 *
	 * @return  void
	 *
	 * @since   12.2
	 */
	protected function populateState($ordering = null, $direction = null)
	{
		$this->setState('list.limit', 50);
	}

	/**
	 * Method to get a store id based on the model configuration state.
	 *
	 * This is necessary because the model is used by the component and
	 * different modules that might need different sets of data or different
	 * ordering requirements.
	 *
	 * @param   string $id An identifier string to generate the store id.
	 *
	 * @return  string  A store id.
	 *
	 * @since   12.2
	 */
	protected function getStoreId($id = '')
	{
		// Add the list state to the store id.
		$id .= ':' . $this->getState('filter.reservation_asset_id');
		$id .= ':' . $this->getState('filter.room_type_id');
		$id .= ':' . $this->getState('filter.created_by');

		return parent::getStoreId($id);
	}

	/**
	 * Build an SQL query to load the list data.
	 *
	 * @return    JDatabaseQuery
	 * @since    1.6
	 */
	protected function getListQuery()
	{
		$db    = $this->getDbo();
		$query = $db->getQuery(true);
		$query->select($this->getState('list.select', 'a.*'))
			->from($db->quoteName('#__sr_media') . ' AS a');

		$search = $this->getState('filter.search');

		if (!empty($search))
		{
			if (stripos($search, 'id:') === 0)
			{
				$query->where('a.id = ' . (int) substr($search, 3));
			}
			else
			{
				$search = $db->q('%' . $db->escape($search, true) . '%');
				$query->where('(a.name LIKE ' . $search . ' OR a.value LIKE ' . $search . ')');
			}
		}

		$filterReservationAssetId = $this->getState('filter.reservation_asset_id', null);
		if (is_numeric($filterReservationAssetId))
		{
			$query->select('x1.weight as weight');
			$query->join('left', $db->quoteName('#__sr_media_reservation_assets_xref') . ' AS x1 ON a.id = x1.media_id');
			$query->where('x1.reservation_asset_id = ' . $db->quote($filterReservationAssetId));
			$order = 'x1.weight ASC';
		}

		$filterRoomTypeId = $this->getState('filter.room_type_id', null);
		if (is_numeric($filterRoomTypeId))
		{
			$query->select('x2.weight as weight');
			$query->join('left', $db->quoteName('#__sr_media_roomtype_xref') . ' AS x2 ON a.id = x2.media_id');
			$query->where('x2.room_type_id = ' . $db->quote($filterRoomTypeId));
			$order = 'x2.weight ASC';
		}

		// If loading from front end, make sure we only load asset belongs to current user
		$isFrontEnd = JFactory::getApplication()->isClient('site');
		$createdBy  = $this->getState('filter.created_by', 0);

		if ($isFrontEnd && $createdBy > 0)
		{
			$query->where('a.created_by = ' . (int) $createdBy);
		}

		if (empty($order))
		{
			$order = $this->getState('list.ordering', 'a.created_date') . ' ' . $this->getState('list.direction', 'DESC');
		}

		$query->order($order);

		return $query;
	}

	/**
	 * Method to get a JPagination object for the data set.
	 *
	 * @return  JPagination  A JPagination object for the data set.
	 *
	 * @since   12.2
	 */
	public function getPagination()
	{
		// Get a storage key.
		$store = $this->getStoreId('getPagination');
		JLoader::register('SRPagination', SRPATH_LIBRARY . '/pagination/pagination.php');

		// Try to load the data from internal storage.
		if (isset($this->cache[$store]))
		{
			return $this->cache[$store];
		}

		// Create the pagination object.
		$limit = (int) $this->getState('list.limit') - (int) $this->getState('list.links');
		$page  = new SRPagination($this->getTotal(), $this->getStart(), $limit);

		// Add the object to the internal cache.
		$this->cache[$store] = $page;

		return $this->cache[$store];
	}
}
