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

JFormHelper::loadFieldClass('list');

require_once JPATH_COMPONENT_ADMINISTRATOR . '/helpers/helper.php';

/**
 * Supports an HTML select list of taxes
 *
 * @package
 * @subpackage
 * @since        1.6
 */
class JFormFieldTax extends JFormFieldList
{
	/**
	 * The form field type.
	 *
	 * @var        string
	 * @since    1.6
	 */
	protected $type = 'Tax';

	/**
	 * Method to get the field input markup.
	 *
	 * @return    string    The field input markup.
	 * @since    1.6
	 */
	protected function getOptions()
	{
		$assetId   = (int) $this->form->getValue('reservation_asset_id');
		$countryId = (int) $this->form->getValue('country_id', null, 0);
		$options   = SolidresHelper::getTaxOptions($assetId, $countryId);

		return array_merge(parent::getOptions(), $options);
	}
}