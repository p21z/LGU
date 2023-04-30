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
 * Extra list controller class (JSON format).
 *
 * @package       Solidres
 * @subpackage    ExtraJSON
 * @since         0.1.0
 */
class SolidresControllerExtras extends JControllerAdmin
{
	public function find()
	{
		$model              = JModelLegacy::getInstance('Extras', 'SolidresModel', array('ignore_request' => true));
		$reservationAssetId = $this->input->getUint('id', 0);
		$html               = '';

		if ($reservationAssetId > 0)
		{
			$model->setState('filter.state', 1);
			$model->setState('filter.reservation_asset_id', $reservationAssetId);
			$model->setState('filter.charge_type', array(0, 4, 5, 6, 7)); // Only show per room Extras items

			$list = $model->getItems();
			if (!empty($list))
			{
				foreach ($list as $obj)
				{
					$html .= '
						<p class="coupons-wrapper-line">
							<label class="checkbox">
							<input type="checkbox"
								  value="' . $obj->id . '"
								  id="checkbox_extra_id_' . $obj->id . '"
								  class="checkbox_coupon_class"
								  name="jform[coupon_id][]" />
								<a href="' . JRoute::_('index.php?option=com_solidres&task=extra' . ($this->app->isClient('site') ? 'form' : '') . '.edit&id=' . $obj->id) . '">
									' . $obj->name . '
								</a>
							</label>
						</p>';
				}
			}
			else
			{
				$html = JText::_('SR_EXTRA_NOT_AVAILABLE_FOR_THIS_RESERVATION_ASSET');
			}
		}
		else
		{
			$html = JText::_('SR_EXTRA_SELECT_RESERVATION_ASSET_FIRST');
		}

		echo $html;

		$this->app->close();
	}
}