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
 * System controller class.
 *
 * @package       Solidres
 * @subpackage    System
 * @since         0.1.0
 */

use Joomla\String\StringHelper;

class SolidresControllerSystem extends JControllerForm
{
	public function getModel($name = 'System', $prefix = 'SolidresModel', $config = array('ignore_request' => true))
	{
		return parent::getModel($name, $prefix, $config);
	}

	/**
	 * Install sample data
	 *
	 * @return void
	 */
	public function installSampleData()
	{
		$model = $this->getModel();

		$canInstall = $model->canInstallSampleData();

		if ($canInstall)
		{
			$result = $model->installSampleData();

			if (!$result)
			{
				throw new Exception($model->getError(), 500);
			}
			else
			{
				$msg = JText::_('SR_INSTALL_SAMPLE_DATA_SUCCESS');
				$this->setRedirect('index.php?option=com_solidres', $msg);
			}
		}
		else
		{
			$msg = JText::_('SR_INSTALL_SAMPLE_DATA_IS_ALREADY_INSTALLED');
			$this->setRedirect('index.php?option=com_solidres', $msg);
		}
	}

	public function checkVerification()
	{
		$this->checkToken();
		JLoader::import('joomla.filesystem.folder');
		JLoader::import('joomla.filesystem.file');
		JLoader::import('joomla.filesystem.path');

		$language = JFactory::getLanguage();
		$files    = [
			'com_solidres' => [
				'checksums'    => JPATH_ADMINISTRATOR . '/components/com_solidres/checksums',
				'currentFiles' => [],
			],
		];

		$files['com_solidres']['currentFiles'] = array_merge($files['com_solidres']['currentFiles'], JFolder::files(JPATH_ADMINISTRATOR . '/components/com_solidres', '.', true, true));
		$files['com_solidres']['currentFiles'] = array_merge($files['com_solidres']['currentFiles'], JFolder::files(JPATH_SITE . '/components/com_solidres', '.', true, true));
		$files['com_solidres']['currentFiles'] = array_merge($files['com_solidres']['currentFiles'], JFolder::files(JPATH_SITE . '/media/com_solidres/assets/css', '.', true, true));
		$files['com_solidres']['currentFiles'] = array_merge($files['com_solidres']['currentFiles'], JFolder::files(JPATH_SITE . '/media/com_solidres/assets/images', '.', false, true));
		$files['com_solidres']['currentFiles'] = array_merge($files['com_solidres']['currentFiles'], JFolder::files(JPATH_SITE . '/libraries/solidres', '.', true, true));

		$systemFiles = [
			JPATH_SITE . '/media/com_solidres/assets/invoices/.htaccess',
			JPATH_SITE . '/media/com_solidres/assets/invoices/web.config',
			JPATH_SITE . '/media/com_solidres/assets/files/htaccess',
			JPATH_SITE . '/media/com_solidres/assets/files/web.config',
			JPATH_SITE . '/media/com_solidres/assets/pdfAttachment/htaccess',
			JPATH_SITE . '/media/com_solidres/assets/pdfAttachment/web.config',
		];

		foreach($systemFiles as $systemFile)
		{
			if (is_file($systemFile))
			{
				$files['com_solidres']['currentFiles'][] = $systemFile;
			}
		}

		$modules = JFolder::folders(JPATH_ADMINISTRATOR . '/modules', '^mod_sr', false, true);
		$modules = array_merge($modules, JFolder::folders(JPATH_SITE . '/modules', '^mod_sr', false, true));

		foreach ($modules as $module)
		{
			if (is_file($module . '/checksums'))
			{
				$package = basename($module);
				$language->load($package . '_sys', $module);
				$files[$package] = [
					'checksums'    => $module . '/checksums',
					'currentFiles' => JFolder::files($module, '.', true, true),
				];

				if (is_dir(JPATH_ROOT . '/media/' . $package))
				{
					$files[$package]['currentFiles'] = array_merge($files[$package]['currentFiles'], JFolder::files(JPATH_ROOT . '/media/' . $package, '.', true, true));
				}
			}
		}

		if (is_dir(JPATH_PLUGINS . '/solidres'))
		{
			foreach (JFolder::folders(JPATH_PLUGINS . '/solidres', '.', false, true) as $plugin)
			{
				if (is_file($plugin . '/checksums'))
				{
					$package = 'plg_solidres_' . basename($plugin);
					$language->load($package . '_sys', $plugin);
					$files[$package] = [
						'checksums'    => $plugin . '/checksums',
						'currentFiles' => JFolder::files($plugin, '.', true, true),
					];

					if (is_dir(JPATH_ROOT . '/media/' . $package))
					{
						$files[$package]['currentFiles'] = array_merge($files[$package]['currentFiles'], JFolder::files(JPATH_ROOT . '/media/' . $package, '.', true, true));
					}
				}
			}
		}

		if (is_dir(JPATH_PLUGINS . '/solidrespayment'))
		{
			foreach (JFolder::folders(JPATH_PLUGINS . '/solidrespayment', '.', false, true) as $plugin)
			{
				if (is_file($plugin . '/checksums'))
				{
					$package = 'plg_solidrespayment_' . basename($plugin);
					$language->load($package . '_sys', $plugin);
					$files[$package] = [
						'checksums'    => $plugin . '/checksums',
						'currentFiles' => JFolder::files($plugin, '.', true, true),
					];

					if (is_dir(JPATH_ROOT . '/media/' . $package))
					{
						$files[$package]['currentFiles'] = array_merge($files[$package]['currentFiles'], JFolder::files(JPATH_ROOT . '/media/' . $package, '.', true, true));
					}
				}
			}
		}

		if (is_dir(JPATH_PLUGINS . '/subscriptionpayment'))
		{
			foreach (JFolder::folders(JPATH_PLUGINS . '/subscriptionpayment', '.', false, true) as $plugin)
			{
				if (is_file($plugin . '/checksums'))
				{
					$package = 'plg_subscriptionpayment_' . basename($plugin);
					$language->load($package . '_sys', $plugin);
					$files[$package] = [
						'checksums'    => $plugin . '/checksums',
						'currentFiles' => JFolder::files($plugin, '.', true, true),
					];

					if (is_dir(JPATH_ROOT . '/media/' . $package))
					{
						$files[$package]['currentFiles'] = array_merge($files[$package]['currentFiles'], JFolder::files(JPATH_ROOT . '/media/' . $package, '.', true, true));
					}
				}
			}
		}

		if (is_dir(JPATH_PLUGINS . '/experiencepayment'))
		{
			foreach (JFolder::folders(JPATH_PLUGINS . '/experiencepayment', '.', false, true) as $plugin)
			{
				if (is_file($plugin . '/checksums'))
				{
					$package = 'plg_experiencepayment_' . basename($plugin);
					$language->load($package . '_sys', $plugin);
					$files[$package] = [
						'checksums'    => $plugin . '/checksums',
						'currentFiles' => JFolder::files($plugin, '.', true, true),
					];

					if (is_dir(JPATH_ROOT . '/media/' . $package))
					{
						$files[$package]['currentFiles'] = array_merge($files[$package]['currentFiles'], JFolder::files(JPATH_ROOT . '/media/' . $package, '.', true, true));
					}
				}
			}
		}

		if (is_file(JPATH_SITE . '/templates/mg_starter/checksums'))
		{
			$language->load('mg_starter_sys', JPATH_SITE);
			$files['mg_starter'] = [
				'checksums'    => JPATH_SITE . '/templates/mg_starter/checksums',
				'currentFiles' => JFolder::files(JPATH_SITE . '/templates/mg_starter', '.', true, true),
			];
		}

		$results = [];

		foreach ($files as $package => $fileData)
		{
			if ($contents = @file_get_contents($fileData['checksums']))
			{
				$packageName           = JText::_(strtoupper($package));
				$originFiles           = [];
				$results[$packageName] = [
					'removed'  => [],
					'modified' => [],
					'new'      => [],
				];

				foreach (explode(PHP_EOL, $contents) as $content)
				{
					if (empty($content))
					{
						continue;
					}

					list($md5, $filePath) = preg_split('/\s+/', $content, 2);
					$fileBaseName = basename($filePath);

					if ($fileBaseName === 'checksums'
						|| $fileBaseName === 'lib_solidres.xml'
					)
					{
						continue;
					}

					$originFiles[] = JPath::clean(JPATH_ROOT . '/' . $filePath);

					if (!is_file(JPATH_ROOT . '/' . $filePath))
					{
						$results[$packageName]['removed'][] = $filePath;
					}
					elseif ($md5 !== md5_file(JPATH_ROOT . '/' . $filePath))
					{
						$results[$packageName]['modified'][] = $filePath;
					}
				}

				$newFiles = array_values(array_diff($fileData['currentFiles'], $originFiles));

				foreach ($newFiles as $newFile)
				{
					if (basename($newFile) === 'checksums')
					{
						continue;
					}

					$results[$packageName]['new'][] = str_replace(JPATH_ROOT . '/', '', $newFile);
				}
			}
		}

		echo new JResponseJson($results);
		$this->app->close();
	}

