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

class translationSr_statuses_typeFilter extends translationFilter
{
	public function __construct($contentElement)
	{
		$this->filterNullValue = '';
		$this->filterType      = 'sr_statuses_type';
		$this->filterField     = $contentElement->getFilter('sr_statuses_type');
		parent::__construct($contentElement);
	}

	public function _createFilter()
	{
		if (empty($this->filterField))
		{
			return '';
		}

		$filter = ' c.state IN (1,0)';

		if (is_numeric($this->filter_value))
		{
			$filter .= ' AND c.type = ' . (int) $this->filter_value;
		}

		return $filter;
	}

	public function _createfilterHTML()
	{
		if (empty($this->filterField))
		{
			return '';
		}

		$output             = array();
		$options            = array();
		$options[]          = JHtml::_('select.option', '0', JText::_('SR_TYPE_RESERVATION_STATUS'));
		$options[]          = JHtml::_('select.option', '1', JText::_('SR_TYPE_PAYMENT_STATUS'));
		$output['position'] = 'sidebar';
		$output['title']    = JText::_('SR_FILTER_TYPE_SELECT');
		$output['type']     = 'sr_statuses_type';
		$output['options']  = $options;
		$output['html']     = JHtml::_('select.genericlist', $options, 'sr_statuses_type_filter_value', 'class="inputbox" size="1" onchange="document.adminForm.submit();"', 'value', 'text', $this->filter_value);

		return $output;
	}


}