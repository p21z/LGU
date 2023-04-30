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

use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Filesystem\Folder;
use Joomla\CMS\Factory;
use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\Language\Text;

/**
 * System view class
 *
 * @package       Solidres
 * @subpackage    System
 * @since         0.6.0
 */
class SolidresViewSystem extends JViewLegacy
{
	protected $solidresPlugins = array(
		'content'           => array(
			'solidres'
		),
		'extension'         => array(
			'solidres'
		),
		'system'            => array(
			'solidres'
		),
		'user'              => array(
			'solidres'
		),
		'solidres'          => array(
			'simple_gallery',
			'api',
			'app',
			'acl',
			'advancedextra',
			'camera_slideshow',
			'channelmanager',
			'complextariff',
			'currency',
			'customfield',
			'discount',
			'experience',
			'experienceinvoice',
			'facebook',
			'feedback',
			'flexsearch',
			'googleadwords',
			'googleanalytics',
			'housekeeping',
			'hub',
			'ical',
			'invoice',
			'limitbooking',
			'loadmodule',
			'nanogallery',
			'qrcode',
			'rescode',
			'sms',
			'statistics',
			'stream',
		),
		'solidrespayment'   => array(
			'bankwire',
			'paylater',
			'alipay',
			'atlantic',
			'authorizenet',
			'braintree',
			'cielo',
			'cimb',
			'easypay',
			'eway',
			'mercadopago',
			'migs',
			'mollie',
			'offline',
			'onlinepay',
			'paydollar',
			'payfast',
			'paypal',
			'paypal_pro',
			'payplug',
			'postfinance',
			'stripe',
			'unionpay'
		),
		'experiencepayment' => array(
			'authorizenet',
			'bankwire',
			'offline',
			'paylater',
			'paypal',
			'paypalpro',
			'stripe'
		)
	);

	protected $solidresModules = array(
		'mod_sr_checkavailability',
		'mod_sr_currency',
		'mod_sr_summary',
		'mod_sr_availability',
		'mod_sr_camera',
		'mod_sr_clocks',
		'mod_sr_coupons',
		'mod_sr_extras',
		'mod_sr_feedbacks',
		'mod_sr_map',
		'mod_sr_quicksearch',
		'mod_sr_roomtypes',
		'mod_sr_statistics',
		'mod_sr_vegas',
		'mod_sr_tracking',
		'mod_sr_experience_extras',
		'mod_sr_experience_list',
		'mod_sr_experience_filter',
		'mod_sr_experience_search',
		'mod_sr_experience_tracking',
		'mod_sr_advancedsearch',
		'mod_sr_assets',
		'mod_sr_filter',
		'mod_sr_locationmap',
		'mod_sr_myrecentsearches',
		'mod_sr_surroundings',
	);

	protected $solidresTemplates = array();
	protected $languageFiles = array();
	protected $updates = array();

	public function display($tpl = null)
	{
		$this->addToolbar();

		$dbo            = Factory::getDbo();
		$app            = Factory::getApplication();
		$query          = $dbo->getQuery(true);
		$user           = Factory::getUser();
		$isSuperAdmin   = $user->authorise('core.admin');
		$isAdmin        = $app->isClient('administrator');
		$solidresConfig = ComponentHelper::getParams('com_solidres');

		$query->select('COUNT(*)')->from($dbo->quoteName('#__sr_reservation_assets'));
		$this->hasExistingData = $dbo->setQuery($query)->loadResult();
		$this->updates         = SRUtilities::getUpdates();

		$this->loadProperties();

		if ($isAdmin
			&& $isSuperAdmin
			&& $app->input->get('option') == 'com_solidres'
		)
		{
			$query = $dbo->getQuery(true);

			if (!SRPlugin::isEnabled('hub') && $solidresConfig->get('main_activity', '') != 1)
			{
				$query->select('COUNT(*)')->from($dbo->quoteName('#__sr_reservation_assets'))->where($dbo->quoteName('default') . ' = 1');
				$count = $dbo->setQuery($query)->loadResult();

				if ($count >= 2)
				{
					$app->enqueueMessage(Text::_('SR_WARNING_MORE_THAN_1_DEFAULT_IS_NOT_ALLOWED'), 'warning');
				}
				else if ($count == 0)
				{
					$app->enqueueMessage(Text::_('SR_WARNING_REQUIRE_AT_LEAST_1_DEFAULT_ASSET'), 'warning');
				}
			}

			if (SRPlugin::isEnabled('hub'))
			{
				$query->select('COUNT(*)')
					->from($dbo->quoteName('#__menu'))
					->where($dbo->quoteName('link') . ' = ' . $dbo->quote('index.php?option=com_solidres&view=dashboard') . ' AND ' . $dbo->quoteName('published') . ' = 1');
				$count = $dbo->setQuery($query)->loadResult();

				if ($count == 0)
				{
					$app->enqueueMessage(Text::_('SR_WARNING_HUB_MENU_TYPE_NOT_CREATED'), 'warning');
				}

				if (empty($solidresConfig->get('partner_user_groups', array())))
				{
					$app->enqueueMessage(Text::_('SR_WARNING_HUB_PARTNER_GROUP_NOT_FOUND'), 'warning');
				}

				if (empty($solidresConfig->get('google_map_static_api_key', '')))
				{
					$app->enqueueMessage(Text::_('SR_WARNING_GOOGLE_MAP_STATIC_API_KEY_IS_MISSING'), 'warning');
				}
			}

			if (empty($solidresConfig->get('google_map_api_key', '')))
			{
				$app->enqueueMessage(Text::_('SR_WARNING_GOOGLE_MAP_API_KEY_IS_MISSING'), 'warning');
			}
		}

		HTMLHelper::_('bootstrap.framework');

		parent::display($tpl);
	}

