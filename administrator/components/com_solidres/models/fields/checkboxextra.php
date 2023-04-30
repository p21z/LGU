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

require_once SRPATH_HELPERS . '/helper.php';

/**
 * Form Field class for the Joomla Framework.
 *
 * @package        Joomla.Framework
 * @subpackage     Form
 * @since          1.6
 */
class JFormFieldCheckboxExtra extends JFormField
{
	/**
	 * The form field type.
	 *
	 * @var        string
	 * @since    1.6
	 */
	public $type = 'CheckboxExtra';

	/**
	 * Method to get the field input markup.
	 *
	 * @return    string    The field input markup.
	 * @since    1.6
	 */
	protected function getInput()
	{
		$roomtypeId         = $this->form->getValue('id', null, 0);
		$reservationAssetId = $this->form->getValue('reservation_asset_id', 0);
		$html               = '';
		$app                = JFactory::getApplication();

		if ($reservationAssetId > 0)
		{
			$model = JModelLegacy::getInstance('Extras', 'SolidresModel', array('ignore_request' => true));
			$model->setState('filter.reservation_asset_id', $reservationAssetId);
			$model->setState('filter.charge_type', array(0, 4, 5, 6, 7, 8)); // Only show per room* Extras items

			$list                 = $model->getItems();
			$listRoomtypeExtraIds = SRFactory::get('solidres.roomtype.roomtype')->getExtra($roomtypeId);
			if (!empty($list))
			{
				foreach ($list as $obj)
				{
					$html .= '
	            	<p class="extras-wrapper-line"><label class="checkbox">
			            <input type="checkbox"
							  value="' . $obj->id . '"
							  id="checkbox_extra_id_' . $obj->id . '"
							  class="checkbox_extra_class"
							  name="jform[extra_id][]" ' . (in_array($obj->id, $listRoomtypeExtraIds) ? 'checked="checked"' : '') . '/>
							<a href="' . JRoute::_('index.php?option=com_solidres&task=extra' . ($app->isClient('site') ? 'form' : '') . '.edit&id=' . $obj->id) . '">
						' . $obj->name . '
							</a>
					</label></p>
				';
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

		return $html;
	}
}


