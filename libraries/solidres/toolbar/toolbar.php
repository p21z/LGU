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

use Joomla\CMS\Router\Route;
use Joomla\CMS\Toolbar\ToolbarHelper;
use Joomla\CMS\Toolbar\Toolbar;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Layout\FileLayout;

if (!class_exists('SRToolbarHelper'))
{
	class SRToolbarHelper extends ToolbarHelper
	{
		public static function mediaManager($url = 'index.php?option=com_solidres&view=medialist&tmpl=component', $text = 'SR_MEDIA_MANAGER', $class = 'btn btn-default btn-small media-manager-modal')
		{
			$bar  = Toolbar::getInstance();

			if (SR_ISJ4)
			{
				$bar->popupButton()
					->url(Route::_($url))
					->text($text)
					->selector('mediaManager')
					->iframeWidth('100%')
					->iframeHeight('100%')
					->bodyHeight('80')
					->modalWidth('90')
					->icon('fa fa-images')
					->footer('<button class="btn btn-secondary" data-bs-dismiss="modal" type="button"'
						. ' onclick="window.parent.Joomla.Modal.getCurrent().close();">'
						. Text::_('JCLOSE') . '</button>'
					);
			}
			else
			{
				$bar->appendButton('Popup', 'pictures', $text, $url, '680', '680');
			}
		}

		public static function customLink($url, $text, $class)
		{
			$bar  = Toolbar::getInstance();
			$html = '<a class="btn btn-light btn-default btn-sm btn-small" href="' . JRoute::_($url) . '">';
			$html .= '<i class="' . $class . '"></i> ';
			$html .= Text::_($text);
			$html .= '</a>';
			$bar->appendButton('Custom', $html);
		}

		public static function printTable($target = '')
		{
			if (empty($target))
			{
				$target = "document.getElementById('adminForm').querySelector('.table')";
			}
			$bar     = Toolbar::getInstance('toolbar');

			if (SR_ISJ4)
			{
				$bar->standardButton()
					->text(Text::_('SR_PRINT'))
					->icon('fa fa-print')
					->onclick("Solidres.printTable($target)");
			}
			else
			{
				$options = array();
				$options['text']     = Text::_('SR_PRINT');
				$options['class']    = 'icon-print';
				$options['doTask']   = "Solidres.printTable($target)";
				$options['btnClass'] = 'btn btn-small button-print';
				$layout = new FileLayout('joomla.toolbar.standard');

				$bar->appendButton('Custom', $layout->render($options), 'printTable');
			}
		}
	}
}