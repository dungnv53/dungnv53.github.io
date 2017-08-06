/*
Navicat MySQL Data Transfer

Source Server         : TEST
Source Server Version : 50547
Source Host           : 192.168.43.11:3306
Source Database       : test_dev

Target Server Type    : MYSQL
Target Server Version : 50547
File Encoding         : 65001

Date: 2016-03-03 16:34:00
*/

DROP DATABASE IF EXISTS `test_dev`;
CREATE DATABASE `ems_dev` DEFAULT CHARACTER SET utf8;

USE `test_dev`;

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for accountlock
-- ----------------------------
DROP TABLE IF EXISTS `accountlock`;
CREATE TABLE `accountlock` (
  `shadow_id` int(11) DEFAULT NULL,
  `delete_key` tinyint(1) DEFAULT NULL,
  `id` char(16) DEFAULT NULL,
  `login_id` text,
  `try_time` text,
  `unlock_token` varchar(255) DEFAULT NULL,
  `onetime_password` varchar(8) DEFAULT NULL,
  `unlock_time` int(11) DEFAULT NULL,
  `regist` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  UNIQUE KEY `system_shadow_id` (`shadow_id`),
  UNIQUE KEY `system_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountlock
-- ----------------------------

-- ----------------------------
-- Table structure for accountlock_delete
-- ----------------------------
DROP TABLE IF EXISTS `accountlock_delete`;
CREATE TABLE `accountlock_delete` (
  `shadow_id` int(11) DEFAULT NULL,
  `delete_key` tinyint(1) DEFAULT NULL,
  `id` char(16) DEFAULT NULL,
  `login_id` text,
  `try_time` text,
  `unlock_token` varchar(255) DEFAULT NULL,
  `onetime_password` varchar(8) DEFAULT NULL,
  `unlock_time` int(11) DEFAULT NULL,
  `regist` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `delete_type` text,
  `delete_id` text,
  `delete_time` int(11) DEFAULT NULL,
  UNIQUE KEY `system_shadow_id` (`shadow_id`),
  UNIQUE KEY `system_id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of accountlock_delete
-- ----------------------------
