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

use Joomla\CMS\Factory;
use Joomla\CMS\Session\Session;
use Joomla\CMS\Language\Text;

?>
<div class="<?php echo SR_UI_GRID_CONTAINER ?> system-info-section">
    <div class="<?php echo SR_UI_GRID_COL_12 ?>">
        <h3>
            <?php echo Text::_('SR_FILE_VERIFICATION'); ?>
        </h3>

        <p>
            <button type="button" class="btn btn-light" id="file-check-verification">
                <i class="icon-cogs"></i> <?php echo Text::_('SR_FILE_VERIFICATION_CHECK'); ?>
            </button>
            <img src="<?php echo SRURI_MEDIA . '/assets/images/ajax-loader2.gif'; ?>" alt="Loading..."
                 id="ajax-loader"
                 class="hide"/>
        </p>

        <div id="file-verification">

        </div>
    </div>
</div>

<?php
Factory::getDocument()->addScriptDeclaration("
    Solidres.jQuery(document).ready(function ($) {
        $('#file-check-verification').on('click', function () {
            $('#ajax-loader').removeClass('hide');
            $.ajax({
                url: Joomla.getOptions('system.paths').base + '/index.php?option=com_solidres&task=system.checkVerification',
                type: 'post',
                dataType: 'json',
                data: {
                    '" . Session::getFormToken() . "': 1
                },
                success: function (response) {
                    var _packages = response.data, html = '', _package;

                    for (_package in _packages) {
                        var hasChange = _packages[_package].removed.length > 0 || _packages[_package].modified.length > 0 || _packages[_package].new.length > 0;
                        if (hasChange) {
                            html += '<div class=\"well\"><h4 class=\"badge bg-info\">' + _package.toUpperCase() + '</h4>';
                            if (_packages[_package].removed.length > 0) {
                                html += '<h5 class=\"" . SR_UI_TEXT_DANGER ."\">" . Text::_('SR_FILE_VERIFICATION_REMOVED') . "</h5>';
                                for (var i = 0, n = _packages[_package].removed.length; i < n; i++) {
                                    html += '<div class=\"" . SR_UI_TEXT_DANGER ."\"><i class=\"icon-file\"></i> ' + _packages[_package].removed[i] + '</div>';
                                }
                            }
                            if (_packages[_package].modified.length > 0) {
                                html += '<h5 class=\"text-warning\">" . Text::_('SR_FILE_VERIFICATION_MODIFIED') ."</h5>';
                                for (var i = 0, n = _packages[_package].modified.length; i < n; i++) {
                                    html += '<div class=\"text-warning\"><i class=\"icon-file\"></i> ' + _packages[_package].modified[i] + '</div>';
                                }
                            }
                            if (_packages[_package].new.length > 0) {
                                html += '<h5 class=\"text-success\">" . Text::_('SR_FILE_VERIFICATION_NEW') . "</h5>';
                                for (var i = 0, n = _packages[_package].new.length; i < n; i++) {
                                    html += '<div class=\"text-success\"><i class=\"icon-file\"></i> ' + _packages[_package].new[i] + '</div>';
                                }
                            }
                            html += '</div>';
                        }
                    }

                    $('#ajax-loader').addClass('hide');
                    $('#file-verification').html(html);
                }
            });

            var el = $(this);
            $('html, body').animate({
                scrollTop: el.offset().top
            }, 800);
        });
    });
");
