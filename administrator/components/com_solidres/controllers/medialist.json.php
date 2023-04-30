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
 * @package       Solidres
 * @subpackage    Media
 * @since         0.4.0
 */
class SolidresControllerMediaList extends JControllerLegacy
{
	public function __construct($config = array())
	{
		parent::__construct($config);
	}

	public function show()
	{
		try
		{
			$model = $this->getModel();
			$start = $this->input->getUInt('start');
			$limit = $this->input->getUInt('limit');
			$q     = $this->input->getString('q', '');
			$this->app->setUserState('com_solidres.media.view', $this->input->getWord('viewMode', 'grid'));
			$model->setState('list.start', $start);
			$model->setState('list.limit', $limit);
			$model->setState('filter.search', $q);
			$view = $this->getView('Medialist', 'html', 'SolidresView');
			$view->setModel($model, true);
			ob_start();
			$view->display();
			$response = ob_get_clean();
		}
		catch (RuntimeException $e)
		{
			$response = $e;
		}

		echo new JResponseJson($response);

		$this->app->close();
	}

	/**
	 * Method to get a model object, loading it if required.
	 *
	 * @param    string $name   The model name. Optional.
	 * @param    string $prefix The class prefix. Optional.
	 * @param    array  $config Configuration array for model. Optional.
	 *
	 * @return    object    The model.
	 * @since    1.5
	 */
	public function getModel($name = 'MediaList', $prefix = 'SolidresModel', $config = array())
	{
		return parent::getModel($name, $prefix, $config);
	}
}