	public function togglePluginState()
	{
		$this->checkToken();

		$extTable = JTable::getInstance('Extension');
		$data     = array('enabled' => 'NULL');

		if ($extTable->load((int) $this->input->getInt('extension_id')))
		{
			$enabled = !(bool) $extTable->get('enabled');
			$extTable->set('enabled', (int) $enabled);

			if ($extTable->store())
			{
				$data['enabled'] = (int) $enabled;
			}
		}

		ob_clean();

		echo json_encode($data);

		$this->app->close();
	}

	public function getLogFile()
	{
		$this->checkToken();
		$file = $this->app->get('log_path') . '/' . $this->input->getPath('file');
		$data = array();

		if (is_file($file) && ($content = file_get_contents($file)))
		{
			if (!StringHelper::valid($content))
			{
				$content = mb_convert_encoding($content, mb_detect_encoding($content), 'UTF-8');
			}

			$data['content'] = $content;
			$data['status']  = true;
		}
		else
		{
			$data['content'] = 'File: ' . $file . ' not found.';
			$data['status']  = false;
		}

		ob_clean();

		echo json_encode($data);

		$this->app->close();
	}

	public function progressThumbnails()
	{
		JSession::checkToken('request') or jexit(JText::_('JINVALID_TOKEN'));
		JLoader::import('joomla.filesystem.folder');

		$solidresParams = JComponentHelper::getParams('com_solidres');
		$targetDir      = SRPATH_MEDIA_IMAGE_SYSTEM;
		$targetThumbDir = $targetDir . '/thumbnails';
		$backup         = $targetThumbDir . '_backup';
		$thumbSizes     = preg_split("/\r\n|\n|\r/", trim($solidresParams->get('thumb_sizes', '')));

		echo '[5%]';
		echo str_pad("", 1024, " ");

		ob_flush();
		flush();
		usleep(25000);

		try
		{
			if (empty($thumbSizes))
			{
				throw new Exception('Thumbnail sizes not found.');
			}

			$jImage = new JImage;
			// Uncomment this line if you want a lower quality thumbnail but smaller in size
			//$joomlaImage->setThumbnailGenerate(false);
			$images = JFolder::files($targetDir, 'JPE?G|jpe?g|GIF|gif|PNG|png', false, true);

			if (JFolder::exists($backup))
			{
				JFolder::delete($backup);
			}

			if (!JFolder::move($targetThumbDir, $backup) || !JFolder::create($targetThumbDir))
			{
				throw new Exception('Cannot create a backup directory.');
			}

			$count        = count($images);
			$processCount = 1;

			foreach ($images as $imageFile)
			{
				$jImage->loadFile($imageFile);
				$name = basename($imageFile);
				$type = $jImage::getImageFileProperties($imageFile)->type;

				if ($thumbs = $jImage->generateThumbs(array('300x250', '75x75'), 5))
				{
					if (!JFolder::exists($targetThumbDir . '/1'))
					{
						JFolder::create($targetThumbDir . '/1');
					}

					if (!JFolder::exists($targetThumbDir . '/2'))
					{
						JFolder::create($targetThumbDir . '/2');
					}

					$thumbs[0]->toFile($targetThumbDir . '/1/' . $name, $type);
					$thumbs[1]->toFile($targetThumbDir . '/2/' . $name, $type);
				}

				$jImage->createThumbs($thumbSizes, 5, $targetThumbDir);

				$processCount++;
				$processState = ($processCount / $count) * 100 . '%';

				echo '[' . $processState . ']';
				echo str_pad("", 1024, " ");

				ob_flush();
				flush();
				usleep(25000);
			}

		}
		catch (Exception $e)
		{
			if (JFolder::exists($backup))
			{
				if (JFolder::exists($targetThumbDir))
				{
					JFolder::delete($targetThumbDir);
				}

				rename($backup, $targetThumbDir);
			}

			echo $e->getMessage();
		}

		if (JFolder::exists($backup))
		{
			JFolder::delete($backup);
		}

		echo '[100%]';
		echo str_pad("", 1024, " ");

		ob_flush();
		flush();
		usleep(25000);

		ob_end_flush();

		$this->app->close();
	}

