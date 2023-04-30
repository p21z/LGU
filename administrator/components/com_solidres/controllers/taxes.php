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
 * Tax list controller class.
 *
 * @package       Solidres
 * @subpackage    Tax
 * @since         0.1.0
 */
class SolidresControllerTaxes extends JControllerAdmin
{
	public function getModel($name = 'Tax', $prefix = 'SolidresModel', $config = array('ignore_request' => true))
	{
		return parent::getModel($name, $prefix, $config);
	}

	public function find()
	{
		if ($this->input->get('scope'))
		{
			$this->findByExperience();
		}
		else
		{
			$assetId   = $this->input->get('id', 0, 'int');
			$countryId = $this->input->get('country_id', 0, 'int');
			$taxes     = SolidresHelper::getTaxOptions($assetId, $countryId);
			$html      = '';

			foreach ($taxes as $tax)
			{
				$html .= '<option value="' . $tax->value . '">' . $tax->text . '</option>';
			}

			echo $html;
		}

		$this->app->close();
	}

	protected function findByExperience()
	{
		try
		{
			JTable::addIncludePath(SRPlugin::getAdminPath('experience') . '/tables');
			$table = JTable::getInstance('Experience', 'SolidresTable');
			$expId = (int) $this->input->getUint('experienceId', 0);
			$taxId = (int) $this->input->getUint('taxId', 0);

			if ($expId < 1 || !$table->load($expId))
			{
				throw new RuntimeException(JText::_('SR_ERROR_TOUR_NOT_FOUND'));
			}

			$taxes    = SolidresHelper::getTaxOptions(0, (int) $table->country_id);
			$response = '';

			foreach ($taxes as $tax)
			{
				$selected = $taxId > 0 && $taxId == $tax->value ? ' selected="selected"' : '';
				$response .= '<option value="' . $tax->value . '"' . $selected . '>' . $tax->text . '</option>';
			}
		}
		catch (RuntimeException $e)
		{
			$response = $e;
		}

		echo new JResponseJson($response);

	}
}