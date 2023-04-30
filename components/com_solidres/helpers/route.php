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
use Joomla\CMS\Factory;
use Joomla\CMS\Language\Multilanguage;
use Joomla\CMS\Menu\MenuItem;
use Joomla\CMS\Router\Route;
use Joomla\CMS\Uri\Uri;

/**
 * Content Component Route Helper
 *
 * @static
 * @package     Joomla.Site
 * @subpackage  com_content
 * @since       1.5
 */
abstract class SolidresHelperRoute
{
	protected static $lookup = [];

	protected static $lang_lookup = [];

	public static function getReservationAssetRoute($id, $roomTypeId = null, $language = 0, $data = [], $config = [])
	{
		$view = $config['view'] ?? 'reservationasset';
		$id   = (int) $id;

		if ($view === 'apartment')
		{
			$needles = [
				$view              => $config['roomTypeIds'] ?? [$id],
				'reservationasset' => [$id],
			];
		} else {
			$needles = [$view => [$id]];
		}

		$link = "index.php?option=com_solidres&view=$view&id=$id";

		if (!empty($data))
		{
			$link .= '&' . http_build_query($data);
		}

		if ($language && $language != "*" && Multilanguage::isEnabled())
		{
			self::buildLanguageLookup();

			if (isset(self::$lang_lookup[$language]))
			{
				$link                .= '&lang=' . self::$lang_lookup[$language];
				$needles['language'] = $language;
			}
		}

		if ($item = self::_findItem($needles, true))
		{
			$mView = $item->query['view'] ?? '';
			$link .= '&Itemid=' . $item->id;

			if ($view === $mView && $mView === 'apartment')
			{
				$link = str_replace('id=' . $id, 'id=' . $item->query['id'] ?? $id, $link);
			}
		}

		if (isset($roomTypeId) && $view == 'reservationasset')
		{
			$link .= '#srt_' . $roomTypeId;
		}

		return $link;
	}

	public static function getRoomTypeRoute($id, $language = 0)
	{
		$needles = array(
			'roomtype' => array((int) $id)
		);

		$link = 'index.php?option=com_solidres&view=roomtype&id=' . $id;

		if ($language && $language != "*" && JLanguageMultilang::isEnabled())
		{
			self::buildLanguageLookup();

			if (isset(self::$lang_lookup[$language]))
			{
				$link                .= '&lang=' . self::$lang_lookup[$language];
				$needles['language'] = $language;
			}
		}

		if ($item = self::_findItem($needles))
		{
			$link .= '&Itemid=' . $item;
		}

		return $link;
	}

	protected static function buildLanguageLookup()
	{
		if (count(self::$lang_lookup) == 0)
		{
			$db    = Factory::getDbo();
			$query = $db->getQuery(true)
				->select('a.sef AS sef')
				->select('a.lang_code AS lang_code')
				->from('#__languages AS a');

			$db->setQuery($query);
			$langs = $db->loadObjectList();

			foreach ($langs as $lang)
			{
				self::$lang_lookup[$lang->lang_code] = $lang->sef;
			}
		}
	}

	public static function findMenuItems($needles = [])
	{
		$component  = ComponentHelper::getComponent('com_solidres');
		$attributes = ['component_id'];
		$values     = [$component->id];

		if (isset($needles['language']) && $needles['language'] !== '*')
		{
			$attributes[] = 'language';
			$values[]     = [$needles['language'], '*'];
			unset($needles['language']);
		}

		foreach ($needles as $k => $v)
		{
			$attributes[] = $k;
			$values[]     = $v;
		}

		return Factory::getApplication()->getMenu('site')->getItems($attributes, $values);
	}

	protected static function _findItem($needles = [], $returnMenuObject = false)
	{
		$app      = Factory::getApplication();
		$menus    = $app->getMenu('site');
		$language = $needles['language'] ?? '*';

		// Prepare the reverse lookup array.
		if (!isset(self::$lookup[$language]))
		{
			self::$lookup[$language] = [];
			$items                   = static::findMenuItems(['language' => $language]);

			foreach ($items as $item)
			{
				if (isset($item->query) && isset($item->query['view']))
				{
					$view = $item->query['view'];

					if (!isset(self::$lookup[$language][$view]))
					{
						self::$lookup[$language][$view] = [];
					}

					if (isset($item->query['id']))
					{
						// here it will become a bit tricky
						// language != * can override existing entries
						// language == * cannot override existing entries
						if (!isset(self::$lookup[$language][$view][$item->query['id']]) || $item->language != '*')
						{
							self::$lookup[$language][$view][$item->query['id']] = $item;
						}
					}
					else
					{
						self::$lookup[$language][$view][0] = $item;
					}
				}
			}
		}

		if ($needles)
		{
			foreach ($needles as $view => $ids)
			{
				if (isset(self::$lookup[$language][$view]))
				{
					foreach ($ids as $id)
					{
						$menuLookup = self::$lookup[$language][$view][(int) $id] ?? null;

						if ($menuLookup)
						{
							return $returnMenuObject ? $menuLookup : $menuLookup->id;
						}
					}
				}
			}
		}
		// Check if the active menuitem matches the requested language
		$active = $menus->getActive();

		if ($active && $active->component == 'com_solidres' && ($language == '*' || in_array($active->language, ['*', $language]) || !Multilanguage::isEnabled()))
		{
			return $returnMenuObject ? $active : $active->id;
		}

		// If not found, return language specific home link
		$default = $menus->getDefault($language);

		return !empty($default->id) ? ($returnMenuObject ? $default : $default->id) : null;
	}

	public static function getPartnerRoute($partnerId = null, $language = '*', $layout = 'default')
	{
		if (null === $partnerId)
		{
			$partnerId = SRUtilities::getPartnerId();
		}

		$partnerId = (int) $partnerId;
		$needles   = ['partner' => [$partnerId, 0]];
		$link      = 'index.php?option=com_solidres&view=partner&id=' . $partnerId;

		if ($language
			&& $language !== '*'
			&& Multilanguage::isEnabled()
		)
		{
			self::buildLanguageLookup();

			if (isset(self::$lang_lookup[$language]))
			{
				$link                .= '&lang=' . self::$lang_lookup[$language];
				$needles['language'] = $language;
			}
		}

		if ('default' !== $layout)
		{
			$link .= '&layout=' . $layout;
		}

		if ($item = self::_findItem($needles))
		{
			$link .= '&Itemid=' . $item;
		}

		return $link;
	}

	public static function _(string $link)
	{
		$app     = Factory::getApplication();
		$uri     = new Uri($link);
		$needles = [];
		$view    = $uri->getVar('view');
		$id      = $uri->getVar('id');

		if (Multilanguage::isEnabled())
		{
			$language = $app->getLanguage()->getTag();
			self::buildLanguageLookup();

			if (isset(self::$lang_lookup[$language]))
			{
				$needles['language'] = $language;
				$uri->setVar('lang', $language);
			}
		}

		if ($view)
		{
			$needles[$view] = [];

			if ($id)
			{
				$needles[$view][] = (int) $id;
			}
		}

		if (($menu = static::_findItem($needles, true)) && (!$view || $menu->query['view'] === $view))
		{
			/** @var MenuItem $menu */
			foreach ($menu->query as $k => $v)
			{
				if ($uri->hasVar($k))
				{
					$uri->delVar($k);
				}
			}

			$uri->setVar('Itemid', $menu->id);
		}
		elseif ($menuId = $app->input->getUint('Itemid'))
		{
			$uri->setVar('Itemid', $menuId);
		}

		return Route::_(ltrim($uri->toString(['path', 'query']), '/'), false);
	}
}
