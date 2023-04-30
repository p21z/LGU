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
 * State table
 *
 * @package       Solidres
 * @subpackage    State
 * @since         0.1.0
 */
class SolidresTableState extends JTable
{
	function __construct(JDatabaseDriver $db)
	{
		parent::__construct('#__sr_geo_states', 'id', $db);

		$this->setColumnAlias('published', 'state');
	}
}

