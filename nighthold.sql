/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : nighthold

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2021-03-13 10:41:52
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `categories`
-- ----------------------------
DROP TABLE IF EXISTS `categories`;
CREATE TABLE `categories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) unsigned DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `categories_slug_unique` (`slug`),
  KEY `categories_parent_id_foreign` (`parent_id`),
  CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of categories
-- ----------------------------
INSERT INTO `categories` VALUES ('1', null, '1', 'Новости', 'news', '2021-03-12 09:17:25', '2021-03-12 12:48:46');
INSERT INTO `categories` VALUES ('2', null, '1', 'Акция', 'action', '2021-03-12 09:17:25', '2021-03-12 12:49:03');

-- ----------------------------
-- Table structure for `data_rows`
-- ----------------------------
DROP TABLE IF EXISTS `data_rows`;
CREATE TABLE `data_rows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `data_type_id` int(10) unsigned NOT NULL,
  `field` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `required` tinyint(1) NOT NULL DEFAULT 0,
  `browse` tinyint(1) NOT NULL DEFAULT 1,
  `read` tinyint(1) NOT NULL DEFAULT 1,
  `edit` tinyint(1) NOT NULL DEFAULT 1,
  `add` tinyint(1) NOT NULL DEFAULT 1,
  `delete` tinyint(1) NOT NULL DEFAULT 1,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  PRIMARY KEY (`id`),
  KEY `data_rows_data_type_id_foreign` (`data_type_id`),
  CONSTRAINT `data_rows_data_type_id_foreign` FOREIGN KEY (`data_type_id`) REFERENCES `data_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_rows
-- ----------------------------
INSERT INTO `data_rows` VALUES ('1', '1', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('2', '1', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', null, '2');
INSERT INTO `data_rows` VALUES ('3', '1', 'email', 'text', 'Email', '1', '1', '1', '1', '1', '1', null, '3');
INSERT INTO `data_rows` VALUES ('4', '1', 'password', 'password', 'Password', '1', '0', '0', '1', '1', '0', null, '4');
INSERT INTO `data_rows` VALUES ('5', '1', 'remember_token', 'text', 'Remember Token', '0', '0', '0', '0', '0', '0', null, '5');
INSERT INTO `data_rows` VALUES ('6', '1', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '0', '0', '0', null, '6');
INSERT INTO `data_rows` VALUES ('7', '1', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '7');
INSERT INTO `data_rows` VALUES ('8', '1', 'avatar', 'image', 'Avatar', '0', '1', '1', '1', '1', '1', null, '8');
INSERT INTO `data_rows` VALUES ('9', '1', 'user_belongsto_role_relationship', 'relationship', 'Role', '0', '1', '1', '1', '1', '0', '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsTo\",\"column\":\"role_id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"roles\",\"pivot\":0}', '10');
INSERT INTO `data_rows` VALUES ('10', '1', 'user_belongstomany_role_relationship', 'relationship', 'Roles', '0', '1', '1', '1', '1', '0', '{\"model\":\"TCG\\\\Voyager\\\\Models\\\\Role\",\"table\":\"roles\",\"type\":\"belongsToMany\",\"column\":\"id\",\"key\":\"id\",\"label\":\"display_name\",\"pivot_table\":\"user_roles\",\"pivot\":\"1\",\"taggable\":\"0\"}', '11');
INSERT INTO `data_rows` VALUES ('11', '1', 'settings', 'hidden', 'Settings', '0', '0', '0', '0', '0', '0', null, '12');
INSERT INTO `data_rows` VALUES ('12', '2', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('13', '2', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', null, '2');
INSERT INTO `data_rows` VALUES ('14', '2', 'created_at', 'timestamp', 'Created At', '0', '0', '0', '0', '0', '0', null, '3');
INSERT INTO `data_rows` VALUES ('15', '2', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '4');
INSERT INTO `data_rows` VALUES ('16', '3', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('17', '3', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', null, '2');
INSERT INTO `data_rows` VALUES ('18', '3', 'created_at', 'timestamp', 'Created At', '0', '0', '0', '0', '0', '0', null, '3');
INSERT INTO `data_rows` VALUES ('19', '3', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '4');
INSERT INTO `data_rows` VALUES ('20', '3', 'display_name', 'text', 'Display Name', '1', '1', '1', '1', '1', '1', null, '5');
INSERT INTO `data_rows` VALUES ('21', '1', 'role_id', 'text', 'Role', '1', '1', '1', '1', '1', '1', null, '9');
INSERT INTO `data_rows` VALUES ('22', '4', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('23', '4', 'parent_id', 'select_dropdown', 'Parent', '0', '0', '1', '1', '1', '1', '{\"default\":\"\",\"null\":\"\",\"options\":{\"\":\"-- None --\"},\"relationship\":{\"key\":\"id\",\"label\":\"name\"}}', '2');
INSERT INTO `data_rows` VALUES ('24', '4', 'order', 'text', 'Order', '1', '1', '1', '1', '1', '1', '{\"default\":1}', '3');
INSERT INTO `data_rows` VALUES ('25', '4', 'name', 'text', 'Name', '1', '1', '1', '1', '1', '1', null, '4');
INSERT INTO `data_rows` VALUES ('26', '4', 'slug', 'text', 'Slug', '1', '1', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"name\"}}', '5');
INSERT INTO `data_rows` VALUES ('27', '4', 'created_at', 'timestamp', 'Created At', '0', '0', '1', '0', '0', '0', null, '6');
INSERT INTO `data_rows` VALUES ('28', '4', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '7');
INSERT INTO `data_rows` VALUES ('29', '5', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('30', '5', 'author_id', 'text', 'Author', '1', '0', '1', '1', '0', '1', null, '2');
INSERT INTO `data_rows` VALUES ('31', '5', 'category_id', 'text', 'Category', '1', '0', '1', '1', '1', '0', null, '3');
INSERT INTO `data_rows` VALUES ('32', '5', 'title', 'text', 'Title', '1', '1', '1', '1', '1', '1', null, '4');
INSERT INTO `data_rows` VALUES ('33', '5', 'excerpt', 'text_area', 'Excerpt', '1', '0', '1', '1', '1', '1', null, '5');
INSERT INTO `data_rows` VALUES ('34', '5', 'body', 'rich_text_box', 'Body', '1', '0', '1', '1', '1', '1', null, '6');
INSERT INTO `data_rows` VALUES ('35', '5', 'image', 'image', 'Post Image', '0', '1', '1', '1', '1', '1', '{\"resize\":{\"width\":\"1000\",\"height\":\"null\"},\"quality\":\"70%\",\"upsize\":true,\"thumbnails\":[{\"name\":\"medium\",\"scale\":\"50%\"},{\"name\":\"small\",\"scale\":\"25%\"},{\"name\":\"cropped\",\"crop\":{\"width\":\"300\",\"height\":\"250\"}}]}', '7');
INSERT INTO `data_rows` VALUES ('36', '5', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"title\",\"forceUpdate\":true},\"validation\":{\"rule\":\"unique:posts,slug\"}}', '8');
INSERT INTO `data_rows` VALUES ('37', '5', 'meta_description', 'text_area', 'Meta Description', '1', '0', '1', '1', '1', '1', null, '9');
INSERT INTO `data_rows` VALUES ('38', '5', 'meta_keywords', 'text_area', 'Meta Keywords', '1', '0', '1', '1', '1', '1', null, '10');
INSERT INTO `data_rows` VALUES ('39', '5', 'status', 'select_dropdown', 'Status', '1', '1', '1', '1', '1', '1', '{\"default\":\"DRAFT\",\"options\":{\"PUBLISHED\":\"published\",\"DRAFT\":\"draft\",\"PENDING\":\"pending\"}}', '11');
INSERT INTO `data_rows` VALUES ('40', '5', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '0', '0', '0', null, '12');
INSERT INTO `data_rows` VALUES ('41', '5', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', null, '13');
INSERT INTO `data_rows` VALUES ('42', '5', 'seo_title', 'text', 'SEO Title', '0', '1', '1', '1', '1', '1', null, '14');
INSERT INTO `data_rows` VALUES ('43', '5', 'featured', 'checkbox', 'Featured', '1', '1', '1', '1', '1', '1', null, '15');
INSERT INTO `data_rows` VALUES ('44', '6', 'id', 'number', 'ID', '1', '0', '0', '0', '0', '0', null, '1');
INSERT INTO `data_rows` VALUES ('45', '6', 'author_id', 'text', 'Author', '1', '0', '0', '0', '0', '0', null, '2');
INSERT INTO `data_rows` VALUES ('46', '6', 'title', 'text', 'Title', '1', '1', '1', '1', '1', '1', null, '3');
INSERT INTO `data_rows` VALUES ('47', '6', 'excerpt', 'text_area', 'Excerpt', '1', '0', '1', '1', '1', '1', null, '4');
INSERT INTO `data_rows` VALUES ('48', '6', 'body', 'rich_text_box', 'Body', '1', '0', '1', '1', '1', '1', null, '5');
INSERT INTO `data_rows` VALUES ('49', '6', 'slug', 'text', 'Slug', '1', '0', '1', '1', '1', '1', '{\"slugify\":{\"origin\":\"title\"},\"validation\":{\"rule\":\"unique:pages,slug\"}}', '6');
INSERT INTO `data_rows` VALUES ('50', '6', 'meta_description', 'text', 'Meta Description', '1', '0', '1', '1', '1', '1', null, '7');
INSERT INTO `data_rows` VALUES ('51', '6', 'meta_keywords', 'text', 'Meta Keywords', '1', '0', '1', '1', '1', '1', null, '8');
INSERT INTO `data_rows` VALUES ('52', '6', 'status', 'select_dropdown', 'Status', '1', '1', '1', '1', '1', '1', '{\"default\":\"INACTIVE\",\"options\":{\"INACTIVE\":\"INACTIVE\",\"ACTIVE\":\"ACTIVE\"}}', '9');
INSERT INTO `data_rows` VALUES ('53', '6', 'created_at', 'timestamp', 'Created At', '1', '1', '1', '0', '0', '0', null, '10');
INSERT INTO `data_rows` VALUES ('54', '6', 'updated_at', 'timestamp', 'Updated At', '1', '0', '0', '0', '0', '0', null, '11');
INSERT INTO `data_rows` VALUES ('55', '6', 'image', 'image', 'Page Image', '0', '1', '1', '1', '1', '1', null, '12');
INSERT INTO `data_rows` VALUES ('56', '8', 'id', 'text', 'Id', '1', '0', '0', '0', '0', '0', '{}', '1');
INSERT INTO `data_rows` VALUES ('57', '8', 'title', 'text', 'Title', '1', '1', '1', '1', '1', '1', '{}', '2');
INSERT INTO `data_rows` VALUES ('58', '8', 'body', 'text_area', 'Body', '1', '1', '1', '1', '1', '1', '{}', '3');
INSERT INTO `data_rows` VALUES ('59', '8', 'image', 'image', 'Image', '0', '1', '1', '1', '1', '1', '{}', '4');
INSERT INTO `data_rows` VALUES ('60', '8', 'created_at', 'timestamp', 'Created At', '0', '1', '1', '1', '0', '1', '{}', '5');
INSERT INTO `data_rows` VALUES ('61', '8', 'updated_at', 'timestamp', 'Updated At', '0', '0', '0', '0', '0', '0', '{}', '6');

-- ----------------------------
-- Table structure for `data_types`
-- ----------------------------
DROP TABLE IF EXISTS `data_types`;
CREATE TABLE `data_types` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_singular` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name_plural` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `model_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `policy_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `generate_permissions` tinyint(1) NOT NULL DEFAULT 0,
  `server_side` tinyint(4) NOT NULL DEFAULT 0,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `data_types_name_unique` (`name`),
  UNIQUE KEY `data_types_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of data_types
