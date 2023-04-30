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

defined('JPATH_BASE') or die;

use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;

class JFormFieldModal_Media extends JFormField
{
	protected $type = 'Modal_Media';

	protected static $loaded = [];

	protected function getInput()
	{
		$html     = array();
		$href     = JUri::base(true) . '/index.php?option=com_solidres&view=medialist&layout=modal&tmpl=component';
		$required = $this->getAttribute('required');
		$required = $required && ($required != '0' || $required != 'false') ? ' required' : '';
		$class    = $this->getAttribute('class', '') . $required . ' form-control input-medium';
		$html[]   = '<div class="input-append input-group' . $required . '">';
		$html[]   = '     <input type="text" name="' . $this->name . '" readonly id="' . $this->id . '" class="' . $class . '" value="' . htmlspecialchars($this->value, ENT_COMPAT, 'UTF-8') . '"' . $required . '/>';

		if (!empty($this->value))
		{
			$srMedia = SRFactory::get('solidres.media.media');
			$html[]  = '<a href="' . $srMedia->getMediaUrl($this->value) . '" class="btn btn-default btn-light sr-photo cboxElement"><i class="fa fa-image"></i></a>';
		}

		$html[] = '     <a href="javascript:void(0)" data-bs-target="#sr-media-modal-field" data-target="#sr-media-modal-field" data-bs-toggle="modal" data-toggle="modal" class="btn btn-default btn-light"><span class="icon-file"></span> ' . JText::_('JSELECT') . '</a>';
		$html[] = '     <a href="#" id="' . $this->id . '_clear" class="btn btn-default btn-light' . (empty($this->value) ? ' hide' : '') . '"><span class="icon-remove"></span> ' . JText::_('JCLEAR') . '</a>';
		$html[] = '</div>';
		JFactory::getDocument()->addScriptDeclaration('
			Solidres.jQuery(document).ready(function($) {
				var modal = $("#sr-media-modal-field");
				var modalEl = document.getElementById("sr-media-modal-field");	
				$("#' . $this->id . '_clear").on("click", function(e){
					e.preventDefault();
					$("#' . $this->id . '").val("").next(".sr-photo").hide();
					$(this).addClass("hide");
				});
				
				function manipulateIframe(iframe) {
			        
		            var iframeContent = $(iframe).contents();
		            iframeContent.find("#media-library-insert").attr("id", "media-modal-insert");
			        iframeContent.on("click", "[data-media-id]", function(e){
			            var media = $(this);     
			            $(iframe).find("#medialibrary .media-checkbox").prop("checked", false);
			            $(iframe).find("#medialibrary [data-media-id]").removeClass("media-selected");                           
			            media.addClass("media-selected");
			            media.find(".media-checkbox").prop("checked", true);
			        });
			        
			        iframeContent.on("dblclick", "[data-media-id]", function(e){
			            e.preventDefault();
			            var media = $(this);
			            if(media.hasClass("media-selected")){
			                $("#' . $this->id . '").val(media.data("mediaValue"));
			                $("#' . $this->id . '_clear").removeClass("hide");
					        $("#sr-media-modal-field").modal("hide");
					    }
			        });
			        
			        iframeContent.on("click", "#media-modal-insert", function(e){
			            e.preventDefault();
			            if(!iframeContent.find("[data-media-id].media-selected").length){
			                alert("' . JText::_('SR_NO_MEDIA_SELECTED') . '");
			                return false;
			            }
			            
			            iframeContent.find("[data-media-id].media-selected").trigger("dblclick");
			        });
				}
				
				if (4 == Solidres.options.get("JVersion")) {
					modalEl.addEventListener("shown.bs.modal", function(){
						var iframe = modalEl.querySelector(".modal-body>iframe");
						manipulateIframe(iframe);
				        iframe.addEventListener("load", function() {
							manipulateIframe(iframe);
						});
					});
				} else {
					modal.on("shown.bs.modal", function() {
						var iframe = modalEl.querySelector(".modal-body>iframe");
						manipulateIframe(iframe);
						iframe.addEventListener("load", function() {
							manipulateIframe(iframe);
						});
					});
				}
			});
		');

		if (!isset(static::$loaded[$this->type]))
		{
			echo HTMLHelper::_(
				'bootstrap.renderModal',
				'sr-media-modal-field',
				[
					'title'      => Text::_('SR_MEDIA_MANAGER'),
					'url'        => $href,
					//'height'     => '100%',
					//'width'      => '100%',
					'bodyHeight' => '80',
					'modalWidth' => '90',
					'footer'     => '<button type="button" class="btn btn-secondary" data-dismiss="modal" data-bs-dismiss="modal" aria-hidden="true">'
						. Text::_("JLIB_HTML_BEHAVIOR_CLOSE") . '</button>'
				]
			);
		}
		else
		{
			static::$loaded[$this->type] = true;
		}

		return join("\n", $html);
	}
}