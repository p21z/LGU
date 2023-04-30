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
 * Reservation Assets model
 *
 * @package       Solidres
 * @subpackage    ReservationAsset
 * @since         0.1.0
 */

use Joomla\Utilities\ArrayHelper;

class SolidresModelReservationAssets extends JModelList
{
	private static $propertiesCache = [];

	/**
	 * Constructor.
	 *
	 * @param    array    An optional associative array of configuration settings.
	 *
	 * @see        JController
	 * @since      1.6
	 */
	public function __construct($config = array())
	{
		if (empty($config['filter_fields']))
		{
			$config['filter_fields'] = array(
				'id', 'a.id',
				'name', 'a.name',
				'alias', 'a.alias',
				'checked_out', 'a.checked_out',
				'checked_out_time', 'a.checked_out_time',
				'state', 'a.state',
				'access', 'a.access', 'access_level',
				'created', 'a.created',
				'created_by', 'a.created_by',
				'ordering', 'a.ordering',
				'featured', 'a.featured',
				'language', 'a.language',
				'hits', 'a.hits',
				'category_name', 'category_name',
				'number_of_roomtype', 'number_of_roomtype',
				'country_name', 'country_name',
				'partner_id', 'a.partner_id',
				'city', 'a.city', 'city_listing',
				'tag',
			);
		}

		parent::__construct($config);
	}

	/**
	 * Method to auto-populate the model state.
	 *
	 * Note. Calling getState in this method will result in recursion.
	 *
	 * @since    1.6
	 */
	protected function populateState($ordering = 'a.name', $direction = 'asc')
	{
		// Initialise variables.
		$app = JFactory::getApplication();

		// Load the filter state.
		$search = $app->getUserStateFromRequest($this->context . '.filter.search', 'filter_search');
		$this->setState('filter.search', $search);

		$accessId = $app->getUserStateFromRequest($this->context . '.filter.access', 'filter_access', null, 'int');
		$this->setState('filter.access', $accessId);

		$published = $app->getUserStateFromRequest($this->context . '.filter.state', 'filter_state', '', 'string');
		$this->setState('filter.state', $published);

		$categoryId = $app->getUserStateFromRequest($this->context . '.filter.category_id', 'filter_category_id', '');
		$this->setState('filter.category_id', $categoryId);

		// Filter by city name, only for listing view (not for Hub search)
		$cityListing = $app->getUserStateFromRequest($this->context . '.filter.city_listing', 'filter_city_listing', '');
		$this->setState('filter.city_listing', $cityListing);

		$countryId = $app->getUserStateFromRequest($this->context . '.filter.country_id', 'filter_country_id', '');
		$this->setState('filter.country_id', $countryId);

		// Load the parameters.
		$params = JComponentHelper::getParams('com_solidres');
		$this->setState('params', $params);

		// Load the request parameters (for parameters set in menu type)
		$location = $app->input->getString('location');
		$this->setState('filter.city', $location);
		$categories = $app->input->getString('categories');
		$this->setState('filter.category_id', !empty($categories) ? array_map('intval', (is_array($categories) ? $categories : explode(',', $categories))) : '');
		$displayMode = $app->input->getString('mode');
		$this->setState('display.mode', $displayMode);

		// Determine what view we are in because this model is used from multiple views
		$displayView = $app->input->getString('view');
		$this->setState('display.view', $displayView);

		$tag = $app->input->get('filter_tag');
		$this->setState('filter.tag', $tag);

		// List state information.
		parent::populateState($ordering, $direction);
	}

