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
 * Reservation list controller class (JSON format).
 *
 * @package       Solidres
 * @subpackage    Reservation
 * @since         0.1.0
 */
class SolidresControllerReservations extends JControllerLegacy
{
	public function countUnread()
	{
		$model = JModelLegacy::getInstance('Reservations', 'SolidresModel', array('ignore_request' => true));

		if ($this->app->isClient('site') && SRPlugin::isEnabled('hub'))
		{
			JTable::addIncludePath(SRPlugin::getAdminPath('user') . '/tables');
			$currentUser   = JFactory::getUser();
			$tableCustomer = JTable::getInstance('Customer', 'SolidresTable');
			$tableCustomer->load(array('user_id' => $currentUser->get('id')));
			$model->setState('filter.partner_id', $tableCustomer->id);
		}

		$unread = $model->countUnread();

		echo json_encode(array('count' => $unread));
	}
}
