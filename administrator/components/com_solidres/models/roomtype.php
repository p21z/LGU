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
 * RoomType model.
 *
 * @package       Solidres
 * @subpackage    RoomType
 * @since         0.1.0
 */
class SolidresModelRoomType extends JModelAdmin
{
	private static $propertiesCache = [];

	private static $taxesCache = [];

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

		$this->event_after_delete  = 'onRoomTypeAfterDelete';
		$this->event_after_save    = 'onRoomTypeAfterSave';
		$this->event_before_delete = 'onRoomTypeBeforeDelete';
		$this->event_before_save   = 'onRoomTypeBeforeSave';
		$this->event_change_state  = 'onRoomTypeChangeState';
	}

	protected function populateState()
	{
		$app = JFactory::getApplication();

		// Load state from the request.
		$pk = $app->input->getInt('id');
		$this->setState('roomtype.id', $pk);
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

		if ($app->isClient('administrator') || $app->input->get('api_request'))
		{
			return parent::canDelete($record);
		}
		else
		{
			return SRUtilities::isAssetPartner($user->get('id'), $record->reservation_asset_id);
		}
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

		if ($app->isClient('administrator') || $app->input->get('api_request'))
		{
			return parent::canEditState($record);
		}
		else
		{
			return SRUtilities::isAssetPartner($user->get('id'), $record->reservation_asset_id);
		}
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
	public function getTable($type = 'RoomType', $prefix = 'SolidresTable', $config = array())
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
		$form = $this->loadForm('com_solidres.roomtype', 'roomtype', array('control' => 'jform', 'load_data' => $loadData));
		if (empty($form))
		{
			return false;
		}

		// Determine correct permissions to check.
		if ($this->getState('roomtype.id'))
		{
			// Existing record. Can only edit in selected categories.
			$form->setFieldAttribute('reservation_asset_id', 'action', 'core.edit');
		}
		else
		{
			// New record. Can only create in selected categories.
			$form->setFieldAttribute('reservation_asset_id', 'action', 'core.create');
		}

		// When Complex Tariff plugin is in use, Standard rate will be optional
		if (SRPlugin::isEnabled('user') && SRPlugin::isEnabled('complextariff'))
		{
			$form->setFieldAttribute('default_tariff', 'required', false);
		}

		return $form;
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
		$data = JFactory::getApplication()->getUserState('com_solidres.edit.roomtype.data', array());

		if (empty($data))
		{
			$data = $this->getItem();

			$data->standard_tariff_title       = $data->default_tariff->title ?? '';
			$data->standard_tariff_description = $data->default_tariff->description ?? '';
		}

		// Get the dispatcher and load the users plugins.
		JPluginHelper::importPlugin('extension');
		JPluginHelper::importPlugin('solidres');

		// Trigger the data preparation event.
		JFactory::getApplication()->triggerEvent('onRoomTypePrepareData', array('com_solidres.roomtype', $data));

		return $data;
	}

	/**
	 * Method to allow derived classes to preprocess the form.
	 *
	 * @param   JForm  $form  A JForm object.
	 * @param   mixed  $data  The data expected for the form.
	 * @param   string $group The name of the plugin group to import (defaults to "content").
	 *
	 * @return  void
	 *
	 * @see     JFormField
	 * @since   12.2
	 * @throws  Exception if there is an error in the form event.
	 */
	protected function preprocessForm(\JForm $form, $data, $group = 'extension')
	{
		// Import the appropriate plugin group.
		JPluginHelper::importPlugin($group);
		JPluginHelper::importPlugin('solidres');

		// Trigger the form preparation event.
		JFactory::getApplication()->triggerEvent('onRoomTypePrepareForm', array($form, $data));
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
		$item             = parent::getItem($pk);
		$solidresConfig   = JComponentHelper::getParams('com_solidres');
		$showPriceWithTax = $solidresConfig->get('show_price_with_tax', 0);
		$numberOfDecimals = $solidresConfig->get('number_decimal_points', 2);

		if ($item->id)
		{
			$dbo       = JFactory::getDbo();
			$query     = $dbo->getQuery(true);
			$media     = JModelLegacy::getInstance('MediaList', 'SolidresModel', array('ignore_request' => true));
			$nullDate  = substr($dbo->getNullDate(), 0, 10);
			$minTariff = 0;

			if (!isset(self::$propertiesCache[$item->reservation_asset_id]))
			{
				$tableRA = JTable::getInstance('ReservationAsset', 'SolidresTable');
				$tableRA->load($item->reservation_asset_id);

				if (isset($tableRA->params) && is_string($tableRA->params))
				{
					$tableRA->params_decoded = json_decode($tableRA->params, true);
				}

				self::$propertiesCache[$item->reservation_asset_id] = $tableRA;
			}

			$solidresCurrency      = new SRCurrency(0, self::$propertiesCache[$item->reservation_asset_id]->currency_id);
			$assetPriceIncludesTax = self::$propertiesCache[$item->reservation_asset_id]->price_includes_tax;
			$item->currency_id     = self::$propertiesCache[$item->reservation_asset_id]->currency_id;
			$item->tax_id          = self::$propertiesCache[$item->reservation_asset_id]->tax_id;

			if (isset(self::$propertiesCache[$item->reservation_asset_id]->params_decoded))
			{
				$item->property_is_apartment = false;
				if (isset(self::$propertiesCache[$item->reservation_asset_id]->params_decoded['is_apartment']))
				{
					$item->property_is_apartment = (bool) self::$propertiesCache[$item->reservation_asset_id]->params_decoded['is_apartment'];
				}
			}

			// Get the advertised price for front end usage
			$advertisedPrice = $item->params['advertised_price'] ?? 0;
			$skipFindingMinTariff = false;
			if ($advertisedPrice > 0)
			{
				$skipFindingMinTariff = true;
				$minTariff = $advertisedPrice;
			}

			// Load the standard tariff
			$query->select('p.*, c.currency_code, c.currency_name');
			$query->from($dbo->quoteName('#__sr_tariffs') . ' as p');
			$query->join('left', $dbo->quoteName('#__sr_currencies') . ' as c ON c.id = p.currency_id');
			$query->where('room_type_id = ' . (empty($item->id) ? 0 : (int) $item->id));
			$query->where('valid_from = ' . $dbo->quote($nullDate));
			$query->where('valid_to = ' . $dbo->quote($nullDate));

			$item->default_tariff = $dbo->setQuery($query)->loadObject();

			if (isset($item->default_tariff))
			{
				$query->clear();
				$query->select('id, tariff_id, price, w_day, guest_type, from_age, to_age');
				$query->from($dbo->quoteName('#__sr_tariff_details'));
				$query->where('tariff_id = ' . (int) $item->default_tariff->id);
				$query->order('w_day ASC');
				$item->default_tariff->details = $dbo->setQuery($query)->loadObjectList();

				foreach ($item->default_tariff->details as $tariff)
				{
					if (!$skipFindingMinTariff)
					{
						if ($minTariff == 0) $minTariff = $tariff->price;
						if ($minTariff > $tariff->price) $minTariff = $tariff->price;
					}

					$tariff->price = round($tariff->price, $numberOfDecimals);
				}
			}

			$imposedTaxTypes = array();
			if (!empty($item->tax_id))
			{
				if (!isset(self::$taxesCache[$item->tax_id]))
				{
					$taxModel         = JModelLegacy::getInstance('Tax', 'SolidresModel', array('ignore_request' => true));
					self::$taxesCache[$item->tax_id] = $taxModel->getItem($item->tax_id);
				}

				$imposedTaxTypes[] = self::$taxesCache[$item->tax_id];
			}

			$taxAmount = 0;
			foreach ($imposedTaxTypes as $taxType)
			{
				if ($assetPriceIncludesTax == 0)
				{
					$taxAmount = $minTariff * $taxType->rate;
				}
				else
				{
					$taxAmount = $minTariff - ($minTariff / (1 + $taxType->rate));
					$minTariff -= $taxAmount;
				}
			}

			$solidresCurrency->setValue($showPriceWithTax ? ($minTariff + $taxAmount) : $minTariff);

			$item->minTariff = $solidresCurrency;

			$query->clear();
			$query->select('a.id, a.label');
			$query->from($dbo->quoteName('#__sr_rooms') . ' a');
			$query->where('room_type_id = ' . (empty($item->id) ? 0 : (int) $item->id));
			$dbo->setQuery($query);
			$item->roomList = $dbo->loadObjectList();

			// Load media
			$media->setState('filter.reservation_asset_id', null);
			$media->setState('filter.room_type_id', (int) $item->id);
			$item->media = $media->getItems();
		}

		return $item;
	}

	protected function prepareTable($table)
	{
		$date = JFactory::getDate();
		$user = JFactory::getUser();

		$table->name  = htmlspecialchars_decode($table->name, ENT_QUOTES);
		$table->alias = JApplicationHelper::stringURLSafe($table->alias);

		if (empty($table->alias))
		{
			$table->alias = JApplicationHelper::stringURLSafe($table->name);
		}

		if (empty($table->params))
		{
			$table->params = '';
		}

		if (empty($table->id))
		{
			$table->created_date = $date->toSql();

			// Set ordering to the last item if not set
			if (empty($table->ordering))
			{
				$db    = JFactory::getDbo();
				$query = $db->getQuery(true);
				$query->clear();
				$query->select('MAX(ordering)')->from($db->quoteName('#__sr_room_types'));
				$db->setQuery($query);
				$max = $db->loadResult();

				$table->ordering = $max + 1;
			}
		}
		else
		{
			$table->modified_date = $date->toSql();
			$table->modified_by   = $user->get('id');
		}
	}

	/**
	 * A protected method to get a set of ordering conditions.
	 *
	 * @param    object    A record object.
	 *
	 * @return    array    An array of conditions to add to add to ordering queries.
	 * @since    1.6
	 */
	protected function getReorderConditions($table = null)
	{
		$condition   = array();
		$condition[] = 'reservation_asset_id = ' . (int) $table->reservation_asset_id;

		return $condition;
	}

	/**
	 * Method to save the form data.
	 *
	 * @param    array    The form data.
	 *
	 * @return    boolean    True on success.
	 */
	public function save($data)
	{
		$table = $this->getTable();
		$pk    = (!empty($data['id'])) ? $data['id'] : (int) $this->getState($this->getName() . '.id');
		$isNew = true;

		// Include the content plugins for the on save events.
		JPluginHelper::importPlugin('extension');
		JPluginHelper::importPlugin('solidres');

		// Load the row if saving an existing record.
		if ($pk > 0)
		{
			$table->load($pk);
			$isNew = false;
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
		$result = JFactory::getApplication()->triggerEvent($this->event_before_save, array($data, $table, $isNew));
		if (in_array(false, $result, true))
		{
			$this->setError($table->getError());

			return false;
		}

		// Store the data.
		if (!$table->store())
		{
			$this->setError($table->getError());

			return false;
		}

		// Clean the cache.
		$cache = JFactory::getCache($this->option);
		$cache->clean();

		// Trigger the onContentAfterSave event.
		JFactory::getApplication()->triggerEvent($this->event_after_save, array($data, $table, $isNew));

		$pkName = $table->getKeyName();
		if (isset($table->$pkName))
		{
			$this->setState($this->getName() . '.id', $table->$pkName);
		}
		$this->setState($this->getName() . '.new', $isNew);

		return true;
	}

	/**
	 * Method to delete one or more records.
	 *
	 * @param   array &$pks An array of record primary keys.
	 *
	 * @return  boolean  True if successful, false if an error occurs.
	 *
	 * @since   12.2
	 */
	public function delete(&$pks)
	{
		JPluginHelper::importPlugin('solidres');

		return parent::delete($pks);
	}

	public function countRooms($id)
	{
		$dbo       = JFactory::getDbo();
		$query     = $dbo->getQuery(true);

		$query->select('COUNT(*)')
			->from($dbo->quoteName('#__sr_rooms'))
			->where('room_type_id = ' . $dbo->quote($id));

		return $dbo->setQuery($query)->loadResult();
	}
}
