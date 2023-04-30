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
 * Media table
 *
 * @package       Solidres
 * @subpackage    Media
 * @since         0.1.0
 */
class SolidresTableMedia extends JTable
{
	function __construct(JDatabaseDriver $db)
	{
		parent::__construct('#__sr_media', 'id', $db);
	}

	/**
	 * Method to delete a row from the database table by primary key value.
	 *
	 * @param    mixed    An optional primary key value to delete.  If not set the
	 *                    instance property value is used.
	 *
	 * @return    boolean    True on success.
	 * @since    1.0
	 * @link     http://docs.joomla.org/JTable/delete
	 */
	public function delete($pk = null)
	{
		$query = $this->_db->getQuery(true);

		// Delete from Media roomtype xref first
		// We delete manually instead of using ON DELETE CASCADE of Innodb table type
		// If has any relationship with RoomType, delete them all
		$query->clear();
		$query->delete()->from($this->_db->quoteName('#__sr_media_roomtype_xref'))->where('media_id = ' . $pk);
		$this->_db->setQuery($query);
		if (!$this->_db->execute())
		{
			JFactory::getApplication()->enqueueMessage(JText::sprintf('SolidresControllerMedia::delete ' . $this->_db->quoteName('#__sr_media_roomtype_xref') . ' failed', get_class($this), $this->_db->getErrorMsg()), 'warning');

			return false;
		}

		// Delete the relationship with ReservationAsset first
		// We delete manually instead of using ON DELETE CASCADE of Innodb table type
		// If has any relationship with ReservationAsset, delete them all
		$query->clear();
		$query->delete()->from($this->_db->quoteName('#__sr_media_reservation_assets_xref'))->where('media_id = ' . $pk);
		$this->_db->setQuery($query);
		if (!$this->_db->execute())
		{
			JFactory::getApplication()->enqueueMessage(JText::sprintf('SolidresControllerMedia::delete from ' . $this->_db->quoteName('#__sr_media_reservation_assets_xref') . ' failed', get_class($this), $this->_db->getErrorMsg()), 'warning');

			return false;
		}

		return parent::delete($pk);
	}
}