	/**
	 * Add the page title and toolbar.
	 *
	 * @since    1.6
	 */
	protected function addToolbar()
	{
		require_once JPATH_COMPONENT . '/helpers/toolbar.php';

		$canDo = SolidresHelper::getActions();

		ToolbarHelper::title(Text::_('SR_SUBMENU_SYSTEM'));

		ToolbarHelper::link('index.php?option=com_solidres', 'JToolbar_Close', 'arrow-left');

		if ($canDo->get('core.admin'))
		{
			$token = '&' . JSession::getFormToken() . '=1';
			$url   = 'index.php?option=com_solidres&task=system.checkUpdates' . $token;
			ToolbarHelper::link($url, 'SR_CHECK_UPDATES', 'refresh');

			$url = 'index.php?option=com_solidres&task=system.downloadJson' . $token;
			ToolbarHelper::link($url, 'SR_TOOLBAR_DOWNLOAD_AS_JSON', 'download');
			ToolbarHelper::preferences('com_solidres');
		}
	}

	public function loadProperties()
	{
		$this->solidresTemplates = $this->get('SolidresTemplates');

		$languageFiles = Folder::files(JPATH_ROOT . '/administrator/components/com_solidres/language', '\.ini$', true, true);
		$languageFiles = array_merge($languageFiles, Folder::files(JPATH_ROOT . '/components/com_solidres/language', '\.ini$', true, true));

		foreach ($this->solidresModules as $module)
		{
			$moduleAdmin = JPATH_ADMINISTRATOR . '/modules/' . $module . '/language';
			$moduleSite  = JPATH_ROOT . '/modules/' . $module . '/language';

			if (is_dir($moduleAdmin))
			{
				$languageFiles = array_merge($languageFiles, Folder::files($moduleAdmin, '\.ini$', true, true));
			}
			elseif (is_dir($moduleSite))
			{
				$languageFiles = array_merge($languageFiles, Folder::files($moduleSite, '\.ini$', true, true));
			}
		}

		foreach ($this->solidresPlugins as $group => $plugins)
		{
			foreach ($plugins as $plugin)
			{
				$pluginLanguagePath = JPATH_PLUGINS . '/' . $group . '/' . $plugin . '/language';

				if (is_dir($pluginLanguagePath))
				{
					$languageFiles = array_merge($languageFiles, Folder::files($pluginLanguagePath, '\.ini$', true, true));
				}
			}
		}

		if ($this->solidresTemplates)
		{
			foreach ($this->solidresTemplates as $solidresTemplate)
			{
				$templatePath = JPATH_ROOT . '/templates/' . $solidresTemplate->template . '/language';

				if (is_dir($templatePath))
				{
					$languageFiles = array_merge($languageFiles, Folder::files($templatePath, '\.ini$', true, true));
				}
			}
		}

		$this->languageFiles = $languageFiles;
	}
}