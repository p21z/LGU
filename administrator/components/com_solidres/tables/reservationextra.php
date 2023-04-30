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
 * Reservation extra table
 *
 * @package       Solidres
 * @subpackage    ReservationExtra
 * @since         0.5.0
 */
class SolidresTableReservationExtra extends JTable
{
	public function __construct(JDatabaseDriver $db)
	{
		parent::__construct('#__sr_reservation_extra_xref', 'id', $db);
	}
}

