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
use Joomla\CMS\Language\Text;
use Joomla\CMS\Uri\Uri;
use Joomla\CMS\Factory;
use Joomla\CMS\Session\Session;

?>


<h3>
    <?php echo Text::_('SR_CUSTOMER_INFO') ?>
    <?php if ($this->canEdit): ?>
        <?php if (SRPlugin::isEnabled('user') && $this->form->getValue('customer_id')): ?>
            <a class="hasTooltip link-ico"
               href="<?php echo Route::_('index.php?option=com_solidres&task=customer.edit&id=' . $this->form->getValue('customer_id'), false); ?>"
               title="<?php echo Text::_('SR_VIEW_PROFILE', true); ?>" target="_blank">
                <i class="fa fa-address-card" aria-hidden="true"></i>
            </a>
        <?php endif; ?>

        <?php if ($this->form->getValue('customer_id') > 0 || !empty($customerName)): ?>
            <?php
            $customerName = trim($this->form->getValue('customer_firstname') . ' ' . $this->form->getValue('customer_middlename') . ' ' . $this->form->getValue('customer_lastname'));
            $filterCustomer = 'customer=' . ($this->form->getValue('customer_id') ? $this->form->getValue('customer_id') : urlencode($customerName)); ?>

            <a class="hasTooltip link-ico"
               href="<?php echo Route::_('index.php?option=com_solidres&view=reservations&' . $filterCustomer, false); ?>"
               title="<?php echo Text::_('SR_VIEW_OTHER_RESERVATIONS', true); ?>"
               target="_blank">
                <i class="fa fa-search-plus" aria-hidden="true"></i>
            </a>
        <?php endif; ?>
    <?php endif; ?>
</h3>
<?php


$fields        = [];

if ($this->fieldEnabled)
{
    $app        = Factory::getApplication();
    $scope      = $app->scope;
    $app->scope = 'com_solidres.manage';
    $fields     = SRCustomFieldHelper::findFields(['context' => 'com_solidres.customer'], [$this->cid], $this->form->getValue('customer_language') ?: null);
    $app->scope = $scope;
}

if (count($fields)):
    $fieldsValues = SRCustomFieldHelper::getValues(['context' => 'com_solidres.customer.' . $this->reservationId]);
    SRCustomFieldHelper::setFieldDataValues($fieldsValues);
    $customFieldLength = count($fields);
    $partialNumber     = ceil($customFieldLength / 2);
    $rootUrl           = Uri::root(true);
    $token             = Session::getFormToken();
    $renderValue       = function ($field) use ($rootUrl, $token) {
        $value = SRCustomFieldHelper::displayFieldValue($field->field_name);

        if ($field->type == 'file')
        {
            $file     = base64_encode($value);
            $fileName = basename($value);

            if (strpos($fileName, '_') !== false)
            {
                $parts    = explode('_', $fileName, 2);
                $fileName = $parts[1];
            }

            $value = '<a href="' . Route::_('index.php?option=com_solidres&task=customfield.downloadFile&file=' . $file . '&' . $token . '=1', false) . '" style="max-width: 180px" target="_blank">' . $fileName . '</a>';
        }

        return $value;
    };

    ?>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_6 ?>">
            <ul class="reservation-details">
                <?php for ($i = 0; $i <= $partialNumber; $i++): ?>
                    <li>
                        <label><?php echo Text::_($fields[$i]->title); ?></label>
                        <?php echo $renderValue($fields[$i]); ?>
                    </li>
                <?php endfor; ?>
            </ul>
        </div>
        <div class="<?php echo SR_UI_GRID_COL_6 ?>">
            <ul class="reservation-details">
                <?php for ($i = $partialNumber + 1; $i < $customFieldLength; $i++): ?>
                    <li>
                        <label><?php echo Text::_($fields[$i]->title); ?></label>
                        <?php echo $renderValue($fields[$i]); ?>
                    </li>
                <?php endfor; ?>
            </ul>
        </div>
    </div>
<?php else: ?>
    <div class="<?php echo SR_UI_GRID_CONTAINER ?>">
        <div class="<?php echo SR_UI_GRID_COL_6 ?>">
            <ul class="reservation-details">
                <li>
                    <label><?php echo Text::_("SR_CUSTOMER_TITLE") ?></label> <?php echo $this->form->getValue('customer_title') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_FIRSTNAME") ?></label> <?php echo $this->form->getValue('customer_firstname') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_MIDDLENAME") ?></label> <?php echo $this->form->getValue('customer_middlename') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_LASTNAME") ?></label> <?php echo $this->form->getValue('customer_lastname') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_EMAIL") ?></label>

                    <?php if ($mail = $this->form->getValue('customer_email')): ?>
                        <a href="mailto:<?php echo $mail ?>">
                            <?php echo $mail ?>
                        </a>
                    <?php endif; ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_PHONE") ?></label>
                    <?php if ($phone = $this->form->getValue('customer_phonenumber')): ?>
                        <a href="tel:<?php echo $phone ?>">
                            <?php echo $phone ?>
                        </a>
                    <?php endif; ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_MOBILEPHONE") ?></label>
                    <?php if ($phone = $this->form->getValue('customer_mobilephone')): ?>
                        <a href="tel:<?php echo $phone ?>">
                            <?php echo $phone ?>
                        </a>
                    <?php endif; ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_COMPANY") ?></label> <?php echo $this->form->getValue('customer_company') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_CUSTOMER_IP") ?></label> <?php echo $this->form->getValue('customer_ip', '') ?>
                </li>
            </ul>
        </div>
        <div class="<?php echo SR_UI_GRID_COL_6 ?>">
            <ul class="reservation-details">
                <li>
                    <label><?php echo Text::_("SR_CUSTOMER_ADDRESS1") ?></label> <?php echo $this->form->getValue('customer_address1') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_CUSTOMER_ADDRESS2") ?></label> <?php echo $this->form->getValue('customer_address2') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_CUSTOMER_CITY") ?></label> <?php echo $this->form->getValue('customer_city') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_CUSTOMER_ZIPCODE") ?></label> <?php echo $this->form->getValue('customer_zipcode') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_FIELD_COUNTRY_LABEL") ?></label> <?php echo $this->form->getValue('customer_country_name') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_FIELD_GEO_STATE_LABEL") ?></label> <?php echo $this->form->getValue('customer_geostate_name') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_VAT_NUMBER") ?></label> <?php echo $this->form->getValue('customer_vat_number') ?>
                </li>
                <li>
                    <label><?php echo Text::_("SR_NOTES") ?></label><?php echo $this->form->getValue('note') ?>
                </li>
            </ul>
        </div>
    </div>
<?php endif; ?>
