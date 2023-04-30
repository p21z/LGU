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
 * Room model.
 *
 * @package       Solidres
 * @subpackage    Room
 * @since         0.3.0
 */
class SolidresModelRoom extends JModelAdmin
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

		$this->event_after_delete  = 'onRoomAfterDelete';
		$this->event_after_save    = 'onRoomAfterSave';
		$this->event_before_delete = 'onRoomBeforeDelete';
		$this->event_before_save   = 'onRoomBeforeSave';
		$this->event_change_state  = 'onRoomChangeState';
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

		if (JFactory::getApplication()->isClient('administrator'))
		{
			return parent::canDelete($record);
		}
		else
		{
			$tableRoomType = $this->getTable('RoomType');
			$tableRoomType->load($record->room_type_id);

			return SRUtilities::isAssetPartner($user->get('id'), $tableRoomType->reservation_asset_id);
		}
	}

	/**
	 * Prepare and sanitise the table prior to saving.
	 *
	 * @since    1.6
	 */
	protected function prepareTable($table)
	{
		$table->label = htmlspecialchars_decode($table->label, ENT_QUOTES);
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

		if (JFactory::getApplication()->isClient('administrator'))
		{
			return parent::canEditState($record);
		}
		else
		{
			$tableRoomType = $this->getTable('RoomType');
			$tableRoomType->load($record->room_type_id);

			return SRUtilities::isAssetPartner($user->get('id'), $tableRoomType->reservation_asset_id);
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
	public function getTable($type = 'Room', $prefix = 'SolidresTable', $config = array())
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
		$form = $this->loadForm('com_solidres.room', 'room', array('control' => 'jform', 'load_data' => $loadData));
		if (empty($form))
		{
			return false;
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
		$data = JFactory::getApplication()->getUserState('com_solidres.edit.room.data', array());

		if (empty($data))
		{
			$data = $this->getItem();
		}

		return $data;
	}
}