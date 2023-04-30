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
 * HTML View class for the Solidres component
 *
 * @package      Solidres
 * @since        0.1.0
 */
class SolidresViewRoomType extends JViewLegacy
{
	public function display($tpl = null)
	{
		$model = $this->getModel();

		$this->item   = $model->getItem();
		$this->config = JComponentHelper::getParams('com_solidres');

		JHtml::_('jquery.framework');
		JHtml::_('bootstrap.framework');
		SRHtml::_('jquery.colorbox', 'show_map', '95%', '90%', 'true', 'false');
		JHtml::_('stylesheet', 'com_solidres/assets/main.min.css', array('version' => SRVersion::getHashVersion(), 'relative' => true));

		JPluginHelper::importPlugin('extension');
		JPluginHelper::importPlugin('solidres');

		// Trigger the data preparation event.
		JFactory::getApplication()->triggerEvent('onRoomTypePrepareData', array('com_solidres.roomtype', $this->item));

		$this->_prepareDocument();

		$this->defaultGallery = '';
		$defaultGallery       = $this->config->get('default_gallery', 'simple_gallery');
		if (SRPlugin::isEnabled($defaultGallery))
		{
			$layout = SRLayoutHelper::getInstance();
			$layout->addIncludePath(SRPlugin::getLayoutPath($defaultGallery));
			$this->defaultGallery = $layout->render(
				'gallery.default' . ((defined('SR_LAYOUT_STYLE') && SR_LAYOUT_STYLE != '') ? '_' . SR_LAYOUT_STYLE : ''),
				array(
					'media'    => $this->item->media,
					'alt_attr' => $this->item->name,
					'scope'    => 'roomtype'
				)
			);
		}

		JFactory::getDocument()->addScriptDeclaration('
			Solidres.jQuery(function ($) {
				$(".sr-photo").colorbox({rel:"sr-photo", transition:"fade", width: "98%", height: "98%", className: "colorbox-w"});
			});
		');

		parent::display($tpl);
	}

	/**
	 * Prepares the document like adding meta tags/site name per ReservationAsset
	 *
	 * @return void
	 */
	protected function _prepareDocument()
	{
		$menu = JFactory::getApplication()->getMenu()->getActive();

		if ($menu
			&& @$menu->query['option'] == 'com_solidres'
			&& @$menu->query['view'] == 'roomtype'
			&& @$menu->query['id'] == $this->item->id
		)
		{
			$params = $menu->getParams();

			if (empty($metaTitle))
			{
				$metaTitle = trim($params->get('page_title'));
			}

			if (empty($metaDesc))
			{
				$metaDesc = trim($params->get('menu-meta_description'));
			}

			if (empty($metaKey))
			{
				$metaKey = trim($params->get('menu-meta_keywords'));
			}
		}

		if (empty($metaTitle))
		{
			if ($this->item->name)
			{
				$this->document->setTitle($this->item->name);
			}
		}

		$this->document->setDescription($metaDesc);
		$this->document->setMetadata('keywords', $metaKey);
	}
}