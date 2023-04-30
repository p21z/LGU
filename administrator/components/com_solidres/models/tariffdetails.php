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
 * Tariff model
 *
 * @package       Solidres
 * @subpackage    TariffDetails
 * @since         0.1.0
 */
class SolidresModelTariffDetails extends JModelList
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
	 * Method to get a store id based on the model configuration state.
	 *
	 * This is necessary because the model is used by the component and
	 * different modules that might need different sets of data or different
	 * ordering requirements.
	 *
	 * Override the default function since we need to generate different store id for
	 * different data set depended on room type id
	 *
	 * @see     \components\com_solidres\models\reservation.php (181 ~ 186)
	 *
	 * @param   string $id An identifier string to generate the store id.
	 *
	 * @return  string  A store id.
	 *
	 * @since   11.1
	 */
	protected function getStoreId($id = '')
	{
		// Add the list state to the store id.
		$tariffId   = $this->getState('filter.tariff_id', null);
		$guestType  = $this->getState('filter.guest_type', null);
		$tariffMode = $this->getState('filter.tariff_mode', 0);

		if (isset($tariffId))
		{
			$id .= ':' . $tariffId;
		}

		if (isset($guestType))
		{
			$id .= ':' . $guestType;
		}

		if (isset($tariffMode))
		{
			$id .= ':' . $tariffMode;
		}

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
		$dbo              = $this->getDbo();
		$query            = $dbo->getQuery(true);
		$solidresConfig   = JComponentHelper::getParams('com_solidres');
		$numberOfDecimals = $solidresConfig->get('number_decimal_points', 2);

		$query->select($this->getState('list.select', 't.id, t.tariff_id, ROUND(t.price, ' . $numberOfDecimals . ') AS price, ROUND(t.price_extras, ' . $numberOfDecimals . ') AS price_extras, t.w_day, t.guest_type, t.from_age, t.to_age, t.date, t.min_los, t.max_los, t.d_interval, t.limit_checkin'));
		$query->from($dbo->quoteName('#__sr_tariff_details') . ' AS t');
		$tariffId   = $this->getState('filter.tariff_id', null);
		$guestType  = $this->getState('filter.guest_type', null);
		$tariffMode = $this->getState('filter.tariff_mode', 0);

		if (isset($tariffId))
		{
			$query->where('t.tariff_id = ' . (int) $tariffId);
		}

		if (isset($guestType))
		{
			$query->where('t.guest_type = ' . $dbo->quote($guestType));
		}

		if ($tariffMode == 0)
		{
			$query->order('t.w_day ASC');
		}
		else if ($tariffMode == 1)
		{
			$query->order('t.date ASC');
		}

		return $query;
	}
}