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

use Joomla\CMS\Factory;
use Joomla\CMS\Form\FormField;
use Joomla\CMS\Language\Text;
use Joomla\CMS\User\User;
use Joomla\CMS\HTML\HTMLHelper;

class JFormFieldCustomer extends FormField
{
	/**
	 * The form field type.
	 *
	 * @var    string
	 * @since  1.6
	 */
	public $type = 'Customer';

	/**
	 * Filtering groups
	 *
	 * @var   array
	 * @since 3.5
	 */
	protected $groups = null;

	/**
	 * Users to exclude from the list of users
	 *
	 * @var   array
	 * @since 3.5
	 */
	protected $excluded = null;

	/**
	 * Layout to render
	 *
	 * @var   string
	 * @since 3.5
	 */
	protected $layout = SR_ISJ4 ? 'solidres.form.field.customer' : null;

	/**
	 * Method to attach a Form object to the field.
	 *
	 * @param   \SimpleXMLElement  $element  The SimpleXMLElement object representing the `<field>` tag for the form field object.
	 * @param   mixed              $value    The form field value to validate.
	 * @param   string             $group    The field name group control value. This acts as an array container for the field.
	 *                                       For example if the field has name="foo" and the group value is set to "bar" then the
	 *                                       full field name would end up being "bar[foo]".
	 *
	 * @return  boolean  True on success.
	 *
	 * @since   3.7.0
	 *
	 * @see     FormField::setup()
	 */
	public function setup(\SimpleXMLElement $element, $value, $group = null)
	{
		$return = parent::setup($element, $value, $group);

		// If user can't access com_users the field should be readonly.
		if ($return && !$this->readonly)
		{
			$this->readonly = !Factory::getUser()->authorise('core.manage', 'com_users');
		}

		return $return;
	}

	/**
	 * Method to get the user field input markup.
	 *
	 * @return  string  The field input markup.
	 *
	 * @since   1.6
	 */
	protected function getInput()
	{
		if (SR_ISJ4)
		{
			if (empty($this->layout))
			{
				throw new \UnexpectedValueException(sprintf('%s has no layout assigned.', $this->name));
			}

			return $this->getRenderer($this->layout)->render($this->getLayoutData());
		}
		else
		{
			JHtml::_('bootstrap.framework');

			$html = array();

			if (SRPlugin::isEnabled('user'))
			{
				$groups   = $this->getGroups();
				$excluded = $this->getExcluded();
				$link     = 'index.php?option=com_solidres&amp;view=customers&amp;layout=modal&amp;tmpl=component&amp;field=' . $this->id
					. (isset($groups) ? ('&amp;groups=' . base64_encode(json_encode($groups))) : '')
					. (isset($excluded) ? ('&amp;excluded=' . base64_encode(json_encode($excluded))) : '');

				// Initialize some field attributes.
				$attr = !empty($this->class) ? ' class="' . $this->class . '"' : '';
				$attr .= !empty($this->size) ? ' size="' . $this->size . '"' : '';
				$attr .= $this->required ? ' required' : '';

				// Build the script.
				$script   = array();
				$script[] = '	function jSelectPartner_' . $this->id . '(id, title) {';
				$script[] = '		var old_id = document.getElementById("' . $this->id . '_id").value;';
				$script[] = '		if (old_id != id) {';
				$script[] = '			document.getElementById("' . $this->id . '_id").value = id;';
				$script[] = '			document.getElementById("' . $this->id . '").value = title;';
				$script[] = '			document.getElementById("' . $this->id . '").className = document.getElementById("' . $this->id . '").className.replace(" invalid" , "");';
				$script[] = '			' . $this->onchange;
				$script[] = '		}';
				$script[] = '		parent.Solidres.jQuery("#' . $this->id . '-modal").modal("hide")';
				$script[] = '	}';

				// Add the script to the document head.
				JFactory::getDocument()->addScriptDeclaration(implode("\n", $script));

				// Load the current username if available.
				JTable::addIncludePath(SRPlugin::getAdminPath('user') . '/tables');
				$table     = JTable::getInstance('Customer', 'SolidresTable');
				$userTable = JTable::getInstance('User');

				if (is_numeric($this->value))
				{
					$table->load($this->value);
					$userTable->load($table->user_id);
				}
				// Handle the special case for "current".
				elseif (strtoupper($this->value) == 'CURRENT')
				{
					// 'CURRENT' is not a reasonable value to be placed in the html
					$this->value = JFactory::getUser()->id;
					$table->load($this->value);
				}

				// Create a dummy text field with the user name.
				$html[] = '<div class="input-append">';
				$html[] = '	<input type="text" id="' . $this->id . '" value="' . htmlspecialchars($userTable->username, ENT_COMPAT, 'UTF-8') . '"'
					. ' readonly' . $attr . ' />';

				// Create the user select button.
				if ($this->readonly === false)
				{
					$html[] = '		<a class="btn btn-primary modal_' . $this->id . '" title="' . JText::_('JLIB_FORM_CHANGE_USER') . '"'
						. ' href="#' . $this->id . '-modal" data-toggle="modal">';
					$html[] = '<i class="fa fa-user"></i></a>';
				}

				$html[] = '</div>';

				// Create the real field, hidden, that stored the user id.
				$html[] = '<input type="hidden" id="' . $this->id . '_id" name="' . $this->name . '" value="' . $this->value . '" />';
			}
			else
			{
				$link = '';
				// Create a dummy text field with the user name.
				$html[] = '<div class="input-append">';
				$html[] = '	<input type="text" id="" value=""'
					. ' readonly />';

				// Create the user select button.
				$this->readonly = false;
				if ($this->readonly === false)
				{
					$html[] = '		<a class="btn btn-primary modal_' . $this->id . '" title="' . JText::_('JLIB_FORM_CHANGE_USER') . '"'
						. ' href="#' . $this->id . '-modal" data-toggle="modal">';
					$html[] = '<i class="fa fa-user"></i></a>';
				}

				$html[] = '</div>';

				// Create the real field, hidden, that stored the user id.
				$html[] = '<input type="hidden" id="' . $this->id . '_id" name="' . $this->name . '" value="" />';
			}

			$html[] = HTMLHelper::_(
				'bootstrap.renderModal',
				$this->id . '-modal',
				[
					'title'      => Text::_('JLIB_FORM_CHANGE_USER'),
					'url'        => $link,
					'bodyHeight' => '60',
					'modalWidth' => '90',
					'footer'     => '<button type="button" class="btn btn-secondary" data-dismiss="modal" data-bs-dismiss="modal" aria-hidden="true">'
						. Text::_("JLIB_HTML_BEHAVIOR_CLOSE") . '</button>'
				]
			);

			return implode("\n", $html);
		}
	}

