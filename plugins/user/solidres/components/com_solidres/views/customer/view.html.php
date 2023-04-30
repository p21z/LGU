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

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Form\Form;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\MVC\Model\BaseDatabaseModel;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Table\Table;

/**
 * Front end customer view class
 *
 * @package       Solidres
 * @subpackage    Customer
 * @since         0.8.0
 */
class SolidresViewCustomer extends SRViewLegacy
{
	protected $state;
	protected $items;
	protected $pagination;
	protected $wishlist;
	protected $cancellationState;

	public function display($tpl = null)
	{
		$user   = Factory::getUser();
		$app    = Factory::getApplication();
		$Itemid = $app->input->getUint('Itemid', 0);

		if ($user->guest)
		{
			$return = JUri::getInstance()->toString();
			$app->redirect(Route::_('index.php?option=com_users&view=login&return=' . base64_encode($return), false));

			return false;
		}

		if (count($errors = $this->get('Errors')))
		{
			throw new Exception(implode(PHP_EOL, $errors), 500);
		}

		$solidresConfig          = ComponentHelper::getParams('com_solidres');
		$customerUserGroups      = $solidresConfig->get('customer_user_groups', []);
		$userGroups              = $user->getAuthorisedGroups();
		$access                  = false;
		$this->cancellationState = $solidresConfig->get('cancel_state', 4);

		foreach ($customerUserGroups as $customerUserGroup)
		{
			if (in_array($customerUserGroup, $userGroups))
			{
				$access = true;
				break;
			}
		}

		if (!$access)
		{
			$app->enqueueMessage(Text::_('JERROR_ALERTNOAUTHOR'), 'error');
			$app->setHeader('status', 403, true);

			return false;
		}

		$mainActivity = $solidresConfig->get('main_activity', '');

		if ($mainActivity === '1'
			&& SRPlugin::isEnabled('experience')
			&& $app->input->get('view') === 'customer'
			&& $this->getLayout() !== 'wishlist'
		)
		{
			$app->redirect(Route::_("index.php?option=com_solidres&view=myexperiences&Itemid=$Itemid", false));
		}

		Table::addIncludePath(SRPlugin::getAdminPath('user') . '/tables');
		BaseDatabaseModel::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');

		$customerTable = Table::getInstance('Customer', 'SolidresTable');
		$customerTable->load(['user_id' => $user->get('id')]);

		$this->modelReservations = BaseDatabaseModel::getInstance('MyReservations', 'SolidresModel', ['ignore_request' => false]);
		$this->modelAsset        = BaseDatabaseModel::getInstance('ReservationAsset', 'SolidresModel', ['ignore_request' => false]);
		$this->modelReservations->setState('list.ordering', 'r.created_date');
		$this->modelReservations->setState('list.direction', 'DESC');
		$this->modelReservations->setState('filter.customer_id', isset($customerTable->id) ? $customerTable->id : 0);
		$this->modelReservations->setState('filter.customer_email', $user->get('email'));
		$this->modelReservations->setState('filter.is_customer_dashboard', 1);
		$this->pagination   = $this->modelReservations->getPagination();
		$this->itemid       = Factory::getApplication()->input->get('Itemid');
		$this->reservations = $this->modelReservations->getItems();

		$this->unapprovedReservations = 0;
		if (!empty($this->reservations))
		{
			foreach ($this->reservations as $reservation)
			{
				if (!$reservation->is_approved)
				{
					$this->unapprovedReservations++;
				}
			}
		}

		// Get the filter locations list
		$this->filterLocations = $this->modelReservations->getLocations();
		$this->filterAssets    = $this->modelReservations->getAssets();

		if (SRPlugin::isEnabled('feedback') && $this->getLayout() == 'feedbacks')
		{
			$language = Factory::getLanguage();
			$language->load('com_solidres', JPATH_ADMINISTRATOR . '/components/com_solidres', null, 1);
			$modelFeedbacks = BaseDatabaseModel::getInstance('FeedbackList', 'SolidresModel');
			$modelFeedbacks->setState('filter.customer_id', $this->modelReservations->getState('filter.customer_id'));
			Form::addFormPath(SRPlugin::getAdminPath('feedback') . '/models/forms');
			Form::addFieldPath(JPATH_COMPONENT_ADMINISTRATOR . '/models/fields');
			$modelFeedbacks->set('filterFormName', 'filter_feedbacks');
			$controller   = SRControllerLegacy::getInstance('Solidres');
			$feedbackView = $controller->getView('Feedbacks', Factory::getDocument()->getType(), 'SolidresView', ['base_path' => SRPlugin::getSitePath('feedback')]);
			$feedbackView->setModel($modelFeedbacks, true);
			$feedbackView->set('items', $modelFeedbacks->getItems());
			$feedbackView->set('state', $modelFeedbacks->getState());
			$feedbackView->set('pagination', $modelFeedbacks->getPagination());
			$feedbackView->set('filterForm', $modelFeedbacks->getFilterForm());
			$feedbackView->set('activeFilters', $modelFeedbacks->getActiveFilters());
			$feedbackView->set('formRoute', Route::_("index.php?option=com_solidres&view=customer&layout=feedbacks&Itemid=$Itemid", false));
			$this->set('feedbackView', $feedbackView);
			$this->addTemplatePath(SRPlugin::getSitePath('feedback') . '/views/feedbacks/tmpl');
		}

		HTMLHelper::_('jquery.framework');
		HTMLHelper::_('bootstrap.framework');
		SRHtml::_('jquery.colorbox', 'show_map', '95%', '90%', 'true', 'false');
		SRLayoutHelper::addIncludePath(SRPlugin::getSitePath('user') . '/layouts');

		if (SRPlugin::isEnabled('hub') || SRPlugin::isEnabled('experience'))
		{
			$type         = Factory::getDocument()->getType();
			$wishListView = SRControllerLegacy::getInstance('Solidres')->getView('WishList', $type, 'SolidresView');

			if ($wishListView instanceof SolidresViewWishList)
			{
				ob_start();
				$wishListView->display();
				$this->wishlist = ob_get_clean();
			}
		}

		parent::display($tpl);
	}
}
