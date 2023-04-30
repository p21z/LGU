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
 * Main controller for Solidres
 *
 * @package     Solidres
 * @since       0.1.0
 */
use Joomla\CMS\Component\ComponentHelper;

class SolidresController extends SRControllerLegacy
{
	/**
	 * @var        string    The default view.
	 */
	protected $default_view = 'reservationassets';

	public function display($cachable = false, $urlparams = [])
	{
		$params  = ComponentHelper::getParams('com_solidres');
		$expOnly = SRPlugin::isEnabled('experience') && $params->get('main_activity', '') == '1';

		if ($defaultView = trim($params->get('default_view', '')))
		{
			$this->default_view = $defaultView;
		}
		elseif ($expOnly)
		{
			$this->default_view = 'expdashboard';
		}
		elseif (SRPlugin::isEnabled('statistics'))
		{
			$this->default_view = 'statistics';
		}

		JHtml::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));

		return parent::display($cachable, $urlparams);
	}
}
