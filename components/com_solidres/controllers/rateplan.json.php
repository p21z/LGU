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

use Joomla\CMS\Session\Session;

class SolidresControllerRatePlan extends JControllerLegacy
{
	public function findConditions()
	{
		Session::checkToken('get') or jexit(JText::_('JINVALID_TOKEN'));

		$ratePlanID    = $this->input->get('id', 'uint', 0);
		$date          = $this->input->get('date', 'string', '');
		$modelRatePlan = JModelLegacy::getInstance('Tariff', 'SolidresModel', array('ignore_request' => true));
		$ratePlan      = $modelRatePlan->getItem($ratePlanID);

		$return = [];
		if ($ratePlan->mode = 1 && !empty($date))
		{
			$type                    = array_key_first($ratePlan->details_reindex);
			$return['limit_checkin'] = $ratePlan->details_reindex[$type][$date]->limit_checkin;
			$return['min_los']       = $ratePlan->details_reindex[$type][$date]->min_los;
			$return['max_los']       = $ratePlan->details_reindex[$type][$date]->max_los;
			$return['d_interval']    = $ratePlan->details_reindex[$type][$date]->d_interval;
		}

		echo json_encode($return);

		$this->app->close();
	}
}