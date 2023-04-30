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
 * Customer controller class.
 *
 * @package       Solidres
 * @subpackage    Customer
 * @since         0.1.0
 */
class SolidresControllerCustomer extends JControllerForm
{
	/**
	 * Method override to check if you can add a new record.
	 *
	 * @param    array $data An array of input data.
	 *
	 * @return    boolean
	 * @since    1.6
	 */
	protected function allowAdd($data = array())
	{
		// Initialise variables.
		$user       = JFactory::getUser();
		$categoryId = Joomla\Utilities\ArrayHelper::getValue($data, 'category_id', $this->input->getUint('filter_category_id'), 'int');
		$allow      = null;

		if ($categoryId)
		{
			// If the category has been passed in the data or URL check it.
			$allow = $user->authorise('core.create', 'com_solidres.category.' . $categoryId);
		}

		if ($allow === null)
		{
			// In the absense of better information, revert to the component permissions.
			return parent::allowAdd($data);
		}
		else
		{
			return $allow;
		}
	}

	/**
	 * Method to check if you can add a new record.
	 *
	 * @param    array  $data An array of input data.
	 * @param    string $key  The name of the key for the primary key.
	 *
	 * @return    boolean
	 * @since    1.6
	 */
	protected function allowEdit($data = array(), $key = 'id')
	{
		return parent::allowEdit($data, $key);
	}

	public function generateKeys()
	{
		$this->input->def('userGenerateKeys', true);
		$this->task = 'apply';

		return parent::save('id', 'id');
	}
}