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

class SRControllerLegacy extends JControllerLegacy
{
	protected static $instance;
	protected static $includePaths = array();

	public static function getInstance($prefix, $config = array())
	{
		if (is_object(self::$instance))
		{
			return self::$instance;
		}

		$input = JFactory::getApplication()->input;

		// Get the environment configuration.
		$basePath = array_key_exists('base_path', $config) ? $config['base_path'] : JPATH_COMPONENT;
		$format   = $input->getWord('format');
		$command  = $input->get('task', 'display');

		// Check for array format.
		$filter = JFilterInput::getInstance();

		if (is_array($command))
		{
			$command = $filter->clean(array_pop(array_keys($command)), 'cmd');
		}
		else
		{
			$command = $filter->clean($command, 'cmd');
		}

		// Check for a controller.task command.
		if (strpos($command, '.') !== false)
		{
			// Explode the controller.task command.
			list ($type, $task) = explode('.', $command);

			// Define the controller filename and path.
			$file       = self::createFileName('controller', array('name' => $type, 'format' => $format));
			$path       = $basePath . '/controllers/' . $file;
			$backuppath = $basePath . '/controller/' . $file;

			// Reset the task without the controller context.
			$input->set('task', $task);
		}
		else
		{
			// Base controller.
			$type = null;

			// Define the controller filename and path.
			$file       = self::createFileName('controller', array('name' => 'controller', 'format' => $format));
			$path       = $basePath . '/' . $file;
			$backupfile = self::createFileName('controller', array('name' => 'controller'));
			$backuppath = $basePath . '/' . $backupfile;
		}
		$includePaths = static::$includePaths;
		if (count($includePaths))
		{
			if (array_key_exists('model_path', $config))
			{
				$config['model_path'] = (array) $config['model_path'];
			}
			else
			{
				$config['model_path'] = array(JPATH_COMPONENT . '/models');
			}
			if (array_key_exists('view_path', $config))
			{
				$config['view_path'] = (array) $config['view_path'];
			}
			else
			{
				$config['view_path'] = array(JPATH_COMPONENT . '/views');
			}
			if (array_key_exists('template_path', $config))
			{
				$config['template_path'] = (array) $config['template_path'];
			}
			foreach ($includePaths as $includePath)
			{
				//JTable::addIncludePath($includePath . '/tables');
				array_unshift($config['model_path'], $includePath . '/models');
				array_unshift($config['view_path'], $includePath . '/views');
			}
		}
		// Get the controller class name.
		$class = ucfirst($prefix) . 'Controller' . ($type ? ucfirst($type) : '');

		// Include the class if not present.
		if (!class_exists($class))
		{
			// If the controller file path exists, include it.
			if (file_exists($path))
			{
				require_once $path;
			}
			elseif (isset($backuppath) && file_exists($backuppath))
			{
				require_once $backuppath;
			}
			//If path is not exist the find another from include paths
			elseif (count($includePaths))
			{
				if ($type)
				{
					$file = 'controllers/' . $file;
				}
				foreach ($includePaths as $includePath)
				{
					$path = $includePath . '/' . $file;
					if (file_exists($path))
					{
						require_once $path;
						$config['base_path'] = $includePath;
						break;
					}
				}
			}
			if (!class_exists($class))
			{
				throw new InvalidArgumentException(JText::sprintf('JLIB_APPLICATION_ERROR_INVALID_CONTROLLER', $type, $format));
			}
		}
		// Instantiate the class.
		if (class_exists($class))
		{
			self::$instance = new $class($config);
		}
		else
		{
			throw new InvalidArgumentException(JText::sprintf('JLIB_APPLICATION_ERROR_INVALID_CONTROLLER_CLASS', $class));
		}

		return self::$instance;
	}

	/**
	 * Add one or more controller paths, in LIFO order.
	 *
	 * @param   mixed $path The directory (string) or list of directories (array) to add.
	 *
	 * @return array
	 */
	public static function addIncludePath($path)
	{
		settype($path, 'array');
		jimport('joomla.filesystem.folder');
		foreach ($path as $includePath)
		{
			//for only exists path
			if (!in_array($includePath, static::$includePaths) && JFolder::exists($includePath))
			{
				array_unshift(static::$includePaths, JPath::clean($includePath));
			}
		}

		return static::$includePaths;

	}

}