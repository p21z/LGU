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

use Joomla\CMS\Component\Router\RouterBase;
use Joomla\CMS\Factory;
use Joomla\CMS\Filter\OutputFilter;
use Joomla\CMS\Plugin\PluginHelper;
use Joomla\Registry\Registry;

class solidresRouter extends RouterBase
{
	protected $hub;

	public function __construct($app = null, $menu = null)
	{
		parent::__construct($app, $menu);

		if ($this->hub = PluginHelper::isEnabled('solidres', 'hub'))
		{
			PluginHelper::importPlugin('solidres', 'hub');
		}
	}

	public function build(&$query)
	{
		$segments = [];
		$menus    = Factory::getApplication()->getMenu();
		$db       = Factory::getDbo();
		$sql      = $db->getQuery(true);
		$hubQuery = $query;

		if (isset($query['Itemid']))
		{
			$menuItem = $menus->getItem($query['Itemid']);
		}
		else
		{
			$menuItem = $menus->getActive();
		}

		if ($menuItem
			&& $menuItem->query['option'] != 'com_solidres'
			&& isset($query['Itemid'])
		)
		{
			$menuItem = null;
			unset($query['Itemid']);
		}

		$view = isset($query['view']) ? strtolower($query['view']) : null;
		$slug = isset($query['id']) ? (int) $query['id'] : null;

		if (!$view && isset($query['task']) && strpos($query['task'], '.') !== false)
		{
			$task = explode('.', $query['task'], 2);

			if ($task[0] == 'reservationasset')
			{
				$view = $task[0];
			}
		}

		if ($menuItem)
		{
			if (isset($menuItem->query['view']) && $menuItem->query['view'] == $view)
			{
				unset($query['view']);
			}

			if (isset($menuItem->query['id']) && $menuItem->query['id'] == $slug)
			{
				unset($query['id']);

				return $segments;
			}
		}

		if ($slug && in_array($view, ['partner', 'reservationasset', 'apartment', 'subscriptionform', 'experience']))
		{
			static $slugs = [];
			$slugKey = $view . ':' . $slug;

			switch ($view)
			{
				case 'reservationasset':
				case 'apartment':

					if (!isset($slugs[$slugKey]))
					{
						$sql->select('a.id, a.alias')
							->from($db->quoteName('#__sr_reservation_assets', 'a'))
							->where('a.id = ' . (int) $query['id']);
						$db->setQuery($sql);

						if ($row = $db->loadObject())
						{
							$slugs[$slugKey] = $row->alias . ':' . $row->id;
						}
					}

					unset($query['view']);

					break;

				case 'subscriptionform':

					if (!isset($slugs[$slugKey]))
					{
						$sql->select('a.id, a.title')
							->from($db->quoteName('#__sr_subscription_levels', 'a'))
							->where('a.id = ' . (int) $query['id']);
						$db->setQuery($sql);
						$row             = $db->loadObject();
						$slugs[$slugKey] = OutputFilter::stringURLSafe($row->title) . ':' . $row->id;
					}

					break;

				case 'experience':

					if (!isset($slugs[$slugKey]))
					{
						$sql->select('a.id, a.alias')
							->from($db->quoteName('#__sr_experiences', 'a'))
							->where('a.id = ' . (int) $query['id']);
						$db->setQuery($sql);

						if ($row = $db->loadObject())
						{
							$slugs[$slugKey] = $row->alias . ':' . $row->id;
							unset($query['view']);
						}
					}

					break;

				case 'partner':

					if (!isset($slugs[$slugKey]))
					{
						$sql->select('u.username')
							->from($db->quoteName('#__users', 'u'))
							->join('INNER', $db->quoteName('#__sr_customers', 'a') . ' ON a.user_id = u.id AND u.block = 0')
							->where('a.id = ' . (int) $query['id']);
						$db->setQuery($sql);

						if ($userName = $db->loadResult())
						{
							$slugs[$slugKey] = $userName;
						}
					}

					break;
			}

			if (isset($slugs[$slugKey]))
			{
				$slug = $slugs[$slugKey];
			}

			if (isset($query['view']))
			{
				$segments[] = $view;

				unset($query['view']);
			}

			$segments[] = $slug;

			unset($query['id']);
		}

		if ($view == 'experiences' && isset($query['category_id']))
		{
			$sql->clear()
				->select('a.alias')
				->from($db->quoteName('#__sr_experience_categories', 'a'))
				->where('a.id = ' . (int) $query['category_id']);
			$db->setQuery($sql);

			if ($alias = $db->loadResult())
			{
				$segments[] = 'category:' . $alias;
				unset($query['category_id']);
			}
		}

		if ($this->hub)
		{
			Factory::getApplication()->triggerEvent('onSolidresBuildRoute', array($hubQuery, &$segments));
		}

		$total = count($segments);

		for ($i = 0; $i < $total; $i++)
		{
			$segments[$i] = str_replace(':', '-', $segments[$i]);
		}

		return $segments;
	}

