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
 * RoomType model
 *
 * @package       Solidres
 * @subpackage    RoomType
 * @since         0.1.0
 */
class SolidresModelRoomTypes extends JModelList
{
	protected $context = 'com_solidres.roomtypes';

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
		if (empty($config['filter_fields']))
		{
			$config['filter_fields'] = array(
				'id', 'r.id',
				'reservation_asset_id', 'r.reservation_asset_id',
				'number_of_room', 'number_of_room',
				'occupancy_adult', 'r.occupancy_adult',
				'occupancy_child', 'r.occupancy_child',
				'name', 'r.name',
				'state', 'r.state',
				'ordering', 'r.ordering',
				'reservationasset', 'reservationasset'
			);
		}

		parent::__construct($config);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @param $ordering
	 * @param $direction
	 *
	 * @since    1.6
	 */
	protected function populateState($ordering = 'r.name', $direction = 'asc')
	{
		$app = JFactory::getApplication();

		$search = $app->getUserStateFromRequest($this->context . '.filter.state', 'filter_search');
		$this->setState('filter.state', $search);

		$published = $app->getUserStateFromRequest($this->context . '.filter.published', 'filter_published', '', 'string');
		$this->setState('filter.published', $published);

		$reservationAssetId = $app->getUserStateFromRequest($this->context . '.filter.reservation_asset_id', 'filter_reservation_asset_id', '');
		$this->setState('filter.reservation_asset_id', $reservationAssetId);

		// Load the parameters.
		$params = JComponentHelper::getParams('com_solidres');
		$this->setState('params', $params);

		// List state information.
		parent::populateState($ordering, $direction);
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

		$query->select(
			$this->getState(
				'list.select',
				'r.*, asset.name AS reservationasset,' .
				'(SELECT COUNT(id) FROM #__sr_rooms AS room WHERE room.room_type_id = r.id ) as number_of_room' .
				(SRPlugin::isEnabled('complexTariff') ?
					', (SELECT COUNT(id) FROM #__sr_tariffs as tariff 
					WHERE tariff.room_type_id = r.id 
					AND tariff.valid_from <> ' . $db->quote('0000-00-0 00:00:00') . ' AND tariff.valid_from <> ' . $db->quote('0000-00-0 00:00:00') . ' ) as number_of_tariff'
					: '')
			)
		);

		$query->from($db->quoteName('#__sr_room_types') . ' AS r');
		$query->group('asset.name');

		// Join over the users for the checked out user.
		$query->select('uc.name AS editor');
		$query->join('LEFT', $db->quoteName('#__users') . ' AS uc ON uc.id= r.checked_out');
		$query->group('uc.name');

		$query->join('LEFT', $db->quoteName('#__sr_reservation_assets') . ' AS asset ON asset.id = r.reservation_asset_id');

		// Filter by published state
		$published = $this->getState('filter.state');
		if (is_numeric($published))
		{
			$query->where('r.state = ' . (int) $published);
		}
		else if ($published === '')
		{
			$query->where('(r.state IN (0, 1))');
		}

		// Filter by reservation asset.
		$reservationAssetId = $this->getState('filter.reservation_asset_id');

		if (is_numeric($reservationAssetId))
		{
			$query->where('r.reservation_asset_id = ' . (int) $reservationAssetId);
		}

		// If loading from front end, make sure we only load room types belongs to current user
		$isFrontEnd = JFactory::getApplication()->isClient('site');
		$isHubDashboard = $this->getState('filter.is_hub_dashboard', true);
		//$partnerId  = $this->getState('filter.partner_id', 0);

		if ($isHubDashboard && $isFrontEnd && ($partnerIds = SRUtilities::getPartnerIds()))
		{
			$query->join('INNER', $db->quoteName('#__sr_reservation_assets') . ' AS a ON r.reservation_asset_id = a.id AND a.state = 1 AND a.partner_id IN (' . join(',', $partnerIds) . ')');
		}

		if (SRPlugin::isEnabled('channelmanager'))
		{
			$plgChannelManager       = JPluginHelper::getPlugin('solidres', 'channelmanager');
			$plgChannelManagerParams = new Joomla\Registry\Registry($plgChannelManager->params);
			$provider                = $plgChannelManagerParams->get('provider', 'ma');
			$providers               = ['ma' => 'myallocator', 'hs' => 'hotelspider'];
			$query->select('f.field_value as channel_room_id');
			$query->join('LEFT', $db->quoteName('#__sr_room_type_fields') . ' AS f ON f.room_type_id = r.id AND f.field_key = ' . $db->quote($providers[$provider] . '.roomId'));
		}

		// Filter by search in title
		$search = $this->getState('filter.search');
		if (!empty($search))
		{
			if (stripos($search, 'id:') === 0)
			{
				$query->where('r.id = ' . (int) substr($search, 3));
			}
			else
			{
				$search       = $db->quote('%' . $db->escape($search, true) . '%');
				$searchString = 'r.name LIKE ' . $search . ' OR r.alias LIKE ' . $search;
				if (SRPlugin::isEnabled('channelmanager'))
				{
					$searchString .= ' OR f.field_value LIKE ' . $search;
				}
				$query->where($searchString);
			}
		}

		$query->group('r.id');

		// Add the list ordering clause.
		$orderCol  = $this->state->get('list.ordering', 'r.ordering');
		$orderDirn = $this->state->get('list.direction', 'ASC');

		$query->order($db->escape($orderCol) . ' ' . $db->escape($orderDirn));

		return $query;
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
		$id .= ':' . $this->getState('filter.state');
		$id .= ':' . $this->getState('filter.reservation_asset_id');
		$id .= ':' . $this->getState('filter.search');

		/*$id .= ':' . $this->getState('list.ordering');
		$id .= ':' . $this->getState('list.direction');*/

		return parent::getStoreId($id);
	}

	public function getStart()
	{
		return $this->getState('list.start');
	}
}