-- ----------------------------
INSERT INTO `data_types` VALUES ('1', 'users', 'users', 'User', 'Users', 'voyager-person', 'TCG\\Voyager\\Models\\User', 'TCG\\Voyager\\Policies\\UserPolicy', 'TCG\\Voyager\\Http\\Controllers\\VoyagerUserController', '', '1', '0', null, '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `data_types` VALUES ('2', 'menus', 'menus', 'Menu', 'Menus', 'voyager-list', 'TCG\\Voyager\\Models\\Menu', null, '', '', '1', '0', null, '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `data_types` VALUES ('3', 'roles', 'roles', 'Role', 'Roles', 'voyager-lock', 'TCG\\Voyager\\Models\\Role', null, 'TCG\\Voyager\\Http\\Controllers\\VoyagerRoleController', '', '1', '0', null, '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `data_types` VALUES ('4', 'categories', 'categories', 'Category', 'Categories', 'voyager-categories', 'TCG\\Voyager\\Models\\Category', null, '', '', '1', '0', null, '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `data_types` VALUES ('5', 'posts', 'posts', 'Post', 'Posts', 'voyager-news', 'TCG\\Voyager\\Models\\Post', 'TCG\\Voyager\\Policies\\PostPolicy', '', '', '1', '0', null, '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `data_types` VALUES ('6', 'pages', 'pages', 'Page', 'Pages', 'voyager-file-text', 'TCG\\Voyager\\Models\\Page', null, '', '', '1', '0', null, '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `data_types` VALUES ('8', 'hows', 'hows', 'How', 'Hows', null, 'App\\Models\\How', null, null, null, '1', '0', '{\"order_column\":null,\"order_display_column\":null,\"order_direction\":\"asc\",\"default_search_key\":null}', '2021-03-12 10:33:01', '2021-03-12 10:33:01');

-- ----------------------------
-- Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of failed_jobs
-- ----------------------------

-- ----------------------------
-- Table structure for `hows`
-- ----------------------------
DROP TABLE IF EXISTS `hows`;
CREATE TABLE `hows` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of hows
-- ----------------------------
INSERT INTO `hows` VALUES ('1', 'Работоспособность', 'Круглосуточная поддержка, обновления мира происходят еженедельно.', 'hows\\March2021\\xfmnDE4SYEjx9a6XXKxM.jpg', '2021-03-12 10:35:27', '2021-03-12 10:35:27');
INSERT INTO `hows` VALUES ('2', 'Комфортная игра', 'Сервер расположен в Москве, благодаря этому у нас всегда минимальный пинг.', 'hows\\March2021\\5NEsZDpTnBhMLDxYOcbO.jpg', '2021-03-12 10:35:57', '2021-03-12 10:35:57');
INSERT INTO `hows` VALUES ('3', 'Высокий онлайн', 'Найдите новых друзей или компанию для совместной игры на нашем сервере.', 'hows\\March2021\\WBT8QikTQo5KkaQs0HyR.jpg', '2021-03-12 10:36:26', '2021-03-12 10:36:26');
INSERT INTO `hows` VALUES ('4', 'Отсутствие доната', 'На нашем сервере нельзя приобрести предметы, которые повлияют на игровой процесс.', 'hows\\March2021\\2YmTBDtZzkYnE9DvnpKZ.jpg', '2021-03-12 10:36:46', '2021-03-12 10:36:46');

-- ----------------------------
-- Table structure for `menus`
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `menus_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES ('1', 'admin', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `menus` VALUES ('2', 'Меню сайта', '2021-03-12 14:09:12', '2021-03-12 14:09:12');

-- ----------------------------
-- Table structure for `menu_items`
-- ----------------------------
DROP TABLE IF EXISTS `menu_items`;
CREATE TABLE `menu_items` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `menu_id` int(10) unsigned DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `target` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '_self',
  `icon_class` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `order` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `route` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `menu_items_menu_id_foreign` (`menu_id`),
  CONSTRAINT `menu_items_menu_id_foreign` FOREIGN KEY (`menu_id`) REFERENCES `menus` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of menu_items
-- ----------------------------
INSERT INTO `menu_items` VALUES ('1', '1', 'Панель управления', '', '_self', 'voyager-boat', '#000000', null, '1', '2021-03-12 09:17:23', '2021-03-12 12:43:55', 'voyager.dashboard', 'null');
INSERT INTO `menu_items` VALUES ('2', '1', 'Медиатека', '', '_self', 'voyager-images', '#000000', null, '8', '2021-03-12 09:17:23', '2021-03-12 12:48:15', 'voyager.media.index', 'null');
INSERT INTO `menu_items` VALUES ('3', '1', 'Пользователи', '', '_self', 'voyager-person', '#000000', null, '6', '2021-03-12 09:17:23', '2021-03-12 12:48:15', 'voyager.users.index', 'null');
INSERT INTO `menu_items` VALUES ('4', '1', 'Роли', '', '_self', 'voyager-lock', '#000000', null, '7', '2021-03-12 09:17:23', '2021-03-12 12:48:15', 'voyager.roles.index', 'null');
INSERT INTO `menu_items` VALUES ('5', '1', 'Инструменты', '', '_self', 'voyager-tools', '#000000', null, '10', '2021-03-12 09:17:23', '2021-03-12 12:46:53', null, '');
INSERT INTO `menu_items` VALUES ('6', '1', 'Конструктор меню', '', '_self', 'voyager-list', '#000000', '5', '1', '2021-03-12 09:17:23', '2021-03-12 12:46:39', 'voyager.menus.index', 'null');
INSERT INTO `menu_items` VALUES ('7', '1', 'База данных', '', '_self', 'voyager-data', '#000000', '5', '2', '2021-03-12 09:17:23', '2021-03-12 12:46:39', 'voyager.database.index', 'null');
INSERT INTO `menu_items` VALUES ('8', '1', 'Compass', '', '_self', 'voyager-compass', null, '5', '3', '2021-03-12 09:17:23', '2021-03-12 12:46:39', 'voyager.compass.index', null);
INSERT INTO `menu_items` VALUES ('9', '1', 'BREAD', '', '_self', 'voyager-bread', null, '5', '4', '2021-03-12 09:17:23', '2021-03-12 12:46:39', 'voyager.bread.index', null);
INSERT INTO `menu_items` VALUES ('10', '1', 'Настройки', '', '_self', 'voyager-settings', '#000000', null, '5', '2021-03-12 09:17:23', '2021-03-12 12:48:15', 'voyager.settings.index', 'null');
INSERT INTO `menu_items` VALUES ('11', '1', 'Категории(новости)', '', '_self', 'voyager-categories', '#000000', null, '3', '2021-03-12 09:17:25', '2021-03-12 12:48:15', 'voyager.categories.index', 'null');
INSERT INTO `menu_items` VALUES ('12', '1', 'Новости', '', '_self', 'voyager-news', '#000000', null, '2', '2021-03-12 09:17:25', '2021-03-12 12:46:43', 'voyager.posts.index', 'null');
INSERT INTO `menu_items` VALUES ('13', '1', 'Страницы', '', '_self', 'voyager-file-text', '#000000', null, '9', '2021-03-12 09:17:25', '2021-03-12 12:48:15', 'voyager.pages.index', 'null');
INSERT INTO `menu_items` VALUES ('14', '1', 'Hooks', '', '_self', 'voyager-hook', null, '5', '5', '2021-03-12 09:17:25', '2021-03-12 12:46:40', 'voyager.hooks', null);
INSERT INTO `menu_items` VALUES ('15', '1', 'Нижний блок', '', '_self', 'voyager-file-text', '#000000', null, '4', '2021-03-12 10:33:01', '2021-03-12 12:48:15', 'voyager.hows.index', 'null');
INSERT INTO `menu_items` VALUES ('16', '2', 'ГЛАВНАЯ', '/', '_self', null, '#000000', null, '1', '2021-03-12 14:09:39', '2021-03-12 14:12:27', null, '');
INSERT INTO `menu_items` VALUES ('17', '2', 'КАК НАЧАТЬ ИГРАТЬ', '/', '_self', null, '#000000', null, '2', '2021-03-12 14:11:13', '2021-03-12 14:12:37', null, '');
INSERT INTO `menu_items` VALUES ('18', '2', 'ФОРУМ', '/', '_self', null, '#000000', null, '3', '2021-03-12 14:11:39', '2021-03-12 14:12:37', null, '');
INSERT INTO `menu_items` VALUES ('19', '2', 'ЛАДДЕР', '/', '_self', null, '#000000', null, '4', '2021-03-12 14:11:49', '2021-03-12 14:12:37', null, '');
INSERT INTO `menu_items` VALUES ('20', '2', 'ПОДДЕРЖКА', '/', '_self', null, '#000000', null, '5', '2021-03-12 14:11:58', '2021-03-12 14:12:37', null, '');

-- ----------------------------
-- Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES ('2', '2014_10_12_100000_create_password_resets_table', '1');
INSERT INTO `migrations` VALUES ('3', '2019_08_19_000000_create_failed_jobs_table', '1');
INSERT INTO `migrations` VALUES ('5', '2014_10_12_000000_create_users_table', '2');
INSERT INTO `migrations` VALUES ('6', '2016_01_01_000000_add_voyager_user_fields', '3');
INSERT INTO `migrations` VALUES ('7', '2016_01_01_000000_create_data_types_table', '3');
INSERT INTO `migrations` VALUES ('8', '2016_05_19_173453_create_menu_table', '3');
INSERT INTO `migrations` VALUES ('9', '2016_10_21_190000_create_roles_table', '3');
INSERT INTO `migrations` VALUES ('10', '2016_10_21_190000_create_settings_table', '3');
INSERT INTO `migrations` VALUES ('11', '2016_11_30_135954_create_permission_table', '3');
INSERT INTO `migrations` VALUES ('12', '2016_11_30_141208_create_permission_role_table', '3');
INSERT INTO `migrations` VALUES ('13', '2016_12_26_201236_data_types__add__server_side', '3');
INSERT INTO `migrations` VALUES ('14', '2017_01_13_000000_add_route_to_menu_items_table', '3');
INSERT INTO `migrations` VALUES ('15', '2017_01_14_005015_create_translations_table', '3');
INSERT INTO `migrations` VALUES ('16', '2017_01_15_000000_make_table_name_nullable_in_permissions_table', '3');
INSERT INTO `migrations` VALUES ('17', '2017_03_06_000000_add_controller_to_data_types_table', '3');
INSERT INTO `migrations` VALUES ('18', '2017_04_21_000000_add_order_to_data_rows_table', '3');
INSERT INTO `migrations` VALUES ('19', '2017_07_05_210000_add_policyname_to_data_types_table', '3');
INSERT INTO `migrations` VALUES ('20', '2017_08_05_000000_add_group_to_settings_table', '3');
INSERT INTO `migrations` VALUES ('21', '2017_11_26_013050_add_user_role_relationship', '3');
INSERT INTO `migrations` VALUES ('22', '2017_11_26_015000_create_user_roles_table', '3');
INSERT INTO `migrations` VALUES ('23', '2018_03_11_000000_add_user_settings', '3');
INSERT INTO `migrations` VALUES ('24', '2018_03_14_000000_add_details_to_data_types_table', '3');
INSERT INTO `migrations` VALUES ('25', '2018_03_16_000000_make_settings_value_nullable', '3');
INSERT INTO `migrations` VALUES ('26', '2016_01_01_000000_create_pages_table', '4');
INSERT INTO `migrations` VALUES ('27', '2016_01_01_000000_create_posts_table', '4');
INSERT INTO `migrations` VALUES ('28', '2016_02_15_204651_create_categories_table', '4');
INSERT INTO `migrations` VALUES ('29', '2017_04_11_000000_alter_post_nullable_fields_table', '4');
INSERT INTO `migrations` VALUES ('30', '2021_03_12_101145_create_hows_table', '5');

-- ----------------------------
-- Table structure for `pages`
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('ACTIVE','INACTIVE') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'INACTIVE',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `pages_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of pages
-- ----------------------------
INSERT INTO `pages` VALUES ('1', '0', 'Hello World', 'Hang the jib grog grog blossom grapple dance the hempen jig gangway pressgang bilge rat to go on account lugger. Nelsons folly gabion line draught scallywag fire ship gaff fluke fathom case shot. Sea Legs bilge rat sloop matey gabion long clothes run a shot across the bow Gold Road cog league.', '<p>Hello World. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', 'pages/page1.jpg', 'hello-world', 'Yar Meta Description', 'Keyword1, Keyword2', 'ACTIVE', '2021-03-12 09:17:25', '2021-03-12 09:17:25');

-- ----------------------------
-- Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of password_resets
-- ----------------------------

-- ----------------------------
-- Table structure for `permissions`
-- ----------------------------
DROP TABLE IF EXISTS `permissions`;
CREATE TABLE `permissions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `permissions_key_index` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permissions
-- ----------------------------
INSERT INTO `permissions` VALUES ('1', 'browse_admin', null, '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('2', 'browse_bread', null, '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('3', 'browse_database', null, '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('4', 'browse_media', null, '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('5', 'browse_compass', null, '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('6', 'browse_menus', 'menus', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('7', 'read_menus', 'menus', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('8', 'edit_menus', 'menus', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('9', 'add_menus', 'menus', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('10', 'delete_menus', 'menus', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('11', 'browse_roles', 'roles', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('12', 'read_roles', 'roles', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('13', 'edit_roles', 'roles', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('14', 'add_roles', 'roles', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('15', 'delete_roles', 'roles', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('16', 'browse_users', 'users', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('17', 'read_users', 'users', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('18', 'edit_users', 'users', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('19', 'add_users', 'users', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('20', 'delete_users', 'users', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('21', 'browse_settings', 'settings', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('22', 'read_settings', 'settings', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('23', 'edit_settings', 'settings', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('24', 'add_settings', 'settings', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('25', 'delete_settings', 'settings', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `permissions` VALUES ('26', 'browse_categories', 'categories', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('27', 'read_categories', 'categories', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('28', 'edit_categories', 'categories', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('29', 'add_categories', 'categories', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('30', 'delete_categories', 'categories', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('31', 'browse_posts', 'posts', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('32', 'read_posts', 'posts', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('33', 'edit_posts', 'posts', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('34', 'add_posts', 'posts', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('35', 'delete_posts', 'posts', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('36', 'browse_pages', 'pages', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('37', 'read_pages', 'pages', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('38', 'edit_pages', 'pages', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('39', 'add_pages', 'pages', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('40', 'delete_pages', 'pages', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('41', 'browse_hooks', null, '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `permissions` VALUES ('42', 'browse_hows', 'hows', '2021-03-12 10:33:01', '2021-03-12 10:33:01');
INSERT INTO `permissions` VALUES ('43', 'read_hows', 'hows', '2021-03-12 10:33:01', '2021-03-12 10:33:01');
INSERT INTO `permissions` VALUES ('44', 'edit_hows', 'hows', '2021-03-12 10:33:01', '2021-03-12 10:33:01');
INSERT INTO `permissions` VALUES ('45', 'add_hows', 'hows', '2021-03-12 10:33:01', '2021-03-12 10:33:01');
INSERT INTO `permissions` VALUES ('46', 'delete_hows', 'hows', '2021-03-12 10:33:01', '2021-03-12 10:33:01');

-- ----------------------------
-- Table structure for `permission_role`
-- ----------------------------
DROP TABLE IF EXISTS `permission_role`;
CREATE TABLE `permission_role` (
  `permission_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`permission_id`,`role_id`),
  KEY `permission_role_permission_id_index` (`permission_id`),
  KEY `permission_role_role_id_index` (`role_id`),
  CONSTRAINT `permission_role_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  CONSTRAINT `permission_role_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of permission_role
-- ----------------------------
INSERT INTO `permission_role` VALUES ('1', '1');
INSERT INTO `permission_role` VALUES ('2', '1');
INSERT INTO `permission_role` VALUES ('3', '1');
INSERT INTO `permission_role` VALUES ('4', '1');
INSERT INTO `permission_role` VALUES ('5', '1');
INSERT INTO `permission_role` VALUES ('6', '1');
INSERT INTO `permission_role` VALUES ('7', '1');
INSERT INTO `permission_role` VALUES ('8', '1');
INSERT INTO `permission_role` VALUES ('9', '1');
INSERT INTO `permission_role` VALUES ('10', '1');
INSERT INTO `permission_role` VALUES ('11', '1');
INSERT INTO `permission_role` VALUES ('12', '1');
INSERT INTO `permission_role` VALUES ('13', '1');
INSERT INTO `permission_role` VALUES ('14', '1');
INSERT INTO `permission_role` VALUES ('15', '1');
INSERT INTO `permission_role` VALUES ('16', '1');
INSERT INTO `permission_role` VALUES ('17', '1');
INSERT INTO `permission_role` VALUES ('18', '1');
INSERT INTO `permission_role` VALUES ('19', '1');
INSERT INTO `permission_role` VALUES ('20', '1');
INSERT INTO `permission_role` VALUES ('21', '1');
INSERT INTO `permission_role` VALUES ('22', '1');
INSERT INTO `permission_role` VALUES ('23', '1');
INSERT INTO `permission_role` VALUES ('24', '1');
INSERT INTO `permission_role` VALUES ('25', '1');
INSERT INTO `permission_role` VALUES ('26', '1');
INSERT INTO `permission_role` VALUES ('27', '1');
INSERT INTO `permission_role` VALUES ('28', '1');
INSERT INTO `permission_role` VALUES ('29', '1');
INSERT INTO `permission_role` VALUES ('30', '1');
INSERT INTO `permission_role` VALUES ('31', '1');
INSERT INTO `permission_role` VALUES ('32', '1');
INSERT INTO `permission_role` VALUES ('33', '1');
INSERT INTO `permission_role` VALUES ('34', '1');
INSERT INTO `permission_role` VALUES ('35', '1');
INSERT INTO `permission_role` VALUES ('36', '1');
INSERT INTO `permission_role` VALUES ('37', '1');
INSERT INTO `permission_role` VALUES ('38', '1');
INSERT INTO `permission_role` VALUES ('39', '1');
INSERT INTO `permission_role` VALUES ('40', '1');
INSERT INTO `permission_role` VALUES ('42', '1');
INSERT INTO `permission_role` VALUES ('43', '1');
INSERT INTO `permission_role` VALUES ('44', '1');
INSERT INTO `permission_role` VALUES ('45', '1');
INSERT INTO `permission_role` VALUES ('46', '1');

-- ----------------------------
-- Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `posts`;
CREATE TABLE `posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `author_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `seo_title` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `excerpt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `body` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `meta_description` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `meta_keywords` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` enum('PUBLISHED','DRAFT','PENDING') COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DRAFT',
  `featured` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `posts_slug_unique` (`slug`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of posts
-- ----------------------------
INSERT INTO `posts` VALUES ('1', '2', '2', 'СЕРВЕР НА СТАДИИ РАЗРАБОТКИ', null, 'This is the excerpt for the Lorem Ipsum Post', '<p>Сервер находится на стадии разработки. Следите за новостями в нашей группе Вконтакте.</p>', 'posts/March2021/hZBlrRbHbhoPRgUBLj9F.jpg', 'server-na-stadii-razrabotki', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', '0', '2021-03-12 09:17:25', '2021-03-12 12:42:20');
INSERT INTO `posts` VALUES ('2', '2', '2', 'ГОЛОСОВАНИЕ ЗА СЕРВЕР', null, 'This is the excerpt for the sample Post', '<p>Голосуйте за наш сервер в личном кабинете и получайте за это награды.</p>', 'posts\\March2021\\GUIAwEPVXyLLxeNtqSn4.jpg', 'golosovanie-za-server', 'Meta Description for sample post', 'keyword1, keyword2, keyword3', 'PUBLISHED', '0', '2021-03-12 09:17:25', '2021-03-12 12:49:19');
INSERT INTO `posts` VALUES ('3', '2', '1', 'ПОИСК ТЕСТЕРОВ', null, 'This is the excerpt for the latest post', '<p>В связи с разработкой проекта мы ищем активных игроков, готовых проверять работоспособность нашего контента и поиска недоработок для их исправления.</p>', 'posts\\March2021\\Hc9qB5UksvQC5ZsLxiy7.jpg', 'poisk-testerov', 'This is the meta description', 'keyword1, keyword2, keyword3', 'PUBLISHED', '0', '2021-03-12 09:17:25', '2021-03-12 10:10:40');

-- ----------------------------
-- Table structure for `roles`
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `roles_name_unique` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES ('1', 'admin', 'Administrator', '2021-03-12 09:17:23', '2021-03-12 09:17:23');
INSERT INTO `roles` VALUES ('2', 'user', 'Normal User', '2021-03-12 09:17:23', '2021-03-12 09:17:23');

-- ----------------------------
-- Table structure for `settings`
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `display_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int(11) NOT NULL DEFAULT 1,
  `group` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `settings_key_unique` (`key`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('1', 'site.title', 'Site Title', 'the NightHold', '', 'text', '1', 'Site');
INSERT INTO `settings` VALUES ('2', 'site.description', 'Site Description', 'Бесплатный игровой сервер World of Warcraft', '', 'text', '2', 'Site');
INSERT INTO `settings` VALUES ('3', 'site.logo', 'Site Logo', 'settings/March2021/TTJMNJJqFULYH6igYTgy.png', '', 'image', '3', 'Site');
INSERT INTO `settings` VALUES ('4', 'site.google_analytics_tracking_id', 'Google Analytics Tracking ID', null, '', 'text', '4', 'Site');
INSERT INTO `settings` VALUES ('5', 'admin.bg_image', 'Admin Background Image', '', '', 'image', '5', 'Admin');
INSERT INTO `settings` VALUES ('6', 'admin.title', 'Admin Title', 'NightHold Admin', '', 'text', '1', 'Admin');
INSERT INTO `settings` VALUES ('7', 'admin.description', 'Admin Description', 'Welcome to Voyager. The Missing Admin for Laravel', '', 'text', '2', 'Admin');
INSERT INTO `settings` VALUES ('8', 'admin.loader', 'Admin Loader', '', '', 'image', '3', 'Admin');
INSERT INTO `settings` VALUES ('9', 'admin.icon_image', 'Admin Icon Image', '', '', 'image', '4', 'Admin');
INSERT INTO `settings` VALUES ('10', 'admin.google_analytics_client_id', 'Google Analytics Client ID (used for admin dashboard)', null, '', 'text', '1', 'Admin');

-- ----------------------------
-- Table structure for `translations`
-- ----------------------------
DROP TABLE IF EXISTS `translations`;
CREATE TABLE `translations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `column_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `foreign_key` int(10) unsigned NOT NULL,
  `locale` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `translations_table_name_column_name_foreign_key_locale_unique` (`table_name`,`column_name`,`foreign_key`,`locale`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of translations
-- ----------------------------
INSERT INTO `translations` VALUES ('1', 'data_types', 'display_name_singular', '5', 'pt', 'Post', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('2', 'data_types', 'display_name_singular', '6', 'pt', 'Página', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('3', 'data_types', 'display_name_singular', '1', 'pt', 'Utilizador', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('4', 'data_types', 'display_name_singular', '4', 'pt', 'Categoria', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('5', 'data_types', 'display_name_singular', '2', 'pt', 'Menu', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('6', 'data_types', 'display_name_singular', '3', 'pt', 'Função', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('7', 'data_types', 'display_name_plural', '5', 'pt', 'Posts', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('8', 'data_types', 'display_name_plural', '6', 'pt', 'Páginas', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('9', 'data_types', 'display_name_plural', '1', 'pt', 'Utilizadores', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('10', 'data_types', 'display_name_plural', '4', 'pt', 'Categorias', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('11', 'data_types', 'display_name_plural', '2', 'pt', 'Menus', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('12', 'data_types', 'display_name_plural', '3', 'pt', 'Funções', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('13', 'categories', 'slug', '1', 'pt', 'categoria-1', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('14', 'categories', 'name', '1', 'pt', 'Categoria 1', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('15', 'categories', 'slug', '2', 'pt', 'categoria-2', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('16', 'categories', 'name', '2', 'pt', 'Categoria 2', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('17', 'pages', 'title', '1', 'pt', 'Olá Mundo', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('18', 'pages', 'slug', '1', 'pt', 'ola-mundo', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('19', 'pages', 'body', '1', 'pt', '<p>Olá Mundo. Scallywag grog swab Cat o\'nine tails scuttle rigging hardtack cable nipper Yellow Jack. Handsomely spirits knave lad killick landlubber or just lubber deadlights chantey pinnace crack Jennys tea cup. Provost long clothes black spot Yellow Jack bilged on her anchor league lateen sail case shot lee tackle.</p>\r\n<p>Ballast spirits fluke topmast me quarterdeck schooner landlubber or just lubber gabion belaying pin. Pinnace stern galleon starboard warp carouser to go on account dance the hempen jig jolly boat measured fer yer chains. Man-of-war fire in the hole nipperkin handsomely doubloon barkadeer Brethren of the Coast gibbet driver squiffy.</p>', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('20', 'menu_items', 'title', '1', 'pt', 'Painel de Controle', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('21', 'menu_items', 'title', '2', 'pt', 'Media', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('22', 'menu_items', 'title', '12', 'pt', 'Publicações', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('23', 'menu_items', 'title', '3', 'pt', 'Utilizadores', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('24', 'menu_items', 'title', '11', 'pt', 'Categorias', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('25', 'menu_items', 'title', '13', 'pt', 'Páginas', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('26', 'menu_items', 'title', '4', 'pt', 'Funções', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('27', 'menu_items', 'title', '5', 'pt', 'Ferramentas', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('28', 'menu_items', 'title', '6', 'pt', 'Menus', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('29', 'menu_items', 'title', '7', 'pt', 'Base de dados', '2021-03-12 09:17:25', '2021-03-12 09:17:25');
INSERT INTO `translations` VALUES ('30', 'menu_items', 'title', '10', 'pt', 'Configurações', '2021-03-12 09:17:25', '2021-03-12 09:17:25');

-- ----------------------------
-- Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `avatar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT 'users/default.png',
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ref` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `settings` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`),
  KEY `users_role_id_foreign` (`role_id`),
  CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES ('2', '1', 'Jenya', 'emudarisov@outlook.com', 'users/default.png', null, '$2y$10$L93VBXyoKs6ozXPo..tpoOjBzA1wLRyd78AwJvx5BOyA8sUMV8CRO', '', 'AlXgkoU8VVv3DG91vy4EZeffqtyAiTxCEE9CQwMFCNc1FvJFvjJBMS6keYHw', '{\"locale\":\"ru\"}', '2021-03-12 08:22:54', '2021-03-12 09:18:29');
INSERT INTO `users` VALUES ('5', '1', 'test', 'test@mail.ru', 'users/default.png', null, '$2y$10$sWQS1xVaylpGsvqikJYLneGVaY8A/cEYHm2NiPiNZo1N.YE1thpkC', '', 'oIEOof5aaVWWzofwmhUh9thZh7xvJ2QBFhCs0tV4AwXGtfNRAVUBQnnAkkz6', null, '2021-03-12 12:57:37', '2021-03-12 12:57:37');

-- ----------------------------
-- Table structure for `user_roles`
-- ----------------------------
DROP TABLE IF EXISTS `user_roles`;
CREATE TABLE `user_roles` (
  `user_id` bigint(20) unsigned NOT NULL,
  `role_id` bigint(20) unsigned NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`),
  KEY `user_roles_user_id_index` (`user_id`),
  KEY `user_roles_role_id_index` (`role_id`),
  CONSTRAINT `user_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE,
  CONSTRAINT `user_roles_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
-- Records of user_roles
-- ----------------------------
