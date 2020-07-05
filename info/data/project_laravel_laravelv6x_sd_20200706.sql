/*
 Navicat Premium Data Transfer

 Source Server         : docker_mysql_127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80018
 Source Host           : 127.0.0.1
 Source Database       : project_laravel_laravelv6x

 Target Server Type    : MySQL
 Target Server Version : 80018
 File Encoding         : utf-8

 Date: 07/06/2020 00:16:00 AM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `cache`
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `expiration` int(11) NOT NULL,
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `demo_post_comments`
-- ----------------------------
DROP TABLE IF EXISTS `demo_post_comments`;
CREATE TABLE `demo_post_comments` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `comment_txt` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `demo_post_comments`
-- ----------------------------
BEGIN;
INSERT INTO `demo_post_comments` VALUES ('1', '1', '文章(1)评论1', '1591800908', '1591800908'), ('2', '2', '文章(2)评论1', '1591800908', '1591800908'), ('3', '3', '文章(3)评论1', '1591800908', '1591800908'), ('4', '4', '文章(4)评论1', '1591800908', '1591800908'), ('5', '5', '文章(5)评论1', '1591800908', '1591800908'), ('6', '6', '文章(6)评论1', '1591800908', '1591800908'), ('7', '7', '文章(7)评论1', '1591800908', '1591800908'), ('8', '8', '文章(8)评论1', '1591800908', '1591800908'), ('9', '9', '文章(9)评论1', '1591800908', '1591800908'), ('10', '10', '文章(10)评论1', '1591800908', '1591800908'), ('11', '1', '文章(1)评论2', '1591800928', '1591800928'), ('12', '2', '文章(2)评论2', '1591800928', '1591800928'), ('13', '3', '文章(3)评论2', '1591800928', '1591800928'), ('14', '4', '文章(4)评论2', '1591800928', '1591800928'), ('15', '5', '文章(5)评论2', '1591800928', '1591800928'), ('16', '6', '文章(6)评论2', '1591800928', '1591800928'), ('17', '7', '文章(7)评论2', '1591800928', '1591800928'), ('18', '8', '文章(8)评论2', '1591800928', '1591800928'), ('19', '9', '文章(9)评论2', '1591800928', '1591800928'), ('20', '10', '文章(10)评论2', '1591800928', '1591800928');
COMMIT;

-- ----------------------------
--  Table structure for `demo_post_tags`
-- ----------------------------
DROP TABLE IF EXISTS `demo_post_tags`;
CREATE TABLE `demo_post_tags` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '标签ID',
  `tag_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '评论',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `demo_post_tags`
-- ----------------------------
BEGIN;
INSERT INTO `demo_post_tags` VALUES ('1', '标签(1)', '1591801586', '1591801586'), ('2', '标签(2)', '1591801586', '1591801586'), ('3', '标签(3)', '1591801586', '1591801586'), ('4', '标签(4)', '1591801586', '1591801586'), ('5', '标签(5)', '1591801586', '1591801586'), ('6', '标签(6)', '1591801586', '1591801586'), ('7', '标签(7)', '1591801586', '1591801586'), ('8', '标签(8)', '1591801586', '1591801586'), ('9', '标签(9)', '1591801586', '1591801586'), ('10', '标签(10)', '1591801586', '1591801586');
COMMIT;

-- ----------------------------
--  Table structure for `demo_post_tags_pivots`
-- ----------------------------
DROP TABLE IF EXISTS `demo_post_tags_pivots`;
CREATE TABLE `demo_post_tags_pivots` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `tag_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '标签ID',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `demo_post_tags_pivots`
-- ----------------------------
BEGIN;
INSERT INTO `demo_post_tags_pivots` VALUES ('1', '1', '1', '1591802246', '1591802246'), ('2', '1', '2', '1591802246', '1591802246'), ('3', '2', '1', '1591802246', '1591802246'), ('4', '2', '2', '1591802246', '1591802246'), ('5', '3', '1', '1591802246', '1591802246'), ('6', '3', '2', '1591802246', '1591802246'), ('7', '4', '1', '1591802246', '1591802246'), ('8', '4', '2', '1591802246', '1591802246'), ('9', '5', '1', '1591802246', '1591802246'), ('10', '5', '2', '1591802246', '1591802246'), ('11', '6', '1', '1591802246', '1591802246'), ('12', '6', '2', '1591802246', '1591802246'), ('13', '7', '1', '1591802246', '1591802246'), ('14', '7', '2', '1591802246', '1591802246'), ('15', '8', '1', '1591802246', '1591802246'), ('16', '8', '2', '1591802246', '1591802246'), ('17', '9', '1', '1591802246', '1591802246'), ('18', '9', '2', '1591802246', '1591802246'), ('19', '10', '1', '1591802246', '1591802246'), ('20', '10', '2', '1591802246', '1591802246'), ('21', '1', '3', '1591818558', '1591818558'), ('22', '2', '3', '1591818558', '1591818558'), ('23', '3', '3', '1591818558', '1591818558'), ('24', '4', '3', '1591818558', '1591818558'), ('25', '5', '3', '1591818558', '1591818558'), ('26', '6', '3', '1591818558', '1591818558'), ('27', '7', '3', '1591818558', '1591818558'), ('28', '8', '3', '1591818559', '1591818559'), ('29', '9', '3', '1591818559', '1591818559'), ('30', '10', '3', '1591818559', '1591818559');
COMMIT;

-- ----------------------------
--  Table structure for `demo_posts`
-- ----------------------------
DROP TABLE IF EXISTS `demo_posts`;
CREATE TABLE `demo_posts` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '标题',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `demo_posts`
-- ----------------------------
BEGIN;
INSERT INTO `demo_posts` VALUES ('1', '文章标题(1)', '1591797405', '1591797405'), ('2', '文章标题(2)', '1591797405', '1591797405'), ('3', '文章标题(3)', '1591797405', '1591797405'), ('4', '文章标题(4)', '1591797405', '1591797405'), ('5', '文章标题(5)', '1591797405', '1591797405'), ('6', '文章标题(6)', '1591797405', '1591797405'), ('7', '文章标题(7)', '1591797405', '1591797405'), ('8', '文章标题(8)', '1591797405', '1591797405'), ('9', '文章标题(9)', '1591797405', '1591797405'), ('10', '文章标题(10)', '1591797405', '1591797405');
COMMIT;

-- ----------------------------
--  Table structure for `demo_posts_contents`
-- ----------------------------
DROP TABLE IF EXISTS `demo_posts_contents`;
CREATE TABLE `demo_posts_contents` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '内容ID',
  `post_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文章ID',
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '内容',
  `created_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间戳',
  `updated_at` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间戳',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `demo_posts_contents`
-- ----------------------------
BEGIN;
INSERT INTO `demo_posts_contents` VALUES ('1', '1', '内容(1)', '1591799453', '1591799453'), ('2', '2', '内容(2)', '1591799453', '1591799453'), ('3', '3', '内容(3)', '1591799453', '1591799453'), ('4', '4', '内容(4)', '1591799453', '1591799453'), ('5', '5', '内容(5)', '1591799453', '1591799453'), ('6', '6', '内容(6)', '1591799453', '1591799453'), ('7', '7', '内容(7)', '1591799453', '1591799453'), ('8', '8', '内容(8)', '1591799453', '1591799453'), ('9', '9', '内容(9)', '1591799453', '1591799453'), ('10', '10', '内容(10)', '1591799453', '1591799453');
COMMIT;

-- ----------------------------
--  Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `jobs`
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint(3) unsigned NOT NULL,
  `reserved_at` int(10) unsigned DEFAULT NULL,
  `available_at` int(10) unsigned NOT NULL,
  `created_at` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `jobs`
-- ----------------------------
BEGIN;
INSERT INTO `jobs` VALUES ('8', 'queue-event-listeners', '{\"displayName\":\"App\\\\Listeners\\\\DemoEventListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:31:\\\"App\\\\Listeners\\\\DemoEventListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:20:\\\"App\\\\Events\\\\DemoEvent\\\":2:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', '0', null, '1590332587', '1590332527'), ('9', 'queue-event-listeners', '{\"displayName\":\"App\\\\Listeners\\\\DemoEventListener\",\"job\":\"Illuminate\\\\Queue\\\\CallQueuedHandler@call\",\"maxTries\":null,\"delay\":null,\"timeout\":null,\"timeoutAt\":null,\"data\":{\"commandName\":\"Illuminate\\\\Events\\\\CallQueuedListener\",\"command\":\"O:36:\\\"Illuminate\\\\Events\\\\CallQueuedListener\\\":8:{s:5:\\\"class\\\";s:31:\\\"App\\\\Listeners\\\\DemoEventListener\\\";s:6:\\\"method\\\";s:6:\\\"handle\\\";s:4:\\\"data\\\";a:1:{i:0;O:20:\\\"App\\\\Events\\\\DemoEvent\\\":2:{s:4:\\\"user\\\";O:45:\\\"Illuminate\\\\Contracts\\\\Database\\\\ModelIdentifier\\\":4:{s:5:\\\"class\\\";s:8:\\\"App\\\\User\\\";s:2:\\\"id\\\";i:1;s:9:\\\"relations\\\";a:0:{}s:10:\\\"connection\\\";s:5:\\\"mysql\\\";}s:6:\\\"socket\\\";N;}}s:5:\\\"tries\\\";N;s:10:\\\"retryAfter\\\";N;s:9:\\\"timeoutAt\\\";N;s:7:\\\"timeout\\\";N;s:6:\\\"\\u0000*\\u0000job\\\";N;}\"}}', '0', null, '1590332942', '1590332882');
COMMIT;

-- ----------------------------
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1'), ('2', '2014_10_12_100000_create_password_resets_table', '1'), ('3', '2019_08_19_000000_create_failed_jobs_table', '1'), ('4', '2020_05_08_164410_create_sessions_table', '1'), ('5', '2016_06_01_000001_create_oauth_auth_codes_table', '2'), ('6', '2016_06_01_000002_create_oauth_access_tokens_table', '2'), ('7', '2016_06_01_000003_create_oauth_refresh_tokens_table', '2'), ('8', '2016_06_01_000004_create_oauth_clients_table', '2'), ('9', '2016_06_01_000005_create_oauth_personal_access_clients_table', '2'), ('10', '2020_05_20_085446_create_jobs_table', '3'), ('11', '2020_05_29_125948_create_cache_table', '4'), ('12', '2020_06_04_135811_create_notifications_table', '5'), ('13', '2018_08_08_100000_create_telescope_entries_table', '6');
COMMIT;

-- ----------------------------
--  Table structure for `notifications`
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `notifiable_id` bigint(20) unsigned NOT NULL,
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `read_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `notifications`
-- ----------------------------
BEGIN;
INSERT INTO `notifications` VALUES ('b3eb3bb6-a0f5-4f4e-b8db-18da90a8579b', 'App\\Notifications\\DemoNotification', 'App\\User', '1', '{\"id\":1,\"name\":\"cyb\",\"email\":\"1142733640@qq.com\",\"email_verified_at\":\"2020-05-15 13:21:26\",\"created_at\":\"2020-05-14 01:11:22\",\"updated_at\":\"2020-05-15 13:21:26\"}', null, '2020-06-04 20:04:12', '2020-06-04 20:04:12');
COMMIT;

-- ----------------------------
--  Table structure for `oauth_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `oauth_access_tokens`
-- ----------------------------
BEGIN;
INSERT INTO `oauth_access_tokens` VALUES ('14b10438af1e184106caaf0ff616b025623035a7aad799a3b130eb50bcbba300e67a7eafeae2b621', '1', '4', null, '[]', '0', '2020-05-19 04:27:40', '2020-05-19 04:27:40', '2020-06-03 04:27:40'), ('1cba791ba413eb63ce163f0aee5246f91b15a2033d3e8bc0887312eefc6fa7f8512d35b4c718be21', '2', '3', null, '[]', '0', '2020-05-20 00:58:41', '2020-05-20 00:58:41', '2020-06-04 00:58:41'), ('71c577350ab9ae5e7e2443888fb4c1cebd6bd31a7af58d84a5de507cd1455a1bc8f1378072f81401', '2', '4', null, '[]', '0', '2020-05-19 04:26:10', '2020-05-19 04:26:10', '2020-06-03 04:26:10'), ('d31a4e26c8b28400cc2bcfb36eacc93a99dd3666b453ef52821745d9443eaf484a9ebeb79fffef1c', '1', '3', null, '[]', '0', '2020-06-04 20:37:01', '2020-06-04 20:37:01', '2020-06-19 20:37:01');
COMMIT;

-- ----------------------------
--  Table structure for `oauth_auth_codes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned NOT NULL,
  `client_id` bigint(20) unsigned NOT NULL,
  `scopes` text COLLATE utf8mb4_unicode_ci,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `oauth_auth_codes`
-- ----------------------------
BEGIN;
INSERT INTO `oauth_auth_codes` VALUES ('aaf3fa9690c9634b9c8c2ebb108a2959e89d6b82e3bbce598fa7f8de9759b3f670dda491f07b8a4d', '1', '3', '[]', '1', '2020-06-04 20:46:33'), ('c3288f01ee32cb79ebd0f53285567e50a89de5128ad88902b04fe2ad85b1cd97c6ffe08c1515b5bb', '1', '3', '[]', '1', '2020-06-04 20:46:59'), ('c506b666d912e13cda9959857d494833f12b959dd09d4050083d917679fcaa93b95fd86f6cf4003f', '2', '3', '[]', '1', '2020-05-20 01:08:36');
COMMIT;

-- ----------------------------
--  Table structure for `oauth_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `personal_access_client` tinyint(1) NOT NULL,
  `password_client` tinyint(1) NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `oauth_clients`
-- ----------------------------
BEGIN;
INSERT INTO `oauth_clients` VALUES ('1', null, 'project-laravel-laravelv6x Personal Access Client', 'BTZfd5mvudwDrbOJyB7Cb06d2Z0XL5a9UJ8ghfE7', null, 'http://localhost', '1', '0', '0', '2020-05-18 01:21:58', '2020-05-18 01:21:58'), ('2', null, 'project-laravel-laravelv6x Password Grant Client', '7G9Y7gofuuZmkg0anNzKlqUgCkAGoOmE6nHj6KA5', 'users', 'http://localhost', '0', '1', '0', '2020-05-18 01:21:58', '2020-05-18 01:21:58'), ('3', '1', 'client-server', 'ehTwZ4IHrKaRQdiUGFncH76eRaRS7I4Bn1WWUnJb', null, 'http://project-laravel-laravelv6x.test/authcode/callback', '0', '0', '0', '2020-05-18 02:33:11', '2020-05-18 02:33:11'), ('4', null, 'client-password-grant', 'SUP5JgP0oHS4BBR7HEgDJH4IBpIxJTox417nMpJh', 'users', 'http://project-laravel-laravelv6x.test/authpassword/callback', '0', '1', '0', '2020-05-18 16:09:01', '2020-05-18 16:09:01');
COMMIT;

-- ----------------------------
--  Table structure for `oauth_personal_access_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `client_id` bigint(20) unsigned NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `oauth_personal_access_clients`
-- ----------------------------
BEGIN;
INSERT INTO `oauth_personal_access_clients` VALUES ('1', '1', '2020-05-18 01:21:58', '2020-05-18 01:21:58');
COMMIT;

-- ----------------------------
--  Table structure for `oauth_refresh_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `revoked` tinyint(1) NOT NULL,
  `expires_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `oauth_refresh_tokens`
-- ----------------------------
BEGIN;
INSERT INTO `oauth_refresh_tokens` VALUES ('45d894568dadb492f0c46087f53760e6ae5b63aedb4160a3ccc11dea0fb7d803217381b284f42d50', 'd31a4e26c8b28400cc2bcfb36eacc93a99dd3666b453ef52821745d9443eaf484a9ebeb79fffef1c', '0', '2020-07-04 20:37:01'), ('489093c129d050f3027ccf0406c3426a32c974a72e7718a6e2acbfb0a58257f0fb86987e1cb74795', '14b10438af1e184106caaf0ff616b025623035a7aad799a3b130eb50bcbba300e67a7eafeae2b621', '0', '2020-06-18 04:27:40'), ('48ebebe08bd94cef1c802f51520283870ec9a614fa87738d092c911766ede04bbf3b904f7c295852', '1cba791ba413eb63ce163f0aee5246f91b15a2033d3e8bc0887312eefc6fa7f8512d35b4c718be21', '0', '2020-06-19 00:58:41'), ('d6551a997f9786adfd3745e1bb6e312dc551eb83504ed75c70695fdd741cf908f667426b8fee84a0', '437595e8a83641aecafb15a1dca0286ca7e71d4838e2307b95af688f297cdbcad52ae83fefea13fe', '0', '2020-07-04 20:29:01'), ('e066eac7583c80868c574d1291e8b1a511bdb59d9fd70b2955b4dbd6563078e00aa2893ce55f3c78', 'ec90ae6ee48ed344a8a825ad717f7bb171ccba7dc9c84f53b09e0407a878abb87e0d88af69873ead', '0', '2020-07-04 20:33:54'), ('eef686e7fbccdeacf90cc693f9b7dcbf70fe0c34397631b46bd70cb6d8ac57f744dd7beaf739befa', '71c577350ab9ae5e7e2443888fb4c1cebd6bd31a7af58d84a5de507cd1455a1bc8f1378072f81401', '0', '2020-06-18 04:26:10');
COMMIT;

-- ----------------------------
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `password_resets`
-- ----------------------------
BEGIN;
INSERT INTO `password_resets` VALUES ('cyb_43@foxmail.com', '$2y$10$hjHokmwYsbStb6LnPnRF5uduDmVsBh4kTyO1ZkB/5sd520eZ5zS0G', '2020-05-14 20:19:21');
COMMIT;

-- ----------------------------
--  Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` bigint(20) unsigned DEFAULT NULL,
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_agent` text COLLATE utf8mb4_unicode_ci,
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_activity` int(11) NOT NULL,
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `telescope_entries`
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1',
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT NULL,
  PRIMARY KEY (`sequence`),
  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `telescope_entries`
-- ----------------------------
BEGIN;
INSERT INTO `telescope_entries` VALUES ('1', '90e0461b-2891-46e9-af43-5f336274bedd', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select * from information_schema.tables where table_schema = \'project_laravel_laravelv6x\' and table_name = \'migrations\' and table_type = \'BASE TABLE\'\",\"time\":\"38.36\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"ad7d07e5104cadcc6e9623dfc5fefdd8\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('2', '90e0461b-2c05-47c6-bea0-711db7bd35e6', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select `migration` from `migrations` order by `batch` asc, `migration` asc\",\"time\":\"6.61\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"ed08a59c7f0b8851f0fd2291ca94d5c7\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('3', '90e0461b-2daf-4efe-a852-add7e438f760', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"select max(`batch`) as aggregate from `migrations`\",\"time\":\"3.32\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"06e60d7b3d1a0c2de504de4e6f27735e\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('4', '90e0461b-630a-4436-b9b2-8eb5b0cf53f3', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries` (`sequence` bigint unsigned not null auto_increment primary key, `uuid` char(36) not null, `batch_id` char(36) not null, `family_hash` varchar(255) null, `should_display_on_index` tinyint(1) not null default \'1\', `type` varchar(20) not null, `content` longtext not null, `created_at` datetime null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"133.92\",\"slow\":true,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"d9429550f8856c1af1c89f24a6440cb5\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('5', '90e0461b-82ae-42e8-927e-0a27a7a32f4f', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add unique `telescope_entries_uuid_unique`(`uuid`)\",\"time\":\"80.63\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"9fb859ae1faff74c6b9e0b70dfd8eea9\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('6', '90e0461b-92c6-4b55-84a3-87977aab17ae', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_batch_id_index`(`batch_id`)\",\"time\":\"40.79\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"2b075509a9242d6e3f622536c5ccca07\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('7', '90e0461b-9ea6-46af-b280-dc4e9f45f585', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_family_hash_index`(`family_hash`)\",\"time\":\"30.03\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"3d25a2a244bd2028dfa0326d3dbf7f4c\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('8', '90e0461b-ad6d-481e-81e8-9152ee858763', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_created_at_index`(`created_at`)\",\"time\":\"37.47\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"7352e7f84460fb7ffc450e7ea4de9dc7\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('9', '90e0461b-ba22-4386-b979-0ef802ce5e6d', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries` add index `telescope_entries_type_should_display_on_index_index`(`type`, `should_display_on_index`)\",\"time\":\"32.14\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"7317a4cad2dfa1a5167548a6acd0b6a5\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:32'), ('10', '90e0461b-e305-41ac-8675-98d3b655b7e8', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_entries_tags` (`entry_uuid` char(36) not null, `tag` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"103.95\",\"slow\":true,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"5ed47d3cfcd3051674e3cb7b613f0fba\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:33'), ('11', '90e0461b-f71d-4c20-9590-911723cbcce5', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_entry_uuid_tag_index`(`entry_uuid`, `tag`)\",\"time\":\"50.61\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"d77cdf5585b51f60954d40e76786e20f\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:33'), ('12', '90e0461c-3016-49c8-8a7e-1ece55c558ab', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add index `telescope_entries_tags_tag_index`(`tag`)\",\"time\":\"145.36\",\"slow\":true,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"0bdb35d17e876d6225a7774a2c17647d\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:33'), ('13', '90e0461c-5865-4f9a-b5ea-b78299c9e3b1', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"alter table `telescope_entries_tags` add constraint `telescope_entries_tags_entry_uuid_foreign` foreign key (`entry_uuid`) references `telescope_entries` (`uuid`) on delete cascade\",\"time\":\"102.76\",\"slow\":true,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"662a818f80a3a9ba2570081fd7a6af2f\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:33'), ('14', '90e0461c-61fe-494b-82d5-125e0461b7e9', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"create table `telescope_monitoring` (`tag` varchar(255) not null) default character set utf8mb4 collate \'utf8mb4_unicode_ci\'\",\"time\":\"23.84\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"8cddf327ba1b3bd52637b409200a4c1f\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:33'), ('15', '90e0461c-657c-4274-ad0d-6eff090ef38a', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"insert into `migrations` (`migration`, `batch`) values (\'2018_08_08_100000_create_telescope_entries_table\', 6)\",\"time\":\"8.03\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/artisan\",\"line\":37,\"hash\":\"f2b8e8e4266db16aec6db940c643eb68\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:33'), ('16', '90e0461c-65d2-4212-89db-8fe962513ee0', '90e0461c-65ea-42ca-9336-20312764344e', null, '1', 'command', '{\"command\":\"migrate\",\"exit_code\":0,\"arguments\":{\"command\":\"migrate\"},\"options\":{\"database\":null,\"force\":false,\"path\":[],\"realpath\":false,\"pretend\":false,\"seed\":false,\"step\":false,\"help\":false,\"quiet\":false,\"verbose\":false,\"version\":false,\"ansi\":false,\"no-ansi\":false,\"no-interaction\":false,\"env\":null},\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-24 00:20:33'), ('17', '90e42a99-b71f-44e6-9659-d0bad295190f', '90e42a99-c10c-44b5-b930-abbf5525dd1b', null, '1', 'view', '{\"name\":\"welcome\",\"path\":\"\\/resources\\/views\\/welcome.blade.php\",\"data\":[],\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-25 22:46:56'), ('18', '90e42a99-bfa3-44ce-9476-3d0c0d121fe4', '90e42a99-c10c-44b5-b930-abbf5525dd1b', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"Closure\",\"middleware\":[\"web\"],\"headers\":{\"cookie\":\"io=uO_BYT1D7Hgf0tEEAAAK\",\"accept-language\":\"zh-CN,zh;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.61 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"connection\":\"keep-alive\",\"host\":\"project-laravel-laravelv6x.test\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":{\"_token\":\"9F2CtdKOPLLIsybeY1ZGQjawX97mRAXOlc98g5ux\",\"_previous\":{\"url\":\"http:\\/\\/project-laravel-laravelv6x.test\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/resources\\/views\\/welcome.blade.php\",\"data\":[]},\"duration\":326,\"memory\":4,\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-25 22:46:56'), ('19', '90e49c1e-fcf8-48b4-8054-2ee6ee5abf44', '90e49c1e-fe6b-4332-a314-36a806142b31', null, '1', 'view', '{\"name\":\"welcome\",\"path\":\"\\/resources\\/views\\/welcome.blade.php\",\"data\":[],\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-26 04:04:22'), ('20', '90e49c1e-fe1b-441b-8ffd-24e608c65674', '90e49c1e-fe6b-4332-a314-36a806142b31', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"Closure\",\"middleware\":[\"web\"],\"headers\":{\"cookie\":\"io=uO_BYT1D7Hgf0tEEAAAK\",\"accept-language\":\"zh-CN,zh;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.61 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"connection\":\"keep-alive\",\"host\":\"project-laravel-laravelv6x.test\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":{\"_token\":\"j5gHwQqS6LzPIwMnESgcjS5qCtHF5fKg7X9mSr2G\",\"_previous\":{\"url\":\"http:\\/\\/project-laravel-laravelv6x.test\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/resources\\/views\\/welcome.blade.php\",\"data\":[]},\"duration\":104,\"memory\":2,\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-26 04:04:22'), ('21', '90e79b1e-2f93-4020-9d21-1c71a942942a', '90e79b1e-3d07-4f04-8fd0-42092bf17b03', null, '1', 'view', '{\"name\":\"welcome\",\"path\":\"\\/resources\\/views\\/welcome.blade.php\",\"data\":[],\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-27 15:49:02'), ('22', '90e79b1e-3b89-4b86-932a-50b619368307', '90e79b1e-3d07-4f04-8fd0-42092bf17b03', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/\",\"method\":\"GET\",\"controller_action\":\"Closure\",\"middleware\":[\"web\"],\"headers\":{\"cookie\":\"io=uO_BYT1D7Hgf0tEEAAAK\",\"accept-language\":\"zh-CN,zh;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.61 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"connection\":\"keep-alive\",\"host\":\"project-laravel-laravelv6x.test\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":{\"_token\":\"JgR7kzAPz8Imv24EiZXgjbAXo0UhbOZ4UM0b8Wa3\",\"_previous\":{\"url\":\"http:\\/\\/project-laravel-laravelv6x.test\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":200,\"response\":{\"view\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/resources\\/views\\/welcome.blade.php\",\"data\":[]},\"duration\":210,\"memory\":2,\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-27 15:49:02'), ('23', '90e79b01-2dba-4e97-b3a0-0abc921d47b4', '90e79b2c-683f-4a16-84d3-fd50213b58fe', '172662cafa7e44f814eb46b4cf6b84b2', '1', 'exception', '{\"class\":\"Symfony\\\\Component\\\\Debug\\\\Exception\\\\FatalThrowableError\",\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/routes\\/web.php\",\"line\":38,\"message\":\"Class \'Swoft\\\\Co\' not found\",\"context\":null,\"trace\":[{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Route.php\",\"line\":205},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Route.php\",\"line\":179},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":681},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":130},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Middleware\\/SubstituteBindings.php\",\"line\":41},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/VerifyCsrfToken.php\",\"line\":76},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/View\\/Middleware\\/ShareErrorsFromSession.php\",\"line\":49},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Session\\/Middleware\\/StartSession.php\",\"line\":56},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/AddQueuedCookiesToResponse.php\",\"line\":37},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Cookie\\/Middleware\\/EncryptCookies.php\",\"line\":66},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":105},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":683},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":658},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":624},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Routing\\/Router.php\",\"line\":613},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":170},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":130},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/TransformsRequest.php\",\"line\":21},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/ValidatePostSize.php\",\"line\":27},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Middleware\\/CheckForMaintenanceMode.php\",\"line\":63},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/fideloper\\/proxy\\/src\\/TrustProxies.php\",\"line\":57},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":171},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Pipeline\\/Pipeline.php\",\"line\":105},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":145},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/vendor\\/laravel\\/framework\\/src\\/Illuminate\\/Foundation\\/Http\\/Kernel.php\",\"line\":110},{\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/public\\/index.php\",\"line\":58},{\"file\":\"\\/Users\\/cenyebao\\/.composer\\/vendor\\/laravel\\/valet\\/server.php\",\"line\":191}],\"line_preview\":{\"29\":\"});\",\"30\":\"\\/\\/\",\"31\":\"Route::get(\'\\/wr\', function () {\",\"32\":\"    return \'^2_3^ 2workroom3\\u5de5\\u4f5c\\u5ba4\';\",\"33\":\"});\",\"34\":\"\\/\\/\",\"35\":\"\\/\\/\\/\\/ \\u534f\\u7a0b\\u51fd\\u6570\",\"36\":\"Route::get(\'\\/co\', function () {\",\"37\":\"    \\/\\/\\/\\/ \\u521b\\u5efa\\u534f\\u7a0b_\\u65b9\\u5f0f\\u4e00\",\"38\":\"    Co::create(function() {\",\"39\":\"        dump(\'\\u521b\\u5efa\\u534f\\u7a0b\');\",\"40\":\"    });\",\"41\":\"\",\"42\":\"    dump(\'\\u534f\\u7a0b\\u51fd\\u6570\');\",\"43\":\"});\",\"44\":\"\\/\\/\",\"45\":\"\\/\\/\\/\\/ github\\u7b2c\\u4e09\\u65b9\\u6388\\u6743\\u767b\\u5f55\\u56de\\u8c03\",\"46\":\"Route::get(\'login\\/github\', \'Auth\\\\SocialiteController@gitHubRedirectToProvider\');\",\"47\":\"Route::get(\'login\\/github\\/callback\', \'Auth\\\\SocialiteController@gitHubHandleProviderCallback\');\",\"48\":\"\\/\\/\"},\"hostname\":\"macbookpro-ctc.local\",\"occurrences\":1}', '2020-06-27 15:48:43'), ('24', '90e79b01-32ca-43c4-9bf4-333a6ee90628', '90e79b2c-683f-4a16-84d3-fd50213b58fe', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"SELECT 1\",\"time\":\"2.52\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/app\\/Exceptions\\/Handler.php\",\"line\":59,\"hash\":\"b1698e52a0f16203489454196a0c6307\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-27 15:48:43'), ('25', '90e79b1b-a171-4c01-9234-dee17a67d8f3', '90e79b2c-683f-4a16-84d3-fd50213b58fe', null, '1', 'query', '{\"connection\":\"mysql\",\"bindings\":[],\"sql\":\"SELECT 1\",\"time\":\"4.08\",\"slow\":false,\"file\":\"\\/Users\\/cenyebao\\/web\\/project-laravel-laravelv6x\\/app\\/Exceptions\\/Handler.php\",\"line\":59,\"hash\":\"b1698e52a0f16203489454196a0c6307\",\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-27 15:49:01'), ('26', '90e79b2c-6237-4316-b2eb-5816aec7f4d4', '90e79b2c-683f-4a16-84d3-fd50213b58fe', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/co\",\"method\":\"GET\",\"controller_action\":\"Closure\",\"middleware\":[\"web\"],\"headers\":{\"cookie\":\"io=uO_BYT1D7Hgf0tEEAAAK\",\"accept-language\":\"zh-CN,zh;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"accept\":\"text\\/html,application\\/xhtml+xml,application\\/xml;q=0.9,image\\/webp,image\\/apng,*\\/*;q=0.8,application\\/signed-exchange;v=b3;q=0.9\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.61 Safari\\/537.36\",\"upgrade-insecure-requests\":\"1\",\"connection\":\"keep-alive\",\"host\":\"project-laravel-laravelv6x.test\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":{\"_token\":\"BoFg0tJ1SUscTSwl98d9nS9RYoB1hQcTRC3CBO07\",\"_previous\":{\"url\":\"http:\\/\\/project-laravel-laravelv6x.test\\/co\"},\"_flash\":{\"old\":[],\"new\":[]}},\"response_status\":500,\"response\":\"HTML Response\",\"duration\":28506,\"memory\":4,\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-27 15:49:12'), ('27', '90e79b2d-6f56-42eb-9c40-76457e3e7814', '90e79b2d-7094-4766-83f3-8d6f9023dcd3', null, '1', 'command', '{\"command\":\"help\",\"exit_code\":0,\"arguments\":[],\"options\":[],\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-27 15:49:12'), ('28', '90e79b2d-6ff2-4d9d-a093-4367eb6f20ef', '90e79b2d-7094-4766-83f3-8d6f9023dcd3', null, '1', 'request', '{\"ip_address\":\"127.0.0.1\",\"uri\":\"\\/_ignition\\/health-check\",\"method\":\"GET\",\"controller_action\":\"Facade\\\\Ignition\\\\Http\\\\Controllers\\\\HealthCheckController\",\"middleware\":[\"Facade\\\\Ignition\\\\Http\\\\Middleware\\\\IgnitionEnabled\"],\"headers\":{\"cookie\":\"io=uO_BYT1D7Hgf0tEEAAAK; XSRF-TOKEN=eyJpdiI6ImZsY25MWFdFUWNKeStrNlkwd1FLVkE9PSIsInZhbHVlIjoid2ZYV1RxcU9HRHBBSFpGUkxad280KzRuazk1S0lSSTdwODNOdG5iYk4zZ2dnMmVxZG1EQmdaeVJKeWVnUDlMSSIsIm1hYyI6IjMzMmJhYjdkZmFiZDQ2OTI0MWYzMWZhM2RmNmIxNTE5ODc1ODZjNjU4MWNkN2JjM2M0YjQ2YTllNzAxY2MzOGUifQ%3D%3D; project_laravel_laravelv6x_session=eyJpdiI6ImxOZEEyaTZoa1Y3SFc5V1Q2TXE3Vmc9PSIsInZhbHVlIjoiZUMxbDk0bklqZFhaWTBTcVcwVDhFUlU1Tmk0a1NnNmFDdWhkUGJ3dTF5dzJYdWJEWGwwTFwvWFNDajBoVVVzMDUiLCJtYWMiOiIyZWVjNjUyZGQ0NGYzN2YyOTU5ZjJkYmNhODA5ZTIzZTdlODEwMjhjNWUwNDU2ZWQ1ZWQ4YzEzNGVkZDdjN2NhIn0%3D\",\"accept-language\":\"zh-CN,zh;q=0.9\",\"accept-encoding\":\"gzip, deflate\",\"referer\":\"http:\\/\\/project-laravel-laravelv6x.test\\/co\",\"accept\":\"*\\/*\",\"user-agent\":\"Mozilla\\/5.0 (Macintosh; Intel Mac OS X 10_15_4) AppleWebKit\\/537.36 (KHTML, like Gecko) Chrome\\/83.0.4103.61 Safari\\/537.36\",\"connection\":\"keep-alive\",\"host\":\"project-laravel-laravelv6x.test\",\"content-length\":\"\",\"content-type\":\"\"},\"payload\":[],\"session\":[],\"response_status\":200,\"response\":{\"can_execute_commands\":true},\"duration\":454,\"memory\":4,\"hostname\":\"macbookpro-ctc.local\"}', '2020-06-27 15:49:12');
COMMIT;

-- ----------------------------
--  Table structure for `telescope_entries_tags`
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `telescope_entries_tags`
-- ----------------------------
BEGIN;
INSERT INTO `telescope_entries_tags` VALUES ('90e0461b-630a-4436-b9b2-8eb5b0cf53f3', 'slow'), ('90e0461b-e305-41ac-8675-98d3b655b7e8', 'slow'), ('90e0461c-3016-49c8-8a7e-1ece55c558ab', 'slow'), ('90e0461c-5865-4f9a-b5ea-b78299c9e3b1', 'slow');
COMMIT;

-- ----------------------------
--  Table structure for `telescope_monitoring`
-- ----------------------------
DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `users`
-- ----------------------------
BEGIN;
INSERT INTO `users` VALUES ('1', 'cyb', '1142733640@qq.com', '2020-05-15 13:21:26', '$2y$10$YLMZ1Pht2kVhc89Icv0bsu.dLDnZW4JvKpGyLABaua94xL09Ttj7K', 'aPppnwervsLW8pM6c6t2OhsbU5dR7Ow9XkRAb8JHoiX2ftsioxLaPd8IkvWh', '2020-05-14 01:11:22', '2020-05-15 13:21:26'), ('2', 'chy', '1021625889@qq.com', null, '$2y$10$Egh2eOmzKhCKD1km2PtXdOOTVxwUjZ/MnQGKKVsc2CyBZaioefgJy', null, '2020-05-14 05:12:49', '2020-05-14 05:12:49');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
