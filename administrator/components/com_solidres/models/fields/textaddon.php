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

JFormHelper::loadFieldClass('text');

/**
 * Supports an HTML select list of extra charge types
 *
 * @package       Solidres
 * @subpackage    Extra
 * @since         1.6
 */
class JFormFieldTextAddon extends JFormFieldText
{
	/**
	 * The form field type.
	 *
	 * @var    string
	 * @since  1.7.0
	 */
	protected $type = 'TextAddon';

	/**
	 * Method to get the field input markup.
	 *
	 * @return  string  The field input markup.
	 *
	 * @since   1.7.0
	 */
	protected function getInput()
	{
		$html = '<div class="input-append">';
		$html .= parent::getInput();
		$html .= '<span class="add-on">';
		$html .= '</span>';
		$html .= '</div>';


		return $html;
	}
}