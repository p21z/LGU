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
 * Extra model.
 *
 * @package       Solidres
 * @subpackage    Extra
 * @since         0.1.0
 */
class SolidresModelExtra extends JModelAdmin
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

		$this->event_after_delete  = 'onExtraAfterDelete';
		$this->event_after_save    = 'onExtraAfterSave';
		$this->event_before_delete = 'onExtraBeforeDelete';
		$this->event_before_save   = 'onExtraBeforeSave';
		$this->event_change_state  = 'onExtraChangeState';
	}

	protected function populateState()
	{
		$app = JFactory::getApplication();

		// Load state from the request.
		$pk = $app->input->getInt('id');
		$this->setState('extra.id', $pk);
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
	 * Prepare and sanitise the table prior to saving.
	 *
	 * @since    1.6
	 */
	protected function prepareTable($table)
	{
		$table->name = htmlspecialchars_decode($table->name, ENT_QUOTES);

		if (empty($table->id))
		{
			// Set ordering to the last item if not set
			if (empty($table->ordering))
			{
				$db    = JFactory::getDbo();
				$query = $db->getQuery(true);
				$query->clear();
				$query->select('MAX(ordering)')->from($db->quoteName('#__sr_extras'));
				$db->setQuery($query);
				$max = $db->loadResult();

				$table->ordering = $max + 1;
			}
		}

		// If tax_id is empty, then set it to null
		if ($table->tax_id === '')
		{
			$table->tax_id = null;
		}

		// If tax_id is empty, then set it to nulll
		if ($table->coupon_id === '')
		{
			$table->coupon_id = null;
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
	 * @param    type      The table type to instantiate
	 * @param    string    A prefix for the table class name. Optional.
	 * @param    array     Configuration array for model. Optional.
	 *
	 * @return    JTable    A database object
	 * @since    1.6
	 */
	public function getTable($type = 'Extra', $prefix = 'SolidresTable', $config = array())
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
		$form = $this->loadForm('com_solidres.extra', 'extra', array('control' => 'jform', 'load_data' => $loadData));

		if (empty($form))
		{
			return false;
		}

		return $form;
	}

	/**
	 * Method to save the form data.
	 *
	 * @param   array $data The form data.
	 *
	 * @return  boolean  True on success, False on error.
	 *
	 * @since   11.1
	 */
	public function save($data)
	{
		// Initialise variables;
		$table = $this->getTable();
		$key   = $table->getKeyName();
		$pk    = (!empty($data[$key])) ? $data[$key] : (int) $this->getState($this->getName() . '.id');
		$isNew = true;

		// Include the content plugins for the on save events.
		JPluginHelper::importPlugin('content');
		JPluginHelper::importPlugin('extension');

		// Allow an exception to be thrown.
		try
		{
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
			$result = JFactory::getApplication()->triggerEvent($this->event_before_save, array($this->option . '.' . $this->name, $data, &$table, $isNew));
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

			// Clean the cache.
			$this->cleanCache();

			// Trigger the onContentAfterSave event.
			JFactory::getApplication()->triggerEvent($this->event_after_save, array($this->option . '.' . $this->name, $data, &$table, $isNew));
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

	/**
	 * Method to get the data that should be injected in the form.
	 *
	 * @return    mixed    The data for the form.
	 * @since    1.6
	 */
	protected function loadFormData()
	{
		// Check the session for previously entered form data.
		$data = JFactory::getApplication()->getUserState('com_solidres.edit.extra.data', array());

		if (empty($data))
		{
			$data = $this->getItem();
		}

		return $data;
	}

	public function getItem($pk = null)
	{
		$item = parent::getItem($pk);

		if (isset($item->id))
		{
			$solidresConfig   = JComponentHelper::getParams('com_solidres');
			$numberOfDecimals = $solidresConfig->get('number_decimal_points', 2);
			$showTaxIncl      = $this->getState($this->getName() . '.show_price_with_tax', 0);
			$assetTable       = JTable::getInstance('ReservationAsset', 'SolidresTable');
			$taxTable         = JTable::getInstance('Tax', 'SolidresTable');
			$assetTable->load($item->reservation_asset_id);
			$solidresCurrency = new SRCurrency(0, $assetTable->currency_id);
			$taxTable->load($item->tax_id);
			$taxAmount      = 0;
			$taxAdultAmount = 0;
			$taxChildAmount = 0;
			$app            = JFactory::getApplication();
			$coupon         = $app->getUserState('com_solidres.reservation.process.coupon');
			$solidresCoupon = SRFactory::get('solidres.coupon.coupon');

			$item->price       = $itemPrice = round($item->price, $numberOfDecimals);
			$item->price_adult = $itemPriceAdult = round($item->price_adult, $numberOfDecimals);
			$item->price_child = $itemPriceChild = round($item->price_child, $numberOfDecimals);

			// Coupon calculation if available
			if (isset($coupon) && is_array($coupon) && $app->isClient('site'))
			{
				$isCouponApplicable = $solidresCoupon->isApplicable($coupon['coupon_id'], $item->id, 'extra');
				if ($isCouponApplicable)
				{
					if ($coupon['coupon_is_percent'] == 1)
					{
						$deductionAmountP = $item->price * ($coupon['coupon_amount'] / 100);
						$deductionAmountA = $item->price_adult * ($coupon['coupon_amount'] / 100);
						$deductionAmountC = $item->price_child * ($coupon['coupon_amount'] / 100);
					}
					else
					{
						$deductionAmountP = $deductionAmountA = $deductionAmountC = $coupon['coupon_amount'];
					}
					$item->price       -= $deductionAmountP;
					$item->price_adult -= $deductionAmountA;
					$item->price_child -= $deductionAmountC;
				}
			}

			if (!empty($taxTable->rate))
			{
				if (isset($item->price_includes_tax) && $item->price_includes_tax == 1)
				{
					$taxAmount      = $item->price - ($item->price / (1 + $taxTable->rate));
					$taxAdultAmount = $item->price_adult - ($item->price_adult / (1 + $taxTable->rate));
					$taxChildAmount = $item->price_child - ($item->price_child / (1 + $taxTable->rate));

					$itemPrice      -= $taxAmount;
					$itemPriceAdult -= $taxAdultAmount;
					$itemPriceChild -= $taxChildAmount;
				}
				else
				{
					$taxAmount      = $item->price * $taxTable->rate;
					$taxAdultAmount = $item->price_adult * $taxTable->rate;
					$taxChildAmount = $item->price_child * $taxTable->rate;
				}
			}

			// For charge type != per person
			$item->currencyTaxIncl = clone $solidresCurrency;
			$item->currencyTaxExcl = clone $solidresCurrency;
			$item->currencyTaxIncl->setValue($itemPrice + $taxAmount);
			$item->currencyTaxExcl->setValue($itemPrice);
			$item->price_tax_incl = $itemPrice + $taxAmount;
			$item->price_tax_excl = $itemPrice;

			// For adult
			$item->currencyAdultTaxIncl = clone $solidresCurrency;
			$item->currencyAdultTaxExcl = clone $solidresCurrency;
			$item->currencyAdultTaxIncl->setValue($itemPriceAdult + $taxAdultAmount);
			$item->currencyAdultTaxExcl->setValue($itemPriceAdult);
			$item->price_adult_tax_incl = $itemPriceAdult + $taxAdultAmount;
			$item->price_adult_tax_excl = $itemPriceAdult;

			// For child
			$item->currencyChildTaxIncl = clone $solidresCurrency;
			$item->currencyChildTaxExcl = clone $solidresCurrency;
			$item->currencyChildTaxIncl->setValue($itemPriceChild + $taxChildAmount);
			$item->currencyChildTaxExcl->setValue($itemPriceChild);
			$item->price_child_tax_incl = $itemPriceChild + $taxChildAmount;
			$item->price_child_tax_excl = $itemPriceChild;

			if ($showTaxIncl)
			{
				$item->currency      = $item->currencyTaxIncl;
				$item->currencyAdult = $item->currencyAdultTaxIncl;
				$item->currencyChild = $item->currencyChildTaxIncl;
			}
			else
			{
				$item->currency      = $item->currencyTaxExcl;
				$item->currencyAdult = $item->currencyAdultTaxExcl;
				$item->currencyChild = $item->currencyChildTaxExcl;
			}
		}

		return $item;
	}
}
