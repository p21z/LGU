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

use Joomla\CMS\Router\Route;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Toolbar\Toolbar;
use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Factory as CMSFactory;

/**
 * View to edit a coupon in front end
 *
 * @package     Solidres
 * @subpackage	MyProfile
 * @since		0.6.0
 */
class SolidresViewMyProfile extends SRViewLegacy
{
	protected $state;
	protected $form;
	protected $returnPage;
	protected $id;
	protected $config;

	public function display($tpl = null)
	{
		$user = CMSFactory::getUser();
		$app  = CMSFactory::getApplication();

		if ($user->guest)
		{
			$return = JUri::getInstance()->toString();
			$app->redirect(Route::_('index.php?option=com_users&view=login&return=' . base64_encode($return), false));

			return false;
		}

		$this->state      = $this->get('State');
		$this->form       = $this->getForm('Form');
		$this->returnPage = $this->getModel()->getReturnPage();
		$this->id         = $this->form->getValue('id');
		$doc              = CMSFactory::getDocument();
		$language         = CMSFactory::getLanguage();

		$language->load('com_solidres', JPATH_ADMINISTRATOR . '/components/com_solidres', null, 1);

		$doc->addScriptDeclaration("
			Solidres.jQuery(function($) {
				$('.country_select').change(function() {
					$.ajax({
						url : 'index.php?option=com_solidres&format=json&task=states' + Solidres.context + '.find&id=' + $(this).val(),
						success : function(html) {
							$('.state_select').empty().html(html);
						}
					});
				});
			});
		");

		if (count($errors = $this->get('Errors')))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		$this->config            = JComponentHelper::getParams('com_solidres');
		$this->showPoweredByLink = $this->config->get('show_solidres_copyright', '1');
		$customerUserGroups      = $this->config->get('customer_user_groups', []);
		$userGroups              = $user->getAuthorisedGroups();
		$access                  = false;

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
			$app->enqueueMessage(JText::_('JERROR_ALERTNOAUTHOR'), 'error');
			$app->setHeader('status', 403, true);

			return false;
		}

		$options = ['relative' => true, 'version' => SRVersion::getHashVersion()];
		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', $options);
		HTMLHelper::_('stylesheet', 'plg_solidres_hub/assets/hub.min.css', $options);
		SRHtml::_('jquery.datepicker');

		$this->addToolbar();
		SRLayoutHelper::addIncludePath(SRPlugin::getSitePath('user').'/layouts');

		parent::display($tpl);
	}

	/**
	 * Add the page title and toolbar.
	 *
	 * @since	1.6
	 */
	protected function addToolbar()
	{
		JLoader::register('Joomla\\CMS\\Toolbar\\Toolbar', JPATH_LIBRARIES . '/src/Toolbar/Toolbar.php');
		JLoader::register('Joomla\\CMS\\Toolbar\\ToolbarHelper', JPATH_LIBRARIES . '/src/Toolbar/ToolbarHelper.php');
		SRHtml::_('jquery.validate');
		ToolbarHelper::apply('myprofile.apply', 'JToolbar_Apply');

		$bar     = Toolbar::getInstance('toolbar');
		$html    = array();
		$onClick = 'if(confirm(\'' . JText::_('SR_API_KEY_GENERATE_CONFIRM') . '\')) Joomla.submitbutton(\'myprofile.generateKeys\')';
		if (SR_ISJ4)
		{
			$html[] = '<joomla-toolbar-button>';
		}
		$html[]  = '<button type="button" class="btn btn-primary btn-small" onclick="' . $onClick . '">';
		$html[]  = ' 	<i class="icon-key"></i> ' . JText::_('SR_API_GENERATE_KEYS');
		$html[]  = '</button>';

		if (SR_ISJ4)
		{
			$html[] = '</joomla-toolbar-button>';
		}
		$bar->appendButton('Custom', join("\n", $html), 'generateKeys');

		ToolbarHelper::cancel('myprofile.cancel', 'JToolbar_Close');
	}
}
