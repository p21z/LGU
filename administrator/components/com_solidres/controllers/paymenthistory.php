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

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

class SolidresControllerPaymentHistory extends JControllerLegacy
{
	public function getModel($name = 'PaymentHistory', $prefix = 'SolidresModel', $config = array('ignore_request' => true))
	{
		JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');

		return JModelLegacy::getInstance($name, $prefix, $config);
	}

	public function save()
	{
		try
		{
			if (!JSession::checkToken('get'))
			{
				throw new RuntimeException(JText::_('JINVALID_TOKEN'));
			}

			/**
			 * @var \SolidresModelPaymentHistory $model
			 * @var \Joomla\CMS\Form\Form        $form
			 */
			$model       = $this->getModel();
			$form        = $model->getForm();
			$paymentType = $this->input->get('payment_type', 0);
			$data        = $this->input->get('paymentHistoryForm' . $paymentType, array(), 'array');
			$validData   = $form->filter($data);

			if (false === $form->validate($validData))
			{
				$errorMessage = '';

				foreach ($form->getErrors() as $error)
				{
					if ($error instanceof Exception)
					{
						$errorMessage .= '<li>' . $error->getMessage() . '</li>';
					}
					else
					{
						$errorMessage .= '<li>' . $error . '</li>';
					}
				}

				throw new RuntimeException('<ul>' . $errorMessage . '</ul>');
			}

			$resultsData = $model->save($validData);

			if (false === $resultsData)
			{
				throw new RuntimeException($model->getError());
			}

			ob_start();
			SolidresHelper::displayPaymentHistory($validData['reservation_id'], $validData['scope'], $validData['payment_type']);
			$responseData = array(
				'displayPaymentHistoryHTML' => ob_get_clean(),
				'reservationData'           => is_array($resultsData) ? $resultsData : array(),
			);

			if (is_array($resultsData) && !$validData['scope'])
			{
				JLoader::register('SRCurrency', SRPATH_LIBRARY . '/currency/currency.php');
				$currency = new SRCurrency($resultsData['total_paid'], $validData['currency_id']);

				$resultsData['totalPaidFormatted'] = $currency->format();
				$currency->setValue($resultsData['totalDue']);
				$resultsData['totalDueFormatted'] = $currency->format();
				$responseData['reservationData']  = $resultsData;
			}

			echo new JResponseJson($responseData);
		}
		catch (RuntimeException $e)
		{
			echo new JResponseJson(new RuntimeException(HTMLHelper::_(
				'bootstrap.renderModal',
				'payment-history',
				[
					'title'  => '<i class="fa fa-exclamation-triangle"></i> Oop!',
					'footer' => '<button type="button" class="btn btn-secondary" data-dismiss="modal" data-bs-dismiss="modal" aria-hidden="true">'
						. Text::_("JLIB_HTML_BEHAVIOR_CLOSE") . '</button>'
				],
				'<div style="padding: 15px">' . $e->getMessage() . '</div>'
			)));
		}

		$this->app->close();
	}

	public function remove()
	{
		try
		{
			if (!JSession::checkToken('get'))
			{
				throw new RuntimeException(JText::_('JINVALID_TOKEN'));
			}

			$id          = (int) $this->input->getUint('id', 0);
			$model       = $this->getModel();
			$resultsData = $model->delete($id);

			if (empty($resultsData))
			{
				throw new RuntimeException($model->getError());
			}

			$responseData = [
				'reservationData' => $resultsData,
			];

			if (isset($resultsData['reservation_asset_id']))
			{
				JLoader::register('SRCurrency', SRPATH_LIBRARY . '/currency/currency.php');
				$currency                          = new SRCurrency($resultsData['total_paid'], $resultsData['currency_id']);
				$resultsData['totalPaidFormatted'] = $currency->format();
				$currency->setValue($resultsData['totalDue']);
				$resultsData['totalDueFormatted'] = $currency->format();
				$responseData['reservationData']  = $resultsData;
			}

			echo new JResponseJson($responseData);
		}
		catch (RuntimeException $e)
		{
			echo new JResponseJson($e);
		}

		$this->app->close();
	}
}
