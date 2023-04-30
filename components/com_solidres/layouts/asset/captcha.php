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

/*
 * This layout file can be overridden by copying to:
 *
 * /templates/TEMPLATENAME/html/layouts/com_solidres/asset/captcha.php
 *
 * However, occasionally we will need to update template/layout related files and it is the template developers'
 * responsibility to update the overridden files (if any) to maintain full compatibility with Solidres.
 *
 * We do not provide support if any of the overridden files are out of date and are not compatible with Solidres.
 *
 * @version 2.8.0
 */

defined('_JEXEC') or die;

use Joomla\CMS\Captcha\Captcha;
use Joomla\Registry\Registry;

/**
 * @var array    $displayData
 * @var Captcha  $captcha
 * @var string   $name
 * @var Registry $params
 * @var boolean  $isApartment
 */

extract($displayData);

echo str_replace(
	['data-callback', 'data-expired-callback', 'data-error-callback'],
	['data-callback="enableBtnBook"', 'data-expired-callback="disableBtnBook"', 'data-error-callback="disableBtnBook"'],
	$captcha->display('sr-captcha', 'sr-reservation-recaptcha')
);

?>
<script>

    function enableBtnBook() {
        document.getElementById('termsandconditions')?.removeAttribute('disabled');
    }

    function disableBtnBook() {
        document.getElementById('termsandconditions')?.setAttribute('disabled', '');
    }

    function initCaptcha() {
        document.getElementById('termsandconditions')?.setAttribute('disabled', '');
        const container = document.getElementById('sr-reservation-recaptcha');

        if (container && !container.hasAttribute('data-recaptcha-widget-id') && window.grecaptcha && window.grecaptcha.render) {
            container.setAttribute('data-recaptcha-widget-id', window.grecaptcha.render(container, container.dataset));
        }
    };

    initCaptcha();
    window.addEventListener('load', initCaptcha);
    
</script>
