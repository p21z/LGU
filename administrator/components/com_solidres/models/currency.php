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
 * Currency model.
 *
 * @package       Solidres
 * @subpackage    Currency
 * @since         0.1.0
 */
class SolidresModelCurrency extends JModelAdmin
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

		$this->event_after_delete  = 'onCurrencyAfterDelete';
		$this->event_after_save    = 'onCurrencyAfterSave';
		$this->event_before_delete = 'onCurrencyBeforeDelete';
		$this->event_before_save   = 'onCurrencyBeforeSave';
		$this->event_change_state  = 'onCurrencyChangeState';
	}
	/**
	 * Returns a reference to the a Table object, always creating it.
	 *
	 * @param    string    The table type to instantiate
	 * @param    string    A prefix for the table class name. Optional.
	 * @param    array    Configuration array for model. Optional.
	 *
	 * @return    JTable    A database object
	 * @since    1.6
	 */
	public function getTable($type = 'Currency', $prefix = 'SolidresTable', $config = array())
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
		$form = $this->loadForm('com_solidres.currency', 'currency', array('control' => 'jform', 'load_data' => $loadData));

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
		$data = JFactory::getApplication()->getUserState('com_solidres.edit.currency.data', array());

		if (empty($data))
		{
			$data = $this->getItem();
		}

		return $data;
	}
}