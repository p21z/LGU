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

use Joomla\CMS\Filesystem\File;
use Joomla\CMS\Component\ComponentHelper;

/**
 * ReservationNote controller class.
 *
 * @package       Solidres
 * @subpackage    ReservationNote
 * @since         0.3.0
 */
class SolidresControllerReservationNote extends JControllerForm
{
	public function save($key = null, $urlVar = null)
	{
		$this->checkToken();

		$date                  = JFactory::getDate();
		$user                  = JFactory::getUser();
		$direction             = JFactory::getDocument()->direction;
		$solidresConfig        = ComponentHelper::getParams('com_solidres');
		$allowedFileTypes      = $solidresConfig->get('reservation_note_allowed_file_types', 'jpg,jpeg,png,pdf,doc,docx');
		$allowedFileTypesArray = explode(',', $allowedFileTypes);

		JTable::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/tables');
		JModelLegacy::addIncludePath(JPATH_ADMINISTRATOR . '/components/com_solidres/models');
		$table = JTable::getInstance('ReservationNote', 'SolidresTable');
		$tableReservation = JTable::getInstance('Reservation', 'SolidresTable');

		$data                        = [];
		$data['reservation_id']      = $this->input->getUint('reservation_id', 0);
		$data['text']                = $this->input->getString('text', '');
		$data['created_date']        = $date->toSql();
		$data['created_by']          = $user->get('id');
		$data['notify_customer']     = $this->input->getUint('notify_customer', 0);
		$data['visible_in_frontend'] = $this->input->getUint('visible_in_frontend', 0);

		$tableReservation->load($data['reservation_id']);

		if ($this->app->isClient('site') && !SRUtilities::isAssetPartner($user->id, $tableReservation->reservation_asset_id))
		{
			echo json_encode([]);
			return false;
		}

		$table->bind($data);

		$status = 0;
		if ($table->store())
		{
			$status = 1;

			$attachments = $this->input->files->get('attachments', []);

			if (!empty($attachments))
			{
				$dbo   = JFactory::getDbo();
				$query = $dbo->getQuery(true);

				$emailAttachmentPaths = $emailAttachmentNames = [];
				foreach ($attachments as $attachment)
				{
					$attachmentSafeName = File::makeSafe($attachment['name']);
					$attachmentFileExt  = File::getExt($attachmentSafeName);

					if (!in_array($attachmentFileExt, $allowedFileTypesArray))
					{
						continue;
					}

					$attachmentFileName = md5($attachmentSafeName) . '.' . $attachmentFileExt;
					$attachmentPath     = SRPATH_MEDIA . '/notes/' . $table->id . '/' . $attachmentFileName;

					if (File::upload($attachment['tmp_name'], $attachmentPath))
					{
						$query->clear()->insert($dbo->quoteName('#__sr_reservation_notes_attachments'));
						$query->columns([
							$dbo->quoteName('note_id'),
							$dbo->quoteName('attachment_file_name'),
						]);
						$query->values(
							(int) $table->id . ',' .
							$dbo->quote($attachmentFileName)
						);

						$dbo->setQuery($query)->execute();

						$emailAttachmentPaths[] = $attachmentPath;
						$emailAttachmentNames[] = $attachmentFileName;
					}
				}
			}
		}

		// Send email to customer if configured
		$emailSendingResult = '';
		if ($data['notify_customer'] == 1)
		{
			$mail          = JFactory::getMailer();
			$emailTemplate = SRLayoutHelper::getInstance();

			// Query some info
			$modelAsset       = JModelLegacy::getInstance('ReservationAsset', 'SolidresModel', ['ignore_request' => true]);
			$asset            = $modelAsset->getItem($tableReservation->reservation_asset_id);
			$cmsLanguage      = JFactory::getLanguage();
			$cmsLangTag       = $cmsLanguage->getTag();
			$customerLanguage = $tableReservation->customer_language;
			$overrideCmsLang  = $customerLanguage && $customerLanguage !== $cmsLangTag;

			if ($overrideCmsLang)
			{
				$lang = JLanguage::getInstance($customerLanguage);

				foreach ($cmsLanguage->getPaths() as $extension => $langPaths)
				{
					foreach ($langPaths as $langFile => $loaded)
					{
						$lang->load($extension, preg_replace('#/language/' . $cmsLangTag . '/.*$#', '', $langFile));
					}
				}

				// Override CMS language
				JFactory::$language = $lang;
			}

			$displayData = [
				'reservation' => $tableReservation,
				'asset'       => $asset,
				'text'        => $data['text'],
				'direction'   => $direction,
			];

			$body = $emailTemplate->render(
				'emails.reservation_note_notification_customer_html_inliner',
				$displayData
			);

			$mail->setSender([$asset->email, $asset->name]);
			$mail->addRecipient($tableReservation->customer_email);
			$mail->setSubject(JText::_('SR_RESERVATION_NOTE_FROM') . $asset->name);
			$mail->setBody($body);
			$mail->IsHTML(true);
			$mail->addAttachment($emailAttachmentPaths, $emailAttachmentNames);

			if (!$mail->send())
			{
				$emailSendingResult = 'Could not send email';
			}

			if ($overrideCmsLang)
			{
				// Revert CMS language
				JFactory::$language = $cmsLanguage;
			}
		}

		$table->set('username', $user->get('username'));

		if (!empty($attachments))
		{
			$query->clear();
			$query->select('attachment_file_name')
				->from($dbo->quoteName('#__sr_reservation_notes_attachments'))
				->where('note_id = ' . $table->id);

			$table->set('attachments', $dbo->setQuery($query)->loadColumn());
		}

		$response = [
			'status'              => $status,
			'message'             => $emailSendingResult,
			'next'                => '',
			'text'                => $table->text,
			'created_date'        => $table->created_date,
			'notify_customer'     => $table->notify_customer == 1 ? JText::_('JYES') : JText::_('JNO'),
			'visible_in_frontend' => $table->visible_in_frontend == 1 ? JText::_('JYES') : JText::_('JNO'),
			'note_html'           => SRLayoutHelper::render('reservation.note', ['note' => $table]),
		];

		echo json_encode($response);
	}
}
