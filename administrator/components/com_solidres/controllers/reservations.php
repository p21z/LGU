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

use Joomla\Utilities\ArrayHelper;
use Joomla\CMS\Factory;

/**
 * Reservation list controller class.
 *
 * @package       Solidres
 * @subpackage    Reservation
 * @since         0.1.0
 */
class SolidresControllerReservations extends JControllerAdmin
{
	public function getModel($name = 'Reservation', $prefix = 'SolidresModel', $config = array('ignore_request' => true))
	{
		return parent::getModel($name, $prefix, $config);
	}

	/**
	 * Method to publish a list of items
	 *
	 * @return  void
	 *
	 * @since   1.6
	 */
	public function publish()
	{
		// Check for request forgeries
		$this->checkToken();

		$solidresConfig = JComponentHelper::getParams('com_solidres');

		// Get items to publish from the request.
		$cid = $this->input->get('cid', array(), 'array');
		$data = array('trash' => $solidresConfig->get('trashed_state', -2));
		$task = $this->getTask();
		$value = ArrayHelper::getValue($data, $task, 0, 'int');

		if (empty($cid))
		{
			\JLog::add(\JText::_($this->text_prefix . '_NO_ITEM_SELECTED'), \JLog::WARNING, 'jerror');
		}
		else
		{
			// Get the model.
			$model = $this->getModel();

			// Make sure the item ids are integers
			$cid = ArrayHelper::toInteger($cid);

			// Publish the items.
			try
			{
				$model->publish($cid, $value);
				$errors = $model->getErrors();
				$ntext = null;

				if ($value === 1)
				{
					if ($errors)
					{
						$this->app->enqueueMessage(\JText::plural($this->text_prefix . '_N_ITEMS_FAILED_PUBLISHING', count($cid)), 'error');
					}
					else
					{
						$ntext = $this->text_prefix . '_N_ITEMS_PUBLISHED';
					}
				}
				elseif ($value === 0)
				{
					$ntext = $this->text_prefix . '_N_ITEMS_UNPUBLISHED';
				}
				elseif ($value === 2)
				{
					$ntext = $this->text_prefix . '_N_ITEMS_ARCHIVED';
				}
				else
				{
					$ntext = $this->text_prefix . '_N_ITEMS_TRASHED';
				}

				if ($ntext !== null)
				{
					$this->setMessage(\JText::plural($ntext, count($cid)));
				}
			}
			catch (\Exception $e)
			{
				$this->setMessage($e->getMessage(), 'error');
			}
		}

		$extension = $this->input->get('extension');
		$extensionURL = $extension ? '&extension=' . $extension : '';
		$this->setRedirect(\JRoute::_('index.php?option=' . $this->option . '&view=' . $this->view_list . $extensionURL, false));
	}

	/**
	 * Export selected reservation to CSV format
	 *
	 * @return void
	 */
	public function export()
	{
		$ids     = $this->input->get('cid', array(), 'array');
		$results = array();
		$dbo     = Factory::getDbo();
		$query   = $dbo->getQuery(true);

		foreach ($ids as $id)
		{
			$query->clear();
			$query->select('*')->from($dbo->quoteName('#__sr_reservations'))->where('id = ' . $dbo->quote($id));
			$results[] = $dbo->setQuery($query)->loadAssoc();
		}

		$this->app->allowCache(false);

		header("Content-Disposition: attachment;filename=solidres_reservation_export.csv");
		header("Content-Transfer-Encoding: binary");

		$fields = [];
		if (SRPlugin::isEnabled('customfield'))
		{
			$customField = SRCustomFieldHelper::getInstance();
			$app        = $this->app;
			$scope      = $app->scope;
			$app->scope = 'com_solidres.manage';
			$fields     = $customField::findFields(['context' => 'com_solidres.customer']);
			$app->scope = $scope;

			$renderValue = function ($field) {
				$value = SRCustomFieldHelper::displayFieldValue($field->field_name, null, true);

				if ($field->type == 'file')
				{
					$fileName = basename($value);

					if (strpos($fileName, '_') !== false)
					{
						$parts = explode('_', $fileName, 2);
						$value = $parts[1];
					}
				}

				return $value;
			};
		}

		if (SRPlugin::isEnabled('customfield'))
		{
			foreach ($results as &$result)
			{
				if ($result['id'])
				{
					$fieldsValues = $customField->getValues(['context' => 'com_solidres.customer.' . $result['id']]);
					SRCustomFieldHelper::setFieldDataValues($fieldsValues);
				}

				foreach ($fields as $field)
				{
					$result[$field->field_name] = $renderValue($field, $fieldsValues);
				}
			}
		}

		ob_start();
		$df = fopen("php://output", 'w');
		fputcsv($df, array_keys(reset($results)));
		foreach ($results as $row)
		{
			fputcsv($df, $row);
		}
		fclose($df);
		echo ob_get_clean();
		$this->app->close();
	}
}