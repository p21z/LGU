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

use Joomla\CMS\Access\Exception\NotAllowed;
use Joomla\CMS\Captcha\Captcha;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\CMS\HTML\HTMLHelper;
use Joomla\CMS\Factory;
use Joomla\CMS\Language\Text;

/**
 * HTML View class for the Solidres component
 *
 * @package      Solidres
 * @since        0.1.0
 */
class SolidresViewReservationAsset extends JViewLegacy
{
	protected $item;
	protected $solidresCurrency;

	public function display($tpl = null)
	{
		$model                 = $this->getModel();
		$this->app             = Factory::getApplication();
		$this->systemConfig    = Factory::getConfig();
		$this->config          = JComponentHelper::getParams('com_solidres');
		$this->context         = 'com_solidres.reservation.process';
		$this->selectedTariffs = $this->app->getUserState($this->context . '.current_selected_tariffs');
		$this->isAmending      = $this->app->getUserState($this->context . '.is_amending', 0);
		$reservationId         = $this->app->getUserState($this->context . '.id', 0);
		$showPriceWithTax      = $this->config->get('show_price_with_tax', 0);
		$id                    = $this->app->input->getUInt('id', 0);
		$this->countryId       = $this->app->input->getUint('country_id', 0);
		$this->geoStateId      = $this->app->input->getUint('geo_state_id', 0);
		$this->checkin         = $this->app->input->get('checkin', '', 'string');
		$this->checkout        = $this->app->input->get('checkout', '', 'string');
		$itemId                = $this->app->input->getUInt('Itemid', 0);
		$roomsOccupancyOptions = $this->app->input->get('room_opt', array(), 'array');
		$roomTypeId            = $this->app->input->getUint('room_type_id', 0);

		if ($id > 0)
		{
			$model->setState('reservationasset.id', $id);
			$model->hit();
		}

		if (!empty($this->checkin) && !empty($this->checkout))
		{
			$timezone = new DateTimeZone($this->systemConfig->get('offset'));
			$this->checkin  = JDate::getInstance($this->checkin, $timezone)->format('Y-m-d', true);
			$this->checkout = JDate::getInstance($this->checkout, $timezone)->format('Y-m-d', true);

			$appliedCoupon = $this->app->getUserState($this->context . '.coupon');
			if (is_array($appliedCoupon))
			{
				$solidresCoupon  = SRFactory::get('solidres.coupon.coupon');
				$customerGroupId = SRUtilities::getCustomerGroupId();
				$currentDate     = Factory::getDate(date('Y-m-d'), $timezone)->toUnix();
				$checkInDate     = Factory::getDate($this->checkin, $timezone)->toUnix();
				$isValid         = $solidresCoupon->isValid($appliedCoupon['coupon_code'], $id, $currentDate, $checkInDate, $customerGroupId);

				if (!$isValid)
				{
					$this->app->setUserState($this->context . '.coupon', null);
				}
			}

			$this->app->setUserState($this->context . '.checkin', $this->checkin);
			$this->app->setUserState($this->context . '.checkout', $this->checkout);
			$this->app->setUserState($this->context . '.room_opt', $roomsOccupancyOptions);
			$this->app->setUserState($this->context . '.activeItemId', $itemId > 0 ? $itemId : null);

			// If user search for a specific room type
			if ($roomTypeId > 0 && !empty($this->checkin) && !empty($this->checkout))
			{
				$this->app->setUserState($this->context . '.prioritizing_room_type_id', $roomTypeId);
			}
			else
			{
				$this->app->setUserState($this->context . '.prioritizing_room_type_id', null);
			}

			$model->setState('checkin', $this->checkin);
			$model->setState('checkout', $this->checkout);
			$model->setState('country_id', $this->countryId);
			$model->setState('geo_state_id', $this->geoStateId);
			$model->setState('show_price_with_tax', $showPriceWithTax);
			$model->setState('tariffs', $this->selectedTariffs);
			$model->setState('room_opt', $roomsOccupancyOptions);
			$model->setState('reservation_id', $reservationId);
		}

		$this->item = $model->getItem();

		$this->app->setUserState($this->context . '.currency_id', $this->item->currency_id);
		$this->app->setUserState($this->context . '.deposit_required', $this->item->deposit_required);
		$this->app->setUserState($this->context . '.deposit_is_percentage', $this->item->deposit_is_percentage);
		$this->app->setUserState($this->context . '.deposit_amount', $this->item->deposit_amount);
		$this->app->setUserState($this->context . '.deposit_by_stay_length', $this->item->deposit_by_stay_length);
		$this->app->setUserState($this->context . '.deposit_include_extra_cost', $this->item->deposit_include_extra_cost);
		$this->app->setUserState($this->context . '.tax_id', $this->item->tax_id);
		$this->app->setUserState($this->context . '.booking_type', $this->item->booking_type);
		$this->app->setUserState($this->context . '.asset_params', $this->item->params);
		$this->app->setUserState($this->context . '.origin', Text::_('SR_RESERVATION_ORIGIN_DIRECT'));
		$this->app->setUserState($this->context . '.asset_category_id', $this->item->category_id);
		$this->app->setUserState($this->context . '.price_includes_tax', $this->item->price_includes_tax);

		Factory::getLanguage()->load('com_solidres_category_' . $this->item->category_id, JPATH_COMPONENT);

		if ($this->item->params['access-view'] == false || $this->item->state != 1)
		{
			throw new NotAllowed(Text::_('JERROR_ALERTNOAUTHOR'), 403);
		}

		$this->roomTypeObj             = SRFactory::get('solidres.roomtype.roomtype');
		$this->srReservation           = SRFactory::get('solidres.reservation.reservation');
		$this->solidresMedia           = SRFactory::get('solidres.media.media');
		$this->stayLength              = SRUtilities::calculateDateDiff($this->checkin, $this->checkout);
		$this->document                = Factory::getDocument();
		$this->coupon                  = $this->app->getUserState($this->context . '.coupon');
		$this->selectedRoomTypes       = $this->app->getUserState($this->context . '.room');
		$this->prioritizingRoomTypeId  = $this->app->getUserState($this->context . '.prioritizing_room_type_id', 0);
		$this->showTaxIncl             = $this->config->get('show_price_with_tax', 0);
		$this->minDaysBookInAdvance    = $this->config->get('min_days_book_in_advance', 0);
		$this->maxDaysBookInAdvance    = $this->config->get('max_days_book_in_advance', 0);
		$this->minLengthOfStay         = $this->config->get('min_length_of_stay', 1);
		$this->dateFormat              = $this->config->get('date_format', 'd-m-Y');
		$this->showLoginBox            = $this->config->get('show_login_box', 0);
		$this->enableAutoScroll        = $this->config->get('enable_auto_scroll', 1);
		$this->showFrontendTariffs     = $this->config->get('show_frontend_tariffs', '1');
		$this->defaultTariffVisibility = $this->config->get('default_tariff_visibility', '1');
		$datePickerMonthNum            = $this->config->get('datepicker_month_number', 3);
		$weekStartDay                  = $this->config->get('week_start_day', 1);
		$this->showPoweredByLink       = $this->config->get('show_solidres_copyright', '1');
		$this->solidresCurrency        = new SRCurrency(0, $this->item->currency_id);
		$this->tzoffset                = $this->systemConfig->get('offset');
		$this->timezone                = new DateTimeZone($this->tzoffset);
		$this->solidresStyle           = (defined('SR_LAYOUT_STYLE') && SR_LAYOUT_STYLE != '') ? SR_LAYOUT_STYLE : 'style1';
		$this->item->text              = $this->item->description;
		$this->isSingular              = false;

		if ($this->showFrontendTariffs == 2)
		{
			$this->defaultTariffVisibility = 1;
		}

		$activeMenu   = $this->app->getMenu()->getActive();

		$this->itemid = isset($activeMenu) ? $activeMenu->id : null;

		HTMLHelper::_('behavior.core');
		HTMLHelper::_('jquery.framework');
		HTMLHelper::_('bootstrap.framework');
		SRHtml::_('jquery.colorbox', 'show_map', '95%', '90%', 'true', 'false');
		SRHtml::_('jquery.popover');

		$jsOptions = ['version' => SRVersion::getHashVersion(), 'relative' => true];
		HTMLHelper::_('stylesheet', 'com_solidres/assets/main.min.css', $jsOptions);
		HTMLHelper::_('stylesheet', 'com_solidres/assets/' . $this->solidresStyle . '.min.css', $jsOptions);
		HTMLHelper::_('script', 'com_solidres/assets/datePicker/localization/jquery.ui.datepicker-' . Factory::getLanguage()->getTag() . '.js', $jsOptions);
		$this->document->addScriptDeclaration('
			Solidres.jQuery(function ($) {
				$(".sr-photo").colorbox({rel:"sr-photo", transition:"fade", width: "98%", height: "98%", className: "colorbox-w"});
				var minLengthOfStay = ' . $this->minLengthOfStay . ';
				var checkout_component = $(".checkout_component").datepicker({
					minDate : "+' . ($this->minDaysBookInAdvance + $this->minLengthOfStay) . '",
					numberOfMonths : ' . $datePickerMonthNum . ',
					showButtonPanel : true,
					dateFormat : "dd-mm-yy",
					firstDay: ' . $weekStartDay . '
				});
				var checkin_component = $(".checkin_component").datepicker({
					minDate : "+' . ($this->minDaysBookInAdvance) . 'd",
					' . ($this->maxDaysBookInAdvance > 0 ? 'maxDate: "+' . ($this->maxDaysBookInAdvance) . '",' : '') . '
					numberOfMonths : ' . $datePickerMonthNum . ',
					showButtonPanel : true,
					dateFormat : "dd-mm-yy",
					onSelect : function() {
						var checkoutMinDate = $(this).datepicker("getDate", "+1d");
						checkoutMinDate.setDate(checkoutMinDate.getDate() + minLengthOfStay);
						checkout_component.datepicker( "option", "minDate", checkoutMinDate );
						checkout_component.datepicker( "setDate", checkoutMinDate);
					},
					firstDay: ' . $weekStartDay . '
				});
				$(".ui-datepicker").addClass("notranslate");
			});

			Solidres.child_max_age_limit = ' . $this->config->get('child_max_age_limit', 17) . ';
		');

		$scrollOffset = $this->config->get('auto_scroll_offset', 0);

		if ($scrollOffset > 0)
		{
			$this->document->addStyleDeclaration('
				.tariff-box,#book-form {scroll-margin-top: ' . $scrollOffset . 'px;}
			');
		}

		if (!empty($this->checkin) && !empty($this->checkout))
		{
			$this->checkinFormatted  = JDate::getInstance($this->checkin, $this->timezone)->format($this->dateFormat, true);
			$this->checkoutFormatted = JDate::getInstance($this->checkout, $this->timezone)->format($this->dateFormat, true);
			$this->document->addScriptDeclaration('
				Solidres.jQuery(function ($) {
					isAtLeastOnRoomTypeSelected();
				});
			');

			$conditions                             = array();
			$conditions['min_days_book_in_advance'] = $this->minDaysBookInAdvance;
			$conditions['max_days_book_in_advance'] = $this->maxDaysBookInAdvance;
			$conditions['min_length_of_stay']       = $this->minLengthOfStay;
			$conditions['booking_type']             = $this->item->booking_type;

			try
			{
				$this->srReservation->isCheckInCheckOutValid($this->checkin, $this->checkout, $conditions);
			}
			catch (Exception $e)
			{
				switch ($e->getCode())
				{
					default:
					case 50001:
						$msg = Text::_($e->getMessage());
						break;
					case 50002:
						$msg = Text::sprintf($e->getMessage(), $conditions['min_length_of_stay']);
						break;
					case 50003:
						$msg = Text::sprintf($e->getMessage(), $conditions['min_days_book_in_advance']);
						break;
					case 50004:
						$msg = Text::sprintf($e->getMessage(), $conditions['max_days_book_in_advance']);
						break;
				}

				$this->checkin = $this->checkout = '';

				$this->app->enqueueMessage($msg, 'warning');

				$this->document->addScriptDeclaration('
					document.addEventListener("DOMContentLoaded", function() {
						document.getElementById("system-message-container").scrollIntoView();
					});
				');
			}

			if (count($this->item->roomTypes) == 1)
			{
				if (isset($this->item->roomTypes[0]->params['is_exclusive'])
					&&
					$this->item->roomTypes[0]->params['is_exclusive'] == 1
				)
				{
					$this->isSingular = true;
				}
			}
		}
		else
		{
			$this->app->setUserState($this->context . '.prioritizing_room_type_id', null);
			$this->prioritizingRoomTypeId = null;
		}

		Text::script('SR_CAN_NOT_REMOVE_COUPON');
		Text::script('SR_SELECT_AT_LEAST_ONE_ROOMTYPE');
		Text::script('SR_ERROR_CHILD_MAX_AGE');
		Text::script('SR_AND');
		Text::script('SR_TARIFF_BREAK_DOWN');
		Text::script('SUN');
		Text::script('MON');
		Text::script('TUE');
		Text::script('WED');
		Text::script('THU');
		Text::script('FRI');
		Text::script('SAT');
		Text::script('SR_NEXT');
		Text::script('SR_BACK');
		Text::script('SR_PROCESSING');
		Text::script('SR_CHILD');
		Text::script('SR_CHILD_AGE_SELECTION_JS');
		Text::script('SR_CHILD_AGE_SELECTION_1_JS');
		Text::script('SR_ONLY_1_LEFT');
		Text::script('SR_ONLY_2_LEFT');
		Text::script('SR_ONLY_3_LEFT');
		Text::script('SR_ONLY_4_LEFT');
		Text::script('SR_ONLY_5_LEFT');
		Text::script('SR_ONLY_6_LEFT');
		Text::script('SR_ONLY_7_LEFT');
		Text::script('SR_ONLY_8_LEFT');
		Text::script('SR_ONLY_9_LEFT');
		Text::script('SR_ONLY_10_LEFT');
		Text::script('SR_ONLY_11_LEFT');
		Text::script('SR_ONLY_12_LEFT');
		Text::script('SR_ONLY_13_LEFT');
		Text::script('SR_ONLY_14_LEFT');
		Text::script('SR_ONLY_15_LEFT');
		Text::script('SR_ONLY_16_LEFT');
		Text::script('SR_ONLY_17_LEFT');
		Text::script('SR_ONLY_18_LEFT');
		Text::script('SR_ONLY_19_LEFT');
		Text::script('SR_ONLY_20_LEFT');

		Text::script('SR_ONLY_1_LEFT_BED');
		Text::script('SR_ONLY_2_LEFT_BED');
		Text::script('SR_ONLY_3_LEFT_BED');
		Text::script('SR_ONLY_4_LEFT_BED');
		Text::script('SR_ONLY_5_LEFT_BED');
		Text::script('SR_ONLY_6_LEFT_BED');
		Text::script('SR_ONLY_7_LEFT_BED');
		Text::script('SR_ONLY_8_LEFT_BED');
		Text::script('SR_ONLY_9_LEFT_BED');
		Text::script('SR_ONLY_10_LEFT_BED');
		Text::script('SR_ONLY_11_LEFT_BED');
		Text::script('SR_ONLY_12_LEFT_BED');
		Text::script('SR_ONLY_13_LEFT_BED');
		Text::script('SR_ONLY_14_LEFT_BED');
		Text::script('SR_ONLY_15_LEFT_BED');
		Text::script('SR_ONLY_16_LEFT_BED');
		Text::script('SR_ONLY_17_LEFT_BED');
		Text::script('SR_ONLY_18_LEFT_BED');
		Text::script('SR_ONLY_19_LEFT_BED');
		Text::script('SR_ONLY_20_LEFT_BED');

		Text::script('SR_SHOW_MORE_INFO');
		Text::script('SR_HIDE_MORE_INFO');
		Text::script('SR_AVAILABILITY_CALENDAR_CLOSE');
		Text::script('SR_AVAILABILITY_CALENDAR_VIEW');
		Text::script('SR_PROCESSING');
		Text::script('SR_USERNAME_EXISTS');
		Text::script('SR_SHOW_TARIFFS');
		Text::script('SR_HIDE_TARIFFS');
		Text::script('SR_WARN_ONLY_LETTERS_N_SPACES_MSG');
		Text::script('SR_WARN_INVALID_EXPIRATION_MSG');

		JPluginHelper::importPlugin('solidres');
		JPluginHelper::importPlugin('content');
		$this->app->triggerEvent('onContentPrepare', array('com_solidres.asset', &$this->item, &$this->item->params, 0));
		$this->app->triggerEvent('onSolidresAssetViewLoad', array(&$this->item));
		$this->events                         = new stdClass;
		$this->events->afterDisplayAssetName  = join("\n", $this->app->triggerEvent('onSolidresAfterDisplayAssetName', array(&$this->item, &$this->item->params, $itemId)));
		$this->events->beforeDisplayAssetForm = join("\n", $this->app->triggerEvent('onSolidresBeforeDisplayAssetForm', array(&$this->item, &$this->item->params)));
		$this->events->afterDisplayAssetForm  = join("\n", $this->app->triggerEvent('onSolidresAfterDisplayAssetForm', array(&$this->item, &$this->item->params)));

		if ($errors = $this->get('Errors'))
		{
			throw new Exception(implode("\n", $errors), 500);
		}

		$this->defaultGallery = '';
		$defaultGallery       = $this->config->get('default_gallery', 'simple_gallery');
		if (SRPlugin::isEnabled($defaultGallery))
		{
			SRLayoutHelper::addIncludePath(SRPlugin::getLayoutPath($defaultGallery));
			$this->defaultGallery = SRLayoutHelper::render('gallery.default' . ((defined('SR_LAYOUT_STYLE') && SR_LAYOUT_STYLE != '') ? '_' . SR_LAYOUT_STYLE : ''), array('media' => $this->item->media, 'alt_attr' => $this->item->name));
		}

		if (SRPlugin::isEnabled('hub'))
		{
			SRLayoutHelper::addIncludePath(SRPlugin::getSitePath('hub') . '/layouts');
		}

		SRLayoutHelper::addIncludePath(JPATH_SITE . '/components/com_solidres/layouts');

		$this->_prepareDocument();

		if (SRPlugin::isEnabled('user'))
		{
			array_push($this->_path['template'], SRPlugin::getSitePath('user') . '/views/reservationasset/tmpl');
		}

		Factory::getLanguage()->load('com_solidres_category_' . $this->item->category_id, JPATH_COMPONENT);

		if (!empty($this->item->params['enable_captcha']))
		{
			$captcha = trim($this->item->params['enable_captcha']);

			if ('recaptcha_invisible' !== $captcha)
			{
				$captcha = 'recaptcha';
			}

			if (PluginHelper::isEnabled('captcha', $captcha))
			{
				Captcha::getInstance($captcha)->initialise('sr-reservation-recaptcha');
			}
		}

		$this->dayMapping       = SRUtilities::getDayMapping();
		$this->tariffNetOrGross = $this->showTaxIncl == 1 ? 'net' : 'gross';
		$this->isFresh          = empty($this->checkin) && empty($this->checkout);
		$this->showTariffs      = true;
		$assetShowTariffs       = $this->item->params['show_tariffs'] ?? 1;
		if (!$this->showFrontendTariffs || ($this->showFrontendTariffs == 2 && $this->isFresh))
		{
			$this->showTariffs = false;
		}

		$this->disableOnlineBooking = $this->item->params['disable_online_booking'] ?? false;
		if ($this->disableOnlineBooking)
		{
			if ($assetShowTariffs)
			{
				$this->showTariffs = true;
			}
			else
			{
				$this->showTariffs = false;
			}
		}

		Factory::getDocument()->addScriptOptions('com_solidres.property', [
			'requireUserLogin' => (bool) ($this->item->params['require_user_login'] ?? false),
		]);

		parent::display((defined('SR_LAYOUT_STYLE') && SR_LAYOUT_STYLE != '') ? SR_LAYOUT_STYLE : null);
	}

	/**
	 * Prepares the document like adding meta tags/site name per ReservationAsset
	 *
	 * @return void
	 */
	protected function _prepareDocument()
	{
		$uri = JUri::getInstance();
		$user = Factory::getUser();

		if ($this->item->metatitle)
		{
			$this->document->setTitle($this->item->metatitle);
		}
		elseif ($this->item->name)
		{
			$this->document->setTitle($this->item->name . ', ' . $this->item->city . ', ' . $this->item->country_name . ' | ' . $this->item->address_1);
		}

		if ($this->item->metadesc)
		{
			$this->document->setDescription($this->item->metadesc);
		}

		if ($this->item->metakey)
		{
			$this->document->setMetadata('keywords', $this->item->metakey);
		}

		if ($this->item->metadata)
		{
			foreach ($this->item->metadata as $k => $v)
			{
				if ($v)
				{
					$this->document->setMetadata($k, $v);
				}
			}
		}

		$canonicalLink = JRoute::_('index.php?option=com_solidres&view=reservationasset&id=' . $this->item->id);

		$this->document->addHeadLink(trim($uri->toString(array('host', 'scheme')) . $canonicalLink), 'canonical', 'rel');

		if (!isset($this->item->params['only_show_reservation_form']))
		{
			$this->item->params['only_show_reservation_form'] = 0;
		}

		$fbStars = '';
		for ($i = 1; $i <= $this->item->rating; $i++) :
			$fbStars .= '&#x2605;';
		endfor;

		$this->document->setMetaData('og:title', $fbStars . ' ' . $this->item->name . ', ' . $this->item->city . ', ' . $this->item->country_name, 'property');
		$this->document->setMetaData('og:type', 'place', 'property');
		$this->document->setMetaData('og:url', JRoute::_('index.php?option=com_solidres&view=reservationasset&id=' . $this->item->id, true, JRoute::TLS_IGNORE, true), 'property');

		if (isset($this->item->media[0]))
		{
			$this->document->setMetaData('og:image', SRURI_MEDIA . '/assets/images/system/thumbnails/1/' . $this->item->media[0]->value, 'property');
		}

		$this->document->setMetaData('og:site_name', $this->app->get('sitename'), 'property');
		$this->document->setMetaData('og:description', HTMLHelper::_('string.truncate', $this->item->description, 200, true, false), 'property');
		$this->document->setMetaData('place:location:latitude', $this->item->lat, 'property');
		$this->document->setMetaData('place:location:longitude', $this->item->lng, 'property');

		SRHtml::sessionExpireWarning();

		if ($user->guest)
		{
			SRHtml::modalLoginForm();
		}
	}
}