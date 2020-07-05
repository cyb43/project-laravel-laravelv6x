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
--  ^2_3^ 缓存表
--  Table structure for `cache`
-- ----------------------------
DROP TABLE IF EXISTS `cache`;
CREATE TABLE `cache` (
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "缓存键名",
  `value` mediumtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "缓存键值",
  `expiration` int(11) NOT NULL COMMENT "缓存有效时间",
  UNIQUE KEY `cache_key_unique` (`key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ demo_post文章
--  Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `demo_posts`;
CREATE TABLE `demo_posts` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT "文章ID",
  `title` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "标题",
  `created_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "创建时间戳",
  `updated_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "更新时间戳",

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ demo_post_content文章内容
--  Table structure for `posts`
-- ----------------------------
DROP TABLE IF EXISTS `demo_posts_contents`;
CREATE TABLE `demo_posts_contents` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT "内容ID",
  `post_id` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "文章ID",
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "内容",
  `created_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "创建时间戳",
  `updated_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "更新时间戳",

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ demo_post_comments文章评论
--  Table structure for `demo_post_comments`
-- ----------------------------
DROP TABLE IF EXISTS `demo_post_comments`;
CREATE TABLE `demo_post_comments` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT "评论ID",
  `post_id` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "文章ID",
  `comment_txt` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "评论",
  `created_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "创建时间戳",
  `updated_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "更新时间戳",

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ demo_post_tags文章标签
--  Table structure for `demo_post_tags`
-- ----------------------------
DROP TABLE IF EXISTS `demo_post_tags`;
CREATE TABLE `demo_post_tags` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT "标签ID",
  `tag_name` VARCHAR(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "评论",
  `created_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "创建时间戳",
  `updated_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "更新时间戳",

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ demo_post_tags_pivots文章标签中间表
--  Table structure for `demo_post_tags_pivots`
-- ----------------------------
DROP TABLE IF EXISTS `demo_post_tags_pivots`;
CREATE TABLE `demo_post_tags_pivots` (
  `id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT "ID",
  `post_id` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "文章ID",
  `tag_id` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "标签ID",
  `created_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "创建时间戳",
  `updated_at` INT(10) UNSIGNED NOT NULL DEFAULT 0 COMMENT "更新时间戳",

  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ 任务失败表
--  Table structure for `failed_jobs`
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT "记录ID",
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "任务连接",
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "任务队列",
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "任务加载",
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "任务异常",
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT "失败时间",
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^任务表
--  Table structure for `jobs`
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT "记录ID",
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "任务队列",
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "任务加载",
  `attempts` tinyint(3) unsigned NOT NULL COMMENT "尝试次数",
  `reserved_at` int(10) unsigned DEFAULT NULL COMMENT "保留时间戳",
  `available_at` int(10) unsigned NOT NULL COMMENT "有效时间戳",
  `created_at` int(10) unsigned NOT NULL COMMENT "创建时间戳",
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ 数据迁移
--  Table structure for `migrations`
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT "记录ID",
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "迁移数据文件名称",
  `batch` int(11) NOT NULL COMMENT "迁移批量标示(迁移步数)",
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ 通知消息表
--  Table structure for `notifications`
-- ----------------------------
DROP TABLE IF EXISTS `notifications`;
CREATE TABLE `notifications` (
  `id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "记录ID字串",
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "通知类型(通知类名)",
  `notifiable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "通知用户模型(如App\User)",
  `notifiable_id` bigint(20) unsigned NOT NULL COMMENT "通知用户ID",
  `data` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "通知用户json字串",
  `read_at` timestamp NULL DEFAULT NULL COMMENT "读取时间戳",
  `created_at` timestamp NULL DEFAULT NULL COMMENT "创建时间戳",
  `updated_at` timestamp NULL DEFAULT NULL COMMENT "更新时间戳",
  PRIMARY KEY (`id`),
  KEY `notifications_notifiable_type_notifiable_id_index` (`notifiable_type`,`notifiable_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;


-- ----------------------------
--  ^2_3^ 访问令牌表
--  Table structure for `oauth_access_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_access_tokens`;
CREATE TABLE `oauth_access_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "令牌",
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT "用户id",
  `client_id` bigint(20) unsigned NOT NULL COMMENT "授权客户端(接入应用程序)ID",
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT "名称",
  `scopes` text COLLATE utf8mb4_unicode_ci COMMENT "令牌作用域",
  `revoked` tinyint(1) NOT NULL COMMENT "是否已取消",
  `created_at` timestamp NULL DEFAULT NULL COMMENT "创建时间戳",
  `updated_at` timestamp NULL DEFAULT NULL COMMENT "更新时间戳",
  `expires_at` datetime DEFAULT NULL COMMENT "过期日期时间",
  PRIMARY KEY (`id`),
  KEY `oauth_access_tokens_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ 授权码表
--  Table structure for `oauth_auth_codes`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_auth_codes`;
CREATE TABLE `oauth_auth_codes` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "授权码",
  `user_id` bigint(20) unsigned NOT NULL COMMENT "用户id",
  `client_id` bigint(20) unsigned NOT NULL COMMENT "授权客户端(接入应用程序)ID",
  `scopes` text COLLATE utf8mb4_unicode_ci COMMENT "令牌作用域",
  `revoked` tinyint(1) NOT NULL COMMENT "是否已取消",
  `expires_at` datetime DEFAULT NULL COMMENT "过期日期时间",
  PRIMARY KEY (`id`),
  KEY `oauth_auth_codes_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ 授权客户端表
--  Table structure for `oauth_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_clients`;
CREATE TABLE `oauth_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT "客户端id",
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT "创建客户端(接入应用程序)用户id",
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "客户端名称",
  `secret` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT "客户端密钥",
  `provider` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT "提供者(检索用户的表)",
  `redirect` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "授权请求回调地址",
  `personal_access_client` tinyint(1) NOT NULL COMMENT "是否为个人访问客户端",
  `password_client` tinyint(1) NOT NULL COMMENT "是否为密码授权客户端",
  `revoked` tinyint(1) NOT NULL COMMENT "是否已取消",
  `created_at` timestamp NULL DEFAULT NULL COMMENT "创建时间戳",
  `updated_at` timestamp NULL DEFAULT NULL COMMENT "更新时间戳",
  PRIMARY KEY (`id`),
  KEY `oauth_clients_user_id_index` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ 个人访问客户端表
--  Table structure for `oauth_personal_access_clients`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_personal_access_clients`;
CREATE TABLE `oauth_personal_access_clients` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT "记录id",
  `client_id` bigint(20) unsigned NOT NULL COMMENT "属于个人访问客户端的客户端id(oauth_clients->id)",
  `created_at` timestamp NULL DEFAULT NULL COMMENT "创建时间戳",
  `updated_at` timestamp NULL DEFAULT NULL COMMENT "更新时间戳",
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ 刷新令牌表
--  Table structure for `oauth_refresh_tokens`
-- ----------------------------
DROP TABLE IF EXISTS `oauth_refresh_tokens`;
CREATE TABLE `oauth_refresh_tokens` (
  `id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "刷新令牌",
  `access_token_id` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "访问令牌",
  `revoked` tinyint(1) NOT NULL COMMENT "是否已取消",
  `expires_at` datetime DEFAULT NULL COMMENT "过期日期时间",
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ 密码重置表
--  Table structure for `password_resets`
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "邮件地址",
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "令牌",
  `created_at` timestamp NULL DEFAULT NULL COMMENT "创建时间戳",
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ 会话表
--  Table structure for `sessions`
-- ----------------------------
DROP TABLE IF EXISTS `sessions`;
CREATE TABLE `sessions` (
  `id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "会话记录ID",
  `user_id` bigint(20) unsigned DEFAULT NULL COMMENT "会话用户ID",
  `ip_address` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT "IP地址",
  `user_agent` text COLLATE utf8mb4_unicode_ci COMMENT "用户代理",
  `payload` text COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "会话加载",
  `last_activity` int(11) NOT NULL COMMENT "有效时间戳",
  UNIQUE KEY `sessions_id_unique` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ Telescope调试工具_实体表
--  Table structure for `telescope_entries`
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries`;
CREATE TABLE `telescope_entries` (
  `sequence` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT "序号",
  `uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "uuid字串",
  `batch_id` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "batch_id字串",
  `family_hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT "family_hash字串",
  `should_display_on_index` tinyint(1) NOT NULL DEFAULT '1' COMMENT "should_display_on_index值",
  `type` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "类型",
  `content` longtext COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "content内容",
  `created_at` datetime DEFAULT NULL COMMENT "创建时间",
  PRIMARY KEY (`sequence`),

  UNIQUE KEY `telescope_entries_uuid_unique` (`uuid`),
  KEY `telescope_entries_batch_id_index` (`batch_id`),
  KEY `telescope_entries_family_hash_index` (`family_hash`),
  KEY `telescope_entries_created_at_index` (`created_at`),
  KEY `telescope_entries_type_should_display_on_index_index` (`type`,`should_display_on_index`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ Telescope调试工具_实体标签表
--  Table structure for `telescope_entries_tags`
-- ----------------------------
DROP TABLE IF EXISTS `telescope_entries_tags`;
CREATE TABLE `telescope_entries_tags` (
  `entry_uuid` char(36) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "entry_uuid值",
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "标签",

  KEY `telescope_entries_tags_entry_uuid_tag_index` (`entry_uuid`,`tag`),
  KEY `telescope_entries_tags_tag_index` (`tag`),
  CONSTRAINT `telescope_entries_tags_entry_uuid_foreign` FOREIGN KEY (`entry_uuid`) REFERENCES `telescope_entries` (`uuid`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ Telescope调试工具_实体监控表
--  Table structure for `telescope_monitoring`
-- ----------------------------
DROP TABLE IF EXISTS `telescope_monitoring`;
CREATE TABLE `telescope_monitoring` (
  `tag` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- ----------------------------
--  ^2_3^ 用户表
--  Table structure for `users`
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT COMMENT "用户ID",
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "用户名称",
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "邮件地址",
  `email_verified_at` timestamp NULL DEFAULT NULL COMMENT "邮件验证时间戳",
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL COMMENT "密码",
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT "记录令牌",
  `created_at` timestamp NULL DEFAULT NULL COMMENT "创建时间戳",
  `updated_at` timestamp NULL DEFAULT NULL COMMENT "更新时间戳",
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
