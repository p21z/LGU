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

$fieldSets = $this->form->getFieldsets('params');
foreach ($fieldSets as $name => $fieldSet) :
	if ($name == 'embed_form') continue;
	foreach ($this->form->getFieldset($name) as $field) :
		echo $field->renderField();
	endforeach;
endforeach;