	public function renameOverrideFiles()
	{
		$this->checkToken();
		JLoader::import('joomla.filesystem.folder');

		ob_clean();

		try
		{
			$type = $this->input->get('type');

			if ($type == 'override')
			{
				$solidresModules    = array(
					'mod_sr_checkavailability',
					'mod_sr_currency',
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
					'mod_sr_experience_extras',
					'mod_sr_experience_list',
					'mod_sr_experience_filter',
					'mod_sr_experience_search',
					'mod_sr_advancedsearch',
					'mod_sr_assets',
					'mod_sr_filter',
					'mod_sr_locationmap',
					'mod_sr_myrecentsearches',
					'mod_sr_surroundings',
				);
				$templates          = JFolder::folders(JPATH_ROOT . '/templates', '[a-zA-Z0-9_\-]+', false, true);
				$templates          = array_merge($templates, JFolder::folders(JPATH_ADMINISTRATOR . '/templates', '[a-zA-Z0-9_\-]+', false, true));
				$overrideCandidates = array_merge(array('com_solidres', 'layouts/com_solidres'), $solidresModules);

				foreach ($templates as $template)
				{
					foreach ($overrideCandidates as $candidate)
					{
						$candidatePath = $template . '/html/' . $candidate;

						if (JFolder::exists($candidatePath) && !@rename($candidatePath, $candidatePath . '-SR_disabled'))
						{
							throw new Exception(JText::_('Rename failed'));
						}
					}
				}
			}
			else
			{
				$undoPaths = JFolder::folders(JPATH_ROOT . '/templates', '\-SR\_disabled$', true, true);
				$undoPaths = array_merge($undoPaths, JFolder::folders(JPATH_ADMINISTRATOR . '/templates', '\-SR\_disabled$', true, true));

				if (!empty($undoPaths))
				{
					foreach ($undoPaths as $undoPath)
					{
						$oldPath  = $undoPath;
						$undoPath = preg_replace('/\-SR\_disabled$/', '', $oldPath, 1);

						if (!is_dir($undoPath))
						{
							if (!@rename($oldPath, $undoPath))
							{
								throw new Exception(JText::_('Rename failed'));
							}
						}
					}
				}
			}

			echo 'Success';
		}
		catch (Exception $e)
		{
			echo $e->getMessage();
		}

		$this->app->close();

	}

