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
 * HTML View class for the Solidres component
 *
 * @package   Solidres
 * @since     0.1.0
 */
class SolidresViewMap extends JViewLegacy
{
	protected $info;

	protected $location;

	public function display($tpl = null)
	{
		$model   = $this->getModel();
		$assetId = $model->getState($model->getName() . '.assetId');
		if ($assetId > 0)
		{
			$this->info = $model->getMapInfo();
		}

		$this->location = $model->getState('filter.location');

		JHtml::_('jquery.framework');
		JHtml::_('stylesheet', 'com_solidres/assets/main.min.css', ['version' => SRVersion::getHashVersion(), 'relative' => true]);
		if (SRPlugin::isEnabled('hub'))
		{
			JHtml::_('stylesheet', 'plg_solidres_hub/assets/hub.min.css', ['version' => plgSolidresHub::getHashVersion(), 'relative' => true]);
		}

		if ($errors = $this->get('Errors'))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		parent::display($tpl);
	}
}
