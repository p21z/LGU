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

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\CMS\Factory;

/**
 * Solidres Component Controller
 *
 * @package      Solidres
 * @since        0.1.0
 */
class SolidresController extends SRControllerLegacy
{
	public function display($cachable = false, $urlparams = [])
	{
		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', ['version' => SRVersion::getHashVersion(), 'relative' => true]);

		$urlparams = array_merge($urlparams, [
			'catid'            => 'INT',
			'id'               => 'INT',
			'cid'              => 'ARRAY',
			'year'             => 'INT',
			'month'            => 'INT',
			'limit'            => 'INT',
			'limitstart'       => 'INT',
			'showall'          => 'INT',
			'return'           => 'BASE64',
			'filter'           => 'STRING',
			'filter_order'     => 'CMD',
			'filter_order_Dir' => 'CMD',
			'filter-search'    => 'STRING',
			'print'            => 'BOOLEAN',
			'lang'             => 'CMD',
			'location'         => 'STRING',
			'categories'       => 'STRING',
			'mode'             => 'STRING',
			'Itemid'           => 'UINT',
			'layout'           => 'STRING',
		]);

		$viewName = $this->input->get('view');

		PluginHelper::importPlugin('solidres');
		Factory::getApplication()->triggerEvent('onSolidresBeforeDisplay', [$viewName, &$cachable, &$urlparams]);

		parent::display($cachable, $urlparams);

		return $this;
	}
}