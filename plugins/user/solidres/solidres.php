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
 * Solidres User plugin
 *
 * @package     Solidres
 * @subpackage  Customer
 * @since       0.6.0
 */

//use GeoIp2\Database\Reader;
use Joomla\CMS\Factory;
use Joomla\CMS\Form\Form;
use Joomla\Utilities\ArrayHelper;
use Joomla\Utilities\IpHelper;
use Joomla\CMS\User\UserHelper;

JLoader::import('solidres.plugin.plugin');

class plgUserSolidres extends SRPlugin
{

	/**
	 * Application object
	 *
	 * @var    JApplicationCms
	 * @since  3.2
	 */
	protected $app;

	/**
	 * Database object
	 *
	 * @var    JDatabaseDriver
	 * @since  3.2
	 */
	protected $db;

	/**
	 * Remove all sessions for the user name
	 *
	 * Method is called after user data is deleted from the database
	 *
	 * @param   array   $user    Holds the user data
	 * @param   boolean $success True if user was succesfully stored in the database
	 * @param   string  $msg     Message
	 *
	 * @return  boolean
	 *
	 * @since   1.6
	 */
	public function onUserAfterDelete($user, $success, $msg)
	{
		if (!$success)
		{
			return false;
		}

		JTable::addIncludePath($this->_getAdminPath() . '/tables');
		$customerTable = JTable::getInstance('Customer', 'SolidresTable');
		$customerTable->load(array('user_id' => $user['id']));

		// Handle relationship with Solidres's Customers
		$query = $this->db->getQuery(true);

		// Take care of Reservation
		$query->update($this->db->quoteName('#__sr_reservations'))
			->set('customer_id = NULL')
			->where('customer_id = ' . $this->db->quote($customerTable->id));
		$this->db->setQuery($query)->execute();

		// Take care of Customer Fields
		$query->clear();
		$query->delete()->from($this->db->quoteName('#__sr_customer_fields'))
			->where('user_id = ' . $this->db->quote($customerTable->id));
		$this->db->setQuery($query)->execute();

		// Take care of relation ship with Reservation Asset
		$query->clear();
		$query->update($this->db->quoteName('#__sr_reservation_assets'))
			->set('partner_id = NULL')
			->where('partner_id = ' . $this->db->quote($customerTable->id));
		$this->db->setQuery($query)->execute();

		// Take care of Customer itself
		$query->clear();
		$query->delete()->from($this->db->quoteName('#__sr_customers'))
			->where('id = ' . $this->db->quote($customerTable->id));
		$this->db->setQuery($query)->execute();

		return true;
	}

	/**
	 * Utility method to act on a user after it has been saved.
	 *
	 * This method sends a registration email to new users created in the backend.
	 *
	 * By default: in the built-in onUserAfterSave, Joomla only send email if the user is registered from backend. We
	 *             need to modify it in order to send email for user who is registerd from front end as well.
	 *
	 * @param   array   $user    Holds the new user data.
	 * @param   boolean $isnew   True if a new user is stored.
	 * @param   boolean $success True if user was succesfully stored in the database.
	 * @param   string  $msg     Message.
	 *
	 * @return  void
	 *
	 * @since   1.6
	 */
	public function onUserAfterSave($user, $isnew, $success, $msg)
	{
		$this->saveUserProfile($user, $isnew, $success);
	}

	/*
	 * Create a new Joomla user before we create a new Solidres's customer.
	 *
	 * The procedure is different between front end and back end.
	 *
	 * @param $data
	 * @param $table
	 * @param $isNew
	 * @param $response
	 *
	 * @return bool
	 */
	public function onCustomerBeforeSave($data, $table, $isNew, &$response)
	{
		$app                = JFactory::getApplication();
		$isSite             = $app->isClient('site');
		$solidresConfig     = JComponentHelper::getParams('com_solidres');
		$customerUserGroups = $solidresConfig->get('customer_user_groups', array(2));
		$lang               = Factory::getLanguage();

		$lang->load('com_users', JPATH_SITE);
		$userData = array(
			'id'        => $data['user_id'],
			'username'  => $data['username'],
			'password'  => $data['password'],
			'password2' => $data['password2'],
			'password1' => $data['password2'],
			'email'     => $data['email'],
			'email1'    => $data['email'],
		);

		if (isset($data['Solidres_fields']['customer_firstname']))
		{
			$userData['name'] = $data['Solidres_fields']['customer_firstname'];

			if (isset($data['Solidres_fields']['customer_middlename']))
			{
				$userData['name'] .= ' ' . $data['Solidres_fields']['customer_middlename'];
			}

			$userData['name'] .= ' ' . $data['Solidres_fields']['customer_lastname'];
		}
		else
		{
			$userData['name'] = $data['firstname'] . ' ' . $data['middlename'] . ' ' . $data['lastname'];
		}

		if (!$isSite || !$isNew) // Special case for Customer Dashboard profile editing
		{
			$pk         = (!empty($userData['id'])) ? $userData['id'] : 0;
			$joomlaUser = JUser::getInstance($pk);

			if (empty($joomlaUser->groups))
			{
				$userData['groups'] = $customerUserGroups;
			}

			if (!$joomlaUser->bind($userData))
			{
				$table->setError($joomlaUser->getError());

				return false;
			}

			$result = $joomlaUser->save();

			if (!$result)
			{
				$table->setError($joomlaUser->getError());

				return false;
			}

			// Assign the recent insert joomla user id
			$response = $joomlaUser->id;

			return true;
		}
		else // For front end, just use the way Joomla register a user
		{
			JModelLegacy::addIncludePath(JPATH_SITE . '/components/com_users/models', 'UsersModel');
			Form::addFormPath(JPATH_SITE . '/components/com_users/forms');
			$model = JModelLegacy::getInstance('Registration', 'UsersModel', ['ignore_request' => true]);

			// Attempt to save the data.
			$return = $model->register($userData);

			// Assign the recent insert joomla user id to response, so that we can store it into customer's table
			if (is_numeric($return))
			{
				$response = $return;
			}
			else if (in_array($return, ['useractivate', 'adminactivate']))
			{
				$response = UserHelper::getUserId($userData['username']);
			}
		}
	}

