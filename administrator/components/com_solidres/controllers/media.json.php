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

require_once JPATH_LIBRARIES . '/solidres/media/helper.php';

/**
 * Media JSON controller class.
 *
 * @package       Solidres
 * @subpackage    Media
 * @since         0.1.0
 */
class SolidresControllerMedia extends JControllerForm
{
	/**
	 * Method to upload a file from client side, storing and making thumbnail for images
	 *
	 * @return json
	 */
	public function upload()
	{
		try
		{
			if (!JSession::checkToken())
			{
				throw new RuntimeException(JText::_('JINVALID_TOKEN'));
			}

			$user = JFactory::getUser();

			if (!$user->authorise('core.create', 'com_solidres'))
			{
				throw new RuntimeException(JText::_('SR_ERROR_CREATE_NOT_PERMITTED'));
			}

			@set_time_limit(5 * 60);
			JLog::addLogger([
				'format'    => '{DATE}\t{TIME}\t{LEVEL}\t{CODE}\t{MESSAGE}',
				'text_file' => 'solidres_media.php',
			], \JLog::DEBUG, array('solidresmedia'));
			JLog::add('Start uploading', \JLog::DEBUG, 'solidresmedia');
			$srMedia        = SRFactory::get('solidres.media.media');
			$date           = JFactory::getDate();
			$model          = $this->getModel('media');
			$targetDir      = SRPATH_MEDIA_IMAGE_SYSTEM;
			$targetThumbDir = SRPATH_MEDIA_IMAGE_SYSTEM . '/thumbnails';
			$solidresParams = JComponentHelper::getParams('com_solidres');
			$files          = $this->input->files->get('files');

			if (!empty($files))
			{
				foreach ($files as $file)
				{
					if (!empty($file['error']) || strpos($file['type'], 'image') !== 0)
					{
						continue;
					}

					$fileName = JFile::makeSafe($file['name']);
					JLog::add('Original file name ' . $file['name'], \JLog::DEBUG, 'solidresmedia');
					JLog::add('Cleaned file name ' . $fileName, \JLog::DEBUG, 'solidresmedia');
					$file['name'] = $fileName;

					try
					{
						if (!SRMediaHelper::canUpload($file, $err))
						{
							$this->app->enqueueMessage(JText::_($err), 'error');
							continue;
						}

						$uploadedFilePath = $targetDir . '/' . $fileName;
						$ext              = JFile::getExt($fileName);
						$i                = 0;

						while (is_file($uploadedFilePath))
						{
							$fileName         = basename($fileName, '.' . $ext) . '_' . ++$i . '.' . $ext;
							$uploadedFilePath = $targetDir . '/' . $fileName;
						}

						if (JFile::upload($file['tmp_name'], $uploadedFilePath))
						{
							$this->app->enqueueMessage(JText::sprintf('SR_THE_IMAGE_UPLOADED_SUCCESSFULLY_FORMAT', $fileName), 'success');
							$data = [
								'id'           => 0,
								'type'         => 'IMAGE',
								'value'        => $fileName,
								'name'         => $fileName,
								'created_date' => $date->toSql(),
								'created_by'   => $user->get('id'),
								'mime_type'    => $srMedia->getMime($uploadedFilePath),
								'size'         => $file['size'],
							];

							if ($model->save($data))
							{
								$thumbSizes = $solidresParams->get('thumb_sizes', "");
								$thumbSizes = preg_split("/\r\n|\n|\r/", $thumbSizes);
								// Validate sizes
								for ($tid = 0, $tCount = count($thumbSizes); $tid < $tCount; $tid++)
								{
									if (empty($thumbSizes[$tid]) || ctype_space($thumbSizes[$tid]))
									{
										unset($thumbSizes[$tid]);
									}
									else
									{
										trim($thumbSizes[$tid]);
									}
								}

								$legacyThumbSizes = array('300x250', '75x75');
								$legacyThumbPaths = array($targetThumbDir . '/1', $targetThumbDir . '/2');
								$joomlaImage      = new JImage();

								if (!is_dir($targetThumbDir . '/1'))
								{
									JFolder::create($targetThumbDir . '/1', 0755);
								}

								if (!is_dir($targetThumbDir . '/2'))
								{
									JFolder::create($targetThumbDir . '/2', 0755);
								}

								try
								{
									$joomlaImage->loadFile($uploadedFilePath);

									// Legacy thumbnails
									if ($thumbs = $joomlaImage->generateThumbs($legacyThumbSizes, 5))
									{
										// Parent image properties
										$imgProperties = $joomlaImage::getImageFileProperties($uploadedFilePath);

										foreach ($thumbs as $thumbIdx => $thumb)
										{
											$thumbFileName = $fileName;
											$thumbFileName = $legacyThumbPaths[$thumbIdx] . '/' . $thumbFileName;
											$thumb->toFile($thumbFileName, $imgProperties->type);
										}
									}

									// Create custom thumbnails
									if (!empty($thumbSizes))
									{
										$joomlaImage->createThumbs($thumbSizes, 5, $targetThumbDir);
									}
								}
								catch (Exception $e)
								{
									JLog::add('Exception when loading file: ' . $fileName . '. The full error is ' . $e->getMessage(), \JLog::DEBUG, 'solidresmedia');
								}
							}
							else
							{
								JLog::add('Can not save this file to db: ' . $fileName, \JLog::DEBUG, 'solidresmedia');
								$this->app->enqueueMessage(JText::_('SR_ERROR_CAN_NOT_SAVE_DB'), 'error');
							}
						}
					}
					catch (Joomla\Filesystem\Exception\FilesystemException $filesystemException)
					{
						$this->app->enqueueMessage($filesystemException->getMessage(), 'error');
					}
				}
			}
		}
		catch (RuntimeException $e)
		{
			$this->app->enqueueMessage($e->getMessage(), 'error');
		}

		$layoutId = 'solidres.media.' . $this->app->getUserState('com_solidres.media.view', 'grid');
		$items    = $this->getModel('MediaList', 'SolidresModel', [])->getItems();

		echo new JResponseJson(SRLayoutHelper::render($layoutId, ['items' => $items]));

		$this->app->close();
	}

