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

// Define constants that are used across Solidres system
define('SRPATH_MEDIA', JPATH_SITE . '/media/com_solidres');
define('SRPATH_HELPERS', JPATH_ADMINISTRATOR . '/components/com_solidres/helpers');
define('SRPATH_LIBRARY', JPATH_LIBRARIES . '/solidres');
define('SRPATH_MEDIA_IMAGE_SYSTEM', SRPATH_MEDIA . '/assets/images/system');
if (defined('STDOUT') && defined('STDIN') && isset($_SERVER['argv']))
{

}
else
{
	define('SRURI_MEDIA', JURI::root() . 'media/com_solidres');
}
define('SR_ISJ4', (explode('.', JVERSION)[0] == '4'));
define('SR_ISJ3', (explode('.', JVERSION)[0] == '3'));

$solidresUIFramework = JComponentHelper::getParams('com_solidres')->get('ui_framework', 'bs5');
$app                 = JFactory::getApplication();

define('SR_UI', $solidresUIFramework);

define('SR_UITAB', 'uitab');

define('SR_UI_GRID_CONTAINER', 'row');
define('SR_UI_GRID_COL_1', 'col-md-1');
define('SR_UI_GRID_COL_2', 'col-md-2');
define('SR_UI_GRID_COL_3', 'col-md-3');
define('SR_UI_GRID_COL_4', 'col-md-4');
define('SR_UI_GRID_COL_5', 'col-md-5');
define('SR_UI_GRID_COL_6', 'col-md-6');
define('SR_UI_GRID_COL_7', 'col-md-7');
define('SR_UI_GRID_COL_8', 'col-md-8');
define('SR_UI_GRID_COL_9', 'col-md-9');
define('SR_UI_GRID_COL_10', 'col-md-10');
define('SR_UI_GRID_COL_12', 'col-md-12');
define('SR_UI_GRID_OFFSET_1', 'offset-md-1');
define('SR_UI_GRID_OFFSET_2', 'offset-md-2');
define('SR_UI_GRID_OFFSET_3', 'offset-md-3');
define('SR_UI_GRID_OFFSET_4', 'offset-md-4');
define('SR_UI_GRID_OFFSET_5', 'offset-md-5');
define('SR_UI_GRID_OFFSET_6', 'offset-md-6');
define('SR_UI_GRID_OFFSET_7', 'offset-md-7');
define('SR_UI_INPUT_APPEND', 'input-group');
define('SR_UI_INPUT_PREPEND', 'input-group');
define('SR_UI_INPUT_GROUP_APPEND', 'input-group-append');
define('SR_UI_INPUT_GROUP_PREPEND', 'input-group-prepend');
define('SR_UI_INPUT_ADDON', 'input-group-text');
define('SR_UI_FORM_ROW', $app->isClient('administrator') ? 'control-group' : 'form-group');
define('SR_UI_FORM_LABEL', 'control-label');
define('SR_UI_FORM_FIELD', 'controls');
define('SR_UI_CAROUSEL_ITEM', 'carousel-item');
define('SR_UI_BTN_DEFAULT', 'btn-secondary');
define('SR_UI_TEXT_DANGER', 'text-danger');


define('PER_ROOM_PER_NIGHT', 0);
define('PER_PERSON_PER_NIGHT', 1);
define('PACKAGE_PER_ROOM', 2);
define('PACKAGE_PER_PERSON', 3);
define('PER_ROOM_TYPE_PER_STAY', 4);