	/**
	 * Build an SQL query to load the list data.
	 *
	 * @return    JDatabaseQuery
	 * @since    1.6
	 */
	public function getListQuery()
	{
		// Create a new query object.
		$db    = $this->getDbo();
		$query = $db->getQuery(true);
		$user  = JFactory::getUser();

		// Select the required fields from the table.
		$query->select(
			$this->getState(
				'list.select',
				'a.*'
			)
		);
		$query->from($db->quoteName('#__sr_reservation_assets') . ' AS a');

		$query->select('cat.title AS category_name');
		$query->join('LEFT', $db->quoteName('#__categories') . ' AS cat ON cat.id = a.category_id');
		$query->group('cat.title');

		$query->select('parent.title AS parent_category_title, parent.id AS parent_category_id,
								parent.created_user_id AS parent_category_uid, parent.level AS parent_category_level')
			->join('LEFT', $db->quoteName('#__categories') . ' AS parent ON parent.id = cat.parent_id');
		$query->group('parent.title');

		$query->select('COUNT(rt.id) AS number_of_roomtype');
		$query->join('LEFT', $db->quoteName('#__sr_room_types') . ' AS rt ON rt.reservation_asset_id = a.id');

		$query->select('cou.name AS country_name');
		$query->join('LEFT', $db->quoteName('#__sr_countries') . ' AS cou ON cou.id = a.country_id');
		$query->group('cou.name');

		$query->select('geostate.name AS geostate_name');
		$query->join('LEFT', $db->quoteName('#__sr_geo_states') . ' AS geostate ON geostate.id = a.geo_state_id');
		$query->group('geostate.name');

		// Join over the users for the checked out user.
		$query->select('uc.name AS editor');
		$query->join('LEFT', $db->quoteName('#__users') . ' AS uc ON uc.id=a.checked_out');
		$query->group('uc.name');

		// Join over the asset groups.
		$query->select('ag.title AS access_level');
		$query->join('LEFT', $db->quoteName('#__viewlevels') . ' AS ag ON ag.id = a.access');
		$query->group('ag.title');

		// Filter by access level.
		if ($access = $this->getState('filter.access'))
		{
			$groups = implode(',', $user->getAuthorisedViewLevels());
			$query->where('a.access IN (' . $groups . ')')
				->where('cat.access IN (' . $groups . ')');
		}

		// If loading from front end, make sure we only load asset belongs to current user
		$app        = JFactory::getApplication();
		$isFrontEnd = $app->isClient('site');
		$partnerId  = $this->getState('filter.partner_id');
		$origin     = $this->getState('origin', '');
		$hubSearch  = $isFrontEnd && $origin == 'hubsearch';

		if (($isFrontEnd && $origin != 'hubsearch')
			|| is_numeric($partnerId)
		)
		{
			$query->join('LEFT', $db->quoteName('#__sr_property_staff_xref', 'tbl_staff_xref') . ' ON tbl_staff_xref.property_id = a.id')
				->where('(a.partner_id = ' . (int) $partnerId . ' OR tbl_staff_xref.staff_id = ' . (int) $user->id . ')');
		}

		// Filter by published state
		$published = $this->getState('filter.state');
		if (is_numeric($published))
		{
			$query->where('a.state = ' . (int) $published);
		}
		else if ($published === '')
		{
			$query->where('(a.state IN (0, 1))');
		}

		// Filter by category, support multiple category filter
		$categoryIds = $this->getState('filter.category_id', []);
		if (!empty($categoryIds))
		{
			$categoryIds                   = (array) $categoryIds;
			$categoryTable                 = JTable::getInstance('Category');
			$whereClauseFilterByCategories = array();
			foreach ($categoryIds as $categoryId)
			{
				$categoryTable->load($categoryId);
				$whereClauseFilterByCategories[] = '(' .
					'cat.lft >= ' . (int) $categoryTable->lft . ' AND ' .
					'cat.rgt <= ' . (int) $categoryTable->rgt . ')';
			}
			$query->where('(' . implode(' OR ', $whereClauseFilterByCategories) . ')');
		}

		// Filter by facility, support multiple facility filter
		$facilityIds = $this->getState('filter.facility_id');
		if (!empty($facilityIds))
		{
			$facilityIds                   = (array) $facilityIds;
			$whereClauseFilterByFacilities = array();
			foreach ($facilityIds as $facilityId)
			{
				$whereClauseFilterByFacilities[] =
					'1 = (SELECT count(*) FROM ' . $db->quoteName('#__sr_facility_reservation_asset_xref') . '
           			WHERE facility_id = ' . (int) $facilityId . '  AND reservation_asset_id = a.id )';
			}
			$query->where('(' . implode(' AND ', $whereClauseFilterByFacilities) . ')');
		}

		// Filter by theme, support multiple theme filter
		$themeIds = $this->getState('filter.theme_id');
		if (!empty($themeIds))
		{
			$themeIds                  = (array) $themeIds;
			$whereClauseFilterByThemes = array();
			foreach ($themeIds as $themeId)
			{
				$whereClauseFilterByThemes[] =
					'1 = (SELECT count(*) FROM ' . $db->quoteName('#__sr_reservation_asset_theme_xref') . '
           			WHERE theme_id = ' . (int) $themeId . '  AND reservation_asset_id = a.id )';
			}
			$query->where('(' . implode(' AND ', $whereClauseFilterByThemes) . ')');
		}