	/**
	 * Get the data that is going to be passed to the layout
	 *
	 * @return  array
	 *
	 * @since   3.5
	 */
	public function getLayoutData()
	{
		if (SR_ISJ4)
		{
			// Get the basic field data
			$data = parent::getLayoutData();

			// Initialize value
			$name = Text::_('JLIB_FORM_SELECT_USER');

			if (is_numeric($this->value) && SRPlugin::isEnabled('user'))
			{
				JTable::addIncludePath(SRPlugin::getAdminPath('user') . '/tables');
				$customerTable = JTable::getInstance('Customer', 'SolidresTable');
				$customerTable->load($this->value);

				if ($customerTable->id)
				{
					$name = User::getInstance($customerTable->user_id)->username;
				}
			}
			// Handle the special case for "current".
			elseif (strtoupper($this->value) === 'CURRENT')
			{
				// 'CURRENT' is not a reasonable value to be placed in the html
				$current = Factory::getUser();

				$this->value = $current->id;

				$data['value'] = $this->value;

				$name = $current->name;
			}

			// User lookup went wrong, we assign the value instead.
			if ($name === null && $this->value)
			{
				$name = $this->value;
			}

			$extraData = array(
				'userName'  => $name,
				'groups'    => $this->getGroups(),
				'excluded'  => $this->getExcluded(),
			);

			return array_merge($data, $extraData);
		}
		else
		{
			return parent::getLayoutData();
		}
	}

	/**
	 * Method to get the filtering groups (null means no filtering)
	 *
	 * @return  mixed  Array of filtering groups or null.
	 *
	 * @since   1.6
	 */
	protected function getGroups()
	{
		$solidresConfig = JComponentHelper::getParams('com_solidres');

		return $solidresConfig->get('partner_user_groups', '');
	}

	/**
	 * Method to get the users to exclude from the list of users
	 *
	 * @return  mixed  Array of users to exclude or null to to not exclude them
	 *
	 * @since   1.6
	 */
	protected function getExcluded()
	{
		if (isset($this->element['exclude']))
		{
			return explode(',', $this->element['exclude']);
		}

		return;
	}
}