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

class SolidresViewWishList extends SRViewLegacy
{
	protected $items;
	protected $solidresMedia;
	protected $scope;

	public function display($tpl = null)
	{
		$app      = JFactory::getApplication();
		$scope    = strtolower($app->input->getString('scope', 'reservation_asset'));
		$wishList = SRWishList::getInstance($scope);
		$view     = strtolower($app->input->getCmd('view'));

		if (!in_array($scope, array('reservation_asset', 'experience')))
		{
			$scope = 'reservation_asset';
		}

		if (!$wishList->user->guest
			&& SRPlugin::isEnabled('user')
			&& $view != 'customer'
		)
		{
			$customerGroups = JComponentHelper::getParams('com_solidres')->get('customer_user_groups', []);

			if (!empty(array_intersect($wishList->user->groups, $customerGroups)))
			{
				$wishList->app->redirect(JRoute::_('index.php?option=com_solidres&view=customer&layout=wishlist&scope=' . $scope, false));

				return;
			}
		}

		$items    = (array) $wishList->load();
		$itemList = array();
		$feedbackEnabled = SRPlugin::isEnabled('feedback');

		if ($feedbackEnabled)
		{
			JHtml::_('stylesheet', 'plg_solidres_feedback/assets/feedbacks.css', array(), true);
		}

		if ($scope == 'experience')
		{
			SRLayoutHelper::addIncludePath(SRPlugin::getPluginPath('experience') . '/layouts');

			foreach ($items as $pk => $item)
			{
				$item = SRExperienceHelper::getItem((int) $pk);

				if ($feedbackEnabled)
				{
					$app->triggerEvent('onSolidresFeedbackPrepare', array('com_solidres.experience', $item));
				}

				$itemList[] = $item;
			}
		}
		else
		{
			$this->solidresMedia = SRFactory::get('solidres.media.media');
			require_once JPATH_ROOT . '/components/com_solidres/helpers/route.php';
			$modelAsset = JModelLegacy::getInstance('ReservationAsset', 'SolidresModel', array('ignore_request' => false));

			foreach ($items as $pk => $item)
			{
				$assetItem  = $modelAsset->getItem((int) $pk);

				if ($feedbackEnabled)
				{
					$app->triggerEvent('onSolidresFeedbackPrepare', array('com_solidres.asset', $assetItem));
				}

				$itemList[] = $assetItem;
			}
		}

		$this->scope = $scope;
		$this->items = $itemList;

		parent::display($tpl);
	}
}