		// Filter by country.
		$countryId = $this->getState('filter.country_id');
		if (is_numeric($countryId))
		{
			$query->where('a.country_id = ' . (int) $countryId);
		}

		// Filter by search in title
		$search = $this->getState('filter.search');
		if (!empty($search))
		{
			if (stripos($search, 'id:') === 0)
			{
				$query->where('a.id = ' . (int) substr($search, 3));
			}
			else
			{
				$search = $db->quote('%' . $db->escape($search, true) . '%');
				$query->where('(a.name LIKE ' . $search . ' OR a.alias LIKE ' . $search . ')');
			}
		}

		// Filter by city name
		$city      = $this->getState('filter.city', '');
		$universal = $this->getState('filter.universal', '');

		if (empty($city))
		{
			$city = $this->getState('filter.city_listing', '');
		}

		if (!empty($city))
		{
			$location = $db->quote('%' . trim($city) . '%');

			if ($hubSearch)
			{
				$query->leftJoin($db->quoteName('#__sr_countries', 'c') . ' ON c.id = a.country_id')
					->where('(a.city LIKE ' . $location . ' OR c.name LIKE ' . $location . ')');
			}
			else
			{
				$query->where('a.city LIKE ' . $location);
			}
		}
		elseif (!empty($universal) && $hubSearch)
		{
			$searchLabel = @json_decode(base64_decode($app->input->get('label', '', 'base64')), true);

			if (is_array($searchLabel))
			{
				if (!empty($searchLabel['address_1']))
				{
					$query->where('a.address_1 LIKE ' . $db->q('%' . $searchLabel['address_1'] . '%'));
				}

				if (!empty($searchLabel['address_2']))
				{
					$query->where('a.address_2 LIKE ' . $db->q('%' . $searchLabel['address_2'] . '%'));
				}

				if (!empty($searchLabel['city']))
				{
					$query->where('a.city LIKE ' . $db->q('%' . $searchLabel['city'] . '%'));
				}

				if (!empty($searchLabel['name']))
				{
					$query->where('a.name LIKE ' . $db->q('%' . $searchLabel['name'] . '%'));
				}
			}
			else
			{
				$universal = preg_replace('/\,+/', ',', $universal);
				$universal = array_unique(explode(',', $universal));
				$orWhere   = array();

				foreach ($universal as $text)
				{
					$text = trim($text);

					if (empty($text))
					{
						continue;
					}

					$text      = $db->q('%' . $text . '%');
					$orWhere[] = '(a.name LIKE ' . $text
						. ' OR a.address_1 LIKE ' . $text
						. ' OR a.address_2 LIKE ' . $text
						. ' OR a.city LIKE ' . $text . ')';
				}

				if ($orWhere)
				{
					$query->where(join(' OR ', $orWhere));
				}
			}
		}

		// Filter by asset name
		$assetName = $this->getState('filter.assetName', '');

		if (!empty($assetName))
		{
			$query->where('a.name LIKE ' . $db->quote('%' . $assetName . '%'));
		}

		// Filter by star
		$stars = $this->getState('filter.stars', '');
		if (!empty($stars))
		{
			$whereClauseFilterByStars = array();
			foreach ($stars as $star)
			{
				$whereClauseFilterByStars[] = 'a.rating = ' . $db->quote($star);
			}
			$query->where('(' . implode(' OR ', $whereClauseFilterByStars) . ')');
		}