	public function parse(&$segments)
	{
		$vars  = [];
		$count = count($segments);
		$menu  = Factory::getApplication()->getMenu()->getActive();
		$db    = Factory::getDbo();

		if ($menu
			&& $count
			&& @$menu->query['option'] === 'com_solidres'
		)
		{
			$view = $menu->query['view'] ?? '';

			if ($view === 'partner')
			{
				$query = $db->getQuery(true)
					->select('a.id')
					->from($db->quoteName('#__sr_customers', 'a'))
					->join('INNER', $db->quoteName('#__users', 'u') . ' ON u.id = a.user_id AND u.block = 0')
					->where('u.username = ' . $db->quote($segments[0]));

				if ($partnerId = $db->setQuery($query)->loadResult())
				{
					$vars['view'] = 'partner';
					$vars['id']   = $partnerId;
					$segments     = [];

					return $vars;
				}
			}
			elseif ($view === 'experiences')
			{
				$query = $db->getQuery(true)
					->select('a.id')
					->from($db->quoteName('#__sr_experiences', 'a'))
					->where('CONCAT(a.alias, ' . $db->quote('-') . ', a.id) = ' . $db->quote($segments[0]));

				if ($expId = $db->setQuery($query)->loadResult())
				{
					$vars['view'] = 'experience';
					$vars['id']   = $expId;
					$segments     = [];

					return $vars;
				}
			}
		}

		for ($i = 0; $i < $count; $i++)
		{
			$segments[$i] = str_replace('-', ':', $segments[$i]);
		}

		if ($count > 0)
		{
			if (strpos($segments[0], ':') !== false)
			{
				$array = explode(':', $segments[0]);
				$id    = (int) $array[count($array) - 1];
				array_pop($array);
				$alias = implode('-', $array);
				$query = $db->getQuery(true)
					->select('a.id, a.alias, a.params')
					->from($db->quoteName('#__sr_reservation_assets', 'a'))
					->where('a.id = ' . $id);
				$db->setQuery($query);
				$asset = $db->loadObject();

				if ($asset && $asset->alias == $alias)
				{
					$registry = new Registry;
					$registry->loadString((string) $asset->params);

					if ($registry->get('is_apartment'))
					{
						$query->clear()
							->select('a.id')
							->from($db->quoteName('#__sr_room_types', 'a'))
							->where('a.state = 1 AND a.reservation_asset_id = ' . $id);
						$vars['view'] = 'apartment';
						$vars['id']   = $db->setQuery($query)->loadResult();
					}
					else
					{
						$vars['view'] = 'reservationasset';
						$vars['id']   = $id;
					}
				}
			}

			if (preg_match('/^(category\:)/', $segments[0]))
			{
				$db    = Factory::getDbo();
				$query = $db->getQuery(true)
					->select('a.id')
					->from($db->quoteName('#__sr_experience_categories', 'a'))
					->where('a.alias = ' . $db->quote(str_replace(array('category:', ':'), array('', '-'), $segments[0])));
				$db->setQuery($query);
				$vars['view']        = 'experiences';
				$vars['category_id'] = (int) $db->loadResult();
			}
			elseif (isset($segments[1]))
			{
				$vars['view'] = $segments[0];
				preg_match('/([0-9]+)$/', $segments[1], $matches);

				if (!empty($matches[0]))
				{
					$vars['id'] = (int) $matches[1];
				}
				else
				{
					$vars['id'] = (int) $segments[1];
				}
			}
		}

		if ($this->hub)
		{
			Factory::getApplication()->triggerEvent('onSolidresParseRoute', array(&$vars, $segments));
		}

		$segments = [];

		return $vars;
	}
}

function solidresBuildRoute(&$query)
{
	$router = new SolidresRouter;

	return $router->build($query);
}


function solidresParseRoute($segments)
{
	$router = new SolidresRouter;

	return $router->parse($segments);
}
