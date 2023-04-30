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
 * @subpackage    Reservation
 * @since         0.1.0
 */
class SolidresControllerMap extends JControllerLegacy
{
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
	public function getModel($name = 'Map', $prefix = 'SolidresModel', $config = array())
	{
		return parent::getModel($name, $prefix, $config);
	}

	/**
	 * Show map of a single reservation asset
	 *
	 */
	public function show()
	{
		$model     = $this->getModel();
		$modelName = $model->getName();
		$id        = $this->input->getUint('id');

		$model->setState($modelName . '.assetId', $id);

		$this->input->set('tmpl', 'component');

		$document   = JFactory::getDocument();
		$viewType   = $document->getType();
		$viewName   = 'Map';
		$viewLayout = 'default';

		$view = $this->getView($viewName, $viewType, '', array('base_path' => $this->basePath, 'layout' => $viewLayout));
		$view->setModel($model, true);
		$view->document = $document;
		$view->display();
	}

	/**
	 * Show map of a location
	 *
	 * @since 0.6.0
	 */
	public function showLocation()
	{
		$this->input->set('tmpl', 'component');
		$location = $this->input->getString('location');
		$model    = $this->getModel();
		$model->setState('filter.location', $location);

		$document   = JFactory::getDocument();
		$viewType   = $document->getType();
		$viewName   = 'Map';
		$viewLayout = 'location';

		$view = $this->getView($viewName, $viewType, '', array('base_path' => $this->basePath, 'layout' => $viewLayout));

		$view->setModel($model, true);

		$view->document = $document;

		$view->display();
	}
}