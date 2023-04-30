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
 * Country model.
 *
 * @package       Solidres
 * @subpackage    Country
 * @since         0.1.0
 */
class SolidresModelCountry extends JModelAdmin
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

		$this->event_after_delete  = 'onCountryAfterDelete';
		$this->event_after_save    = 'onCountryAfterSave';
		$this->event_before_delete = 'onCountryBeforeDelete';
		$this->event_before_save   = 'onCountryBeforeSave';
		$this->event_change_state  = 'onCountryChangeState';
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
	public function getTable($type = 'Country', $prefix = 'SolidresTable', $config = array())
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
		$form = $this->loadForm('com_solidres.country', 'country', array('control' => 'jform', 'load_data' => $loadData));
		if (empty($form))
		{
			return false;
		}

		// Determine correct permissions to check.
		if ($this->getState('country.id'))
		{
			// Existing record. Can only edit in selected categories.
			$form->setFieldAttribute('catid', 'action', 'core.edit');
		}
		else
		{
			// New record. Can only create in selected categories.
			$form->setFieldAttribute('catid', 'action', 'core.create');
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
		$data = JFactory::getApplication()->getUserState('com_solidres.edit.country.data', array());

		if (empty($data))
		{
			$data = $this->getItem();
		}

		return $data;
	}

	/**
	 * Prepare and sanitise the table prior to saving.
	 *
	 * @since    1.6
	 */
	protected function prepareTable($table)
	{
		$date = JFactory::getDate();
		$user = JFactory::getUser();

		$table->name          = htmlspecialchars_decode($table->name, ENT_QUOTES);
		$table->modified_date = $date->toSql();
		$table->modified_by   = $user->get('id');
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
		$condition[] = 'catid = ' . (int) $table->catid;

		return $condition;
	}
}