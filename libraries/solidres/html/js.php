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

jimport('solidres.version');

abstract class SRHtmlJs
{
	/**
	 * @var    array  Array containing information for loaded files
	 * @since  3.0
	 */
	protected static $loaded = array();

	/**
	 * Method to load the jQuery UI framework into the document head
	 *
	 * If debugging mode is on an uncompressed version of jQuery UI is included for easier debugging.
	 *
	 * @return  void
	 */
	public static function site()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		JHtml::_('script', 'com_solidres/assets/site.min.js', array('version' => SRVersion::getHashVersion(), 'relative' => true));

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the jQuery UI framework into the document head
	 *
	 * If debugging mode is on an uncompressed version of jQuery UI is included for easier debugging.
	 *
	 * @return  void
	 */
	public static function admin()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		JHtml::_('script', 'com_solidres/assets/admin.min.js', array('version' => SRVersion::getHashVersion(), 'relative' => true));

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the common JS which is shared between front end and back end
	 *
	 * If debugging mode is on an uncompressed version of jQuery UI is included for easier debugging.
	 *
	 * @return  void
	 */
	public static function common()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		JHtml::_('script', 'com_solidres/assets/common.min.js', array('version' => SRVersion::getHashVersion(), 'relative' => true));

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the call jquery noconflict mode
	 *
	 * @return  void
	 */
	public static function noconflict()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		JHtml::_('script', 'com_solidres/assets/noconflict.js', array('version' => SRVersion::getHashVersion(), 'relative' => true));

		static::$loaded[__METHOD__] = true;

		return;
	}
}