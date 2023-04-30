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

class SRViewLegacy extends JViewLegacy
{
	protected $_fileName;

	public function __construct($config = array())
	{
		parent::__construct($config);

		$reflector = new ReflectionClass($this);

		if ($this->_fileName = $reflector->getFileName())
		{
			array_push($this->_path['template'], dirname($this->_fileName) . '/tmpl');
		}
	}

	public function get($property, $default = null)
	{
		if ($this->_fileName)
		{
			$modelPath = dirname($this->_fileName, 3) . '/models';
			JForm::addFormPath($modelPath . '/forms');
			JForm::addFieldPath($modelPath . '/fields');
		}

		return parent::get($property, $default);
	}

}