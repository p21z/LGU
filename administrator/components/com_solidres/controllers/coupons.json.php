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
 * Coupons list controller class (JSON format).
 *
 * @package       Solidres
 * @subpackage    CouponJSON
 * @since         0.1.0
 */
class SolidresControllerCoupons extends JControllerAdmin
{
	public function find()
	{
		$model              = JModelLegacy::getInstance('Coupons', 'SolidresModel', array('ignore_request' => true));
		$reservationAssetId = $this->input->getUint('id', 0);
		$html               = '';

		if ($reservationAssetId > 0)
		{
			$model->setState('filter.state', 1);
			$model->setState('filter.reservation_asset_id', $reservationAssetId);
			$model->setState('filter.date_constraint', 1);
			$listCoupons = $model->getItems();
			if (!empty($listCoupons))
			{
				foreach ($listCoupons as $couponObj)
				{
					$html .= '
					<p class="coupons-wrapper-line">
						<label class="checkbox">
						<input type="checkbox"
							  value="' . $couponObj->id . '"
							  id="checkbox_coupon_id_' . $couponObj->id . '"
							  class="checkbox_coupon_class"
							  name="jform[coupon_id][]" />
						' . $couponObj->coupon_name . '
						</label>
					</p>';
				}
			}
			else
			{
				$html = JText::_('SR_COUPON_NOT_AVAILABLE_FOR_THIS_RESERVATION_ASSET');
			}
		}
		else
		{
			$html = JText::_('SR_COUPON_SELECT_RESERVATION_ASSET_FIRST');
		}

		echo $html;

		$this->app->close();
	}
}