	protected function defines()
	{
		$this->setPluginName('user');
		parent::defines();
	}

	/*public static function autoLoadCountry()
	{
		$app       = JFactory::getApplication();
		$countryId = $app->getUserState('com_solidres.user.country_id', null);

		if (null === $countryId)
		{
			JLoader::import('maxmind.lib.autoload', SR_PLUGIN_USER_PATH . '/libraries');
			$countryId = 0;

			try
			{
				$reader  = new Reader(SR_PLUGIN_USER_PATH . '/libraries/maxmind/db/GeoLite2-Country.mmdb');
				$detect  = $reader->country($_SERVER['REMOTE_ADDR']);
				$isoCode = strtoupper($detect->country->isoCode);
			}
			catch (Exception $e)
			{
				$isoCode = null;
			}

			if (null !== $isoCode)
			{
				$db    = JFactory::getDbo();
				$query = $db->getQuery(true)
					->select('c.id')
					->from($db->quoteName('#__sr_countries', 'c'))
					->where('c.code_2 = ' . $db->quote($isoCode));
				$db->setQuery($query);
				$countryId = (int) $db->loadResult();
			}

			$app->setUserState('com_solidres.user.country_id', $countryId);
		}

		return $countryId;
	}*/

	protected function getMenuTypeOptions()
	{
		$viewPath = $this->_getSitePath() . '/views';

		return array(
			'customer' => $viewPath . '/customer/tmpl/default.xml'
		);
	}

