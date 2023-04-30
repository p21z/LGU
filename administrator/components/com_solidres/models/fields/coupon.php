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
class JFormFieldCoupon extends JFormField
{
	/**
	 * The form field type.
	 *
	 * @var        string
	 * @since    1.6
	 */
	public $type = 'Coupon';

	/**
	 * Method to get the field input markup.
	 *
	 * @return    string    The field input markup.
	 * @since    1.6
	 */
	protected function getInput()
	{
		$html    = array();
		$options = array();

		$selectedId = (int) $this->form->getValue('coupon_id');

		$options = SolidresHelper::getCouponOptions();

		$html[] = JHtml::_('select.genericlist', $options, $this->name, null, 'value', 'text', $selectedId);

		return implode($html);
	}
}