	public function checkUpdates()
	{
		$this->checkToken('get');
		$url = 'https://www.solidres.com/checkupdates';

		try
		{
			if (empty($url) || !filter_var($url, FILTER_VALIDATE_URL))
			{
				throw new RuntimeException(JText::_('SR_CHECK_UPDATES_ERROR_INVALID_URL'));
			}

			if (!JFactory::getUser()->authorise('core.admin', 'com_solidres'))
			{
				throw new RuntimeException(JText::_('JERROR_ALERTNOAUTHOR'));
			}

			$checkUpdateResult = $this->postFindUpdates($url);

			if ($checkUpdateResult)
			{
				$this->setMessage(JText::_('SR_CHECK_UPDATES_SUCCESSFUL'));
			}
			else
			{
				$this->setMessage(JText::_('SR_CHECK_UPDATES_FAILED'));
			}

		}
		catch (RuntimeException $e)
		{
			$this->setMessage($e->getMessage(), 'error');
		}

		$this->setRedirect(JRoute::_('index.php?option=com_solidres&view=system', false));
	}

	public function postFindUpdates($url)
	{
		JTable::addIncludePath(JPATH_LIBRARIES . '/joomla/table');
		JLoader::import('joomla.filesystem.folder');
		JLoader::import('joomla.filesystem.file');
		$table = JTable::getInstance('Extension');
		$table->load(JComponentHelper::getComponent('com_solidres')->id);
		$this->addViewPath(JPATH_ADMINISTRATOR . '/components/com_solidres/views');
		$this->addModelPath(JPATH_ADMINISTRATOR . '/components/com_solidres/models', 'SolidresModel');

		$manifest   = json_decode($table->get('manifest_cache'));
		$view       = $this->getView('System', 'html', 'SolidresView');
		$plugins    = $view->get('solidresPlugins');
		$modules    = $view->get('solidresModules');
		$templates  = $this->getModel()->getSolidresTemplates();
		$extensions = array('com_solidres' => $manifest->version);

		foreach ($plugins as $group => $items)
		{
			foreach ($items as $item)
			{
				if ($table->load(array('type' => 'plugin', 'folder' => $group, 'element' => $item)))
				{
					$manifest = json_decode($table->get('manifest_cache'));

					$extensions['plg_' . $group . '_' . $item] = $manifest->version;
				}
			}
		}

		foreach ($modules as $module)
		{
			if ($table->load(array('type' => 'module', 'enabled' => '1', 'element' => $module)))
			{
				$manifest            = json_decode($table->get('manifest_cache'));
				$extensions[$module] = $manifest->version;
			}
		}

		if (!empty($templates))
		{
			foreach ($templates as $template)
			{
				$extensions['tpl_' . $template->template] = $template->manifest->version;
			}
		}

		$data = array(
			'data' => array(
				'extensions' => $extensions
			),
		);

		static $log;

		if ($log == null)
		{
			$options['format']    = '{DATE}\t{TIME}\t{LEVEL}\t{CODE}\t{MESSAGE}';
			$options['text_file'] = 'solidres_update.php';
			$log                  = JLog::addLogger($options, \JLog::DEBUG, array('solidresupdate'));
		}

		try
		{
			JLog::add('Start checking for update', \JLog::DEBUG, 'solidresupdate');
			$response = JHttpFactory::getHttp()->post($url, $data, array(), 5);
		}
		catch (UnexpectedValueException $e)
		{
			JLog::add('Could not connect to update server: ' . $url . ' ' . $e->getMessage(), \JLog::DEBUG, 'solidresupdate');

			return false;
		}
		catch (RuntimeException $e)
		{
			JLog::add('Could not connect to update server: ' . $url . ' ' . $e->getMessage(), \JLog::DEBUG, 'solidresupdate');

			return false;
		}
		catch (Exception $e)
		{
			JLog::add('Unexpected error connecting to update server: ' . $url . ' ' . $e->getMessage(), \JLog::DEBUG, 'solidresupdate');

			return false;
		}

		if ($response->code !== 200)
		{
			JLog::add('Could not connect to update server', \JLog::DEBUG, 'solidresupdate');

			return false;
		}

		$updates = json_decode(trim($response->body), true);

		$cachePath = JPATH_ADMINISTRATOR . '/components/com_solidres/views/system/cache';

		// The success response contain a json of updates extension list, if it contain 'data' index, it means
		// not successful
		if (json_last_error() == JSON_ERROR_NONE && !isset($updates['data']))
		{
			if (!JFolder::exists($cachePath))
			{
				if (!JFolder::create($cachePath, 0755))
				{
					JLog::add('Solidres update cache folder failed to be created', \JLog::DEBUG, 'solidresupdate');

					return false;
				}
			}

			if (is_array($updates) && !empty($updates))
			{
				$updateContent = json_encode($updates, JSON_PRETTY_PRINT);
				JLog::add('Update found: ' . count($updates), \JLog::DEBUG, 'solidresupdate');
			}
			else
			{
				$updateContent = '';
				JLog::add('No update found', \JLog::DEBUG, 'solidresupdate');
			}

			// Update cache file
			if (!JFile::write($cachePath . '/updates.json', $updateContent))
			{
				JLog::add('Solidres update cache file failed to be created', \JLog::DEBUG, 'solidresupdate');

				return false;
			}
			else
			{
				JLog::add('Solidres update cache file is updated successfully', \JLog::DEBUG, 'solidresupdate');

				return true;
			}
		}

		return true;
	}

