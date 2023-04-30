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
 * Coupon handler class
 *
 * @package       Solidres
 * @subpackage    Coupon
 *
 * @since         0.1.0
 */
class SRCoupon
{
	/**
	 * The database object
	 *
	 * @var object
	 */
	protected $_dbo = null;

	public function __construct()
	{
		$this->_dbo = JFactory::getDbo();
	}

	/**
	 * Check a coupon code to see if it is valid to use.
	 *
	 * @param   string $couponCode      The coupon code to check
	 * @param   int    $raId            The reservation asset id
	 * @param   int    $dateOfChecking  The date of checking
	 * @param   int    $checkin         The checkin date
	 * @param   int    $customerGroupId The customer group id
	 *
	 * @since   0.1.0
	 *
	 * @return  boolean
	 */
	public function isValid($couponCode, $raId, $dateOfChecking, $checkin, $customerGroupId = null)
	{
		JModelLegacy::addIncludePath(JPATH_COMPONENT_ADMINISTRATOR . '/models', 'SolidresModel');
		JTable::addIncludePath(JPATH_COMPONENT_ADMINISTRATOR . '/tables', 'SolidresTable');
		$model      = JModelLegacy::getInstance('Coupon', 'SolidresModel', array('ignore_request' => true));
		$tableAsset = JTable::getInstance('ReservationAsset', 'SolidresTable');
		$coupon     = $model->getItem(array('coupon_code' => $couponCode));
		$tableAsset->load($raId);
		$registry = new JRegistry;
		$registry->loadString($tableAsset->params);
		$assetParams = $registry->toArray();
		if (!isset($assetParams['enable_coupon']))
		{
			$assetParams['enable_coupon'] = 0;
		}

		$response = true;
		$inAssets = empty($coupon->reservation_asset_id) || in_array($raId, (array) $coupon->reservation_asset_id);

		if (
			$coupon->state != 1
			|| !($coupon->valid_from <= $dateOfChecking && $dateOfChecking <= $coupon->valid_to)
			|| !$inAssets
			|| !($coupon->valid_from_checkin <= $checkin && $checkin <= $coupon->valid_to_checkin)
			|| $coupon->customer_group_id != $customerGroupId
			|| (!is_null($coupon->quantity) && $coupon->quantity == 0)
			|| ($assetParams['enable_coupon'] == 0)
		)
		{
			$response = false;
		}

		return $response;
	}

	/**
	 * Check to see if the given coupon is applicable to the given room type/extra
	 *
	 * @param   $couponId
	 * @param   $scopeId  int  Id of room type or extra
	 * @param   $scope    string Either room_type or extra
	 *
	 * @since   0.1.0
	 *
	 * @return  bool
	 */
	public function isApplicable($couponId, $scopeId, $scope = 'room_type')
	{
		try
		{
			JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');
			$couponModel = JModelLegacy::getInstance('Coupon', 'SolidresModel', array('ignore_request' => true));
			$couponItem  = $couponModel->getItem($couponId);

			if (empty($couponItem->id))
			{
				return false;
			}

			if (is_array($couponItem->reservation_asset_id) && !$couponItem->reservation_asset_id)
			{
				// This coupon is for all assets
				return true;
			}

			$query = $this->_dbo->getQuery(true)
				->select('COUNT(*)')
				->from($this->_dbo->qn('#__sr_' . $scope . '_coupon_xref'))
				->where($this->_dbo->qn($scope . '_id') . ' = ' . (int) $scopeId)
				->where($this->_dbo->qn('coupon_id') . ' = ' . (int) $couponId);
			$this->_dbo->setQuery($query);

			return $this->_dbo->loadResult() ? true : false;
		}
		catch (RuntimeException $e)
		{
			return false;
		}
	}
}