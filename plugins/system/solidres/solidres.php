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

jimport('solidres.plugin.plugin');
jimport('solidres.version');

class plgSystemSolidres extends JPlugin
{
	protected $autoloadLanguage = true;

	protected $app;

	public function __construct($subject, $config = array())
	{
		parent::__construct($subject, $config);

		if (file_exists(JPATH_LIBRARIES . '/solidres/defines.php'))
		{
			require_once JPATH_LIBRARIES . '/solidres/defines.php';
		}

		JLoader::registerNamespace('Solidres', JPATH_LIBRARIES . '/solidres/src');
		JLoader::import('libraries.solidres.factory', JPATH_ROOT);
		JLoader::import('libraries.solidres.html.html', JPATH_ROOT);
		JLoader::register('SRConfig', JPATH_LIBRARIES . '/solidres/config/config.php');
		JLoader::register('SRCurrency', SRPATH_LIBRARY . '/currency/currency.php');
		JLoader::register('SRUtilities', SRPATH_LIBRARY . '/utilities/utilities.php');
		JLoader::register('SRToolbarHelper', SRPATH_LIBRARY . '/toolbar/toolbar.php');
		JLoader::register('SRLayoutHelper', JPATH_ADMINISTRATOR . '/components/com_solidres/helpers/layout.php');
	}

