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

use Joomla\CMS\Component\ComponentHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Language\Text;
use Joomla\CMS\Utility\Utility;
use Joomla\CMS\Session\Session;

HTMLHelper::_('behavior.core');

?>
<div style="padding: 15px; text-align: center; border: 1px dashed #ddd">
    <input type="file" name="files" id="uploader" accept="image/*" multiple/>
	<?php $cMax = (int) ComponentHelper::getParams('com_media')->get('upload_maxsize'); ?>
	<?php $maxSize = Utility::getMaxUploadSize($cMax . 'MB'); ?>
	<?php echo Text::sprintf('JGLOBAL_MAXIMUM_UPLOAD_SIZE_LIMIT', HTMLHelper::_('number.bytes', $maxSize)); ?>
</div>
<script>
    Solidres.jQuery(document).ready(function ($) {
        var uploader = $('#uploader');
        uploader.on('change', function () {
            if (this.files.length) {
                var formData = new FormData, i, n;
                formData.append('<?php echo Session::getFormToken(); ?>', 1);

                for (i = 0, n = this.files.length; i < n; i++) {
                    formData.append('files[]', this.files[i]);
                }

                if (Solidres.options.get('JVersion') == 4) {
                    document.body.appendChild(document.createElement('joomla-core-loader'));
                } else {
                    Joomla.loadingLayer('show');
                }

                $.ajax({
                    url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=media.upload&format=json',
                    type: 'post',
                    dataType: 'json',
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function (response) {
                        uploader.val('');
                        $('#media-lib-wrap').html($(response.data).html());

                        if (Solidres.options.get('JVersion') == 4) {
                            var spinnerElement = document.querySelector('joomla-core-loader');
                            spinnerElement.parentNode.removeChild(spinnerElement);
                        } else {
                            Joomla.loadingLayer('hide');
                        }

                        Joomla.renderMessages(response.messages);
                    }
                });
            }
        });

        if (window.parent && window.parent.jQuery) {
            window.parent.jQuery('.modal').on('hide hidden.bs.modal', function () {
                $('#system-message-container').empty();
            });
        }
    });
</script>
