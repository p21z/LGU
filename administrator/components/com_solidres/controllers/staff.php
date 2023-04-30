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

use Joomla\CMS\MVC\Controller\BaseController;
use Joomla\CMS\Factory as CMSFactory;
use Joomla\CMS\Response\JsonResponse;

class SolidresControllerStaff extends BaseController
{
	public function loadUserGroups()
	{
		$userId = (int) $this->input->get('userId', 0, 'uint');
		$groups = [];

		try
		{
			if ($userId > 0)
			{
				$groups = array_values(CMSFactory::getUser($userId)->groups);
			}

			echo new JsonResponse($groups);
		}
		catch (RuntimeException $e)
		{
			echo new JsonResponse($e);
		}

		$this->app->close();
	}
}
