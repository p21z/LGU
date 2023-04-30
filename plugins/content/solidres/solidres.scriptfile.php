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

/**
 * Custom script to hook into installation process
 *
 */
class plgContentSolidresInstallerScript
{
	function postflight($type, $parent)
	{
		if ($type == 'uninstall')
		{
			return true;
		}

		echo '<p>' . JText::_('Solidres - Content plugin is installed successfully.') . '</p>';

		$dbo = JFactory::getDbo();

		$query = $dbo->getQuery(true);

		$query->clear();
		$query->update($dbo->quoteName('#__extensions'));
		$query->set('enabled = 1');
		$query->where("element = 'solidres'");
		$query->where("type = 'plugin'");
		$query->where("folder = 'content'");

		$dbo->setQuery($query);

		$result = $dbo->execute();
		if (!$result)
		{
			throw new RuntimeException('plgContentSolidres: publishing failed');
		}
		else
		{
			echo '<p>' . JText::_('Solidres - Content plugin is published successfully.') . '</p>';
		}
	}
}
