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

abstract class SRHtmlJquery
{
	/**
	 * @var    array  Array containing information for loaded files
	 * @since  3.0
	 */
	protected static $loaded = array();

	/**
	 * Method to load the jQuery UI framework into the document head
	 *
	 * If debugging mode is on an uncompressed version of jQuery UI is included for easier debugging.
	 *
	 * @return  void
	 */
	public static function ui()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}
		$options = ['version' => SRVersion::getHashVersion(), 'relative' => true];
		JHtml::_('jquery.framework');

		if (SR_ISJ4)
		{
			JHtml::_('stylesheet', 'com_solidres/assets/jquery/themes/base/jquery-ui-1.13.1.min.css', $options);
			JHtml::_('script', 'com_solidres/assets/jquery/ui/jquery-ui-1.13.1.min.js', $options);
		}
		else
		{
			JHtml::_('stylesheet', 'com_solidres/assets/jquery/themes/base/jquery-ui.min.css', $options);
			JHtml::_('script', 'com_solidres/assets/jquery/ui/jquery-ui.min.js', $options);
		}


		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the jQuery Cookie into the document head
	 *
	 * If debugging mode is on an uncompressed version of jQuery Cookie is included for easier debugging.
	 *
	 * @return  void
	 */
	public static function cookie()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		$options = ['version' => SRVersion::getHashVersion(), 'relative' => true];
		JHtml::_('script', 'com_solidres/assets/jquery/external/jquery_cookie.js', $options);

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the colorbox into the document head
	 *
	 * If debugging mode is on an uncompressed version of colorbox is included for easier debugging.
	 *
	 * @param string $class
	 * @param string $width
	 * @param string $height
	 * @param string $iframe
	 * @param string $inline
	 *
	 * @return  void
	 */
	public static function colorbox($class = 'sr-iframe', $width = '80%', $height = '80%', $iframe = "true", $inline = "false", $extra_options = "")
	{
		if (empty(static::$loaded[__METHOD__]))
		{
			$options = ['version' => SRVersion::getHashVersion(), 'relative' => true];
			JHtml::_('stylesheet', 'com_solidres/assets/colorbox.css', $options);
			JHtml::_('script', 'com_solidres/assets/colorbox/jquery.colorbox.min.js', $options);

			$activeLanguageTag   = JFactory::getLanguage()->getTag();
			$allowedLanguageTags = array('ar-AA', 'bg-BG', 'ca-ES', 'cs-CZ', 'da-DK', 'de-DE', 'el-GR', 'es-ES', 'et-EE',
				'fa-IR', 'fi-FI', 'fr-FR', 'he-IL', 'hr-HR', 'hu-HU', 'it-IT', 'ja-JP', 'ko-KR', 'lv-LV', 'nb-NO', 'nl-NL',
				'pl-PL', 'pt-BR', 'ro-RO', 'ru-RU', 'sk-SK', 'sr-RS', 'sv-SE', 'tr-TR', 'uk-UA', 'zh-CN', 'zh-TW'
			);

			// English is bundled into the source therefore we don't have to load it.
			if (in_array($activeLanguageTag, $allowedLanguageTags))
			{
				JHtml::_('script', 'com_solidres/assets/colorbox/i18n/jquery.colorbox-' . $activeLanguageTag . '.js', $options);
			}

			$script = '
				Solidres.jQuery(document).ready(function($){
					$(".' . $class . '").colorbox({iframe: ' . $iframe . ', inline: ' . $inline . ', width:"' . $width . '", height:"' . $height . '"' . $extra_options . '});
				});
			';
			JFactory::getDocument()->addScriptDeclaration($script);
		}
		else
		{
			$script = '
				Solidres.jQuery(document).ready(function($){
					$(".' . $class . '").colorbox({iframe: ' . $iframe . ', inline: ' . $inline . ', width:"' . $width . '", height:"' . $height . '"' . $extra_options . '});
				});
			';
			JFactory::getDocument()->addScriptDeclaration($script);
		}

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the datepicker into the document head
	 *
	 * @param string $format
	 * @param string $altField
	 * @param string $altFormat
	 * @param string $cssClass
	 *
	 * @return  void
	 */
	public static function datepicker($format = 'dd-mm-yy', $altField = '', $altFormat = '', $cssClass = '.datepicker')
	{
		static $loaded = [];

		if (isset($loaded[$cssClass]) && $loaded[$cssClass])
		{
			return;
		}

		$options = ['version' => SRVersion::getHashVersion(), 'relative' => true];
		JHtml::_('script', 'com_solidres/assets/datePicker/localization/jquery.ui.datepicker-' . JFactory::getLanguage()->getTag() . '.js', $options);
		$params               = array();
		$params['dateFormat'] = $format;
		if (!empty($altField))
		{
			$params['altField'] = $altField;
		}

		if (!empty($altFormat))
		{
			$params['altFormat'] = $altFormat;
		}

		$paramsString = '';
		foreach ($params as $k => $v)
		{
			$paramsString .= "$k:'$v',";
		}

		$script = '
		Solidres.jQuery(function($) {
			$( "' . $cssClass . '" ).datepicker({
				' . $paramsString . '
			});
			$("' . $cssClass . '").datepicker($.datepicker.regional["' . JFactory::getLanguage()->getTag() . '"]);
			$(".ui-datepicker").addClass("notranslate");
		});';
		JFactory::getDocument()->addScriptDeclaration($script);

		$loaded[$cssClass] = true;
	}

	public static function validate()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		$options = ['version' => SRVersion::getHashVersion(), 'relative' => true];
		JHtml::_('jquery.framework');
		JHtml::_('script', 'com_solidres/assets/validate/jquery.validate.min.js', $options);
		JHtml::_('script', 'com_solidres/assets/validate/additional-methods.min.js', $options);

		$activeLanguageTag   = JFactory::getLanguage()->getTag();
		$allowedLanguageTags = array('ar-AA', 'bg-BG', 'ca-ES', 'cs-CZ', 'da-DK', 'de-DE', 'el-GR', 'es-AR', 'es-ES', 'et-EE',
			'fa-IR', 'fi-FI', 'fr-FR', 'he-IL', 'hr-HR', 'hu-HU', 'it-IT', 'ja-JP', 'ko-KR', 'lv-LV', 'nb-NO', 'nl-NL',
			'pl-PL', 'pt-BR', 'ro-RO', 'ru-RU', 'sk-SK', 'sr-RS', 'sv-SE', 'th-TH', 'tr-TR', 'uk-UA', 'vi-VN', 'zh-CN', 'zh-TW'
		);

		// English is bundled into the source therefore we don't have to load it.
		if (in_array($activeLanguageTag, $allowedLanguageTags))
		{
			JHtml::_('script', 'com_solidres/assets/validate/localization/messages_' . $activeLanguageTag . '.js', $options);
		}

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the jquery editable into the document head
	 *
	 * @return  void
	 */
	public static function editable()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		$options = ['version' => SRVersion::getHashVersion(), 'relative' => true];
		JHtml::_('jquery.framework');
		JHtml::_('bootstrap.framework');
		JHtml::_('stylesheet', 'com_solidres/assets/bootstrap-editable.min.css', $options);
		JHtml::_('script', 'com_solidres/assets/editable/bootstrap-editable.min.js', $options);

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the jquery geocomplete into the document head
	 *
	 * @return  void
	 */
	public static function geocomplete()
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		$solidresParams  = JComponentHelper::getParams('com_solidres');
		$googleMapApiKey = $solidresParams->get('google_map_api_key', '');
		$options         = ['relative' => true, 'version' => SRVersion::getHashVersion()];

		JHtml::_('jquery.framework');
		JHtml::_('script', '//maps.googleapis.com/maps/api/js?libraries=places' . (!empty($googleMapApiKey) ? '&key=' . $googleMapApiKey : ''), $options);
		JHtml::_('script', 'com_solidres/assets/geocomplete/jquery.geocomplete.min.js', $options);

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to load the Sortable script and make table sortable
	 *
	 * @param   string  $tableId                DOM id of the table
	 * @param   string  $formId                 DOM id of the form
	 * @param   string  $sortDir                Sort direction
	 * @param   string  $saveOrderingUrl        Save ordering url, ajax-load after an item dropped
	 * @param   boolean $proceedSaveOrderButton Set whether a save order button is displayed
	 * @param   boolean $nestedList             Set whether the list is a nested list
	 *
	 * @return  void
	 *
	 * @since   3.0
	 */
	public static function sortable($tableId, $formId, $sortDir = 'asc', $saveOrderingUrl = '', $proceedSaveOrderButton = true, $nestedList = false)
	{
		// Only load once
		if (!empty(static::$loaded[__METHOD__]))
		{
			return;
		}

		// Depends on jQuery UI
		//JHtml::_('jquery.ui', array('core', 'sortable'));

		JHtml::_('script', 'jui/sortablelist.js', false, true);
		JHtml::_('stylesheet', 'jui/sortablelist.css', false, true, false);

		// Attach sortable to document
		JFactory::getDocument()->addScriptDeclaration("
			(function ($){
				$(document).ready(function (){
					var sortableList = new $.JSortableList('#" . $tableId . " tbody','" . $formId . "','" . $sortDir . "' , '" . $saveOrderingUrl . "','','" . $nestedList . "');
				});
			})(jQuery);
			"
		);

		if ($proceedSaveOrderButton)
		{
			static::_proceedSaveOrderButton();
		}

		static::$loaded[__METHOD__] = true;

		return;
	}

	/**
	 * Method to inject script for enabled and disable Save order button
	 * when changing value of ordering input boxes
	 *
	 * @return  void
	 *
	 * @since   3.0
	 */
	public static function _proceedSaveOrderButton()
	{
		JFactory::getDocument()->addScriptDeclaration(
			"(function ($){
				$(document).ready(function (){
					var saveOrderButton = $('.saveorder');
					saveOrderButton.css({'opacity':'0.2', 'cursor':'default'}).attr('onclick','return false;');
					var oldOrderingValue = '';
					$('.text-area-order').focus(function ()
					{
						oldOrderingValue = $(this).attr('value');
					})
					.keyup(function (){
						var newOrderingValue = $(this).attr('value');
						if (oldOrderingValue != newOrderingValue)
						{
							saveOrderButton.css({'opacity':'1', 'cursor':'pointer'}).removeAttr('onclick')
						}
					});
				});
			})(jQuery);"
		);

		return;
	}

	public static function popover()
	{
		static $loaded = false;

		if (!$loaded)
		{
			$loaded  = true;
			$options = ['relative' => true, 'version' => SRVersion::getHashVersion()];
			JHtml::_('jquery.framework');
			JHtml::_('stylesheet', 'com_solidres/assets/jquery.webui-popover.min.css', $options);
			JHtml::_('script', 'com_solidres/assets/jquery.webui-popover.min.js', $options);
		}
	}

	public static function distanceSlider()
	{
		static $slider = false;

		if (!$slider)
		{
			$slider = true;
			self::ui();

			$options = ['relative' => true, 'version' => SRVersion::getHashVersion()];
			JHtml::_('stylesheet', 'com_solidres/assets/jquery/ui/widgets/slider.min.css', $options);
			JHtml::_('script', 'com_solidres/assets/jquery/ui/widgets/slider.min.js', $options);
			JFactory::getDocument()
				->addStyleDeclaration('
				.sr-range-distance {margin: 15px 0}
				.sr-range-distance > div, .sr-range-distance .ui-slider-handle {border-color: #d3d3d3}
				.sr-range-distance input, #-range {max-width: 100%}
				.sr-range-distance input{border-radius: 16px; background-color: #fff; text-align: center; box-sizing: border-box}
				.sr-range-distance .ui-slider-handle {background-color: #e6e6e6}
			')
				->addScriptDeclaration('Solidres.jQuery(document).ready(function($) {	
			
			var input, range;
			var slider = function(value) {			
				$(".sr-slider-input").each(function() {
					input = $(this);
					
					if (input.data("distanceSlider") === true) {
						return;
					}
					
					input.data("distanceSlider", true);
					range = $("#" + input.attr("id") + "-range");					
					value = value || $.trim(input.val());
				
					if (!value.length || value.indexOf("-") === -1) {
						value = "0-0";
					}
					
					input.val(value);
					range.slider({
						range: true,
					    min: 0,
					    max: 100,
					    values: value.split("-"),
					    slide: function(event, ui){
					        if(ui.values[0] + 5 >= ui.values[1]){
					            return false;
					        }
					        
					        input.val(ui.values[0] + " - " + ui.values[1]);
					    },
					    stop: function(event, ui){
					        if(input.val() != value){
					            value = input.val();
					            input.trigger("change");
					        }
					    }
					});
				});
			};
			
			slider();
			window.distanceSlider = slider;
			
		});');
		}
	}
}