	public function onContentPrepareForm(JForm $form, $data)
	{
		if (!($form instanceof JForm))
		{
			$this->_subject->setError('JERROR_NOT_A_FORM');

			return false;
		}

		$formName      = $form->getName();
		$edit          = $this->app->input->getWord('layout') === 'edit';
		$allowContexts = array(
			'com_solidres.customer',
			'com_admin.profile',
			'com_users.user',
			'com_users.profile',
			'com_users.registration',
		);

		if (!SRPlugin::isEnabled('customfield')
			|| !in_array($formName, $allowContexts)
		)
		{
			return true;
		}

		require_once SRPlugin::getAdminPath('customfield') . '/helpers/customfield.php';
		require_once SRPlugin::getAdminPath('customfield') . '/helpers/customfieldvalue.php';

		$language = JFactory::getLanguage();
		$language->load('com_solidres', JPATH_BASE . '/components/com_solidres')
		|| $language->load('com_solidres', JPATH_BASE);
		$id = (int) $form->getValue('id', null, 0);

		// Skip adding our custom fields if user is not consented to the privacy
		if (
			in_array($formName, array('com_users.profile', 'com_users.registration'))
			&& !$this->isUserConsented($id > 0 ? $id : JFactory::getUser()->id)
			&& JPluginHelper::isEnabled('system', 'privacyconsent')
		)
		{
			return true;
		}

		if ($id < 1)
		{
			$registry = new Joomla\Registry\Registry($data);
			$id       = (int) $registry->get('id', 0);
		}

		$ignoreFieldsNames = [
			'customer_note',
			'customer_email',
			'customer_email2',
		];

		$source = [];
		$fields = SRCustomFieldHelper::findFields(['context' => 'com_solidres.customer']);

		foreach($fields as $field)
		{
			if ($field->type != 'file')
			{
				$source[] = $field;
			}

			if ($this->app->isClient('administrator'))
			{
				$field->optional = 1;
			}
		}

		$xml = SRCustomFieldHelper::buildFields($source, 'Solidres_fields', $ignoreFieldsNames);

		if ($form->load($xml->saveXML()))
		{
			foreach ($form->getGroup('Solidres_fields') as $field)
			{
				if ($field->getAttribute('name') == 'file')
				{
					$form->removeField($field->getAttribute('name'), 'Solidres_fields');
				}
			}

			if ($id > 0)
			{
				JTable::addIncludePath(SRPlugin::getAdminPath('user') . '/tables');
				$customerTable = JTable::getInstance('Customer', 'SolidresTable');
				$fieldsData    = array(
					'Solidres_fields' => array(),
				);

				if ($formName == 'com_solidres.customer')
				{
					$load = $customerTable->load($id);

					foreach ($form->getFieldset('fields') as $field)
					{
						$form->removeField($field->getAttribute('name'), 'Solidres_fields');
					}
				}
				else
				{
					$load = $customerTable->load(array('user_id' => $id));
				}

				if ($fieldsValues = SRCustomFieldHelper::getValues(array('context' => 'com_solidres.customer.profile.' . $customerTable->user_id)))
				{
					foreach ($fieldsValues as $fieldsValue)
					{
						if ($name = $fieldsValue->field->get('field_name'))
						{
							if ($edit)
							{
								$fieldsData['Solidres_fields'][$name] = isset($fieldsValue->orgValue) ? $fieldsValue->orgValue : $fieldsValue->value;
							}
							else
							{
								$fieldsData['Solidres_fields'][$name] = $fieldsValue->value;
							}
						}
					}
				}

				if ($load)
				{
					foreach ($customerTable->getProperties() as $name => $value)
					{
						if (strpos($name, 'customer') !== 0)
						{
							$name = 'customer_' . $name;
						}

						if (!isset($fieldsData['Solidres_fields'][$name]))
						{
							$fieldsData['Solidres_fields'][$name] = $value;
						}
					}
				}

				$form->bind($fieldsData);
			}
		}

		JFactory::getDocument()->addScriptDeclaration('
			Solidres.jQuery(document).ready(function($){
				var country = $("#jform_Solidres_fields_customer_country_id");
	
				if (country.length) {
					var state = $("#jform_Solidres_fields_customer_geo_state_id");
					var selected = state.val();
	
					country.on("change", function(){
						var countryId = $(this).val();
	
						if (countryId == "") {
							state.html("").trigger("liszt:updated");
						} else {
							$.ajax({
								url : "' . JUri::root(true) . '/index.php?option=com_solidres&format=json&task=states.find&id=" + countryId,
								type: "post",
								success : function(html) {
									html = $.trim(html);
	
									if (html.indexOf("<option") === 0) {
										state.html(html).val(selected).trigger("liszt:updated");
									} else {
										state.html("").trigger("liszt:updated");
									}
								}
							});
						}
	
					});
	
					country.trigger("change");
				}
			});
		');

		return true;
	}

	protected function saveUserProfile($data, $isNew, $result)
	{
		if (!SRPlugin::isEnabled('customfield'))
		{
			return false;
		}

		$arrayData = (array) $data;
		$userId    = ArrayHelper::getValue($arrayData, 'id', 0, 'int');

		if ($result)
		{
			try
			{
				if (empty($arrayData['Solidres_fields']))
				{
					$jform                        = JFactory::getApplication()->input->get('jform', array(), 'array');
					$arrayData['Solidres_fields'] = isset($jform['Solidres_fields']) ? $jform['Solidres_fields'] : array();
				}

				JTable::addIncludePath(__DIR__ . '/administrator/components/com_solidres/tables');
				$customerTable = JTable::getInstance('Customer', 'SolidresTable');

				if (!$customerTable->load(array('user_id' => $userId)))
				{
					$customerTable->set('user_id', $userId);
					$customerTable->set('customer_group_id', null);
					$customerTable->set('customer_code', '');
				}

				$fields = SRCustomFieldHelper::findFields(array('context' => 'com_solidres.customer'));

				if ($fields && !empty($arrayData['Solidres_fields']))
				{
					$dataValue = array();

					foreach ($fields as $field)
					{
						if (isset($arrayData['Solidres_fields'][$field->field_name]))
						{
							$value       = $arrayData['Solidres_fields'][$field->field_name];
							$dataValue[] = array(
								'id'      => 0,
								'context' => 'com_solidres.customer.profile.' . $userId,
								'value'   => $value,
								'storage' => $field
							);

							if (strpos($field->field_name, 'customer_') === 0)
							{
								$name = str_replace('customer_', '', $field->field_name);

								if (property_exists($customerTable, $name))
								{
									if (empty($value) && in_array($name, array('country_id', 'geo_state_id')))
									{
										$value = null;
									}

									$customerTable->set($name, $value);
								}
							}
						}
					}

					if (count($dataValue))
					{
						SRCustomFieldHelper::storeValues($dataValue, $isNew);
					}
				}

				$customerTable->store(true);
			}
			catch (RuntimeException $e)
			{
				$this->_subject->setError($e->getMessage());

				return false;
			}
		}

		return true;
	}

	/**
	 * Method to check if the given user has consented yet
	 *
	 * @param   integer  $userId  ID of uer to check
	 *
	 * @return  boolean
	 *
	 * @since   3.9.0
	 */
	private function isUserConsented($userId)
	{
		$query = $this->db->getQuery(true);
		$query->select('COUNT(*)')
			->from('#__privacy_consents')
			->where('user_id = ' . (int) $userId)
			->where('subject = ' . $this->db->quote('PLG_SYSTEM_PRIVACYCONSENT_SUBJECT'))
			->where('state = 1');
		$this->db->setQuery($query);

		return (int) $this->db->loadResult() > 0;
	}
}
