/*
Navicat MySQL Data Transfer

Source Server         : netease
Source Server Version : 50612
Source Host           : localhost:3306
Source Database       : netease

Target Server Type    : MYSQL
Target Server Version : 50612
File Encoding         : 65001

Date: 2018-03-22 21:01:00
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for netease_goods
-- ----------------------------
DROP TABLE IF EXISTS `netease_goods`;
CREATE TABLE `netease_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `content` varchar(1000) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `pic` int(11) DEFAULT NULL,
  `picsrc` varchar(255) DEFAULT NULL,
  `sellerId` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of netease_goods
-- ----------------------------
INSERT INTO `netease_goods` VALUES ('1', '测试', '这就是一个简单的测试', '测试开始', '300', '1', '1.jpg', '2');
INSERT INTO `netease_goods` VALUES ('2', '测试发布功能', '测试', '测试', '1000', '1', '2.jpg', '2');
INSERT INTO `netease_goods` VALUES ('3', '上传功能测试', '测试测试', '测试', '200', '1', '3.jpg', '2');
INSERT INTO `netease_goods` VALUES ('4', '还是一个测试', '测试测试', '测试测试', '1000', '2', 'http://www.runoob.com/images/pulpit.jpg', '2');
INSERT INTO `netease_goods` VALUES ('5', '一个测试测试', '一个测试测试', '一个测试测试', '250', '2', 'http://www.runoob.com/images/pulpit.jpg', '2');
INSERT INTO `netease_goods` VALUES ('6', '旅行', '测试', '测试', '500', '2', 'http://www.runoob.com/images/pulpit.jpg', '2');
INSERT INTO `netease_goods` VALUES ('7', '嘿嘿', '嘿嘿', '嘿嘿嘿', '100', '1', '7.jpg', '2');
INSERT INTO `netease_goods` VALUES ('8', '啦啦啦', '啦啦啦啦', '啦啦啦啦啦啦啦', '300', '1', '8.jpg', '2');

-- ----------------------------
-- Table structure for netease_order
-- ----------------------------
DROP TABLE IF EXISTS `netease_order`;
CREATE TABLE `netease_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goodsId` int(11) DEFAULT NULL,
  `buyerId` int(11) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `price` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `isCompleted` int(11) DEFAULT NULL,
  `time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of netease_order
-- ----------------------------
INSERT INTO `netease_order` VALUES ('1', '1', '1', '2', '300', '600', '1', '2018-03-22 15:37:11');
INSERT INTO `netease_order` VALUES ('2', '2', '1', '3', '1000', '3000', '1', '2018-03-22 15:38:31');
INSERT INTO `netease_order` VALUES ('3', '3', '1', '4', '200', '800', '0', '2018-03-22 20:39:22');

-- ----------------------------
-- Table structure for netease_user
-- ----------------------------
DROP TABLE IF EXISTS `netease_user`;
CREATE TABLE `netease_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of netease_user
-- ----------------------------
INSERT INTO `netease_user` VALUES ('1', 'buyer', '37254660e226ea65ce6f1efd54233424', '1');
INSERT INTO `netease_user` VALUES ('2', 'seller', '981c57a5cfb0f868e064904b8745766f', '2');
