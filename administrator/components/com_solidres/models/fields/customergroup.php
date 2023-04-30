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
 * Form Field class for the Joomla Framework.
 *
 * @package        Joomla.Framework
 * @subpackage     Form
 * @since          1.6
 */
class JFormFieldCustomerGroup extends JFormFieldList
{
	/**
	 * The form field type.
	 *
	 * @var        string
	 * @since    1.6
	 */
	public $type = 'CustomerGroup';

	public function getInput()
	{
		if (!SRPlugin::isEnabled('user'))
		{
			$this->disabled = true;
		}

		return parent::getInput();
	}

	/**
	 * Method to get the field options.
	 *
	 * @return  array  The field option objects.
	 *
	 * @since   1.6
	 */
	public function getOptions()
	{
		$options       = array();
		$this->showall = isset($this->element['showall']) ? $this->element['showall']->__toString() : 'false';
		$this->showall = $this->showall == 'true' ? true : false;
		if (SRPlugin::isEnabled('user'))
		{
			$options = SolidresHelper::getCustomerGroupOptions($this->showall);
		}

		return array_merge(parent::getOptions(), $options);
	}
}