	public function databaseFix()
	{
		$this->checkToken('get');

		if (!JFactory::getUser()->authorise('core.admin', 'com_solidres'))
		{
			throw new RuntimeException(JText::_('JERROR_ALERTNOAUTHOR'));

			return false;
		}

		$model = $this->getModel();

		if ($model->databaseFix())
		{
			$this->setRedirect(JRoute::_('index.php?option=com_solidres&view=system', false), 'Solidres database schemas is up to date.')
				->redirect();
		}

		$this->setRedirect(JRoute::_('index.php?option=com_solidres&view=system', false))
			->redirect();
	}

	public function downloadLogFile()
	{
		if (!JFactory::getUser()->authorise('core.admin', 'com_solidres'))
		{
			throw new JAccessExceptionNotallowed(JText::_('JERROR_ALERTNOAUTHOR'), 403);
		}

		$file = $this->app->get('log_path') . '/' . $this->input->getPath('file');

		if (!is_file($file))
		{
			throw new RuntimeException('File not found.', 404);
		}

		$this->app->setHeader('Cache-Control', 'public');
		$this->app->setHeader('Content-Description', 'File Transfer');
		$this->app->setHeader('Content-Transfer-Encoding', 'binary');
		$this->app->setHeader('Content-Type', 'binary/octet-stream');
		$this->app->setHeader('Content-Disposition', 'attachment; filename=' . basename($file));
		$this->app->setHeader('Content-length', filesize($file));
		$this->app->sendHeaders();

		readfile($file);

		$this->app->close();
	}

