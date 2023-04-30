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

use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\HTML\HTMLHelper;

/**
 * View to manage media.
 *
 * @package       Solidres
 * @subpackage    Media
 * @since         0.1.0
 */
class SolidresViewMediaList extends JViewLegacy
{
	protected $state;
	protected $items;
	protected $total;
	protected $pagination;
	protected $comMediaParams;
	protected $layoutId;

	public function display($tpl = null)
	{
		$model = $this->getModel();
		$model->setState('list.ordering', 'a.created_date');
		$model->setState('list.direction', 'DESC');
		$this->state          = $model->getState();
		$this->items          = $model->getItems();
		$this->total          = $model->getTotal();
		$this->pagination     = $model->getPagination();
		$this->comMediaParams = JComponentHelper::getParams('com_media');
		$this->layoutId       = 'solidres.media.' . JFactory::getApplication()->getUserState('com_solidres.media.view', 'grid');

		if ($errors = $this->get('Errors'))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));

		parent::display($tpl);
	}
}
