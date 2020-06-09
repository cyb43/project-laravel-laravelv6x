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

 Date: 06/09/2020 19:21:00 PM
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1'), ('2', '2014_10_12_100000_create_password_resets_table', '1'), ('3', '2019_08_19_000000_create_failed_jobs_table', '1'), ('4', '2020_05_08_164410_create_sessions_table', '1'), ('5', '2016_06_01_000001_create_oauth_auth_codes_table', '2'), ('6', '2016_06_01_000002_create_oauth_access_tokens_table', '2'), ('7', '2016_06_01_000003_create_oauth_refresh_tokens_table', '2'), ('8', '2016_06_01_000004_create_oauth_clients_table', '2'), ('9', '2016_06_01_000005_create_oauth_personal_access_clients_table', '2'), ('10', '2020_05_20_085446_create_jobs_table', '3'), ('11', '2020_05_29_125948_create_cache_table', '4'), ('12', '2020_06_04_135811_create_notifications_table', '5');
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