		$query->group('a.id');

		// Add the list ordering clause.
		$orderCol  = $this->state->get('list.ordering', 'a.name');
		$orderDirn = $this->state->get('list.direction', 'ASC');

		if ($hubSearch)
		{
			if (!in_array($orderCol, array('a.ordering', 'a.name', 'a.rating', 'reviewScore', 'RAND()', 'a.distance_from_city_centre', 'distance')))
			{
				$orderCol = 'a.ordering';
			}

			if ($orderCol == 'distance')
			{
				$orderCol = 'a.distance_from_city_centre';
			}

			if (!in_array(strtolower($orderDirn), array('asc', 'desc')))
			{
				$orderDirn = 'asc';
			}
		}

		if (SRPlugin::isEnabled('feedback'))
		{
			$feedbackTypeId = (int) $this->getState('filter.feedback_type_id', 0);
			$reviews        = $this->getState('filter.reviews');

			if ($feedbackTypeId > 0 || $reviews)
			{
				$query->innerJoin($db->qn('#__sr_reservations', 'res') . ' ON res.reservation_asset_id = a.id')
					->innerJoin($db->qn('#__sr_feedbacks', 'fbk') . ' ON fbk.scope = 0 AND fbk.reservation_id = res.id AND fbk.state = 1');

				if ($feedbackTypeId > 0)
				{
					$query->innerJoin($db->qn('#__sr_feedback_attribute_xref', 'fbk_attr_xref') . ' ON fbk_attr_xref.feedback_id = fbk.id')
						->innerJoin($db->qn('#__sr_feedback_attribute_values', 'fbk_attr_val') . ' ON fbk_attr_val.id = fbk_attr_xref.feedback_attribute_value_id')
						->innerJoin($db->qn('#__sr_feedback_attributes', 'fbk_attr') . ' ON fbk_attr_val.attribute_id = fbk_attr.id')
						->where('fbk_attr.id = ' . $feedbackTypeId);
				}

				if (!empty($reviews))
				{
					settype($reviews, 'array');
					$minScore = 0;

					foreach ($reviews as $review)
					{
						if (strpos($review, '-') !== false)
						{
							$parts = explode('-', $review, 2);
							$min   = (float) $parts[0];

							if ($min > $minScore)
							{
								$minScore = $min;
							}
						}
					}

					if ($orderCol == 'reviewScore')
					{
						$orderCol  = 'AVG(fbkScore.score)';
						$orderDirn = 'desc';
					}

					$query->select('AVG(fbkScore.score) AS reviewScore')
						->innerJoin($db->qn('#__sr_feedback_scores', 'fbkScore') . ' ON fbkScore.feedback_id = fbk.id')
						->group('a.id')
						->having('AVG(fbkScore.score) >= ' . $minScore);
				}
			}
		}
		$query->order($db->escape($orderCol) . ' ' . $db->escape($orderDirn));
		$distance = $this->getState('filter.distance', '0-0');

		if (!empty($distance)
			&& $distance != '0-0'
			&& strpos($distance, '-') !== false)
		{
			list($from, $to) = explode('-', $distance, 2);
			$query->where('a.distance_from_city_centre BETWEEN ' . floatval($from) . ' AND ' . floatval($to));
		}

		// Filter by a single or group of tags.

		$tagId = $this->getState('filter.tag');

		if (is_numeric($tagId))
		{
			$tagIds = [(int) $tagId];
		}
		elseif (is_array($tagId))
		{
			$tagIds = ArrayHelper::arrayUnique(ArrayHelper::toInteger($tagId));
		}

		if (!empty($tagIds))
		{
			$subQuery = $db->getQuery(true)
				->select('tagmap.content_item_id')
				->from($db->quoteName('#__contentitem_tag_map', 'tagmap'))
				->where('tagmap.type_alias = ' . $db->quote('com_solidres.property'))
				->where('tagmap.tag_id IN (' . join(',', $tagIds) . ')')
				->group('tagmap.content_item_id')
				->having('COUNT(tagmap.tag_id) = ' . count($tagIds));
			$query->where('a.id IN (' . $subQuery->__toString() . ')');
		}

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
		$filterCategories = $this->getState('filter.category_id', array());
		$filterFacilities = $this->getState('filter.facility_id', array());
		$filterThemes     = $this->getState('filter.theme_id', array());
		$filterStars      = $this->getState('filter.stars', array());
		if (!empty($filterCategories) && is_array($filterCategories))
		{
			$id .= ':' . (implode('', $filterCategories));
		}