	public function downloadJson()
	{
		$this->checkToken('get');

		if (!JFactory::getUser()->authorise('core.admin', 'com_solidres'))
		{
			throw new JAccessExceptionNotallowed(JText::_('JERROR_ALERTNOAUTHOR'), 403);
		}

		$config = array('base_path' => JPATH_COMPONENT_ADMINISTRATOR . '/views');
		$view   = $this->getView('System', 'html', 'SolidresView', $config);
		$model  = $this->getModel();
		$view->setModel($model, true);
		$data    = array();
		$logPath = $this->app->get('log_path');
		$tmpPath = $this->app->get('tmp_path');
		$curl    = extension_loaded('curl') && function_exists('curl_version');

		if ($curl)
		{
			$ch = curl_init();
			curl_setopt($ch, CURLOPT_URL, "https://tlstest.paypal.com/");
			curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
			$result = curl_exec($ch);
			curl_close($ch);
			$paypalProtocols = $result == 'PayPal_Connection_OK';
		}
		else
		{
			$paypalProtocols = false;
		}

		$data['System'] = array(
			'SOLIDRES_VERSION'                                                                     => SRVersion::getBaseVersion(),
			'JOOMLA_VERSION'                                                                       => JVERSION,
			'PHP_VERSION'                                                                          => PHP_VERSION,
			'CURL is enabled in your server'                                                       => $curl ? 'Yes' : 'No',
			'GD is enabled in your server'                                                         => extension_loaded('gd') && function_exists('gd_info') ? 'Yes' : 'No',
			'/media/com_solidres/assets/images/system/thumbnails'                                  => is_writable(JPATH_ROOT . '/media/com_solidres/assets/images/system/thumbnails') ? 'writable' : 'Not writable',
			'/media/com_solidres/assets/images/system/thumbnails/1'                                => is_writable(JPATH_ROOT . '/media/com_solidres/assets/images/system/thumbnails/1') ? 'writable' : 'Not writable',
			'/media/com_solidres/assets/images/system/thumbnails/2'                                => is_writable(JPATH_ROOT . '/media/com_solidres/assets/images/system/thumbnails/2') ? 'writable' : 'Not writable',
			$logPath                                                                               => is_writable($logPath) ? 'writable' : 'Not writable',
			$tmpPath                                                                               => is_writable($tmpPath) ? 'writable' : 'Not writable',
			'(Optional) Is Apache mod_deflate is enabled?'                                         => function_exists('apache_get_modules') && in_array('mod_deflate', apache_get_modules()) ? 'Yes' : 'No',
			'(Optional) Does my server support the new PayPal\'s protocols (TLS 1.2 and HTTP1.1)?' => $paypalProtocols ? 'Yes' : 'No',
			'(Optional) PHP setting arg_separator.output is set to \'&\'?'                         => function_exists('ini_get') && ini_get('arg_separator.output') == '&' ? 'Yes' : 'No',
		);

		$plugins           = $view->get('solidresPlugins');
		$modules           = $view->get('solidresModules');
		$templates         = JFolder::folders(JPATH_ROOT . '/templates', '[a-zA-Z0-9_\-]+', false, true);
		$templates         = array_merge($templates, JFolder::folders(JPATH_ADMINISTRATOR . '/templates', '[a-zA-Z0-9_\-]+', false, true));
		$overrideBasePaths = array(
			'html/com_solidres',
			'html/layouts/com_solidres',
			'layouts/com_solidres',
		);

		foreach ($plugins as $group => $pluginList)
		{
			foreach ($pluginList as $plugin)
			{
				$pluginName = 'plg_' . $group . '_' . $plugin;
				$extTable   = JTable::getInstance('Extension');

				if ($extTable->load(array('type' => 'plugin', 'folder' => $group, 'element' => $plugin)))
				{
					$manifest = json_decode($extTable->manifest_cache);

					if ($extTable->get('enabled'))
					{
						$data['Plugins'][$pluginName] = 'Version ' . $manifest->version . ' is enabled';
					}
					else
					{
						$data['Plugins'][$pluginName] = 'Version ' . $manifest->version . ' is not enabled';
					}
				}
				else
				{
					$data['Plugins'][$pluginName] = 'Not installed';
				}
			}
		}

		foreach ($modules as $module)
		{
			$extTable = JTable::getInstance('Extension');

			if ($extTable->load(array('type' => 'module', 'element' => $module)))
			{
				$manifest = json_decode($extTable->manifest_cache);

				if ($extTable->get('enabled'))
				{
					$data['Modules'][$module] = 'Version ' . $manifest->version . ' is enabled';
				}
				else
				{
					$data['Modules'][$module] = 'Version ' . $manifest->version . ' is not enabled';
				}

				$overrideBasePaths[] = 'html/' . $module;
			}
			else
			{
				$data['Modules'][$module] = 'Not installed';
			}
		}

		foreach ($templates as $template)
		{
			foreach ($overrideBasePaths as $overrideBasePath)
			{
				if (is_dir($template . '/' . $overrideBasePath))
				{
					$templateName = basename($template);

					if (strpos(JPath::clean($template, '/'), JPath::clean(JPATH_ADMINISTRATOR, '/')) === 0)
					{
						$data['Templates Override']['Administrator'][$templateName][] = $overrideBasePath;
					}
					else
					{
						$data['Templates Override']['Site'][$templateName][] = $overrideBasePath;
					}
				}
			}
		}

		$contents = json_encode($data, JSON_PRETTY_PRINT);
		$this->app->setHeader('Cache-Control', 'public');
		$this->app->setHeader('Expires', '0');
		$this->app->setHeader('Content-Transfer-Encoding', 'binary');
		$this->app->setHeader('Content-Type', 'application/json');
		$this->app->setHeader('Content-Disposition', 'attachment; filename=Solidres_system_data-' . date('Ymd-His') . '.json');
		$this->app->setHeader('Content-length', strlen($contents));
		$this->app->sendHeaders();

		echo $contents;

		$this->app->close();
	}

