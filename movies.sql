/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50716
 Source Host           : localhost
 Source Database       : movies

 Target Server Type    : MySQL
 Target Server Version : 50716
 File Encoding         : utf-8

 Date: 03/02/2018 15:25:26 PM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `is_supper` smallint(6) DEFAULT NULL,
  `role_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `role_id` (`role_id`),
  KEY `ix_admin_addtime` (`addtime`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`role_id`) REFERENCES `role` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `admin`
-- ----------------------------
BEGIN;
INSERT INTO `admin` VALUES ('1', 'admin', 'pbkdf2:sha256:50000$bIaOgvD3$8db6887a5cedbe4495c359f3ec5662c639a58cfce46cf97925a43f870e2cb066', '0', '1', '2018-02-27 05:47:48'), ('4', '小王', 'pbkdf2:sha256:50000$8CKxHGT7$0c81bfe7e34ab03fe387476ff5b90a52b02a467d38dbe0e61beaceabca733215', '1', '2', '2018-02-27 14:20:45');
COMMIT;

-- ----------------------------
--  Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_adminlog_addtime` (`addtime`),
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `adminlog`
-- ----------------------------
BEGIN;
INSERT INTO `adminlog` VALUES ('1', '1', '127.0.0.1', '2018-02-27 06:54:34'), ('2', '1', '127.0.0.1', '2018-02-27 10:47:17'), ('3', '1', '127.0.0.1', '2018-02-27 13:47:33'), ('4', '1', '127.0.0.1', '2018-02-27 14:22:08'), ('5', '4', '127.0.0.1', '2018-02-27 14:35:05'), ('6', '1', '127.0.0.1', '2018-02-28 15:20:41');
COMMIT;

