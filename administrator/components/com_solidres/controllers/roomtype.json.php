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
 * RoomType JSON controller class.
 *
 * @package       Solidres
 * @subpackage    RoomType
 * @since         0.1.0
 */
class SolidresControllerRoomType extends JControllerForm
{
	/**
	 * Check a room to determine whether it can be deleted or not.
	 *
	 * If it can be delete, delete is right away
	 *
	 * @return string
	 */
	public function checkRoomReservation()
	{
		$roomId = $this->input->get('id', 0, 'int');
		$result = SRFactory::get('solidres.roomtype.roomtype')->canDeleteRoom($roomId);

		echo json_encode($result);
		
		$this->app->close();
	}

	/**
	 * Find Room that belong to a RoomType
	 *
	 * @return void
	 */
	public function findRoom()
	{
		$roomTypeId = $this->input->get('id', 0, 'int');
		$result     = SRFactory::get('solidres.roomtype.roomtype')->getListRooms($roomTypeId);
		$i          = 0;
		$json       = array();

		if (!empty($result))
		{
			foreach ($result as $rs)
			{
				$json[$i]['id']   = $rs->id;
				$json[$i]['name'] = $rs->label;
				$i++;
			}
		}

		echo json_encode($json);
		$this->app->close();
	}

	public function removeRoomPermanently()
	{
		JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/tables');
		$roomId = $this->input->get('id', 0, 'int');
		$result = false;

		if ($roomId > 0)
		{
			JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');
			$roomModel = JModelLegacy::getInstance('Room', 'SolidresModel', array('ignore_request' => true));
			$result    = $roomModel->delete($roomId);
		}

		echo json_encode($result);
		$this->app->close();
	}

	public function getSingle()
	{
		$roomTypeId = $this->input->get('id', 0, 'int');

		if ($roomTypeId > 0)
		{
			$dbo   = JFactory::getDbo();
			$query = $dbo->getQuery(true);
			$query->select('*')->from('#__sr_room_types')->where('id = ' . $roomTypeId);
			echo json_encode($dbo->setQuery($query)->loadObject());
		}

		$this->app->close();
	}
}