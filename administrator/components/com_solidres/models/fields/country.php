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

require_once JPATH_ADMINISTRATOR . '/components/com_solidres/helpers/helper.php';

JFormHelper::loadFieldClass('list');

/**
 * Supports an HTML select list of countries
 *
 * @package       Solidres
 * @subpackage    Country
 * @since         1.6
 */
class JFormFieldCountry extends JFormFieldList
{
	/**
	 * The form field type.
	 *
	 * @var        string
	 * @since    1.6
	 */
	public $type = 'Country';

	/**
	 * Method to get the field options.
	 *
	 * @return  array  The field option objects.
	 *
	 * @since   1.6
	 */
	public function getOptions()
	{
		$options = SolidresHelper::getCountryOptions();

		return array_merge(parent::getOptions(), $options);
	}
}