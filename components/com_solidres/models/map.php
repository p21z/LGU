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
 * Solidres Component Model
 *
 * @package        Reservation
 * @since          0.1.0
 */
class SolidresModelMap extends JModelLegacy
{
	public function getMapInfo()
	{
		JTable::addIncludePath(JPATH_COMPONENT_ADMINISTRATOR . '/tables', 'SolidresTable');
		$assetTable = JTable::getInstance('ReservationAsset', 'SolidresTable');
		$assetTable->load($this->getState($this->getName() . '.assetId'));

		return $assetTable;
	}
}