-- ----------------------------
--  Table structure for `auth`
-- ----------------------------
DROP TABLE IF EXISTS `auth`;
CREATE TABLE `auth` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `url` (`url`),
  KEY `ix_auth_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `auth`
-- ----------------------------
BEGIN;
INSERT INTO `auth` VALUES ('1', '编辑电影', '/admin/movie/edit/<int:id>/', '2018-02-27 07:39:49'), ('2', '添加标签', '/admin/tag/add/', '2018-02-27 09:58:47'), ('3', '删除标签', '/admin/tag/del/<int:id>/', '2018-02-27 09:59:12'), ('4', '编辑标签', '/admin/tag/edit/<int:id>/', '2018-02-27 09:59:29'), ('5', '添加电影', '/admin/movie/add/', '2018-02-27 09:59:44'), ('6', '删除电影', '/admin/movie/del/<int:id>/', '2018-02-27 09:59:59'), ('7', '首页', '/admin/', '2018-02-27 13:56:51'), ('8', '添加权限', '/admin/auth/add/', '2018-02-27 14:01:19'), ('9', '标签列表', '/admin/tag/list/<int:page>/', '2018-02-27 14:05:07'), ('10', '电影列表', '/admin/movie/list/<int:page>/', '2018-02-27 14:05:52'), ('11', '添加预告', '/admin/preview/add/', '2018-02-27 14:06:40'), ('12', '预告列表', '/admin/preview/list/<int:page>/', '2018-02-27 14:06:54'), ('13', '删除预告', '/admin/preview/del/<int:id>/', '2018-02-27 14:07:14'), ('14', '编辑预告', '/admin/preview/edit/<int:id>/', '2018-02-27 14:07:29'), ('15', '会员列表', '/admin/user/list/<int:page>/', '2018-02-27 14:07:42'), ('16', '删除会员', '/admin/user/del/<int:id>/', '2018-02-27 14:07:57'), ('17', '查看会员', '/admin/user/view/<int:id>/', '2018-02-27 14:08:10'), ('18', '评论列表', '/admin/comment/list/<int:page>/', '2018-02-27 14:08:23'), ('19', '删除评论', '/admin/comment/del/<int:id>/', '2018-02-27 14:08:44'), ('20', '收藏列表', '/admin/moviecol/list/<int:page>/', '2018-02-27 14:09:01'), ('21', '删除收藏', '/admin/moviecol/del/<int:id>/', '2018-02-27 14:09:22'), ('23', '操作日志列表', '/admin/oplog/list/<int:page>/', '2018-02-27 14:10:32'), ('24', '管理员登录日志', '/admin/adminloginlog/list/<int:page>/', '2018-02-27 14:10:46'), ('25', '会员登录日志', '/admin/userloginlog/list/<int:page>/', '2018-02-27 14:11:02'), ('26', '权限列表', '/admin/auth/list/<int:page>/', '2018-02-27 14:11:46'), ('27', '删除权限', '/admin/auth/del/<int:id>/', '2018-02-27 14:11:57'), ('28', '编辑权限', '/admin/auth/edit/<int:id>/', '2018-02-27 14:12:10'), ('29', '添加角色', '/admin/role/add/', '2018-02-27 14:12:21'), ('30', '角色列表', '/admin/role/list/<int:page>/', '2018-02-27 14:12:34'), ('31', '删除角色', '/admin/role/del/<int:id>/', '2018-02-27 14:12:48'), ('32', '修改角色', '/admin/role/edit/<int:id>/', '2018-02-27 14:12:59'), ('33', '管理员添加', '/admin/admin/add/', '2018-02-27 14:13:12'), ('34', '管理员列表', '/admin/admin/list/<int:page>/', '2018-02-27 14:13:29');
COMMIT;

-- ----------------------------
--  Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_comment_addtime` (`addtime`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `comment`
-- ----------------------------
BEGIN;
INSERT INTO `comment` VALUES ('1', '好看', '11', '14', '2018-02-27 01:10:35'), ('2', '不错', '11', '22', '2018-02-27 01:10:35'), ('3', '经典', '11', '21', '2018-02-27 01:10:35'), ('5', '难看', '8', '15', '2018-02-27 01:10:36'), ('6', '<p>1222<br/></p>', '6', '28', '2018-02-28 19:58:12'), ('7', '<p>asd<br/></p>', '6', '28', '2018-02-28 20:06:07'), ('8', '<p>666<br/></p>', '6', '28', '2018-02-28 20:07:53'), ('9', '<p>333<br/></p>', '6', '28', '2018-02-28 20:08:22'), ('10', '<p>666333<br/></p>', '6', '28', '2018-02-28 20:08:32'), ('11', '<p>333<br/></p>', '11', '28', '2018-02-28 20:11:08'), ('12', '<p>333<br/></p>', '6', '28', '2018-02-28 20:12:17'), ('13', '<p>233</p>', '6', '25', '2018-03-01 21:27:14');
COMMIT;

-- ----------------------------
--  Table structure for `movie`
-- ----------------------------
DROP TABLE IF EXISTS `movie`;
CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `info` text,
  `logo` varchar(255) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `playnum` bigint(20) DEFAULT NULL,
  `commentnum` bigint(20) DEFAULT NULL,
  `tag_id` int(11) DEFAULT NULL,
  `area` varchar(255) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `length` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `url` (`url`),
  UNIQUE KEY `logo` (`logo`),
  KEY `tag_id` (`tag_id`),
  KEY `ix_movie_addtime` (`addtime`),
  CONSTRAINT `movie_ibfk_1` FOREIGN KEY (`tag_id`) REFERENCES `tag` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `movie`
-- ----------------------------
BEGIN;
INSERT INTO `movie` VALUES ('6', '环太平洋', '20180226191402d5a59d6c4e7d4f59b848e9ce49df019d.mp4', '环太平洋123', '201802261914022c5854861038410e94470360d4b4e879.jpg', '3', '128', '6', '6', '美国', '2018-02-20', '1.12', '2018-02-26 19:14:02'), ('8', '敲请求', '201802270100084f3d0f1e25dd463d92d77bd249296b5d.mp4', '凄凄切切群', '201802270100081f96d4e082104cf4b8f6570170e8c1f8.jpg', '1', '3', '0', '5', '中国', '2018-02-14', '20', '2018-02-27 01:00:08'), ('11', 'qqq', '20180227010339e2fbc10c98104cf08ff529a4605b1222.mp4', '凄凄切切群', '20180227010339c9c76ea412cf41c3afb61c860bb8ee1b.jpg', '1', '25', '2', '5', '请求', '2018-02-21', '123', '2018-02-27 01:03:39');
COMMIT;

-- ----------------------------
--  Table structure for `moviecol`
-- ----------------------------
DROP TABLE IF EXISTS `moviecol`;
CREATE TABLE `moviecol` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `movie_id` (`movie_id`),
  KEY `user_id` (`user_id`),
  KEY `ix_moviecol_addtime` (`addtime`),
  CONSTRAINT `moviecol_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`),
  CONSTRAINT `moviecol_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `moviecol`
-- ----------------------------
BEGIN;
INSERT INTO `moviecol` VALUES ('1', '6', '21', '2018-02-27 04:28:38'), ('2', '6', '22', '2018-02-27 04:28:38'), ('3', '6', '23', '2018-02-27 04:28:38'), ('4', '6', '14', '2018-02-27 04:28:38'), ('5', '8', '15', '2018-02-27 04:28:38'), ('6', '8', '16', '2018-02-27 04:28:38'), ('7', '8', '17', '2018-02-27 04:28:38'), ('9', '6', '25', '2018-03-01 22:05:35'), ('10', '11', '25', '2018-03-01 22:24:54');
COMMIT;

-- ----------------------------
--  Table structure for `oplog`
-- ----------------------------
DROP TABLE IF EXISTS `oplog`;
CREATE TABLE `oplog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `admin_id` (`admin_id`),
  KEY `ix_oplog_addtime` (`addtime`),
  CONSTRAINT `oplog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `oplog`
-- ----------------------------
BEGIN;
INSERT INTO `oplog` VALUES ('1', '1', '127.0.0.1', '添加标签233', '2018-02-27 06:27:10'), ('2', '1', '127.0.0.1', '添加标签456', '2018-02-27 06:27:13'), ('3', '1', '127.0.0.1', '添加标签123', '2018-02-27 06:27:17'), ('4', '1', '127.0.0.1', '添加标签222', '2018-02-27 06:27:24'), ('5', '1', '127.0.0.1', '删除标签 校园', '2018-02-27 07:00:39'), ('6', '1', '127.0.0.1', '添加权限 添加标签', '2018-02-27 09:58:47'), ('7', '1', '127.0.0.1', '添加权限 删除标签', '2018-02-27 09:59:12'), ('8', '1', '127.0.0.1', '添加权限 编辑标签', '2018-02-27 09:59:29'), ('9', '1', '127.0.0.1', '添加权限 添加电影', '2018-02-27 09:59:44'), ('10', '1', '127.0.0.1', '添加权限 删除电影', '2018-02-27 09:59:59'), ('11', '1', '127.0.0.1', '修改权限 编辑电影', '2018-02-27 10:01:27'), ('12', '1', '127.0.0.1', '修改权限 添加标签', '2018-02-27 10:08:16'), ('13', '1', '127.0.0.1', '添加权限 233', '2018-02-27 10:08:43'), ('14', '1', '127.0.0.1', '删除权限 233', '2018-02-27 10:08:49'), ('15', '1', '127.0.0.1', '添加角色 标签管理员', '2018-02-27 11:03:08'), ('16', '1', '127.0.0.1', '添加角色 233', '2018-02-27 11:24:44'), ('17', '1', '127.0.0.1', '删除角色 233', '2018-02-27 11:24:49'), ('18', '1', '127.0.0.1', '修改角色 站长', '2018-02-27 11:31:42'), ('19', '1', '127.0.0.1', '添加管理员 abc', '2018-02-27 12:18:01'), ('20', '1', '127.0.0.1', '添加管理员 aaa', '2018-02-27 12:18:15'), ('21', '1', '127.0.0.1', '添加权限 标签列表', '2018-02-27 14:05:07'), ('22', '1', '127.0.0.1', '添加权限 电影列表', '2018-02-27 14:05:52'), ('23', '1', '127.0.0.1', '添加权限 添加预告', '2018-02-27 14:06:40'), ('24', '1', '127.0.0.1', '添加权限 预告列表', '2018-02-27 14:06:54'), ('25', '1', '127.0.0.1', '添加权限 删除预告', '2018-02-27 14:07:14'), ('26', '1', '127.0.0.1', '添加权限 编辑预告', '2018-02-27 14:07:29'), ('27', '1', '127.0.0.1', '添加权限 会员列表', '2018-02-27 14:07:42'), ('28', '1', '127.0.0.1', '添加权限 删除会员', '2018-02-27 14:07:57'), ('29', '1', '127.0.0.1', '添加权限 查看会员', '2018-02-27 14:08:10'), ('30', '1', '127.0.0.1', '添加权限 评论列表', '2018-02-27 14:08:23'), ('31', '1', '127.0.0.1', '添加权限 删除评论', '2018-02-27 14:08:44'), ('32', '1', '127.0.0.1', '添加权限 收藏列表', '2018-02-27 14:09:01'), ('33', '1', '127.0.0.1', '添加权限 删除收藏', '2018-02-27 14:09:22'), ('34', '1', '127.0.0.1', '添加权限 操作日志列表', '2018-02-27 14:10:32'), ('35', '1', '127.0.0.1', '添加权限 管理员登录日志', '2018-02-27 14:10:46'), ('36', '1', '127.0.0.1', '添加权限 会员登录日志', '2018-02-27 14:11:02'), ('37', '1', '127.0.0.1', '添加权限 权限列表', '2018-02-27 14:11:46'), ('38', '1', '127.0.0.1', '添加权限 删除权限', '2018-02-27 14:11:57'), ('39', '1', '127.0.0.1', '添加权限 编辑权限', '2018-02-27 14:12:10'), ('40', '1', '127.0.0.1', '添加权限 添加角色', '2018-02-27 14:12:21'), ('41', '1', '127.0.0.1', '添加权限 角色列表', '2018-02-27 14:12:34'), ('42', '1', '127.0.0.1', '添加权限 删除角色', '2018-02-27 14:12:48'), ('43', '1', '127.0.0.1', '添加权限 修改角色', '2018-02-27 14:12:59'), ('44', '1', '127.0.0.1', '添加权限 管理员添加', '2018-02-27 14:13:12'), ('45', '1', '127.0.0.1', '添加权限 管理员列表', '2018-02-27 14:13:29'), ('46', '1', '127.0.0.1', '修改角色 站长', '2018-02-27 14:15:06'), ('47', '1', '127.0.0.1', '添加管理员 小王', '2018-02-27 14:20:45'), ('48', '1', '127.0.0.1', '添加预告 武则天', '2018-02-28 15:21:50'), ('49', '1', '127.0.0.1', '添加预告 王力宏', '2018-02-28 15:22:03'), ('50', '1', '127.0.0.1', '添加预告 周杰伦', '2018-02-28 15:22:20');
COMMIT;

-- ----------------------------
--  Table structure for `preview`
-- ----------------------------
DROP TABLE IF EXISTS `preview`;
CREATE TABLE `preview` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `title` (`title`),
  UNIQUE KEY `logo` (`logo`),
  KEY `ix_preview_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `preview`
