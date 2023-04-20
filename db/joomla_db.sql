-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 20, 2023 at 09:48 AM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `joomla_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_action_logs`
--

CREATE TABLE `hde5p_action_logs` (
  `id` int(10) UNSIGNED NOT NULL,
  `message_language_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `log_date` datetime NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `user_id` int(11) NOT NULL DEFAULT 0,
  `item_id` int(11) NOT NULL DEFAULT 0,
  `ip_address` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0.0.0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_action_logs`
--

INSERT INTO `hde5p_action_logs` (`id`, `message_language_key`, `message`, `log_date`, `extension`, `user_id`, `item_id`, `ip_address`) VALUES
(1, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-11 02:14:40', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(2, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-11 03:04:07', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(3, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-11 03:36:49', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(4, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":230,\"name\":\"System - Helix Ultimate Framework\",\"extension_name\":\"System - Helix Ultimate Framework\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 03:42:50', 'com_installer', 101, 230, 'COM_ACTIONLOGS_DISABLED'),
(5, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_TEMPLATE\",\"id\":231,\"name\":\"et_journey\",\"extension_name\":\"et_journey\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 03:42:50', 'com_installer', 101, 231, 'COM_ACTIONLOGS_DISABLED'),
(6, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":229,\"name\":\"ET Journey\",\"extension_name\":\"ET Journey\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 03:42:50', 'com_installer', 101, 229, 'COM_ACTIONLOGS_DISABLED'),
(7, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-11 04:15:48', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(8, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":230,\"name\":\"System - Helix Ultimate Framework\",\"extension_name\":\"System - Helix Ultimate Framework\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 04:16:21', 'com_installer', 101, 230, 'COM_ACTIONLOGS_DISABLED'),
(9, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_TEMPLATE\",\"id\":233,\"name\":\"wt_mambo_free\",\"extension_name\":\"wt_mambo_free\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 04:16:21', 'com_installer', 101, 233, 'COM_ACTIONLOGS_DISABLED'),
(10, 'PLG_ACTIONLOG_JOOMLA_PLUGIN_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_PLUGIN\",\"id\":232,\"name\":\"Helix Ultimate based template installer\",\"extension_name\":\"Helix Ultimate based template installer\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 04:16:21', 'com_installer', 101, 232, 'COM_ACTIONLOGS_DISABLED'),
(11, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-11 05:04:14', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(12, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_CATEGORY\",\"id\":8,\"title\":\"Lorem Ipsum\",\"itemlink\":\"index.php?option=com_categories&task=category.edit&id=8\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 05:17:37', 'com_categories.category', 101, 8, 'COM_ACTIONLOGS_DISABLED'),
(13, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__categories\"}', '2023-04-11 05:18:10', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(14, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__categories\"}', '2023-04-11 05:19:03', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(15, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED', '{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_CATEGORY\",\"id\":8,\"title\":\"Lorem Ipsum\",\"itemlink\":\"index.php?option=com_categories&task=category.edit&id=8\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 05:19:03', 'com_categories.category', 101, 8, 'COM_ACTIONLOGS_DISABLED'),
(16, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":1,\"title\":\"Lorem Ipsum\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 05:19:41', 'com_content.article', 101, 1, 'COM_ACTIONLOGS_DISABLED'),
(17, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"1\",\"title\":\"Lorem Ipsum\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 05:22:22', 'com_content.article', 101, 1, 'COM_ACTIONLOGS_DISABLED'),
(18, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-11 05:22:22', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(19, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"1\",\"title\":\"Lorem Ipsum\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=1\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 05:25:17', 'com_content.article', 101, 1, 'COM_ACTIONLOGS_DISABLED'),
(20, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-11 05:25:17', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(21, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 05:27:15', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(22, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":19,\"title\":\"com_content\",\"extension_name\":\"com_content\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=19\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 05:27:40', 'com_config.component', 101, 19, 'COM_ACTIONLOGS_DISABLED'),
(23, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-11 13:17:26', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(24, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":2,\"title\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=2\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 13:30:05', 'com_content.article', 101, 2, 'COM_ACTIONLOGS_DISABLED'),
(25, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":3,\"title\":\"Article 1\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 13:30:49', 'com_content.article', 101, 3, 'COM_ACTIONLOGS_DISABLED'),
(26, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":4,\"title\":\"Article 2\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 13:52:14', 'com_content.article', 101, 4, 'COM_ACTIONLOGS_DISABLED'),
(27, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":5,\"title\":\"Article 3\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=5\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 13:52:34', 'com_content.article', 101, 5, 'COM_ACTIONLOGS_DISABLED'),
(28, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":19,\"title\":\"com_content\",\"extension_name\":\"com_content\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=19\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:02:29', 'com_config.component', 101, 19, 'COM_ACTIONLOGS_DISABLED'),
(29, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":19,\"title\":\"com_content\",\"extension_name\":\"com_content\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=19\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:02:41', 'com_config.component', 101, 19, 'COM_ACTIONLOGS_DISABLED'),
(30, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":19,\"title\":\"com_content\",\"extension_name\":\"com_content\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=19\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:03:10', 'com_config.component', 101, 19, 'COM_ACTIONLOGS_DISABLED'),
(31, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":102,\"title\":\"Announcement\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=102\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:06:40', 'com_menus.item', 101, 102, 'COM_ACTIONLOGS_DISABLED'),
(32, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":103,\"title\":\"Crab Hotel Booking\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=103\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:07:44', 'com_menus.item', 101, 103, 'COM_ACTIONLOGS_DISABLED'),
(33, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"Business Registration\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:08:23', 'com_menus.item', 101, 104, 'COM_ACTIONLOGS_DISABLED'),
(34, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:09:03', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(35, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 14:09:03', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(36, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 14:11:09', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(37, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED', '{\"action\":\"unpublish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"Business Registration\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:11:09', 'com_menus.item', 101, 104, 'COM_ACTIONLOGS_DISABLED'),
(38, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 14:11:12', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(39, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED', '{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"Business Registration\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:11:12', 'com_menus.item', 101, 104, 'COM_ACTIONLOGS_DISABLED'),
(40, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"Business Registration\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:14:23', 'com_menus.item', 101, 104, 'COM_ACTIONLOGS_DISABLED'),
(41, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 14:14:23', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(42, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"Business Registration\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:14:40', 'com_menus.item', 101, 104, 'COM_ACTIONLOGS_DISABLED'),
(43, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"Business Registration\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:14:53', 'com_menus.item', 101, 104, 'COM_ACTIONLOGS_DISABLED'),
(44, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":104,\"title\":\"Business Registration\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=104\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:15:07', 'com_menus.item', 101, 104, 'COM_ACTIONLOGS_DISABLED'),
(45, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":105,\"title\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=105\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:21:39', 'com_menus.item', 101, 105, 'COM_ACTIONLOGS_DISABLED'),
(46, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 14:22:11', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(47, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 14:22:23', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(48, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 14:46:37', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(49, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":106,\"title\":\"Mega\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=106\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:48:27', 'com_menus.item', 101, 106, 'COM_ACTIONLOGS_DISABLED'),
(50, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":106,\"title\":\"Mega\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=106\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:50:13', 'com_menus.item', 101, 106, 'COM_ACTIONLOGS_DISABLED'),
(51, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-11 14:53:45', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(52, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_TRASHED', '{\"action\":\"trash\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":106,\"title\":\"Mega\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=106\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 14:53:45', 'com_menus.item', 101, 106, 'COM_ACTIONLOGS_DISABLED'),
(53, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":107,\"title\":\"Article 1\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=107\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 15:07:34', 'com_menus.item', 101, 107, 'COM_ACTIONLOGS_DISABLED'),
(54, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":108,\"title\":\"Article 2\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=108\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 15:08:43', 'com_menus.item', 101, 108, 'COM_ACTIONLOGS_DISABLED'),
(55, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":109,\"title\":\"Article 3\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=109\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-11 15:09:55', 'com_menus.item', 101, 109, 'COM_ACTIONLOGS_DISABLED'),
(56, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-12 04:39:25', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(57, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":235,\"name\":\"SP Simple Portfolio Module\",\"extension_name\":\"SP Simple Portfolio Module\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-12 04:49:56', 'com_installer', 101, 235, 'COM_ACTIONLOGS_DISABLED'),
(58, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":234,\"name\":\"SP Simple Portfolio\",\"extension_name\":\"SP Simple Portfolio\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-12 04:49:56', 'com_installer', 101, 234, 'COM_ACTIONLOGS_DISABLED'),
(59, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-12 12:47:25', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(60, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-12 15:19:50', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(61, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_CATEGORY\",\"id\":9,\"title\":\"Destinations\",\"itemlink\":\"index.php?option=com_categories&task=category.edit&id=9\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-12 15:21:23', 'com_categories.category', 101, 9, 'COM_ACTIONLOGS_DISABLED'),
(62, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"Destinations\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-12 15:25:21', 'com_menus.item', 101, 114, 'COM_ACTIONLOGS_DISABLED'),
(63, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-14 05:52:55', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(64, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-14 06:04:45', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(65, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MEDIA\",\"id\":0,\"title\":\"110309933_619908805306221_8272395943995636534_n.jpg\",\"itemlink\":\"index.php?option=com_media&path=local-images:\\/\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-14 06:07:39', 'com_media.file', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(66, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__spsimpleportfolio_items\"}', '2023-04-14 06:09:21', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(67, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__spsimpleportfolio_items\"}', '2023-04-14 06:10:21', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(68, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__spsimpleportfolio_items\"}', '2023-04-14 06:10:24', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(69, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__spsimpleportfolio_items\"}', '2023-04-14 06:10:50', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(70, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__spsimpleportfolio_items\"}', '2023-04-14 06:11:09', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(71, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__spsimpleportfolio_items\"}', '2023-04-14 06:11:43', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(72, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-18 12:46:47', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(73, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":234,\"title\":\"SP Simple Portfolio\",\"extension_name\":\"SP Simple Portfolio\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=234\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-18 13:01:45', 'com_config.component', 101, 234, 'COM_ACTIONLOGS_DISABLED'),
(74, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":234,\"title\":\"SP Simple Portfolio\",\"extension_name\":\"SP Simple Portfolio\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=234\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-18 13:01:53', 'com_config.component', 101, 234, 'COM_ACTIONLOGS_DISABLED'),
(75, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":234,\"title\":\"SP Simple Portfolio\",\"extension_name\":\"SP Simple Portfolio\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=234\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-18 13:02:37', 'com_config.component', 101, 234, 'COM_ACTIONLOGS_DISABLED'),
(76, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":234,\"title\":\"SP Simple Portfolio\",\"extension_name\":\"SP Simple Portfolio\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=234\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-18 13:03:57', 'com_config.component', 101, 234, 'COM_ACTIONLOGS_DISABLED'),
(77, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"Destinations\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-18 13:09:04', 'com_menus.item', 101, 114, 'COM_ACTIONLOGS_DISABLED'),
(78, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-18 13:09:04', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(79, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"Destinations\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-18 13:09:48', 'com_menus.item', 101, 114, 'COM_ACTIONLOGS_DISABLED'),
(80, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":237,\"name\":\"SP Easy Image Gallery Module\",\"extension_name\":\"SP Easy Image Gallery Module\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-18 13:15:44', 'com_installer', 101, 237, 'COM_ACTIONLOGS_DISABLED'),
(81, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":236,\"name\":\"COM_SPEASYIMAGEGALLERY\",\"extension_name\":\"COM_SPEASYIMAGEGALLERY\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-18 13:15:44', 'com_installer', 101, 236, 'COM_ACTIONLOGS_DISABLED'),
(82, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-18 13:33:04', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(83, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-20 02:22:27', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(84, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":102,\"title\":\"Announcement\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=102\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:23:29', 'com_menus.item', 101, 102, 'COM_ACTIONLOGS_DISABLED'),
(85, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 02:23:29', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(86, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_CATEGORY\",\"id\":10,\"title\":\"Announcement\",\"itemlink\":\"index.php?option=com_categories&task=category.edit&id=10\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:30:06', 'com_categories.category', 101, 10, 'COM_ACTIONLOGS_DISABLED'),
(87, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_CATEGORY\",\"id\":\"10\",\"title\":\"Announcement\",\"itemlink\":\"index.php?option=com_categories&task=category.edit&id=10\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:30:18', 'com_categories.category', 101, 10, 'COM_ACTIONLOGS_DISABLED'),
(88, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__categories\"}', '2023-04-20 02:30:18', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(89, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_CATEGORY\",\"id\":11,\"title\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_categories&task=category.edit&id=11\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:30:39', 'com_categories.category', 101, 11, 'COM_ACTIONLOGS_DISABLED'),
(90, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"2\",\"title\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=2\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:40:47', 'com_content.article', 101, 2, 'COM_ACTIONLOGS_DISABLED'),
(91, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 02:40:47', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(92, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"Announcement 1\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:41:28', 'com_content.article', 101, 3, 'COM_ACTIONLOGS_DISABLED'),
(93, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 02:41:28', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(94, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"Announcement 2\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:41:46', 'com_content.article', 101, 4, 'COM_ACTIONLOGS_DISABLED'),
(95, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 02:41:46', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(96, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"4\",\"title\":\"Announcement 2\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=4\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:42:06', 'com_content.article', 101, 4, 'COM_ACTIONLOGS_DISABLED'),
(97, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 02:42:06', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(98, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"Announcement 1\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:42:24', 'com_content.article', 101, 3, 'COM_ACTIONLOGS_DISABLED'),
(99, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 02:42:24', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(100, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"5\",\"title\":\"Announcement 3\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=5\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:42:44', 'com_content.article', 101, 5, 'COM_ACTIONLOGS_DISABLED'),
(101, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 02:42:44', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(102, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 02:50:38', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(103, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":6,\"title\":\"Ongoing Program 1\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=6\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:51:33', 'com_content.article', 101, 6, 'COM_ACTIONLOGS_DISABLED'),
(104, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":118,\"title\":\"Ongoing Program 1\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=118\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 02:52:47', 'com_menus.item', 101, 118, 'COM_ACTIONLOGS_DISABLED'),
(105, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":102,\"title\":\"Announcement\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=102\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 03:22:27', 'com_menus.item', 101, 102, 'COM_ACTIONLOGS_DISABLED'),
(106, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 03:22:27', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(107, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":102,\"title\":\"Announcement\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=102\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 03:25:09', 'com_menus.item', 101, 102, 'COM_ACTIONLOGS_DISABLED'),
(108, 'PLG_ACTIONLOG_JOOMLA_USER_LOGGED_IN', '{\"action\":\"login\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"app\":\"PLG_ACTIONLOG_JOOMLA_APPLICATION_ADMINISTRATOR\"}', '2023-04-20 03:42:03', 'com_users', 101, 0, 'COM_ACTIONLOGS_DISABLED'),
(109, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":105,\"title\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=105\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 03:42:31', 'com_menus.item', 101, 105, 'COM_ACTIONLOGS_DISABLED'),
(110, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 03:42:31', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(111, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":105,\"title\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=105\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:17:03', 'com_menus.item', 101, 105, 'COM_ACTIONLOGS_DISABLED'),
(112, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_ADDED', '{\"action\":\"add\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:19:29', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(113, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:20:00', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(114, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:20:00', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(115, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:20:21', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(116, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:20:21', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(117, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:20:41', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(118, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:20:41', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(119, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:21:53', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(120, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:21:53', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(121, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:22:58', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(122, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:22:58', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED');
INSERT INTO `hde5p_action_logs` (`id`, `message_language_key`, `message`, `log_date`, `extension`, `user_id`, `item_id`, `ip_address`) VALUES
(123, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:24:02', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(124, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:24:02', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(125, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:24:24', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(126, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:24:24', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(127, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:24:54', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(128, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:24:54', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(129, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:25:18', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(130, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:25:18', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(131, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:25:52', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(132, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:25:52', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(133, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:26:10', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(134, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:26:10', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(135, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:26:18', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(136, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:26:18', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(137, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:27:11', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(138, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:27:11', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(139, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:27:31', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(140, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:27:31', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(141, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:28:00', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(142, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:28:00', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(143, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:28:24', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(144, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:28:24', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(145, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:29:13', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(146, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:29:13', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(147, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:29:32', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(148, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:29:32', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(149, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:29:55', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(150, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:29:55', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(151, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:30:06', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(152, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:30:06', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(153, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"News flash\",\"extension_name\":\"News flash\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:30:25', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(154, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:30:25', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(155, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcement\",\"extension_name\":\"Announcement\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:30:53', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(156, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:30:53', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(157, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:31:40', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(158, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:31:40', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(159, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 04:45:35', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(160, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 04:45:35', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(161, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":239,\"name\":\"SP Page Builder\",\"extension_name\":\"SP Page Builder\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:02:49', 'com_installer', 101, 239, 'COM_ACTIONLOGS_DISABLED'),
(162, 'PLG_ACTIONLOG_JOOMLA_EXTENSION_INSTALLED', '{\"action\":\"install\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT\",\"id\":238,\"name\":\"SP Page Builder\",\"extension_name\":\"SP Page Builder\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:02:49', 'com_installer', 101, 238, 'COM_ACTIONLOGS_DISABLED'),
(163, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"Ongoing Programs\",\"extension_name\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:09:03', 'com_modules.module', 101, 113, 'COM_ACTIONLOGS_DISABLED'),
(164, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:09:03', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(165, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"Ongoing Programs\",\"extension_name\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:09:19', 'com_modules.module', 101, 113, 'COM_ACTIONLOGS_DISABLED'),
(166, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:09:19', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(167, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"5\",\"title\":\"Announcement 3\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=5\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:09:39', 'com_content.article', 101, 5, 'COM_ACTIONLOGS_DISABLED'),
(168, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 05:09:39', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(169, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:10:40', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(170, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:10:40', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(171, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:10:53', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(172, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:10:53', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(173, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:11:08', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(174, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:11:08', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(175, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:11:23', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(176, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:11:23', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(177, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:14:04', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(178, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:14:04', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(179, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:14:33', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(180, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:14:33', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(181, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:15:05', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(182, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:15:05', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(183, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:15:56', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(184, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:15:56', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(185, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:16:05', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(186, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:16:05', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(187, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:16:49', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(188, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 05:16:49', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(189, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:16:59', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(190, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:17:05', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(191, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 05:17:48', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(192, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 05:18:47', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(193, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":114,\"title\":\"Destinations\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=114\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:19:13', 'com_menus.item', 101, 114, 'COM_ACTIONLOGS_DISABLED'),
(194, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 05:19:13', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(195, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 05:21:55', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(196, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":19,\"title\":\"com_content\",\"extension_name\":\"com_content\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=19\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:22:21', 'com_config.component', 101, 19, 'COM_ACTIONLOGS_DISABLED'),
(197, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":19,\"title\":\"com_content\",\"extension_name\":\"com_content\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=19\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:22:32', 'com_config.component', 101, 19, 'COM_ACTIONLOGS_DISABLED'),
(198, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:26:26', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(199, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 05:26:26', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(200, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:27:26', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(201, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:28:45', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(202, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 05:28:45', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(203, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:28:52', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(204, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:29:43', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(205, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 05:30:06', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(206, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 05:30:36', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(207, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:32:07', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(208, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 05:32:07', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(209, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:32:28', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(210, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED', '{\"action\":\"unpublish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:32:28', 'com_modules.module', 101, 113, 'COM_ACTIONLOGS_DISABLED'),
(211, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:32:29', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(212, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UNPUBLISHED', '{\"action\":\"unpublish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:32:29', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(213, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":13,\"title\":\"com_menus\",\"extension_name\":\"com_menus\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=13\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:33:39', 'com_config.component', 101, 13, 'COM_ACTIONLOGS_DISABLED'),
(214, 'PLG_ACTIONLOG_JOOMLA_COMPONENT_CONFIG_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_COMPONENT_CONFIG\",\"id\":13,\"title\":\"com_menus\",\"extension_name\":\"com_menus\",\"itemlink\":\"index.php?option=com_config&task=component.edit&extension_id=13\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:33:48', 'com_config.component', 101, 13, 'COM_ACTIONLOGS_DISABLED'),
(215, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:35:12', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(216, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__menu\"}', '2023-04-20 05:35:12', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(217, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:35:27', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(218, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:35:46', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(219, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:36:02', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(220, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MENU_ITEM\",\"id\":101,\"title\":\"Mayor\'s Corner\",\"itemlink\":\"index.php?option=com_menus&task=item.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:38:20', 'com_menus.item', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(221, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:38:44', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(222, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED', '{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:38:44', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(223, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:38:46', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(224, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_PUBLISHED', '{\"action\":\"publish\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":113,\"title\":\"Ongoing Programs\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=113\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:38:46', 'com_modules.module', 101, 113, 'COM_ACTIONLOGS_DISABLED'),
(225, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_ARTICLE\",\"id\":\"3\",\"title\":\"Announcement 1\",\"itemlink\":\"index.php?option=com_content&task=article.edit&id=3\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:50:17', 'com_content.article', 101, 3, 'COM_ACTIONLOGS_DISABLED'),
(226, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 05:50:17', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(227, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__content\"}', '2023-04-20 05:50:38', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(228, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:51:28', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(229, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:51:41', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(230, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:51:41', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(231, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:51:51', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(232, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:51:51', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(233, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:52:11', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(234, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:52:11', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED'),
(235, 'PLG_SYSTEM_ACTIONLOGS_CONTENT_UPDATED', '{\"action\":\"update\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_MODULE\",\"id\":111,\"title\":\"Announcements\",\"extension_name\":\"Announcements\",\"itemlink\":\"index.php?option=com_modules&task=module.edit&id=111\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\"}', '2023-04-20 05:52:54', 'com_modules.module', 101, 111, 'COM_ACTIONLOGS_DISABLED'),
(236, 'PLG_ACTIONLOG_JOOMLA_USER_CHECKIN', '{\"action\":\"checkin\",\"type\":\"PLG_ACTIONLOG_JOOMLA_TYPE_USER\",\"id\":101,\"title\":\"admin\",\"itemlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"userid\":101,\"username\":\"admin\",\"accountlink\":\"index.php?option=com_users&task=user.edit&id=101\",\"table\":\"#__modules\"}', '2023-04-20 05:52:54', 'com_checkin', 101, 101, 'COM_ACTIONLOGS_DISABLED');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_action_logs_extensions`
--

CREATE TABLE `hde5p_action_logs_extensions` (
  `id` int(10) UNSIGNED NOT NULL,
  `extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_action_logs_extensions`
--

INSERT INTO `hde5p_action_logs_extensions` (`id`, `extension`) VALUES
(1, 'com_banners'),
(2, 'com_cache'),
(3, 'com_categories'),
(4, 'com_config'),
(5, 'com_contact'),
(6, 'com_content'),
(7, 'com_installer'),
(8, 'com_media'),
(9, 'com_menus'),
(10, 'com_messages'),
(11, 'com_modules'),
(12, 'com_newsfeeds'),
(13, 'com_plugins'),
(14, 'com_redirect'),
(15, 'com_tags'),
(16, 'com_templates'),
(17, 'com_users'),
(18, 'com_checkin'),
(19, 'com_scheduler');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_action_logs_users`
--

CREATE TABLE `hde5p_action_logs_users` (
  `user_id` int(10) UNSIGNED NOT NULL,
  `notify` tinyint(3) UNSIGNED NOT NULL,
  `extensions` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_action_log_config`
--

CREATE TABLE `hde5p_action_log_config` (
  `id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `id_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `title_holder` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_prefix` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_action_log_config`
--

INSERT INTO `hde5p_action_log_config` (`id`, `type_title`, `type_alias`, `id_holder`, `title_holder`, `table_name`, `text_prefix`) VALUES
(1, 'article', 'com_content.article', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(2, 'article', 'com_content.form', 'id', 'title', '#__content', 'PLG_ACTIONLOG_JOOMLA'),
(3, 'banner', 'com_banners.banner', 'id', 'name', '#__banners', 'PLG_ACTIONLOG_JOOMLA'),
(4, 'user_note', 'com_users.note', 'id', 'subject', '#__user_notes', 'PLG_ACTIONLOG_JOOMLA'),
(5, 'media', 'com_media.file', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(6, 'category', 'com_categories.category', 'id', 'title', '#__categories', 'PLG_ACTIONLOG_JOOMLA'),
(7, 'menu', 'com_menus.menu', 'id', 'title', '#__menu_types', 'PLG_ACTIONLOG_JOOMLA'),
(8, 'menu_item', 'com_menus.item', 'id', 'title', '#__menu', 'PLG_ACTIONLOG_JOOMLA'),
(9, 'newsfeed', 'com_newsfeeds.newsfeed', 'id', 'name', '#__newsfeeds', 'PLG_ACTIONLOG_JOOMLA'),
(10, 'link', 'com_redirect.link', 'id', 'old_url', '#__redirect_links', 'PLG_ACTIONLOG_JOOMLA'),
(11, 'tag', 'com_tags.tag', 'id', 'title', '#__tags', 'PLG_ACTIONLOG_JOOMLA'),
(12, 'style', 'com_templates.style', 'id', 'title', '#__template_styles', 'PLG_ACTIONLOG_JOOMLA'),
(13, 'plugin', 'com_plugins.plugin', 'extension_id', 'name', '#__extensions', 'PLG_ACTIONLOG_JOOMLA'),
(14, 'component_config', 'com_config.component', 'extension_id', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(15, 'contact', 'com_contact.contact', 'id', 'name', '#__contact_details', 'PLG_ACTIONLOG_JOOMLA'),
(16, 'module', 'com_modules.module', 'id', 'title', '#__modules', 'PLG_ACTIONLOG_JOOMLA'),
(17, 'access_level', 'com_users.level', 'id', 'title', '#__viewlevels', 'PLG_ACTIONLOG_JOOMLA'),
(18, 'banner_client', 'com_banners.client', 'id', 'name', '#__banner_clients', 'PLG_ACTIONLOG_JOOMLA'),
(19, 'application_config', 'com_config.application', '', 'name', '', 'PLG_ACTIONLOG_JOOMLA'),
(20, 'task', 'com_scheduler.task', 'id', 'title', '#__scheduler_tasks', 'PLG_ACTIONLOG_JOOMLA');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_assets`
--

CREATE TABLE `hde5p_assets` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set parent.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `level` int(10) UNSIGNED NOT NULL COMMENT 'The cached level in the nested tree.',
  `name` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The unique name for the asset.\n',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The descriptive title for the asset.',
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_assets`
--

INSERT INTO `hde5p_assets` (`id`, `parent_id`, `lft`, `rgt`, `level`, `name`, `title`, `rules`) VALUES
(1, 0, 0, 201, 0, 'root.1', 'Root Asset', '{\"core.login.site\":{\"6\":1,\"2\":1},\"core.login.admin\":{\"6\":1},\"core.login.api\":{\"8\":1},\"core.login.offline\":{\"6\":1},\"core.admin\":{\"8\":1},\"core.manage\":{\"7\":1},\"core.create\":{\"6\":1,\"3\":1},\"core.delete\":{\"6\":1},\"core.edit\":{\"6\":1,\"4\":1},\"core.edit.state\":{\"6\":1,\"5\":1},\"core.edit.own\":{\"6\":1,\"3\":1}}'),
(2, 1, 1, 2, 1, 'com_admin', 'com_admin', '{}'),
(3, 1, 3, 6, 1, 'com_banners', 'com_banners', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(4, 1, 7, 8, 1, 'com_cache', 'com_cache', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(5, 1, 9, 10, 1, 'com_checkin', 'com_checkin', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(6, 1, 11, 12, 1, 'com_config', 'com_config', '{}'),
(7, 1, 13, 16, 1, 'com_contact', 'com_contact', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(8, 1, 17, 56, 1, 'com_content', 'com_content', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.edit\":{\"4\":1},\"core.edit.state\":{\"5\":1},\"core.execute.transition\":{\"6\":1,\"5\":1}}'),
(9, 1, 57, 58, 1, 'com_cpanel', 'com_cpanel', '{}'),
(10, 1, 59, 60, 1, 'com_installer', 'com_installer', '{\"core.manage\":{\"7\":0},\"core.delete\":{\"7\":0},\"core.edit.state\":{\"7\":0}}'),
(11, 1, 61, 62, 1, 'com_languages', 'com_languages', '{\"core.admin\":{\"7\":1}}'),
(12, 1, 63, 64, 1, 'com_login', 'com_login', '{}'),
(14, 1, 65, 66, 1, 'com_massmail', 'com_massmail', '{}'),
(15, 1, 67, 68, 1, 'com_media', 'com_media', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1},\"core.create\":{\"3\":1},\"core.delete\":{\"5\":1}}'),
(16, 1, 69, 72, 1, 'com_menus', 'com_menus', '{\"core.admin\":{\"7\":1}}'),
(17, 1, 73, 74, 1, 'com_messages', 'com_messages', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"7\":1}}'),
(18, 1, 75, 158, 1, 'com_modules', 'com_modules', '{\"core.admin\":{\"7\":1}}'),
(19, 1, 159, 162, 1, 'com_newsfeeds', 'com_newsfeeds', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(20, 1, 163, 164, 1, 'com_plugins', 'com_plugins', '{\"core.admin\":{\"7\":1}}'),
(21, 1, 165, 166, 1, 'com_redirect', 'com_redirect', '{\"core.admin\":{\"7\":1}}'),
(23, 1, 167, 168, 1, 'com_templates', 'com_templates', '{\"core.admin\":{\"7\":1}}'),
(24, 1, 173, 176, 1, 'com_users', 'com_users', '{\"core.admin\":{\"7\":1}}'),
(26, 1, 177, 178, 1, 'com_wrapper', 'com_wrapper', '{}'),
(27, 8, 18, 25, 2, 'com_content.category.2', 'Uncategorised', '{}'),
(28, 3, 4, 5, 2, 'com_banners.category.3', 'Uncategorised', '{}'),
(29, 7, 14, 15, 2, 'com_contact.category.4', 'Uncategorised', '{}'),
(30, 19, 160, 161, 2, 'com_newsfeeds.category.5', 'Uncategorised', '{}'),
(32, 24, 174, 175, 2, 'com_users.category.7', 'Uncategorised', '{}'),
(33, 1, 179, 180, 1, 'com_finder', 'com_finder', '{\"core.admin\":{\"7\":1},\"core.manage\":{\"6\":1}}'),
(34, 1, 181, 182, 1, 'com_joomlaupdate', 'com_joomlaupdate', '{}'),
(35, 1, 183, 184, 1, 'com_tags', 'com_tags', '{}'),
(36, 1, 185, 186, 1, 'com_contenthistory', 'com_contenthistory', '{}'),
(37, 1, 187, 188, 1, 'com_ajax', 'com_ajax', '{}'),
(38, 1, 189, 190, 1, 'com_postinstall', 'com_postinstall', '{}'),
(39, 18, 76, 77, 2, 'com_modules.module.1', 'Main Menu', '{}'),
(40, 18, 78, 79, 2, 'com_modules.module.2', 'Login', '{}'),
(41, 18, 80, 81, 2, 'com_modules.module.3', 'Popular Articles', '{}'),
(42, 18, 82, 83, 2, 'com_modules.module.4', 'Recently Added Articles', '{}'),
(43, 18, 84, 85, 2, 'com_modules.module.8', 'Toolbar', '{}'),
(44, 18, 86, 87, 2, 'com_modules.module.9', 'Notifications', '{}'),
(45, 18, 88, 89, 2, 'com_modules.module.10', 'Logged-in Users', '{}'),
(46, 18, 90, 91, 2, 'com_modules.module.12', 'Admin Menu', '{}'),
(48, 18, 96, 97, 2, 'com_modules.module.14', 'User Status', '{}'),
(49, 18, 98, 99, 2, 'com_modules.module.15', 'Title', '{}'),
(50, 18, 100, 101, 2, 'com_modules.module.16', 'Login Form', '{}'),
(51, 18, 102, 103, 2, 'com_modules.module.17', 'Breadcrumbs', '{}'),
(52, 18, 104, 105, 2, 'com_modules.module.79', 'Multilanguage status', '{}'),
(53, 18, 108, 109, 2, 'com_modules.module.86', 'Joomla Version', '{}'),
(54, 16, 70, 71, 2, 'com_menus.menu.1', 'Main Menu', '{}'),
(55, 18, 112, 113, 2, 'com_modules.module.87', 'Sample Data', '{}'),
(56, 8, 26, 43, 2, 'com_content.workflow.1', 'COM_WORKFLOW_BASIC_WORKFLOW', '{}'),
(57, 56, 27, 28, 3, 'com_content.stage.1', 'COM_WORKFLOW_BASIC_STAGE', '{}'),
(58, 56, 29, 30, 3, 'com_content.transition.1', 'Unpublish', '{}'),
(59, 56, 31, 32, 3, 'com_content.transition.2', 'Publish', '{}'),
(60, 56, 33, 34, 3, 'com_content.transition.3', 'Trash', '{}'),
(61, 56, 35, 36, 3, 'com_content.transition.4', 'Archive', '{}'),
(62, 56, 37, 38, 3, 'com_content.transition.5', 'Feature', '{}'),
(63, 56, 39, 40, 3, 'com_content.transition.6', 'Unfeature', '{}'),
(64, 56, 41, 42, 3, 'com_content.transition.7', 'Publish & Feature', '{}'),
(65, 1, 169, 170, 1, 'com_privacy', 'com_privacy', '{}'),
(66, 1, 171, 172, 1, 'com_actionlogs', 'com_actionlogs', '{}'),
(67, 18, 92, 93, 2, 'com_modules.module.88', 'Latest Actions', '{}'),
(68, 18, 94, 95, 2, 'com_modules.module.89', 'Privacy Dashboard', '{}'),
(70, 18, 106, 107, 2, 'com_modules.module.103', 'Site', '{}'),
(71, 18, 110, 111, 2, 'com_modules.module.104', 'System', '{}'),
(72, 18, 114, 115, 2, 'com_modules.module.91', 'System Dashboard', '{}'),
(73, 18, 116, 117, 2, 'com_modules.module.92', 'Content Dashboard', '{}'),
(74, 18, 118, 119, 2, 'com_modules.module.93', 'Menus Dashboard', '{}'),
(75, 18, 120, 121, 2, 'com_modules.module.94', 'Components Dashboard', '{}'),
(76, 18, 122, 123, 2, 'com_modules.module.95', 'Users Dashboard', '{}'),
(77, 18, 124, 125, 2, 'com_modules.module.99', 'Frontend Link', '{}'),
(78, 18, 126, 127, 2, 'com_modules.module.100', 'Messages', '{}'),
(79, 18, 128, 129, 2, 'com_modules.module.101', 'Post Install Messages', '{}'),
(80, 18, 130, 131, 2, 'com_modules.module.102', 'User Status', '{}'),
(82, 18, 132, 133, 2, 'com_modules.module.105', '3rd Party', '{}'),
(83, 18, 134, 135, 2, 'com_modules.module.106', 'Help Dashboard', '{}'),
(84, 18, 136, 137, 2, 'com_modules.module.107', 'Privacy Requests', '{}'),
(85, 18, 138, 139, 2, 'com_modules.module.108', 'Privacy Status', '{}'),
(86, 18, 140, 141, 2, 'com_modules.module.96', 'Popular Articles', '{}'),
(87, 18, 142, 143, 2, 'com_modules.module.97', 'Recently Added Articles', '{}'),
(88, 18, 144, 145, 2, 'com_modules.module.98', 'Logged-in Users', '{}'),
(89, 18, 146, 147, 2, 'com_modules.module.90', 'Login Support', '{}'),
(90, 1, 191, 192, 1, 'com_scheduler', 'com_scheduler', '{}'),
(91, 27, 19, 20, 3, 'com_content.category.8', 'Lorem Ipsum', '{}'),
(92, 27, 21, 22, 3, 'com_content.article.1', 'Lorem Ipsum', '{}'),
(93, 27, 23, 24, 3, 'com_content.article.2', 'Ongoing Programs', '{}'),
(94, 102, 45, 46, 3, 'com_content.article.3', 'Announcement 1', '{}'),
(95, 102, 47, 48, 3, 'com_content.article.4', 'Announcement 2', '{}'),
(96, 102, 49, 50, 3, 'com_content.article.5', 'Announcement 3', '{}'),
(97, 1, 193, 196, 1, 'com_spsimpleportfolio', 'SP Simple Portfolio', '{}'),
(98, 18, 148, 149, 2, 'com_modules.module.109', 'SP Simple Portfolio Module', '{}'),
(99, 97, 194, 195, 2, 'com_spsimpleportfolio.category.9', 'Destinations', '{}'),
(100, 1, 197, 198, 1, 'com_speasyimagegallery', 'COM_SPEASYIMAGEGALLERY', '{}'),
(101, 18, 150, 151, 2, 'com_modules.module.110', 'SP Easy Image Gallery Module', '{}'),
(102, 8, 44, 51, 2, 'com_content.category.10', 'Announcement', '{}'),
(103, 8, 52, 55, 2, 'com_content.category.11', 'Ongoing Programs', '{}'),
(104, 103, 53, 54, 3, 'com_content.article.6', 'Ongoing Program 1', '{}'),
(105, 18, 152, 153, 2, 'com_modules.module.111', 'Announcements', '{}'),
(106, 1, 199, 200, 1, 'com_sppagebuilder', 'SP Page Builder', '{}'),
(107, 18, 154, 155, 2, 'com_modules.module.112', 'SP Page Builder', '{}'),
(108, 18, 156, 157, 2, 'com_modules.module.113', 'Ongoing Programs', '{}');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_associations`
--

CREATE TABLE `hde5p_associations` (
  `id` int(11) NOT NULL COMMENT 'A reference to the associated item.',
  `context` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The context of the associated item.',
  `key` char(32) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The key for the association computed from an md5 on associated ids.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_banners`
--

CREATE TABLE `hde5p_banners` (
  `id` int(11) NOT NULL,
  `cid` int(11) NOT NULL DEFAULT 0,
  `type` int(11) NOT NULL DEFAULT 0,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `imptotal` int(11) NOT NULL DEFAULT 0,
  `impmade` int(11) NOT NULL DEFAULT 0,
  `clicks` int(11) NOT NULL DEFAULT 0,
  `clickurl` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `catid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custombannercode` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sticky` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `reset` datetime DEFAULT NULL,
  `created` datetime NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_banner_clients`
--

CREATE TABLE `hde5p_banner_clients` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `contact` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extrainfo` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `own_prefix` tinyint(4) NOT NULL DEFAULT 0,
  `metakey_prefix` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `purchase_type` tinyint(4) NOT NULL DEFAULT -1,
  `track_clicks` tinyint(4) NOT NULL DEFAULT -1,
  `track_impressions` tinyint(4) NOT NULL DEFAULT -1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_banner_tracks`
--

CREATE TABLE `hde5p_banner_tracks` (
  `track_date` datetime NOT NULL,
  `track_type` int(10) UNSIGNED NOT NULL,
  `banner_id` int(10) UNSIGNED NOT NULL,
  `count` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_categories`
--

CREATE TABLE `hde5p_categories` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_categories`
--

INSERT INTO `hde5p_categories` (`id`, `asset_id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `extension`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `modified_user_id`, `modified_time`, `hits`, `language`, `version`) VALUES
(1, 0, 0, 0, 19, 0, '', 'system', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '{}', '', '', '{}', 101, '2023-04-11 02:12:47', 101, '2023-04-11 02:12:47', 0, '*', 1),
(2, 27, 1, 1, 4, 1, 'uncategorised', 'com_content', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\",\"workflow_id\":\"use_default\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-11 02:12:47', 101, '2023-04-11 02:12:47', 0, '*', 1),
(3, 28, 1, 5, 6, 1, 'uncategorised', 'com_banners', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-11 02:12:47', 101, '2023-04-11 02:12:47', 0, '*', 1),
(4, 29, 1, 7, 8, 1, 'uncategorised', 'com_contact', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-11 02:12:47', 101, '2023-04-11 02:12:47', 0, '*', 1),
(5, 30, 1, 9, 10, 1, 'uncategorised', 'com_newsfeeds', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-11 02:12:47', 101, '2023-04-11 02:12:47', 0, '*', 1),
(7, 32, 1, 11, 12, 1, 'uncategorised', 'com_users', 'Uncategorised', 'uncategorised', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-11 02:12:47', 101, '2023-04-11 02:12:47', 0, '*', 1),
(8, 91, 2, 2, 3, 2, 'uncategorised/lorem-ipsum', 'com_content', 'Lorem Ipsum', 'lorem-ipsum', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem nulla pharetra diam sit amet. Cras semper auctor neque vitae tempus quam pellentesque nec. Dolor sit amet consectetur adipiscing elit. Mauris vitae ultricies leo integer malesuada nunc.</p>', -2, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-11 05:17:37', 101, '2023-04-11 05:17:37', 0, '*', 1),
(9, 99, 1, 13, 14, 1, 'destinations', 'com_spsimpleportfolio', 'Destinations', 'destinations', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-12 15:21:23', 101, '2023-04-12 15:21:23', 0, '*', 1),
(10, 102, 1, 15, 16, 1, 'announcement', 'com_content', 'Announcement', 'announcement', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-20 02:30:06', 101, '2023-04-20 02:30:18', 0, '*', 1),
(11, 103, 1, 17, 18, 1, 'ongoing-programs', 'com_content', 'Ongoing Programs', 'ongoing-programs', '', '', 1, NULL, NULL, 1, '{\"category_layout\":\"\",\"image\":\"\",\"image_alt\":\"\"}', '', '', '{\"author\":\"\",\"robots\":\"\"}', 101, '2023-04-20 02:30:39', 101, '2023-04-20 02:30:39', 0, '*', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_contact_details`
--

CREATE TABLE `hde5p_contact_details` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `con_position` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `suburb` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `country` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `postcode` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telephone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `fax` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `misc` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_to` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `default_con` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL DEFAULT 0,
  `catid` int(11) NOT NULL DEFAULT 0,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `mobile` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `webpage` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname1` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname2` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `sortname3` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` varchar(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Set if contact is featured.',
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_content`
--

CREATE TABLE `hde5p_content` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `introtext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `fulltext` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `catid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Set if article is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The language code for the article.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_content`
--

INSERT INTO `hde5p_content` (`id`, `asset_id`, `title`, `alias`, `introtext`, `fulltext`, `state`, `catid`, `created`, `created_by`, `created_by_alias`, `modified`, `modified_by`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `images`, `urls`, `attribs`, `version`, `ordering`, `metakey`, `metadesc`, `access`, `hits`, `metadata`, `featured`, `language`, `note`) VALUES
(1, 92, 'Lorem Ipsum', 'lorem-ipsum', '<p>Lorem ipsum dolor sit amet, articulo consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem nulla pharetra diam sit amet. Cras semper auctor neque vitae tempus quam pellentesque nec. Dolor sit amet consectetur adipiscing elit. Mauris vitae ultricies leo integer malesuada nunc.</p>', '', 1, 2, '2023-04-11 05:19:41', 101, '', '2023-04-11 05:25:17', 101, NULL, NULL, '2023-04-11 05:19:41', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"0\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\",\"helix_ultimate_image\":\"\",\"helix_ultimate_image_alt_txt\":\"\",\"helix_ultimate_article_format\":\"standard\",\"helix_ultimate_audio\":\"\",\"helix_ultimate_gallery\":\"\",\"helix_ultimate_video\":\"\"}', 3, 4, '', '', 1, 1, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(2, 93, 'Ongoing Programs', 'ongoing-programs', '<h1 style=\"text-align: center;\">Ongoing Programs</h1>\r\n<p style=\"text-align: justify;\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Etiam non quam lacus suspendisse. Viverra adipiscing at in tellus integer. In nulla posuere sollicitudin aliquam ultrices sagittis orci a. Sit amet porttitor eget dolor morbi non.</p>', '', 1, 2, '2023-04-11 13:30:05', 101, '', '2023-04-20 02:40:47', 101, NULL, NULL, '2023-04-11 13:30:05', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\",\"helix_ultimate_image\":\"\",\"helix_ultimate_image_alt_txt\":\"\",\"helix_ultimate_article_format\":\"standard\",\"helix_ultimate_audio\":\"\",\"helix_ultimate_gallery\":\"\",\"helix_ultimate_video\":\"\"}', 2, 3, '', '', 1, 0, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(3, 94, 'Announcement 1', 'announcement-1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget mauris pharetra et ultrices neque. Velit scelerisque in dictum non consectetur a erat nam. Gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim. Viverra vitae congue eu consequat. Aliquam purus sit amet luctus venenatis. Ridiculus mus mauris vitae ultricies leo. Dictumst quisque sagittis purus sit amet volutpat. Sapien et ligula ullamcorper malesuada proin libero nunc consequat. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit. Auctor neque vitae tempus quam pellentesque. Ornare suspendisse sed nisi lacus sed viverra tellus in. Lorem donec massa sapien faucibus et molestie ac feugiat. Dignissim enim sit amet venenatis urna. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. Volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam. Massa id neque aliquam vestibulum morbi blandit cursus. Convallis posuere morbi leo urna molestie at elementum eu.</p>\r\n<p>Sapien pellentesque habitant morbi tristique. Placerat orci nulla pellentesque dignissim enim sit amet venenatis urna. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam. Aliquam purus sit amet luctus venenatis lectus. Senectus et netus et malesuada fames ac turpis egestas sed. Eget nulla facilisi etiam dignissim diam quis enim. Urna id volutpat lacus laoreet non curabitur. Egestas dui id ornare arcu. Ut tellus elementum sagittis vitae et leo. Gravida in fermentum et sollicitudin ac orci phasellus egestas tellus. Cras fermentum odio eu feugiat pretium nibh. Sagittis purus sit amet volutpat consequat mauris nunc congue. Quam nulla porttitor massa id neque. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Mauris commodo quis imperdiet massa tincidunt nunc. Tempus egestas sed sed risus pretium quam. Vitae justo eget magna fermentum iaculis eu non.</p>\r\n<p>Est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Amet risus nullam eget felis eget nunc lobortis mattis aliquam. Turpis nunc eget lorem dolor sed viverra. Mi in nulla posuere sollicitudin aliquam ultrices sagittis. Turpis in eu mi bibendum neque egestas. Mi bibendum neque egestas congue quisque egestas diam. Fermentum et sollicitudin ac orci phasellus egestas tellus. Felis eget velit aliquet sagittis id. In hac habitasse platea dictumst vestibulum. Viverra aliquet eget sit amet. Amet nulla facilisi morbi tempus iaculis urna id. Nisl condimentum id venenatis a condimentum vitae sapien. Quis auctor elit sed vulputate mi sit. Congue eu consequat ac felis donec et odio pellentesque diam. Lacus sed viverra tellus in hac habitasse platea. Nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus.</p>\r\n<p>Vulputate mi sit amet mauris commodo quis. Sit amet commodo nulla facilisi nullam. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend. Sit amet venenatis urna cursus eget nunc. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat. Massa vitae tortor condimentum lacinia quis vel eros. Platea dictumst vestibulum rhoncus est. Tempor commodo ullamcorper a lacus vestibulum sed arcu non odio. Tortor at auctor urna nunc id cursus metus aliquam. Risus nullam eget felis eget nunc lobortis. Tincidunt dui ut ornare lectus sit amet est placerat. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Proin libero nunc consequat interdum. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Arcu cursus vitae congue mauris rhoncus aenean. Consectetur adipiscing elit ut aliquam purus sit amet luctus. Mauris augue neque gravida in fermentum et sollicitudin.</p>\r\n<p>Nullam vehicula ipsum a arcu cursus. Eleifend donec pretium vulputate sapien nec. Vitae sapien pellentesque habitant morbi tristique. Quam pellentesque nec nam aliquam sem et tortor consequat. Amet consectetur adipiscing elit ut aliquam purus. Adipiscing elit ut aliquam purus sit amet luctus. Feugiat nisl pretium fusce id velit ut tortor pretium viverra. Sed augue lacus viverra vitae congue eu consequat ac felis. Ut consequat semper viverra nam libero justo. Non pulvinar neque laoreet suspendisse interdum. Vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur. Augue eget arcu dictum varius. At quis risus sed vulputate. Turpis egestas pretium aenean pharetra magna ac placerat. Convallis a cras semper auctor. Ornare arcu odio ut sem nulla pharetra diam. Duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat.</p>', '', 1, 10, '2023-04-11 13:30:49', 101, '', '2023-04-20 05:50:17', 101, NULL, NULL, '2023-04-11 13:30:49', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\",\"helix_ultimate_image\":\"\",\"helix_ultimate_image_alt_txt\":\"\",\"helix_ultimate_article_format\":\"standard\",\"helix_ultimate_audio\":\"\",\"helix_ultimate_gallery\":\"\",\"helix_ultimate_video\":\"\"}', 4, 2, '', '', 1, 14, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(4, 95, 'Announcement 2', 'announcement-2', '<h1>Article 2</h1>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.</p>', '', 1, 10, '2023-04-11 13:52:14', 101, '', '2023-04-20 02:42:06', 101, NULL, NULL, '2023-04-11 13:52:14', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\",\"helix_ultimate_image\":\"\",\"helix_ultimate_image_alt_txt\":\"\",\"helix_ultimate_article_format\":\"standard\",\"helix_ultimate_audio\":\"\",\"helix_ultimate_gallery\":\"\",\"helix_ultimate_video\":\"\"}', 3, 1, '', '', 1, 9, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(5, 96, 'Announcement 3', 'announcement-3', '<p>Article 3</p>\r\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.</p>', '', 1, 10, '2023-04-11 13:52:34', 101, '', '2023-04-20 05:09:39', 101, NULL, NULL, '2023-04-11 13:52:34', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\",\"helix_ultimate_image\":\"\",\"helix_ultimate_image_alt_txt\":\"\",\"helix_ultimate_article_format\":\"standard\",\"helix_ultimate_audio\":\"\",\"helix_ultimate_gallery\":\"\",\"helix_ultimate_video\":\"\"}', 3, 0, '', '', 1, 1, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', ''),
(6, 104, 'Ongoing Program 1', 'ongoing-program-1', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu sem integer vitae justo eget magna fermentum. Feugiat in ante metus dictum at. Urna condimentum mattis pellentesque id. Dictum sit amet justo donec enim. Pellentesque id nibh tortor id. Et malesuada fames ac turpis egestas. Dictum at tempor commodo ullamcorper a. Nulla malesuada pellentesque elit eget gravida cum sociis natoque. Tincidunt id aliquet risus feugiat in ante metus. Cras semper auctor neque vitae tempus quam pellentesque nec.</p>\r\n<p>Gravida neque convallis a cras semper auctor neque vitae. Nulla porttitor massa id neque aliquam vestibulum. Ac odio tempor orci dapibus ultrices in iaculis. Commodo nulla facilisi nullam vehicula. Semper feugiat nibh sed pulvinar. Morbi tristique senectus et netus et malesuada fames. Elit pellentesque habitant morbi tristique. Dolor sed viverra ipsum nunc. Tempus urna et pharetra pharetra massa massa ultricies. Facilisis sed odio morbi quis commodo odio aenean sed. Turpis cursus in hac habitasse platea.</p>', '', 1, 11, '2023-04-20 02:51:33', 101, '', '2023-04-20 02:51:33', 101, NULL, NULL, '2023-04-20 02:51:33', NULL, '{\"image_intro\":\"\",\"image_intro_alt\":\"\",\"float_intro\":\"\",\"image_intro_caption\":\"\",\"image_fulltext\":\"\",\"image_fulltext_alt\":\"\",\"float_fulltext\":\"\",\"image_fulltext_caption\":\"\"}', '{\"urla\":\"\",\"urlatext\":\"\",\"targeta\":\"\",\"urlb\":\"\",\"urlbtext\":\"\",\"targetb\":\"\",\"urlc\":\"\",\"urlctext\":\"\",\"targetc\":\"\"}', '{\"article_layout\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_tags\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"alternative_readmore\":\"\",\"article_page_title\":\"\",\"show_publishing_options\":\"\",\"show_article_options\":\"\",\"show_urls_images_backend\":\"\",\"show_urls_images_frontend\":\"\",\"helix_ultimate_image\":\"\",\"helix_ultimate_image_alt_txt\":\"\",\"helix_ultimate_article_format\":\"standard\",\"helix_ultimate_audio\":\"\",\"helix_ultimate_gallery\":\"\",\"helix_ultimate_video\":\"\"}', 1, 0, '', '', 1, 4, '{\"robots\":\"\",\"author\":\"\",\"rights\":\"\"}', 0, '*', '');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_contentitem_tag_map`
--

CREATE TABLE `hde5p_contentitem_tag_map` (
  `type_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_content_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the core content table',
  `content_item_id` int(11) NOT NULL COMMENT 'PK from the content type table',
  `tag_id` int(10) UNSIGNED NOT NULL COMMENT 'PK from the tag table',
  `tag_date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp() COMMENT 'Date of most recent save for this tag-item',
  `type_id` mediumint(9) NOT NULL COMMENT 'PK from the content_type table'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Maps items from content tables to tags';

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_content_frontpage`
--

CREATE TABLE `hde5p_content_frontpage` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `featured_up` datetime DEFAULT NULL,
  `featured_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_content_rating`
--

CREATE TABLE `hde5p_content_rating` (
  `content_id` int(11) NOT NULL DEFAULT 0,
  `rating_sum` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `rating_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lastip` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_content_types`
--

CREATE TABLE `hde5p_content_types` (
  `type_id` int(10) UNSIGNED NOT NULL,
  `type_title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `table` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `rules` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `field_mappings` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `router` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content_history_options` varchar(5120) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'JSON string for com_contenthistory options'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_content_types`
--

INSERT INTO `hde5p_content_types` (`type_id`, `type_title`, `type_alias`, `table`, `rules`, `field_mappings`, `router`, `content_history_options`) VALUES
(1, 'Article', 'com_content.article', '{\"special\":{\"dbtable\":\"#__content\",\"key\":\"id\",\"type\":\"ArticleTable\",\"prefix\":\"Joomla\\\\Component\\\\Content\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"state\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"introtext\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"attribs\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"asset_id\", \"note\":\"note\"}, \"special\":{\"fulltext\":\"fulltext\"}}', 'ContentHelperRoute::getArticleRoute', '{\"formFile\":\"administrator\\/components\\/com_content\\/forms\\/article.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"ordering\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(2, 'Contact', 'com_contact.contact', '{\"special\":{\"dbtable\":\"#__contact_details\",\"key\":\"id\",\"type\":\"ContactTable\",\"prefix\":\"Joomla\\\\Component\\\\Contact\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"address\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"image\", \"core_urls\":\"webpage\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"con_position\":\"con_position\",\"suburb\":\"suburb\",\"state\":\"state\",\"country\":\"country\",\"postcode\":\"postcode\",\"telephone\":\"telephone\",\"fax\":\"fax\",\"misc\":\"misc\",\"email_to\":\"email_to\",\"default_con\":\"default_con\",\"user_id\":\"user_id\",\"mobile\":\"mobile\",\"sortname1\":\"sortname1\",\"sortname2\":\"sortname2\",\"sortname3\":\"sortname3\"}}', 'ContactHelperRoute::getContactRoute', '{\"formFile\":\"administrator\\/components\\/com_contact\\/forms\\/contact.xml\",\"hideFields\":[\"default_con\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"], \"displayLookup\":[ {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ] }'),
(3, 'Newsfeed', 'com_newsfeeds.newsfeed', '{\"special\":{\"dbtable\":\"#__newsfeeds\",\"key\":\"id\",\"type\":\"NewsfeedTable\",\"prefix\":\"Joomla\\\\Component\\\\Newsfeeds\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"numarticles\":\"numarticles\",\"cache_time\":\"cache_time\",\"rtl\":\"rtl\"}}', 'NewsfeedsHelperRoute::getNewsfeedRoute', '{\"formFile\":\"administrator\\/components\\/com_newsfeeds\\/forms\\/newsfeed.xml\",\"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\"],\"convertToInt\":[\"publish_up\", \"publish_down\", \"featured\", \"ordering\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(4, 'User', 'com_users.user', '{\"special\":{\"dbtable\":\"#__users\",\"key\":\"id\",\"type\":\"User\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"null\",\"core_alias\":\"username\",\"core_created_time\":\"registerDate\",\"core_modified_time\":\"lastvisitDate\",\"core_body\":\"null\", \"core_hits\":\"null\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"access\":\"null\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"null\", \"core_language\":\"null\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"null\", \"core_ordering\":\"null\", \"core_metakey\":\"null\", \"core_metadesc\":\"null\", \"core_catid\":\"null\", \"asset_id\":\"null\"}, \"special\":{}}', '', ''),
(5, 'Article Category', 'com_content.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContentHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(6, 'Contact Category', 'com_contact.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'ContactHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(7, 'Newsfeeds Category', 'com_newsfeeds.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', 'NewsfeedsHelperRoute::getCategoryRoute', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(8, 'Tag', 'com_tags.tag', '{\"special\":{\"dbtable\":\"#__tags\",\"key\":\"tag_id\",\"type\":\"TagTable\",\"prefix\":\"Joomla\\\\Component\\\\Tags\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"featured\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"urls\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"null\", \"asset_id\":\"null\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\"}}', 'TagsHelperRoute::getTagRoute', '{\"formFile\":\"administrator\\/components\\/com_tags\\/forms\\/tag.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"lft\", \"rgt\", \"level\", \"path\", \"urls\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"],\"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(9, 'Banner', 'com_banners.banner', '{\"special\":{\"dbtable\":\"#__banners\",\"key\":\"id\",\"type\":\"BannerTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"name\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created\",\"core_modified_time\":\"modified\",\"core_body\":\"description\", \"core_hits\":\"null\",\"core_publish_up\":\"publish_up\",\"core_publish_down\":\"publish_down\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"images\", \"core_urls\":\"link\", \"core_version\":\"version\", \"core_ordering\":\"ordering\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"catid\", \"asset_id\":\"null\"}, \"special\":{\"imptotal\":\"imptotal\", \"impmade\":\"impmade\", \"clicks\":\"clicks\", \"clickurl\":\"clickurl\", \"custombannercode\":\"custombannercode\", \"cid\":\"cid\", \"purchase_type\":\"purchase_type\", \"track_impressions\":\"track_impressions\", \"track_clicks\":\"track_clicks\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/forms\\/banner.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\", \"reset\"],\"ignoreChanges\":[\"modified_by\", \"modified\", \"checked_out\", \"checked_out_time\", \"version\", \"imptotal\", \"impmade\", \"reset\"], \"convertToInt\":[\"publish_up\", \"publish_down\", \"ordering\"], \"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"cid\",\"targetTable\":\"#__banner_clients\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"created_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"modified_by\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"} ]}'),
(10, 'Banners Category', 'com_banners.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\": {\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"asset_id\",\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}'),
(11, 'Banner Client', 'com_banners.client', '{\"special\":{\"dbtable\":\"#__banner_clients\",\"key\":\"id\",\"type\":\"ClientTable\",\"prefix\":\"Joomla\\\\Component\\\\Banners\\\\Administrator\\\\Table\\\\\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_banners\\/forms\\/client.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\"], \"ignoreChanges\":[\"checked_out\", \"checked_out_time\"], \"convertToInt\":[], \"displayLookup\":[]}'),
(12, 'User Notes', 'com_users.note', '{\"special\":{\"dbtable\":\"#__user_notes\",\"key\":\"id\",\"type\":\"NoteTable\",\"prefix\":\"Joomla\\\\Component\\\\Users\\\\Administrator\\\\Table\\\\\"}}', '', '', '', '{\"formFile\":\"administrator\\/components\\/com_users\\/forms\\/note.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\", \"publish_up\", \"publish_down\"],\"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\"], \"convertToInt\":[\"publish_up\", \"publish_down\"],\"displayLookup\":[{\"sourceColumn\":\"catid\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}, {\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}]}'),
(13, 'User Notes Category', 'com_users.category', '{\"special\":{\"dbtable\":\"#__categories\",\"key\":\"id\",\"type\":\"CategoryTable\",\"prefix\":\"Joomla\\\\Component\\\\Categories\\\\Administrator\\\\Table\\\\\",\"config\":\"array()\"},\"common\":{\"dbtable\":\"#__ucm_content\",\"key\":\"ucm_id\",\"type\":\"Corecontent\",\"prefix\":\"Joomla\\\\CMS\\\\Table\\\\\",\"config\":\"array()\"}}', '', '{\"common\":{\"core_content_item_id\":\"id\",\"core_title\":\"title\",\"core_state\":\"published\",\"core_alias\":\"alias\",\"core_created_time\":\"created_time\",\"core_modified_time\":\"modified_time\",\"core_body\":\"description\", \"core_hits\":\"hits\",\"core_publish_up\":\"null\",\"core_publish_down\":\"null\",\"core_access\":\"access\", \"core_params\":\"params\", \"core_featured\":\"null\", \"core_metadata\":\"metadata\", \"core_language\":\"language\", \"core_images\":\"null\", \"core_urls\":\"null\", \"core_version\":\"version\", \"core_ordering\":\"null\", \"core_metakey\":\"metakey\", \"core_metadesc\":\"metadesc\", \"core_catid\":\"parent_id\", \"asset_id\":\"asset_id\"}, \"special\":{\"parent_id\":\"parent_id\",\"lft\":\"lft\",\"rgt\":\"rgt\",\"level\":\"level\",\"path\":\"path\",\"extension\":\"extension\",\"note\":\"note\"}}', '', '{\"formFile\":\"administrator\\/components\\/com_categories\\/forms\\/category.xml\", \"hideFields\":[\"checked_out\",\"checked_out_time\",\"version\",\"lft\",\"rgt\",\"level\",\"path\",\"extension\"], \"ignoreChanges\":[\"modified_user_id\", \"modified_time\", \"checked_out\", \"checked_out_time\", \"version\", \"hits\", \"path\"], \"convertToInt\":[\"publish_up\", \"publish_down\"], \"displayLookup\":[{\"sourceColumn\":\"created_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"}, {\"sourceColumn\":\"access\",\"targetTable\":\"#__viewlevels\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"},{\"sourceColumn\":\"modified_user_id\",\"targetTable\":\"#__users\",\"targetColumn\":\"id\",\"displayColumn\":\"name\"},{\"sourceColumn\":\"parent_id\",\"targetTable\":\"#__categories\",\"targetColumn\":\"id\",\"displayColumn\":\"title\"}]}');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_extensions`
--

CREATE TABLE `hde5p_extensions` (
  `extension_id` int(11) NOT NULL,
  `package_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Parent package ID for extensions installed as a package.',
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `folder` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL,
  `enabled` tinyint(4) NOT NULL DEFAULT 0,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `protected` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Flag to indicate if the extension is protected. Protected extensions cannot be disabled.',
  `locked` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Flag to indicate if the extension is locked. Locked extensions cannot be uninstalled.',
  `manifest_cache` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `custom_data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) DEFAULT 0,
  `state` int(11) DEFAULT 0,
  `note` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_extensions`
--

INSERT INTO `hde5p_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(1, 0, 'com_wrapper', 'component', 'com_wrapper', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_wrapper\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\\n\\t\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"wrapper\"}', '', '', NULL, NULL, 0, 0, NULL),
(2, 0, 'com_admin', 'component', 'com_admin', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_admin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ADMIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(3, 0, 'com_banners', 'component', 'com_banners', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_banners\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{\"purchase_type\":\"3\",\"track_impressions\":\"0\",\"track_clicks\":\"0\",\"metakey_prefix\":\"\",\"save_history\":\"1\",\"history_limit\":10}', '', NULL, NULL, 0, 0, NULL),
(4, 0, 'com_cache', 'component', 'com_cache', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_cache\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CACHE_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(5, 0, 'com_categories', 'component', 'com_categories', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_categories\",\"type\":\"component\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(6, 0, 'com_checkin', 'component', 'com_checkin', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_checkin\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CHECKIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(7, 0, 'com_contact', 'component', 'com_contact', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_contact\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{\"contact_layout\":\"_:default\",\"show_contact_category\":\"hide\",\"save_history\":\"1\",\"history_limit\":10,\"show_contact_list\":\"0\",\"presentation_style\":\"sliders\",\"show_tags\":\"1\",\"show_info\":\"1\",\"show_name\":\"1\",\"show_position\":\"1\",\"show_email\":\"0\",\"show_street_address\":\"1\",\"show_suburb\":\"1\",\"show_state\":\"1\",\"show_postcode\":\"1\",\"show_country\":\"1\",\"show_telephone\":\"1\",\"show_mobile\":\"1\",\"show_fax\":\"1\",\"show_webpage\":\"1\",\"show_image\":\"1\",\"show_misc\":\"1\",\"image\":\"\",\"allow_vcard\":\"0\",\"show_articles\":\"0\",\"articles_display_num\":\"10\",\"show_profile\":\"0\",\"show_user_custom_fields\":[\"-1\"],\"show_links\":\"0\",\"linka_name\":\"\",\"linkb_name\":\"\",\"linkc_name\":\"\",\"linkd_name\":\"\",\"linke_name\":\"\",\"contact_icons\":\"0\",\"icon_address\":\"\",\"icon_email\":\"\",\"icon_telephone\":\"\",\"icon_mobile\":\"\",\"icon_fax\":\"\",\"icon_misc\":\"\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"0\",\"maxLevel\":\"-1\",\"show_subcat_desc\":\"1\",\"show_empty_categories\":\"0\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_subcat_desc_cat\":\"1\",\"show_empty_categories_cat\":\"0\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"0\",\"show_pagination_limit\":\"0\",\"show_headings\":\"1\",\"show_image_heading\":\"0\",\"show_position_headings\":\"1\",\"show_email_headings\":\"0\",\"show_telephone_headings\":\"1\",\"show_mobile_headings\":\"0\",\"show_fax_headings\":\"0\",\"show_suburb_headings\":\"1\",\"show_state_headings\":\"1\",\"show_country_headings\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"initial_sort\":\"ordering\",\"captcha\":\"\",\"show_email_form\":\"1\",\"show_email_copy\":\"0\",\"banned_email\":\"\",\"banned_subject\":\"\",\"banned_text\":\"\",\"validate_session\":\"1\",\"custom_reply\":\"0\",\"redirect\":\"\",\"show_feed_link\":\"1\",\"sef_ids\":1,\"custom_fields_enable\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(8, 0, 'com_cpanel', 'component', 'com_cpanel', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_cpanel\",\"type\":\"component\",\"creationDate\":\"2007-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CPANEL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(9, 0, 'com_installer', 'component', 'com_installer', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_installer\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_INSTALLER_XML_DESCRIPTION\",\"group\":\"\"}', '{\"cachetimeout\":\"6\",\"minimum_stability\":\"4\"}', '', NULL, NULL, 0, 0, NULL),
(10, 0, 'com_languages', 'component', 'com_languages', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_languages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"administrator\":\"en-GB\",\"site\":\"en-GB\"}', '', NULL, NULL, 0, 0, NULL),
(11, 0, 'com_login', 'component', 'com_login', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_login\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_LOGIN_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(12, 0, 'com_media', 'component', 'com_media', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_media\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"COM_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{\"upload_maxsize\":\"10\",\"file_path\":\"images\",\"image_path\":\"images\",\"restrict_uploads\":\"1\",\"allowed_media_usergroup\":\"3\",\"restrict_uploads_extensions\":\"bmp,gif,jpg,jpeg,png,webp,ico,mp3,m4a,mp4a,ogg,mp4,mp4v,mpeg,mov,odg,odp,ods,odt,pdf,png,ppt,txt,xcf,xls,csv\",\"check_mime\":\"1\",\"image_extensions\":\"bmp,gif,jpg,png,jpeg,webp\",\"audio_extensions\":\"mp3,m4a,mp4a,ogg\",\"video_extensions\":\"mp4,mp4v,mpeg,mov,webm\",\"doc_extensions\":\"odg,odp,ods,odt,pdf,ppt,txt,xcf,xls,csv\",\"ignore_extensions\":\"\",\"upload_mime\":\"image\\/jpeg,image\\/gif,image\\/png,image\\/bmp,image\\/webp,audio\\/ogg,audio\\/mpeg,audio\\/mp4,video\\/mp4,video\\/webm,video\\/mpeg,video\\/quicktime,application\\/msword,application\\/excel,application\\/pdf,application\\/powerpoint,text\\/plain,application\\/x-zip\"}', '', NULL, NULL, 0, 0, NULL),
(13, 0, 'com_menus', 'component', 'com_menus', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_menus\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menus\"}', '{\"page_title\":\"\",\"show_page_heading\":0,\"page_heading\":\"\",\"pageclass_sfx\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(14, 0, 'com_messages', 'component', 'com_messages', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_messages\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MESSAGES_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(15, 0, 'com_modules', 'component', 'com_modules', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_modules\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"modules\"}', '', '', NULL, NULL, 0, 0, NULL),
(16, 0, 'com_newsfeeds', 'component', 'com_newsfeeds', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_newsfeeds\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{\"newsfeed_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_feed_image\":\"1\",\"show_feed_description\":\"1\",\"show_item_description\":\"1\",\"feed_character_count\":\"0\",\"feed_display_order\":\"des\",\"float_first\":\"right\",\"float_second\":\"right\",\"show_tags\":\"1\",\"category_layout\":\"_:default\",\"show_category_title\":\"1\",\"show_description\":\"1\",\"show_description_image\":\"1\",\"maxLevel\":\"-1\",\"show_empty_categories\":\"0\",\"show_subcat_desc\":\"1\",\"show_cat_items\":\"1\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_items_cat\":\"1\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_headings\":\"1\",\"show_articles\":\"0\",\"show_link\":\"1\",\"show_pagination\":\"1\",\"show_pagination_results\":\"1\",\"sef_ids\":1}', '', NULL, NULL, 0, 0, NULL),
(17, 0, 'com_plugins', 'component', 'com_plugins', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_plugins\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_PLUGINS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(18, 0, 'com_templates', 'component', 'com_templates', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_templates\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\"}', '{\"template_positions_display\":\"0\",\"upload_limit\":\"10\",\"image_formats\":\"gif,bmp,jpg,jpeg,png,webp\",\"source_formats\":\"txt,less,ini,xml,js,php,css,scss,sass,json\",\"font_formats\":\"woff,woff2,ttf,otf\",\"compressed_formats\":\"zip\"}', '', NULL, NULL, 0, 0, NULL),
(19, 0, 'com_content', 'component', 'com_content', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_content\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{\"article_layout\":\"_:default\",\"show_title\":\"1\",\"link_titles\":\"1\",\"show_intro\":\"1\",\"info_block_position\":\"0\",\"info_block_show_title\":\"1\",\"show_category\":\"0\",\"link_category\":\"1\",\"show_parent_category\":\"0\",\"link_parent_category\":\"0\",\"show_associations\":\"0\",\"flags\":\"1\",\"show_author\":\"0\",\"link_author\":\"0\",\"show_create_date\":\"0\",\"show_modify_date\":\"0\",\"show_publish_date\":\"0\",\"show_item_navigation\":\"1\",\"show_readmore\":\"1\",\"show_readmore_title\":\"1\",\"readmore_limit\":100,\"show_tags\":\"0\",\"record_hits\":\"1\",\"show_hits\":\"0\",\"show_noauth\":\"0\",\"urls_position\":0,\"captcha\":\"\",\"show_publishing_options\":\"1\",\"show_article_options\":\"1\",\"show_configure_edit_options\":\"1\",\"show_permissions\":\"1\",\"show_associations_edit\":\"1\",\"save_history\":\"1\",\"history_limit\":10,\"show_urls_images_frontend\":\"0\",\"show_urls_images_backend\":\"1\",\"targeta\":0,\"targetb\":0,\"targetc\":0,\"float_intro\":\"left\",\"float_fulltext\":\"left\",\"category_layout\":\"_:blog\",\"show_category_title\":\"0\",\"show_description\":\"0\",\"show_description_image\":\"0\",\"maxLevel\":\"1\",\"show_empty_categories\":\"0\",\"show_no_articles\":\"1\",\"show_category_heading_title_text\":\"1\",\"show_subcat_desc\":\"1\",\"show_cat_num_articles\":\"0\",\"show_cat_tags\":\"1\",\"show_base_description\":\"1\",\"maxLevelcat\":\"-1\",\"show_empty_categories_cat\":\"0\",\"show_subcat_desc_cat\":\"1\",\"show_cat_num_articles_cat\":\"1\",\"num_leading_articles\":1,\"blog_class_leading\":\"\",\"num_intro_articles\":4,\"blog_class\":\"\",\"num_columns\":1,\"multi_column_order\":\"0\",\"num_links\":4,\"show_subcategory_content\":\"0\",\"link_intro_image\":\"0\",\"show_pagination_limit\":\"1\",\"filter_field\":\"hide\",\"show_headings\":\"1\",\"list_show_date\":\"0\",\"date_format\":\"\",\"list_show_hits\":\"1\",\"list_show_author\":\"1\",\"display_num\":\"10\",\"orderby_pri\":\"order\",\"orderby_sec\":\"rdate\",\"order_date\":\"published\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"show_featured\":\"show\",\"show_feed_link\":\"1\",\"feed_summary\":\"0\",\"feed_show_readmore\":\"0\",\"sef_ids\":1,\"custom_fields_enable\":\"1\",\"workflow_enabled\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(20, 0, 'com_config', 'component', 'com_config', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_config\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"config\"}', '{\"filters\":{\"1\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"9\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"6\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"7\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"2\":{\"filter_type\":\"NH\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"3\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"4\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"5\":{\"filter_type\":\"BL\",\"filter_tags\":\"\",\"filter_attributes\":\"\"},\"8\":{\"filter_type\":\"NONE\",\"filter_tags\":\"\",\"filter_attributes\":\"\"}}}', '', NULL, NULL, 0, 0, NULL),
(21, 0, 'com_redirect', 'component', 'com_redirect', NULL, '', 1, 1, 0, 0, 1, '{\"name\":\"com_redirect\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(22, 0, 'com_users', 'component', 'com_users', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_users\",\"type\":\"component\",\"creationDate\":\"2006-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{\"allowUserRegistration\":\"0\",\"new_usertype\":\"2\",\"guest_usergroup\":\"9\",\"sendpassword\":\"0\",\"useractivation\":\"2\",\"mail_to_admin\":\"1\",\"captcha\":\"\",\"frontend_userparams\":\"1\",\"site_language\":\"0\",\"change_login_name\":\"0\",\"reset_count\":\"10\",\"reset_time\":\"1\",\"minimum_length\":\"12\",\"minimum_integers\":\"0\",\"minimum_symbols\":\"0\",\"minimum_uppercase\":\"0\",\"save_history\":\"1\",\"history_limit\":5,\"mailSubjectPrefix\":\"\",\"mailBodySuffix\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(23, 0, 'com_finder', 'component', 'com_finder', NULL, '', 1, 1, 0, 0, 1, '{\"name\":\"com_finder\",\"type\":\"component\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '{\"enabled\":\"0\",\"show_description\":\"1\",\"description_length\":255,\"allow_empty_query\":\"0\",\"show_url\":\"1\",\"show_autosuggest\":\"1\",\"show_suggested_query\":\"1\",\"show_explained_query\":\"1\",\"show_advanced\":\"1\",\"show_advanced_tips\":\"1\",\"expand_advanced\":\"0\",\"show_date_filters\":\"0\",\"sort_order\":\"relevance\",\"sort_direction\":\"desc\",\"highlight_terms\":\"1\",\"opensearch_name\":\"\",\"opensearch_description\":\"\",\"batch_size\":\"50\",\"title_multiplier\":\"1.7\",\"text_multiplier\":\"0.7\",\"meta_multiplier\":\"1.2\",\"path_multiplier\":\"2.0\",\"misc_multiplier\":\"0.3\",\"stem\":\"1\",\"stemmer\":\"snowball\",\"enable_logging\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(24, 0, 'com_joomlaupdate', 'component', 'com_joomlaupdate', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_joomlaupdate\",\"type\":\"component\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.3\",\"description\":\"COM_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\"}', '{\"updatesource\":\"default\",\"customurl\":\"\"}', '', NULL, NULL, 0, 0, NULL),
(25, 0, 'com_tags', 'component', 'com_tags', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_tags\",\"type\":\"component\",\"creationDate\":\"2013-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{\"tag_layout\":\"_:default\",\"save_history\":\"1\",\"history_limit\":5,\"show_tag_title\":\"0\",\"tag_list_show_tag_image\":\"0\",\"tag_list_show_tag_description\":\"0\",\"tag_list_image\":\"\",\"tag_list_orderby\":\"title\",\"tag_list_orderby_direction\":\"ASC\",\"show_headings\":\"0\",\"tag_list_show_date\":\"0\",\"tag_list_show_item_image\":\"0\",\"tag_list_show_item_description\":\"0\",\"tag_list_item_maximum_characters\":0,\"return_any_or_all\":\"1\",\"include_children\":\"0\",\"maximum\":200,\"tag_list_language_filter\":\"all\",\"tags_layout\":\"_:default\",\"all_tags_orderby\":\"title\",\"all_tags_orderby_direction\":\"ASC\",\"all_tags_show_tag_image\":\"0\",\"all_tags_show_tag_description\":\"0\",\"all_tags_tag_maximum_characters\":20,\"all_tags_show_tag_hits\":\"0\",\"filter_field\":\"1\",\"show_pagination_limit\":\"1\",\"show_pagination\":\"2\",\"show_pagination_results\":\"1\",\"tag_field_ajax_mode\":\"1\",\"show_feed_link\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(26, 0, 'com_contenthistory', 'component', 'com_contenthistory', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_contenthistory\",\"type\":\"component\",\"creationDate\":\"2013-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_CONTENTHISTORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contenthistory\"}', '', '', NULL, NULL, 0, 0, NULL),
(27, 0, 'com_ajax', 'component', 'com_ajax', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_ajax\",\"type\":\"component\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_AJAX_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ajax\"}', '', '', NULL, NULL, 0, 0, NULL),
(28, 0, 'com_postinstall', 'component', 'com_postinstall', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_postinstall\",\"type\":\"component\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_POSTINSTALL_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(29, 0, 'com_fields', 'component', 'com_fields', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_fields\",\"type\":\"component\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 0, 0, NULL),
(30, 0, 'com_associations', 'component', 'com_associations', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_associations\",\"type\":\"component\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_ASSOCIATIONS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(31, 0, 'com_privacy', 'component', 'com_privacy', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_privacy\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}', '', '', NULL, NULL, 0, 0, NULL),
(32, 0, 'com_actionlogs', 'component', 'com_actionlogs', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_actionlogs\",\"type\":\"component\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"COM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\"}', '{\"ip_logging\":0,\"csv_delimiter\":\",\",\"loggable_extensions\":[\"com_banners\",\"com_cache\",\"com_categories\",\"com_checkin\",\"com_config\",\"com_contact\",\"com_content\",\"com_installer\",\"com_media\",\"com_menus\",\"com_messages\",\"com_modules\",\"com_newsfeeds\",\"com_plugins\",\"com_redirect\",\"com_scheduler\",\"com_tags\",\"com_templates\",\"com_users\"]}', '', NULL, NULL, 0, 0, NULL),
(33, 0, 'com_workflow', 'component', 'com_workflow', NULL, '', 1, 1, 0, 1, 1, '{\"name\":\"com_workflow\",\"type\":\"component\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_WORKFLOW_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(34, 0, 'com_mails', 'component', 'com_mails', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"com_mails\",\"type\":\"component\",\"creationDate\":\"2019-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"COM_MAILS_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(35, 0, 'com_scheduler', 'component', 'com_scheduler', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"com_scheduler\",\"type\":\"component\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"COM_SCHEDULER_XML_DESCRIPTION\",\"group\":\"\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(36, 0, 'lib_joomla', 'library', 'joomla', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"lib_joomla\",\"type\":\"library\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"https:\\/\\/www.joomla.org\",\"version\":\"13.1\",\"description\":\"LIB_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 0, 0, NULL),
(37, 0, 'lib_phpass', 'library', 'phpass', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"lib_phpass\",\"type\":\"library\",\"creationDate\":\"2004-01\",\"author\":\"Solar Designer\",\"copyright\":\"\",\"authorEmail\":\"solar@openwall.com\",\"authorUrl\":\"https:\\/\\/www.openwall.com\\/phpass\\/\",\"version\":\"0.3\",\"description\":\"LIB_PHPASS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpass\"}', '', '', NULL, NULL, 0, 0, NULL),
(38, 0, 'mod_articles_archive', 'module', 'mod_articles_archive', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_archive\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_ARCHIVE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_archive\"}', '', '', NULL, NULL, 0, 0, NULL),
(39, 0, 'mod_articles_latest', 'module', 'mod_articles_latest', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(40, 0, 'mod_articles_popular', 'module', 'mod_articles_popular', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_popular\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_popular\"}', '', '', NULL, NULL, 0, 0, NULL),
(41, 0, 'mod_banners', 'module', 'mod_banners', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_banners\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_banners\"}', '', '', NULL, NULL, 0, 0, NULL),
(42, 0, 'mod_breadcrumbs', 'module', 'mod_breadcrumbs', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_breadcrumbs\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_BREADCRUMBS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_breadcrumbs\"}', '', '', NULL, NULL, 0, 0, NULL),
(43, 0, 'mod_custom', 'module', 'mod_custom', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', NULL, NULL, 0, 0, NULL),
(44, 0, 'mod_feed', 'module', 'mod_feed', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', NULL, NULL, 0, 0, NULL),
(45, 0, 'mod_footer', 'module', 'mod_footer', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_footer\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FOOTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_footer\"}', '', '', NULL, NULL, 0, 0, NULL),
(46, 0, 'mod_login', 'module', 'mod_login', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', NULL, NULL, 0, 0, NULL),
(47, 0, 'mod_menu', 'module', 'mod_menu', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', NULL, NULL, 0, 0, NULL),
(48, 0, 'mod_articles_news', 'module', 'mod_articles_news', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_news\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_NEWS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_news\"}', '', '', NULL, NULL, 0, 0, NULL),
(49, 0, 'mod_random_image', 'module', 'mod_random_image', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_random_image\",\"type\":\"module\",\"creationDate\":\"2006-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RANDOM_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_random_image\"}', '', '', NULL, NULL, 0, 0, NULL),
(50, 0, 'mod_related_items', 'module', 'mod_related_items', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_related_items\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_RELATED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_related_items\"}', '', '', NULL, NULL, 0, 0, NULL),
(51, 0, 'mod_stats', 'module', 'mod_stats', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_stats\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats\"}', '', '', NULL, NULL, 0, 0, NULL),
(52, 0, 'mod_syndicate', 'module', 'mod_syndicate', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_syndicate\",\"type\":\"module\",\"creationDate\":\"2006-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SYNDICATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_syndicate\"}', '', '', NULL, NULL, 0, 0, NULL),
(53, 0, 'mod_users_latest', 'module', 'mod_users_latest', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_users_latest\",\"type\":\"module\",\"creationDate\":\"2009-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_USERS_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_users_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(54, 0, 'mod_whosonline', 'module', 'mod_whosonline', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_whosonline\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WHOSONLINE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_whosonline\"}', '', '', NULL, NULL, 0, 0, NULL),
(55, 0, 'mod_wrapper', 'module', 'mod_wrapper', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_wrapper\",\"type\":\"module\",\"creationDate\":\"2004-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_WRAPPER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_wrapper\"}', '', '', NULL, NULL, 0, 0, NULL),
(56, 0, 'mod_articles_category', 'module', 'mod_articles_category', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_category\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_category\"}', '', '', NULL, NULL, 0, 0, NULL),
(57, 0, 'mod_articles_categories', 'module', 'mod_articles_categories', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_articles_categories\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_ARTICLES_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_articles_categories\"}', '', '', NULL, NULL, 0, 0, NULL),
(58, 0, 'mod_languages', 'module', 'mod_languages', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_languages\",\"type\":\"module\",\"creationDate\":\"2010-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"MOD_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_languages\"}', '', '', NULL, NULL, 0, 0, NULL),
(59, 0, 'mod_finder', 'module', 'mod_finder', NULL, '', 0, 1, 0, 0, 1, '{\"name\":\"mod_finder\",\"type\":\"module\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_finder\"}', '', '', NULL, NULL, 0, 0, NULL),
(60, 0, 'mod_custom', 'module', 'mod_custom', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_custom\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_CUSTOM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_custom\"}', '', '', NULL, NULL, 0, 0, NULL),
(61, 0, 'mod_feed', 'module', 'mod_feed', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_feed\",\"type\":\"module\",\"creationDate\":\"2005-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_FEED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_feed\"}', '', '', NULL, NULL, 0, 0, NULL),
(62, 0, 'mod_latest', 'module', 'mod_latest', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_latest\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LATEST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latest\"}', '', '', NULL, NULL, 0, 0, NULL),
(63, 0, 'mod_logged', 'module', 'mod_logged', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_logged\",\"type\":\"module\",\"creationDate\":\"2005-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGGED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_logged\"}', '', '', NULL, NULL, 0, 0, NULL),
(64, 0, 'mod_login', 'module', 'mod_login', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_login\",\"type\":\"module\",\"creationDate\":\"2005-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_LOGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_login\"}', '', '', NULL, NULL, 0, 0, NULL),
(65, 0, 'mod_loginsupport', 'module', 'mod_loginsupport', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_loginsupport\",\"type\":\"module\",\"creationDate\":\"2019-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_LOGINSUPPORT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_loginsupport\"}', '', '', NULL, NULL, 0, 0, NULL),
(66, 0, 'mod_menu', 'module', 'mod_menu', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_menu\",\"type\":\"module\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_menu\"}', '', '', NULL, NULL, 0, 0, NULL),
(67, 0, 'mod_popular', 'module', 'mod_popular', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_popular\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_popular\"}', '', '', NULL, NULL, 0, 0, NULL),
(68, 0, 'mod_quickicon', 'module', 'mod_quickicon', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_quickicon\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_QUICKICON_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_quickicon\"}', '', '', NULL, NULL, 0, 0, NULL),
(69, 0, 'mod_frontend', 'module', 'mod_frontend', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_frontend\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_FRONTEND_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_frontend\"}', '', '', NULL, NULL, 0, 0, NULL),
(70, 0, 'mod_messages', 'module', 'mod_messages', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_messages\"}', '', '', NULL, NULL, 0, 0, NULL),
(71, 0, 'mod_post_installation_messages', 'module', 'mod_post_installation_messages', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_post_installation_messages\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_POST_INSTALLATION_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_post_installation_messages\"}', '', '', NULL, NULL, 0, 0, NULL),
(72, 0, 'mod_user', 'module', 'mod_user', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_user\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_user\"}', '', '', NULL, NULL, 0, 0, NULL),
(73, 0, 'mod_title', 'module', 'mod_title', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_title\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TITLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_title\"}', '', '', NULL, NULL, 0, 0, NULL),
(74, 0, 'mod_toolbar', 'module', 'mod_toolbar', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_toolbar\",\"type\":\"module\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_TOOLBAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_toolbar\"}', '', '', NULL, NULL, 0, 0, NULL),
(75, 0, 'mod_multilangstatus', 'module', 'mod_multilangstatus', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_multilangstatus\",\"type\":\"module\",\"creationDate\":\"2011-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_MULTILANGSTATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_multilangstatus\"}', '{\"cache\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(76, 0, 'mod_version', 'module', 'mod_version', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_version\",\"type\":\"module\",\"creationDate\":\"2012-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2012 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_VERSION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_version\"}', '{\"cache\":\"0\"}', '', NULL, NULL, 0, 0, NULL),
(77, 0, 'mod_stats_admin', 'module', 'mod_stats_admin', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_stats_admin\",\"type\":\"module\",\"creationDate\":\"2004-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_stats_admin\"}', '{\"serverinfo\":\"0\",\"siteinfo\":\"0\",\"counter\":\"0\",\"increase\":\"0\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"static\"}', '', NULL, NULL, 0, 0, NULL),
(78, 0, 'mod_tags_popular', 'module', 'mod_tags_popular', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_tags_popular\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_POPULAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_popular\"}', '{\"maximum\":\"5\",\"timeframe\":\"alltime\",\"owncache\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(79, 0, 'mod_tags_similar', 'module', 'mod_tags_similar', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"mod_tags_similar\",\"type\":\"module\",\"creationDate\":\"2013-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.1.0\",\"description\":\"MOD_TAGS_SIMILAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_tags_similar\"}', '{\"maximum\":\"5\",\"matchtype\":\"any\",\"owncache\":\"1\"}', '', NULL, NULL, 0, 0, NULL),
(80, 0, 'mod_sampledata', 'module', 'mod_sampledata', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_sampledata\",\"type\":\"module\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"MOD_SAMPLEDATA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_sampledata\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(81, 0, 'mod_latestactions', 'module', 'mod_latestactions', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_latestactions\",\"type\":\"module\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_LATESTACTIONS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_latestactions\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(82, 0, 'mod_privacy_dashboard', 'module', 'mod_privacy_dashboard', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_privacy_dashboard\",\"type\":\"module\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"MOD_PRIVACY_DASHBOARD_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_dashboard\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(83, 0, 'mod_submenu', 'module', 'mod_submenu', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_submenu\",\"type\":\"module\",\"creationDate\":\"2006-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"MOD_SUBMENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_submenu\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(84, 0, 'mod_privacy_status', 'module', 'mod_privacy_status', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"mod_privacy_status\",\"type\":\"module\",\"creationDate\":\"2019-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"MOD_PRIVACY_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"mod_privacy_status\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(85, 0, 'plg_actionlog_joomla', 'plugin', 'joomla', NULL, 'actionlog', 0, 1, 1, 0, 1, '{\"name\":\"plg_actionlog_joomla\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_ACTIONLOG_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(86, 0, 'plg_api-authentication_basic', 'plugin', 'basic', NULL, 'api-authentication', 0, 0, 1, 0, 1, '{\"name\":\"plg_api-authentication_basic\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_BASIC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"basic\"}', '{}', '', NULL, NULL, 1, 0, NULL);
INSERT INTO `hde5p_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(87, 0, 'plg_api-authentication_token', 'plugin', 'token', NULL, 'api-authentication', 0, 1, 1, 0, 1, '{\"name\":\"plg_api-authentication_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_API-AUTHENTICATION_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"token\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(88, 0, 'plg_authentication_cookie', 'plugin', 'cookie', NULL, 'authentication', 0, 1, 1, 0, 1, '{\"name\":\"plg_authentication_cookie\",\"type\":\"plugin\",\"creationDate\":\"2013-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_COOKIE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cookie\"}', '', '', NULL, NULL, 1, 0, NULL),
(89, 0, 'plg_authentication_joomla', 'plugin', 'joomla', NULL, 'authentication', 0, 1, 1, 1, 1, '{\"name\":\"plg_authentication_joomla\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_AUTHENTICATION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 2, 0, NULL),
(90, 0, 'plg_authentication_ldap', 'plugin', 'ldap', NULL, 'authentication', 0, 0, 1, 0, 1, '{\"name\":\"plg_authentication_ldap\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LDAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"ldap\"}', '{\"host\":\"\",\"port\":\"389\",\"use_ldapV3\":\"0\",\"negotiate_tls\":\"0\",\"no_referrals\":\"0\",\"auth_method\":\"bind\",\"base_dn\":\"\",\"search_string\":\"\",\"users_dn\":\"\",\"username\":\"admin\",\"password\":\"bobby7\",\"ldap_fullname\":\"fullName\",\"ldap_email\":\"mail\",\"ldap_uid\":\"uid\"}', '', NULL, NULL, 3, 0, NULL),
(91, 0, 'plg_behaviour_taggable', 'plugin', 'taggable', NULL, 'behaviour', 0, 1, 1, 0, 1, '{\"name\":\"plg_behaviour_taggable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_TAGGABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"taggable\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(92, 0, 'plg_behaviour_versionable', 'plugin', 'versionable', NULL, 'behaviour', 0, 1, 1, 0, 1, '{\"name\":\"plg_behaviour_versionable\",\"type\":\"plugin\",\"creationDate\":\"2015-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_BEHAVIOUR_VERSIONABLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"versionable\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(93, 0, 'plg_captcha_recaptcha', 'plugin', 'recaptcha', NULL, 'captcha', 0, 0, 1, 0, 1, '{\"name\":\"plg_captcha_recaptcha\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.4.0\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', NULL, NULL, 1, 0, NULL),
(94, 0, 'plg_captcha_recaptcha_invisible', 'plugin', 'recaptcha_invisible', NULL, 'captcha', 0, 0, 1, 0, 1, '{\"name\":\"plg_captcha_recaptcha_invisible\",\"type\":\"plugin\",\"creationDate\":\"2017-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8\",\"description\":\"PLG_CAPTCHA_RECAPTCHA_INVISIBLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"recaptcha_invisible\"}', '{\"public_key\":\"\",\"private_key\":\"\",\"theme\":\"clean\"}', '', NULL, NULL, 2, 0, NULL),
(95, 0, 'plg_content_confirmconsent', 'plugin', 'confirmconsent', NULL, 'content', 0, 0, 1, 0, 1, '{\"name\":\"plg_content_confirmconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_CONTENT_CONFIRMCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"confirmconsent\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(96, 0, 'plg_content_contact', 'plugin', 'contact', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_contact\",\"type\":\"plugin\",\"creationDate\":\"2014-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2014 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.2\",\"description\":\"PLG_CONTENT_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', NULL, NULL, 2, 0, NULL),
(97, 0, 'plg_content_emailcloak', 'plugin', 'emailcloak', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_emailcloak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_EMAILCLOAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"emailcloak\"}', '{\"mode\":\"1\"}', '', NULL, NULL, 3, 0, NULL),
(98, 0, 'plg_content_fields', 'plugin', 'fields', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_CONTENT_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 4, 0, NULL),
(99, 0, 'plg_content_finder', 'plugin', 'finder', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_finder\",\"type\":\"plugin\",\"creationDate\":\"2011-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', NULL, NULL, 5, 0, NULL),
(100, 0, 'plg_content_joomla', 'plugin', 'joomla', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 6, 0, NULL),
(101, 0, 'plg_content_loadmodule', 'plugin', 'loadmodule', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_loadmodule\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOADMODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"loadmodule\"}', '{\"style\":\"xhtml\"}', '', NULL, NULL, 7, 0, NULL),
(102, 0, 'plg_content_pagebreak', 'plugin', 'pagebreak', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTENT_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '{\"title\":\"1\",\"multipage_toc\":\"1\",\"showall\":\"1\"}', '', NULL, NULL, 8, 0, NULL),
(103, 0, 'plg_content_pagenavigation', 'plugin', 'pagenavigation', NULL, 'content', 0, 1, 1, 0, 1, '{\"name\":\"plg_content_pagenavigation\",\"type\":\"plugin\",\"creationDate\":\"2006-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_PAGENAVIGATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagenavigation\"}', '{\"position\":\"1\"}', '', NULL, NULL, 9, 0, NULL),
(104, 0, 'plg_content_vote', 'plugin', 'vote', NULL, 'content', 0, 0, 1, 0, 1, '{\"name\":\"plg_content_vote\",\"type\":\"plugin\",\"creationDate\":\"2005-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_VOTE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"vote\"}', '', '', NULL, NULL, 10, 0, NULL),
(105, 0, 'plg_editors-xtd_article', 'plugin', 'article', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_article\",\"type\":\"plugin\",\"creationDate\":\"2009-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_ARTICLE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"article\"}', '', '', NULL, NULL, 1, 0, NULL),
(106, 0, 'plg_editors-xtd_contact', 'plugin', 'contact', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_contact\",\"type\":\"plugin\",\"creationDate\":\"2016-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '', '', NULL, NULL, 2, 0, NULL),
(107, 0, 'plg_editors-xtd_fields', 'plugin', 'fields', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_fields\",\"type\":\"plugin\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 3, 0, NULL),
(108, 0, 'plg_editors-xtd_image', 'plugin', 'image', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_image\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_IMAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"image\"}', '', '', NULL, NULL, 4, 0, NULL),
(109, 0, 'plg_editors-xtd_menu', 'plugin', 'menu', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_menu\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_EDITORS-XTD_MENU_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menu\"}', '', '', NULL, NULL, 5, 0, NULL),
(110, 0, 'plg_editors-xtd_module', 'plugin', 'module', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_module\",\"type\":\"plugin\",\"creationDate\":\"2015-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_MODULE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"module\"}', '', '', NULL, NULL, 6, 0, NULL),
(111, 0, 'plg_editors-xtd_pagebreak', 'plugin', 'pagebreak', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_pagebreak\",\"type\":\"plugin\",\"creationDate\":\"2004-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EDITORSXTD_PAGEBREAK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"pagebreak\"}', '', '', NULL, NULL, 7, 0, NULL),
(112, 0, 'plg_editors-xtd_readmore', 'plugin', 'readmore', NULL, 'editors-xtd', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors-xtd_readmore\",\"type\":\"plugin\",\"creationDate\":\"2006-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_READMORE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"readmore\"}', '', '', NULL, NULL, 8, 0, NULL),
(113, 0, 'plg_editors_codemirror', 'plugin', 'codemirror', NULL, 'editors', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors_codemirror\",\"type\":\"plugin\",\"creationDate\":\"28 March 2011\",\"author\":\"Marijn Haverbeke\",\"copyright\":\"Copyright (C) 2014 - 2021 by Marijn Haverbeke <marijnh@gmail.com> and others\",\"authorEmail\":\"marijnh@gmail.com\",\"authorUrl\":\"https:\\/\\/codemirror.net\\/\",\"version\":\"5.65.6\",\"description\":\"PLG_CODEMIRROR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"codemirror\"}', '{\"lineNumbers\":\"1\",\"lineWrapping\":\"1\",\"matchTags\":\"1\",\"matchBrackets\":\"1\",\"marker-gutter\":\"1\",\"autoCloseTags\":\"1\",\"autoCloseBrackets\":\"1\",\"autoFocus\":\"1\",\"theme\":\"default\",\"tabmode\":\"indent\"}', '', NULL, NULL, 1, 0, NULL),
(114, 0, 'plg_editors_none', 'plugin', 'none', NULL, 'editors', 0, 1, 1, 1, 1, '{\"name\":\"plg_editors_none\",\"type\":\"plugin\",\"creationDate\":\"2005-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_NONE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"none\"}', '', '', NULL, NULL, 2, 0, NULL),
(115, 0, 'plg_editors_tinymce', 'plugin', 'tinymce', NULL, 'editors', 0, 1, 1, 0, 1, '{\"name\":\"plg_editors_tinymce\",\"type\":\"plugin\",\"creationDate\":\"2005-08\",\"author\":\"Tiny Technologies, Inc\",\"copyright\":\"Tiny Technologies, Inc\",\"authorEmail\":\"N\\/A\",\"authorUrl\":\"https:\\/\\/www.tiny.cloud\",\"version\":\"5.10.7\",\"description\":\"PLG_TINY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tinymce\"}', '{\"configuration\":{\"toolbars\":{\"2\":{\"toolbar1\":[\"bold\",\"underline\",\"strikethrough\",\"|\",\"undo\",\"redo\",\"|\",\"bullist\",\"numlist\",\"|\",\"pastetext\"]},\"1\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"formatselect\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"code\",\"|\",\"hr\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"pastetext\",\"preview\"]},\"0\":{\"menu\":[\"edit\",\"insert\",\"view\",\"format\",\"table\",\"tools\"],\"toolbar1\":[\"bold\",\"italic\",\"underline\",\"strikethrough\",\"|\",\"alignleft\",\"aligncenter\",\"alignright\",\"alignjustify\",\"|\",\"styleselect\",\"|\",\"formatselect\",\"fontselect\",\"fontsizeselect\",\"|\",\"searchreplace\",\"|\",\"bullist\",\"numlist\",\"|\",\"outdent\",\"indent\",\"|\",\"undo\",\"redo\",\"|\",\"link\",\"unlink\",\"anchor\",\"image\",\"|\",\"code\",\"|\",\"forecolor\",\"backcolor\",\"|\",\"fullscreen\",\"|\",\"table\",\"|\",\"subscript\",\"superscript\",\"|\",\"charmap\",\"emoticons\",\"media\",\"hr\",\"ltr\",\"rtl\",\"|\",\"cut\",\"copy\",\"paste\",\"pastetext\",\"|\",\"visualchars\",\"visualblocks\",\"nonbreaking\",\"blockquote\",\"template\",\"|\",\"print\",\"preview\",\"codesample\",\"insertdatetime\",\"removeformat\"]}},\"setoptions\":{\"2\":{\"access\":[\"1\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"1\":{\"access\":[\"6\",\"2\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"0\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"},\"0\":{\"access\":[\"7\",\"4\",\"8\"],\"skin\":\"0\",\"skin_admin\":\"0\",\"mobile\":\"0\",\"drag_drop\":\"1\",\"path\":\"\",\"entity_encoding\":\"raw\",\"lang_mode\":\"1\",\"text_direction\":\"ltr\",\"content_css\":\"1\",\"content_css_custom\":\"\",\"relative_urls\":\"1\",\"newlines\":\"0\",\"use_config_textfilters\":\"0\",\"invalid_elements\":\"script,applet,iframe\",\"valid_elements\":\"\",\"extended_elements\":\"\",\"resizing\":\"1\",\"resize_horizontal\":\"1\",\"element_path\":\"1\",\"wordcount\":\"1\",\"image_advtab\":\"1\",\"advlist\":\"1\",\"autosave\":\"1\",\"contextmenu\":\"1\",\"custom_plugin\":\"\",\"custom_button\":\"\"}}},\"sets_amount\":3,\"html_height\":\"550\",\"html_width\":\"750\"}', '', NULL, NULL, 3, 0, NULL),
(116, 0, 'plg_extension_finder', 'plugin', 'finder', NULL, 'extension', 0, 1, 1, 0, 1, '{\"name\":\"plg_extension_finder\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_FINDER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"finder\"}', '', '', NULL, NULL, 1, 0, NULL),
(117, 0, 'plg_extension_joomla', 'plugin', 'joomla', NULL, 'extension', 0, 1, 1, 0, 1, '{\"name\":\"plg_extension_joomla\",\"type\":\"plugin\",\"creationDate\":\"2010-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_EXTENSION_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '', '', NULL, NULL, 2, 0, NULL),
(118, 0, 'plg_extension_namespacemap', 'plugin', 'namespacemap', NULL, 'extension', 0, 1, 1, 1, 1, '{\"name\":\"plg_extension_namespacemap\",\"type\":\"plugin\",\"creationDate\":\"2017-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_EXTENSION_NAMESPACEMAP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"namespacemap\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(119, 0, 'plg_fields_calendar', 'plugin', 'calendar', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_calendar\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CALENDAR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"calendar\"}', '', '', NULL, NULL, 1, 0, NULL),
(120, 0, 'plg_fields_checkboxes', 'plugin', 'checkboxes', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_checkboxes\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_CHECKBOXES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkboxes\"}', '', '', NULL, NULL, 2, 0, NULL),
(121, 0, 'plg_fields_color', 'plugin', 'color', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_color\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_COLOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"color\"}', '', '', NULL, NULL, 3, 0, NULL),
(122, 0, 'plg_fields_editor', 'plugin', 'editor', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_editor\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_EDITOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"editor\"}', '{\"buttons\":0,\"width\":\"100%\",\"height\":\"250px\",\"filter\":\"JComponentHelper::filterText\"}', '', NULL, NULL, 4, 0, NULL),
(123, 0, 'plg_fields_imagelist', 'plugin', 'imagelist', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_imagelist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_IMAGELIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"imagelist\"}', '', '', NULL, NULL, 5, 0, NULL),
(124, 0, 'plg_fields_integer', 'plugin', 'integer', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_integer\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_INTEGER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"integer\"}', '{\"multiple\":\"0\",\"first\":\"1\",\"last\":\"100\",\"step\":\"1\"}', '', NULL, NULL, 6, 0, NULL),
(125, 0, 'plg_fields_list', 'plugin', 'list', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_list\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_LIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"list\"}', '', '', NULL, NULL, 7, 0, NULL),
(126, 0, 'plg_fields_media', 'plugin', 'media', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_media\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '', '', NULL, NULL, 8, 0, NULL),
(127, 0, 'plg_fields_radio', 'plugin', 'radio', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_radio\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_RADIO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"radio\"}', '', '', NULL, NULL, 9, 0, NULL),
(128, 0, 'plg_fields_sql', 'plugin', 'sql', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_sql\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_SQL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sql\"}', '', '', NULL, NULL, 10, 0, NULL),
(129, 0, 'plg_fields_subform', 'plugin', 'subform', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_subform\",\"type\":\"plugin\",\"creationDate\":\"2017-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FIELDS_SUBFORM_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"subform\"}', '', '', NULL, NULL, 11, 0, NULL),
(130, 0, 'plg_fields_text', 'plugin', 'text', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_text\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"text\"}', '', '', NULL, NULL, 12, 0, NULL),
(131, 0, 'plg_fields_textarea', 'plugin', 'textarea', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_textarea\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_TEXTAREA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"textarea\"}', '{\"rows\":10,\"cols\":10,\"maxlength\":\"\",\"filter\":\"JComponentHelper::filterText\"}', '', NULL, NULL, 13, 0, NULL),
(132, 0, 'plg_fields_url', 'plugin', 'url', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_url\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_URL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"url\"}', '', '', NULL, NULL, 14, 0, NULL),
(133, 0, 'plg_fields_user', 'plugin', 'user', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_user\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '', '', NULL, NULL, 15, 0, NULL),
(134, 0, 'plg_fields_usergrouplist', 'plugin', 'usergrouplist', NULL, 'fields', 0, 1, 1, 0, 1, '{\"name\":\"plg_fields_usergrouplist\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_FIELDS_USERGROUPLIST_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"usergrouplist\"}', '', '', NULL, NULL, 16, 0, NULL),
(135, 0, 'plg_filesystem_local', 'plugin', 'local', NULL, 'filesystem', 0, 1, 1, 0, 1, '{\"name\":\"plg_filesystem_local\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_FILESYSTEM_LOCAL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"local\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(136, 0, 'plg_finder_categories', 'plugin', 'categories', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_categories\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CATEGORIES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"categories\"}', '', '', NULL, NULL, 1, 0, NULL),
(137, 0, 'plg_finder_contacts', 'plugin', 'contacts', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_contacts\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTACTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contacts\"}', '', '', NULL, NULL, 2, 0, NULL),
(138, 0, 'plg_finder_content', 'plugin', 'content', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_content\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '', '', NULL, NULL, 3, 0, NULL),
(139, 0, 'plg_finder_newsfeeds', 'plugin', 'newsfeeds', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '', '', NULL, NULL, 4, 0, NULL),
(140, 0, 'plg_finder_tags', 'plugin', 'tags', NULL, 'finder', 0, 1, 1, 0, 1, '{\"name\":\"plg_finder_tags\",\"type\":\"plugin\",\"creationDate\":\"2013-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_FINDER_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '', '', NULL, NULL, 5, 0, NULL),
(141, 0, 'plg_installer_folderinstaller', 'plugin', 'folderinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_folderinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_FOLDERINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"folderinstaller\"}', '', '', NULL, NULL, 2, 0, NULL),
(142, 0, 'plg_installer_override', 'plugin', 'override', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_override\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_OVERRIDE_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"override\"}', '', '', NULL, NULL, 4, 0, NULL),
(143, 0, 'plg_installer_packageinstaller', 'plugin', 'packageinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_packageinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_PACKAGEINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"packageinstaller\"}', '', '', NULL, NULL, 1, 0, NULL),
(144, 0, 'plg_installer_urlinstaller', 'plugin', 'urlinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_urlinstaller\",\"type\":\"plugin\",\"creationDate\":\"2016-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.6.0\",\"description\":\"PLG_INSTALLER_URLINSTALLER_PLUGIN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"urlinstaller\"}', '', '', NULL, NULL, 3, 0, NULL),
(145, 0, 'plg_installer_webinstaller', 'plugin', 'webinstaller', NULL, 'installer', 0, 1, 1, 0, 1, '{\"name\":\"plg_installer_webinstaller\",\"type\":\"plugin\",\"creationDate\":\"2017-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_INSTALLER_WEBINSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"webinstaller\"}', '{\"tab_position\":\"1\"}', '', NULL, NULL, 5, 0, NULL),
(146, 0, 'plg_media-action_crop', 'plugin', 'crop', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_crop\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_CROP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"crop\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(147, 0, 'plg_media-action_resize', 'plugin', 'resize', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_resize\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_RESIZE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"resize\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(148, 0, 'plg_media-action_rotate', 'plugin', 'rotate', NULL, 'media-action', 0, 1, 1, 0, 1, '{\"name\":\"plg_media-action_rotate\",\"type\":\"plugin\",\"creationDate\":\"2017-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_MEDIA-ACTION_ROTATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"rotate\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(149, 0, 'plg_privacy_actionlogs', 'plugin', 'actionlogs', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(150, 0, 'plg_privacy_consents', 'plugin', 'consents', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_consents\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONSENTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"consents\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(151, 0, 'plg_privacy_contact', 'plugin', 'contact', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_contact\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(152, 0, 'plg_privacy_content', 'plugin', 'content', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_content\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(153, 0, 'plg_privacy_message', 'plugin', 'message', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_message\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_MESSAGE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"message\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(154, 0, 'plg_privacy_user', 'plugin', 'user', NULL, 'privacy', 0, 1, 1, 0, 1, '{\"name\":\"plg_privacy_user\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_PRIVACY_USER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"user\"}', '{}', '', NULL, NULL, 6, 0, NULL),
(155, 0, 'plg_quickicon_joomlaupdate', 'plugin', 'joomlaupdate', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_joomlaupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_JOOMLAUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomlaupdate\"}', '', '', NULL, NULL, 1, 0, NULL),
(156, 0, 'plg_quickicon_extensionupdate', 'plugin', 'extensionupdate', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_extensionupdate\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_QUICKICON_EXTENSIONUPDATE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"extensionupdate\"}', '', '', NULL, NULL, 2, 0, NULL),
(157, 0, 'plg_quickicon_overridecheck', 'plugin', 'overridecheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_overridecheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_OVERRIDECHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"overridecheck\"}', '', '', NULL, NULL, 3, 0, NULL),
(158, 0, 'plg_quickicon_downloadkey', 'plugin', 'downloadkey', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_downloadkey\",\"type\":\"plugin\",\"creationDate\":\"2019-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_QUICKICON_DOWNLOADKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"downloadkey\"}', '', '', NULL, NULL, 4, 0, NULL),
(159, 0, 'plg_quickicon_privacycheck', 'plugin', 'privacycheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_privacycheck\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_QUICKICON_PRIVACYCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacycheck\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(160, 0, 'plg_quickicon_phpversioncheck', 'plugin', 'phpversioncheck', NULL, 'quickicon', 0, 1, 1, 0, 1, '{\"name\":\"plg_quickicon_phpversioncheck\",\"type\":\"plugin\",\"creationDate\":\"2016-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_QUICKICON_PHPVERSIONCHECK_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"phpversioncheck\"}', '', '', NULL, NULL, 6, 0, NULL),
(161, 0, 'plg_sampledata_blog', 'plugin', 'blog', NULL, 'sampledata', 0, 1, 1, 0, 1, '{\"name\":\"plg_sampledata_blog\",\"type\":\"plugin\",\"creationDate\":\"2017-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.0\",\"description\":\"PLG_SAMPLEDATA_BLOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"blog\"}', '', '', NULL, NULL, 1, 0, NULL),
(162, 0, 'plg_sampledata_multilang', 'plugin', 'multilang', NULL, 'sampledata', 0, 1, 1, 0, 1, '{\"name\":\"plg_sampledata_multilang\",\"type\":\"plugin\",\"creationDate\":\"2018-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SAMPLEDATA_MULTILANG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"multilang\"}', '', '', NULL, NULL, 2, 0, NULL),
(163, 0, 'plg_system_accessibility', 'plugin', 'accessibility', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_accessibility\",\"type\":\"plugin\",\"creationDate\":\"2020-02-15\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_ACCESSIBILITY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"accessibility\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(164, 0, 'plg_system_actionlogs', 'plugin', 'actionlogs', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_actionlogs\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_ACTIONLOGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"actionlogs\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(165, 0, 'plg_system_cache', 'plugin', 'cache', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_cache\",\"type\":\"plugin\",\"creationDate\":\"2007-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CACHE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"cache\"}', '{\"browsercache\":\"0\",\"cachetime\":\"15\"}', '', NULL, NULL, 3, 0, NULL),
(166, 0, 'plg_system_debug', 'plugin', 'debug', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_debug\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_DEBUG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"debug\"}', '{\"profile\":\"1\",\"queries\":\"1\",\"memory\":\"1\",\"language_files\":\"1\",\"language_strings\":\"1\",\"strip-first\":\"1\",\"strip-prefix\":\"\",\"strip-suffix\":\"\"}', '', NULL, NULL, 4, 0, NULL),
(167, 0, 'plg_system_fields', 'plugin', 'fields', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_fields\",\"type\":\"plugin\",\"creationDate\":\"2016-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.7.0\",\"description\":\"PLG_SYSTEM_FIELDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fields\"}', '', '', NULL, NULL, 5, 0, NULL),
(168, 0, 'plg_system_highlight', 'plugin', 'highlight', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_highlight\",\"type\":\"plugin\",\"creationDate\":\"2011-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_HIGHLIGHT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"highlight\"}', '', '', NULL, NULL, 6, 0, NULL),
(169, 0, 'plg_system_httpheaders', 'plugin', 'httpheaders', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_httpheaders\",\"type\":\"plugin\",\"creationDate\":\"2017-10\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_HTTPHEADERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"httpheaders\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(170, 0, 'plg_system_jooa11y', 'plugin', 'jooa11y', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_jooa11y\",\"type\":\"plugin\",\"creationDate\":\"2022-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_JOOA11Y_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"jooa11y\"}', '', '', NULL, NULL, 8, 0, NULL),
(171, 0, 'plg_system_languagecode', 'plugin', 'languagecode', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_languagecode\",\"type\":\"plugin\",\"creationDate\":\"2011-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2011 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGECODE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagecode\"}', '', '', NULL, NULL, 9, 0, NULL),
(172, 0, 'plg_system_languagefilter', 'plugin', 'languagefilter', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_languagefilter\",\"type\":\"plugin\",\"creationDate\":\"2010-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2010 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LANGUAGEFILTER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languagefilter\"}', '', '', NULL, NULL, 10, 0, NULL),
(173, 0, 'plg_system_log', 'plugin', 'log', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_log\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_LOG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"log\"}', '', '', NULL, NULL, 11, 0, NULL),
(174, 0, 'plg_system_logout', 'plugin', 'logout', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_logout\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_LOGOUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logout\"}', '', '', NULL, NULL, 12, 0, NULL),
(175, 0, 'plg_system_logrotation', 'plugin', 'logrotation', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_logrotation\",\"type\":\"plugin\",\"creationDate\":\"2018-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_LOGROTATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"logrotation\"}', '{\"lastrun\":1681179230}', '', NULL, NULL, 13, 0, NULL),
(176, 0, 'plg_system_privacyconsent', 'plugin', 'privacyconsent', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_privacyconsent\",\"type\":\"plugin\",\"creationDate\":\"2018-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_SYSTEM_PRIVACYCONSENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacyconsent\"}', '{}', '', NULL, NULL, 14, 0, NULL),
(177, 0, 'plg_system_redirect', 'plugin', 'redirect', NULL, 'system', 0, 0, 1, 0, 1, '{\"name\":\"plg_system_redirect\",\"type\":\"plugin\",\"creationDate\":\"2009-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SYSTEM_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '', '', NULL, NULL, 15, 0, NULL),
(178, 0, 'plg_system_remember', 'plugin', 'remember', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_remember\",\"type\":\"plugin\",\"creationDate\":\"2007-04\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_REMEMBER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"remember\"}', '', '', NULL, NULL, 16, 0, NULL);
INSERT INTO `hde5p_extensions` (`extension_id`, `package_id`, `name`, `type`, `element`, `changelogurl`, `folder`, `client_id`, `enabled`, `access`, `protected`, `locked`, `manifest_cache`, `params`, `custom_data`, `checked_out`, `checked_out_time`, `ordering`, `state`, `note`) VALUES
(179, 0, 'plg_system_schedulerunner', 'plugin', 'schedulerunner', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_schedulerunner\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_SCHEDULERUNNER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"schedulerunner\"}', '{}', '', NULL, NULL, 17, 0, NULL),
(180, 0, 'plg_system_sef', 'plugin', 'sef', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_sef\",\"type\":\"plugin\",\"creationDate\":\"2007-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2007 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_SEF_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sef\"}', '', '', NULL, NULL, 18, 0, NULL),
(181, 0, 'plg_system_sessiongc', 'plugin', 'sessiongc', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_sessiongc\",\"type\":\"plugin\",\"creationDate\":\"2018-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.8.6\",\"description\":\"PLG_SYSTEM_SESSIONGC_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sessiongc\"}', '', '', NULL, NULL, 19, 0, NULL),
(182, 0, 'plg_system_shortcut', 'plugin', 'shortcut', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_shortcut\",\"type\":\"plugin\",\"creationDate\":\"2022-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_SYSTEM_SHORTCUT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"shortcut\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(183, 0, 'plg_system_skipto', 'plugin', 'skipto', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_skipto\",\"type\":\"plugin\",\"creationDate\":\"2020-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_SKIPTO_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"skipto\"}', '{}', '', NULL, NULL, 20, 0, NULL),
(184, 0, 'plg_system_stats', 'plugin', 'stats', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_stats\",\"type\":\"plugin\",\"creationDate\":\"2013-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_STATS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"stats\"}', '', '', NULL, NULL, 21, 0, NULL),
(185, 0, 'plg_system_task_notification', 'plugin', 'tasknotification', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_task_notification\",\"type\":\"plugin\",\"creationDate\":\"2021-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_SYSTEM_TASK_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tasknotification\"}', '', '', NULL, NULL, 22, 0, NULL),
(186, 0, 'plg_system_updatenotification', 'plugin', 'updatenotification', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_updatenotification\",\"type\":\"plugin\",\"creationDate\":\"2015-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2015 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.5.0\",\"description\":\"PLG_SYSTEM_UPDATENOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"updatenotification\"}', '{\"lastrun\":1681957302}', '', NULL, NULL, 23, 0, NULL),
(187, 0, 'plg_system_webauthn', 'plugin', 'webauthn', NULL, 'system', 0, 1, 1, 0, 1, '{\"name\":\"plg_system_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2019-07-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_SYSTEM_WEBAUTHN_DESCRIPTION\",\"group\":\"\",\"filename\":\"webauthn\"}', '{}', '', NULL, NULL, 24, 0, NULL),
(188, 0, 'plg_task_check_files', 'plugin', 'checkfiles', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_check_files\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_CHECK_FILES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"checkfiles\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(189, 0, 'plg_task_demo_tasks', 'plugin', 'demotasks', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_demo_tasks\",\"type\":\"plugin\",\"creationDate\":\"2021-07\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_DEMO_TASKS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"demotasks\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(190, 0, 'plg_task_requests', 'plugin', 'requests', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_requests\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_REQUESTS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"requests\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(191, 0, 'plg_task_site_status', 'plugin', 'sitestatus', NULL, 'task', 0, 1, 1, 0, 1, '{\"name\":\"plg_task_site_status\",\"type\":\"plugin\",\"creationDate\":\"2021-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1\",\"description\":\"PLG_TASK_SITE_STATUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"sitestatus\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(192, 0, 'plg_multifactorauth_totp', 'plugin', 'totp', NULL, 'multifactorauth', 0, 1, 1, 0, 1, '{\"name\":\"plg_multifactorauth_totp\",\"type\":\"plugin\",\"creationDate\":\"2013-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_TOTP_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"totp\"}', '', '', NULL, NULL, 1, 0, NULL),
(193, 0, 'plg_multifactorauth_yubikey', 'plugin', 'yubikey', NULL, 'multifactorauth', 0, 1, 1, 0, 1, '{\"name\":\"plg_multifactorauth_yubikey\",\"type\":\"plugin\",\"creationDate\":\"2013-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2013 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_YUBIKEY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"yubikey\"}', '', '', NULL, NULL, 2, 0, NULL),
(194, 0, 'plg_multifactorauth_webauthn', 'plugin', 'webauthn', NULL, 'multifactorauth', 0, 1, 1, 0, 1, '{\"name\":\"plg_multifactorauth_webauthn\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_WEBAUTHN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"webauthn\"}', '', '', NULL, NULL, 3, 0, NULL),
(195, 0, 'plg_multifactorauth_email', 'plugin', 'email', NULL, 'multifactorauth', 0, 1, 1, 0, 1, '{\"name\":\"plg_multifactorauth_email\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_EMAIL_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"email\"}', '', '', NULL, NULL, 4, 0, NULL),
(196, 0, 'plg_multifactorauth_fixed', 'plugin', 'fixed', NULL, 'multifactorauth', 0, 0, 1, 0, 1, '{\"name\":\"plg_multifactorauth_fixed\",\"type\":\"plugin\",\"creationDate\":\"2022-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2022 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.0\",\"description\":\"PLG_MULTIFACTORAUTH_FIXED_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"fixed\"}', '', '', NULL, NULL, 5, 0, NULL),
(197, 0, 'plg_user_contactcreator', 'plugin', 'contactcreator', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_contactcreator\",\"type\":\"plugin\",\"creationDate\":\"2009-08\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2009 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_CONTACTCREATOR_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contactcreator\"}', '{\"autowebpage\":\"\",\"category\":\"4\",\"autopublish\":\"0\"}', '', NULL, NULL, 1, 0, NULL),
(198, 0, 'plg_user_joomla', 'plugin', 'joomla', NULL, 'user', 0, 1, 1, 0, 1, '{\"name\":\"plg_user_joomla\",\"type\":\"plugin\",\"creationDate\":\"2006-12\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_JOOMLA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"joomla\"}', '{\"autoregister\":\"1\",\"mail_to_user\":\"1\",\"forceLogout\":\"1\"}', '', NULL, NULL, 2, 0, NULL),
(199, 0, 'plg_user_profile', 'plugin', 'profile', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_profile\",\"type\":\"plugin\",\"creationDate\":\"2008-01\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2008 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.0.0\",\"description\":\"PLG_USER_PROFILE_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"profile\"}', '{\"register-require_address1\":\"1\",\"register-require_address2\":\"1\",\"register-require_city\":\"1\",\"register-require_region\":\"1\",\"register-require_country\":\"1\",\"register-require_postal_code\":\"1\",\"register-require_phone\":\"1\",\"register-require_website\":\"1\",\"register-require_favoritebook\":\"1\",\"register-require_aboutme\":\"1\",\"register-require_tos\":\"1\",\"register-require_dob\":\"1\",\"profile-require_address1\":\"1\",\"profile-require_address2\":\"1\",\"profile-require_city\":\"1\",\"profile-require_region\":\"1\",\"profile-require_country\":\"1\",\"profile-require_postal_code\":\"1\",\"profile-require_phone\":\"1\",\"profile-require_website\":\"1\",\"profile-require_favoritebook\":\"1\",\"profile-require_aboutme\":\"1\",\"profile-require_tos\":\"1\",\"profile-require_dob\":\"1\"}', '', NULL, NULL, 3, 0, NULL),
(200, 0, 'plg_user_terms', 'plugin', 'terms', NULL, 'user', 0, 0, 1, 0, 1, '{\"name\":\"plg_user_terms\",\"type\":\"plugin\",\"creationDate\":\"2018-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2018 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TERMS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"terms\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(201, 0, 'plg_user_token', 'plugin', 'token', NULL, 'user', 0, 1, 1, 0, 1, '{\"name\":\"plg_user_token\",\"type\":\"plugin\",\"creationDate\":\"2019-11\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"3.9.0\",\"description\":\"PLG_USER_TOKEN_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"token\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(202, 0, 'plg_webservices_banners', 'plugin', 'banners', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_banners\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_BANNERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"banners\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(203, 0, 'plg_webservices_config', 'plugin', 'config', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_config\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONFIG_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"config\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(204, 0, 'plg_webservices_contact', 'plugin', 'contact', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_contact\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTACT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"contact\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(205, 0, 'plg_webservices_content', 'plugin', 'content', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_content\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_CONTENT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"content\"}', '{}', '', NULL, NULL, 4, 0, NULL),
(206, 0, 'plg_webservices_installer', 'plugin', 'installer', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_installer\",\"type\":\"plugin\",\"creationDate\":\"2020-06\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_INSTALLER_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"installer\"}', '{}', '', NULL, NULL, 5, 0, NULL),
(207, 0, 'plg_webservices_languages', 'plugin', 'languages', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_languages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_LANGUAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"languages\"}', '{}', '', NULL, NULL, 6, 0, NULL),
(208, 0, 'plg_webservices_media', 'plugin', 'media', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_media\",\"type\":\"plugin\",\"creationDate\":\"2021-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2021 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.1.0\",\"description\":\"PLG_WEBSERVICES_MEDIA_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"media\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(209, 0, 'plg_webservices_menus', 'plugin', 'menus', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_menus\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MENUS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"menus\"}', '{}', '', NULL, NULL, 7, 0, NULL),
(210, 0, 'plg_webservices_messages', 'plugin', 'messages', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_messages\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MESSAGES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"messages\"}', '{}', '', NULL, NULL, 8, 0, NULL),
(211, 0, 'plg_webservices_modules', 'plugin', 'modules', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_modules\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_MODULES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"modules\"}', '{}', '', NULL, NULL, 9, 0, NULL),
(212, 0, 'plg_webservices_newsfeeds', 'plugin', 'newsfeeds', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_newsfeeds\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_NEWSFEEDS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"newsfeeds\"}', '{}', '', NULL, NULL, 10, 0, NULL),
(213, 0, 'plg_webservices_plugins', 'plugin', 'plugins', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_plugins\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PLUGINS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"plugins\"}', '{}', '', NULL, NULL, 11, 0, NULL),
(214, 0, 'plg_webservices_privacy', 'plugin', 'privacy', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_privacy\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_PRIVACY_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"privacy\"}', '{}', '', NULL, NULL, 12, 0, NULL),
(215, 0, 'plg_webservices_redirect', 'plugin', 'redirect', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_redirect\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_REDIRECT_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"redirect\"}', '{}', '', NULL, NULL, 13, 0, NULL),
(216, 0, 'plg_webservices_tags', 'plugin', 'tags', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_tags\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TAGS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"tags\"}', '{}', '', NULL, NULL, 14, 0, NULL),
(217, 0, 'plg_webservices_templates', 'plugin', 'templates', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_templates\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_TEMPLATES_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"templates\"}', '{}', '', NULL, NULL, 15, 0, NULL),
(218, 0, 'plg_webservices_users', 'plugin', 'users', NULL, 'webservices', 0, 1, 1, 0, 1, '{\"name\":\"plg_webservices_users\",\"type\":\"plugin\",\"creationDate\":\"2019-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WEBSERVICES_USERS_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"users\"}', '{}', '', NULL, NULL, 16, 0, NULL),
(219, 0, 'plg_workflow_featuring', 'plugin', 'featuring', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_featuring\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_FEATURING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"featuring\"}', '{}', '', NULL, NULL, 1, 0, NULL),
(220, 0, 'plg_workflow_notification', 'plugin', 'notification', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_notification\",\"type\":\"plugin\",\"creationDate\":\"2020-05\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_NOTIFICATION_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"notification\"}', '{}', '', NULL, NULL, 2, 0, NULL),
(221, 0, 'plg_workflow_publishing', 'plugin', 'publishing', NULL, 'workflow', 0, 1, 1, 0, 1, '{\"name\":\"plg_workflow_publishing\",\"type\":\"plugin\",\"creationDate\":\"2020-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.0.0\",\"description\":\"PLG_WORKFLOW_PUBLISHING_XML_DESCRIPTION\",\"group\":\"\",\"filename\":\"publishing\"}', '{}', '', NULL, NULL, 3, 0, NULL),
(222, 0, 'atum', 'template', 'atum', NULL, '', 1, 1, 1, 0, 1, '{\"name\":\"atum\",\"type\":\"template\",\"creationDate\":\"2016-09\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2016 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_ATUM_XML_DESCRIPTION\",\"group\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}', '', '', NULL, NULL, 0, 0, NULL),
(223, 0, 'cassiopeia', 'template', 'cassiopeia', NULL, '', 0, 1, 1, 0, 1, '{\"name\":\"cassiopeia\",\"type\":\"template\",\"creationDate\":\"2017-02\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2017 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"\",\"version\":\"1.0\",\"description\":\"TPL_CASSIOPEIA_XML_DESCRIPTION\",\"group\":\"\",\"inheritable\":true,\"filename\":\"templateDetails\"}', '{\"logoFile\":\"\",\"fluidContainer\":\"0\",\"sidebarLeftWidth\":\"3\",\"sidebarRightWidth\":\"3\"}', '', NULL, NULL, 0, 0, NULL),
(224, 0, 'files_joomla', 'file', 'joomla', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"files_joomla\",\"type\":\"file\",\"creationDate\":\"2023-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.9\",\"description\":\"FILES_JOOMLA_XML_DESCRIPTION\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(225, 0, 'English (en-GB) Language Pack', 'package', 'pkg_en-GB', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"English (en-GB) Language Pack\",\"type\":\"package\",\"creationDate\":\"2023-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2019 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.9.1\",\"description\":\"en-GB language pack\",\"group\":\"\",\"filename\":\"pkg_en-GB\"}', '', '', NULL, NULL, 0, 0, NULL),
(226, 225, 'English (en-GB)', 'language', 'en-GB', NULL, '', 0, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2006 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.9\",\"description\":\"en-GB site language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(227, 225, 'English (en-GB)', 'language', 'en-GB', NULL, '', 1, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2005 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.9\",\"description\":\"en-GB administrator language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(228, 225, 'English (en-GB)', 'language', 'en-GB', NULL, '', 3, 1, 1, 1, 1, '{\"name\":\"English (en-GB)\",\"type\":\"language\",\"creationDate\":\"2023-03\",\"author\":\"Joomla! Project\",\"copyright\":\"(C) 2020 Open Source Matters, Inc.\",\"authorEmail\":\"admin@joomla.org\",\"authorUrl\":\"www.joomla.org\",\"version\":\"4.2.9\",\"description\":\"en-GB api language\",\"group\":\"\"}', '', '', NULL, NULL, 0, 0, NULL),
(230, 0, 'System - Helix Ultimate Framework', 'plugin', 'helixultimate', '', 'system', 0, 1, 1, 0, 0, '{\"name\":\"System - Helix Ultimate Framework\",\"type\":\"plugin\",\"creationDate\":\"Feb 2018\",\"author\":\"JoomShaper.com\",\"copyright\":\"Copyright (C) 2010 - 2023 JoomShaper. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"www.joomshaper.com\",\"version\":\"2.0.12\",\"description\":\"Helix Ultimate Framework - Joomla Template Framework by JoomShaper\",\"group\":\"\",\"filename\":\"helixultimate\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(231, 0, 'et_journey', 'template', 'et_journey', '', '', 0, 1, 1, 0, 0, '{\"name\":\"et_journey\",\"type\":\"template\",\"creationDate\":\"July 2021\",\"author\":\"Enginetemplates\",\"copyright\":\"Copyright (C) 2013 - 2021 Enginetemplates.com. All rights reserved.\",\"authorEmail\":\"info@enginetemplates.com\",\"authorUrl\":\"https:\\/\\/www.enginetemplates.com\",\"version\":\"4.0\",\"description\":\"ET Journey Joomla template\",\"group\":\"\",\"filename\":\"templateDetails\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(233, 0, 'wt_mambo_free', 'template', 'wt_mambo_free', '', '', 0, 1, 1, 0, 0, '{\"name\":\"wt_mambo_free\",\"type\":\"template\",\"creationDate\":\"February 2017\",\"author\":\"WarpTheme.com\",\"copyright\":\"Copyright (C) 2015 - 2023 WarpTheme.com. All rights reserved.\",\"authorEmail\":\"info@warptheme.com\",\"authorUrl\":\"https:\\/\\/warptheme.com\",\"version\":\"2.0.9\",\"description\":\"Business, Consulting and Professional Services Joomla Template - WT Mambo. For general information on template features, troubleshooting and support, visit WarpTheme.com\\n    \",\"group\":\"\",\"filename\":\"templateDetails\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(234, 0, 'SP Simple Portfolio', 'component', 'com_spsimpleportfolio', '', '', 1, 1, 0, 0, 0, '{\"name\":\"SP Simple Portfolio\",\"type\":\"component\",\"creationDate\":\"December 2015\",\"author\":\"JoomShaper\",\"copyright\":\"Copyright (c) 2010- 2022 JoomShaper. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"http:\\/\\/www.joomshaper.com\",\"version\":\"2.0.7\",\"description\":\"Simple Portfolio Component for Joomla\",\"group\":\"\",\"filename\":\"spsimpleportfolio\"}', '{\"sef_ids\":1,\"crop_position\":\"center\",\"square\":\"600x600\",\"rectangle\":\"600x400\",\"tower\":\"600X800\"}', '', NULL, NULL, 0, 0, NULL),
(235, 0, 'SP Simple Portfolio Module', 'module', 'mod_spsimpleportfolio', '', '', 0, 1, 0, 0, 0, '{\"name\":\"SP Simple Portfolio Module\",\"type\":\"module\",\"creationDate\":\"December 2014\",\"author\":\"JoomShaper\",\"copyright\":\"Copyright (C) 2010 - 2022 JoomShaper. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"www.joomshaper.com\",\"version\":\"2.0.7\",\"description\":\"Module to display latest item from SP Simple Portfolio\",\"group\":\"\",\"filename\":\"mod_spsimpleportfolio\"}', '{\"show_filter\":\"1\",\"category_id\":\"\",\"layout_type\":\"default\",\"columns\":\"3\",\"thumbnail_type\":\"masonry\",\"popup_image\":\"default\",\"ordering\":\"ordering:ASC\",\"limit\":\"12\",\"cache\":\"1\",\"cache_time\":\"900\"}', '', NULL, NULL, 0, 0, NULL),
(236, 0, 'COM_SPEASYIMAGEGALLERY', 'component', 'com_speasyimagegallery', '', '', 1, 1, 0, 0, 0, '{\"name\":\"COM_SPEASYIMAGEGALLERY\",\"type\":\"component\",\"creationDate\":\"Mar 2017\",\"author\":\"JoomShaper\",\"copyright\":\"@JoomShaper 2010 - 2021. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"http:\\/\\/www.joomshaper.com\",\"version\":\"2.0.2\",\"description\":\"A simple image gallery component for Joomla.\",\"group\":\"\",\"filename\":\"speasyimagegallery\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(237, 0, 'SP Easy Image Gallery Module', 'module', 'mod_speasyimagegallery', '', '', 0, 1, 0, 0, 0, '{\"name\":\"SP Easy Image Gallery Module\",\"type\":\"module\",\"creationDate\":\"Mar 2016\",\"author\":\"JoomShaper\",\"copyright\":\"@JoomShaper 2010 - 2021. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"http:\\/\\/www.joomshaper.com\",\"version\":\"2.0.2\",\"description\":\"Module to display albums or album images from SP Easy Image Gallery component.\",\"group\":\"\",\"filename\":\"mod_speasyimagegallery\"}', '{\"layout\":\"album\",\"albums_column\":\"3\",\"albums_column_sm\":\"4\",\"albums_column_xs\":\"6\",\"albums_gutter\":\"20\",\"albums_gutter_sm\":\"15\",\"albums_gutter_xs\":\"10\",\"album_limit\":\"8\",\"album_layout\":\"default\",\"album_column\":\"3\",\"album_column_sm\":\"4\",\"album_column_xs\":\"6\",\"album_gutter\":\"20\",\"album_gutter_sm\":\"15\",\"album_gutter_xs\":\"10\",\"show_title\":\"1\",\"show_desc\":\"1\",\"show_count\":\"1\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', '', NULL, NULL, 0, 0, NULL),
(238, 0, 'SP Page Builder', 'component', 'com_sppagebuilder', '', '', 1, 1, 0, 0, 0, '{\"name\":\"SP Page Builder\",\"type\":\"component\",\"creationDate\":\"Sep 2014\",\"author\":\"JoomShaper\",\"copyright\":\"Copyright @ 2010 - 2023 JoomShaper. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"https:\\/\\/www.joomshaper.com\",\"version\":\"4.0.10\",\"description\":\"\",\"group\":\"\",\"filename\":\"sppagebuilder\"}', '{}', '', NULL, NULL, 0, 0, NULL),
(239, 0, 'SP Page Builder', 'module', 'mod_sppagebuilder', '', '', 0, 1, 0, 0, 0, '{\"name\":\"SP Page Builder\",\"type\":\"module\",\"creationDate\":\"Oct 2016\",\"author\":\"JoomShaper\",\"copyright\":\"Copyright (C) 2010 - 2023 JoomShaper.com. All rights reserved.\",\"authorEmail\":\"support@joomshaper.com\",\"authorUrl\":\"www.joomshaper.com\",\"version\":\"4.0.10\",\"description\":\"Module to display content from SP Page Builder\",\"group\":\"\",\"filename\":\"mod_sppagebuilder\"}', '{\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', '', NULL, NULL, 0, 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_fields`
--

CREATE TABLE `hde5p_fields` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `label` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `default_value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'text',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `required` tinyint(4) NOT NULL DEFAULT 0,
  `only_use_in_subform` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `fieldparams` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created_time` datetime NOT NULL,
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_fields_categories`
--

CREATE TABLE `hde5p_fields_categories` (
  `field_id` int(11) NOT NULL DEFAULT 0,
  `category_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_fields_groups`
--

CREATE TABLE `hde5p_fields_groups` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `context` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `access` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_fields_values`
--

CREATE TABLE `hde5p_fields_values` (
  `field_id` int(10) UNSIGNED NOT NULL,
  `item_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Allow references to items which have strings as ids, eg. none db systems.',
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_filters`
--

CREATE TABLE `hde5p_finder_filters` (
  `filter_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `map_count` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `data` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `params` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_links`
--

CREATE TABLE `hde5p_finder_links` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `route` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(400) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `indexdate` datetime NOT NULL,
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `state` int(11) NOT NULL DEFAULT 1,
  `access` int(11) NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `publish_start_date` datetime DEFAULT NULL,
  `publish_end_date` datetime DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `end_date` datetime DEFAULT NULL,
  `list_price` double UNSIGNED NOT NULL DEFAULT 0,
  `sale_price` double UNSIGNED NOT NULL DEFAULT 0,
  `type_id` int(11) NOT NULL,
  `object` mediumblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_finder_links`
--

INSERT INTO `hde5p_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(1, 'index.php?option=com_content&view=category&id=8', 'index.php?option=com_content&view=category&id=8', 'Lorem Ipsum', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem nulla pharetra diam sit amet. Cras semper auctor neque vitae tempus quam pellentesque nec. Dolor sit amet consectetur adipiscing elit. Mauris vitae ultricies leo integer malesuada nunc. ', '2023-04-11 05:17:37', '2bce3b05640a66213b83a5df3bf23b03', 1, 0, 1, '*', NULL, NULL, '2023-04-11 05:17:37', NULL, 0, 0, 1, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3333353a22204c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e204f726e6172652061726375206f64696f2075742073656d206e756c6c61207068617265747261206469616d2073697420616d65742e20437261732073656d70657220617563746f72206e657175652076697461652074656d707573207175616d2070656c6c656e746573717565206e65632e20446f6c6f722073697420616d657420636f6e73656374657475722061646970697363696e6720656c69742e204d617572697320766974616520756c74726963696573206c656f20696e7465676572206d616c657375616461206e756e632e20223b693a333b613a31373a7b733a323a226964223b693a383b733a353a22616c696173223b733a31313a226c6f72656d20697073756d223b733a393a22657874656e73696f6e223b733a31313a22636f6d5f636f6e74656e74223b733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a323a7b733a363a22617574686f72223b733a303a22223b733a363a22726f626f7473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a333a226c6674223b693a323b733a393a22706172656e745f6964223b693a323b733a353a226c6576656c223b693a323b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a31353a2263617465676f72795f6c61796f7574223b733a303a22223b733a353a22696d616765223b733a303a22223b733a393a22696d6167655f616c74223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2273756d6d617279223b733a3334303a223c703e4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e204f726e6172652061726375206f64696f2075742073656d206e756c6c61207068617265747261206469616d2073697420616d65742e20437261732073656d70657220617563746f72206e657175652076697461652074656d707573207175616d2070656c6c656e746573717565206e65632e20446f6c6f722073697420616d657420636f6e73656374657475722061646970697363696e6720656c69742e204d617572697320766974616520756c74726963696573206c656f20696e7465676572206d616c657375616461206e756e632e3c2f703e223b733a31303a22637265617465645f6279223b693a3130313b733a383a226d6f646966696564223b733a31393a22323032332d30342d31312030353a31373a3337223b733a31313a226d6f6469666965645f6279223b693a3130313b733a343a22736c7567223b733a31333a22383a6c6f72656d2d697073756d223b733a363a226c61796f7574223b733a383a2263617465676f7279223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b4e3b693a31303b4e3b693a31313b733a34373a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d38223b693a31323b4e3b693a31333b733a31393a22323032332d30342d31312030353a31373a3337223b693a31343b693a303b693a31353b613a323a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a383a2243617465676f7279223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31313a224c6f72656d20497073756d223b693a31373b693a313b693a31383b733a34373a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d38223b7d),
(4, 'index.php?option=com_content&view=article&id=1', 'index.php?option=com_content&view=article&id=1:lorem-ipsum&catid=2', 'Lorem Ipsum', ' Lorem ipsum dolor sit amet, articulo consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem nulla pharetra diam sit amet. Cras semper auctor neque vitae tempus quam pellentesque nec. Dolor sit amet consectetur adipiscing elit. Mauris vitae ultricies leo integer malesuada nunc. ', '2023-04-11 05:25:17', '2ca8fc4d3e2ad183b9baf6cc2974f6d4', 1, 1, 1, '*', '2023-04-11 05:19:41', NULL, '2023-04-11 05:19:41', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3334343a22204c6f72656d20697073756d20646f6c6f722073697420616d65742c206172746963756c6f20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e204f726e6172652061726375206f64696f2075742073656d206e756c6c61207068617265747261206469616d2073697420616d65742e20437261732073656d70657220617563746f72206e657175652076697461652074656d707573207175616d2070656c6c656e746573717565206e65632e20446f6c6f722073697420616d657420636f6e73656374657475722061646970697363696e6720656c69742e204d617572697320766974616520756c74726963696573206c656f20696e7465676572206d616c657375616461206e756e632e20223b693a333b613a32353a7b733a323a226964223b693a313b733a353a22616c696173223b733a31313a226c6f72656d20697073756d223b733a373a2273756d6d617279223b733a3334393a223c703e4c6f72656d20697073756d20646f6c6f722073697420616d65742c206172746963756c6f20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e204f726e6172652061726375206f64696f2075742073656d206e756c6c61207068617265747261206469616d2073697420616d65742e20437261732073656d70657220617563746f72206e657175652076697461652074656d707573207175616d2070656c6c656e746573717565206e65632e20446f6c6f722073697420616d657420636f6e73656374657475722061646970697363696e6720656c69742e204d617572697320766974616520756c74726963696573206c656f20696e7465676572206d616c657375616461206e756e632e3c2f703e223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a323b733a31303a22637265617465645f6279223b693a3130313b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30342d31312030353a32353a3137223b733a31313a226d6f6469666965645f6279223b693a3130313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38373a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2231223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2231223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2231223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2231223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2230223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b733a32393a2268656c69785f756c74696d6174655f61727469636c655f666f726d6174223b733a383a227374616e64617264223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a333b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31333a22556e63617465676f7269736564223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a31333a22313a6c6f72656d2d697073756d223b733a373a22636174736c7567223b733a31353a22323a756e63617465676f7269736564223b733a363a22617574686f72223b733a373a224465764a617675223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30342d31312030353a31393a3431223b693a31303b4e3b693a31313b733a36363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d313a6c6f72656d2d697073756d2663617469643d32223b693a31323b4e3b693a31333b733a31393a22323032332d30342d31312030353a31393a3431223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a363b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a224465764a617675223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a383b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31333a22556e63617465676f7269736564223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31303b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31313a224c6f72656d20497073756d223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d31223b7d),
(9, 'index.php?option=com_content&view=category&id=10', 'index.php?option=com_content&view=category&id=10', 'Announcement', '', '2023-04-20 02:30:18', '783dcb422311405af4f1817f1336398f', 1, 1, 1, '*', NULL, NULL, '2023-04-20 02:30:06', NULL, 0, 0, 1, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a303a22223b693a333b613a31373a7b733a323a226964223b693a31303b733a353a22616c696173223b733a31323a22616e6e6f756e63656d656e74223b733a393a22657874656e73696f6e223b733a31313a22636f6d5f636f6e74656e74223b733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a323a7b733a363a22617574686f72223b733a303a22223b733a363a22726f626f7473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a333a226c6674223b693a31353b733a393a22706172656e745f6964223b693a313b733a353a226c6576656c223b693a313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a31353a2263617465676f72795f6c61796f7574223b733a303a22223b733a353a22696d616765223b733a303a22223b733a393a22696d6167655f616c74223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2273756d6d617279223b733a303a22223b733a31303a22637265617465645f6279223b693a3130313b733a383a226d6f646966696564223b733a31393a22323032332d30342d32302030323a33303a3138223b733a31313a226d6f6469666965645f6279223b693a3130313b733a343a22736c7567223b733a31353a2231303a616e6e6f756e63656d656e74223b733a363a226c61796f7574223b733a383a2263617465676f7279223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b4e3b693a31303b4e3b693a31313b733a34383a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d3130223b693a31323b4e3b693a31333b733a31393a22323032332d30342d32302030323a33303a3036223b693a31343b693a313b693a31353b613a323a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a383a2243617465676f7279223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31323a22416e6e6f756e63656d656e74223b693a31373b693a313b693a31383b733a34383a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d3130223b7d),
(10, 'index.php?option=com_content&view=category&id=11', 'index.php?option=com_content&view=category&id=11', 'Ongoing Programs', '', '2023-04-20 02:30:39', '3cb6506988f6f4df0ac177b9e476df4b', 1, 1, 1, '*', NULL, NULL, '2023-04-20 02:30:39', NULL, 0, 0, 1, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a303a22223b693a333b613a31373a7b733a323a226964223b693a31313b733a353a22616c696173223b733a31363a226f6e676f696e672070726f6772616d73223b733a393a22657874656e73696f6e223b733a31313a22636f6d5f636f6e74656e74223b733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a323a7b733a363a22617574686f72223b733a303a22223b733a363a22726f626f7473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a333a226c6674223b693a31373b733a393a22706172656e745f6964223b693a313b733a353a226c6576656c223b693a313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a31353a2263617465676f72795f6c61796f7574223b733a303a22223b733a353a22696d616765223b733a303a22223b733a393a22696d6167655f616c74223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2273756d6d617279223b733a303a22223b733a31303a22637265617465645f6279223b693a3130313b733a383a226d6f646966696564223b733a31393a22323032332d30342d32302030323a33303a3339223b733a31313a226d6f6469666965645f6279223b693a3130313b733a343a22736c7567223b733a31393a2231313a6f6e676f696e672d70726f6772616d73223b733a363a226c61796f7574223b733a383a2263617465676f7279223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a343a226c696e6b223b693a343b733a373a226d6574616b6579223b693a353b733a383a226d65746164657363223b693a363b733a31303a226d657461617574686f72223b693a373b733a363a22617574686f72223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b4e3b693a31303b4e3b693a31313b733a34383a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d3131223b693a31323b4e3b693a31333b733a31393a22323032332d30342d32302030323a33303a3339223b693a31343b693a313b693a31353b613a323a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a383a2243617465676f7279223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a333b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31363a224f6e676f696e672050726f6772616d73223b693a31373b693a313b693a31383b733a34383a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d63617465676f72792669643d3131223b7d),
(11, 'index.php?option=com_content&view=article&id=2', 'index.php?option=com_content&view=article&id=2:ongoing-programs&catid=2', 'Ongoing Programs', ' Ongoing Programs Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Etiam non quam lacus suspendisse. Viverra adipiscing at in tellus integer. In nulla posuere sollicitudin aliquam ultrices sagittis orci a. Sit amet porttitor eget dolor morbi non. ', '2023-04-20 02:40:47', '331b7aeabdccd8223685a2e7a851c669', 1, 1, 1, '*', '2023-04-11 13:30:05', NULL, '2023-04-11 13:30:05', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3332323a22204f6e676f696e672050726f6772616d73204c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e20457469616d206e6f6e207175616d206c616375732073757370656e64697373652e20566976657272612061646970697363696e6720617420696e2074656c6c757320696e74656765722e20496e206e756c6c6120706f737565726520736f6c6c696369747564696e20616c697175616d20756c747269636573207361676974746973206f72636920612e2053697420616d657420706f72747469746f72206567657420646f6c6f72206d6f726269206e6f6e2e20223b693a333b613a32353a7b733a323a226964223b693a323b733a353a22616c696173223b733a31363a226f6e676f696e672070726f6772616d73223b733a373a2273756d6d617279223b733a3339343a223c6831207374796c653d22746578742d616c69676e3a2063656e7465723b223e4f6e676f696e672050726f6772616d733c2f68313e0d0a3c70207374796c653d22746578742d616c69676e3a206a7573746966793b223e4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e20457469616d206e6f6e207175616d206c616375732073757370656e64697373652e20566976657272612061646970697363696e6720617420696e2074656c6c757320696e74656765722e20496e206e756c6c6120706f737565726520736f6c6c696369747564696e20616c697175616d20756c747269636573207361676974746973206f72636920612e2053697420616d657420706f72747469746f72206567657420646f6c6f72206d6f726269206e6f6e2e3c2f703e223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a323b733a31303a22637265617465645f6279223b693a3130313b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30342d32302030323a34303a3437223b733a31313a226d6f6469666965645f6279223b693a3130313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38373a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2230223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2230223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2230223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2230223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2230223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b733a32393a2268656c69785f756c74696d6174655f61727469636c655f666f726d6174223b733a383a227374616e64617264223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a323b733a383a226f72646572696e67223b693a333b733a383a2263617465676f7279223b733a31333a22556e63617465676f7269736564223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a31383a22323a6f6e676f696e672d70726f6772616d73223b733a373a22636174736c7567223b733a31353a22323a756e63617465676f7269736564223b733a363a22617574686f72223b733a373a224465764a617675223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30342d31312031333a33303a3035223b693a31303b4e3b693a31313b733a37313a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d323a6f6e676f696e672d70726f6772616d732663617469643d32223b693a31323b4e3b693a31333b733a31393a22323032332d30342d31312031333a33303a3035223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a363b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a224465764a617675223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a383b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31333a22556e63617465676f7269736564223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31303b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31363a224f6e676f696e672050726f6772616d73223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d32223b7d);
INSERT INTO `hde5p_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(14, 'index.php?option=com_content&view=article&id=4', 'index.php?option=com_content&view=article&id=4:announcement-2&catid=10', 'Announcement 2', ' Article 2 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis. ', '2023-04-20 02:42:06', 'd6de8e19864cdefb295a524ce171f38a', 1, 1, 1, '*', '2023-04-11 13:52:14', NULL, '2023-04-11 13:52:14', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3239353a222041727469636c652032204c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e2045676573746173207075727573207669766572726120616363756d73616e20696e206e69736c2e20456e696d2073697420616d65742076656e656e617469732075726e61206375727375732e20566976616d757320617263752066656c697320626962656e64756d2075742074726973746971756520657420656765737461732e20416d6574207269737573206e756c6c616d20656765742066656c69732e20223b693a333b613a32353a7b733a323a226964223b693a343b733a353a22616c696173223b733a31343a22616e6e6f756e63656d656e742032223b733a373a2273756d6d617279223b733a3331303a223c68313e41727469636c6520323c2f68313e0d0a3c703e4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e2045676573746173207075727573207669766572726120616363756d73616e20696e206e69736c2e20456e696d2073697420616d65742076656e656e617469732075726e61206375727375732e20566976616d757320617263752066656c697320626962656e64756d2075742074726973746971756520657420656765737461732e20416d6574207269737573206e756c6c616d20656765742066656c69732e3c2f703e223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a31303b733a31303a22637265617465645f6279223b693a3130313b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30342d32302030323a34323a3036223b733a31313a226d6f6469666965645f6279223b693a3130313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38373a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2230223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2230223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2230223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2230223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2230223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b733a32393a2268656c69785f756c74696d6174655f61727469636c655f666f726d6174223b733a383a227374616e64617264223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a333b733a383a226f72646572696e67223b693a313b733a383a2263617465676f7279223b733a31323a22416e6e6f756e63656d656e74223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a31363a22343a616e6e6f756e63656d656e742d32223b733a373a22636174736c7567223b733a31353a2231303a616e6e6f756e63656d656e74223b733a363a22617574686f72223b733a373a224465764a617675223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30342d31312031333a35323a3134223b693a31303b4e3b693a31313b733a37303a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d343a616e6e6f756e63656d656e742d322663617469643d3130223b693a31323b4e3b693a31333b733a31393a22323032332d30342d31312031333a35323a3134223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a363b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a224465764a617675223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a383b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31323a22416e6e6f756e63656d656e74223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31313b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31343a22416e6e6f756e63656d656e742032223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d34223b7d),
(17, 'index.php?option=com_content&view=article&id=6', 'index.php?option=com_content&view=article&id=6:ongoing-program-1&catid=11', 'Ongoing Program 1', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu sem integer vitae justo eget magna fermentum. Feugiat in ante metus dictum at. Urna condimentum mattis pellentesque id. Dictum sit amet justo donec enim. Pellentesque id nibh tortor id. Et malesuada fames ac turpis egestas. Dictum at tempor commodo ullamcorper a. Nulla malesuada pellentesque elit eget gravida cum sociis natoque. Tincidunt id aliquet risus feugiat in ante metus. Cras semper auctor neque vitae tempus quam pellentesque nec. Gravida neque convallis a cras semper auctor neque vitae. Nulla porttitor massa id neque aliquam vestibulum. Ac odio tempor orci dapibus ultrices in iaculis. Commodo nulla facilisi nullam vehicula. Semper feugiat nibh sed pulvinar. Morbi tristique senectus et netus et malesuada fames. Elit pellentesque habitant morbi tristique. Dolor sed viverra ipsum nunc. Tempus urna et pharetra pharetra massa massa ultricies. Facilisis sed odio morbi quis commodo odio aenean sed. Turpis cursus in hac habitasse platea. ', '2023-04-20 02:51:33', '5b743178715d24edf8257eff9ea16607', 1, 1, 1, '*', '2023-04-20 02:51:33', NULL, '2023-04-20 02:51:33', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a313038303a22204c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e2045752073656d20696e7465676572207669746165206a7573746f2065676574206d61676e61206665726d656e74756d2e204665756769617420696e20616e7465206d657475732064696374756d2061742e2055726e6120636f6e64696d656e74756d206d61747469732070656c6c656e7465737175652069642e2044696374756d2073697420616d6574206a7573746f20646f6e656320656e696d2e2050656c6c656e746573717565206964206e69626820746f72746f722069642e204574206d616c6573756164612066616d65732061632074757270697320656765737461732e2044696374756d2061742074656d706f7220636f6d6d6f646f20756c6c616d636f7270657220612e204e756c6c61206d616c6573756164612070656c6c656e74657371756520656c6974206567657420677261766964612063756d20736f63696973206e61746f7175652e2054696e636964756e7420696420616c6971756574207269737573206665756769617420696e20616e7465206d657475732e20437261732073656d70657220617563746f72206e657175652076697461652074656d707573207175616d2070656c6c656e746573717565206e65632e2047726176696461206e6571756520636f6e76616c6c6973206120637261732073656d70657220617563746f72206e657175652076697461652e204e756c6c6120706f72747469746f72206d61737361206964206e6571756520616c697175616d20766573746962756c756d2e204163206f64696f2074656d706f72206f726369206461706962757320756c74726963657320696e20696163756c69732e20436f6d6d6f646f206e756c6c6120666163696c697369206e756c6c616d207665686963756c612e2053656d7065722066657567696174206e696268207365642070756c76696e61722e204d6f726269207472697374697175652073656e6563747573206574206e65747573206574206d616c6573756164612066616d65732e20456c69742070656c6c656e746573717565206861626974616e74206d6f726269207472697374697175652e20446f6c6f7220736564207669766572726120697073756d206e756e632e2054656d7075732075726e61206574207068617265747261207068617265747261206d61737361206d6173736120756c747269636965732e20466163696c6973697320736564206f64696f206d6f726269207175697320636f6d6d6f646f206f64696f2061656e65616e207365642e205475727069732063757273757320696e206861632068616269746173736520706c617465612e20223b693a333b613a32353a7b733a323a226964223b693a363b733a353a22616c696173223b733a31373a226f6e676f696e672070726f6772616d2031223b733a373a2273756d6d617279223b733a313039333a223c703e4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e2045752073656d20696e7465676572207669746165206a7573746f2065676574206d61676e61206665726d656e74756d2e204665756769617420696e20616e7465206d657475732064696374756d2061742e2055726e6120636f6e64696d656e74756d206d61747469732070656c6c656e7465737175652069642e2044696374756d2073697420616d6574206a7573746f20646f6e656320656e696d2e2050656c6c656e746573717565206964206e69626820746f72746f722069642e204574206d616c6573756164612066616d65732061632074757270697320656765737461732e2044696374756d2061742074656d706f7220636f6d6d6f646f20756c6c616d636f7270657220612e204e756c6c61206d616c6573756164612070656c6c656e74657371756520656c6974206567657420677261766964612063756d20736f63696973206e61746f7175652e2054696e636964756e7420696420616c6971756574207269737573206665756769617420696e20616e7465206d657475732e20437261732073656d70657220617563746f72206e657175652076697461652074656d707573207175616d2070656c6c656e746573717565206e65632e3c2f703e0d0a3c703e47726176696461206e6571756520636f6e76616c6c6973206120637261732073656d70657220617563746f72206e657175652076697461652e204e756c6c6120706f72747469746f72206d61737361206964206e6571756520616c697175616d20766573746962756c756d2e204163206f64696f2074656d706f72206f726369206461706962757320756c74726963657320696e20696163756c69732e20436f6d6d6f646f206e756c6c6120666163696c697369206e756c6c616d207665686963756c612e2053656d7065722066657567696174206e696268207365642070756c76696e61722e204d6f726269207472697374697175652073656e6563747573206574206e65747573206574206d616c6573756164612066616d65732e20456c69742070656c6c656e746573717565206861626974616e74206d6f726269207472697374697175652e20446f6c6f7220736564207669766572726120697073756d206e756e632e2054656d7075732075726e61206574207068617265747261207068617265747261206d61737361206d6173736120756c747269636965732e20466163696c6973697320736564206f64696f206d6f726269207175697320636f6d6d6f646f206f64696f2061656e65616e207365642e205475727069732063757273757320696e206861632068616269746173736520706c617465612e3c2f703e223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a31313b733a31303a22637265617465645f6279223b693a3130313b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30342d32302030323a35313a3333223b733a31313a226d6f6469666965645f6279223b693a3130313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38373a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2230223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2230223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2230223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2230223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2230223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b733a32393a2268656c69785f756c74696d6174655f61727469636c655f666f726d6174223b733a383a227374616e64617264223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a313b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31363a224f6e676f696e672050726f6772616d73223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a31393a22363a6f6e676f696e672d70726f6772616d2d31223b733a373a22636174736c7567223b733a31393a2231313a6f6e676f696e672d70726f6772616d73223b733a363a22617574686f72223b733a373a224465764a617675223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30342d32302030323a35313a3333223b693a31303b4e3b693a31313b733a37333a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d363a6f6e676f696e672d70726f6772616d2d312663617469643d3131223b693a31323b4e3b693a31333b733a31393a22323032332d30342d32302030323a35313a3333223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a363b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a224465764a617675223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a383b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31363a224f6e676f696e672050726f6772616d73223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31323b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31373a224f6e676f696e672050726f6772616d2031223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d36223b7d),
(18, 'index.php?option=com_content&view=article&id=5', 'index.php?option=com_content&view=article&id=5:announcement-3&catid=10', 'Announcement 3', ' Article 3 Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis. ', '2023-04-20 05:09:39', 'd7c1ce1409396b69299ff90bc6882e90', 1, 1, 1, '*', '2023-04-11 13:52:34', NULL, '2023-04-11 13:52:34', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a3239353a222041727469636c652033204c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e2045676573746173207075727573207669766572726120616363756d73616e20696e206e69736c2e20456e696d2073697420616d65742076656e656e617469732075726e61206375727375732e20566976616d757320617263752066656c697320626962656e64756d2075742074726973746971756520657420656765737461732e20416d6574207269737573206e756c6c616d20656765742066656c69732e20223b693a333b613a32353a7b733a323a226964223b693a353b733a353a22616c696173223b733a31343a22616e6e6f756e63656d656e742033223b733a373a2273756d6d617279223b733a3330383a223c703e41727469636c6520333c2f703e0d0a3c703e4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e2045676573746173207075727573207669766572726120616363756d73616e20696e206e69736c2e20456e696d2073697420616d65742076656e656e617469732075726e61206375727375732e20566976616d757320617263752066656c697320626962656e64756d2075742074726973746971756520657420656765737461732e20416d6574207269737573206e756c6c616d20656765742066656c69732e3c2f703e223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a31303b733a31303a22637265617465645f6279223b693a3130313b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30342d32302030353a30393a3339223b733a31313a226d6f6469666965645f6279223b693a3130313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38373a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2230223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2230223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2230223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2230223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2230223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b733a32393a2268656c69785f756c74696d6174655f61727469636c655f666f726d6174223b733a383a227374616e64617264223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a333b733a383a226f72646572696e67223b693a303b733a383a2263617465676f7279223b733a31323a22416e6e6f756e63656d656e74223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a31363a22353a616e6e6f756e63656d656e742d33223b733a373a22636174736c7567223b733a31353a2231303a616e6e6f756e63656d656e74223b733a363a22617574686f72223b733a373a224465764a617675223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30342d31312031333a35323a3334223b693a31303b4e3b693a31313b733a37303a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d353a616e6e6f756e63656d656e742d332663617469643d3130223b693a31323b4e3b693a31333b733a31393a22323032332d30342d31312031333a35323a3334223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a363b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a224465764a617675223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a383b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31323a22416e6e6f756e63656d656e74223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31313b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31343a22416e6e6f756e63656d656e742033223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d35223b7d);
INSERT INTO `hde5p_finder_links` (`link_id`, `url`, `route`, `title`, `description`, `indexdate`, `md5sum`, `published`, `state`, `access`, `language`, `publish_start_date`, `publish_end_date`, `start_date`, `end_date`, `list_price`, `sale_price`, `type_id`, `object`) VALUES
(19, 'index.php?option=com_content&view=article&id=3', 'index.php?option=com_content&view=article&id=3:announcement-1&catid=10', 'Announcement 1', ' Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget mauris pharetra et ultrices neque. Velit scelerisque in dictum non consectetur a erat nam. Gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim. Viverra vitae congue eu consequat. Aliquam purus sit amet luctus venenatis. Ridiculus mus mauris vitae ultricies leo. Dictumst quisque sagittis purus sit amet volutpat. Sapien et ligula ullamcorper malesuada proin libero nunc consequat. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit. Auctor neque vitae tempus quam pellentesque. Ornare suspendisse sed nisi lacus sed viverra tellus in. Lorem donec massa sapien faucibus et molestie ac feugiat. Dignissim enim sit amet venenatis urna. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. Volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam. Massa id neque aliquam vestibulum morbi blandit cursus. Convallis posuere morbi leo urna molestie at elementum eu. Sapien pellentesque habitant morbi tristique. Placerat orci nulla pellentesque dignissim enim sit amet venenatis urna. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam. Aliquam purus sit amet luctus venenatis lectus. Senectus et netus et malesuada fames ac turpis egestas sed. Eget nulla facilisi etiam dignissim diam quis enim. Urna id volutpat lacus laoreet non curabitur. Egestas dui id ornare arcu. Ut tellus elementum sagittis vitae et leo. Gravida in fermentum et sollicitudin ac orci phasellus egestas tellus. Cras fermentum odio eu feugiat pretium nibh. Sagittis purus sit amet volutpat consequat mauris nunc congue. Quam nulla porttitor massa id neque. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Mauris commodo quis imperdiet massa tincidunt nunc. Tempus egestas sed sed risus pretium quam. Vitae justo eget magna fermentum iaculis eu non. Estpellentesque elit ullamcorper dignissim cras tincidunt lobortis. Amet risus nullam eget felis eget nunc lobortis mattis aliquam. Turpis nunc eget lorem dolor sed viverra. Mi in nulla posuere sollicitudin aliquam ultrices sagittis. Turpis in eu mi bibendum neque egestas. Mi bibendum neque egestas congue quisque egestas diam. Fermentum et sollicitudin ac orci phasellus egestas tellus. Felis eget velit aliquet sagittis id. In hac habitasse platea dictumst vestibulum. Viverra aliquet eget sit amet. Amet nulla facilisi morbi tempus iaculis urna id. Nisl condimentum id venenatis a condimentum vitae sapien. Quis auctor elit sed vulputate mi sit. Congue eu consequat ac felis donec et odio pellentesque diam. Lacus sed viverra tellus in hac habitasse platea. Nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus. Vulputate mi sit amet mauris commodo quis. Sit amet commodo nulla facilisi nullam. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend. Sit amet venenatis urna cursus eget nunc. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat. Massa vitae tortor condimentum lacinia quis vel eros. Platea dictumst vestibulum rhoncus est. Tempor commodo ullamcorper a lacus vestibulum sed arcu non odio. Tortor at auctor urna nunc id cursus metus aliquam. Risus nullam eget felis eget nunc lobortis. Tincidunt dui ut ornare lectus sit amet est placerat. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Proin libero nunc consequat interdum. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Arcu cursus vitae congue mauris rhoncus aenean. Consectetur adipiscing elit ut aliquam purus sit amet luctus. Mauris augue neque gravida in fermentum et sollicitudin. Nullam vehicula ipsum a arcu cursus. Eleifend donec pretium vulputate sapien nec. Vitae sapien pellentesque habitant morbi tristique. Quam pellentesque nec nam aliquam sem et tortor consequat. Amet consectetur adipiscing elit ut aliquam purus. Adipiscing elit ut aliquam purus sit amet luctus.Feugiat nisl pretium fusce id velit ut tortor pretium viverra. Sed augue lacus viverra vitae congue eu consequat ac felis. Ut consequat semper viverra nam libero justo. Non pulvinar neque laoreet suspendisse interdum. Vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur. Augue eget arcu dictum varius. At quis risus sed vulputate. Turpis egestas pretium aenean pharetra magna ac placerat. Convallis a cras semper auctor. Ornare arcu odio ut sem nulla pharetra diam. Duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat. ', '2023-04-20 05:50:17', '265ae5c80cc1014c948dd512eb109707', 1, 1, 1, '*', '2023-04-11 13:30:49', NULL, '2023-04-11 13:30:49', NULL, 0, 0, 3, 0x4f3a35323a224a6f6f6d6c615c436f6d706f6e656e745c46696e6465725c41646d696e6973747261746f725c496e64657865725c526573756c74223a31393a7b693a303b693a313b693a313b733a353a22656e2d4742223b693a323b733a343632333a22204c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e2045676574206d617572697320706861726574726120657420756c747269636573206e657175652e2056656c6974207363656c6572697371756520696e2064696374756d206e6f6e20636f6e736563746574757220612065726174206e616d2e20477261766964612064696374756d20667573636520757420706c616365726174206f726369206e756c6c612070656c6c656e746573717565206469676e697373696d20656e696d2e205669766572726120766974616520636f6e67756520657520636f6e7365717561742e20416c697175616d2070757275732073697420616d6574206c75637475732076656e656e617469732e205269646963756c7573206d7573206d617572697320766974616520756c74726963696573206c656f2e2044696374756d737420717569737175652073616769747469732070757275732073697420616d657420766f6c75747061742e2053617069656e206574206c6967756c6120756c6c616d636f72706572206d616c6573756164612070726f696e206c696265726f206e756e6320636f6e7365717561742e2050656c6c656e7465737175652061646970697363696e6720636f6d6d6f646f20656c697420617420696d706572646965742064756920616363756d73616e207369742e20417563746f72206e657175652076697461652074656d707573207175616d2070656c6c656e7465737175652e204f726e6172652073757370656e646973736520736564206e697369206c616375732073656420766976657272612074656c6c757320696e2e204c6f72656d20646f6e6563206d617373612073617069656e206661756369627573206574206d6f6c657374696520616320666575676961742e204469676e697373696d20656e696d2073697420616d65742076656e656e617469732075726e612e20496e20616c697175616d2073656d206672696e67696c6c61207574206d6f7262692074696e636964756e7420617567756520696e74657264756d2076656c69742e20566f6c757470617420636f6d6d6f646f2073656420656765737461732065676573746173206672696e67696c6c612070686173656c6c7573206661756369627573207363656c657269737175652e20456765737461732074656c6c75732072757472756d2074656c6c75732070656c6c656e7465737175652065752074696e636964756e7420746f72746f7220616c697175616d2e204d61737361206964206e6571756520616c697175616d20766573746962756c756d206d6f72626920626c616e646974206375727375732e20436f6e76616c6c697320706f7375657265206d6f726269206c656f2075726e61206d6f6c657374696520617420656c656d656e74756d2065752e2053617069656e2070656c6c656e746573717565206861626974616e74206d6f726269207472697374697175652e20506c616365726174206f726369206e756c6c612070656c6c656e746573717565206469676e697373696d20656e696d2073697420616d65742076656e656e617469732075726e612e20497073756d20666175636962757320766974616520616c6971756574206e656320756c6c616d636f727065722073697420616d6574207269737573206e756c6c616d2e20416c697175616d2070757275732073697420616d6574206c75637475732076656e656e61746973206c65637475732e2053656e6563747573206574206e65747573206574206d616c6573756164612066616d6573206163207475727069732065676573746173207365642e2045676574206e756c6c6120666163696c69736920657469616d206469676e697373696d206469616d207175697320656e696d2e2055726e6120696420766f6c7574706174206c61637573206c616f72656574206e6f6e206375726162697475722e204567657374617320647569206964206f726e61726520617263752e2055742074656c6c757320656c656d656e74756d207361676974746973207669746165206574206c656f2e204772617669646120696e206665726d656e74756d20657420736f6c6c696369747564696e206163206f7263692070686173656c6c757320656765737461732074656c6c75732e2043726173206665726d656e74756d206f64696f2065752066657567696174207072657469756d206e6962682e2053616769747469732070757275732073697420616d657420766f6c757470617420636f6e736571756174206d6175726973206e756e6320636f6e6775652e205175616d206e756c6c6120706f72747469746f72206d61737361206964206e657175652e204c616f72656574206e6f6e206375726162697475722067726176696461206172637520616320746f72746f72206469676e697373696d20636f6e76616c6c69732061656e65616e2e204d617572697320636f6d6d6f646f207175697320696d70657264696574206d617373612074696e636964756e74206e756e632e2054656d70757320656765737461732073656420736564207269737573207072657469756d207175616d2e205669746165206a7573746f2065676574206d61676e61206665726d656e74756d20696163756c6973206575206e6f6e2e2045737470656c6c656e74657371756520656c697420756c6c616d636f72706572206469676e697373696d20637261732074696e636964756e74206c6f626f727469732e20416d6574207269737573206e756c6c616d20656765742066656c69732065676574206e756e63206c6f626f72746973206d617474697320616c697175616d2e20547572706973206e756e632065676574206c6f72656d20646f6c6f722073656420766976657272612e204d6920696e206e756c6c6120706f737565726520736f6c6c696369747564696e20616c697175616d20756c7472696365732073616769747469732e2054757270697320696e206575206d6920626962656e64756d206e6571756520656765737461732e204d6920626962656e64756d206e65717565206567657374617320636f6e67756520717569737175652065676573746173206469616d2e204665726d656e74756d20657420736f6c6c696369747564696e206163206f7263692070686173656c6c757320656765737461732074656c6c75732e2046656c697320656765742076656c697420616c69717565742073616769747469732069642e20496e206861632068616269746173736520706c617465612064696374756d737420766573746962756c756d2e205669766572726120616c697175657420656765742073697420616d65742e20416d6574206e756c6c6120666163696c697369206d6f7262692074656d70757320696163756c69732075726e612069642e204e69736c20636f6e64696d656e74756d2069642076656e656e61746973206120636f6e64696d656e74756d2076697461652073617069656e2e205175697320617563746f7220656c6974207365642076756c707574617465206d69207369742e20436f6e67756520657520636f6e7365717561742061632066656c697320646f6e6563206574206f64696f2070656c6c656e746573717565206469616d2e204c616375732073656420766976657272612074656c6c757320696e206861632068616269746173736520706c617465612e204e756c6c616d207665686963756c6120697073756d206120617263752063757273757320766974616520636f6e677565206d61757269732072686f6e6375732e2056756c707574617465206d692073697420616d6574206d617572697320636f6d6d6f646f20717569732e2053697420616d657420636f6d6d6f646f206e756c6c6120666163696c697369206e756c6c616d2e2053656420656765737461732065676573746173206672696e67696c6c612070686173656c6c7573206661756369627573207363656c6572697371756520656c656966656e642e2053697420616d65742076656e656e617469732075726e61206375727375732065676574206e756e632e2050656c6c656e74657371756520656c697420756c6c616d636f72706572206469676e697373696d20637261732074696e636964756e74206c6f626f7274697320666575676961742e204d6173736120766974616520746f72746f7220636f6e64696d656e74756d206c6163696e696120717569732076656c2065726f732e20506c617465612064696374756d737420766573746962756c756d2072686f6e637573206573742e2054656d706f7220636f6d6d6f646f20756c6c616d636f727065722061206c6163757320766573746962756c756d207365642061726375206e6f6e206f64696f2e20546f72746f7220617420617563746f722075726e61206e756e6320696420637572737573206d6574757320616c697175616d2e205269737573206e756c6c616d20656765742066656c69732065676574206e756e63206c6f626f727469732e2054696e636964756e7420647569207574206f726e617265206c65637475732073697420616d65742065737420706c6163657261742e2050656c6c656e74657371756520656c697420756c6c616d636f72706572206469676e697373696d20637261732074696e636964756e74206c6f626f727469732e2050726f696e206c696265726f206e756e6320636f6e73657175617420696e74657264756d2e20456c697420647569732074726973746971756520736f6c6c696369747564696e206e6962682073697420616d657420636f6d6d6f646f206e756c6c6120666163696c6973692e20417263752063757273757320766974616520636f6e677565206d61757269732072686f6e6375732061656e65616e2e20436f6e73656374657475722061646970697363696e6720656c697420757420616c697175616d2070757275732073697420616d6574206c75637475732e204d6175726973206175677565206e65717565206772617669646120696e206665726d656e74756d20657420736f6c6c696369747564696e2e204e756c6c616d207665686963756c6120697073756d20612061726375206375727375732e20456c656966656e6420646f6e6563207072657469756d2076756c7075746174652073617069656e206e65632e2056697461652073617069656e2070656c6c656e746573717565206861626974616e74206d6f726269207472697374697175652e205175616d2070656c6c656e746573717565206e6563206e616d20616c697175616d2073656d20657420746f72746f7220636f6e7365717561742e20416d657420636f6e73656374657475722061646970697363696e6720656c697420757420616c697175616d2070757275732e2041646970697363696e6720656c697420757420616c697175616d2070757275732073697420616d6574206c75637475732e46657567696174206e69736c207072657469756d2066757363652069642076656c697420757420746f72746f72207072657469756d20766976657272612e20536564206175677565206c61637573207669766572726120766974616520636f6e67756520657520636f6e7365717561742061632066656c69732e20557420636f6e7365717561742073656d7065722076697665727261206e616d206c696265726f206a7573746f2e204e6f6e2070756c76696e6172206e65717565206c616f726565742073757370656e646973736520696e74657264756d2e2056656c206f72636920706f727461206e6f6e2070756c76696e6172206e65717565206c616f726565742073757370656e646973736520696e74657264756d20636f6e73656374657475722e204175677565206567657420617263752064696374756d207661726975732e2041742071756973207269737573207365642076756c7075746174652e205475727069732065676573746173207072657469756d2061656e65616e207068617265747261206d61676e6120616320706c6163657261742e20436f6e76616c6c6973206120637261732073656d70657220617563746f722e204f726e6172652061726375206f64696f2075742073656d206e756c6c61207068617265747261206469616d2e204475697320756c74726963696573206c6163757320736564207475727069732074696e636964756e7420696420616c697175657420726973757320666575676961742e20223b693a333b613a32353a7b733a323a226964223b693a333b733a353a22616c696173223b733a31343a22616e6e6f756e63656d656e742031223b733a373a2273756d6d617279223b733a343636323a223c703e4c6f72656d20697073756d20646f6c6f722073697420616d65742c20636f6e73656374657475722061646970697363696e6720656c69742c2073656420646f20656975736d6f642074656d706f7220696e6369646964756e74207574206c61626f726520657420646f6c6f7265206d61676e6120616c697175612e2045676574206d617572697320706861726574726120657420756c747269636573206e657175652e2056656c6974207363656c6572697371756520696e2064696374756d206e6f6e20636f6e736563746574757220612065726174206e616d2e20477261766964612064696374756d20667573636520757420706c616365726174206f726369206e756c6c612070656c6c656e746573717565206469676e697373696d20656e696d2e205669766572726120766974616520636f6e67756520657520636f6e7365717561742e20416c697175616d2070757275732073697420616d6574206c75637475732076656e656e617469732e205269646963756c7573206d7573206d617572697320766974616520756c74726963696573206c656f2e2044696374756d737420717569737175652073616769747469732070757275732073697420616d657420766f6c75747061742e2053617069656e206574206c6967756c6120756c6c616d636f72706572206d616c6573756164612070726f696e206c696265726f206e756e6320636f6e7365717561742e2050656c6c656e7465737175652061646970697363696e6720636f6d6d6f646f20656c697420617420696d706572646965742064756920616363756d73616e207369742e20417563746f72206e657175652076697461652074656d707573207175616d2070656c6c656e7465737175652e204f726e6172652073757370656e646973736520736564206e697369206c616375732073656420766976657272612074656c6c757320696e2e204c6f72656d20646f6e6563206d617373612073617069656e206661756369627573206574206d6f6c657374696520616320666575676961742e204469676e697373696d20656e696d2073697420616d65742076656e656e617469732075726e612e20496e20616c697175616d2073656d206672696e67696c6c61207574206d6f7262692074696e636964756e7420617567756520696e74657264756d2076656c69742e20566f6c757470617420636f6d6d6f646f2073656420656765737461732065676573746173206672696e67696c6c612070686173656c6c7573206661756369627573207363656c657269737175652e20456765737461732074656c6c75732072757472756d2074656c6c75732070656c6c656e7465737175652065752074696e636964756e7420746f72746f7220616c697175616d2e204d61737361206964206e6571756520616c697175616d20766573746962756c756d206d6f72626920626c616e646974206375727375732e20436f6e76616c6c697320706f7375657265206d6f726269206c656f2075726e61206d6f6c657374696520617420656c656d656e74756d2065752e3c2f703e0d0a3c703e53617069656e2070656c6c656e746573717565206861626974616e74206d6f726269207472697374697175652e20506c616365726174206f726369206e756c6c612070656c6c656e746573717565206469676e697373696d20656e696d2073697420616d65742076656e656e617469732075726e612e20497073756d20666175636962757320766974616520616c6971756574206e656320756c6c616d636f727065722073697420616d6574207269737573206e756c6c616d2e20416c697175616d2070757275732073697420616d6574206c75637475732076656e656e61746973206c65637475732e2053656e6563747573206574206e65747573206574206d616c6573756164612066616d6573206163207475727069732065676573746173207365642e2045676574206e756c6c6120666163696c69736920657469616d206469676e697373696d206469616d207175697320656e696d2e2055726e6120696420766f6c7574706174206c61637573206c616f72656574206e6f6e206375726162697475722e204567657374617320647569206964206f726e61726520617263752e2055742074656c6c757320656c656d656e74756d207361676974746973207669746165206574206c656f2e204772617669646120696e206665726d656e74756d20657420736f6c6c696369747564696e206163206f7263692070686173656c6c757320656765737461732074656c6c75732e2043726173206665726d656e74756d206f64696f2065752066657567696174207072657469756d206e6962682e2053616769747469732070757275732073697420616d657420766f6c757470617420636f6e736571756174206d6175726973206e756e6320636f6e6775652e205175616d206e756c6c6120706f72747469746f72206d61737361206964206e657175652e204c616f72656574206e6f6e206375726162697475722067726176696461206172637520616320746f72746f72206469676e697373696d20636f6e76616c6c69732061656e65616e2e204d617572697320636f6d6d6f646f207175697320696d70657264696574206d617373612074696e636964756e74206e756e632e2054656d70757320656765737461732073656420736564207269737573207072657469756d207175616d2e205669746165206a7573746f2065676574206d61676e61206665726d656e74756d20696163756c6973206575206e6f6e2e3c2f703e0d0a3c703e4573742070656c6c656e74657371756520656c697420756c6c616d636f72706572206469676e697373696d20637261732074696e636964756e74206c6f626f727469732e20416d6574207269737573206e756c6c616d20656765742066656c69732065676574206e756e63206c6f626f72746973206d617474697320616c697175616d2e20547572706973206e756e632065676574206c6f72656d20646f6c6f722073656420766976657272612e204d6920696e206e756c6c6120706f737565726520736f6c6c696369747564696e20616c697175616d20756c7472696365732073616769747469732e2054757270697320696e206575206d6920626962656e64756d206e6571756520656765737461732e204d6920626962656e64756d206e65717565206567657374617320636f6e67756520717569737175652065676573746173206469616d2e204665726d656e74756d20657420736f6c6c696369747564696e206163206f7263692070686173656c6c757320656765737461732074656c6c75732e2046656c697320656765742076656c697420616c69717565742073616769747469732069642e20496e206861632068616269746173736520706c617465612064696374756d737420766573746962756c756d2e205669766572726120616c697175657420656765742073697420616d65742e20416d6574206e756c6c6120666163696c697369206d6f7262692074656d70757320696163756c69732075726e612069642e204e69736c20636f6e64696d656e74756d2069642076656e656e61746973206120636f6e64696d656e74756d2076697461652073617069656e2e205175697320617563746f7220656c6974207365642076756c707574617465206d69207369742e20436f6e67756520657520636f6e7365717561742061632066656c697320646f6e6563206574206f64696f2070656c6c656e746573717565206469616d2e204c616375732073656420766976657272612074656c6c757320696e206861632068616269746173736520706c617465612e204e756c6c616d207665686963756c6120697073756d206120617263752063757273757320766974616520636f6e677565206d61757269732072686f6e6375732e3c2f703e0d0a3c703e56756c707574617465206d692073697420616d6574206d617572697320636f6d6d6f646f20717569732e2053697420616d657420636f6d6d6f646f206e756c6c6120666163696c697369206e756c6c616d2e2053656420656765737461732065676573746173206672696e67696c6c612070686173656c6c7573206661756369627573207363656c6572697371756520656c656966656e642e2053697420616d65742076656e656e617469732075726e61206375727375732065676574206e756e632e2050656c6c656e74657371756520656c697420756c6c616d636f72706572206469676e697373696d20637261732074696e636964756e74206c6f626f7274697320666575676961742e204d6173736120766974616520746f72746f7220636f6e64696d656e74756d206c6163696e696120717569732076656c2065726f732e20506c617465612064696374756d737420766573746962756c756d2072686f6e637573206573742e2054656d706f7220636f6d6d6f646f20756c6c616d636f727065722061206c6163757320766573746962756c756d207365642061726375206e6f6e206f64696f2e20546f72746f7220617420617563746f722075726e61206e756e6320696420637572737573206d6574757320616c697175616d2e205269737573206e756c6c616d20656765742066656c69732065676574206e756e63206c6f626f727469732e2054696e636964756e7420647569207574206f726e617265206c65637475732073697420616d65742065737420706c6163657261742e2050656c6c656e74657371756520656c697420756c6c616d636f72706572206469676e697373696d20637261732074696e636964756e74206c6f626f727469732e2050726f696e206c696265726f206e756e6320636f6e73657175617420696e74657264756d2e20456c697420647569732074726973746971756520736f6c6c696369747564696e206e6962682073697420616d657420636f6d6d6f646f206e756c6c6120666163696c6973692e20417263752063757273757320766974616520636f6e677565206d61757269732072686f6e6375732061656e65616e2e20436f6e73656374657475722061646970697363696e6720656c697420757420616c697175616d2070757275732073697420616d6574206c75637475732e204d6175726973206175677565206e65717565206772617669646120696e206665726d656e74756d20657420736f6c6c696369747564696e2e3c2f703e0d0a3c703e4e756c6c616d207665686963756c6120697073756d20612061726375206375727375732e20456c656966656e6420646f6e6563207072657469756d2076756c7075746174652073617069656e206e65632e2056697461652073617069656e2070656c6c656e746573717565206861626974616e74206d6f726269207472697374697175652e205175616d2070656c6c656e746573717565206e6563206e616d20616c697175616d2073656d20657420746f72746f7220636f6e7365717561742e20416d657420636f6e73656374657475722061646970697363696e6720656c697420757420616c697175616d2070757275732e2041646970697363696e6720656c697420757420616c697175616d2070757275732073697420616d6574206c75637475732e2046657567696174206e69736c207072657469756d2066757363652069642076656c697420757420746f72746f72207072657469756d20766976657272612e20536564206175677565206c61637573207669766572726120766974616520636f6e67756520657520636f6e7365717561742061632066656c69732e20557420636f6e7365717561742073656d7065722076697665727261206e616d206c696265726f206a7573746f2e204e6f6e2070756c76696e6172206e65717565206c616f726565742073757370656e646973736520696e74657264756d2e2056656c206f72636920706f727461206e6f6e2070756c76696e6172206e65717565206c616f726565742073757370656e646973736520696e74657264756d20636f6e73656374657475722e204175677565206567657420617263752064696374756d207661726975732e2041742071756973207269737573207365642076756c7075746174652e205475727069732065676573746173207072657469756d2061656e65616e207068617265747261206d61676e6120616320706c6163657261742e20436f6e76616c6c6973206120637261732073656d70657220617563746f722e204f726e6172652061726375206f64696f2075742073656d206e756c6c61207068617265747261206469616d2e204475697320756c74726963696573206c6163757320736564207475727069732074696e636964756e7420696420616c697175657420726973757320666575676961742e3c2f703e223b733a343a22626f6479223b733a303a22223b733a363a22696d61676573223b733a3137333a227b22696d6167655f696e74726f223a22222c22696d6167655f696e74726f5f616c74223a22222c22666c6f61745f696e74726f223a22222c22696d6167655f696e74726f5f63617074696f6e223a22222c22696d6167655f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f616c74223a22222c22666c6f61745f66756c6c74657874223a22222c22696d6167655f66756c6c746578745f63617074696f6e223a22227d223b733a353a226361746964223b693a31303b733a31303a22637265617465645f6279223b693a3130313b733a31363a22637265617465645f62795f616c696173223b733a303a22223b733a383a226d6f646966696564223b733a31393a22323032332d30342d32302030353a35303a3137223b733a31313a226d6f6469666965645f6279223b693a3130313b733a363a22706172616d73223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a38373a7b733a31343a2261727469636c655f6c61796f7574223b733a393a225f3a64656661756c74223b733a31303a2273686f775f7469746c65223b733a313a2231223b733a31313a226c696e6b5f7469746c6573223b733a313a2231223b733a31303a2273686f775f696e74726f223b733a313a2231223b733a31393a22696e666f5f626c6f636b5f706f736974696f6e223b733a313a2230223b733a32313a22696e666f5f626c6f636b5f73686f775f7469746c65223b733a313a2231223b733a31333a2273686f775f63617465676f7279223b733a313a2230223b733a31333a226c696e6b5f63617465676f7279223b733a313a2231223b733a32303a2273686f775f706172656e745f63617465676f7279223b733a313a2230223b733a32303a226c696e6b5f706172656e745f63617465676f7279223b733a313a2230223b733a31373a2273686f775f6173736f63696174696f6e73223b733a313a2230223b733a353a22666c616773223b733a313a2231223b733a31313a2273686f775f617574686f72223b733a313a2230223b733a31313a226c696e6b5f617574686f72223b733a313a2230223b733a31363a2273686f775f6372656174655f64617465223b733a313a2230223b733a31363a2273686f775f6d6f646966795f64617465223b733a313a2230223b733a31373a2273686f775f7075626c6973685f64617465223b733a313a2230223b733a32303a2273686f775f6974656d5f6e617669676174696f6e223b733a313a2231223b733a31333a2273686f775f726561646d6f7265223b733a313a2231223b733a31393a2273686f775f726561646d6f72655f7469746c65223b733a313a2231223b733a31343a22726561646d6f72655f6c696d6974223b693a3130303b733a393a2273686f775f74616773223b733a313a2230223b733a31313a227265636f72645f68697473223b733a313a2231223b733a393a2273686f775f68697473223b733a313a2230223b733a31313a2273686f775f6e6f61757468223b733a313a2230223b733a31333a2275726c735f706f736974696f6e223b693a303b733a373a2263617074636861223b733a303a22223b733a32333a2273686f775f7075626c697368696e675f6f7074696f6e73223b733a313a2231223b733a32303a2273686f775f61727469636c655f6f7074696f6e73223b733a313a2231223b733a32373a2273686f775f636f6e6669677572655f656469745f6f7074696f6e73223b733a313a2231223b733a31363a2273686f775f7065726d697373696f6e73223b733a313a2231223b733a32323a2273686f775f6173736f63696174696f6e735f65646974223b733a313a2231223b733a31323a22736176655f686973746f7279223b733a313a2231223b733a31333a22686973746f72795f6c696d6974223b693a31303b733a32353a2273686f775f75726c735f696d616765735f66726f6e74656e64223b733a313a2230223b733a32343a2273686f775f75726c735f696d616765735f6261636b656e64223b733a313a2231223b733a373a2274617267657461223b693a303b733a373a2274617267657462223b693a303b733a373a2274617267657463223b693a303b733a31313a22666c6f61745f696e74726f223b733a343a226c656674223b733a31343a22666c6f61745f66756c6c74657874223b733a343a226c656674223b733a31353a2263617465676f72795f6c61796f7574223b733a363a225f3a626c6f67223b733a31393a2273686f775f63617465676f72795f7469746c65223b733a313a2230223b733a31363a2273686f775f6465736372697074696f6e223b733a313a2230223b733a32323a2273686f775f6465736372697074696f6e5f696d616765223b733a313a2230223b733a383a226d61784c6576656c223b733a313a2231223b733a32313a2273686f775f656d7074795f63617465676f72696573223b733a313a2230223b733a31363a2273686f775f6e6f5f61727469636c6573223b733a313a2231223b733a33323a2273686f775f63617465676f72795f68656164696e675f7469746c655f74657874223b733a313a2231223b733a31363a2273686f775f7375626361745f64657363223b733a313a2231223b733a32313a2273686f775f6361745f6e756d5f61727469636c6573223b733a313a2230223b733a31333a2273686f775f6361745f74616773223b733a313a2231223b733a32313a2273686f775f626173655f6465736372697074696f6e223b733a313a2231223b733a31313a226d61784c6576656c636174223b733a323a222d31223b733a32353a2273686f775f656d7074795f63617465676f726965735f636174223b733a313a2230223b733a32303a2273686f775f7375626361745f646573635f636174223b733a313a2231223b733a32353a2273686f775f6361745f6e756d5f61727469636c65735f636174223b733a313a2231223b733a32303a226e756d5f6c656164696e675f61727469636c6573223b693a313b733a31383a22626c6f675f636c6173735f6c656164696e67223b733a303a22223b733a31383a226e756d5f696e74726f5f61727469636c6573223b693a343b733a31303a22626c6f675f636c617373223b733a303a22223b733a31313a226e756d5f636f6c756d6e73223b693a313b733a31383a226d756c74695f636f6c756d6e5f6f72646572223b733a313a2230223b733a393a226e756d5f6c696e6b73223b693a343b733a32343a2273686f775f73756263617465676f72795f636f6e74656e74223b733a313a2230223b733a31363a226c696e6b5f696e74726f5f696d616765223b733a313a2230223b733a32313a2273686f775f706167696e6174696f6e5f6c696d6974223b733a313a2231223b733a31323a2266696c7465725f6669656c64223b733a343a2268696465223b733a31333a2273686f775f68656164696e6773223b733a313a2231223b733a31343a226c6973745f73686f775f64617465223b733a313a2230223b733a31313a22646174655f666f726d6174223b733a303a22223b733a31343a226c6973745f73686f775f68697473223b733a313a2231223b733a31363a226c6973745f73686f775f617574686f72223b733a313a2231223b733a31313a22646973706c61795f6e756d223b733a323a223130223b733a31313a226f7264657262795f707269223b733a353a226f72646572223b733a31313a226f7264657262795f736563223b733a353a227264617465223b733a31303a226f726465725f64617465223b733a393a227075626c6973686564223b733a31353a2273686f775f706167696e6174696f6e223b733a313a2232223b733a32333a2273686f775f706167696e6174696f6e5f726573756c7473223b733a313a2231223b733a31333a2273686f775f6665617475726564223b733a343a2273686f77223b733a31343a2273686f775f666565645f6c696e6b223b733a313a2231223b733a31323a22666565645f73756d6d617279223b733a313a2230223b733a31383a22666565645f73686f775f726561646d6f7265223b733a313a2230223b733a373a227365665f696473223b693a313b733a32303a22637573746f6d5f6669656c64735f656e61626c65223b733a313a2231223b733a31363a22776f726b666c6f775f656e61626c6564223b733a313a2230223b733a32393a2268656c69785f756c74696d6174655f61727469636c655f666f726d6174223b733a383a227374616e64617264223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a226d6574616b6579223b733a303a22223b733a383a226d65746164657363223b733a303a22223b733a383a226d65746164617461223b4f3a32343a224a6f6f6d6c615c52656769737472795c5265676973747279223a333a7b733a373a22002a0064617461223b4f3a383a22737464436c617373223a333a7b733a363a22726f626f7473223b733a303a22223b733a363a22617574686f72223b733a303a22223b733a363a22726967687473223b733a303a22223b7d733a31343a22002a00696e697469616c697a6564223b623a313b733a393a22736570617261746f72223b733a313a222e223b7d733a373a2276657273696f6e223b693a343b733a383a226f72646572696e67223b693a323b733a383a2263617465676f7279223b733a31323a22416e6e6f756e63656d656e74223b733a393a226361745f7374617465223b693a313b733a31303a226361745f616363657373223b693a313b733a343a22736c7567223b733a31363a22333a616e6e6f756e63656d656e742d31223b733a373a22636174736c7567223b733a31353a2231303a616e6e6f756e63656d656e74223b733a363a22617574686f72223b733a373a224465764a617675223b733a363a226c61796f7574223b733a373a2261727469636c65223b733a373a22636f6e74657874223b733a31393a22636f6d5f636f6e74656e742e61727469636c65223b733a31303a226d657461617574686f72223b4e3b7d693a343b4e3b693a353b613a353a7b693a313b613a333a7b693a303b733a353a227469746c65223b693a313b733a383a227375627469746c65223b693a323b733a323a226964223b7d693a323b613a323a7b693a303b733a373a2273756d6d617279223b693a313b733a343a22626f6479223b7d693a333b613a383a7b693a303b733a343a226d657461223b693a313b733a31303a226c6973745f7072696365223b693a323b733a31303a2273616c655f7072696365223b693a333b733a373a226d6574616b6579223b693a343b733a383a226d65746164657363223b693a353b733a31303a226d657461617574686f72223b693a363b733a363a22617574686f72223b693a373b733a31363a22637265617465645f62795f616c696173223b7d693a343b613a323a7b693a303b733a343a2270617468223b693a313b733a353a22616c696173223b7d693a353b613a313a7b693a303b733a383a22636f6d6d656e7473223b7d7d693a363b733a313a222a223b693a373b4e3b693a383b4e3b693a393b733a31393a22323032332d30342d31312031333a33303a3439223b693a31303b4e3b693a31313b733a37303a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d333a616e6e6f756e63656d656e742d312663617469643d3130223b693a31323b4e3b693a31333b733a31393a22323032332d30342d31312031333a33303a3439223b693a31343b693a313b693a31353b613a343a7b733a343a2254797065223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a2241727469636c65223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a363b7d7d733a363a22417574686f72223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a373a224465764a617675223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a383b7d7d733a383a2243617465676f7279223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a31323a22416e6e6f756e63656d656e74223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a313a222a223b733a363a226e6573746564223b623a313b733a323a226964223b693a31313b7d7d733a383a224c616e6775616765223b613a313a7b693a303b4f3a383a22737464436c617373223a363a7b733a353a227469746c65223b733a313a222a223b733a353a227374617465223b693a313b733a363a22616363657373223b693a313b733a383a226c616e6775616765223b733a303a22223b733a363a226e6573746564223b623a303b733a323a226964223b693a353b7d7d7d693a31363b733a31343a22416e6e6f756e63656d656e742031223b693a31373b693a333b693a31383b733a34363a22696e6465782e7068703f6f7074696f6e3d636f6d5f636f6e74656e7426766965773d61727469636c652669643d33223b7d);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_links_terms`
--

CREATE TABLE `hde5p_finder_links_terms` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `term_id` int(10) UNSIGNED NOT NULL,
  `weight` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_finder_links_terms`
--

INSERT INTO `hde5p_finder_links_terms` (`link_id`, `term_id`, `weight`) VALUES
(1, 1, 0.17),
(14, 2, 0.46669),
(17, 2, 0.46669),
(18, 2, 0.46669),
(1, 2, 0.93338),
(4, 2, 0.93338),
(11, 2, 0.93338),
(19, 2, 2.33345),
(1, 3, 0.28),
(4, 3, 0.28),
(11, 3, 0.28),
(14, 3, 0.28),
(17, 3, 0.28),
(18, 3, 0.28),
(19, 3, 0.28),
(11, 4, 0.37338),
(17, 4, 0.37338),
(1, 4, 0.56007),
(4, 4, 0.56007),
(14, 4, 0.56007),
(18, 4, 0.56007),
(19, 4, 3.54711),
(1, 5, 0.18669),
(4, 5, 0.18669),
(14, 5, 0.18669),
(18, 5, 0.18669),
(19, 5, 1.49352),
(1, 6, 0.28),
(4, 6, 0.28),
(17, 6, 0.56),
(19, 6, 1.12),
(11, 7, 0.51331),
(14, 7, 0.51331),
(17, 7, 0.51331),
(18, 7, 0.51331),
(1, 7, 1.02662),
(4, 7, 1.02662),
(19, 7, 2.56655),
(1, 8, 0.18669),
(4, 8, 0.18669),
(17, 8, 0.37338),
(19, 8, 0.93345),
(1, 9, 0.18669),
(4, 9, 0.18669),
(19, 9, 0.74676),
(1, 10, 0.09331),
(4, 10, 0.09331),
(11, 10, 0.09331),
(14, 10, 0.09331),
(17, 10, 0.09331),
(18, 10, 0.09331),
(19, 10, 0.09331),
(14, 11, 0.23331),
(18, 11, 0.23331),
(1, 11, 0.46662),
(4, 11, 0.46662),
(11, 11, 0.46662),
(17, 11, 0.46662),
(19, 11, 0.46662),
(1, 12, 0.28),
(4, 12, 0.28),
(11, 12, 0.28),
(14, 12, 0.28),
(17, 12, 0.28),
(18, 12, 0.28),
(19, 12, 0.28),
(1, 13, 0.32669),
(4, 13, 0.32669),
(11, 13, 0.32669),
(14, 13, 0.32669),
(17, 13, 0.32669),
(18, 13, 0.32669),
(19, 13, 0.32669),
(11, 14, 0.18669),
(14, 14, 0.18669),
(18, 14, 0.18669),
(1, 14, 0.37338),
(4, 14, 0.37338),
(17, 14, 0.56007),
(19, 14, 1.8669),
(1, 15, 0.09331),
(4, 15, 0.09331),
(11, 15, 0.09331),
(14, 15, 0.18662),
(18, 15, 0.18662),
(17, 15, 0.46655),
(19, 15, 1.11972),
(1, 16, 0.46669),
(4, 16, 0.46669),
(11, 16, 0.46669),
(14, 16, 0.46669),
(17, 16, 0.46669),
(18, 16, 0.46669),
(19, 16, 0.46669),
(1, 17, 0.32669),
(4, 17, 0.32669),
(11, 17, 0.32669),
(17, 17, 0.32669),
(11, 18, 0.23331),
(14, 18, 0.23331),
(18, 18, 0.23331),
(17, 18, 0.46662),
(19, 18, 0.93324),
(1, 18, 1.46652),
(4, 18, 1.46652),
(1, 19, 0.28),
(4, 19, 0.28),
(11, 19, 0.28),
(14, 19, 0.28),
(17, 19, 0.28),
(18, 19, 0.28),
(19, 19, 0.28),
(1, 20, 0.14),
(4, 20, 0.14),
(19, 20, 0.42),
(11, 21, 0.23331),
(14, 21, 0.23331),
(17, 21, 0.23331),
(18, 21, 0.23331),
(19, 21, 0.69993),
(1, 21, 1.46652),
(4, 21, 1.46652),
(1, 22, 0.23331),
(4, 22, 0.23331),
(11, 22, 0.23331),
(14, 22, 0.23331),
(18, 22, 0.23331),
(17, 22, 0.46662),
(19, 22, 0.69993),
(1, 23, 0.42),
(4, 23, 0.42),
(19, 23, 0.84),
(17, 23, 1.26),
(1, 24, 0.28),
(4, 24, 0.28),
(19, 24, 2.24),
(1, 25, 0.14),
(4, 25, 0.14),
(17, 25, 0.14),
(19, 25, 0.42),
(1, 26, 0.23331),
(4, 26, 0.23331),
(17, 26, 0.93324),
(19, 26, 2.09979),
(1, 27, 0.23331),
(4, 27, 0.23331),
(11, 27, 0.23331),
(17, 27, 0.69993),
(19, 27, 2.09979),
(1, 28, 0.18669),
(4, 28, 0.18669),
(17, 28, 0.18669),
(19, 28, 1.68021),
(1, 29, 0.18669),
(4, 29, 0.18669),
(17, 29, 0.56007),
(19, 29, 0.74676),
(1, 30, 0.28),
(4, 30, 0.28),
(19, 30, 1.12),
(1, 31, 0.56),
(4, 31, 0.56),
(17, 31, 2.8),
(19, 31, 6.16),
(1, 32, 0.37331),
(4, 32, 0.37331),
(17, 32, 0.74662),
(19, 32, 1.11993),
(1, 33, 0.18669),
(4, 33, 0.18669),
(11, 33, 0.18669),
(17, 33, 0.18669),
(19, 33, 0.74676),
(1, 34, 0.14),
(4, 34, 0.14),
(11, 34, 0.14),
(14, 34, 0.14),
(18, 34, 0.14),
(17, 34, 0.7),
(19, 34, 2.1),
(1, 35, 0.14),
(4, 35, 0.14),
(17, 35, 0.14),
(19, 35, 0.42),
(1, 36, 0.28),
(4, 36, 0.28),
(19, 36, 0.56),
(17, 36, 0.84),
(11, 37, 0.28),
(14, 37, 0.28),
(17, 37, 0.28),
(18, 37, 0.28),
(1, 37, 0.42),
(4, 37, 0.42),
(19, 37, 2.52),
(1, 38, 0.28),
(4, 38, 0.28),
(11, 38, 0.28),
(14, 38, 0.28),
(18, 38, 0.28),
(19, 38, 0.56),
(17, 38, 0.84),
(1, 39, 0.28),
(4, 39, 0.28),
(17, 39, 0.56),
(19, 39, 0.84),
(1, 40, 0.42),
(4, 40, 0.42),
(17, 40, 0.42),
(19, 40, 0.84),
(11, 41, 0.09331),
(17, 41, 0.09331),
(1, 41, 0.18662),
(4, 41, 0.18662),
(14, 41, 0.18662),
(18, 41, 0.18662),
(19, 41, 1.02641),
(1, 42, 0.46662),
(4, 42, 0.46662),
(17, 42, 0.69993),
(19, 42, 2.79972),
(4, 70, 0.17),
(17, 70, 0.37),
(19, 70, 0.37),
(4, 71, 0.37331),
(4, 72, 0.56004),
(11, 72, 0.56004),
(14, 72, 0.56004),
(17, 72, 0.56004),
(18, 72, 0.56004),
(19, 72, 0.56004),
(11, 73, 0.17),
(14, 73, 0.44),
(11, 77, 0.18669),
(14, 77, 0.18669),
(18, 77, 0.18669),
(17, 77, 0.37338),
(19, 77, 2.24028),
(14, 79, 0.09331),
(18, 79, 0.09331),
(11, 79, 0.18662),
(17, 79, 0.37324),
(19, 79, 0.83979),
(10, 83, 1.72679),
(17, 83, 1.72679),
(11, 83, 2.05348),
(10, 87, 1.97321),
(11, 87, 2.34652),
(11, 93, 0.32669),
(14, 93, 0.32669),
(17, 93, 0.32669),
(18, 93, 0.32669),
(19, 93, 2.61352),
(19, 104, 0.17),
(18, 104, 0.44),
(14, 105, 0.37331),
(18, 105, 0.37331),
(19, 105, 0.37331),
(14, 106, 0.32669),
(18, 106, 0.32669),
(14, 107, 0.37331),
(18, 107, 0.37331),
(19, 107, 0.74662),
(14, 108, 0.28),
(17, 108, 0.28),
(18, 108, 0.28),
(19, 108, 1.68),
(17, 109, 0.32669),
(14, 109, 0.65338),
(18, 109, 0.65338),
(19, 109, 4.57366),
(14, 110, 0.18669),
(17, 110, 0.18669),
(18, 110, 0.18669),
(19, 110, 0.74676),
(14, 111, 0.46662),
(18, 111, 0.46662),
(19, 111, 1.16655),
(14, 112, 0.18669),
(18, 112, 0.18669),
(19, 112, 0.37338),
(14, 113, 0.28),
(17, 113, 0.28),
(18, 113, 0.28),
(19, 113, 1.68),
(14, 114, 0.23331),
(18, 114, 0.23331),
(19, 114, 1.63317),
(14, 115, 0.23331),
(17, 115, 0.23331),
(18, 115, 0.23331),
(19, 115, 1.39986),
(14, 116, 0.42),
(18, 116, 0.42),
(17, 116, 0.84),
(19, 116, 1.26),
(14, 117, 0.18669),
(18, 117, 0.18669),
(17, 117, 0.37338),
(19, 117, 1.30683),
(14, 118, 0.42),
(18, 118, 0.42),
(19, 118, 2.52),
(14, 119, 0.32669),
(18, 119, 0.32669),
(9, 137, 0.34),
(9, 138, 2.96),
(14, 138, 2.96),
(18, 138, 2.96),
(19, 138, 2.96),
(10, 140, 0.34),
(11, 141, 0.04669),
(17, 141, 0.09338),
(19, 141, 0.28014),
(11, 142, 0.32669),
(17, 142, 0.32669),
(19, 142, 3.92028),
(11, 143, 0.09331),
(17, 143, 0.18662),
(19, 143, 0.37324),
(11, 144, 0.23331),
(19, 144, 0.23331),
(11, 145, 0.23331),
(19, 145, 1.39986),
(11, 146, 0.23331),
(17, 146, 0.69993),
(19, 146, 1.39986),
(11, 147, 0.28),
(19, 147, 0.98),
(11, 148, 0.18669),
(17, 148, 0.18669),
(19, 148, 0.93345),
(11, 149, 0.42),
(17, 149, 0.42),
(19, 149, 0.42),
(11, 150, 0.32669),
(19, 150, 0.65338),
(11, 151, 0.37331),
(19, 151, 1.86655),
(11, 152, 0.56),
(19, 152, 2.8),
(11, 153, 0.51331),
(19, 153, 1.53993),
(11, 154, 0.28),
(19, 154, 1.96),
(11, 155, 0.37331),
(17, 155, 0.37331),
(19, 155, 0.74662),
(14, 157, 0.17),
(17, 159, 0.17),
(17, 160, 0.18662),
(19, 160, 0.74648),
(17, 161, 0.28),
(19, 161, 0.84),
(17, 162, 0.32669),
(19, 162, 1.30676),
(17, 163, 0.37338),
(17, 164, 0.98007),
(19, 164, 2.28683),
(17, 165, 0.51331),
(19, 165, 1.53993),
(17, 166, 0.42),
(19, 166, 1.26),
(17, 167, 0.14),
(17, 168, 0.32669),
(17, 169, 0.84),
(19, 169, 0.84),
(17, 170, 0.23331),
(19, 170, 0.69993),
(17, 171, 0.09331),
(19, 171, 0.74648),
(17, 172, 0.37331),
(19, 172, 1.49324),
(17, 173, 0.42),
(19, 174, 0.23331),
(17, 174, 0.46662),
(17, 175, 0.42),
(19, 175, 2.1),
(17, 176, 0.98007),
(19, 176, 1.63345),
(17, 177, 0.65338),
(19, 177, 1.30676),
(17, 178, 0.37331),
(19, 178, 0.74662),
(17, 179, 0.42),
(19, 179, 0.84),
(17, 180, 0.14),
(19, 180, 0.28),
(17, 181, 0.32669),
(19, 181, 0.65338),
(17, 182, 0.46655),
(19, 182, 0.9331),
(17, 183, 0.46662),
(19, 183, 0.46662),
(17, 184, 0.69993),
(19, 184, 1.16655),
(17, 185, 0.28),
(19, 185, 0.28),
(19, 186, 0.23331),
(17, 186, 0.46662),
(17, 187, 0.32669),
(17, 188, 0.23331),
(19, 188, 0.23331),
(17, 189, 0.37338),
(19, 189, 0.37338),
(17, 190, 0.28),
(19, 190, 0.84),
(17, 191, 1.72679),
(17, 192, 0.37331),
(19, 192, 0.74662),
(17, 193, 0.18669),
(19, 193, 1.12014),
(17, 194, 0.37331),
(19, 194, 0.37331),
(17, 195, 0.28),
(17, 196, 0.42),
(19, 196, 3.36),
(17, 197, 0.28),
(19, 197, 1.68),
(17, 198, 0.56),
(19, 198, 1.4),
(17, 199, 0.51331),
(19, 199, 3.07986),
(17, 200, 0.37331),
(19, 200, 0.74662),
(17, 201, 0.46669),
(19, 201, 1.86676),
(18, 222, 0.17),
(19, 223, 0.93324),
(19, 224, 0.32669),
(19, 225, 1.96),
(19, 226, 3.36),
(19, 227, 0.84),
(19, 228, 1.11993),
(19, 229, 3.36),
(19, 230, 0.42),
(19, 231, 0.37338),
(19, 232, 0.74662),
(19, 233, 0.84),
(19, 234, 0.18669),
(19, 235, 0.18669),
(19, 236, 0.28),
(19, 237, 0.7),
(19, 238, 1.49324),
(19, 239, 1.26),
(19, 240, 0.46662),
(19, 241, 0.84),
(19, 242, 1.49324),
(19, 243, 0.32669),
(19, 244, 1.30676),
(19, 245, 0.56),
(19, 246, 0.84),
(19, 247, 0.28),
(19, 248, 1.86655),
(19, 249, 1.12),
(19, 250, 0.46655),
(19, 251, 0.74662),
(19, 252, 0.14),
(19, 253, 0.42),
(19, 254, 0.18669),
(19, 255, 1.68),
(19, 256, 1.49324),
(19, 257, 0.23331),
(19, 258, 1.96014),
(19, 259, 0.46662),
(19, 260, 0.65338),
(19, 261, 0.98007),
(19, 262, 0.42),
(19, 263, 0.28),
(19, 264, 1.68),
(19, 265, 1.53993),
(19, 266, 0.28),
(19, 267, 0.28),
(19, 268, 0.93324),
(19, 269, 1.49324),
(19, 270, 1.68);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_logging`
--

CREATE TABLE `hde5p_finder_logging` (
  `searchterm` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `md5sum` varchar(32) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `query` blob NOT NULL,
  `hits` int(11) NOT NULL DEFAULT 1,
  `results` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_taxonomy`
--

CREATE TABLE `hde5p_finder_taxonomy` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `state` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `access` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_finder_taxonomy`
--

INSERT INTO `hde5p_finder_taxonomy` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `state`, `access`, `language`) VALUES
(1, 0, 0, 23, 0, '', 'ROOT', 'root', 1, 1, '*'),
(2, 1, 1, 6, 1, 'type', 'Type', 'type', 1, 1, ''),
(3, 2, 2, 3, 2, 'type/category', 'Category', 'category', 1, 1, ''),
(4, 1, 7, 10, 1, 'language', 'Language', 'language', 1, 1, ''),
(5, 4, 8, 9, 2, 'language/faef360113599eb6a0282d981cc199d8', '*', 'faef360113599eb6a0282d981cc199d8', 1, 1, ''),
(6, 2, 4, 5, 2, 'type/article', 'Article', 'article', 1, 1, ''),
(7, 1, 11, 14, 1, 'author', 'Author', 'author', 1, 1, ''),
(8, 7, 12, 13, 2, 'author/devjavu', 'DevJavu', 'devjavu', 1, 1, ''),
(9, 1, 15, 22, 1, 'category', 'Category', 'category', 1, 1, ''),
(10, 9, 16, 17, 2, 'category/uncategorised', 'Uncategorised', 'uncategorised', 1, 1, '*'),
(11, 9, 18, 19, 2, 'category/announcement', 'Announcement', 'announcement', 1, 1, '*'),
(12, 9, 20, 21, 2, 'category/ongoing-programs', 'Ongoing Programs', 'ongoing-programs', 1, 1, '*');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_taxonomy_map`
--

CREATE TABLE `hde5p_finder_taxonomy_map` (
  `link_id` int(10) UNSIGNED NOT NULL,
  `node_id` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_finder_taxonomy_map`
--

INSERT INTO `hde5p_finder_taxonomy_map` (`link_id`, `node_id`) VALUES
(1, 3),
(1, 5),
(4, 5),
(4, 6),
(4, 8),
(4, 10),
(9, 3),
(9, 5),
(10, 3),
(10, 5),
(11, 5),
(11, 6),
(11, 8),
(11, 10),
(14, 5),
(14, 6),
(14, 8),
(14, 11),
(17, 5),
(17, 6),
(17, 8),
(17, 12),
(18, 5),
(18, 6),
(18, 8),
(18, 11),
(19, 5),
(19, 6),
(19, 8),
(19, 11);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_terms`
--

CREATE TABLE `hde5p_finder_terms` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `weight` float UNSIGNED NOT NULL DEFAULT 0,
  `soundex` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `links` int(11) NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_finder_terms`
--

INSERT INTO `hde5p_finder_terms` (`term_id`, `term`, `stem`, `common`, `phrase`, `weight`, `soundex`, `links`, `language`) VALUES
(1, '8', '8', 0, 0, 0.1, '', 1, '*'),
(2, 'adipiscing', 'adipiscing', 0, 0, 0.6667, 'A31252', 7, '*'),
(3, 'aliqua', 'aliqua', 0, 0, 0.4, 'A420', 7, '*'),
(4, 'amet', 'amet', 0, 0, 0.2667, 'A530', 7, '*'),
(5, 'arcu', 'arcu', 0, 0, 0.2667, 'A620', 5, '*'),
(6, 'auctor', 'auctor', 0, 0, 0.4, 'A236', 4, '*'),
(7, 'consectetur', 'consectetur', 0, 0, 0.7333, 'C5236', 7, '*'),
(8, 'cras', 'cras', 0, 0, 0.2667, 'C620', 4, '*'),
(9, 'diam', 'diam', 0, 0, 0.2667, 'D500', 3, '*'),
(10, 'do', 'do', 0, 0, 0.1333, 'D000', 7, '*'),
(11, 'dolor', 'dolor', 0, 0, 0.3333, 'D460', 7, '*'),
(12, 'dolore', 'dolore', 0, 0, 0.4, 'D460', 7, '*'),
(13, 'eiusmod', 'eiusmod', 0, 0, 0.4667, 'E253', 7, '*'),
(14, 'elit', 'elit', 0, 0, 0.2667, 'E430', 7, '*'),
(15, 'et', 'et', 0, 0, 0.1333, 'E300', 7, '*'),
(16, 'incididunt', 'incididunt', 0, 0, 0.6667, 'I52353', 7, '*'),
(17, 'integer', 'integer', 0, 0, 0.4667, 'I5326', 4, '*'),
(18, 'ipsum', 'ipsum', 0, 0, 0.3333, 'I125', 7, '*'),
(19, 'labore', 'labore', 0, 0, 0.4, 'L160', 7, '*'),
(20, 'leo', 'leo', 0, 0, 0.2, 'L000', 3, '*'),
(21, 'lorem', 'lorem', 0, 0, 0.3333, 'L650', 7, '*'),
(22, 'magna', 'magna', 0, 0, 0.3333, 'M250', 7, '*'),
(23, 'malesuada', 'malesuada', 0, 0, 0.6, 'M423', 4, '*'),
(24, 'mauris', 'mauris', 0, 0, 0.4, 'M620', 3, '*'),
(25, 'nec', 'nec', 0, 0, 0.2, 'N200', 4, '*'),
(26, 'neque', 'neque', 0, 0, 0.3333, 'N200', 4, '*'),
(27, 'nulla', 'nulla', 0, 0, 0.3333, 'N400', 5, '*'),
(28, 'nunc', 'nunc', 0, 0, 0.2667, 'N200', 4, '*'),
(29, 'odio', 'odio', 0, 0, 0.2667, 'O300', 4, '*'),
(30, 'ornare', 'ornare', 0, 0, 0.4, 'O656', 3, '*'),
(31, 'pellentesque', 'pellentesque', 0, 0, 0.8, 'P4532', 4, '*'),
(32, 'pharetra', 'pharetra', 0, 0, 0.5333, 'P636', 4, '*'),
(33, 'quam', 'quam', 0, 0, 0.2667, 'Q500', 5, '*'),
(34, 'sed', 'sed', 0, 0, 0.2, 'S300', 7, '*'),
(35, 'sem', 'sem', 0, 0, 0.2, 'S500', 4, '*'),
(36, 'semper', 'semper', 0, 0, 0.4, 'S516', 4, '*'),
(37, 'sit', 'sit', 0, 0, 0.2, 'S300', 7, '*'),
(38, 'tempor', 'tempor', 0, 0, 0.4, 'T516', 7, '*'),
(39, 'tempus', 'tempus', 0, 0, 0.4, 'T512', 4, '*'),
(40, 'ultricies', 'ultricies', 0, 0, 0.6, 'U4362', 4, '*'),
(41, 'ut', 'ut', 0, 0, 0.1333, 'U300', 7, '*'),
(42, 'vitae', 'vitae', 0, 0, 0.3333, 'V300', 4, '*'),
(70, '1', '1', 0, 0, 0.1, '', 3, '*'),
(71, 'articulo', 'articulo', 0, 0, 0.5333, 'A6324', 1, '*'),
(72, 'devjavu', 'devjavu', 0, 0, 0.4667, 'D121', 6, '*'),
(73, '2', '2', 0, 0, 0.1, '', 2, '*'),
(77, 'eget', 'eget', 0, 0, 0.2667, 'E230', 5, '*'),
(79, 'in', 'in', 0, 0, 0.1333, 'I500', 5, '*'),
(83, 'ongoing', 'ongoing', 0, 0, 0.4667, 'O5252', 3, '*'),
(87, 'programs', 'programs', 0, 0, 0.5333, 'P62652', 2, '*'),
(93, 'viverra', 'viverra', 0, 0, 0.4667, 'V600', 5, '*'),
(104, '3', '3', 0, 0, 0.1, '', 2, '*'),
(105, 'accumsan', 'accumsan', 0, 0, 0.5333, 'A2525', 3, '*'),
(106, 'article', 'article', 0, 0, 0.4667, 'A6324', 2, '*'),
(107, 'bibendum', 'bibendum', 0, 0, 0.5333, 'B535', 3, '*'),
(108, 'cursus', 'cursus', 0, 0, 0.4, 'C620', 4, '*'),
(109, 'egestas', 'egestas', 0, 0, 0.4667, 'E232', 4, '*'),
(110, 'enim', 'enim', 0, 0, 0.2667, 'E500', 4, '*'),
(111, 'felis', 'felis', 0, 0, 0.3333, 'F420', 3, '*'),
(112, 'nisl', 'nisl', 0, 0, 0.2667, 'N240', 3, '*'),
(113, 'nullam', 'nullam', 0, 0, 0.4, 'N450', 4, '*'),
(114, 'purus', 'purus', 0, 0, 0.3333, 'P620', 3, '*'),
(115, 'risus', 'risus', 0, 0, 0.3333, 'R200', 4, '*'),
(116, 'tristique', 'tristique', 0, 0, 0.6, 'T6232', 4, '*'),
(117, 'urna', 'urna', 0, 0, 0.2667, 'U650', 4, '*'),
(118, 'venenatis', 'venenatis', 0, 0, 0.6, 'V532', 3, '*'),
(119, 'vivamus', 'vivamus', 0, 0, 0.4667, 'V520', 2, '*'),
(137, '10', '10', 0, 0, 0.2, '', 2, '*'),
(138, 'announcement', 'announcement', 0, 0, 0.8, 'A5253', 5, '*'),
(140, '11', '11', 0, 0, 0.2, '', 1, '*'),
(141, 'a', 'a', 0, 0, 0.0667, 'A000', 3, '*'),
(142, 'aliquam', 'aliquam', 0, 0, 0.4667, 'A425', 3, '*'),
(143, 'at', 'at', 0, 0, 0.1333, 'A300', 3, '*'),
(144, 'etiam', 'etiam', 0, 0, 0.3333, 'E350', 2, '*'),
(145, 'lacus', 'lacus', 0, 0, 0.3333, 'L200', 2, '*'),
(146, 'morbi', 'morbi', 0, 0, 0.3333, 'M610', 3, '*'),
(147, 'non', 'non', 0, 0, 0.2, 'N000', 2, '*'),
(148, 'orci', 'orci', 0, 0, 0.2667, 'O620', 3, '*'),
(149, 'porttitor', 'porttitor', 0, 0, 0.6, 'P636', 3, '*'),
(150, 'posuere', 'posuere', 0, 0, 0.4667, 'P260', 2, '*'),
(151, 'sagittis', 'sagittis', 0, 0, 0.5333, 'S320', 2, '*'),
(152, 'sollicitudin', 'sollicitudin', 0, 0, 0.8, 'S4235', 2, '*'),
(153, 'suspendisse', 'suspendisse', 0, 0, 0.7333, 'S1532', 2, '*'),
(154, 'tellus', 'tellus', 0, 0, 0.4, 'T420', 2, '*'),
(155, 'ultrices', 'ultrices', 0, 0, 0.5333, 'U4362', 3, '*'),
(157, '4', '4', 0, 0, 0.1, '', 1, '*'),
(159, '6', '6', 0, 0, 0.1, '', 1, '*'),
(160, 'ac', 'ac', 0, 0, 0.1333, 'A200', 2, '*'),
(161, 'aenean', 'aenean', 0, 0, 0.4, 'A500', 2, '*'),
(162, 'aliquet', 'aliquet', 0, 0, 0.4667, 'A423', 2, '*'),
(163, 'ante', 'ante', 0, 0, 0.2667, 'A530', 1, '*'),
(164, 'commodo', 'commodo', 0, 0, 0.4667, 'C530', 2, '*'),
(165, 'condimentum', 'condimentum', 0, 0, 0.7333, 'C53535', 2, '*'),
(166, 'convallis', 'convallis', 0, 0, 0.6, 'C5142', 2, '*'),
(167, 'cum', 'cum', 0, 0, 0.2, 'C500', 1, '*'),
(168, 'dapibus', 'dapibus', 0, 0, 0.4667, 'D120', 1, '*'),
(169, 'dictum', 'dictum', 0, 0, 0.4, 'D235', 2, '*'),
(170, 'donec', 'donec', 0, 0, 0.3333, 'D520', 2, '*'),
(171, 'eu', 'eu', 0, 0, 0.1333, 'E000', 2, '*'),
(172, 'facilisi', 'facilisi', 0, 0, 0.5333, 'F242', 2, '*'),
(173, 'facilisis', 'facilisis', 0, 0, 0.6, 'F242', 1, '*'),
(174, 'fames', 'fames', 0, 0, 0.3333, 'F520', 2, '*'),
(175, 'fermentum', 'fermentum', 0, 0, 0.6, 'F6535', 2, '*'),
(176, 'feugiat', 'feugiat', 0, 0, 0.4667, 'F230', 2, '*'),
(177, 'gravida', 'gravida', 0, 0, 0.4667, 'G613', 2, '*'),
(178, 'habitant', 'habitant', 0, 0, 0.5333, 'H1353', 2, '*'),
(179, 'habitasse', 'habitasse', 0, 0, 0.6, 'H132', 2, '*'),
(180, 'hac', 'hac', 0, 0, 0.2, 'H200', 2, '*'),
(181, 'iaculis', 'iaculis', 0, 0, 0.4667, 'I242', 2, '*'),
(182, 'id', 'id', 0, 0, 0.1333, 'I300', 2, '*'),
(183, 'justo', 'justo', 0, 0, 0.3333, 'J300', 2, '*'),
(184, 'massa', 'massa', 0, 0, 0.3333, 'M200', 2, '*'),
(185, 'mattis', 'mattis', 0, 0, 0.4, 'M320', 2, '*'),
(186, 'metus', 'metus', 0, 0, 0.3333, 'M320', 2, '*'),
(187, 'natoque', 'natoque', 0, 0, 0.4667, 'N320', 1, '*'),
(188, 'netus', 'netus', 0, 0, 0.3333, 'N320', 2, '*'),
(189, 'nibh', 'nibh', 0, 0, 0.2667, 'N100', 2, '*'),
(190, 'platea', 'platea', 0, 0, 0.4, 'P430', 2, '*'),
(191, 'program', 'program', 0, 0, 0.4667, 'P6265', 1, '*'),
(192, 'pulvinar', 'pulvinar', 0, 0, 0.5333, 'P4156', 2, '*'),
(193, 'quis', 'quis', 0, 0, 0.2667, 'Q000', 2, '*'),
(194, 'senectus', 'senectus', 0, 0, 0.5333, 'S5232', 2, '*'),
(195, 'sociis', 'sociis', 0, 0, 0.4, 'S000', 1, '*'),
(196, 'tincidunt', 'tincidunt', 0, 0, 0.6, 'T52353', 2, '*'),
(197, 'tortor', 'tortor', 0, 0, 0.4, 'T636', 2, '*'),
(198, 'turpis', 'turpis', 0, 0, 0.4, 'T612', 2, '*'),
(199, 'ullamcorper', 'ullamcorper', 0, 0, 0.7333, 'U452616', 2, '*'),
(200, 'vehicula', 'vehicula', 0, 0, 0.5333, 'V240', 2, '*'),
(201, 'vestibulum', 'vestibulum', 0, 0, 0.6667, 'V23145', 2, '*'),
(222, '5', '5', 0, 0, 0.1, '', 1, '*'),
(223, 'augue', 'augue', 0, 0, 0.3333, 'A200', 1, '*'),
(224, 'blandit', 'blandit', 0, 0, 0.4667, 'B453', 1, '*'),
(225, 'congue', 'congue', 0, 0, 0.4, 'C520', 1, '*'),
(226, 'consequat', 'consequat', 0, 0, 0.6, 'C523', 1, '*'),
(227, 'curabitur', 'curabitur', 0, 0, 0.6, 'C6136', 1, '*'),
(228, 'dictumst', 'dictumst', 0, 0, 0.5333, 'D23523', 1, '*'),
(229, 'dignissim', 'dignissim', 0, 0, 0.6, 'D2525', 1, '*'),
(230, 'dui', 'dui', 0, 0, 0.2, 'D000', 1, '*'),
(231, 'duis', 'duis', 0, 0, 0.2667, 'D200', 1, '*'),
(232, 'eleifend', 'eleifend', 0, 0, 0.5333, 'E4153', 1, '*'),
(233, 'elementum', 'elementum', 0, 0, 0.6, 'E4535', 1, '*'),
(234, 'erat', 'erat', 0, 0, 0.2667, 'E630', 1, '*'),
(235, 'eros', 'eros', 0, 0, 0.2667, 'E620', 1, '*'),
(236, 'est', 'est', 0, 0, 0.2, 'E230', 1, '*'),
(237, 'estpellentesque', 'estpellentesque', 0, 0, 1, 'E2314532', 1, '*'),
(238, 'faucibus', 'faucibus', 0, 0, 0.5333, 'F212', 1, '*'),
(239, 'fringilla', 'fringilla', 0, 0, 0.6, 'F6524', 1, '*'),
(240, 'fusce', 'fusce', 0, 0, 0.3333, 'F200', 1, '*'),
(241, 'imperdiet', 'imperdiet', 0, 0, 0.6, 'I5163', 1, '*'),
(242, 'interdum', 'interdum', 0, 0, 0.5333, 'I53635', 1, '*'),
(243, 'lacinia', 'lacinia', 0, 0, 0.4667, 'L250', 1, '*'),
(244, 'laoreet', 'laoreet', 0, 0, 0.4667, 'L630', 1, '*'),
(245, 'lectus', 'lectus', 0, 0, 0.4, 'L232', 1, '*'),
(246, 'libero', 'libero', 0, 0, 0.4, 'L160', 1, '*'),
(247, 'ligula', 'ligula', 0, 0, 0.4, 'L240', 1, '*'),
(248, 'lobortis', 'lobortis', 0, 0, 0.5333, 'L1632', 1, '*'),
(249, 'luctus', 'luctus', 0, 0, 0.4, 'L232', 1, '*'),
(250, 'mi', 'mi', 0, 0, 0.1333, 'M000', 1, '*'),
(251, 'molestie', 'molestie', 0, 0, 0.5333, 'M423', 1, '*'),
(252, 'mus', 'mus', 0, 0, 0.2, 'M200', 1, '*'),
(253, 'nam', 'nam', 0, 0, 0.2, 'N000', 1, '*'),
(254, 'nisi', 'nisi', 0, 0, 0.2667, 'N200', 1, '*'),
(255, 'phasellus', 'phasellus', 0, 0, 0.6, 'P242', 1, '*'),
(256, 'placerat', 'placerat', 0, 0, 0.5333, 'P4263', 1, '*'),
(257, 'porta', 'porta', 0, 0, 0.3333, 'P630', 1, '*'),
(258, 'pretium', 'pretium', 0, 0, 0.4667, 'P635', 1, '*'),
(259, 'proin', 'proin', 0, 0, 0.3333, 'P650', 1, '*'),
(260, 'quisque', 'quisque', 0, 0, 0.4667, 'Q000', 1, '*'),
(261, 'rhoncus', 'rhoncus', 0, 0, 0.4667, 'R520', 1, '*'),
(262, 'ridiculus', 'ridiculus', 0, 0, 0.6, 'R3242', 1, '*'),
(263, 'rutrum', 'rutrum', 0, 0, 0.4, 'R365', 1, '*'),
(264, 'sapien', 'sapien', 0, 0, 0.4, 'S150', 1, '*'),
(265, 'scelerisque', 'scelerisque', 0, 0, 0.7333, 'S462', 1, '*'),
(266, 'varius', 'varius', 0, 0, 0.4, 'V620', 1, '*'),
(267, 'vel', 'vel', 0, 0, 0.2, 'V400', 1, '*'),
(268, 'velit', 'velit', 0, 0, 0.3333, 'V430', 1, '*'),
(269, 'volutpat', 'volutpat', 0, 0, 0.5333, 'V4313', 1, '*'),
(270, 'vulputate', 'vulputate', 0, 0, 0.6, 'V413', 1, '*');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_terms_common`
--

CREATE TABLE `hde5p_finder_terms_common` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `custom` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_finder_terms_common`
--

INSERT INTO `hde5p_finder_terms_common` (`term`, `language`, `custom`) VALUES
('a', 'en', 0),
('about', 'en', 0),
('above', 'en', 0),
('after', 'en', 0),
('again', 'en', 0),
('against', 'en', 0),
('all', 'en', 0),
('am', 'en', 0),
('an', 'en', 0),
('and', 'en', 0),
('any', 'en', 0),
('are', 'en', 0),
('aren\'t', 'en', 0),
('as', 'en', 0),
('at', 'en', 0),
('be', 'en', 0),
('because', 'en', 0),
('been', 'en', 0),
('before', 'en', 0),
('being', 'en', 0),
('below', 'en', 0),
('between', 'en', 0),
('both', 'en', 0),
('but', 'en', 0),
('by', 'en', 0),
('can\'t', 'en', 0),
('cannot', 'en', 0),
('could', 'en', 0),
('couldn\'t', 'en', 0),
('did', 'en', 0),
('didn\'t', 'en', 0),
('do', 'en', 0),
('does', 'en', 0),
('doesn\'t', 'en', 0),
('doing', 'en', 0),
('don\'t', 'en', 0),
('down', 'en', 0),
('during', 'en', 0),
('each', 'en', 0),
('few', 'en', 0),
('for', 'en', 0),
('from', 'en', 0),
('further', 'en', 0),
('had', 'en', 0),
('hadn\'t', 'en', 0),
('has', 'en', 0),
('hasn\'t', 'en', 0),
('have', 'en', 0),
('haven\'t', 'en', 0),
('having', 'en', 0),
('he', 'en', 0),
('he\'d', 'en', 0),
('he\'ll', 'en', 0),
('he\'s', 'en', 0),
('her', 'en', 0),
('here', 'en', 0),
('here\'s', 'en', 0),
('hers', 'en', 0),
('herself', 'en', 0),
('him', 'en', 0),
('himself', 'en', 0),
('his', 'en', 0),
('how', 'en', 0),
('how\'s', 'en', 0),
('i', 'en', 0),
('i\'d', 'en', 0),
('i\'ll', 'en', 0),
('i\'m', 'en', 0),
('i\'ve', 'en', 0),
('if', 'en', 0),
('in', 'en', 0),
('into', 'en', 0),
('is', 'en', 0),
('isn\'t', 'en', 0),
('it', 'en', 0),
('it\'s', 'en', 0),
('its', 'en', 0),
('itself', 'en', 0),
('let\'s', 'en', 0),
('me', 'en', 0),
('more', 'en', 0),
('most', 'en', 0),
('mustn\'t', 'en', 0),
('my', 'en', 0),
('myself', 'en', 0),
('no', 'en', 0),
('nor', 'en', 0),
('not', 'en', 0),
('of', 'en', 0),
('off', 'en', 0),
('on', 'en', 0),
('once', 'en', 0),
('only', 'en', 0),
('or', 'en', 0),
('other', 'en', 0),
('ought', 'en', 0),
('our', 'en', 0),
('ours', 'en', 0),
('ourselves', 'en', 0),
('out', 'en', 0),
('over', 'en', 0),
('own', 'en', 0),
('same', 'en', 0),
('shan\'t', 'en', 0),
('she', 'en', 0),
('she\'d', 'en', 0),
('she\'ll', 'en', 0),
('she\'s', 'en', 0),
('should', 'en', 0),
('shouldn\'t', 'en', 0),
('so', 'en', 0),
('some', 'en', 0),
('such', 'en', 0),
('than', 'en', 0),
('that', 'en', 0),
('that\'s', 'en', 0),
('the', 'en', 0),
('their', 'en', 0),
('theirs', 'en', 0),
('them', 'en', 0),
('themselves', 'en', 0),
('then', 'en', 0),
('there', 'en', 0),
('there\'s', 'en', 0),
('these', 'en', 0),
('they', 'en', 0),
('they\'d', 'en', 0),
('they\'ll', 'en', 0),
('they\'re', 'en', 0),
('they\'ve', 'en', 0),
('this', 'en', 0),
('those', 'en', 0),
('through', 'en', 0),
('to', 'en', 0),
('too', 'en', 0),
('under', 'en', 0),
('until', 'en', 0),
('up', 'en', 0),
('very', 'en', 0),
('was', 'en', 0),
('wasn\'t', 'en', 0),
('we', 'en', 0),
('we\'d', 'en', 0),
('we\'ll', 'en', 0),
('we\'re', 'en', 0),
('we\'ve', 'en', 0),
('were', 'en', 0),
('weren\'t', 'en', 0),
('what', 'en', 0),
('what\'s', 'en', 0),
('when', 'en', 0),
('when\'s', 'en', 0),
('where', 'en', 0),
('where\'s', 'en', 0),
('which', 'en', 0),
('while', 'en', 0),
('who', 'en', 0),
('who\'s', 'en', 0),
('whom', 'en', 0),
('why', 'en', 0),
('why\'s', 'en', 0),
('with', 'en', 0),
('won\'t', 'en', 0),
('would', 'en', 0),
('wouldn\'t', 'en', 0),
('you', 'en', 0),
('you\'d', 'en', 0),
('you\'ll', 'en', 0),
('you\'re', 'en', 0),
('you\'ve', 'en', 0),
('your', 'en', 0),
('yours', 'en', 0),
('yourself', 'en', 0),
('yourselves', 'en', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_tokens`
--

CREATE TABLE `hde5p_finder_tokens` (
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `weight` float UNSIGNED NOT NULL DEFAULT 1,
  `context` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_tokens_aggregate`
--

CREATE TABLE `hde5p_finder_tokens_aggregate` (
  `term_id` int(10) UNSIGNED NOT NULL,
  `term` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `stem` varchar(75) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `common` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `phrase` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `term_weight` float UNSIGNED NOT NULL DEFAULT 0,
  `context` tinyint(3) UNSIGNED NOT NULL DEFAULT 2,
  `context_weight` float UNSIGNED NOT NULL DEFAULT 0,
  `total_weight` float UNSIGNED NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=MEMORY DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_finder_types`
--

CREATE TABLE `hde5p_finder_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mime` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_finder_types`
--

INSERT INTO `hde5p_finder_types` (`id`, `title`, `mime`) VALUES
(1, 'Category', ''),
(2, 'Contact', ''),
(3, 'Article', ''),
(4, 'News Feed', ''),
(5, 'Tag', '');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_history`
--

CREATE TABLE `hde5p_history` (
  `version_id` int(10) UNSIGNED NOT NULL,
  `item_id` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version_note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Optional version name',
  `save_date` datetime NOT NULL,
  `editor_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `character_count` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Number of characters in this version.',
  `sha1_hash` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'SHA1 hash of the version_data column.',
  `version_data` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'json-encoded string of version data',
  `keep_forever` tinyint(4) NOT NULL DEFAULT 0 COMMENT '0=auto delete; 1=keep'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_history`
--

INSERT INTO `hde5p_history` (`version_id`, `item_id`, `version_note`, `save_date`, `editor_user_id`, `character_count`, `sha1_hash`, `version_data`, `keep_forever`) VALUES
(1, 'com_content.category.8', '', '2023-04-11 05:17:37', 101, 890, '2e8a9cf921f92aaf6fb5825fafd1e3edd44e6ca9', '{\"id\":8,\"asset_id\":91,\"parent_id\":2,\"lft\":2,\"rgt\":3,\"level\":2,\"path\":null,\"extension\":\"com_content\",\"title\":\"Lorem Ipsum\",\"alias\":\"lorem-ipsum\",\"note\":\"\",\"description\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem nulla pharetra diam sit amet. Cras semper auctor neque vitae tempus quam pellentesque nec. Dolor sit amet consectetur adipiscing elit. Mauris vitae ultricies leo integer malesuada nunc.<\\/p>\",\"published\":\"0\",\"checked_out\":null,\"checked_out_time\":null,\"access\":1,\"params\":\"{\\\"category_layout\\\":\\\"\\\",\\\"image\\\":\\\"\\\",\\\"image_alt\\\":\\\"\\\"}\",\"metadesc\":\"\",\"metakey\":\"\",\"metadata\":\"{\\\"author\\\":\\\"\\\",\\\"robots\\\":\\\"\\\"}\",\"created_user_id\":101,\"created_time\":\"2023-04-11 05:17:37\",\"modified_user_id\":101,\"modified_time\":\"2023-04-11 05:17:37\",\"hits\":null,\"language\":\"*\",\"version\":null}', 0),
(2, 'com_content.article.1', '', '2023-04-11 05:19:41', 101, 2137, 'a082612401aa7b7be6207b6a1ba6bd5610fc5419', '{\"id\":1,\"asset_id\":92,\"title\":\"Lorem Ipsum\",\"alias\":\"lorem-ipsum\",\"introtext\":\"<p>Lorem ipsum dolor sit amet, articulo consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem nulla pharetra diam sit amet. Cras semper auctor neque vitae tempus quam pellentesque nec. Dolor sit amet consectetur adipiscing elit. Mauris vitae ultricies leo integer malesuada nunc.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-04-11 05:19:41\",\"created_by\":101,\"created_by_alias\":\"\",\"modified\":\"2023-04-11 05:19:41\",\"modified_by\":101,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-04-11 05:19:41\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(3, 'com_content.article.1', '', '2023-04-11 05:22:22', 101, 2153, '292e6b50f94ee92cac1a5a52b5d82db8ac1b8d44', '{\"id\":\"1\",\"asset_id\":92,\"title\":\"Lorem Ipsum\",\"alias\":\"lorem-ipsum\",\"introtext\":\"<p>Lorem ipsum dolor sit amet, articulo consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ornare arcu odio ut sem nulla pharetra diam sit amet. Cras semper auctor neque vitae tempus quam pellentesque nec. Dolor sit amet consectetur adipiscing elit. Mauris vitae ultricies leo integer malesuada nunc.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-04-11 05:19:41\",\"created_by\":\"101\",\"created_by_alias\":\"\",\"modified\":\"2023-04-11 05:22:22\",\"modified_by\":101,\"checked_out\":101,\"checked_out_time\":\"2023-04-11 05:21:29\",\"publish_up\":\"2023-04-11 05:19:41\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"0\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":2,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"1\",\"language\":\"*\",\"note\":\"\"}', 0),
(4, 'com_content.article.2', '', '2023-04-11 13:30:05', 101, 2199, 'a569cb016d2716a8c20eb54898748f11463911a1', '{\"id\":2,\"asset_id\":93,\"title\":\"Ongoing Programs\",\"alias\":\"ongoing-programs\",\"introtext\":\"<h1 style=\\\"text-align: center;\\\">Ongoing Programs<\\/h1>\\r\\n<p style=\\\"text-align: justify;\\\">Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Etiam non quam lacus suspendisse. Viverra adipiscing at in tellus integer. In nulla posuere sollicitudin aliquam ultrices sagittis orci a. Sit amet porttitor eget dolor morbi non.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-04-11 13:30:05\",\"created_by\":101,\"created_by_alias\":\"\",\"modified\":\"2023-04-11 13:30:05\",\"modified_by\":101,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-04-11 13:30:05\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(5, 'com_content.article.3', '', '2023-04-11 13:30:49', 101, 2095, 'b6d37cfb5814f4d47c8c1eb3d75809e4465af94e', '{\"id\":3,\"asset_id\":94,\"title\":\"Article 1\",\"alias\":\"article-1\",\"introtext\":\"<p>Article 1<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-04-11 13:30:49\",\"created_by\":101,\"created_by_alias\":\"\",\"modified\":\"2023-04-11 13:30:49\",\"modified_by\":101,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-04-11 13:30:49\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(6, 'com_content.article.4', '', '2023-04-11 13:52:14', 101, 2097, 'a5568d28f9f3bbd4097c42b8cabfc621c353255a', '{\"id\":4,\"asset_id\":95,\"title\":\"Article 2\",\"alias\":\"article-2\",\"introtext\":\"<h1>Article 2<\\/h1>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-04-11 13:52:14\",\"created_by\":101,\"created_by_alias\":\"\",\"modified\":\"2023-04-11 13:52:14\",\"modified_by\":101,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-04-11 13:52:14\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(7, 'com_content.article.5', '', '2023-04-11 13:52:34', 101, 2095, '6f869914c494f2db12c39c8a6fe76c4895c7623e', '{\"id\":5,\"asset_id\":96,\"title\":\"Article 3\",\"alias\":\"article-3\",\"introtext\":\"<p>Article 3<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-04-11 13:52:34\",\"created_by\":101,\"created_by_alias\":\"\",\"modified\":\"2023-04-11 13:52:34\",\"modified_by\":101,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-04-11 13:52:34\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(8, 'com_content.category.10', '', '2023-04-20 02:30:06', 101, 555, '5fc24cc6cdfd762171c7fdf09e37a23e63a75c99', '{\"id\":10,\"asset_id\":102,\"parent_id\":1,\"lft\":15,\"rgt\":16,\"level\":1,\"path\":null,\"extension\":\"com_content\",\"title\":\"Announcement\",\"alias\":\"announcement\",\"note\":\"\",\"description\":\"\",\"published\":\"1\",\"checked_out\":null,\"checked_out_time\":null,\"access\":1,\"params\":\"{\\\"category_layout\\\":\\\"\\\",\\\"image\\\":\\\"\\\",\\\"image_alt\\\":\\\"\\\"}\",\"metadesc\":\"\",\"metakey\":\"\",\"metadata\":\"{\\\"author\\\":\\\"\\\",\\\"robots\\\":\\\"\\\"}\",\"created_user_id\":101,\"created_time\":\"2023-04-20 02:30:06\",\"modified_user_id\":101,\"modified_time\":\"2023-04-20 02:30:06\",\"hits\":null,\"language\":\"*\",\"version\":null}', 0),
(9, 'com_content.category.11', '', '2023-04-20 02:30:39', 101, 563, '42a39913655d9da25ac99c76f91d8fd0d346bde3', '{\"id\":11,\"asset_id\":103,\"parent_id\":1,\"lft\":17,\"rgt\":18,\"level\":1,\"path\":null,\"extension\":\"com_content\",\"title\":\"Ongoing Programs\",\"alias\":\"ongoing-programs\",\"note\":\"\",\"description\":\"\",\"published\":\"1\",\"checked_out\":null,\"checked_out_time\":null,\"access\":1,\"params\":\"{\\\"category_layout\\\":\\\"\\\",\\\"image\\\":\\\"\\\",\\\"image_alt\\\":\\\"\\\"}\",\"metadesc\":\"\",\"metakey\":\"\",\"metadata\":\"{\\\"author\\\":\\\"\\\",\\\"robots\\\":\\\"\\\"}\",\"created_user_id\":101,\"created_time\":\"2023-04-20 02:30:39\",\"modified_user_id\":101,\"modified_time\":\"2023-04-20 02:30:39\",\"hits\":null,\"language\":\"*\",\"version\":null}', 0),
(10, 'com_content.article.3', '', '2023-04-20 02:41:28', 101, 2116, 'ce0388d7ded3bad3fb1c0333a84c5ff0cc55ca1a', '{\"id\":\"3\",\"asset_id\":94,\"title\":\"Announcement 1\",\"alias\":\"article-1\",\"introtext\":\"<p>Article 1<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":10,\"created\":\"2023-04-11 13:30:49\",\"created_by\":\"101\",\"created_by_alias\":\"\",\"modified\":\"2023-04-20 02:41:28\",\"modified_by\":101,\"checked_out\":101,\"checked_out_time\":\"2023-04-20 02:40:58\",\"publish_up\":\"2023-04-11 13:30:49\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":2,\"ordering\":2,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":4,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(11, 'com_content.article.4', '', '2023-04-20 02:41:46', 101, 2118, '2fab7d949f5d66957cf15f7e94cc012992eb4a9f', '{\"id\":\"4\",\"asset_id\":95,\"title\":\"Announcement 2\",\"alias\":\"article-2\",\"introtext\":\"<h1>Article 2<\\/h1>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":10,\"created\":\"2023-04-11 13:52:14\",\"created_by\":\"101\",\"created_by_alias\":\"\",\"modified\":\"2023-04-20 02:41:46\",\"modified_by\":101,\"checked_out\":101,\"checked_out_time\":\"2023-04-20 02:41:32\",\"publish_up\":\"2023-04-11 13:52:14\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":2,\"ordering\":1,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":2,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(12, 'com_content.article.4', '', '2023-04-20 02:42:06', 101, 2123, 'ab1b86612bdb6404575a00191d502ff142166fe9', '{\"id\":\"4\",\"asset_id\":95,\"title\":\"Announcement 2\",\"alias\":\"announcement-2\",\"introtext\":\"<h1>Article 2<\\/h1>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":10,\"created\":\"2023-04-11 13:52:14\",\"created_by\":\"101\",\"created_by_alias\":\"\",\"modified\":\"2023-04-20 02:42:06\",\"modified_by\":101,\"checked_out\":101,\"checked_out_time\":\"2023-04-20 02:41:52\",\"publish_up\":\"2023-04-11 13:52:14\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":3,\"ordering\":1,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":2,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(13, 'com_content.article.3', '', '2023-04-20 02:42:24', 101, 2121, '11c3c60995fd6af966bdd2692261830a228804e0', '{\"id\":\"3\",\"asset_id\":94,\"title\":\"Announcement 1\",\"alias\":\"announcement-1\",\"introtext\":\"<p>Article 1<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":10,\"created\":\"2023-04-11 13:30:49\",\"created_by\":\"101\",\"created_by_alias\":\"\",\"modified\":\"2023-04-20 02:42:24\",\"modified_by\":101,\"checked_out\":101,\"checked_out_time\":\"2023-04-20 02:42:10\",\"publish_up\":\"2023-04-11 13:30:49\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":3,\"ordering\":2,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":4,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(14, 'com_content.article.5', '', '2023-04-20 02:42:44', 101, 2120, 'ac1471157c109bf1a85bf28a5fdd2ebd18cc1877', '{\"id\":\"5\",\"asset_id\":96,\"title\":\"Announcement 3\",\"alias\":\"announcement-3\",\"introtext\":\"<p>Article 3<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":2,\"created\":\"2023-04-11 13:52:34\",\"created_by\":\"101\",\"created_by_alias\":\"\",\"modified\":\"2023-04-20 02:42:44\",\"modified_by\":101,\"checked_out\":101,\"checked_out_time\":\"2023-04-20 02:42:28\",\"publish_up\":\"2023-04-11 13:52:34\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":2,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(15, 'com_content.article.6', '', '2023-04-20 02:51:33', 101, 2898, '6538e04a43cba5a086bf3854492047dc1782da07', '{\"id\":6,\"asset_id\":104,\"title\":\"Ongoing Program 1\",\"alias\":\"ongoing-program-1\",\"introtext\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eu sem integer vitae justo eget magna fermentum. Feugiat in ante metus dictum at. Urna condimentum mattis pellentesque id. Dictum sit amet justo donec enim. Pellentesque id nibh tortor id. Et malesuada fames ac turpis egestas. Dictum at tempor commodo ullamcorper a. Nulla malesuada pellentesque elit eget gravida cum sociis natoque. Tincidunt id aliquet risus feugiat in ante metus. Cras semper auctor neque vitae tempus quam pellentesque nec.<\\/p>\\r\\n<p>Gravida neque convallis a cras semper auctor neque vitae. Nulla porttitor massa id neque aliquam vestibulum. Ac odio tempor orci dapibus ultrices in iaculis. Commodo nulla facilisi nullam vehicula. Semper feugiat nibh sed pulvinar. Morbi tristique senectus et netus et malesuada fames. Elit pellentesque habitant morbi tristique. Dolor sed viverra ipsum nunc. Tempus urna et pharetra pharetra massa massa ultricies. Facilisis sed odio morbi quis commodo odio aenean sed. Turpis cursus in hac habitasse platea.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":11,\"created\":\"2023-04-20 02:51:33\",\"created_by\":101,\"created_by_alias\":\"\",\"modified\":\"2023-04-20 02:51:33\",\"modified_by\":101,\"checked_out\":null,\"checked_out_time\":null,\"publish_up\":\"2023-04-20 02:51:33\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":\"1\",\"ordering\":null,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":0,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(16, 'com_content.article.5', '', '2023-04-20 05:09:39', 101, 2121, 'b2cb36ed93f209441aaa38551c3026bb98503280', '{\"id\":\"5\",\"asset_id\":96,\"title\":\"Announcement 3\",\"alias\":\"announcement-3\",\"introtext\":\"<p>Article 3<\\/p>\\r\\n<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Egestas purus viverra accumsan in nisl. Enim sit amet venenatis urna cursus. Vivamus arcu felis bibendum ut tristique et egestas. Amet risus nullam eget felis.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":10,\"created\":\"2023-04-11 13:52:34\",\"created_by\":\"101\",\"created_by_alias\":\"\",\"modified\":\"2023-04-20 05:09:39\",\"modified_by\":101,\"checked_out\":101,\"checked_out_time\":\"2023-04-20 05:09:26\",\"publish_up\":\"2023-04-11 13:52:34\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":3,\"ordering\":0,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":1,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0),
(17, 'com_content.article.3', '', '2023-04-20 05:50:17', 101, 6485, '87b9821926812944b703b6d3e31faa324a00fbfd', '{\"id\":\"3\",\"asset_id\":94,\"title\":\"Announcement 1\",\"alias\":\"announcement-1\",\"introtext\":\"<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Eget mauris pharetra et ultrices neque. Velit scelerisque in dictum non consectetur a erat nam. Gravida dictum fusce ut placerat orci nulla pellentesque dignissim enim. Viverra vitae congue eu consequat. Aliquam purus sit amet luctus venenatis. Ridiculus mus mauris vitae ultricies leo. Dictumst quisque sagittis purus sit amet volutpat. Sapien et ligula ullamcorper malesuada proin libero nunc consequat. Pellentesque adipiscing commodo elit at imperdiet dui accumsan sit. Auctor neque vitae tempus quam pellentesque. Ornare suspendisse sed nisi lacus sed viverra tellus in. Lorem donec massa sapien faucibus et molestie ac feugiat. Dignissim enim sit amet venenatis urna. In aliquam sem fringilla ut morbi tincidunt augue interdum velit. Volutpat commodo sed egestas egestas fringilla phasellus faucibus scelerisque. Egestas tellus rutrum tellus pellentesque eu tincidunt tortor aliquam. Massa id neque aliquam vestibulum morbi blandit cursus. Convallis posuere morbi leo urna molestie at elementum eu.<\\/p>\\r\\n<p>Sapien pellentesque habitant morbi tristique. Placerat orci nulla pellentesque dignissim enim sit amet venenatis urna. Ipsum faucibus vitae aliquet nec ullamcorper sit amet risus nullam. Aliquam purus sit amet luctus venenatis lectus. Senectus et netus et malesuada fames ac turpis egestas sed. Eget nulla facilisi etiam dignissim diam quis enim. Urna id volutpat lacus laoreet non curabitur. Egestas dui id ornare arcu. Ut tellus elementum sagittis vitae et leo. Gravida in fermentum et sollicitudin ac orci phasellus egestas tellus. Cras fermentum odio eu feugiat pretium nibh. Sagittis purus sit amet volutpat consequat mauris nunc congue. Quam nulla porttitor massa id neque. Laoreet non curabitur gravida arcu ac tortor dignissim convallis aenean. Mauris commodo quis imperdiet massa tincidunt nunc. Tempus egestas sed sed risus pretium quam. Vitae justo eget magna fermentum iaculis eu non.<\\/p>\\r\\n<p>Est pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Amet risus nullam eget felis eget nunc lobortis mattis aliquam. Turpis nunc eget lorem dolor sed viverra. Mi in nulla posuere sollicitudin aliquam ultrices sagittis. Turpis in eu mi bibendum neque egestas. Mi bibendum neque egestas congue quisque egestas diam. Fermentum et sollicitudin ac orci phasellus egestas tellus. Felis eget velit aliquet sagittis id. In hac habitasse platea dictumst vestibulum. Viverra aliquet eget sit amet. Amet nulla facilisi morbi tempus iaculis urna id. Nisl condimentum id venenatis a condimentum vitae sapien. Quis auctor elit sed vulputate mi sit. Congue eu consequat ac felis donec et odio pellentesque diam. Lacus sed viverra tellus in hac habitasse platea. Nullam vehicula ipsum a arcu cursus vitae congue mauris rhoncus.<\\/p>\\r\\n<p>Vulputate mi sit amet mauris commodo quis. Sit amet commodo nulla facilisi nullam. Sed egestas egestas fringilla phasellus faucibus scelerisque eleifend. Sit amet venenatis urna cursus eget nunc. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis feugiat. Massa vitae tortor condimentum lacinia quis vel eros. Platea dictumst vestibulum rhoncus est. Tempor commodo ullamcorper a lacus vestibulum sed arcu non odio. Tortor at auctor urna nunc id cursus metus aliquam. Risus nullam eget felis eget nunc lobortis. Tincidunt dui ut ornare lectus sit amet est placerat. Pellentesque elit ullamcorper dignissim cras tincidunt lobortis. Proin libero nunc consequat interdum. Elit duis tristique sollicitudin nibh sit amet commodo nulla facilisi. Arcu cursus vitae congue mauris rhoncus aenean. Consectetur adipiscing elit ut aliquam purus sit amet luctus. Mauris augue neque gravida in fermentum et sollicitudin.<\\/p>\\r\\n<p>Nullam vehicula ipsum a arcu cursus. Eleifend donec pretium vulputate sapien nec. Vitae sapien pellentesque habitant morbi tristique. Quam pellentesque nec nam aliquam sem et tortor consequat. Amet consectetur adipiscing elit ut aliquam purus. Adipiscing elit ut aliquam purus sit amet luctus. Feugiat nisl pretium fusce id velit ut tortor pretium viverra. Sed augue lacus viverra vitae congue eu consequat ac felis. Ut consequat semper viverra nam libero justo. Non pulvinar neque laoreet suspendisse interdum. Vel orci porta non pulvinar neque laoreet suspendisse interdum consectetur. Augue eget arcu dictum varius. At quis risus sed vulputate. Turpis egestas pretium aenean pharetra magna ac placerat. Convallis a cras semper auctor. Ornare arcu odio ut sem nulla pharetra diam. Duis ultricies lacus sed turpis tincidunt id aliquet risus feugiat.<\\/p>\",\"fulltext\":\"\",\"state\":\"1\",\"catid\":10,\"created\":\"2023-04-11 13:30:49\",\"created_by\":\"101\",\"created_by_alias\":\"\",\"modified\":\"2023-04-20 05:50:17\",\"modified_by\":101,\"checked_out\":101,\"checked_out_time\":\"2023-04-20 05:49:49\",\"publish_up\":\"2023-04-11 13:30:49\",\"publish_down\":null,\"images\":\"{\\\"image_intro\\\":\\\"\\\",\\\"image_intro_alt\\\":\\\"\\\",\\\"float_intro\\\":\\\"\\\",\\\"image_intro_caption\\\":\\\"\\\",\\\"image_fulltext\\\":\\\"\\\",\\\"image_fulltext_alt\\\":\\\"\\\",\\\"float_fulltext\\\":\\\"\\\",\\\"image_fulltext_caption\\\":\\\"\\\"}\",\"urls\":\"{\\\"urla\\\":\\\"\\\",\\\"urlatext\\\":\\\"\\\",\\\"targeta\\\":\\\"\\\",\\\"urlb\\\":\\\"\\\",\\\"urlbtext\\\":\\\"\\\",\\\"targetb\\\":\\\"\\\",\\\"urlc\\\":\\\"\\\",\\\"urlctext\\\":\\\"\\\",\\\"targetc\\\":\\\"\\\"}\",\"attribs\":\"{\\\"article_layout\\\":\\\"\\\",\\\"show_title\\\":\\\"\\\",\\\"link_titles\\\":\\\"\\\",\\\"show_tags\\\":\\\"\\\",\\\"show_intro\\\":\\\"\\\",\\\"info_block_position\\\":\\\"\\\",\\\"info_block_show_title\\\":\\\"\\\",\\\"show_category\\\":\\\"\\\",\\\"link_category\\\":\\\"\\\",\\\"show_parent_category\\\":\\\"\\\",\\\"link_parent_category\\\":\\\"\\\",\\\"show_author\\\":\\\"\\\",\\\"link_author\\\":\\\"\\\",\\\"show_create_date\\\":\\\"\\\",\\\"show_modify_date\\\":\\\"\\\",\\\"show_publish_date\\\":\\\"\\\",\\\"show_item_navigation\\\":\\\"\\\",\\\"show_hits\\\":\\\"\\\",\\\"show_noauth\\\":\\\"\\\",\\\"urls_position\\\":\\\"\\\",\\\"alternative_readmore\\\":\\\"\\\",\\\"article_page_title\\\":\\\"\\\",\\\"show_publishing_options\\\":\\\"\\\",\\\"show_article_options\\\":\\\"\\\",\\\"show_urls_images_backend\\\":\\\"\\\",\\\"show_urls_images_frontend\\\":\\\"\\\",\\\"helix_ultimate_image\\\":\\\"\\\",\\\"helix_ultimate_image_alt_txt\\\":\\\"\\\",\\\"helix_ultimate_article_format\\\":\\\"standard\\\",\\\"helix_ultimate_audio\\\":\\\"\\\",\\\"helix_ultimate_gallery\\\":\\\"\\\",\\\"helix_ultimate_video\\\":\\\"\\\"}\",\"version\":4,\"ordering\":2,\"metakey\":\"\",\"metadesc\":\"\",\"access\":1,\"hits\":14,\"metadata\":\"{\\\"robots\\\":\\\"\\\",\\\"author\\\":\\\"\\\",\\\"rights\\\":\\\"\\\"}\",\"featured\":\"0\",\"language\":\"*\",\"note\":\"\"}', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_languages`
--

CREATE TABLE `hde5p_languages` (
  `lang_id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lang_code` char(7) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `title` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_native` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sef` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(512) COLLATE utf8mb4_unicode_ci NOT NULL,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `sitename` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` int(11) NOT NULL DEFAULT 0,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_languages`
--

INSERT INTO `hde5p_languages` (`lang_id`, `asset_id`, `lang_code`, `title`, `title_native`, `sef`, `image`, `description`, `metakey`, `metadesc`, `sitename`, `published`, `access`, `ordering`) VALUES
(1, 0, 'en-GB', 'English (en-GB)', 'English (United Kingdom)', 'en', 'en_gb', '', '', '', '', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_mail_templates`
--

CREATE TABLE `hde5p_mail_templates` (
  `template_id` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension` varchar(127) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `htmlbody` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attachments` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_mail_templates`
--

INSERT INTO `hde5p_mail_templates` (`template_id`, `extension`, `language`, `subject`, `body`, `htmlbody`, `attachments`, `params`) VALUES
('com_actionlogs.notification', 'com_actionlogs', '', 'COM_ACTIONLOGS_EMAIL_SUBJECT', 'COM_ACTIONLOGS_EMAIL_BODY', 'COM_ACTIONLOGS_EMAIL_HTMLBODY', '', '{\"tags\":[\"message\",\"date\",\"extension\",\"username\"]}'),
('com_config.test_mail', 'com_config', '', 'COM_CONFIG_SENDMAIL_SUBJECT', 'COM_CONFIG_SENDMAIL_BODY', '', '', '{\"tags\":[\"sitename\",\"method\"]}'),
('com_contact.mail', 'com_contact', '', 'COM_CONTACT_ENQUIRY_SUBJECT', 'COM_CONTACT_ENQUIRY_TEXT', '', '', '{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\"]}'),
('com_contact.mail.copy', 'com_contact', '', 'COM_CONTACT_COPYSUBJECT_OF', 'COM_CONTACT_COPYTEXT_OF', '', '', '{\"tags\":[\"sitename\",\"name\",\"email\",\"subject\",\"body\",\"url\",\"customfields\",\"contactname\"]}'),
('com_messages.new_message', 'com_messages', '', 'COM_MESSAGES_NEW_MESSAGE', 'COM_MESSAGES_NEW_MESSAGE_BODY', '', '', '{\"tags\":[\"subject\",\"message\",\"fromname\",\"sitename\",\"siteurl\",\"fromemail\",\"toname\",\"toemail\"]}'),
('com_privacy.notification.admin.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_EXPORT_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.admin.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_ADMIN_REQUEST_BODY_REMOVE_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.export', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_EXPORT_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_EXPORT_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.notification.remove', 'com_privacy', '', 'COM_PRIVACY_EMAIL_REQUEST_SUBJECT_REMOVE_REQUEST', 'COM_PRIVACY_EMAIL_REQUEST_BODY_REMOVE_REQUEST', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('com_privacy.userdataexport', 'com_privacy', '', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_SUBJECT', 'COM_PRIVACY_EMAIL_DATA_EXPORT_COMPLETED_BODY', '', '', '{\"tags\":[\"sitename\",\"url\"]}'),
('com_users.massmail.mail', 'com_users', '', 'COM_USERS_MASSMAIL_MAIL_SUBJECT', 'COM_USERS_MASSMAIL_MAIL_BODY', '', '', '{\"tags\":[\"subject\",\"body\",\"subjectprefix\",\"bodysuffix\"]}'),
('com_users.password_reset', 'com_users', '', 'COM_USERS_EMAIL_PASSWORD_RESET_SUBJECT', 'COM_USERS_EMAIL_PASSWORD_RESET_BODY', '', '', '{\"tags\":[\"name\",\"email\",\"sitename\",\"link_text\",\"link_html\",\"token\"]}'),
('com_users.registration.admin.new_notification', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_NOTIFICATION_TO_ADMIN_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.admin.verification_request', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATE_WITH_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"email\",\"username\",\"activate\"]}'),
('com_users.registration.user.admin_activated', 'com_users', '', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_SUBJECT', 'COM_USERS_EMAIL_ACTIVATED_BY_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.admin_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.admin_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ADMIN_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.registration.user.registration_mail', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.registration_mail_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.registration.user.self_activation', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY_NOPW', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\"]}'),
('com_users.registration.user.self_activation_w_pw', 'com_users', '', 'COM_USERS_EMAIL_ACCOUNT_DETAILS', 'COM_USERS_EMAIL_REGISTERED_WITH_ACTIVATION_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"activate\",\"siteurl\",\"username\",\"password_clear\"]}'),
('com_users.reminder', 'com_users', '', 'COM_USERS_EMAIL_USERNAME_REMINDER_SUBJECT', 'COM_USERS_EMAIL_USERNAME_REMINDER_BODY', '', '', '{\"tags\":[\"name\",\"username\",\"sitename\",\"email\",\"link_text\",\"link_html\"]}'),
('plg_multifactorauth_email.mail', 'plg_multifactorauth_email', '', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_SUBJECT', 'PLG_MULTIFACTORAUTH_EMAIL_EMAIL_BODY', '', '', '{\"tags\":[\"code\",\"sitename\",\"siteurl\",\"username\",\"email\",\"fullname\"]}'),
('plg_system_privacyconsent.request.reminder', 'plg_system_privacyconsent', '', 'PLG_SYSTEM_PRIVACYCONSENT_EMAIL_REMIND_SUBJECT', 'PLG_SYSTEM_PRIVACYCONSENT_EMAIL_REMIND_BODY', '', '', '{\"tags\":[\"sitename\",\"url\",\"tokenurl\",\"formurl\",\"token\"]}'),
('plg_system_tasknotification.failure_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FAILURE_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\", \"exit_code\", \"exec_data_time\", \"task_output\"]}'),
('plg_system_tasknotification.fatal_recovery_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_FATAL_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\"]}'),
('plg_system_tasknotification.orphan_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_ORPHAN_MAIL_BODY', '', '', '{\"tags\": [\"task_id\", \"task_title\"]}'),
('plg_system_tasknotification.success_mail', 'plg_system_tasknotification', '', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_SUBJECT', 'PLG_SYSTEM_TASK_NOTIFICATION_SUCCESS_MAIL_BODY', '', '', '{\"tags\":[\"task_id\", \"task_title\", \"exec_data_time\", \"task_output\"]}'),
('plg_system_updatenotification.mail', 'plg_system_updatenotification', '', 'PLG_SYSTEM_UPDATENOTIFICATION_EMAIL_SUBJECT', 'PLG_SYSTEM_UPDATENOTIFICATION_EMAIL_BODY', '', '', '{\"tags\":[\"newversion\",\"curversion\",\"sitename\",\"url\",\"link\",\"releasenews\"]}'),
('plg_user_joomla.mail', 'plg_user_joomla', '', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_SUBJECT', 'PLG_USER_JOOMLA_NEW_USER_EMAIL_BODY', '', '', '{\"tags\":[\"name\",\"sitename\",\"url\",\"username\",\"password\",\"email\"]}');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_menu`
--

CREATE TABLE `hde5p_menu` (
  `id` int(11) NOT NULL,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of menu this item belongs to. FK to #__menu_types.menutype',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The display title of the menu item.',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL COMMENT 'The SEF alias of the menu item.',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `path` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The computed path of the menu item based on the alias field.',
  `link` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The actually link the menu item refers to.',
  `type` varchar(16) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The type of link: Component, URL, Alias, Separator',
  `published` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The published state of the menu link.',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 1 COMMENT 'The parent menu item in the menu tree.',
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'The relative level in the tree.',
  `component_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to #__extensions.id',
  `checked_out` int(10) UNSIGNED DEFAULT NULL COMMENT 'FK to #__users.id',
  `checked_out_time` datetime DEFAULT NULL COMMENT 'The time the menu item was checked out.',
  `browserNav` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'The click behaviour of the link.',
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'The access level required to view the menu item.',
  `img` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The image of the menu item.',
  `template_style_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded data for the menu item.',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `home` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Indicates if this menu item is the home or default page.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_menu`
--

INSERT INTO `hde5p_menu` (`id`, `menutype`, `title`, `alias`, `note`, `path`, `link`, `type`, `published`, `parent_id`, `level`, `component_id`, `checked_out`, `checked_out_time`, `browserNav`, `access`, `img`, `template_style_id`, `params`, `lft`, `rgt`, `home`, `language`, `client_id`, `publish_up`, `publish_down`) VALUES
(1, '', 'Menu_Item_Root', 'root', '', '', '', '', 1, 0, 0, 0, NULL, NULL, 0, 0, '', 0, '', 0, 83, 0, '*', 0, NULL, NULL),
(2, 'main', 'com_banners', 'Banners', '', 'Banners', 'index.php?option=com_banners', 'component', 1, 1, 1, 3, NULL, NULL, 0, 0, 'class:bookmark', 0, '', 1, 10, 0, '*', 1, NULL, NULL),
(3, 'main', 'com_banners', 'Banners', '', 'Banners/Banners', 'index.php?option=com_banners&view=banners', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners', 0, '', 2, 3, 0, '*', 1, NULL, NULL),
(4, 'main', 'com_banners_categories', 'Categories', '', 'Banners/Categories', 'index.php?option=com_categories&view=categories&extension=com_banners', 'component', 1, 2, 2, 5, NULL, NULL, 0, 0, 'class:banners-cat', 0, '', 4, 5, 0, '*', 1, NULL, NULL),
(5, 'main', 'com_banners_clients', 'Clients', '', 'Banners/Clients', 'index.php?option=com_banners&view=clients', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-clients', 0, '', 6, 7, 0, '*', 1, NULL, NULL),
(6, 'main', 'com_banners_tracks', 'Tracks', '', 'Banners/Tracks', 'index.php?option=com_banners&view=tracks', 'component', 1, 2, 2, 3, NULL, NULL, 0, 0, 'class:banners-tracks', 0, '', 8, 9, 0, '*', 1, NULL, NULL),
(7, 'main', 'com_contact', 'Contacts', '', 'Contacts', 'index.php?option=com_contact', 'component', 1, 1, 1, 7, NULL, NULL, 0, 0, 'class:address-book', 0, '', 31, 40, 0, '*', 1, NULL, NULL),
(8, 'main', 'com_contact_contacts', 'Contacts', '', 'Contacts/Contacts', 'index.php?option=com_contact&view=contacts', 'component', 1, 7, 2, 7, NULL, NULL, 0, 0, 'class:contact', 0, '', 32, 33, 0, '*', 1, NULL, NULL),
(9, 'main', 'com_contact_categories', 'Categories', '', 'Contacts/Categories', 'index.php?option=com_categories&view=categories&extension=com_contact', 'component', 1, 7, 2, 5, NULL, NULL, 0, 0, 'class:contact-cat', 0, '', 34, 35, 0, '*', 1, NULL, NULL),
(10, 'main', 'com_newsfeeds', 'News Feeds', '', 'News Feeds', 'index.php?option=com_newsfeeds', 'component', 1, 1, 1, 16, NULL, NULL, 0, 0, 'class:rss', 0, '', 43, 48, 0, '*', 1, NULL, NULL),
(11, 'main', 'com_newsfeeds_feeds', 'Feeds', '', 'News Feeds/Feeds', 'index.php?option=com_newsfeeds&view=newsfeeds', 'component', 1, 10, 2, 16, NULL, NULL, 0, 0, 'class:newsfeeds', 0, '', 44, 45, 0, '*', 1, NULL, NULL),
(12, 'main', 'com_newsfeeds_categories', 'Categories', '', 'News Feeds/Categories', 'index.php?option=com_categories&view=categories&extension=com_newsfeeds', 'component', 1, 10, 2, 5, NULL, NULL, 0, 0, 'class:newsfeeds-cat', 0, '', 46, 47, 0, '*', 1, NULL, NULL),
(13, 'main', 'com_finder', 'Smart Search', '', 'Smart Search', 'index.php?option=com_finder', 'component', 1, 1, 1, 23, NULL, NULL, 0, 0, 'class:search-plus', 0, '', 49, 58, 0, '*', 1, NULL, NULL),
(14, 'main', 'com_tags', 'Tags', '', 'Tags', 'index.php?option=com_tags&view=tags', 'component', 1, 1, 1, 25, NULL, NULL, 0, 1, 'class:tags', 0, '', 59, 60, 0, '', 1, NULL, NULL),
(15, 'main', 'com_associations', 'Multilingual Associations', '', 'Multilingual Associations', 'index.php?option=com_associations&view=associations', 'component', 1, 1, 1, 30, NULL, NULL, 0, 0, 'class:language', 0, '', 41, 42, 0, '*', 1, NULL, NULL),
(16, 'main', 'mod_menu_fields', 'Contact Custom Fields', '', 'Contacts/Contact Custom Fields', 'index.php?option=com_fields&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 36, 37, 0, '*', 1, NULL, NULL),
(17, 'main', 'mod_menu_fields_group', 'Contact Custom Fields Group', '', 'Contacts/Contact Custom Fields Group', 'index.php?option=com_fields&view=groups&context=com_contact.contact', 'component', 1, 7, 2, 29, NULL, NULL, 0, 0, 'class:messages-add', 0, '', 38, 39, 0, '*', 1, NULL, NULL),
(18, 'main', 'com_finder_index', 'Smart-Search-Index', '', 'Smart Search/Smart-Search-Index', 'index.php?option=com_finder&view=index', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder', 0, '', 50, 51, 0, '*', 1, NULL, NULL),
(19, 'main', 'com_finder_maps', 'Smart-Search-Maps', '', 'Smart Search/Smart-Search-Maps', 'index.php?option=com_finder&view=maps', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-maps', 0, '', 52, 53, 0, '*', 1, NULL, NULL),
(20, 'main', 'com_finder_filters', 'Smart-Search-Filters', '', 'Smart Search/Smart-Search-Filters', 'index.php?option=com_finder&view=filters', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-filters', 0, '', 54, 55, 0, '*', 1, NULL, NULL),
(21, 'main', 'com_finder_searches', 'Smart-Search-Searches', '', 'Smart Search/Smart-Search-Searches', 'index.php?option=com_finder&view=searches', 'component', 1, 13, 2, 23, NULL, NULL, 0, 0, 'class:finder-searches', 0, '', 56, 57, 0, '*', 1, NULL, NULL),
(101, 'mainmenu', 'Mayor\'s Corner', 'home', '', 'home', 'index.php?option=com_content&view=featured', 'component', 1, 1, 1, 19, NULL, NULL, 0, 1, ' ', 13, '{\"layout_type\":\"blog\",\"num_leading_articles\":\"\",\"blog_class_leading\":\"\",\"num_intro_articles\":\"\",\"blog_class\":\"\",\"num_columns\":\"\",\"multi_column_order\":\"\",\"num_links\":\"\",\"link_intro_image\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 11, 24, 1, '*', 0, NULL, NULL),
(102, 'mainmenu', 'Announcement', 'announcement', '', 'home/announcement', 'index.php?option=com_content&view=category&layout=blog&id=10', 'component', 1, 101, 2, 19, NULL, NULL, 0, 1, ' ', 0, '{\"layout_type\":\"blog\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_category_heading_title_text\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"num_leading_articles\":\"\",\"blog_class_leading\":\"\",\"num_intro_articles\":\"\",\"blog_class\":\"\",\"num_columns\":\"\",\"multi_column_order\":\"\",\"num_links\":\"\",\"show_featured\":\"\",\"link_intro_image\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"article_layout\":\"_:default\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 12, 19, 0, '*', 0, NULL, NULL),
(103, 'mainmenu', 'Crab Hotel Booking', 'crab-hotel-booking', '', 'crab-hotel-booking', '', 'separator', 1, 1, 1, 0, 101, '2023-04-11 15:06:43', 0, 1, ' ', 0, '{\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 25, 26, 0, '*', 0, NULL, NULL),
(104, 'mainmenu', 'Business Registration', 'business-registration', '', 'business-registration', 'https://google.com', 'url', 1, 1, 1, 0, NULL, NULL, 1, 1, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu-anchor_rel\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 27, 28, 0, '*', 0, NULL, NULL),
(105, 'mainmenu', 'Ongoing Programs', 'ongoing-programs', '', 'home/ongoing-programs', 'index.php?option=com_content&view=category&layout=blog&id=11', 'component', 1, 101, 2, 19, NULL, NULL, 0, 1, ' ', 0, '{\"layout_type\":\"blog\",\"show_category_title\":\"\",\"show_description\":\"\",\"show_description_image\":\"\",\"maxLevel\":\"\",\"show_empty_categories\":\"\",\"show_no_articles\":\"\",\"show_category_heading_title_text\":\"\",\"show_subcat_desc\":\"\",\"show_cat_num_articles\":\"\",\"show_cat_tags\":\"\",\"num_leading_articles\":\"\",\"blog_class_leading\":\"\",\"num_intro_articles\":\"\",\"blog_class\":\"\",\"num_columns\":\"\",\"multi_column_order\":\"\",\"num_links\":\"\",\"show_featured\":\"\",\"link_intro_image\":\"\",\"show_subcategory_content\":\"\",\"orderby_pri\":\"\",\"orderby_sec\":\"\",\"order_date\":\"\",\"show_pagination\":\"\",\"show_pagination_results\":\"\",\"article_layout\":\"_:default\",\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_readmore\":\"\",\"show_readmore_title\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"show_feed_link\":\"\",\"feed_summary\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 20, 23, 0, '*', 0, NULL, NULL),
(106, 'mainmenu', 'Mega', 'mega', '', 'mega', '#', 'url', -2, 1, 1, 0, NULL, NULL, 0, 1, ' ', 0, '{\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu-anchor_rel\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 61, 62, 0, '*', 0, NULL, NULL),
(107, 'mainmenu', 'Article 1', 'article-1', '', 'home/announcement/article-1', 'index.php?option=com_content&view=article&id=3', 'component', 1, 102, 3, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 13, 14, 0, '*', 0, NULL, NULL),
(108, 'mainmenu', 'Article 2', 'article-2', '', 'home/announcement/article-2', 'index.php?option=com_content&view=article&id=4', 'component', 1, 102, 3, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 15, 16, 0, '*', 0, NULL, NULL),
(109, 'mainmenu', 'Article 3', 'article-3', '', 'home/announcement/article-3', 'index.php?option=com_content&view=article&id=5', 'component', 1, 102, 3, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 17, 18, 0, '*', 0, NULL, NULL),
(110, 'main', 'COM_SPSIMPLEPORTFOLIO', 'com-spsimpleportfolio', '', 'com-spsimpleportfolio', 'index.php?option=com_spsimpleportfolio', 'component', 1, 1, 1, 234, NULL, NULL, 0, 1, 'class:component', 0, '{}', 63, 70, 0, '', 1, NULL, NULL),
(111, 'main', 'COM_SPSIMPLEPORTFOLIO_ITEMS', 'com-spsimpleportfolio-items', '', 'com-spsimpleportfolio/com-spsimpleportfolio-items', 'index.php?option=com_spsimpleportfolio&view=items', 'component', 1, 110, 2, 234, NULL, NULL, 0, 1, 'class:component', 0, '{}', 64, 65, 0, '', 1, NULL, NULL),
(112, 'main', 'COM_SPSIMPLEPORTFOLIO_CATEGORIES', 'com-spsimpleportfolio-categories', '', 'com-spsimpleportfolio/com-spsimpleportfolio-categories', 'index.php?option=com_categories&view=categories&extension=com_spsimpleportfolio', 'component', 1, 110, 2, 234, NULL, NULL, 0, 1, 'class:component', 0, '{}', 66, 67, 0, '', 1, NULL, NULL),
(113, 'main', 'COM_SPSIMPLEPORTFOLIO_TAGS', 'com-spsimpleportfolio-tags', '', 'com-spsimpleportfolio/com-spsimpleportfolio-tags', 'index.php?option=com_spsimpleportfolio&view=tags', 'component', 1, 110, 2, 234, NULL, NULL, 0, 1, 'class:component', 0, '{}', 68, 69, 0, '', 1, NULL, NULL),
(114, 'mainmenu', 'Destinations', 'destinations', '', 'destinations', 'index.php?option=com_spsimpleportfolio&view=items', 'component', 1, 1, 1, 234, NULL, NULL, 0, 1, ' ', 0, '{\"show_filter\":\"1\",\"catid\":\"9\",\"ordering\":\"ordering:ASC\",\"layout_type\":\"gallery_nospace\",\"columns\":\"3\",\"thumbnail_type\":\"square\",\"popup_image\":\"default\",\"limit\":\"12\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 29, 30, 0, '*', 0, NULL, NULL),
(115, 'main', 'COM_SPEASYIMAGEGALLERY', 'com-speasyimagegallery', '', 'com-speasyimagegallery', 'index.php?option=com_speasyimagegallery', 'component', 1, 1, 1, 236, NULL, NULL, 0, 1, 'class:component', 0, '{}', 71, 76, 0, '', 1, NULL, NULL),
(116, 'main', 'COM_SPEASYIMAGEGALLERY_SUBMENU_ALBUMS', 'com-speasyimagegallery-submenu-albums', '', 'com-speasyimagegallery/com-speasyimagegallery-submenu-albums', 'index.php?option=com_speasyimagegallery&view=albums', 'component', 1, 115, 2, 236, NULL, NULL, 0, 1, 'class:component', 0, '{}', 72, 73, 0, '', 1, NULL, NULL),
(117, 'main', 'COM_SPEASYIMAGEGALLERY_SUBMENU_CATEGORIES', 'com-speasyimagegallery-submenu-categories', '', 'com-speasyimagegallery/com-speasyimagegallery-submenu-categories', 'index.php?option=com_categories&view=categories&extension=com_speasyimagegallery', 'component', 1, 115, 2, 236, NULL, NULL, 0, 1, 'class:component', 0, '{}', 74, 75, 0, '', 1, NULL, NULL),
(118, 'mainmenu', 'Ongoing Program 1', 'ongoing-program-1', '', 'home/ongoing-programs/ongoing-program-1', 'index.php?option=com_content&view=article&id=6', 'component', 1, 105, 3, 19, NULL, NULL, 0, 1, ' ', 0, '{\"show_title\":\"\",\"link_titles\":\"\",\"show_intro\":\"\",\"info_block_position\":\"\",\"info_block_show_title\":\"\",\"show_category\":\"\",\"link_category\":\"\",\"show_parent_category\":\"\",\"link_parent_category\":\"\",\"show_author\":\"\",\"link_author\":\"\",\"show_create_date\":\"\",\"show_modify_date\":\"\",\"show_publish_date\":\"\",\"show_item_navigation\":\"\",\"show_hits\":\"\",\"show_tags\":\"\",\"show_noauth\":\"\",\"urls_position\":\"\",\"menu-anchor_title\":\"\",\"menu-anchor_css\":\"\",\"menu_icon_css\":\"\",\"menu_image\":\"\",\"menu_image_css\":\"\",\"menu_text\":1,\"menu_show\":1,\"page_title\":\"\",\"show_page_heading\":\"\",\"page_heading\":\"\",\"pageclass_sfx\":\"\",\"menu-meta_description\":\"\",\"robots\":\"\",\"helixultimatemenulayout\":\"\",\"helixultimate_enable_page_title\":\"0\",\"helixultimate_page_title_alt\":\"\",\"helixultimate_page_subtitle\":\"\",\"helixultimate_page_title_heading\":\"h2\",\"helixultimate_page_title_bg_color\":\"\",\"helixultimate_page_title_bg_image\":\"\"}', 21, 22, 0, '*', 0, NULL, NULL),
(119, 'main', 'COM_SPPAGEBUILDER', 'com-sppagebuilder', '', 'com-sppagebuilder', 'index.php?option=com_sppagebuilder', 'component', 1, 1, 1, 238, NULL, NULL, 0, 1, 'class:component', 0, '{}', 77, 82, 0, '', 1, NULL, NULL),
(120, 'main', 'COM_SPPAGEBUILDER_PAGES', 'com-sppagebuilder-pages', '', 'com-sppagebuilder/com-sppagebuilder-pages', 'index.php?option=com_sppagebuilder', 'component', 1, 119, 2, 238, NULL, NULL, 0, 1, 'class:component', 0, '{}', 78, 79, 0, '', 1, NULL, NULL),
(121, 'main', 'COM_SPPAGEBUILDER_CATEGORIES', 'com-sppagebuilder-categories', '', 'com-sppagebuilder/com-sppagebuilder-categories', 'index.php?option=com_categories&extension=com_sppagebuilder', 'component', 1, 119, 2, 238, NULL, NULL, 0, 1, 'class:component', 0, '{}', 80, 81, 0, '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_menu_types`
--

CREATE TABLE `hde5p_menu_types` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `menutype` varchar(24) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title` varchar(48) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_menu_types`
--

INSERT INTO `hde5p_menu_types` (`id`, `asset_id`, `menutype`, `title`, `description`, `client_id`) VALUES
(1, 0, 'mainmenu', 'Main Menu', 'The main menu for the site', 0);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_messages`
--

CREATE TABLE `hde5p_messages` (
  `message_id` int(10) UNSIGNED NOT NULL,
  `user_id_from` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `user_id_to` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `folder_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `date_time` datetime NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `priority` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_messages_cfg`
--

CREATE TABLE `hde5p_messages_cfg` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `cfg_name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `cfg_value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_modules`
--

CREATE TABLE `hde5p_modules` (
  `id` int(11) NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `content` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `position` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `module` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `showtitle` tinyint(3) UNSIGNED NOT NULL DEFAULT 1,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `client_id` tinyint(4) NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_modules`
--

INSERT INTO `hde5p_modules` (`id`, `asset_id`, `title`, `note`, `content`, `ordering`, `position`, `checked_out`, `checked_out_time`, `publish_up`, `publish_down`, `published`, `module`, `access`, `showtitle`, `params`, `client_id`, `language`) VALUES
(1, 39, 'Main Menu', '', '', 1, 'sidebar-right', NULL, NULL, NULL, NULL, 1, 'mod_menu', 1, 1, '{\"menutype\":\"mainmenu\",\"startLevel\":\"0\",\"endLevel\":\"0\",\"showAllChildren\":\"1\",\"tag_id\":\"\",\"class_sfx\":\"\",\"window_open\":\"\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"1\",\"cache_time\":\"900\",\"cachemode\":\"itemid\"}', 0, '*'),
(2, 40, 'Login', '', '', 1, 'login', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '', 1, '*'),
(3, 41, 'Popular Articles', '', '', 6, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(4, 42, 'Recently Added Articles', '', '', 4, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(8, 43, 'Toolbar', '', '', 1, 'toolbar', NULL, NULL, NULL, NULL, 1, 'mod_toolbar', 3, 1, '', 1, '*'),
(9, 44, 'Notifications', '', '', 3, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 3, 1, '{\"context\":\"update_quickicon\",\"header_icon\":\"icon-sync\",\"show_jupdate\":\"1\",\"show_eupdate\":\"1\",\"show_oupdate\":\"1\",\"show_privacy\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(10, 45, 'Logged-in Users', '', '', 2, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(12, 46, 'Admin Menu', '', '', 1, 'menu', NULL, NULL, NULL, NULL, 1, 'mod_menu', 3, 1, '{\"layout\":\"\",\"moduleclass_sfx\":\"\",\"shownew\":\"1\",\"showhelp\":\"1\",\"cache\":\"0\"}', 1, '*'),
(15, 49, 'Title', '', '', 1, 'title', NULL, NULL, NULL, NULL, 1, 'mod_title', 3, 1, '', 1, '*'),
(16, 50, 'Login Form', '', '', 7, 'sidebar-right', NULL, NULL, NULL, NULL, 1, 'mod_login', 1, 1, '{\"greeting\":\"1\",\"name\":\"0\"}', 0, '*'),
(17, 51, 'Breadcrumbs', '', '', 1, 'breadcrumbs', NULL, NULL, NULL, NULL, 1, 'mod_breadcrumbs', 1, 1, '{\"moduleclass_sfx\":\"\",\"showHome\":\"1\",\"homeText\":\"\",\"showComponent\":\"1\",\"separator\":\"\",\"cache\":\"0\",\"cache_time\":\"0\",\"cachemode\":\"itemid\"}', 0, '*'),
(79, 52, 'Multilanguage status', '', '', 2, 'status', NULL, NULL, NULL, NULL, 1, 'mod_multilangstatus', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(86, 53, 'Joomla Version', '', '', 1, 'status', NULL, NULL, NULL, NULL, 1, 'mod_version', 3, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\"}', 1, '*'),
(87, 55, 'Sample Data', '', '', 1, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_sampledata', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(88, 67, 'Latest Actions', '', '', 3, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_latestactions', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(89, 68, 'Privacy Dashboard', '', '', 5, 'cpanel', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 6, 1, '{\"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(90, 89, 'Login Support', '', '', 1, 'sidebar', NULL, NULL, NULL, NULL, 1, 'mod_loginsupport', 1, 1, '{\"forum_url\":\"https://forum.joomla.org/\",\"documentation_url\":\"https://docs.joomla.org/\",\"news_url\":\"https://www.joomla.org/announcements.html\",\"automatic_title\":1,\"prepare_content\":1,\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 1, '*'),
(91, 72, 'System Dashboard', '', '', 1, 'cpanel-system', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"system\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(92, 73, 'Content Dashboard', '', '', 1, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"content\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(93, 74, 'Menus Dashboard', '', '', 1, 'cpanel-menus', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"menus\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(94, 75, 'Components Dashboard', '', '', 1, 'cpanel-components', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"components\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(95, 76, 'Users Dashboard', '', '', 1, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"users\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\",\"style\":\"System-none\"}', 1, '*'),
(96, 86, 'Popular Articles', '', '', 3, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_popular', 3, 1, '{\"count\":\"5\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(97, 87, 'Recently Added Articles', '', '', 4, 'cpanel-content', NULL, NULL, NULL, NULL, 1, 'mod_latest', 3, 1, '{\"count\":\"5\",\"ordering\":\"c_dsc\",\"catid\":\"\",\"user_id\":\"0\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(98, 88, 'Logged-in Users', '', '', 2, 'cpanel-users', NULL, NULL, NULL, NULL, 1, 'mod_logged', 3, 1, '{\"count\":\"5\",\"name\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":\"0\", \"bootstrap_size\": \"12\",\"header_tag\":\"h2\"}', 1, '*'),
(99, 77, 'Frontend Link', '', '', 5, 'status', NULL, NULL, NULL, NULL, 1, 'mod_frontend', 1, 1, '', 1, '*'),
(100, 78, 'Messages', '', '', 4, 'status', NULL, NULL, NULL, NULL, 1, 'mod_messages', 3, 1, '', 1, '*'),
(101, 79, 'Post Install Messages', '', '', 3, 'status', NULL, NULL, NULL, NULL, 1, 'mod_post_installation_messages', 3, 1, '', 1, '*'),
(102, 80, 'User Status', '', '', 6, 'status', NULL, NULL, NULL, NULL, 1, 'mod_user', 3, 1, '', 1, '*'),
(103, 70, 'Site', '', '', 1, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"site_quickicon\",\"header_icon\":\"icon-desktop\",\"show_users\":\"1\",\"show_articles\":\"1\",\"show_categories\":\"1\",\"show_media\":\"1\",\"show_menuItems\":\"1\",\"show_modules\":\"1\",\"show_plugins\":\"1\",\"show_templates\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(104, 71, 'System', '', '', 2, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"system_quickicon\",\"header_icon\":\"icon-wrench\",\"show_global\":\"1\",\"show_checkin\":\"1\",\"show_cache\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(105, 82, '3rd Party', '', '', 4, 'icon', NULL, NULL, NULL, NULL, 1, 'mod_quickicon', 1, 1, '{\"context\":\"mod_quickicon\",\"header_icon\":\"icon-boxes\",\"load_plugins\":\"1\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(106, 83, 'Help Dashboard', '', '', 1, 'cpanel-help', NULL, NULL, NULL, NULL, 1, 'mod_submenu', 1, 0, '{\"menutype\":\"*\",\"preset\":\"help\",\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"style\":\"System-none\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(107, 84, 'Privacy Requests', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_dashboard', 1, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(108, 85, 'Privacy Status', '', '', 1, 'cpanel-privacy', NULL, NULL, NULL, NULL, 1, 'mod_privacy_status', 1, 1, '{\"layout\":\"_:default\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"static\",\"style\":\"0\",\"module_tag\":\"div\",\"bootstrap_size\":\"12\",\"header_tag\":\"h2\",\"header_class\":\"\"}', 1, '*'),
(109, 98, 'SP Simple Portfolio Module', '', '', 1, '', NULL, NULL, NULL, NULL, 0, 'mod_spsimpleportfolio', 1, 1, '', 0, '*'),
(110, 101, 'SP Easy Image Gallery Module', '', '', 2, '', NULL, NULL, NULL, NULL, 0, 'mod_speasyimagegallery', 1, 1, '', 0, '*'),
(111, 105, 'Announcements', '', NULL, 1, 'content-bottom', NULL, NULL, '2023-04-20 05:38:44', NULL, 1, 'mod_articles_news', 1, 1, '{\"catid\":[10],\"image\":0,\"img_intro_full\":\"intro\",\"item_title\":1,\"link_titles\":\"\",\"item_heading\":\"h4\",\"triggerevents\":1,\"showLastSeparator\":1,\"show_introtext\":1,\"readmore\":1,\"count\":3,\"show_featured\":\"\",\"exclude_current\":1,\"ordering\":\"a.publish_up\",\"direction\":1,\"layout\":\"_:vertical\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*'),
(112, 107, 'SP Page Builder', '', '', 3, '', NULL, NULL, NULL, NULL, 0, 'mod_sppagebuilder', 1, 1, '', 0, '*'),
(113, 108, 'Ongoing Programs', '', NULL, 2, 'content-bottom', NULL, NULL, '2023-04-20 05:38:46', NULL, 1, 'mod_articles_news', 1, 1, '{\"catid\":[11],\"image\":1,\"img_intro_full\":\"intro\",\"item_title\":1,\"link_titles\":\"\",\"item_heading\":\"h4\",\"triggerevents\":1,\"showLastSeparator\":1,\"show_introtext\":1,\"readmore\":0,\"count\":3,\"show_featured\":\"\",\"exclude_current\":1,\"ordering\":\"a.publish_up\",\"direction\":1,\"layout\":\"wt_mambo_free:parallax\",\"moduleclass_sfx\":\"\",\"cache\":1,\"cache_time\":900,\"cachemode\":\"itemid\",\"module_tag\":\"div\",\"bootstrap_size\":\"0\",\"header_tag\":\"h3\",\"header_class\":\"\",\"style\":\"0\"}', 0, '*');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_modules_menu`
--

CREATE TABLE `hde5p_modules_menu` (
  `moduleid` int(11) NOT NULL DEFAULT 0,
  `menuid` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_modules_menu`
--

INSERT INTO `hde5p_modules_menu` (`moduleid`, `menuid`) VALUES
(1, 0),
(2, 0),
(3, 0),
(4, 0),
(6, 0),
(7, 0),
(8, 0),
(9, 0),
(10, 0),
(12, 0),
(14, 0),
(15, 0),
(16, 0),
(17, 0),
(79, 0),
(86, 0),
(87, 0),
(88, 0),
(89, 0),
(90, 0),
(91, 0),
(92, 0),
(93, 0),
(94, 0),
(95, 0),
(96, 0),
(97, 0),
(98, 0),
(99, 0),
(100, 0),
(101, 0),
(102, 0),
(103, 0),
(104, 0),
(105, 0),
(106, 0),
(107, 0),
(108, 0),
(111, 101),
(113, 101);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_newsfeeds`
--

CREATE TABLE `hde5p_newsfeeds` (
  `catid` int(11) NOT NULL DEFAULT 0,
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `link` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `numarticles` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `cache_time` int(10) UNSIGNED NOT NULL DEFAULT 3600,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rtl` tinyint(4) NOT NULL DEFAULT 0,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified` datetime NOT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadata` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_overrider`
--

CREATE TABLE `hde5p_overrider` (
  `id` int(11) NOT NULL COMMENT 'Primary Key',
  `constant` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `string` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_postinstall_messages`
--

CREATE TABLE `hde5p_postinstall_messages` (
  `postinstall_message_id` bigint(20) UNSIGNED NOT NULL,
  `extension_id` bigint(20) NOT NULL DEFAULT 700 COMMENT 'FK to #__extensions',
  `title_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for the title',
  `description_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Lang key for description',
  `action_key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `language_extension` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'com_postinstall' COMMENT 'Extension holding lang keys',
  `language_client_id` tinyint(4) NOT NULL DEFAULT 1,
  `type` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'link' COMMENT 'Message type - message, link, action',
  `action_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'RAD URI to the PHP file containing action method',
  `action` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT '' COMMENT 'Action method name or URL',
  `condition_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'RAD URI to file holding display condition method',
  `condition_method` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Display condition method, must return boolean',
  `version_introduced` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '3.2.0' COMMENT 'Version when this message was introduced',
  `enabled` tinyint(4) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_postinstall_messages`
--

INSERT INTO `hde5p_postinstall_messages` (`postinstall_message_id`, `extension_id`, `title_key`, `description_key`, `action_key`, `language_extension`, `language_client_id`, `type`, `action_file`, `action`, `condition_file`, `condition_method`, `version_introduced`, `enabled`) VALUES
(1, 224, 'COM_CPANEL_WELCOME_BEGINNERS_TITLE', 'COM_CPANEL_WELCOME_BEGINNERS_MESSAGE', '', 'com_cpanel', 1, 'message', '', '', '', '', '3.2.0', 1),
(2, 224, 'COM_CPANEL_MSG_STATS_COLLECTION_TITLE', 'COM_CPANEL_MSG_STATS_COLLECTION_BODY', '', 'com_cpanel', 1, 'message', '', '', 'admin://components/com_admin/postinstall/statscollection.php', 'admin_postinstall_statscollection_condition', '3.5.0', 1),
(3, 224, 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_BODY', 'PLG_SYSTEM_UPDATENOTIFICATION_POSTINSTALL_UPDATECACHETIME_ACTION', 'plg_system_updatenotification', 1, 'action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_action', 'site://plugins/system/updatenotification/postinstall/updatecachetime.php', 'updatecachetime_postinstall_condition', '3.6.3', 1),
(4, 224, 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_TITLE', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_BODY', 'PLG_SYSTEM_HTTPHEADERS_POSTINSTALL_INTRODUCTION_ACTION', 'plg_system_httpheaders', 1, 'action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_action', 'site://plugins/system/httpheaders/postinstall/introduction.php', 'httpheaders_postinstall_condition', '4.0.0', 1),
(5, 224, 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_TITLE', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_BODY', 'COM_USERS_POSTINSTALL_MULTIFACTORAUTH_ACTION', 'com_users', 1, 'action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_action', 'admin://components/com_users/postinstall/multifactorauth.php', 'com_users_postinstall_mfa_condition', '4.2.0', 1);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_privacy_consents`
--

CREATE TABLE `hde5p_privacy_consents` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `state` int(11) NOT NULL DEFAULT 1,
  `created` datetime NOT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `remind` tinyint(4) NOT NULL DEFAULT 0,
  `token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_privacy_requests`
--

CREATE TABLE `hde5p_privacy_requests` (
  `id` int(10) UNSIGNED NOT NULL,
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `requested_at` datetime NOT NULL,
  `status` tinyint(4) NOT NULL DEFAULT 0,
  `request_type` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `confirm_token_created_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_redirect_links`
--

CREATE TABLE `hde5p_redirect_links` (
  `id` int(10) UNSIGNED NOT NULL,
  `old_url` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `new_url` varchar(2048) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `referer` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL,
  `comment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `published` tinyint(4) NOT NULL,
  `created_date` datetime NOT NULL,
  `modified_date` datetime NOT NULL,
  `header` smallint(6) NOT NULL DEFAULT 301
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_scheduler_tasks`
--

CREATE TABLE `hde5p_scheduler_tasks` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `type` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'unique identifier for job defined by plugin',
  `execution_rules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Execution Rules, Unprocessed',
  `cron_rules` text COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'Processed execution rules, crontab-like JSON form',
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `last_exit_code` int(11) NOT NULL DEFAULT 0 COMMENT 'Exit code when job was last run',
  `last_execution` datetime DEFAULT NULL COMMENT 'Timestamp of last run',
  `next_execution` datetime DEFAULT NULL COMMENT 'Timestamp of next (planned) run, referred for execution on trigger',
  `times_executed` int(11) DEFAULT 0 COMMENT 'Count of successful triggers',
  `times_failed` int(11) DEFAULT 0 COMMENT 'Count of failures',
  `locked` datetime DEFAULT NULL,
  `priority` smallint(6) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0 COMMENT 'Configurable list ordering',
  `cli_exclusive` smallint(6) NOT NULL DEFAULT 0 COMMENT 'If 1, the task is only accessible via CLI',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `note` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created` datetime NOT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_schemas`
--

CREATE TABLE `hde5p_schemas` (
  `extension_id` int(11) NOT NULL,
  `version_id` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_schemas`
--

INSERT INTO `hde5p_schemas` (`extension_id`, `version_id`) VALUES
(224, '4.2.9-2023-03-07'),
(234, '2.0.7'),
(236, '2.0.2'),
(238, '4.0.10');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_session`
--

CREATE TABLE `hde5p_session` (
  `session_id` varbinary(192) NOT NULL,
  `client_id` tinyint(3) UNSIGNED DEFAULT NULL,
  `guest` tinyint(3) UNSIGNED DEFAULT 1,
  `time` int(11) NOT NULL DEFAULT 0,
  `data` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `userid` int(11) DEFAULT 0,
  `username` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_session`
--

INSERT INTO `hde5p_session` (`session_id`, `client_id`, `guest`, `time`, `data`, `userid`, `username`) VALUES
(0x6762746b6f75656a69676e70756a3766696a6164666c6b386a61, 1, 1, 1681976586, 'joomla|s:688:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjM6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjgxOTc0OTA1O3M6NDoibGFzdCI7aToxNjgxOTc1NzQ2O3M6Mzoibm93IjtpOjE2ODE5NzY1ODY7fXM6NToidG9rZW4iO3M6MzI6ImZjZjliYjk3ZGFhNWQ2ZGM3N2NlZDUxMWFhNjY5YTFmIjtzOjc6ImNvdW50ZXIiO2k6Mjt9czo4OiJyZWdpc3RyeSI7TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjA6e31zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO31zOjQ6InVzZXIiO086MjA6Ikpvb21sYVxDTVNcVXNlclxVc2VyIjoxOntzOjI6ImlkIjtpOjA7fX1zOjE0OiIAKgBpbml0aWFsaXplZCI7YjowO3M6OToic2VwYXJhdG9yIjtzOjE6Ii4iO30=\";', 0, ''),
(0x6c666a683931657264386a676235706e3563336972703561346b, NULL, 1, 1681976701, 'joomla|s:412:\"TzoyNDoiSm9vbWxhXFJlZ2lzdHJ5XFJlZ2lzdHJ5IjozOntzOjc6IgAqAGRhdGEiO086ODoic3RkQ2xhc3MiOjE6e3M6Nzoic2Vzc2lvbiI7Tzo4OiJzdGRDbGFzcyI6Mjp7czo1OiJ0aW1lciI7Tzo4OiJzdGRDbGFzcyI6Mzp7czo1OiJzdGFydCI7aToxNjgxOTc2NzAwO3M6NDoibGFzdCI7aToxNjgxOTc2NzAwO3M6Mzoibm93IjtpOjE2ODE5NzY3MDA7fXM6NToidG9rZW4iO3M6MzI6ImIwZjc2OGRkNjk5OTA4MGE5MzllM2Y3ZGUzMDYwYjkyIjt9fXM6MTQ6IgAqAGluaXRpYWxpemVkIjtiOjA7czo5OiJzZXBhcmF0b3IiO3M6MToiLiI7fQ==\";', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_speasyimagegallery_albums`
--

CREATE TABLE `hde5p_speasyimagegallery_albums` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image` varchar(500) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `published` tinyint(3) NOT NULL DEFAULT 0,
  `catid` int(11) NOT NULL DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `attribs` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `metakey` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `metadata` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Set if item is featured.',
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*' COMMENT 'The language code for the article.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_speasyimagegallery_images`
--

CREATE TABLE `hde5p_speasyimagegallery_images` (
  `id` int(10) UNSIGNED NOT NULL,
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `album_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alt` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `state` tinyint(3) NOT NULL DEFAULT 0,
  `created` datetime DEFAULT NULL,
  `created_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified` datetime DEFAULT NULL,
  `modified_by` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `images` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '*' COMMENT 'The language code for the article.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_spmedia`
--

CREATE TABLE `hde5p_spmedia` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `path` varchar(255) NOT NULL DEFAULT '',
  `thumb` varchar(255) NOT NULL DEFAULT '',
  `alt` varchar(255) NOT NULL DEFAULT '',
  `caption` varchar(2048) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT 'image',
  `media_attr` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '{}',
  `extension` varchar(100) NOT NULL DEFAULT '',
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT 0,
  `modified_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_sppagebuilder`
--

CREATE TABLE `hde5p_sppagebuilder` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `asset_id` int(11) NOT NULL DEFAULT 0,
  `title` varchar(255) NOT NULL DEFAULT '',
  `text` mediumtext NOT NULL,
  `extension` varchar(255) NOT NULL DEFAULT 'com_sppagebuilder',
  `extension_view` varchar(255) NOT NULL DEFAULT 'page',
  `view_id` bigint(20) NOT NULL DEFAULT 0,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `published` tinyint(3) NOT NULL DEFAULT 1,
  `catid` int(10) NOT NULL DEFAULT 0,
  `access` int(10) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `created_on` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `modified_by` bigint(20) NOT NULL DEFAULT 0,
  `checked_out` int(10) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `attribs` varchar(5120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '[]',
  `og_title` varchar(255) NOT NULL DEFAULT '',
  `og_image` varchar(255) NOT NULL DEFAULT '',
  `og_description` varchar(255) NOT NULL DEFAULT '',
  `language` char(7) NOT NULL DEFAULT '',
  `hits` bigint(20) NOT NULL DEFAULT 0,
  `css` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_sppagebuilder_addonlist`
--

CREATE TABLE `hde5p_sppagebuilder_addonlist` (
  `id` int(5) NOT NULL,
  `name` varchar(255) NOT NULL,
  `ordering` int(5) NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_sppagebuilder_addons`
--

CREATE TABLE `hde5p_sppagebuilder_addons` (
  `id` int(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `code` mediumtext NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_sppagebuilder_assets`
--

CREATE TABLE `hde5p_sppagebuilder_assets` (
  `id` bigint(20) NOT NULL,
  `type` varchar(100) NOT NULL DEFAULT '',
  `name` varchar(100) NOT NULL DEFAULT '',
  `title` varchar(255) NOT NULL DEFAULT '',
  `assets` text NOT NULL,
  `css_path` text DEFAULT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` int(11) NOT NULL,
  `published` tinyint(1) NOT NULL DEFAULT 1,
  `access` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_sppagebuilder_integrations`
--

CREATE TABLE `hde5p_sppagebuilder_integrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `component` varchar(255) NOT NULL DEFAULT '',
  `plugin` mediumtext NOT NULL,
  `state` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_sppagebuilder_languages`
--

CREATE TABLE `hde5p_sppagebuilder_languages` (
  `id` int(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `description` mediumtext NOT NULL,
  `lang_tag` varchar(255) NOT NULL DEFAULT '',
  `lang_key` varchar(100) DEFAULT NULL,
  `version` varchar(255) NOT NULL DEFAULT '',
  `state` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_sppagebuilder_sections`
--

CREATE TABLE `hde5p_sppagebuilder_sections` (
  `id` int(5) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL DEFAULT '',
  `section` mediumtext NOT NULL,
  `created` datetime NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_by` bigint(20) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_spsimpleportfolio_items`
--

CREATE TABLE `hde5p_spsimpleportfolio_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(55) NOT NULL,
  `catid` int(11) NOT NULL,
  `image` text NOT NULL,
  `thumbnail` text NOT NULL,
  `video` text NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `client` varchar(100) NOT NULL DEFAULT '',
  `client_avatar` text NOT NULL,
  `tagids` text NOT NULL,
  `url` text NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 1,
  `language` varchar(255) NOT NULL DEFAULT '*',
  `access` int(11) NOT NULL DEFAULT 1,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `created_by` bigint(20) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `modified_by` bigint(20) NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `checked_out` bigint(20) NOT NULL DEFAULT 0,
  `checked_out_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hde5p_spsimpleportfolio_items`
--

INSERT INTO `hde5p_spsimpleportfolio_items` (`id`, `title`, `alias`, `catid`, `image`, `thumbnail`, `video`, `description`, `client`, `client_avatar`, `tagids`, `url`, `published`, `language`, `access`, `ordering`, `created_by`, `created`, `modified_by`, `modified`, `checked_out`, `checked_out_time`) VALUES
(1, 'Item 1', 'item-1', 9, 'images/110309933_619908805306221_8272395943995636534_n.jpg#joomlaImage://local-images/110309933_619908805306221_8272395943995636534_n.jpg?width=2048&height=1152', 'images/110309933_619908805306221_8272395943995636534_n.jpg#joomlaImage://local-images/110309933_619908805306221_8272395943995636534_n.jpg?width=2048&height=1152', '', '<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ac tortor vitae purus faucibus ornare suspendisse. At quis risus sed vulputate. Sit amet risus nullam eget felis eget nunc lobortis mattis. Ultrices tincidunt arcu non sodales neque.</p>', '', '', '[\"2\"]', '', 1, '*', 1, 0, 101, '2023-04-14 06:08:35', 101, '2023-04-14 06:08:35', 101, '2023-04-14 06:11:43');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_spsimpleportfolio_tags`
--

CREATE TABLE `hde5p_spsimpleportfolio_tags` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `alias` varchar(55) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `hde5p_spsimpleportfolio_tags`
--

INSERT INTO `hde5p_spsimpleportfolio_tags` (`id`, `title`, `alias`) VALUES
(1, 'Beaches', 'beaches'),
(2, 'Restaurants', 'restaurants'),
(3, 'Shops', 'shops');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_tags`
--

CREATE TABLE `hde5p_tags` (
  `id` int(10) UNSIGNED NOT NULL,
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `lft` int(11) NOT NULL DEFAULT 0,
  `rgt` int(11) NOT NULL DEFAULT 0,
  `level` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `path` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `note` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `description` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `metadesc` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'The meta description for the page.',
  `metakey` varchar(1024) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'The keywords for the page.',
  `metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded metadata properties.',
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `images` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `urls` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL,
  `version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_tags`
--

INSERT INTO `hde5p_tags` (`id`, `parent_id`, `lft`, `rgt`, `level`, `path`, `title`, `alias`, `note`, `description`, `published`, `checked_out`, `checked_out_time`, `access`, `params`, `metadesc`, `metakey`, `metadata`, `created_user_id`, `created_time`, `created_by_alias`, `modified_user_id`, `modified_time`, `images`, `urls`, `hits`, `language`, `version`, `publish_up`, `publish_down`) VALUES
(1, 0, 0, 1, 0, '', 'ROOT', 'root', '', '', 1, NULL, NULL, 1, '', '', '', '', 101, '2023-04-11 02:12:42', '', 101, '2023-04-11 02:12:42', '', '', 0, '*', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_template_overrides`
--

CREATE TABLE `hde5p_template_overrides` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `hash_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `extension_id` int(11) DEFAULT 0,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `action` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `created_date` datetime NOT NULL,
  `modified_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_template_styles`
--

CREATE TABLE `hde5p_template_styles` (
  `id` int(10) UNSIGNED NOT NULL,
  `template` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `client_id` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `home` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '0',
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `inheritable` tinyint(4) NOT NULL DEFAULT 0,
  `parent` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_template_styles`
--

INSERT INTO `hde5p_template_styles` (`id`, `template`, `client_id`, `home`, `title`, `inheritable`, `parent`, `params`) VALUES
(10, 'atum', 1, '1', 'Atum - Default', 1, '', '{\"hue\":\"hsl(214, 63%, 20%)\",\"bg-light\":\"#f0f4fb\",\"text-dark\":\"#495057\",\"text-light\":\"#ffffff\",\"link-color\":\"#2a69b8\",\"special-color\":\"#001b4c\",\"monochrome\":\"0\",\"loginLogo\":\"\",\"loginLogoAlt\":\"\",\"logoBrandLarge\":\"\",\"logoBrandLargeAlt\":\"\",\"logoBrandSmall\":\"\",\"logoBrandSmallAlt\":\"\"}'),
(11, 'cassiopeia', 0, '0', 'Cassiopeia - Default', 1, '', '{\"brand\":\"1\",\"logoFile\":\"\",\"siteTitle\":\"\",\"siteDescription\":\"\",\"useFontScheme\":\"0\",\"colorName\":\"colors_standard\",\"fluidContainer\":\"0\",\"stickyHeader\":0,\"backTop\":0}'),
(12, 'et_journey', 0, '0', 'et_journey - Default', 0, '', '{\"logo_type\":\"text\",\"logo_image\":\"images\\/et-journey-logo.png\",\"retina_logo\":\"\",\"mobile_logo\":\"\",\"logo_alt\":\"\",\"logo_height\":\"45px\",\"logo_height_sm\":\"\",\"logo_height_xs\":\"\",\"logo_text\":\"ET JOURNEY\",\"logo_slogan\":\"\",\"favicon\":\"images\\/favicon.ico\",\"predefined_header\":\"1\",\"header_style\":\"style-1\",\"header_height\":\"80px\",\"header_height_sm\":\"50px\",\"header_height_xs\":\"40px\",\"sticky_header\":\"1\",\"sticky_offset\":\"\",\"loader_type\":\"circle\",\"body_bg_image\":\"\",\"body_bg_repeat\":\"inherit\",\"body_bg_position\":\"0 0\",\"body_bg_size\":\"inherit\",\"body_bg_attachment\":\"inherit\",\"enabled_copyright\":\"1\",\"copyright_position\":\"footer1\",\"copyright_load_pos\":\"default\",\"copyright\":\"<div align=\\\"center\\\">Copyright \\u00a9 <a target=\\\"_blank\\\" title=\\\"Free Joomla! 4 templates\\\" href=\\\"https:\\/\\/enginetemplates.com\\/free-joomla-templates\\/\\\" rel=\\\"author nofollow\\\">Free Joomla! 4 templates<\\/a> \\/ Design by <a target=\\\"_blank\\\" href=\\\"https:\\/\\/enginetemplates.com\\/\\\" title=\\\"Joomla template provider\\\" rel=\\\"author nofollow\\\">Engine Templates<\\/a><\\/div>\",\"goto_top\":\"1\",\"show_social_icons\":\"1\",\"social_position\":\"top1\",\"social_load_pos\":\"after\",\"facebook\":\"#\",\"twitter\":\"#\",\"pinterest\":\"#\",\"linkedin\":\"#\",\"dribbble\":\"\",\"instagram\":\"#\",\"behance\":\"\",\"youtube\":\"#\",\"flickr\":\"#\",\"skype\":\"\",\"whatsapp\":\"\",\"vk\":\"\",\"custom\":\"\",\"contactinfo\":\"1\",\"contact_position\":\"top2\",\"contact_load_pos\":\"default\",\"contact_phone\":\"+228 872 4444\",\"contact_mobile\":\"+88 00 111 222 33\",\"contact_email\":\"info@yourdomain.com\",\"contact_time\":\"\",\"comingsoon_title\":\"Coming Soon Title\",\"comingsoon_content\":\"Coming soon content\",\"comingsoon_date\":\"10-10-2021\",\"comingsoon_logo\":\"\",\"comingsoon_bg_image\":\"\",\"error_logo\":\"\",\"error_bg\":\"\",\"presets-data\":\"{\\\"preset1\\\":{\\\"label\\\":\\\"Preset 1\\\",\\\"default\\\":\\\"#0345BF\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#0345BF\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#0345BF\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#0345BF\\\",\\\"menu_text_active_color\\\":\\\"#0345BF\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#0345BF\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#0345BF\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#0345bf\\\"}},\\\"preset2\\\":{\\\"label\\\":\\\"Preset 2\\\",\\\"default\\\":\\\"#ec430f\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#ec430f\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#ec430f\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#ec430f\\\",\\\"menu_text_active_color\\\":\\\"#ec430f\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#ec430f\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#ec430f\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#ec430f\\\"}},\\\"preset3\\\":{\\\"label\\\":\\\"Preset 3\\\",\\\"default\\\":\\\"#0fa89d\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#0fa89d\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#0fa89d\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#0fa89d\\\",\\\"menu_text_active_color\\\":\\\"#0fa89d\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#0fa89d\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#0fa89d\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#0fa89d\\\"}},\\\"preset4\\\":{\\\"label\\\":\\\"Preset 4\\\",\\\"default\\\":\\\"#4943ac\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#4943ac\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#4943ac\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#4943ac\\\",\\\"menu_text_active_color\\\":\\\"#4943ac\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#4943ac\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#4943ac\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#4943ac\\\"}},\\\"preset5\\\":{\\\"label\\\":\\\"Preset 5\\\",\\\"default\\\":\\\"#00aeef\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#00aeef\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#00aeef\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#00aeef\\\",\\\"menu_text_active_color\\\":\\\"#00aeef\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#00aeef\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#00aeef\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#00aeef\\\"}},\\\"preset6\\\":{\\\"label\\\":\\\"Preset 6\\\",\\\"default\\\":\\\"#f68e13\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#f68e13\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#f68e13\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#f68e13\\\",\\\"menu_text_active_color\\\":\\\"#f68e13\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#f68e13\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#f68e13\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#f68e13\\\"}},\\\"preset7\\\":{\\\"label\\\":\\\"Preset 7\\\",\\\"default\\\":\\\"#2ba84a\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#2ba84a\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#2ba84a\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#2ba84a\\\",\\\"menu_text_active_color\\\":\\\"#2ba84a\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#2ba84a\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#2ba84a\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"footer_text_color\\\":\\\"#ffffff\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#2ba84a\\\"}},\\\"preset8\\\":{\\\"label\\\":\\\"Preset 8\\\",\\\"default\\\":\\\"#ed145b\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#252525\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#ed145b\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"logo_text_color\\\":\\\"#ed145b\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"menu_text_hover_color\\\":\\\"#ed145b\\\",\\\"menu_text_active_color\\\":\\\"#ed145b\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#ed145b\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#ed145b\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#ed145b\\\"}}}\",\"preset\":\"{\\\"footer_link_hover_color\\\":\\\"#f68e13\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_text_color\\\":\\\"#FFFFFF\\\",\\\"footer_bg_color\\\":\\\"#212121\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#f68e13\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#f68e13\\\",\\\"menu_dropdown_text_color\\\":\\\"#252525\\\",\\\"menu_dropdown_bg_color\\\":\\\"#FFFFFF\\\",\\\"menu_text_active_color\\\":\\\"#f68e13\\\",\\\"menu_text_hover_color\\\":\\\"#f68e13\\\",\\\"menu_text_color\\\":\\\"#252525\\\",\\\"logo_text_color\\\":\\\"#f68e13\\\",\\\"topbar_text_color\\\":\\\"#ffffff\\\",\\\"topbar_bg_color\\\":\\\"#333333\\\",\\\"header_bg_color\\\":\\\"#FFFFFF\\\",\\\"link_hover_color\\\":\\\"#044CD0\\\",\\\"link_color\\\":\\\"#f68e13\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"text_color\\\":\\\"#252525\\\",\\\"preset\\\":\\\"preset6\\\"}\",\"topbar_bg_color\":\"#333333\",\"topbar_text_color\":\"#aaaaaa\",\"header_bg_color\":\"#ffffff\",\"logo_text_color\":\"#0345bf\",\"menu_text_color\":\"#252525\",\"menu_text_hover_color\":\"#0345bf\",\"menu_text_active_color\":\"#0345bf\",\"menu_dropdown_bg_color\":\"#ffffff\",\"menu_dropdown_text_color\":\"#252525\",\"menu_dropdown_text_hover_color\":\"#0345bf\",\"menu_dropdown_text_active_color\":\"#0345bf\",\"text_color\":\"#252525\",\"bg_color\":\"#ffffff\",\"link_color\":\"#0345bf\",\"link_hover_color\":\"#044cd0\",\"footer_bg_color\":\"#171717\",\"footer_text_color\":\"#ffffff\",\"footer_link_color\":\"#a2a2a2\",\"footer_link_hover_color\":\"#ffffff\",\"name\":\"\",\"custom_class\":\"\",\"padding\":\"\",\"margin\":\"\",\"layout\":\"[{\\\"type\\\":\\\"row\\\",\\\"layout\\\":12,\\\"settings\\\":{\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"background_position\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"fluidrow\\\":1,\\\"name\\\":\\\"Page Title\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"lg_col\\\":\\\"\\\",\\\"xl_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"title\\\",\\\"column_type\\\":0,\\\"grid_size\\\":12}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":12,\\\"settings\\\":{\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"background_position\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"fluidrow\\\":0,\\\"name\\\":\\\"Content Top\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"lg_col\\\":\\\"\\\",\\\"xl_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"position1\\\",\\\"column_type\\\":0,\\\"grid_size\\\":12}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"4+4+4\\\",\\\"settings\\\":{\\\"name\\\":\\\"Main Body\\\",\\\"background_color\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"fluidrow\\\":0,\\\"custom_class\\\":\\\"\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"grid_size\\\":4,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"left\\\",\\\"column_type\\\":0}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"grid_size\\\":4,\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"column_type\\\":1}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"grid_size\\\":4,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"right\\\",\\\"column_type\\\":0}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":12,\\\"settings\\\":{\\\"name\\\":\\\"Content Bottom\\\",\\\"fluidrow\\\":0,\\\"custom_class\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_position\\\":\\\"\\\",\\\"hide_on_phone\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_desktop\\\":0},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"lg_col\\\":\\\"\\\",\\\"xl_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"position2\\\",\\\"column_type\\\":0,\\\"grid_size\\\":12}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":12,\\\"settings\\\":{\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"name\\\":\\\"Bottom\\\",\\\"fluidrow\\\":0,\\\"custom_class\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_position\\\":\\\"\\\",\\\"hide_on_phone\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_desktop\\\":0},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"column_type\\\":0,\\\"name\\\":\\\"bottom1\\\",\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"sm_col\\\":\\\"col-sm-6\\\",\\\"xs_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"grid_size\\\":12}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"6+6\\\",\\\"settings\\\":{\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"background_position\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"fluidrow\\\":0,\\\"name\\\":\\\"Footer\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"custom_class\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"name\\\":\\\"footer1\\\",\\\"column_type\\\":0,\\\"grid_size\\\":6,\\\"sortableitem\\\":\\\"[object Object]\\\"}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"custom_class\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"name\\\":\\\"footer2\\\",\\\"column_type\\\":0,\\\"grid_size\\\":6}}]}]\",\"menu\":\"mainmenu\",\"menu_type\":\"mega_offcanvas\",\"dropdown_width\":\"180px\",\"menu_animation\":\"menu-animation-fade-up\",\"offcanvas_position\":\"right\",\"offcanvas_style\":\"1-LeftAlign\",\"offcanvas_menu\":\"mainmenu\",\"offcanvas_max_level\":\"0\",\"offcanvas_enable_search\":\"1\",\"enable_body_font\":\"1\",\"hu-webfont-size-field\":\"\",\"hu-webfont-size-field-sm\":\"\",\"hu-webfont-size-field-xs\":\"\",\"hu-font-letter-spacing-input\":\"\",\"body_font\":\"{\\\"fontFamily\\\":\\\"PT Sans\\\",\\\"fontSize\\\":\\\"16px\\\",\\\"fontSize_sm\\\":\\\"14px\\\",\\\"fontSize_xs\\\":\\\"13px\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"cyrillic\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"1.56\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h1_font\":\"{\\\"fontFamily\\\":\\\"PT Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"cyrillic\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h2_font\":\"{\\\"fontFamily\\\":\\\"PT Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"cyrillic\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h3_font\":\"{\\\"fontFamily\\\":\\\"PT Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"cyrillic\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h4_font\":\"{\\\"fontFamily\\\":\\\"PT Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"cyrillic\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h5_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"h6_font\":\"{\\\"fontFamily\\\":\\\"Open Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_navigation_font\":\"1\",\"navigation_font\":\"{\\\"fontFamily\\\":\\\"Roboto Condensed\\\",\\\"fontSize\\\":\\\"14px\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"600\\\",\\\"fontSubset\\\":\\\"cyrillic\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"custom_font\":\"{\\\"fontFamily\\\":\\\"PT Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"cyrillic\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"custom_font_selectors\":\"\",\"image_thumbnail_size\":\"180x200\",\"image_small_size\":\"180x200\",\"image_medium_size\":\"180x200\",\"image_large_size\":\"180x200\",\"image_crop_quality\":\"100\",\"blog_list_image\":\"large\",\"leading_blog_list_image\":\"large\",\"blog_details_image\":\"large\",\"social_share\":\"1\",\"social_share_lists\":[\"facebook\",\"twitter\",\"linkedin\"],\"og_fb_id\":\"\",\"og_twitter_site\":\"\",\"reading_time_progress\":\"1\",\"reading_timeline_bg\":\"#0345bf\",\"reading_timeline_height\":\"5px\",\"reading_timeline_position\":\"top\",\"related_article\":\"1\",\"related_article_title\":\"Related Articles\",\"related_article_limit\":\"3\",\"related_article_view_type\":\"thumb\",\"comment\":\"disabled\",\"comment_disqus_subdomain\":\"\",\"comment_intensedebate_acc\":\"\",\"comment_facebook_app_id\":\"\",\"comment_facebook_width\":\"100\",\"comment_facebook_number\":\"10\",\"before_head\":\"\",\"after_body\":\"\",\"before_body\":\"\",\"custom_css\":\"\",\"custom_js\":\"\",\"exclude_js\":\"\",\"scssoption\":\"1\",\"enable_fontawesome\":\"1\",\"gfont_api\":\"\",\"ga_code\":\"\",\"ga_tracking_method\":\"gst\",\"id\":\"12\",\"template\":\"et_journey\",\"client_id\":\"0\",\"home\":\"1\",\"title\":\"et_journey - Default\"}'),
(13, 'wt_mambo_free', 0, '1', 'wt_mambo_free - Default', 0, '', '{\"logo_type\":\"image\",\"logo_text\":\"Mambo\",\"logo_image\":\"images\\/download.jpg\",\"logo_alt\":\"\",\"mobile_logo\":\"images\\/download.jpg\",\"logo_height\":\"40px\",\"logo_height_sm\":\"\",\"logo_height_xs\":\"\",\"logo_tooltip\":\"\",\"favicon\":\"\",\"toolbar_maxwidth\":\"default\",\"topbar_padding_top\":\"10px\",\"topbar_padding_bottom\":\"10px\",\"toolbar_font_size\":\"14px\",\"toolbar_visibility\":\"inherit\",\"predefined_header\":\"1\",\"header_style\":\"style-3\",\"overlay_header\":\"\",\"header_alignment\":\"\",\"header_maxwidth\":\"default\",\"header_height\":\"80px\",\"header_navbar\":\"0\",\"navbar_menu\":\"mainmenu\",\"nav_style\":\"\",\"header_menu_options\":\"\",\"headerbar_top_padding\":\"20px\",\"headerbar_bottom_padding\":\"20px\",\"header_stacked_margin\":\"20px\",\"header_offcanvas_mode\":\"slide\",\"header_offcanvas_overlay\":\"enable\",\"header_toggle_text\":\"show\",\"header_offcanvas_flip\":\"1\",\"header_menu_horizontally\":\"1\",\"search_position\":\"header\",\"search_style\":\"default\",\"social_pos\":\"toolbar-right\",\"facebook\":\"http:\\/\\/facebook.com\\/warptheme\",\"twitter\":\"twitter.com\",\"tiktok\":\"\",\"twitch\":\"\",\"discord\":\"\",\"telegram\":\"\",\"linkedin\":\"#\",\"dribbble\":\"\",\"instagram\":\"\",\"behance\":\"\",\"youtube\":\"\",\"skype\":\"\",\"whatsapp\":\"\",\"vk\":\"\",\"custom\":\"\",\"social_icons_gap\":\"small\",\"social_icons_size\":\"\",\"mobile_breakpoint_options\":\"m\",\"mobile_navbar_options\":\"0\",\"mobile_logo_options\":\"center\",\"mobile_toggle_options\":\"left\",\"mobile_menu_options\":\"\",\"mobile_animations\":\"offcanvas\",\"mobile_dropdown_mode\":\"slide\",\"mobile_offcanvas_mode\":\"slide\",\"page_title_maxwidth\":\"default\",\"page_title_padding\":\"\",\"page_title_bg_image\":\"images\\/warptheme\\/4.jpg\",\"page_title_background_size\":\"\",\"page_title_bg_position\":\"center-center\",\"page_title_bg_visibility\":\"\",\"page_title_bg_blendmode\":\"\",\"page_title_bg_color\":\"#1b1b1b\",\"page_title_tyle\":\"light\",\"page_title_align\":\"\",\"boxed_center\":\"1\",\"transparent_header\":\"\",\"body_bg_image\":\"\",\"body_image_size\":\"\",\"body_image_position\":\"center-center\",\"body_image_effect\":\"\",\"body_parallax_bgx_start\":\"\",\"body_parallax_bgx_end\":\"\",\"body_parallax_bgy_start\":\"\",\"body_parallax_bgy_end\":\"\",\"body_parallax_easing\":\"\",\"body_parallax_breakpoint\":\"\",\"body_image_visibility\":\"\",\"body_bg_color\":\"#f0f0f0\",\"enabled_copyright\":\"1\",\"copyright_position\":\"footer1\",\"copyright_load_pos\":\"default\",\"copyright\":\"\\u00a9 {year} Your Company. Designed By <a href=\\\"https:\\/\\/warptheme.com\\\">WarpTheme<\\/a>\",\"goto_top\":\"1\",\"contact_pos\":\"toolbar-left\",\"contact_location\":\"234, Triumph St, Los Angeles, California, US.\",\"contact_email\":\"\",\"contact_phone\":\"\",\"contact_time\":\"Mon - Satday: 9.00 am to 6.00 pm.\",\"contact_custom\":\"\",\"comingsoon_title\":\"Coming Soon Title\",\"comingsoon_content\":\"Coming soon content\",\"comingsoon_date\":\"2023-01-01\",\"comingsoon_logo\":\"\",\"comingsoon_bg_image\":\"images\\/warptheme\\/sliders\\/slider1.jpg\",\"comingsoon_title_background_size\":\"cover\",\"comingsoon_title_bg_position\":\"center-center\",\"comingsoon_title_bg_blendmode\":\"multiply\",\"comingsoon_title_bg_color\":\"#041332\",\"comingsoon_title_tyle\":\"light\",\"error_logo\":\"\",\"error_bg\":\"\",\"error_title_background_size\":\"\",\"error_title_bg_position\":\"center-center\",\"error_title_bg_blendmode\":\"\",\"error_title_bg_color\":\"#041332\",\"error_title_tyle\":\"light\",\"presets-data\":\"{\\\"preset1\\\":{\\\"label\\\":\\\"Preset 1\\\",\\\"default\\\":\\\"#34699a\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#848484\\\",\\\"preset\\\":\\\"preset1\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#34699a\\\",\\\"link_hover_color\\\":\\\"#34699a\\\",\\\"second_link_color\\\":\\\"#34699a\\\",\\\"header_top_bg_color\\\":\\\"#FFFFFF\\\",\\\"header_bg_color\\\":\\\"#131d33\\\",\\\"header_bottom_bg_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#131d33\\\",\\\"topbar_text_color\\\":\\\"#FFFFFF\\\",\\\"topbar_link_color\\\":\\\"#ffffff\\\",\\\"topbar_link_hover_color\\\":\\\"#d9d9d9\\\",\\\"logo_text_color\\\":\\\"#34699a\\\",\\\"header_bg_mobile_color\\\":\\\"#131d33\\\",\\\"logo_text_mobile_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_hover_color\\\":\\\"#d9d9d9\\\",\\\"menuright_text_color\\\":\\\"#ffffff\\\",\\\"menu_text_color\\\":\\\"#ffffff\\\",\\\"menu_text_hover_color\\\":\\\"#ffffff\\\",\\\"menu_text_active_color\\\":\\\"#ffffff\\\",\\\"menu_dropdown_bg_color\\\":\\\"#ffffff\\\",\\\"menu_dropdown_text_color\\\":\\\"#001837\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#34699a\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#34699a\\\",\\\"bottom_bg_color\\\":\\\"#10182b\\\",\\\"bottom_title_color\\\":\\\"#ffffff\\\",\\\"bottom_text_color\\\":\\\"#ffffff\\\",\\\"bottom_link_color\\\":\\\"#ffffff\\\",\\\"bottom_link_hover_color\\\":\\\"#b4c2d1\\\",\\\"footer_bg_color\\\":\\\"#131d33\\\",\\\"footer_text_color\\\":\\\"#ffffff\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#b4c2d1\\\"}},\\\"preset2\\\":{\\\"label\\\":\\\"Preset 2\\\",\\\"default\\\":\\\"#f0d43a\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#848484\\\",\\\"preset\\\":\\\"preset2\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#f0d43a\\\",\\\"link_hover_color\\\":\\\"#f0d43a\\\",\\\"topbar_bg_color\\\":\\\"#131d33\\\",\\\"topbar_text_color\\\":\\\"#FFFFFF\\\",\\\"topbar_link_color\\\":\\\"#ffffff\\\",\\\"topbar_link_hover_color\\\":\\\"#d9d9d9\\\",\\\"header_top_bg_color\\\":\\\"#FFFFFF\\\",\\\"header_bg_color\\\":\\\"#131d33\\\",\\\"header_bottom_bg_color\\\":\\\"#FFFFFF\\\",\\\"logo_text_color\\\":\\\"#34699a\\\",\\\"header_bg_mobile_color\\\":\\\"#131d33\\\",\\\"logo_text_mobile_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_hover_color\\\":\\\"#d9d9d9\\\",\\\"menu_text_color\\\":\\\"#ffffff\\\",\\\"menu_text_hover_color\\\":\\\"#ffffff\\\",\\\"menu_text_active_color\\\":\\\"#ffffff\\\",\\\"menu_dropdown_bg_color\\\":\\\"#ffffff\\\",\\\"menu_dropdown_text_color\\\":\\\"#001837\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#f0d43a\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#f0d43a\\\",\\\"bottom_bg_color\\\":\\\"#10182b\\\",\\\"bottom_title_color\\\":\\\"#ffffff\\\",\\\"bottom_text_color\\\":\\\"#ffffff\\\",\\\"bottom_link_color\\\":\\\"#ffffff\\\",\\\"bottom_link_hover_color\\\":\\\"#b4c2d1\\\",\\\"footer_bg_color\\\":\\\"#131d33\\\",\\\"footer_text_color\\\":\\\"#ffffff\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#b4c2d1\\\"}},\\\"preset3\\\":{\\\"label\\\":\\\"Preset 3\\\",\\\"default\\\":\\\"#22b2da\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"text_color\\\":\\\"#848484\\\",\\\"preset\\\":\\\"preset3\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#22b2da\\\",\\\"link_hover_color\\\":\\\"#22b2da\\\",\\\"topbar_bg_color\\\":\\\"#131d33\\\",\\\"topbar_text_color\\\":\\\"#FFFFFF\\\",\\\"topbar_link_color\\\":\\\"#ffffff\\\",\\\"topbar_link_hover_color\\\":\\\"#d9d9d9\\\",\\\"header_top_bg_color\\\":\\\"#FFFFFF\\\",\\\"header_bg_color\\\":\\\"#131d33\\\",\\\"header_bottom_bg_color\\\":\\\"#FFFFFF\\\",\\\"logo_text_color\\\":\\\"#34699a\\\",\\\"header_bg_mobile_color\\\":\\\"#131d33\\\",\\\"logo_text_mobile_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_hover_color\\\":\\\"#d9d9d9\\\",\\\"menu_text_color\\\":\\\"#ffffff\\\",\\\"menu_text_hover_color\\\":\\\"#ffffff\\\",\\\"menu_text_active_color\\\":\\\"#ffffff\\\",\\\"menu_dropdown_bg_color\\\":\\\"#ffffff\\\",\\\"menu_dropdown_text_color\\\":\\\"#001837\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#22b2da\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#22b2da\\\",\\\"bottom_bg_color\\\":\\\"#10182b\\\",\\\"bottom_title_color\\\":\\\"#ffffff\\\",\\\"bottom_text_color\\\":\\\"#ffffff\\\",\\\"bottom_link_color\\\":\\\"#ffffff\\\",\\\"bottom_link_hover_color\\\":\\\"#b4c2d1\\\",\\\"footer_bg_color\\\":\\\"#131d33\\\",\\\"footer_text_color\\\":\\\"#ffffff\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#b4c2d1\\\"}},\\\"preset4\\\":{\\\"label\\\":\\\"Preset 4\\\",\\\"default\\\":\\\"#61b390\\\",\\\"description\\\":\\\"\\\",\\\"data\\\":{\\\"topbar_bg_color\\\":\\\"#131d33\\\",\\\"preset\\\":\\\"preset4\\\",\\\"topbar_text_color\\\":\\\"#FFFFFF\\\",\\\"topbar_link_color\\\":\\\"#ffffff\\\",\\\"topbar_link_hover_color\\\":\\\"#d9d9d9\\\",\\\"text_color\\\":\\\"#848484\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"link_color\\\":\\\"#61b390\\\",\\\"link_hover_color\\\":\\\"#61b390\\\",\\\"header_top_bg_color\\\":\\\"#FFFFFF\\\",\\\"header_bg_color\\\":\\\"#131d33\\\",\\\"header_bottom_bg_color\\\":\\\"#FFFFFF\\\",\\\"logo_text_color\\\":\\\"#34699a\\\",\\\"header_bg_mobile_color\\\":\\\"#131d33\\\",\\\"logo_text_mobile_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_hover_color\\\":\\\"#d9d9d9\\\",\\\"menu_text_color\\\":\\\"#ffffff\\\",\\\"menu_text_hover_color\\\":\\\"#ffffff\\\",\\\"menu_text_active_color\\\":\\\"#ffffff\\\",\\\"menu_dropdown_bg_color\\\":\\\"#ffffff\\\",\\\"menu_dropdown_text_color\\\":\\\"#001837\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#61b390\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#61b390\\\",\\\"bottom_bg_color\\\":\\\"#10182b\\\",\\\"bottom_title_color\\\":\\\"#ffffff\\\",\\\"bottom_text_color\\\":\\\"#ffffff\\\",\\\"bottom_link_color\\\":\\\"#ffffff\\\",\\\"bottom_link_hover_color\\\":\\\"#b4c2d1\\\",\\\"footer_bg_color\\\":\\\"#131d33\\\",\\\"footer_text_color\\\":\\\"#ffffff\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_link_hover_color\\\":\\\"#b4c2d1\\\"}}}\",\"preset\":\"{\\\"footer_link_hover_color\\\":\\\"#b4c2d1\\\",\\\"footer_link_color\\\":\\\"#ffffff\\\",\\\"footer_text_color\\\":\\\"#ffffff\\\",\\\"footer_bg_color\\\":\\\"#131d33\\\",\\\"bottom_link_hover_color\\\":\\\"#b4c2d1\\\",\\\"bottom_link_color\\\":\\\"#ffffff\\\",\\\"bottom_text_color\\\":\\\"#ffffff\\\",\\\"bottom_title_color\\\":\\\"#ffffff\\\",\\\"bottom_bg_color\\\":\\\"#10182b\\\",\\\"menu_dropdown_text_active_color\\\":\\\"#34699a\\\",\\\"menu_dropdown_text_hover_color\\\":\\\"#34699a\\\",\\\"menu_dropdown_text_color\\\":\\\"#001837\\\",\\\"menu_dropdown_bg_color\\\":\\\"#ffffff\\\",\\\"menu_text_active_color\\\":\\\"#ffffff\\\",\\\"menu_text_hover_color\\\":\\\"#ffffff\\\",\\\"menu_text_color\\\":\\\"#ffffff\\\",\\\"menuright_text_color\\\":\\\"#ffffff\\\",\\\"toggle_mobile_hover_color\\\":\\\"#d9d9d9\\\",\\\"toggle_mobile_color\\\":\\\"#ffffff\\\",\\\"logo_text_mobile_color\\\":\\\"#ffffff\\\",\\\"header_bg_mobile_color\\\":\\\"#131d33\\\",\\\"logo_text_color\\\":\\\"#34699a\\\",\\\"topbar_link_hover_color\\\":\\\"#d9d9d9\\\",\\\"topbar_link_color\\\":\\\"#ffffff\\\",\\\"topbar_text_color\\\":\\\"#FFFFFF\\\",\\\"topbar_bg_color\\\":\\\"#131d33\\\",\\\"header_bottom_bg_color\\\":\\\"#FFFFFF\\\",\\\"header_bg_color\\\":\\\"#131d33\\\",\\\"header_top_bg_color\\\":\\\"#FFFFFF\\\",\\\"second_link_color\\\":\\\"#34699a\\\",\\\"link_hover_color\\\":\\\"#34699a\\\",\\\"link_color\\\":\\\"#34699a\\\",\\\"bg_color\\\":\\\"#FFFFFF\\\",\\\"text_color\\\":\\\"#848484\\\",\\\"preset\\\":\\\"preset1\\\"}\",\"custom_style\":\"1\",\"text_color\":\"#848484\",\"bg_color\":\"#ffffff\",\"link_color\":\"#ff5e14\",\"link_hover_color\":\"#ff5e14\",\"topbar_bg_color\":\"#131d33\",\"topbar_text_color\":\"#ffffff\",\"topbar_link_color\":\"#ffffff\",\"topbar_link_hover_color\":\"#d9d9d9\",\"header_top_bg_color\":\"#ffffff\",\"header_bg_color\":\"#131d33\",\"header_bottom_bg_color\":\"#ffffff\",\"logo_text_color\":\"#ffffff\",\"header_bg_mobile_color\":\"#131d33\",\"logo_text_mobile_color\":\"#ffffff\",\"toggle_mobile_color\":\"#ffffff\",\"toggle_mobile_hover_color\":\"#d9d9d9\",\"menu_text_color\":\"#ffffff\",\"menu_text_hover_color\":\"#ffffff\",\"menu_text_active_color\":\"#ffffff\",\"menu_dropdown_bg_color\":\"#131d33\",\"menu_dropdown_text_color\":\"#ffffff\",\"menu_dropdown_text_hover_color\":\"#131d33\",\"menu_dropdown_text_active_color\":\"#131d33\",\"bottom_bg_color\":\"#10182b\",\"bottom_title_color\":\"#ffffff\",\"bottom_text_color\":\"#ffffff\",\"bottom_link_color\":\"#ffffff\",\"bottom_link_hover_color\":\"#b4c2d1\",\"footer_bg_color\":\"#131d33\",\"footer_text_color\":\"#ffffff\",\"footer_link_color\":\"#ffffff\",\"footer_link_hover_color\":\"#b4c2d1\",\"name\":\"\",\"custom_class\":\"\",\"padding\":\"\",\"margin\":\"\",\"layout\":\"[{\\\"type\\\":\\\"row\\\",\\\"layout\\\":12,\\\"settings\\\":{\\\"name\\\":\\\"Page title\\\",\\\"fluidrow\\\":1,\\\"custom_class\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_position\\\":\\\"\\\",\\\"hide_on_phone\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_desktop\\\":0,\\\"hide_desktop\\\":0,\\\"hide_small_desktop\\\":0,\\\"hide_tablet\\\":0,\\\"hide_large_mobile\\\":1,\\\"hide_mobile\\\":1,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"grid_size\\\":12,\\\"name\\\":\\\"title\\\",\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"column_type\\\":0}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"3+6+3\\\",\\\"settings\\\":{\\\"custom_class\\\":\\\"\\\",\\\"fluidrow\\\":0,\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"link_hover_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"name\\\":\\\"Main Body\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"column_type\\\":0,\\\"custom_class\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"name\\\":\\\"left\\\",\\\"grid_size\\\":3}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"column_type\\\":1,\\\"grid_size\\\":6,\\\"custom_class\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"custom_class\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"name\\\":\\\"right\\\",\\\"column_type\\\":0,\\\"grid_size\\\":3}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"4+4+4\\\",\\\"settings\\\":{\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"background_position\\\":\\\"50% 50%\\\",\\\"background_attachment\\\":\\\"inherit\\\",\\\"background_size\\\":\\\"cover\\\",\\\"background_repeat\\\":\\\"no-repeat\\\",\\\"background_image\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"margin\\\":\\\"\\\",\\\"padding\\\":\\\"60px 0\\\",\\\"custom_class\\\":\\\"\\\",\\\"fluidrow\\\":0,\\\"name\\\":\\\"Bottom\\\"},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"grid_size\\\":4,\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"xl_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"bottom1\\\",\\\"column_type\\\":0,\\\"sortableitem\\\":\\\"[object Object]\\\"}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"hidden_md\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_xs\\\":0,\\\"grid_size\\\":4,\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"xl_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"bottom2\\\",\\\"column_type\\\":0,\\\"sortableitem\\\":\\\"[object Object]\\\"}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"grid_size\\\":4,\\\"hide_on_desktop\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_phone\\\":0,\\\"xs_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"xl_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\",\\\"name\\\":\\\"bottom3\\\",\\\"column_type\\\":0,\\\"sortableitem\\\":\\\"[object Object]\\\"}}]},{\\\"type\\\":\\\"row\\\",\\\"layout\\\":\\\"6+6\\\",\\\"settings\\\":{\\\"name\\\":\\\"Footer\\\",\\\"fluidrow\\\":0,\\\"custom_class\\\":\\\"\\\",\\\"padding\\\":\\\"15px 0\\\",\\\"margin\\\":\\\"\\\",\\\"color\\\":\\\"\\\",\\\"link_color\\\":\\\"\\\",\\\"link_hover_color\\\":\\\"\\\",\\\"background_color\\\":\\\"\\\",\\\"background_image\\\":\\\"\\\",\\\"background_repeat\\\":\\\"\\\",\\\"background_size\\\":\\\"\\\",\\\"background_attachment\\\":\\\"\\\",\\\"background_position\\\":\\\"\\\",\\\"hide_on_phone\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_desktop\\\":0,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0},\\\"attr\\\":[{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"sortableitem\\\":\\\"[object Object]\\\",\\\"grid_size\\\":6,\\\"column_type\\\":0,\\\"name\\\":\\\"footer1\\\",\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"custom_class\\\":\\\"\\\"}},{\\\"type\\\":\\\"sp_col\\\",\\\"settings\\\":{\\\"grid_size\\\":6,\\\"hidden_xs\\\":0,\\\"hidden_sm\\\":0,\\\"hidden_md\\\":0,\\\"column_type\\\":0,\\\"name\\\":\\\"footer2\\\",\\\"custom_class\\\":\\\"uk-flex uk-flex-right@m\\\",\\\"xl_col\\\":\\\"\\\",\\\"md_col\\\":\\\"\\\",\\\"sm_col\\\":\\\"\\\",\\\"xs_col\\\":\\\"\\\",\\\"hide_on_phone\\\":0,\\\"hide_on_large_phone\\\":0,\\\"hide_on_tablet\\\":0,\\\"hide_on_small_desktop\\\":0,\\\"hide_on_desktop\\\":0}}]}]\",\"menu\":\"mainmenu\",\"dropdown_width\":\"\",\"menu_animation\":\"menu-animation-pulse\",\"offcanvas_menu\":\"mainmenu\",\"offcanvas_max_level\":\"0\",\"header_menu\":\"mainmenu\",\"header_menu_style\":\"navbar\",\"hd_menu_max_level\":\"0\",\"toolbar_left_menu\":\"mainmenu\",\"toolbar_right_menu\":\"mainmenu\",\"enable_body_font\":\"1\",\"hu-webfont-size-field\":\"\",\"hu-webfont-size-field-sm\":\"\",\"hu-webfont-size-field-xs\":\"\",\"hu-font-letter-spacing-input\":\"\",\"body_font\":\"{\\\"fontFamily\\\":\\\"Roboto\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"400\\\",\\\"fontSubset\\\":\\\"latin-ext\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_h1_font\":\"1\",\"h1_font\":\"{\\\"fontFamily\\\":\\\"DM Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"700\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_h2_font\":\"1\",\"h2_font\":\"{\\\"fontFamily\\\":\\\"DM Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"700\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_h3_font\":\"1\",\"h3_font\":\"{\\\"fontFamily\\\":\\\"DM Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"700\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_h4_font\":\"1\",\"h4_font\":\"{\\\"fontFamily\\\":\\\"DM Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"500\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_h5_font\":\"1\",\"h5_font\":\"{\\\"fontFamily\\\":\\\"DM Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"400\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_h6_font\":\"1\",\"h6_font\":\"{\\\"fontFamily\\\":\\\"DM Sans\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"400\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"enable_navigation_font\":\"1\",\"navigation_font\":\"{\\\"fontFamily\\\":\\\"DM Sans\\\",\\\"fontSize\\\":\\\"13px\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"500\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"custom_font\":\"{\\\"fontFamily\\\":\\\"ABeeZee\\\",\\\"fontSize\\\":\\\"\\\",\\\"fontSize_sm\\\":\\\"\\\",\\\"fontSize_xs\\\":\\\"\\\",\\\"fontWeight\\\":\\\"\\\",\\\"fontSubset\\\":\\\"latin\\\",\\\"fontColor\\\":\\\"\\\",\\\"fontLineHeight\\\":\\\"\\\",\\\"fontLetterSpacing\\\":\\\"\\\",\\\"textDecoration\\\":\\\"none\\\",\\\"textAlign\\\":\\\"\\\"}\",\"custom_font_selectors\":\"\",\"blog_list_grid_column_gap\":\"\",\"blog_list_grid_row_gap\":\"\",\"blog_list_breakpoint\":\"m\",\"blog_parallax\":\"\",\"image_margin\":\"default\",\"image_transition\":\"\",\"leading_blog_list_title\":\"h3\",\"blog_list_title_link\":\"default\",\"leading_blog_list_title_margin\":\"default\",\"leading_blog_list_meta_margin\":\"default\",\"content_length\":\"\",\"leading_blog_list_content_margin\":\"default\",\"leading_blog_list_button\":\"default\",\"leading_blog_list_button_margin\":\"default\",\"image_thumbnail_size\":\"200X200\",\"image_small_size\":\"100X100\",\"image_medium_size\":\"300X300\",\"image_large_size\":\"600X600\",\"image_crop_quality\":\"100\",\"blog_list_image\":\"default\",\"leading_blog_list_image\":\"large\",\"article_content_width\":\"\",\"article_image_margin\":\"default\",\"blog_details_image\":\"large\",\"blog_details_title_margin\":\"default\",\"blog_details_meta_margin\":\"default\",\"blog_details_meta_style\":\"sentence\",\"blog_details_content_margin\":\"default\",\"social_share_lists\":[\"facebook\",\"twitter\",\"linkedin\"],\"og_fb_id\":\"\",\"og_twitter_site\":\"\",\"reading_timeline_bg\":\"#0345bf\",\"reading_timeline_height\":\"5px\",\"reading_timeline_position\":\"top\",\"related_article_title\":\"Related Articles\",\"related_article_limit\":\"3\",\"related_article_view_type\":\"thumb\",\"comment\":\"disabled\",\"comment_disqus_subdomain\":\"\",\"comment_intensedebate_acc\":\"\",\"comment_facebook_app_id\":\"\",\"comment_facebook_width\":\"100\",\"comment_facebook_number\":\"10\",\"before_head\":\"\",\"after_body\":\"\",\"before_body\":\"\",\"custom_css\":\"\",\"custom_js\":\"\",\"cookie_type\":\"notification\",\"cookie_bar_position\":\"top\",\"cookie_position\":\"bottom-left\",\"cookie_bar_style\":\"muted\",\"cookie_style\":\"\",\"cookie_content\":\"By using this website, you agree to the use of cookies as described in our Privacy Policy.\",\"cookie_button\":\"\",\"cookie_button_text\":\"I accept\",\"exclude_js\":\"\",\"scssoption\":\"1\",\"enable_fontawesome\":\"1\",\"gfont_api\":\"\",\"ga_code\":\"\",\"ga_tracking_method\":\"\",\"id\":\"13\",\"template\":\"wt_mambo_free\",\"client_id\":\"0\",\"home\":\"1\",\"title\":\"wt_mambo_free - Default\"}');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_ucm_base`
--

CREATE TABLE `hde5p_ucm_base` (
  `ucm_id` int(10) UNSIGNED NOT NULL,
  `ucm_item_id` int(11) NOT NULL,
  `ucm_type_id` int(11) NOT NULL,
  `ucm_language_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_ucm_content`
--

CREATE TABLE `hde5p_ucm_content` (
  `core_content_id` int(10) UNSIGNED NOT NULL,
  `core_type_alias` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'FK to the content types table',
  `core_title` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_alias` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL DEFAULT '',
  `core_body` mediumtext COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_state` tinyint(4) NOT NULL DEFAULT 0,
  `core_checked_out_time` datetime DEFAULT NULL,
  `core_checked_out_user_id` int(10) UNSIGNED DEFAULT NULL,
  `core_access` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `core_params` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_featured` tinyint(3) UNSIGNED NOT NULL DEFAULT 0,
  `core_metadata` varchar(2048) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'JSON encoded metadata properties.',
  `core_created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `core_created_by_alias` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_created_time` datetime NOT NULL,
  `core_modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Most recent user that modified',
  `core_modified_time` datetime NOT NULL,
  `core_language` char(7) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `core_publish_up` datetime DEFAULT NULL,
  `core_publish_down` datetime DEFAULT NULL,
  `core_content_item_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'ID from the individual type table',
  `asset_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'FK to the #__assets table.',
  `core_images` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_urls` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_hits` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `core_version` int(10) UNSIGNED NOT NULL DEFAULT 1,
  `core_ordering` int(11) NOT NULL DEFAULT 0,
  `core_metakey` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_metadesc` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `core_catid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `core_type_id` int(10) UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Contains core content data in name spaced fields';

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_updates`
--

CREATE TABLE `hde5p_updates` (
  `update_id` int(11) NOT NULL,
  `update_site_id` int(11) DEFAULT 0,
  `extension_id` int(11) DEFAULT 0,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `element` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `folder` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `client_id` tinyint(4) DEFAULT 0,
  `version` varchar(32) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `detailsurl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `infourl` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `changelogurl` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Available Updates';

--
-- Dumping data for table `hde5p_updates`
--

INSERT INTO `hde5p_updates` (`update_id`, `update_site_id`, `extension_id`, `name`, `description`, `element`, `type`, `folder`, `client_id`, `version`, `data`, `detailsurl`, `infourl`, `changelogurl`, `extra_query`) VALUES
(211, 1, 224, 'Joomla', '', 'joomla', 'file', '', 0, '4.3.0', '', 'https://update.joomla.org/core/sts/extension_sts.xml', '', '', ''),
(212, 2, 0, 'Afrikaans', '', 'pkg_af-ZA', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/af-ZA_details.xml', '', '', ''),
(213, 2, 0, 'Arabic Unitag', '', 'pkg_ar-AA', 'package', '', 0, '4.0.2.1', '', 'https://update.joomla.org/language/details4/ar-AA_details.xml', '', '', ''),
(214, 2, 0, 'Bulgarian', '', 'pkg_bg-BG', 'package', '', 0, '4.2.7.1', '', 'https://update.joomla.org/language/details4/bg-BG_details.xml', '', '', ''),
(215, 2, 0, 'Catalan', '', 'pkg_ca-ES', 'package', '', 0, '4.0.4.2', '', 'https://update.joomla.org/language/details4/ca-ES_details.xml', '', '', ''),
(216, 2, 0, 'Chinese, Simplified', '', 'pkg_zh-CN', 'package', '', 0, '4.2.0.1', '', 'https://update.joomla.org/language/details4/zh-CN_details.xml', '', '', ''),
(217, 2, 0, 'Chinese, Traditional', '', 'pkg_zh-TW', 'package', '', 0, '4.2.3.1', '', 'https://update.joomla.org/language/details4/zh-TW_details.xml', '', '', ''),
(218, 2, 0, 'Czech', '', 'pkg_cs-CZ', 'package', '', 0, '4.2.0.1', '', 'https://update.joomla.org/language/details4/cs-CZ_details.xml', '', '', ''),
(219, 2, 0, 'Danish', '', 'pkg_da-DK', 'package', '', 0, '4.3.0.2', '', 'https://update.joomla.org/language/details4/da-DK_details.xml', '', '', ''),
(220, 2, 0, 'Dutch', '', 'pkg_nl-NL', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/nl-NL_details.xml', '', '', ''),
(221, 2, 0, 'English, Australia', '', 'pkg_en-AU', 'package', '', 0, '4.2.8.2', '', 'https://update.joomla.org/language/details4/en-AU_details.xml', '', '', ''),
(222, 2, 0, 'English, Canada', '', 'pkg_en-CA', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/en-CA_details.xml', '', '', ''),
(223, 2, 0, 'English, New Zealand', '', 'pkg_en-NZ', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/en-NZ_details.xml', '', '', ''),
(224, 2, 0, 'English, USA', '', 'pkg_en-US', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/en-US_details.xml', '', '', ''),
(225, 2, 0, 'Estonian', '', 'pkg_et-EE', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/et-EE_details.xml', '', '', ''),
(226, 2, 0, 'Finnish', '', 'pkg_fi-FI', 'package', '', 0, '4.1.1.2', '', 'https://update.joomla.org/language/details4/fi-FI_details.xml', '', '', ''),
(227, 2, 0, 'Flemish', '', 'pkg_nl-BE', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/nl-BE_details.xml', '', '', ''),
(228, 2, 0, 'French', '', 'pkg_fr-FR', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/fr-FR_details.xml', '', '', ''),
(229, 2, 0, 'Georgian', '', 'pkg_ka-GE', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/ka-GE_details.xml', '', '', ''),
(230, 2, 0, 'German', '', 'pkg_de-DE', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/de-DE_details.xml', '', '', ''),
(231, 2, 0, 'German, Austria', '', 'pkg_de-AT', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/de-AT_details.xml', '', '', ''),
(232, 2, 0, 'German, Liechtenstein', '', 'pkg_de-LI', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/de-LI_details.xml', '', '', ''),
(233, 2, 0, 'German, Luxembourg', '', 'pkg_de-LU', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/de-LU_details.xml', '', '', ''),
(234, 2, 0, 'German, Switzerland', '', 'pkg_de-CH', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/de-CH_details.xml', '', '', ''),
(235, 2, 0, 'Greek', '', 'pkg_el-GR', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/el-GR_details.xml', '', '', ''),
(236, 2, 0, 'Hungarian', '', 'pkg_hu-HU', 'package', '', 0, '4.2.7.1', '', 'https://update.joomla.org/language/details4/hu-HU_details.xml', '', '', ''),
(237, 2, 0, 'Irish', '', 'pkg_ga-IE', 'package', '', 0, '4.2.8.1', '', 'https://update.joomla.org/language/details4/ga-IE_details.xml', '', '', ''),
(238, 2, 0, 'Italian', '', 'pkg_it-IT', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/it-IT_details.xml', '', '', ''),
(239, 2, 0, 'Japanese', '', 'pkg_ja-JP', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/ja-JP_details.xml', '', '', ''),
(240, 2, 0, 'Kazakh', '', 'pkg_kk-KZ', 'package', '', 0, '4.1.2.1', '', 'https://update.joomla.org/language/details4/kk-KZ_details.xml', '', '', ''),
(241, 2, 0, 'Latvian', '', 'pkg_lv-LV', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/lv-LV_details.xml', '', '', ''),
(242, 2, 0, 'Lithuanian', '', 'pkg_lt-LT', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/lt-LT_details.xml', '', '', ''),
(243, 2, 0, 'Macedonian', '', 'pkg_mk-MK', 'package', '', 0, '4.2.4.1', '', 'https://update.joomla.org/language/details4/mk-MK_details.xml', '', '', ''),
(244, 2, 0, 'Norwegian Bokmål', '', 'pkg_nb-NO', 'package', '', 0, '4.0.1.1', '', 'https://update.joomla.org/language/details4/nb-NO_details.xml', '', '', ''),
(245, 2, 0, 'Persian Farsi', '', 'pkg_fa-IR', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/fa-IR_details.xml', '', '', ''),
(246, 2, 0, 'Polish', '', 'pkg_pl-PL', 'package', '', 0, '4.2.8.2', '', 'https://update.joomla.org/language/details4/pl-PL_details.xml', '', '', ''),
(247, 2, 0, 'Portuguese, Brazil', '', 'pkg_pt-BR', 'package', '', 0, '4.0.3.1', '', 'https://update.joomla.org/language/details4/pt-BR_details.xml', '', '', ''),
(248, 2, 0, 'Portuguese, Portugal', '', 'pkg_pt-PT', 'package', '', 0, '4.0.0-rc4.2', '', 'https://update.joomla.org/language/details4/pt-PT_details.xml', '', '', ''),
(249, 2, 0, 'Romanian', '', 'pkg_ro-RO', 'package', '', 0, '4.2.7.1', '', 'https://update.joomla.org/language/details4/ro-RO_details.xml', '', '', ''),
(250, 2, 0, 'Russian', '', 'pkg_ru-RU', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/ru-RU_details.xml', '', '', ''),
(251, 2, 0, 'Serbian, Cyrillic', '', 'pkg_sr-RS', 'package', '', 0, '4.2.7.1', '', 'https://update.joomla.org/language/details4/sr-RS_details.xml', '', '', ''),
(252, 2, 0, 'Serbian, Latin', '', 'pkg_sr-YU', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/sr-YU_details.xml', '', '', ''),
(253, 2, 0, 'Slovak', '', 'pkg_sk-SK', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/sk-SK_details.xml', '', '', ''),
(254, 2, 0, 'Slovenian', '', 'pkg_sl-SI', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/sl-SI_details.xml', '', '', ''),
(255, 2, 0, 'Spanish', '', 'pkg_es-ES', 'package', '', 0, '4.2.3.1', '', 'https://update.joomla.org/language/details4/es-ES_details.xml', '', '', ''),
(256, 2, 0, 'Swedish', '', 'pkg_sv-SE', 'package', '', 0, '4.2.9.1', '', 'https://update.joomla.org/language/details4/sv-SE_details.xml', '', '', ''),
(257, 2, 0, 'Tamil, India', '', 'pkg_ta-IN', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/ta-IN_details.xml', '', '', ''),
(258, 2, 0, 'Thai', '', 'pkg_th-TH', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/th-TH_details.xml', '', '', ''),
(259, 2, 0, 'Turkish', '', 'pkg_tr-TR', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/tr-TR_details.xml', '', '', ''),
(260, 2, 0, 'Ukrainian', '', 'pkg_uk-UA', 'package', '', 0, '4.2.5.1', '', 'https://update.joomla.org/language/details4/uk-UA_details.xml', '', '', ''),
(261, 2, 0, 'Vietnamese', '', 'pkg_vi-VN', 'package', '', 0, '4.2.2.1', '', 'https://update.joomla.org/language/details4/vi-VN_details.xml', '', '', ''),
(262, 2, 0, 'Welsh', '', 'pkg_cy-GB', 'package', '', 0, '4.3.0.1', '', 'https://update.joomla.org/language/details4/cy-GB_details.xml', '', '', ''),
(263, 5, 0, 'shaper_helixultimate', 'Shaper Helixultimate', 'shaper_helixultimate', 'template', '', 0, '2.0.12', '', 'https://www.joomshaper.com/updates/shaper-helixultimate.xml', '', NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_update_sites`
--

CREATE TABLE `hde5p_update_sites` (
  `update_site_id` int(11) NOT NULL,
  `name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `location` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `enabled` int(11) DEFAULT 0,
  `last_check_timestamp` bigint(20) DEFAULT 0,
  `extra_query` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT '',
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Update Sites';

--
-- Dumping data for table `hde5p_update_sites`
--

INSERT INTO `hde5p_update_sites` (`update_site_id`, `name`, `type`, `location`, `enabled`, `last_check_timestamp`, `extra_query`, `checked_out`, `checked_out_time`) VALUES
(1, 'Joomla! Core', 'collection', 'https://update.joomla.org/core/list.xml', 1, 1681968595, '', NULL, NULL),
(2, 'Accredited Joomla! Translations', 'collection', 'https://update.joomla.org/language/translationlist_4.xml', 1, 1681968598, '', NULL, NULL),
(3, 'Joomla! Update Component', 'extension', 'https://update.joomla.org/core/extensions/com_joomlaupdate.xml', 1, 1681968598, '', NULL, NULL),
(4, 'System - Helix Ultimate Framework', 'extension', 'http://www.joomshaper.com/updates/plg-system-helixultimate.xml', 1, 1681968599, '', NULL, NULL),
(5, 'shaper_helixultimate', 'extension', 'https://www.joomshaper.com/updates/shaper-helixultimate.xml', 1, 1681968599, '', NULL, NULL),
(6, 'SP Simple Portfolio Module', 'extension', 'http://www.joomshaper.com/updates/mod-sp-simple-portfolio.xml', 1, 1681968600, '', NULL, NULL),
(7, 'SP Simple Portfolio', 'extension', 'http://www.joomshaper.com/updates/com-sp-simple-portfolio.xml', 1, 1681968601, '', NULL, NULL),
(8, 'SP Easy Image Gallery', 'extension', 'https://www.joomshaper.com/updates/com-sp-easyimagegallery.xml', 1, 1681968601, '', NULL, NULL),
(9, 'SP Page Builder', 'extension', 'https://www.joomshaper.com/updates/com-sp-page-builder-lite-next.xml', 1, 1681967258, '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_update_sites_extensions`
--

CREATE TABLE `hde5p_update_sites_extensions` (
  `update_site_id` int(11) NOT NULL DEFAULT 0,
  `extension_id` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Links extensions to update sites';

--
-- Dumping data for table `hde5p_update_sites_extensions`
--

INSERT INTO `hde5p_update_sites_extensions` (`update_site_id`, `extension_id`) VALUES
(1, 224),
(2, 225),
(3, 24),
(4, 230),
(5, 231),
(6, 235),
(7, 234),
(8, 236),
(9, 238);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_usergroups`
--

CREATE TABLE `hde5p_usergroups` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `parent_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Adjacency List Reference Id',
  `lft` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set lft.',
  `rgt` int(11) NOT NULL DEFAULT 0 COMMENT 'Nested set rgt.',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_usergroups`
--

INSERT INTO `hde5p_usergroups` (`id`, `parent_id`, `lft`, `rgt`, `title`) VALUES
(1, 0, 1, 18, 'Public'),
(2, 1, 8, 15, 'Registered'),
(3, 2, 9, 14, 'Author'),
(4, 3, 10, 13, 'Editor'),
(5, 4, 11, 12, 'Publisher'),
(6, 1, 4, 7, 'Manager'),
(7, 6, 5, 6, 'Administrator'),
(8, 1, 16, 17, 'Super Users'),
(9, 1, 2, 3, 'Guest');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_users`
--

CREATE TABLE `hde5p_users` (
  `id` int(11) NOT NULL,
  `name` varchar(400) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `username` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `email` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `password` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `block` tinyint(4) NOT NULL DEFAULT 0,
  `sendEmail` tinyint(4) DEFAULT 0,
  `registerDate` datetime NOT NULL,
  `lastvisitDate` datetime DEFAULT NULL,
  `activation` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `params` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `lastResetTime` datetime DEFAULT NULL COMMENT 'Date of last password reset',
  `resetCount` int(11) NOT NULL DEFAULT 0 COMMENT 'Count of password resets since lastResetTime',
  `otpKey` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Two factor authentication encrypted keys',
  `otep` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Backup Codes',
  `requireReset` tinyint(4) NOT NULL DEFAULT 0 COMMENT 'Require user to reset password on next login',
  `authProvider` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT 'Name of used authentication plugin'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_users`
--

INSERT INTO `hde5p_users` (`id`, `name`, `username`, `email`, `password`, `block`, `sendEmail`, `registerDate`, `lastvisitDate`, `activation`, `params`, `lastResetTime`, `resetCount`, `otpKey`, `otep`, `requireReset`, `authProvider`) VALUES
(101, 'DevJavu', 'admin', 'egoalter415@gmail.com', '$2y$10$bVAmqtYhRLqb03pmFBkinetNn3mKy0Qe2l9PdyEud3fr1midicCt2', 0, 1, '2023-04-11 02:13:10', '2023-04-20 05:04:55', '0', '', NULL, 0, '', '', 0, '');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_user_keys`
--

CREATE TABLE `hde5p_user_keys` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` varchar(150) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `series` varchar(191) COLLATE utf8mb4_unicode_ci NOT NULL,
  `time` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `uastring` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_user_mfa`
--

CREATE TABLE `hde5p_user_mfa` (
  `id` int(11) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `method` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `options` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_on` datetime NOT NULL,
  `last_used` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Multi-factor Authentication settings';

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_user_notes`
--

CREATE TABLE `hde5p_user_notes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `catid` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `subject` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `state` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out` int(10) UNSIGNED DEFAULT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `created_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `created_time` datetime NOT NULL,
  `modified_user_id` int(10) UNSIGNED NOT NULL DEFAULT 0,
  `modified_time` datetime NOT NULL,
  `review_time` datetime DEFAULT NULL,
  `publish_up` datetime DEFAULT NULL,
  `publish_down` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_user_profiles`
--

CREATE TABLE `hde5p_user_profiles` (
  `user_id` int(11) NOT NULL,
  `profile_key` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `profile_value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `ordering` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='Simple user profile storage table';

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_user_usergroup_map`
--

CREATE TABLE `hde5p_user_usergroup_map` (
  `user_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__users.id',
  `group_id` int(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Foreign Key to #__usergroups.id'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_user_usergroup_map`
--

INSERT INTO `hde5p_user_usergroup_map` (`user_id`, `group_id`) VALUES
(101, 8);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_viewlevels`
--

CREATE TABLE `hde5p_viewlevels` (
  `id` int(10) UNSIGNED NOT NULL COMMENT 'Primary Key',
  `title` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `ordering` int(11) NOT NULL DEFAULT 0,
  `rules` varchar(5120) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'JSON encoded access control.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_viewlevels`
--

INSERT INTO `hde5p_viewlevels` (`id`, `title`, `ordering`, `rules`) VALUES
(1, 'Public', 0, '[1]'),
(2, 'Registered', 2, '[6,2,8]'),
(3, 'Special', 3, '[6,3,8]'),
(5, 'Guest', 1, '[9]'),
(6, 'Super Users', 4, '[8]');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_webauthn_credentials`
--

CREATE TABLE `hde5p_webauthn_credentials` (
  `id` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential ID',
  `user_id` varchar(128) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'User handle',
  `label` varchar(190) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Human readable label',
  `credential` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'Credential source data, JSON format'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_workflows`
--

CREATE TABLE `hde5p_workflows` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT 0,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `created` datetime NOT NULL,
  `created_by` int(11) NOT NULL DEFAULT 0,
  `modified` datetime NOT NULL,
  `modified_by` int(11) NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_workflows`
--

INSERT INTO `hde5p_workflows` (`id`, `asset_id`, `published`, `title`, `description`, `extension`, `default`, `ordering`, `created`, `created_by`, `modified`, `modified_by`, `checked_out_time`, `checked_out`) VALUES
(1, 56, 1, 'COM_WORKFLOW_BASIC_WORKFLOW', '', 'com_content.article', 1, 1, '2023-04-11 02:12:45', 101, '2023-04-11 02:12:45', 101, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_workflow_associations`
--

CREATE TABLE `hde5p_workflow_associations` (
  `item_id` int(11) NOT NULL DEFAULT 0 COMMENT 'Extension table id value',
  `stage_id` int(11) NOT NULL COMMENT 'Foreign Key to #__workflow_stages.id',
  `extension` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_workflow_associations`
--

INSERT INTO `hde5p_workflow_associations` (`item_id`, `stage_id`, `extension`) VALUES
(1, 1, 'com_content.article'),
(2, 1, 'com_content.article'),
(3, 1, 'com_content.article'),
(4, 1, 'com_content.article'),
(5, 1, 'com_content.article'),
(6, 1, 'com_content.article');

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_workflow_stages`
--

CREATE TABLE `hde5p_workflow_stages` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `workflow_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `default` tinyint(4) NOT NULL DEFAULT 0,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_workflow_stages`
--

INSERT INTO `hde5p_workflow_stages` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `default`, `checked_out_time`, `checked_out`) VALUES
(1, 57, 1, 1, 1, 'COM_WORKFLOW_BASIC_STAGE', '', 1, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `hde5p_workflow_transitions`
--

CREATE TABLE `hde5p_workflow_transitions` (
  `id` int(11) NOT NULL,
  `asset_id` int(11) DEFAULT 0,
  `ordering` int(11) NOT NULL DEFAULT 0,
  `workflow_id` int(11) NOT NULL,
  `published` tinyint(4) NOT NULL DEFAULT 0,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `from_stage_id` int(11) NOT NULL,
  `to_stage_id` int(11) NOT NULL,
  `options` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `checked_out_time` datetime DEFAULT NULL,
  `checked_out` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `hde5p_workflow_transitions`
--

INSERT INTO `hde5p_workflow_transitions` (`id`, `asset_id`, `ordering`, `workflow_id`, `published`, `title`, `description`, `from_stage_id`, `to_stage_id`, `options`, `checked_out_time`, `checked_out`) VALUES
(1, 58, 1, 1, 1, 'UNPUBLISH', '', -1, 1, '{\"publishing\":\"0\"}', NULL, NULL),
(2, 59, 2, 1, 1, 'PUBLISH', '', -1, 1, '{\"publishing\":\"1\"}', NULL, NULL),
(3, 60, 3, 1, 1, 'TRASH', '', -1, 1, '{\"publishing\":\"-2\"}', NULL, NULL),
(4, 61, 4, 1, 1, 'ARCHIVE', '', -1, 1, '{\"publishing\":\"2\"}', NULL, NULL),
(5, 62, 5, 1, 1, 'FEATURE', '', -1, 1, '{\"featuring\":\"1\"}', NULL, NULL),
(6, 63, 6, 1, 1, 'UNFEATURE', '', -1, 1, '{\"featuring\":\"0\"}', NULL, NULL),
(7, 64, 7, 1, 1, 'PUBLISH_AND_FEATURE', '', -1, 1, '{\"publishing\":\"1\",\"featuring\":\"1\"}', NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `hde5p_action_logs`
--
ALTER TABLE `hde5p_action_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_user_id_logdate` (`user_id`,`log_date`),
  ADD KEY `idx_user_id_extension` (`user_id`,`extension`),
  ADD KEY `idx_extension_item_id` (`extension`,`item_id`);

--
-- Indexes for table `hde5p_action_logs_extensions`
--
ALTER TABLE `hde5p_action_logs_extensions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_action_logs_users`
--
ALTER TABLE `hde5p_action_logs_users`
  ADD PRIMARY KEY (`user_id`),
  ADD KEY `idx_notify` (`notify`);

--
-- Indexes for table `hde5p_action_log_config`
--
ALTER TABLE `hde5p_action_log_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_assets`
--
ALTER TABLE `hde5p_assets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_asset_name` (`name`),
  ADD KEY `idx_lft_rgt` (`lft`,`rgt`),
  ADD KEY `idx_parent_id` (`parent_id`);

--
-- Indexes for table `hde5p_associations`
--
ALTER TABLE `hde5p_associations`
  ADD PRIMARY KEY (`context`,`id`),
  ADD KEY `idx_key` (`key`);

--
-- Indexes for table `hde5p_banners`
--
ALTER TABLE `hde5p_banners`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100)),
  ADD KEY `idx_banner_catid` (`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_banner_clients`
--
ALTER TABLE `hde5p_banner_clients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_own_prefix` (`own_prefix`),
  ADD KEY `idx_metakey_prefix` (`metakey_prefix`(100));

--
-- Indexes for table `hde5p_banner_tracks`
--
ALTER TABLE `hde5p_banner_tracks`
  ADD PRIMARY KEY (`track_date`,`track_type`,`banner_id`),
  ADD KEY `idx_track_date` (`track_date`),
  ADD KEY `idx_track_type` (`track_type`),
  ADD KEY `idx_banner_id` (`banner_id`);

--
-- Indexes for table `hde5p_categories`
--
ALTER TABLE `hde5p_categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cat_idx` (`extension`,`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_contact_details`
--
ALTER TABLE `hde5p_contact_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_content`
--
ALTER TABLE `hde5p_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_featured_catid` (`featured`,`catid`),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_alias` (`alias`(191));

--
-- Indexes for table `hde5p_contentitem_tag_map`
--
ALTER TABLE `hde5p_contentitem_tag_map`
  ADD UNIQUE KEY `uc_ItemnameTagid` (`type_id`,`content_item_id`,`tag_id`),
  ADD KEY `idx_tag_type` (`tag_id`,`type_id`),
  ADD KEY `idx_date_id` (`tag_date`,`tag_id`),
  ADD KEY `idx_core_content_id` (`core_content_id`);

--
-- Indexes for table `hde5p_content_frontpage`
--
ALTER TABLE `hde5p_content_frontpage`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `hde5p_content_rating`
--
ALTER TABLE `hde5p_content_rating`
  ADD PRIMARY KEY (`content_id`);

--
-- Indexes for table `hde5p_content_types`
--
ALTER TABLE `hde5p_content_types`
  ADD PRIMARY KEY (`type_id`),
  ADD KEY `idx_alias` (`type_alias`(100));

--
-- Indexes for table `hde5p_extensions`
--
ALTER TABLE `hde5p_extensions`
  ADD PRIMARY KEY (`extension_id`),
  ADD KEY `element_clientid` (`element`,`client_id`),
  ADD KEY `element_folder_clientid` (`element`,`folder`,`client_id`),
  ADD KEY `extension` (`type`,`element`,`folder`,`client_id`);

--
-- Indexes for table `hde5p_fields`
--
ALTER TABLE `hde5p_fields`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_user_id` (`created_user_id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_fields_categories`
--
ALTER TABLE `hde5p_fields_categories`
  ADD PRIMARY KEY (`field_id`,`category_id`);

--
-- Indexes for table `hde5p_fields_groups`
--
ALTER TABLE `hde5p_fields_groups`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_context` (`context`(191)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_fields_values`
--
ALTER TABLE `hde5p_fields_values`
  ADD KEY `idx_field_id` (`field_id`),
  ADD KEY `idx_item_id` (`item_id`(191));

--
-- Indexes for table `hde5p_finder_filters`
--
ALTER TABLE `hde5p_finder_filters`
  ADD PRIMARY KEY (`filter_id`);

--
-- Indexes for table `hde5p_finder_links`
--
ALTER TABLE `hde5p_finder_links`
  ADD PRIMARY KEY (`link_id`),
  ADD KEY `idx_type` (`type_id`),
  ADD KEY `idx_title` (`title`(100)),
  ADD KEY `idx_md5` (`md5sum`),
  ADD KEY `idx_url` (`url`(75)),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_published_list` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`list_price`),
  ADD KEY `idx_published_sale` (`published`,`state`,`access`,`publish_start_date`,`publish_end_date`,`sale_price`);

--
-- Indexes for table `hde5p_finder_links_terms`
--
ALTER TABLE `hde5p_finder_links_terms`
  ADD PRIMARY KEY (`link_id`,`term_id`),
  ADD KEY `idx_term_weight` (`term_id`,`weight`),
  ADD KEY `idx_link_term_weight` (`link_id`,`term_id`,`weight`);

--
-- Indexes for table `hde5p_finder_logging`
--
ALTER TABLE `hde5p_finder_logging`
  ADD PRIMARY KEY (`md5sum`),
  ADD KEY `searchterm` (`searchterm`(191));

--
-- Indexes for table `hde5p_finder_taxonomy`
--
ALTER TABLE `hde5p_finder_taxonomy`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_level` (`level`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`),
  ADD KEY `idx_parent_published` (`parent_id`,`state`,`access`);

--
-- Indexes for table `hde5p_finder_taxonomy_map`
--
ALTER TABLE `hde5p_finder_taxonomy_map`
  ADD PRIMARY KEY (`link_id`,`node_id`),
  ADD KEY `link_id` (`link_id`),
  ADD KEY `node_id` (`node_id`);

--
-- Indexes for table `hde5p_finder_terms`
--
ALTER TABLE `hde5p_finder_terms`
  ADD PRIMARY KEY (`term_id`),
  ADD UNIQUE KEY `idx_term_language` (`term`,`language`),
  ADD KEY `idx_stem` (`stem`),
  ADD KEY `idx_term_phrase` (`term`,`phrase`),
  ADD KEY `idx_stem_phrase` (`stem`,`phrase`),
  ADD KEY `idx_soundex_phrase` (`soundex`,`phrase`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_finder_terms_common`
--
ALTER TABLE `hde5p_finder_terms_common`
  ADD UNIQUE KEY `idx_term_language` (`term`,`language`),
  ADD KEY `idx_lang` (`language`);

--
-- Indexes for table `hde5p_finder_tokens`
--
ALTER TABLE `hde5p_finder_tokens`
  ADD KEY `idx_word` (`term`),
  ADD KEY `idx_stem` (`stem`),
  ADD KEY `idx_context` (`context`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_finder_tokens_aggregate`
--
ALTER TABLE `hde5p_finder_tokens_aggregate`
  ADD KEY `token` (`term`),
  ADD KEY `keyword_id` (`term_id`);

--
-- Indexes for table `hde5p_finder_types`
--
ALTER TABLE `hde5p_finder_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `title` (`title`);

--
-- Indexes for table `hde5p_history`
--
ALTER TABLE `hde5p_history`
  ADD PRIMARY KEY (`version_id`),
  ADD KEY `idx_ucm_item_id` (`item_id`),
  ADD KEY `idx_save_date` (`save_date`);

--
-- Indexes for table `hde5p_languages`
--
ALTER TABLE `hde5p_languages`
  ADD PRIMARY KEY (`lang_id`),
  ADD UNIQUE KEY `idx_sef` (`sef`),
  ADD UNIQUE KEY `idx_langcode` (`lang_code`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_ordering` (`ordering`);

--
-- Indexes for table `hde5p_mail_templates`
--
ALTER TABLE `hde5p_mail_templates`
  ADD PRIMARY KEY (`template_id`,`language`);

--
-- Indexes for table `hde5p_menu`
--
ALTER TABLE `hde5p_menu`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_client_id_parent_id_alias_language` (`client_id`,`parent_id`,`alias`(100),`language`),
  ADD KEY `idx_componentid` (`component_id`,`menutype`,`published`,`access`),
  ADD KEY `idx_menutype` (`menutype`),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_menu_types`
--
ALTER TABLE `hde5p_menu_types`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_menutype` (`menutype`);

--
-- Indexes for table `hde5p_messages`
--
ALTER TABLE `hde5p_messages`
  ADD PRIMARY KEY (`message_id`),
  ADD KEY `useridto_state` (`user_id_to`,`state`);

--
-- Indexes for table `hde5p_messages_cfg`
--
ALTER TABLE `hde5p_messages_cfg`
  ADD UNIQUE KEY `idx_user_var_name` (`user_id`,`cfg_name`);

--
-- Indexes for table `hde5p_modules`
--
ALTER TABLE `hde5p_modules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `published` (`published`,`access`),
  ADD KEY `newsfeeds` (`module`,`published`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_modules_menu`
--
ALTER TABLE `hde5p_modules_menu`
  ADD PRIMARY KEY (`moduleid`,`menuid`);

--
-- Indexes for table `hde5p_newsfeeds`
--
ALTER TABLE `hde5p_newsfeeds`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_state` (`published`),
  ADD KEY `idx_catid` (`catid`),
  ADD KEY `idx_createdby` (`created_by`),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_overrider`
--
ALTER TABLE `hde5p_overrider`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_postinstall_messages`
--
ALTER TABLE `hde5p_postinstall_messages`
  ADD PRIMARY KEY (`postinstall_message_id`);

--
-- Indexes for table `hde5p_privacy_consents`
--
ALTER TABLE `hde5p_privacy_consents`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `hde5p_privacy_requests`
--
ALTER TABLE `hde5p_privacy_requests`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_redirect_links`
--
ALTER TABLE `hde5p_redirect_links`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_old_url` (`old_url`(100)),
  ADD KEY `idx_link_modified` (`modified_date`);

--
-- Indexes for table `hde5p_scheduler_tasks`
--
ALTER TABLE `hde5p_scheduler_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_type` (`type`),
  ADD KEY `idx_state` (`state`),
  ADD KEY `idx_last_exit` (`last_exit_code`),
  ADD KEY `idx_next_exec` (`next_execution`),
  ADD KEY `idx_locked` (`locked`),
  ADD KEY `idx_priority` (`priority`),
  ADD KEY `idx_cli_exclusive` (`cli_exclusive`),
  ADD KEY `idx_checked_out` (`checked_out`);

--
-- Indexes for table `hde5p_schemas`
--
ALTER TABLE `hde5p_schemas`
  ADD PRIMARY KEY (`extension_id`,`version_id`);

--
-- Indexes for table `hde5p_session`
--
ALTER TABLE `hde5p_session`
  ADD PRIMARY KEY (`session_id`),
  ADD KEY `userid` (`userid`),
  ADD KEY `time` (`time`),
  ADD KEY `client_id_guest` (`client_id`,`guest`);

--
-- Indexes for table `hde5p_speasyimagegallery_albums`
--
ALTER TABLE `hde5p_speasyimagegallery_albums`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_speasyimagegallery_images`
--
ALTER TABLE `hde5p_speasyimagegallery_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_spmedia`
--
ALTER TABLE `hde5p_spmedia`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_sppagebuilder`
--
ALTER TABLE `hde5p_sppagebuilder`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_sppagebuilder_addonlist`
--
ALTER TABLE `hde5p_sppagebuilder_addonlist`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_sppagebuilder_addons`
--
ALTER TABLE `hde5p_sppagebuilder_addons`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_sppagebuilder_assets`
--
ALTER TABLE `hde5p_sppagebuilder_assets`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_sppagebuilder_integrations`
--
ALTER TABLE `hde5p_sppagebuilder_integrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_sppagebuilder_languages`
--
ALTER TABLE `hde5p_sppagebuilder_languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_sppagebuilder_sections`
--
ALTER TABLE `hde5p_sppagebuilder_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_spsimpleportfolio_items`
--
ALTER TABLE `hde5p_spsimpleportfolio_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_spsimpleportfolio_tags`
--
ALTER TABLE `hde5p_spsimpleportfolio_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `hde5p_tags`
--
ALTER TABLE `hde5p_tags`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tag_idx` (`published`,`access`),
  ADD KEY `idx_access` (`access`),
  ADD KEY `idx_checkout` (`checked_out`),
  ADD KEY `idx_path` (`path`(100)),
  ADD KEY `idx_left_right` (`lft`,`rgt`),
  ADD KEY `idx_alias` (`alias`(100)),
  ADD KEY `idx_language` (`language`);

--
-- Indexes for table `hde5p_template_overrides`
--
ALTER TABLE `hde5p_template_overrides`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_extension_id` (`extension_id`);

--
-- Indexes for table `hde5p_template_styles`
--
ALTER TABLE `hde5p_template_styles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_template` (`template`),
  ADD KEY `idx_client_id` (`client_id`),
  ADD KEY `idx_client_id_home` (`client_id`,`home`);

--
-- Indexes for table `hde5p_ucm_base`
--
ALTER TABLE `hde5p_ucm_base`
  ADD PRIMARY KEY (`ucm_id`),
  ADD KEY `idx_ucm_item_id` (`ucm_item_id`),
  ADD KEY `idx_ucm_type_id` (`ucm_type_id`),
  ADD KEY `idx_ucm_language_id` (`ucm_language_id`);

--
-- Indexes for table `hde5p_ucm_content`
--
ALTER TABLE `hde5p_ucm_content`
  ADD PRIMARY KEY (`core_content_id`),
  ADD KEY `tag_idx` (`core_state`,`core_access`),
  ADD KEY `idx_access` (`core_access`),
  ADD KEY `idx_alias` (`core_alias`(100)),
  ADD KEY `idx_language` (`core_language`),
  ADD KEY `idx_title` (`core_title`(100)),
  ADD KEY `idx_modified_time` (`core_modified_time`),
  ADD KEY `idx_created_time` (`core_created_time`),
  ADD KEY `idx_content_type` (`core_type_alias`(100)),
  ADD KEY `idx_core_modified_user_id` (`core_modified_user_id`),
  ADD KEY `idx_core_checked_out_user_id` (`core_checked_out_user_id`),
  ADD KEY `idx_core_created_user_id` (`core_created_user_id`),
  ADD KEY `idx_core_type_id` (`core_type_id`);

--
-- Indexes for table `hde5p_updates`
--
ALTER TABLE `hde5p_updates`
  ADD PRIMARY KEY (`update_id`);

--
-- Indexes for table `hde5p_update_sites`
--
ALTER TABLE `hde5p_update_sites`
  ADD PRIMARY KEY (`update_site_id`);

--
-- Indexes for table `hde5p_update_sites_extensions`
--
ALTER TABLE `hde5p_update_sites_extensions`
  ADD PRIMARY KEY (`update_site_id`,`extension_id`);

--
-- Indexes for table `hde5p_usergroups`
--
ALTER TABLE `hde5p_usergroups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_usergroup_parent_title_lookup` (`parent_id`,`title`),
  ADD KEY `idx_usergroup_title_lookup` (`title`),
  ADD KEY `idx_usergroup_adjacency_lookup` (`parent_id`),
  ADD KEY `idx_usergroup_nested_set_lookup` (`lft`,`rgt`) USING BTREE;

--
-- Indexes for table `hde5p_users`
--
ALTER TABLE `hde5p_users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_username` (`username`),
  ADD KEY `idx_name` (`name`(100)),
  ADD KEY `idx_block` (`block`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `hde5p_user_keys`
--
ALTER TABLE `hde5p_user_keys`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `series` (`series`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `hde5p_user_mfa`
--
ALTER TABLE `hde5p_user_mfa`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`);

--
-- Indexes for table `hde5p_user_notes`
--
ALTER TABLE `hde5p_user_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_user_id` (`user_id`),
  ADD KEY `idx_category_id` (`catid`);

--
-- Indexes for table `hde5p_user_profiles`
--
ALTER TABLE `hde5p_user_profiles`
  ADD UNIQUE KEY `idx_user_id_profile_key` (`user_id`,`profile_key`);

--
-- Indexes for table `hde5p_user_usergroup_map`
--
ALTER TABLE `hde5p_user_usergroup_map`
  ADD PRIMARY KEY (`user_id`,`group_id`);

--
-- Indexes for table `hde5p_viewlevels`
--
ALTER TABLE `hde5p_viewlevels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `idx_assetgroup_title_lookup` (`title`);

--
-- Indexes for table `hde5p_webauthn_credentials`
--
ALTER TABLE `hde5p_webauthn_credentials`
  ADD PRIMARY KEY (`id`(100)),
  ADD KEY `user_id` (`user_id`(100));

--
-- Indexes for table `hde5p_workflows`
--
ALTER TABLE `hde5p_workflows`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_extension` (`extension`),
  ADD KEY `idx_default` (`default`),
  ADD KEY `idx_created` (`created`),
  ADD KEY `idx_created_by` (`created_by`),
  ADD KEY `idx_modified` (`modified`),
  ADD KEY `idx_modified_by` (`modified_by`),
  ADD KEY `idx_checked_out` (`checked_out`);

--
-- Indexes for table `hde5p_workflow_associations`
--
ALTER TABLE `hde5p_workflow_associations`
  ADD PRIMARY KEY (`item_id`,`extension`),
  ADD KEY `idx_item_stage_extension` (`item_id`,`stage_id`,`extension`),
  ADD KEY `idx_item_id` (`item_id`),
  ADD KEY `idx_stage_id` (`stage_id`),
  ADD KEY `idx_extension` (`extension`);

--
-- Indexes for table `hde5p_workflow_stages`
--
ALTER TABLE `hde5p_workflow_stages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_workflow_id` (`workflow_id`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_default` (`default`);

--
-- Indexes for table `hde5p_workflow_transitions`
--
ALTER TABLE `hde5p_workflow_transitions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_title` (`title`(191)),
  ADD KEY `idx_asset_id` (`asset_id`),
  ADD KEY `idx_checked_out` (`checked_out`),
  ADD KEY `idx_from_stage_id` (`from_stage_id`),
  ADD KEY `idx_to_stage_id` (`to_stage_id`),
  ADD KEY `idx_workflow_id` (`workflow_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `hde5p_action_logs`
--
ALTER TABLE `hde5p_action_logs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=237;

--
-- AUTO_INCREMENT for table `hde5p_action_logs_extensions`
--
ALTER TABLE `hde5p_action_logs_extensions`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hde5p_action_log_config`
--
ALTER TABLE `hde5p_action_log_config`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `hde5p_assets`
--
ALTER TABLE `hde5p_assets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `hde5p_banners`
--
ALTER TABLE `hde5p_banners`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_banner_clients`
--
ALTER TABLE `hde5p_banner_clients`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_categories`
--
ALTER TABLE `hde5p_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `hde5p_contact_details`
--
ALTER TABLE `hde5p_contact_details`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_content`
--
ALTER TABLE `hde5p_content`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hde5p_content_types`
--
ALTER TABLE `hde5p_content_types`
  MODIFY `type_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10000;

--
-- AUTO_INCREMENT for table `hde5p_extensions`
--
ALTER TABLE `hde5p_extensions`
  MODIFY `extension_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `hde5p_fields`
--
ALTER TABLE `hde5p_fields`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_fields_groups`
--
ALTER TABLE `hde5p_fields_groups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_finder_filters`
--
ALTER TABLE `hde5p_finder_filters`
  MODIFY `filter_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_finder_links`
--
ALTER TABLE `hde5p_finder_links`
  MODIFY `link_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `hde5p_finder_taxonomy`
--
ALTER TABLE `hde5p_finder_taxonomy`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `hde5p_finder_terms`
--
ALTER TABLE `hde5p_finder_terms`
  MODIFY `term_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=286;

--
-- AUTO_INCREMENT for table `hde5p_finder_types`
--
ALTER TABLE `hde5p_finder_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hde5p_history`
--
ALTER TABLE `hde5p_history`
  MODIFY `version_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `hde5p_languages`
--
ALTER TABLE `hde5p_languages`
  MODIFY `lang_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hde5p_menu`
--
ALTER TABLE `hde5p_menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=122;

--
-- AUTO_INCREMENT for table `hde5p_menu_types`
--
ALTER TABLE `hde5p_menu_types`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hde5p_messages`
--
ALTER TABLE `hde5p_messages`
  MODIFY `message_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_modules`
--
ALTER TABLE `hde5p_modules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `hde5p_newsfeeds`
--
ALTER TABLE `hde5p_newsfeeds`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_overrider`
--
ALTER TABLE `hde5p_overrider`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'Primary Key';

--
-- AUTO_INCREMENT for table `hde5p_postinstall_messages`
--
ALTER TABLE `hde5p_postinstall_messages`
  MODIFY `postinstall_message_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `hde5p_privacy_consents`
--
ALTER TABLE `hde5p_privacy_consents`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_privacy_requests`
--
ALTER TABLE `hde5p_privacy_requests`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_redirect_links`
--
ALTER TABLE `hde5p_redirect_links`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_scheduler_tasks`
--
ALTER TABLE `hde5p_scheduler_tasks`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_speasyimagegallery_albums`
--
ALTER TABLE `hde5p_speasyimagegallery_albums`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_speasyimagegallery_images`
--
ALTER TABLE `hde5p_speasyimagegallery_images`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_spmedia`
--
ALTER TABLE `hde5p_spmedia`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_sppagebuilder`
--
ALTER TABLE `hde5p_sppagebuilder`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_sppagebuilder_addonlist`
--
ALTER TABLE `hde5p_sppagebuilder_addonlist`
  MODIFY `id` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_sppagebuilder_addons`
--
ALTER TABLE `hde5p_sppagebuilder_addons`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_sppagebuilder_assets`
--
ALTER TABLE `hde5p_sppagebuilder_assets`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_sppagebuilder_integrations`
--
ALTER TABLE `hde5p_sppagebuilder_integrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_sppagebuilder_languages`
--
ALTER TABLE `hde5p_sppagebuilder_languages`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_sppagebuilder_sections`
--
ALTER TABLE `hde5p_sppagebuilder_sections`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_spsimpleportfolio_items`
--
ALTER TABLE `hde5p_spsimpleportfolio_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hde5p_spsimpleportfolio_tags`
--
ALTER TABLE `hde5p_spsimpleportfolio_tags`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `hde5p_tags`
--
ALTER TABLE `hde5p_tags`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hde5p_template_overrides`
--
ALTER TABLE `hde5p_template_overrides`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_template_styles`
--
ALTER TABLE `hde5p_template_styles`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `hde5p_ucm_content`
--
ALTER TABLE `hde5p_ucm_content`
  MODIFY `core_content_id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_updates`
--
ALTER TABLE `hde5p_updates`
  MODIFY `update_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=264;

--
-- AUTO_INCREMENT for table `hde5p_update_sites`
--
ALTER TABLE `hde5p_update_sites`
  MODIFY `update_site_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hde5p_usergroups`
--
ALTER TABLE `hde5p_usergroups`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `hde5p_users`
--
ALTER TABLE `hde5p_users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `hde5p_user_keys`
--
ALTER TABLE `hde5p_user_keys`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_user_mfa`
--
ALTER TABLE `hde5p_user_mfa`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_user_notes`
--
ALTER TABLE `hde5p_user_notes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `hde5p_viewlevels`
--
ALTER TABLE `hde5p_viewlevels`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'Primary Key', AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `hde5p_workflows`
--
ALTER TABLE `hde5p_workflows`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hde5p_workflow_stages`
--
ALTER TABLE `hde5p_workflow_stages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `hde5p_workflow_transitions`
--
ALTER TABLE `hde5p_workflow_transitions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
