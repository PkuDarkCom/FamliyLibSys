/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50160
Source Host           : localhost:3306
Source Database       : etl

Target Server Type    : MYSQL
Target Server Version : 50160
File Encoding         : 65001

Date: 2016-11-02 18:04:39
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `systemlog`
-- ----------------------------
DROP TABLE IF EXISTS `systemlog`;
CREATE TABLE `systemlog` (
  `id` varchar(40) NOT NULL DEFAULT '',
  `description` varchar(255) DEFAULT NULL,
  `method` varchar(355) DEFAULT NULL,
  `logType` int(11) DEFAULT NULL,
  `requestIp` varchar(20) DEFAULT NULL,
  `exceptioncode` varchar(55) DEFAULT NULL,
  `exceptionDetail` text,
  `params` text,
  `createBy` varchar(50) DEFAULT NULL,
  `createDate` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of systemlog
-- ----------------------------
INSERT INTO `systemlog` VALUES ('661c5397-919a-4d95-a64a-be273d5d322c', '', 'com.ch.controller.LoginController.TestLogin().', '0', '127.0.0.1', null, null, '', '张三', '2016-11-01 15:07:47');
INSERT INTO `systemlog` VALUES ('2b3a53f2-3473-4399-be8c-1b17657d4c1b', 'logintest', 'com.ch.controller.LoginController.TestLogin()', '1', '127.0.0.1', 'java.lang.RuntimeException', 'java.lang.ArithmeticException: / by zero', '', '张三', '2016-11-01 15:07:49');