	public function exportLanguages()
	{
		$this->checkToken('get');

		if (!JFactory::getUser()->authorise('core.admin', 'com_solidres'))
		{
			throw new JAccessExceptionNotallowed(JText::_('JERROR_ALERTNOAUTHOR'), 403);
		}

		JLoader::import('joomla.filesystem.path');
		JLoader::import('joomla.archive.archive');
		$config = ['base_path' => JPATH_COMPONENT_ADMINISTRATOR . '/views'];
		$view   = $this->getView('System', 'html', 'SolidresView', $config);
		$model  = $this->getModel();
		$view->setModel($model, true);
		$view->loadProperties();
		$zipData  = [];
		$language = $this->input->get('language', '*', 'string');

		foreach ($view->get('languageFiles') as $languageFile)
		{
			$fileName  = str_replace(JPath::clean(JPATH_ROOT, '/'), '', JPath::clean($languageFile, '/'));

			if ('*' === $language || 0 === strpos(basename($fileName), $language))
			{
				$zipData[] = [
				'name' => ltrim($fileName, '/'),
				'data' => file_get_contents($languageFile),
				];
			}
		}

		$tmpPath = JPATH_ROOT . '/tmp';

		if (!is_dir($tmpPath))
		{
			JFolder::create($tmpPath, 0755);
		}

		/** @var \JArchiveZip $zip */

		if (version_compare(JVERSION, '4.0', 'ge'))
		{
			$zip = new \Joomla\Archive\Zip;
		}
		else
		{
			$zip = JArchive::getAdapter('zip');
		}

		$file = $tmpPath . '/Solidres_language_files-' . ('*' === $language ? '' : $language . '-') . date('Y-m-d') . '.zip';

		if (!$zip->create($file, $zipData))
		{
			throw new RuntimeException('Cannot create ZIP file.');
		}

		if (function_exists('ini_get') && function_exists('ini_set'))
		{
			if (ini_get('zlib.output_compression'))
			{
				ini_set('zlib.output_compression', 'Off');
			}
		}

		if (function_exists('ini_get') && function_exists('set_time_limit'))
		{
			if (!ini_get('safe_mode'))
			{
				@set_time_limit(0);
			}
		}

		@ob_end_clean();
		@clearstatcache();
		$headers = array(
			'Expires'                   => '0',
			'Pragma'                    => 'no-cache',
			'Cache-Control'             => 'must-revalidate, post-check=0, pre-check=0',
			'Content-Type'              => 'application/zip',
			'Content-Length'            => filesize($file),
			'Content-Disposition'       => 'attachment; filename="' . basename($file) . '"',
			'Content-Transfer-Encoding' => 'binary',
			'Accept-Ranges'             => 'bytes',
			'Connection'                => 'close',
		);

		foreach ($headers as $name => $value)
		{
			$this->app->setHeader($name, $value);
		}

		$this->app->sendHeaders();
		flush();

		$blockSize = 1048576; //1M chunks
		$handle    = @fopen($file, 'r');

		if ($handle !== false)
		{
			while (!@feof($handle))
			{
				echo @fread($handle, $blockSize);
				@ob_flush();
				flush();
			}
		}

		if ($handle !== false)
		{
			@fclose($handle);
		}

		$this->app->close();
	}
}
