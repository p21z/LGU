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

abstract class SRModelAdmin extends JModelAdmin
{
	protected $plgBasePath;

	public function __construct($config = array())
	{
		$reflector = new ReflectionClass($this);
		if ($fileName = $reflector->getFileName())
		{
			$this->plgBasePath    = dirname(dirname($fileName));
			$config['table_path'] = array($this->plgBasePath . '/tables');
			if (JFactory::getApplication()->isClient('site'))
			{
				$adminPath = str_replace('components/com_solidres', 'administrator/components/com_solidres', $this->plgBasePath);
				array_push($config['table_path'], $adminPath . '/tables');
			}
		}
		parent::__construct($config);
	}

	protected function loadForm($name, $source = null, $options = array(), $clear = false, $xpath = false)
	{
		JForm::addFormPath($this->plgBasePath . '/models/forms');
		JForm::addFieldPath($this->plgBasePath . '/models/fields');
		JForm::addRulePath($this->plgBasePath . '/models/rules');

		return parent::loadForm($name, $source, $options, $clear, $xpath);
	}

	public function getTable($name = '', $prefix = 'SolidresTable', $option = array())
	{
		JTable::addIncludePath($this->plgBasePath . '/tables');

		return JTable::getInstance($name, $prefix, $option);
	}
}