		if (!empty($filterFacilities))
		{
			$id .= ':' . (implode('', $filterFacilities));
		}

		if (!empty($filterThemes))
		{
			$id .= ':' . (implode('', $filterThemes));
		}

		if (!empty($filterStars))
		{
			$id .= ':' . (implode('', $filterStars));
		}

		$id .= ':' . $this->getState('filter.city');
		$id .= ':' . serialize($this->getState('filter.tag'));
		$id .= ':' . serialize($this->getState('filter.partner_id'));

		return parent::getStoreId($id);
	}

	/**
	 * Method to get an array of data items.
	 *
	 * @return  mixed  An array of data items on success, false on failure.
	 *
	 * @since   12.2
	 */
	public function getItems()
	{
		$items                 = parent::getItems();
		$checkin               = $this->getState('filter.checkin');
		$checkout              = $this->getState('filter.checkout');
		$displayView           = $this->getState('display.view');
		$ignoreHub             = $this->getState('hub.ignore', false);
		$solidresConfig        = JComponentHelper::getParams('com_solidres');
		$showUnavailableAssets = $solidresConfig->get('show_unavailable_assets', 0);

		// For front end
		if (SRPlugin::isEnabled('hub'))
		{
			$isFrontEnd = JFactory::getApplication()->isClient('site');
			if ($isFrontEnd && $displayView != 'reservationassets' && !$ignoreHub)
			{
				$modelReservationAsset = JModelLegacy::getInstance('ReservationAsset', 'SolidresModel', array('ignore_request' => true));
				if (!empty($checkin) && !empty($checkout))
				{
					$modelReservationAsset->setState('checkin', $checkin);
					$modelReservationAsset->setState('checkout', $checkout);
					$modelReservationAsset->setState('prices', $this->getState('filter.prices'));
					$modelReservationAsset->setState('show_price_with_tax', $this->getState('list.show_price_with_tax'));
					$modelReservationAsset->setState('origin', $this->getState('origin'));
					$modelReservationAsset->setState('room_opt', $this->getState('filter.room_opt'));
				}

				$results = array();

				if (!empty($items))
				{
					foreach ($items as $item)
					{
						$asset = null;

						if (!isset(self::$propertiesCache[$item->id]))
						{
							$modelReservationAsset->setState('reservationasset.id', $item->id);
							self::$propertiesCache[$item->id] = $modelReservationAsset->getItem();
						}

						$asset = self::$propertiesCache[$item->id];

						if ($showUnavailableAssets)
						{
							$results[$item->id] = $asset;
						}
						else if (isset($asset->roomTypes) && count($asset->roomTypes) > 0)
						{
							$results[$item->id] = $asset;
						}
					}
				}

				return $results;
			}
		}

		return $items;
	}

	public function getStart()
	{
		return $this->getState('list.start');
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
		$app = JFactory::getApplication();
		if ($app->isClient('administrator')
			||
			($app->isClient('site') && SRPlugin::isEnabled('hub') && 'reservationassets' == $app->input->getString('view', ''))
		)
		{
			return parent::getPagination();
		}
		else
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
			$page->setAdditionalUrlParam('task', 'hub.search');

			// Add the object to the internal cache.
			$this->cache[$store] = $page;

			return $this->cache[$store];
		}
	}

	public function getFilterForm($data = array(), $loadData = true)
	{
		if ($filterForm = parent::getFilterForm($data, $loadData))
		{
			if (!SRPlugin::isEnabled('hub')
				|| JFactory::getApplication()->isClient('site')
			)
			{
				$filterForm->removeField('partner_id', 'filter');
			}
		}

		return $filterForm;
	}
}