-- ----------------------------
BEGIN;
INSERT INTO `preview` VALUES ('1', '武则天', '201802281521500450a4125a8742ac9c9497cac09e52b9.jpg', '2018-02-28 15:21:50'), ('2', '王力宏', '20180228152203233699a28a5a4659b9e1eca8b9997273.jpg', '2018-02-28 15:22:03'), ('3', '周杰伦', '20180228152220dd076ed7248946ffa22ec15f7578acf9.jpg', '2018-02-28 15:22:20');
COMMIT;

-- ----------------------------
--  Table structure for `role`
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `auths` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_role_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `role`
-- ----------------------------
BEGIN;
INSERT INTO `role` VALUES ('1', '站长', '1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,23,24,25,26,27,28,29,30,31,32,33,34', '2018-02-25 19:49:22'), ('2', '标签管理员', '2,3,4', '2018-02-27 11:03:08');
COMMIT;

-- ----------------------------
--  Table structure for `tag`
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  KEY `ix_tag_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `tag`
-- ----------------------------
BEGIN;
INSERT INTO `tag` VALUES ('5', '科幻', '2018-02-27 00:55:25'), ('6', '青春', '2018-02-27 00:55:32'), ('7', '校园', '2018-02-27 06:27:10'), ('8', '456', '2018-02-27 06:27:13'), ('9', '123', '2018-02-27 06:27:17'), ('10', '222', '2018-02-27 06:27:24');
COMMIT;

-- ----------------------------
--  Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `pwd` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(11) DEFAULT NULL,
  `info` text,
  `face` varchar(255) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  `uuid` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `phone` (`phone`),
  UNIQUE KEY `uuid` (`uuid`),
  KEY `ix_user_addtime` (`addtime`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('14', '鼠', '1231', '1231@123.com', '13888888881', '鼠', '1f401.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc0'), ('15', '牛', '1232', '1232@123.com', '13888888882', '牛', '1f402.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc1'), ('16', '虎', '1233', '1233@123.com', '13888888883', '虎', '1f405.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc2'), ('17', '兔', '1234', '1234@123.com', '13888888884', '兔', '1f407.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc3'), ('18', '龙', '1235', '1235@123.com', '13888888885', '龙', '1f409.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc4'), ('19', '蛇', '1236', '1236@123.com', '13888888886', '蛇', '1f40d.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc5'), ('20', '马', '1237', '1237@123.com', '13888888887', '马', '1f434.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc6'), ('21', '羊', '1238', '1238@123.com', '13888888888', '羊', '1f411.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc7'), ('22', '猴', '1239', '1239@123.com', '13888888889', '猴', '1f412.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc8'), ('23', '鸡', '1240', '1240@123.com', '13888888891', '鸡', '1f413.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fc9'), ('24', '狗', '1241', '1241@123.com', '13888888892', '狗', '1f415.png', '2018-02-27 00:06:36', 'd32a72bdac524478b7e4f6dfc8394fd0'), ('25', 'user1', 'pbkdf2:sha256:50000$j3PdSeHU$c60a2846bb8ab8c43c92317d48c492709a92cb2c3892d14596aa40931c9adeb5', '123456789@qq.com', '13333333333', '2333', null, '2018-02-27 20:01:47', '3b2efa532e2b4209bcbc7095119d7167'), ('26', 'user2', 'pbkdf2:sha256:50000$fOidfqJM$2ecdf4ea4355dfe3a4830efd1d120af25b31bc16cb20e7fb099e7e1ca2440d68', '987654321@qq.com', '18888888888', null, null, '2018-02-27 20:24:40', 'c7429ec5a47b46c1b52517951df08ba7'), ('27', 'user3', 'pbkdf2:sha256:50000$PnBv7xs9$55a5f7e9495a104c46064c4330b559ca2c56413a6eb0ffb77ee7f0eaef7ab88b', '987654322@qq.com', '18888888889', null, null, '2018-02-27 20:25:18', '52546044aaac49dea358f4dcd0f2a3a0'), ('28', 'xiaowang', 'pbkdf2:sha256:50000$ByX1H76i$030195b832483e723159aac8aebde559de5bd71b9574fbe7e9a921df48d2b198', '741258@qq.com', '15555555555', null, null, '2018-02-28 14:36:13', '465c1d3b44994b5d8db2b38c61e65825');
COMMIT;

-- ----------------------------
--  Table structure for `userlog`
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `addtime` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `ix_userlog_addtime` (`addtime`),
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `userlog`
-- ----------------------------
BEGIN;
INSERT INTO `userlog` VALUES ('1', '21', '192.168.4.1', '2018-02-27 01:13:44'), ('2', '22', '192.168.4.2', '2018-02-27 01:13:44'), ('3', '23', '192.168.4.3', '2018-02-27 01:13:44'), ('4', '14', '192.168.4.4', '2018-02-27 01:13:44'), ('5', '15', '192.168.4.5', '2018-02-27 01:13:44'), ('6', '16', '192.168.4.6', '2018-02-27 01:13:44'), ('7', '17', '192.168.4.7', '2018-02-27 01:13:44'), ('8', '18', '192.168.4.8', '2018-02-27 01:13:44'), ('9', '19', '192.168.4.9', '2018-02-27 01:13:45'), ('10', '25', '127.0.0.1', '2018-02-27 20:16:20'), ('11', '25', '127.0.0.1', '2018-02-27 20:16:30'), ('12', '25', '127.0.0.1', '2018-02-27 20:16:52'), ('13', '25', '127.0.0.1', '2018-02-27 20:17:01'), ('14', '26', '127.0.0.1', '2018-02-27 20:25:38'), ('15', '25', '127.0.0.1', '2018-02-27 20:43:14'), ('16', '25', '127.0.0.1', '2018-02-28 12:09:56'), ('17', '25', '127.0.0.1', '2018-02-28 13:14:50'), ('18', '25', '127.0.0.1', '2018-02-28 13:32:11'), ('19', '25', '127.0.0.1', '2018-02-28 13:48:52'), ('20', '25', '127.0.0.1', '2018-02-28 13:50:05'), ('21', '25', '127.0.0.1', '2018-02-28 13:51:28'), ('22', '25', '127.0.0.1', '2018-02-28 13:57:04'), ('23', '25', '127.0.0.1', '2018-02-28 13:59:23'), ('24', '25', '127.0.0.1', '2018-02-28 14:06:01'), ('25', '25', '127.0.0.1', '2018-02-28 14:07:00'), ('26', '25', '127.0.0.1', '2018-02-28 14:20:53'), ('27', '28', '127.0.0.1', '2018-02-28 14:36:27'), ('28', '28', '127.0.0.1', '2018-02-28 14:38:55'), ('29', '25', '127.0.0.1', '2018-02-28 16:33:25'), ('30', '25', '127.0.0.1', '2018-02-28 16:36:55'), ('31', '25', '127.0.0.1', '2018-02-28 16:37:43'), ('32', '25', '127.0.0.1', '2018-02-28 16:39:42'), ('33', '25', '127.0.0.1', '2018-02-28 16:42:17'), ('34', '25', '127.0.0.1', '2018-03-01 20:06:31');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
