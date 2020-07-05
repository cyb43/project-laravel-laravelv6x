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

 Date: 05/18/2020 20:22:31 PM
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

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
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `migrations`
-- ----------------------------
BEGIN;
INSERT INTO `migrations` VALUES ('1', '2014_10_12_000000_create_users_table', '1'), ('2', '2014_10_12_100000_create_password_resets_table', '1'), ('3', '2019_08_19_000000_create_failed_jobs_table', '1'), ('4', '2020_05_08_164410_create_sessions_table', '1'), ('5', '2016_06_01_000001_create_oauth_auth_codes_table', '2'), ('6', '2016_06_01_000002_create_oauth_access_tokens_table', '2'), ('7', '2016_06_01_000003_create_oauth_refresh_tokens_table', '2'), ('8', '2016_06_01_000004_create_oauth_clients_table', '2'), ('9', '2016_06_01_000005_create_oauth_personal_access_clients_table', '2');
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
INSERT INTO `oauth_access_tokens` VALUES ('026eefeb536c7a7546f193a4f43a39c07a4ea1e99ad897c3f59e714a7798d4bcec5d46b0efa1bcaf', '1', '3', null, '[]', '0', '2020-05-18 11:46:30', '2020-05-18 11:46:30', '2020-06-02 11:46:30'), ('20364d4ee7f234514a80523ef07f4d2aa2300b4abb3486f8b653e82472d61a71ea4a02e2cc264c13', '1', '3', null, '[]', '1', '2020-05-18 10:14:18', '2020-05-18 10:14:18', '2020-06-02 10:14:18'), ('36b0201e90a0912ef6c36b1ae127a7ae573411f1fdd3437f4e41081969b9c7842f5c8ca177e9f126', '1', '3', null, '[]', '0', '2020-05-18 11:41:51', '2020-05-18 11:41:51', '2020-06-02 11:41:51'), ('4d1fa13ecc6ef96bc62e87442e85df2786b4b57a02e1de865aed3656432822af2b7a9e77bf809071', '2', '3', null, '[]', '0', '2020-05-18 12:17:51', '2020-05-18 12:17:51', '2020-06-02 12:17:51'), ('665745a24b22700eed9a9daf198e15f483fe23cc86c0bfbc443728a88cf16e55bc5046802a659de4', '1', '3', null, '[]', '0', '2020-05-18 11:49:26', '2020-05-18 11:49:26', '2020-06-02 11:49:26'), ('f588f7e0449717a05cb6288d6398d8db108ce43056912f4175eb7f0651a75f794949479079700b81', '1', '3', null, '[]', '0', '2020-05-18 10:27:55', '2020-05-18 10:27:55', '2020-06-02 10:27:55');
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
INSERT INTO `oauth_auth_codes` VALUES ('149934bbdab1c53071da51f15a116ba0294a7a6684e60fad1855b6ad3ce117428647b7051c0b844a', '1', '3', '[]', '1', '2020-05-18 11:51:49'), ('68fbc28e7fe47731a9f7e6e30ebea37aa35c48f61ba43826a9153c429791ff67c8c8178f99c0f00f', '2', '3', '[]', '1', '2020-05-18 12:27:50'), ('97895beec6c487d15bd17842dbae0d263930da8577c541594beaf55eda1354ee5e12ade13b18f689', '1', '3', '[]', '1', '2020-05-18 10:24:16'), ('b2412fc8146986cd0706c7ebaaca1f980b74337cbd2ed2dfcc7b50e791f475e86a8762466793abf0', '1', '3', '[]', '1', '2020-05-18 11:59:25'), ('ca9e5cfe124a26e29f2fd97e46adf4f9c8b1954329d44b8c124c41090c2fc50c49d30c7ab4a583c9', '1', '3', '[]', '1', '2020-05-18 11:56:30');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  Records of `oauth_clients`
-- ----------------------------
BEGIN;
INSERT INTO `oauth_clients` VALUES ('1', null, 'project-laravel-laravelv6x Personal Access Client', 'BTZfd5mvudwDrbOJyB7Cb06d2Z0XL5a9UJ8ghfE7', null, 'http://localhost', '1', '0', '0', '2020-05-18 01:21:58', '2020-05-18 01:21:58'), ('2', null, 'project-laravel-laravelv6x Password Grant Client', '7G9Y7gofuuZmkg0anNzKlqUgCkAGoOmE6nHj6KA5', 'users', 'http://localhost', '0', '1', '0', '2020-05-18 01:21:58', '2020-05-18 01:21:58'), ('3', '1', 'client-server', 'ehTwZ4IHrKaRQdiUGFncH76eRaRS7I4Bn1WWUnJb', null, 'http://project-laravel-laravelv6x.test/authcode/callback', '0', '0', '0', '2020-05-18 02:33:11', '2020-05-18 02:33:11');
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
INSERT INTO `oauth_refresh_tokens` VALUES ('089c8a3dc290a43227b2d1b8acb0d140c72a35c88148096f1e89abbe1f22f1c1d106d2443c19d88d', 'f588f7e0449717a05cb6288d6398d8db108ce43056912f4175eb7f0651a75f794949479079700b81', '0', '2020-06-17 10:27:55'), ('1cd546294bc154348d952121db7aa995ab0e51d7127da83680590675e92044a3bf9887ee4aac9647', '20364d4ee7f234514a80523ef07f4d2aa2300b4abb3486f8b653e82472d61a71ea4a02e2cc264c13', '1', '2020-06-17 10:14:18'), ('6ffbba17c9716ef07adc53c9b6d116798db6a5cd592022d02e853a12b1e8d97886655cd7b777a3ae', '36b0201e90a0912ef6c36b1ae127a7ae573411f1fdd3437f4e41081969b9c7842f5c8ca177e9f126', '0', '2020-06-17 11:41:51'), ('775d77d2348ac0d44e4548e8a2547832617991838f3955d17c4a2af98f5021c5bf9a24fc31429f9f', '4d1fa13ecc6ef96bc62e87442e85df2786b4b57a02e1de865aed3656432822af2b7a9e77bf809071', '0', '2020-06-17 12:17:51'), ('a08dccbbcca6284fb801d0e62da8b93e4855f8dcfecd2f2db1c410661b86fafd02ba10eb049bcb0e', '665745a24b22700eed9a9daf198e15f483fe23cc86c0bfbc443728a88cf16e55bc5046802a659de4', '0', '2020-06-17 11:49:26'), ('ec76d50dbe7d8cea1a677e7db8bfe3a687574e2422aaa0b5d77975b1b041b034aed4bfcc2d8ed555', '026eefeb536c7a7546f193a4f43a39c07a4ea1e99ad897c3f59e714a7798d4bcec5d46b0efa1bcaf', '0', '2020-06-17 11:46:30');
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
INSERT INTO `users` VALUES ('1', 'cyb', '1142733640@qq.com', '2020-05-15 13:21:26', '$2y$10$YLMZ1Pht2kVhc89Icv0bsu.dLDnZW4JvKpGyLABaua94xL09Ttj7K', 'j5aRnvwHALDOotSJ6nEwL5jH15GjYuxCHovwtWfUULz4wkE0kl9gYCQvspiO', '2020-05-14 01:11:22', '2020-05-15 13:21:26'), ('2', 'chy', '1021625889@qq.com', null, '$2y$10$Egh2eOmzKhCKD1km2PtXdOOTVxwUjZ/MnQGKKVsc2CyBZaioefgJy', null, '2020-05-14 05:12:49', '2020-05-14 05:12:49');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
