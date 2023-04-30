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

JLoader::register('SolidresHelper', JPATH_COMPONENT_ADMINISTRATOR . '/helpers/helper.php');

/**
 * State list controller class.
 *
 * @package       Solidres
 * @subpackage    State
 * @since         0.1.0
 */
class SolidresControllerStates extends JControllerAdmin
{
	public function getModel($name = 'States', $prefix = 'SolidresModel', $config = array('ignore_request' => true))
	{
		return parent::getModel($name, $prefix, $config);
	}

	public function find()
	{
		$countryId = $this->input->get('id', 0, 'int');
		$states    = SolidresHelper::getGeoStateOptions($countryId);
		$html      = '';
		foreach ($states as $state)
		{
			$html .= '<option value="' . $state->value . '">' . $state->text . '</option>';
		}
		echo $html;
		$this->app->close();
	}
}