	public function onAfterRoute()
	{
		if (SR_ISJ4)
		{
			$this->app->loadDocument();
		}

		$solidresConfig = JComponentHelper::getParams('com_solidres');
		$isAdmin        = $this->app->isClient('administrator');
		$isSite         = $this->app->isClient('site');

		JHtml::_('behavior.core');
		JHtml::_('jquery.framework');

		if (class_exists('SRHtml'))
		{
			SRHtml::_('js.noconflict');

			if ($isAdmin && $this->app->input->get('option') == 'com_solidres')
			{
				SRHtml::_('jquery.ui');
				SRHtml::_('js.admin');
			}

			if ($isSite)
			{
				SRHtml::_('jquery.ui');
				SRHtml::_('js.site');
			}

			SRHtml::_('js.common');
			SRHtml::_('jquery.cookie');
			SRHtml::_('jquery.validate');
		}

		JPluginHelper::importPlugin('user');
		JPluginHelper::importPlugin('solidres');
		$this->app->triggerEvent('onSolidresPluginRegister');

		$lang = JFactory::getLanguage();

		if ($this->app->input->get('option') == 'com_solidres' && ($isSite || $isAdmin))
		{
			$lang->load('com_solidres', JPATH_ADMINISTRATOR . '/components/com_solidres', null, 1);
		}

		if (SRPlugin::isEnabled('advancedextra'))
		{
			JLoader::register('SRExtra', JPATH_PLUGINS . '/solidres/advancedextra/libraries/extra/extra.php');
		}
		else
		{
			JLoader::register('SRExtra', JPATH_LIBRARIES . '/solidres/extra/extra.php');
		}

		$facebookAppID  = $solidresConfig->get('facebook_app_id');
		if ($facebookAppID)
		{
			$locate         = str_replace('-', '_', $lang->getTag());
			$facebookScript = '
			Solidres.jQuery(function($) {
				$.ajaxSetup({cache: true});
				$.getScript("//connect.facebook.net/' . $locate . '/sdk.js", function(){
					FB.init({
						appId: "' . $facebookAppID . '",
						version: "v2.8"
					});						
				});
			});';
			JFactory::getDocument()->addScriptDeclaration($facebookScript);
		}

		JFactory::getDocument()->addScriptOptions('com_solidres.general', [
			'JVersion' => SR_ISJ4 ? '4' : '3'
		]);

		JFactory::getDocument()->addScriptDeclaration('
			(function() {
				Solidres.options.load({
					"Hub":' . (SRPlugin::isEnabled('hub') ? 1 : 0) . ',
					"ChannelManager":' . (SRPlugin::isEnabled('channelmanager') ? 1 : 0) . ',
					"AutoScroll": ' . $solidresConfig->get('enable_auto_scroll', 1) . ',
					"AutoScrollTariff": ' . $solidresConfig->get('auto_scroll_tariff', 1) . ',
					"RootURI": "' . JUri::root() . '",
					"BaseURI": "' . JUri::base() . '",
					"JVersion": "' . (SR_ISJ4 ? '4' : '3') . '"
				});
			})();	
				
			Solidres.jQuery.validator.setDefaults({
			    errorPlacement: function (error, element) {
			        if (element.parents("[data-fieldset-group]").length) {
			            error.insertAfter(element.parents("[data-fieldset-group]"));
			        } else {
			            error.insertAfter(element);
			        }
			    }
			});	
		');

		if ($isSite)
		{
			if ($solidresConfig->get('enable_carousel_compat', 0))
			{
				JFactory::getDocument()->addScriptDeclaration('
					if (typeof window.addEvent === "function") {
						window.addEvent("domready", function() {
							if (typeof jQuery != "undefined" && typeof MooTools != "undefined" ) {
								Element.implement({
									slide: function(how, mode) {
										return this;
									}
								});
							}
						});
					}
				');
			}

			if (SRPlugin::isEnabled('hub'))
			{
				$activeCurrencyId = $this->app->getUserState('current_currency_id', 0);

				if (0 == $activeCurrencyId)
				{
					$defaultCurrencyId = $solidresConfig->get('default_currency_id', 0);
					if ($defaultCurrencyId > 0)
					{
						$this->app->setUserState('current_currency_id', $defaultCurrencyId);
					}
				}
			}
		}

		if (!defined('SR_LAYOUT_STYLE'))
		{
			define('SR_LAYOUT_STYLE', $solidresConfig->get('layout_style', ''));
		}
	}

	public function onAfterRender()
	{
		$solidresConfig     = JComponentHelper::getParams('com_solidres');
		$solidresConfigData = new SRConfig(array('scope_id' => 0, 'data_namespace' => 'system'));
		$lastUpdateCheck    = $solidresConfigData->get('system/last_update_check', '');
		$needUpdateChecking = false;
		$updateSourceFile   = JPATH_ADMINISTRATOR . '/components/com_solidres/views/system/cache/updates.json';

		if ($this->app->isClient('administrator'))
		{
			if (empty($lastUpdateCheck) || !JFile::exists($updateSourceFile))
			{
				$needUpdateChecking = true;
			}
			else
			{
				$now     = JFactory::getDate('now', 'UTC');
				$nextRun = JFactory::getDate($lastUpdateCheck, 'UTC');
				$nextRun->add(new DateInterval('PT24H'));

				if ($now->toUnix() > $nextRun->toUnix())
				{
					$needUpdateChecking = true;
				}
			}

			if ($needUpdateChecking)
			{
				JLoader::register('SolidresControllerSystem', JPATH_ADMINISTRATOR . '/components/com_solidres/controllers/system.php');
				$solidresSystemCtrl = new SolidresControllerSystem();
				$url                = 'https://www.solidres.com/checkupdates';
				$solidresSystemCtrl->postFindUpdates($url);
				$solidresConfigData->set(array('last_update_check' => JFactory::getDate('now', 'UTC')->toUnix()));
			}
		}

		if ($solidresConfig->get('enable_multilingual_mode', 1) == 1)
		{
			if ($this->app->isClient('administrator')) return true;

			$buffer = $this->app->getBody();

			if (strpos($buffer, '{lang') === false) return true;

			$regexTextarea = "#<textarea(.*?)>(.*?)<\/textarea>#is";
			$regexInput    = "#<input(.*?)>#is";

			$matches = array();
			preg_match_all($regexTextarea, $buffer, $matches, PREG_SET_ORDER);
			$textarea = array();
			foreach ($matches as $key => $match)
			{
				if (strpos($match[0], '{lang') !== false)
				{
					$textarea[$key] = $match[0];
					$buffer         = str_replace($textarea[$key], '~^t' . $key . '~', $buffer);
				}
			}

			$matches = array();
			preg_match_all($regexInput, $buffer, $matches, PREG_SET_ORDER);
			$input = array();
			foreach ($matches as $key => $match)
			{
				if (
					(strpos($match[0], 'type="password"') !== false ||
						strpos($match[0], 'type="text"') !== false) &&
					strpos($match[0], '{lang') !== false
				)
				{
					$input[$key] = $match[0];
					$buffer      = str_replace($input[$key], '~^i' . $key . '~', $buffer);
				}
			}

			if (strpos($buffer, '{lang') !== false)
			{
				$buffer = SRUtilities::filterText($buffer);

				if ($textarea)
				{
					foreach ($textarea as $key => $t)
					{
						$buffer = str_replace('~^t' . $key . '~', $t, $buffer);
					}
					unset($textarea);
				}
				if ($input)
				{
					foreach ($input as $key => $i)
					{
						$buffer = str_replace('~^i' . $key . '~', $i, $buffer);
					}
					unset($input);
				}
				$this->app->setBody($buffer);
			}

			unset($buffer);
		}
	}
}