	public function delete()
	{
		try
		{
			if (!JSession::checkToken('request'))
			{
				throw new RuntimeException(JText::_('JINVALID_TOKEN'));
			}

			$mediaIds = $this->input->post->get('media', array(), 'array');
			$dbo      = JFactory::getDbo();
			$query    = $dbo->getQuery(true);
			$model    = $this->getModel();

			if (count($mediaIds))
			{
				$solidresParams = JComponentHelper::getParams('com_solidres');

				foreach ($mediaIds as $mediaId)
				{
					$query->clear();
					$query->select('name')->from($dbo->quoteName('#__sr_media'))->where('id = ' . $mediaId);
					$dbo->setQuery($query);
					$mediaName = $dbo->loadResult();

					if ($mediaName !== JFile::makeSafe($mediaName))
					{
						$filename = htmlspecialchars($mediaName, ENT_COMPAT, 'UTF-8');
						JFactory::getApplication()->enqueueMessage(JText::sprintf('COM_MEDIA_ERROR_UNABLE_TO_DELETE_FILE_WARNFILENAME', $filename), 'warning');
						continue;
					}

					$fullPath       = SRPATH_MEDIA_IMAGE_SYSTEM . '/' . $mediaName;
					$thumbPath1     = SRPATH_MEDIA_IMAGE_SYSTEM . '/thumbnails/1/' . $mediaName;
					$thumbPath2     = SRPATH_MEDIA_IMAGE_SYSTEM . '/thumbnails/2/' . $mediaName;
					$mediaNameParts = explode('.', $mediaName);

					if ($model->delete($mediaId))
					{
						JFile::delete(array($fullPath, $thumbPath1, $thumbPath2));
						$thumbSizes = $solidresParams->get('thumb_sizes', "300x250\r\n75x75");
						$thumbSizes = preg_split("/\r\n|\n|\r/", $thumbSizes);

						foreach ($thumbSizes as $thumbSize)
						{
							JFile::delete(SRPATH_MEDIA_IMAGE_SYSTEM . '/thumbnails/' . $mediaNameParts[0] . '_' . trim($thumbSize) . '.' . $mediaNameParts[1]);
						}
					}
				}

				$model = $this->getModel('MediaList', 'SolidresModel');
				$view  = $this->getView('MediaList', 'html', 'SolidresView');
				$view->setModel($model, true);
				ob_start();
				$view->display();
				$response = ob_get_clean();
			}
		}
		catch (RuntimeException $e)
		{
			$response = $e;
		}

		echo new JResponseJson($response);

		$this->app->close();
	}

	public function ajaxProgressMedia()
	{
		JSession::checkToken('request') or jexit(JText::_('JINVALID_TOKEN'));

		if (!JFactory::getUser()->authorise('core.create', 'com_solidres') && !JFactory::getUser()->authorise('core.edit', 'com_solidres'))
		{
			throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'), 404);

			return false;
		}

		$targetId  = (int) $this->input->getInt('targetId');
		$target    = strtolower($this->input->getString('target'));
		$mediaKeys = $this->input->get('mediaKeys', array(), 'array');
		$response  = array('status' => false, 'media_keys' => $mediaKeys);

		if ($targetId > 0 && count($mediaKeys))
		{
			$targetTable = '#__sr_media_' . $target . '_xref';
			$targetKey   = $target == 'roomtype' ? 'room_type_id' : 'reservation_asset_id';
			$db          = JFactory::getDbo();
			$query       = $db->getQuery(true)
				->delete($db->qn($targetTable))
				->where($db->qn($targetKey) . ' = ' . $targetId);
			$db->setQuery($query)
				->execute();

			$query->clear()
				->insert($db->qn($targetTable))
				->columns(array('media_id', $targetKey, 'weight'));

			foreach ($mediaKeys as $k => $v)
			{
				$query->values((int) $v . ',' . $targetId . ',' . (int) $k);
			}

			$db->setQuery($query);

			if ($db->execute())
			{
				$response['status'] = true;
			}
		}

		echo json_encode($response);

		$this->app->close();
	}

	public function ajaxRemoveMedia()
	{
		JSession::checkToken('request') or jexit(JText::_('JINVALID_TOKEN'));

		if (!JFactory::getUser()->authorise('core.delete', 'com_solidres'))
		{
			throw new Exception(JText::_('JERROR_ALERTNOAUTHOR'), 404);

			return false;
		}

		$target   = strtolower($this->input->getString('target'));
		$targetId = (int) $this->input->getInt('targetId');
		$mediaId  = (int) $this->input->getInt('mediaId');
		$response = array('status' => false);

		if ($targetId > 0 && $mediaId > 0)
		{
			$targetTable = '#__sr_media_' . $target . '_xref';
			$targetKey   = $target == 'roomtype' ? 'room_type_id' : 'reservation_asset_id';
			$db          = JFactory::getDbo();
			$query       = $db->getQuery(true)
				->delete($db->qn($targetTable))
				->where($db->qn($targetKey) . ' = ' . $targetId . ' AND ' . $db->qn('media_id') . ' = ' . $mediaId);
			$db->setQuery($query);

			if ($db->execute())
			{
				$response['status'] = true;
			}
		}
		else
		{
			$response['message'] = 'Cannot remove media ID ' . $mediaId;
		}

		echo json_encode($response);

		$this->app->close();
	}
}
