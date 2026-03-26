/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : kamainong

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2026-03-27 00:45:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for ntp_common_admin
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_admin`;
CREATE TABLE `ntp_common_admin` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(200) DEFAULT NULL COMMENT '管理员账号',
  `pwd` varchar(200) DEFAULT NULL COMMENT '密码',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `role` int(2) DEFAULT '1' COMMENT '角色',
  `market_level` int(11) DEFAULT NULL COMMENT '市场部级别',
  `remarks` varchar(200) DEFAULT '0' COMMENT '备注',
  `phone` varchar(200) DEFAULT '0' COMMENT '手机号码',
  `invitation_code` varchar(200) DEFAULT '0' COMMENT '邀请码',
  `market_uid` int(11) DEFAULT NULL,
  `operate_pwd` varchar(255) CHARACTER SET utf8 NOT NULL COMMENT '用户余额变更使用的操作密码',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台管理员表';

-- ----------------------------
-- Records of ntp_common_admin
-- ----------------------------
INSERT INTO `ntp_common_admin` VALUES ('1', 'admin', 'NDU2Nzg5', '2026-03-26 16:14:08', '1', null, '0', '0', '0', null, '123456');

-- ----------------------------
-- Table structure for ntp_common_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_admin_log`;
CREATE TABLE `ntp_common_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL COMMENT '操作人名',
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(255) DEFAULT NULL COMMENT '操作ip',
  `func` varchar(255) DEFAULT NULL COMMENT '操作方法',
  `create_time` datetime DEFAULT NULL,
  `rmark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台日志表';

-- ----------------------------
-- Records of ntp_common_admin_log
-- ----------------------------
INSERT INTO `ntp_common_admin_log` VALUES ('1', 'admin', '1', '127.0.0.1', 'api/wares/update', '2026-03-26 23:30:38', 'POST api/wares/update; code=200');
INSERT INTO `ntp_common_admin_log` VALUES ('2', 'admin', '1', '127.0.0.1', 'api/wares/update', '2026-03-26 23:43:28', 'POST api/wares/update; code=200');
INSERT INTO `ntp_common_admin_log` VALUES ('3', 'admin', '1', '127.0.0.1', 'api/wares/update', '2026-03-26 23:43:48', 'POST api/wares/update; code=200');
INSERT INTO `ntp_common_admin_log` VALUES ('4', 'admin', '1', '127.0.0.1', 'api/goods/update', '2026-03-27 00:15:33', 'POST api/goods/update; code=200');
INSERT INTO `ntp_common_admin_log` VALUES ('5', 'admin', '1', '127.0.0.1', 'api/goods/update', '2026-03-27 00:21:41', 'POST api/goods/update; code=200');
INSERT INTO `ntp_common_admin_log` VALUES ('6', 'admin', '1', '127.0.0.1', 'api/wares/update', '2026-03-27 00:22:24', 'POST api/wares/update; code=200');

-- ----------------------------
-- Table structure for ntp_common_admin_token
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_admin_token`;
CREATE TABLE `ntp_common_admin_token` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '登陆凭证',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `admin_uid` int(10) DEFAULT NULL COMMENT '管理员ID',
  `type` tinyint(4) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台确定单点登陆';

-- ----------------------------
-- Records of ntp_common_admin_token
-- ----------------------------
INSERT INTO `ntp_common_admin_token` VALUES ('4', '4d62a3978d43e91cd6a20dfb6cc40655', '2026-03-26 22:05:38', '1', '1');

-- ----------------------------
-- Table structure for ntp_common_ads
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_ads`;
CREATE TABLE `ntp_common_ads` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `add_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1' COMMENT '是否显示 1是 ',
  `img` varchar(200) CHARACTER SET utf8mb4 DEFAULT '' COMMENT '图片地址',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '轮播图',
  `is_type` tinyint(1) NOT NULL DEFAULT '0' COMMENT '类型：0：图片；1：文章',
  `url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '文章内容',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='轮播图';

-- ----------------------------
-- Records of ntp_common_ads
-- ----------------------------
INSERT INTO `ntp_common_ads` VALUES ('30', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_1.png', '1', '1', '0', 'https://example.com/ad/1', '广告内容1');
INSERT INTO `ntp_common_ads` VALUES ('31', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_2.png', '2', '1', '0', 'https://example.com/ad/2', '广告内容2');
INSERT INTO `ntp_common_ads` VALUES ('32', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_3.png', '3', '1', '0', 'https://example.com/ad/3', '广告内容3');
INSERT INTO `ntp_common_ads` VALUES ('33', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_4.png', '4', '1', '0', 'https://example.com/ad/4', '广告内容4');
INSERT INTO `ntp_common_ads` VALUES ('34', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_5.png', '5', '1', '0', 'https://example.com/ad/5', '广告内容5');
INSERT INTO `ntp_common_ads` VALUES ('35', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_6.png', '6', '1', '0', 'https://example.com/ad/6', '广告内容6');
INSERT INTO `ntp_common_ads` VALUES ('36', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_7.png', '7', '1', '0', 'https://example.com/ad/7', '广告内容7');
INSERT INTO `ntp_common_ads` VALUES ('37', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_8.png', '8', '1', '0', 'https://example.com/ad/8', '广告内容8');
INSERT INTO `ntp_common_ads` VALUES ('38', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_9.png', '9', '1', '0', 'https://example.com/ad/9', '广告内容9');
INSERT INTO `ntp_common_ads` VALUES ('39', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_10.png', '10', '1', '0', 'https://example.com/ad/10', '广告内容10');
INSERT INTO `ntp_common_ads` VALUES ('40', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_11.png', '11', '1', '0', 'https://example.com/ad/11', '广告内容11');
INSERT INTO `ntp_common_ads` VALUES ('41', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_12.png', '12', '1', '0', 'https://example.com/ad/12', '广告内容12');
INSERT INTO `ntp_common_ads` VALUES ('42', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_13.png', '13', '1', '0', 'https://example.com/ad/13', '广告内容13');
INSERT INTO `ntp_common_ads` VALUES ('43', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_14.png', '14', '1', '0', 'https://example.com/ad/14', '广告内容14');
INSERT INTO `ntp_common_ads` VALUES ('44', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_15.png', '15', '1', '0', 'https://example.com/ad/15', '广告内容15');
INSERT INTO `ntp_common_ads` VALUES ('45', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_16.png', '16', '1', '0', 'https://example.com/ad/16', '广告内容16');
INSERT INTO `ntp_common_ads` VALUES ('46', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_17.png', '17', '1', '0', 'https://example.com/ad/17', '广告内容17');
INSERT INTO `ntp_common_ads` VALUES ('47', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_18.png', '18', '1', '0', 'https://example.com/ad/18', '广告内容18');
INSERT INTO `ntp_common_ads` VALUES ('48', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_19.png', '19', '1', '0', 'https://example.com/ad/19', '广告内容19');
INSERT INTO `ntp_common_ads` VALUES ('49', '2026-03-27 00:30:38', '1', '/uploads/ads/202603/ad_260327003038_20.png', '20', '1', '0', 'https://example.com/ad/20', '广告内容20');

-- ----------------------------
-- Table structure for ntp_common_agent_level_config
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_agent_level_config`;
CREATE TABLE `ntp_common_agent_level_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `level` int(11) NOT NULL COMMENT '代理级别 1-7',
  `level_name` varchar(50) NOT NULL COMMENT '级别名称',
  `required_members` int(11) NOT NULL COMMENT '需要的充值会员数量',
  `member_type` varchar(10) NOT NULL COMMENT '会员类型 LV1或LV123',
  `reward_amount` decimal(12,2) NOT NULL COMMENT '一次性奖励金额',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='代理级别配置表';

-- ----------------------------
-- Records of ntp_common_agent_level_config
-- ----------------------------
INSERT INTO `ntp_common_agent_level_config` VALUES ('1', '1', '见习组长', '30', 'LV1', '8000.00');
INSERT INTO `ntp_common_agent_level_config` VALUES ('2', '2', '市场主管', '300', 'LV123', '15000.00');
INSERT INTO `ntp_common_agent_level_config` VALUES ('3', '3', '市场经理', '500', 'LV123', '45000.00');
INSERT INTO `ntp_common_agent_level_config` VALUES ('4', '4', '市场总经理', '800', 'LV123', '90000.00');
INSERT INTO `ntp_common_agent_level_config` VALUES ('5', '5', '大区经理', '1200', 'LV123', '200000.00');
INSERT INTO `ntp_common_agent_level_config` VALUES ('6', '6', '大区总经理', '3000', 'LV123', '500000.00');
INSERT INTO `ntp_common_agent_level_config` VALUES ('7', '7', '城市合作伙伴', '5000', 'LV1', '1000000.00');

-- ----------------------------
-- Table structure for ntp_common_agent_path
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_agent_path`;
CREATE TABLE `ntp_common_agent_path` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL COMMENT '用户id',
  `path` varchar(255) NOT NULL COMMENT '用户所有上一级',
  `agent_id` int(11) NOT NULL COMMENT '直属代理ID',
  `times` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户所有上一级';

-- ----------------------------
-- Records of ntp_common_agent_path
-- ----------------------------
INSERT INTO `ntp_common_agent_path` VALUES ('1', '1003', '0/1003', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('2', '1033', '0/1033', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('3', '1031', '0/1031', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('4', '1009', '0/1009', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('5', '1009', '0/1009', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('6', '1010', '0/1010', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('7', '1031', '0/1031', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('8', '1029', '0/1029', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('9', '1034', '0/1034', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('10', '1031', '0/1031', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('11', '1001', '0/1001', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('12', '1005', '0/1005', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('13', '1010', '0/1010', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('14', '1032', '0/1032', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('15', '1010', '0/1010', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('16', '1032', '0/1032', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('17', '3', '0/3', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('18', '1009', '0/1009', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('19', '1002', '0/1002', '0', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_agent_path` VALUES ('20', '1002', '0/1002', '0', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_email
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_email`;
CREATE TABLE `ntp_common_email` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL DEFAULT '0',
  `title` varchar(255) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `is_send` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未发送 1 已发送',
  `is_read` tinyint(4) NOT NULL DEFAULT '0' COMMENT '0 未读 1 已读',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '变化时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='邮件发送表';

-- ----------------------------
-- Records of ntp_common_email
-- ----------------------------
INSERT INTO `ntp_common_email` VALUES ('1', '1014', '站内邮件1', '邮件内容1', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('2', '1009', '站内邮件2', '邮件内容2', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('3', '1009', '站内邮件3', '邮件内容3', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('4', '1008', '站内邮件4', '邮件内容4', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('5', '3', '站内邮件5', '邮件内容5', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('6', '1005', '站内邮件6', '邮件内容6', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('7', '1012', '站内邮件7', '邮件内容7', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('8', '1016', '站内邮件8', '邮件内容8', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('9', '1002', '站内邮件9', '邮件内容9', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('10', '1003', '站内邮件10', '邮件内容10', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('11', '1008', '站内邮件11', '邮件内容11', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('12', '1014', '站内邮件12', '邮件内容12', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('13', '1003', '站内邮件13', '邮件内容13', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('14', '1018', '站内邮件14', '邮件内容14', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('15', '1014', '站内邮件15', '邮件内容15', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('16', '1009', '站内邮件16', '邮件内容16', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('17', '1003', '站内邮件17', '邮件内容17', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('18', '1013', '站内邮件18', '邮件内容18', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('19', '1013', '站内邮件19', '邮件内容19', '1', '1', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_email` VALUES ('20', '1005', '站内邮件20', '邮件内容20', '1', '0', '2026-03-27 00:30:38', '2026-03-27 00:30:38', '2026-03-27 00:30:38');

-- ----------------------------
-- Table structure for ntp_common_gift_code
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_gift_code`;
CREATE TABLE `ntp_common_gift_code` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `amount` decimal(12,2) NOT NULL,
  `total_count` int(11) NOT NULL,
  `used_count` int(11) DEFAULT '0',
  `expire_time` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_code` (`code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='礼品码表';

-- ----------------------------
-- Records of ntp_common_gift_code
-- ----------------------------
INSERT INTO `ntp_common_gift_code` VALUES ('41', 'GIFTCBC88BE364', '2', '42.43', '63', '10', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('42', 'GIFT57BE48F1FA', '1', '84.61', '73', '2', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('43', 'GIFTA7A550C120', '2', '31.36', '27', '3', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('44', 'GIFT98CC3F93EB', '1', '122.67', '70', '0', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('45', 'GIFT141495C311', '2', '99.62', '72', '10', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('46', 'GIFT3DA1C23B18', '1', '27.57', '48', '10', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('47', 'GIFT58887F2DDF', '2', '54.30', '84', '8', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('48', 'GIFTBF4DD8C247', '1', '49.20', '72', '6', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('49', 'GIFT8C481DCDA4', '2', '87.32', '26', '5', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('50', 'GIFT28270E4C24', '1', '64.83', '27', '4', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('51', 'GIFT41CB1A0C7E', '2', '64.67', '65', '1', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('52', 'GIFTDA837BB670', '1', '178.91', '45', '4', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('53', 'GIFT64B6F965EA', '2', '45.53', '73', '0', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('54', 'GIFT8DD8B3A26B', '1', '116.29', '59', '2', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('55', 'GIFT5F2EA7B9BA', '2', '189.27', '28', '0', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('56', 'GIFT5C408D2696', '1', '47.19', '26', '9', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('57', 'GIFTE6FFE80533', '2', '43.24', '95', '5', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('58', 'GIFT11FAD6F639', '1', '166.70', '62', '0', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('59', 'GIFTDBB04E38FF', '2', '24.26', '100', '1', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code` VALUES ('60', 'GIFT5F7833634B', '1', '92.27', '81', '1', '2026-06-25 00:37:19', '1', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_gift_code_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_gift_code_log`;
CREATE TABLE `ntp_common_gift_code_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `gift_code_id` int(11) NOT NULL,
  `code` varchar(50) NOT NULL,
  `type` tinyint(1) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_code` (`user_id`,`gift_code_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='礼品码使用记录';

-- ----------------------------
-- Records of ntp_common_gift_code_log
-- ----------------------------
INSERT INTO `ntp_common_gift_code_log` VALUES ('20', '1010', '44', 'GIFT98CC3F93EB', '1', '122.67', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('21', '1030', '57', 'GIFTE6FFE80533', '2', '43.24', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('22', '1031', '49', 'GIFT8C481DCDA4', '2', '87.32', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('23', '1004', '60', 'GIFT5F7833634B', '1', '92.27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('24', '1031', '58', 'GIFT11FAD6F639', '1', '166.70', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('25', '1032', '47', 'GIFT58887F2DDF', '2', '54.30', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('26', '1008', '53', 'GIFT64B6F965EA', '2', '45.53', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('27', '1001', '58', 'GIFT11FAD6F639', '1', '166.70', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('28', '1005', '48', 'GIFTBF4DD8C247', '1', '49.20', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('29', '3', '42', 'GIFT57BE48F1FA', '1', '84.61', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('30', '1029', '41', 'GIFTCBC88BE364', '2', '42.43', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('31', '1029', '55', 'GIFT5F2EA7B9BA', '2', '189.27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('32', '1002', '56', 'GIFT5C408D2696', '1', '47.19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('33', '1028', '42', 'GIFT57BE48F1FA', '1', '84.61', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('34', '1027', '48', 'GIFTBF4DD8C247', '1', '49.20', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('35', '1032', '55', 'GIFT5F2EA7B9BA', '2', '189.27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('36', '1034', '43', 'GIFTA7A550C120', '2', '31.36', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('37', '1000', '59', 'GIFTDBB04E38FF', '2', '24.26', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('38', '1027', '54', 'GIFT8DD8B3A26B', '1', '116.29', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_gift_code_log` VALUES ('39', '3', '50', 'GIFT28270E4C24', '1', '64.83', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_goods
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_goods`;
CREATE TABLE `ntp_common_goods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `goods_type_id` int(12) NOT NULL COMMENT '商品分类',
  `goods_name` varchar(50) NOT NULL COMMENT '商品名称',
  `goods_money` decimal(20,2) NOT NULL COMMENT '投注价格',
  `project_scale` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '万元 项目规模',
  `day_red` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '每日分红(单次收益金额)',
  `income_times_per_day` int(11) NOT NULL DEFAULT '1' COMMENT '每天收益次数',
  `income_per_time` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '单次收益金额',
  `total_money` decimal(20,2) NOT NULL COMMENT '总收益',
  `revenue_lv` decimal(10,2) NOT NULL COMMENT '收益率',
  `period` int(12) NOT NULL DEFAULT '0' COMMENT '投资周期',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 上架，2即将推出，0下架',
  `red_way` int(12) NOT NULL DEFAULT '1' COMMENT '1 到期还本还息  2 每日返息到期还本',
  `warrant` varchar(50) NOT NULL COMMENT '担保公司',
  `create_time` datetime NOT NULL,
  `head_img` text COMMENT '封面图，顶部图',
  `bottom_img` text COMMENT '详情下图',
  `is_examine` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 是新手体验产品',
  `sort` int(12) NOT NULL DEFAULT '0' COMMENT '商品排序',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可用优惠卷，0 不可用。1可用',
  `del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 正常，1 删除',
  `progress_rate` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '投资进度',
  `goods_agent_1` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '一级返佣',
  `goods_agent_2` decimal(12,2) NOT NULL DEFAULT '0.00',
  `goods_agent_3` decimal(12,2) NOT NULL DEFAULT '0.00',
  `buy_num` int(11) NOT NULL DEFAULT '0' COMMENT '0无限次 可以购买次数',
  `level_vip` int(11) NOT NULL DEFAULT '0' COMMENT '可购买等级  0 随便购买',
  `minute_claim` int(11) NOT NULL COMMENT '多少分钟可以领取一次',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目表';

-- ----------------------------
-- Records of ntp_common_goods
-- ----------------------------
INSERT INTO `ntp_common_goods` VALUES ('1', '1', 'Produit d\'expérience', '0.00', '0.00', '110.00', '1', '110.00', '330.00', '0.00', '3', '1', '2', 'AVIVA', '2026-03-23 15:15:07', '/uploads/goods/202603/2474509094c23831f094325219b48e16.jpeg', null, '1', '1', '1', '0', '0.00', '0.00', '0.00', '0.00', '1', '0', '0');
INSERT INTO `ntp_common_goods` VALUES ('2', '1', 'Revenu fixe 1', '8000.00', '0.00', '330.00', '3', '110.00', '120450.00', '24.24', '365', '1', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '2', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '480');
INSERT INTO `ntp_common_goods` VALUES ('3', '1', 'Revenu fixe 2', '45000.00', '0.00', '1600.00', '5', '320.00', '584000.00', '28.13', '365', '1', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '3', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '288');
INSERT INTO `ntp_common_goods` VALUES ('4', '1', 'Revenu fixe 3', '100000.00', '0.00', '3600.00', '10', '360.00', '1314000.00', '27.78', '365', '2', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '4', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '144');
INSERT INTO `ntp_common_goods` VALUES ('5', '1', 'Revenu fixe 4', '380000.00', '0.00', '14250.00', '15', '950.00', '5201250.00', '26.67', '365', '2', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '5', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '96');
INSERT INTO `ntp_common_goods` VALUES ('6', '1', 'Revenu fixe 5', '800000.00', '0.00', '31000.00', '20', '1550.00', '11315000.00', '25.81', '365', '2', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '6', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '72');
INSERT INTO `ntp_common_goods` VALUES ('7', '1', 'Revenu fixe 6', '1600000.00', '0.00', '64500.00', '30', '2150.00', '23542500.00', '24.81', '365', '2', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '7', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '48');
INSERT INTO `ntp_common_goods` VALUES ('8', '1', 'Revenu fixe 7', '3000000.00', '0.00', '160000.00', '40', '4000.00', '58400000.00', '18.75', '365', '2', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '8', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '36');
INSERT INTO `ntp_common_goods` VALUES ('9', '1', 'Revenu fixe 8', '7000000.00', '0.00', '410000.00', '50', '8200.00', '149650000.00', '17.07', '365', '2', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '9', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '29');
INSERT INTO `ntp_common_goods` VALUES ('10', '1', 'Revenu fixe 9', '13000000.00', '0.00', '810000.00', '60', '13500.00', '295650000.00', '16.05', '365', '2', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '10', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '24');
INSERT INTO `ntp_common_goods` VALUES ('11', '1', 'Revenu fixe 10', '18000000.00', '0.00', '1200000.00', '80', '15000.00', '438000000.00', '15.00', '365', '2', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '0', '11', '1', '0', '0.00', '0.00', '0.00', '0.00', '0', '0', '18');
INSERT INTO `ntp_common_goods` VALUES ('12', '2', 'Periodic 1', '1000.00', '0.00', '15.00', '1', '15.00', '45.00', '1.50', '3', '1', '2', 'AVIVA', '2026-03-24 12:08:10', null, null, '0', '12', '1', '0', '0.00', '0.10', '0.03', '0.01', '5', '0', '1440');
INSERT INTO `ntp_common_goods` VALUES ('13', '2', 'Periodic 2', '3000.00', '0.00', '54.00', '1', '54.00', '378.00', '1.80', '7', '1', '2', 'AVIVA', '2026-03-24 12:08:10', null, null, '0', '13', '1', '0', '0.00', '0.10', '0.03', '0.01', '5', '0', '1440');
INSERT INTO `ntp_common_goods` VALUES ('14', '2', 'Periodic 3', '5000.00', '0.00', '110.00', '1', '110.00', '3300.00', '2.20', '30', '1', '2', 'AVIVA', '2026-03-24 12:08:10', null, null, '0', '14', '1', '0', '0.00', '0.10', '0.03', '0.01', '5', '0', '1440');
INSERT INTO `ntp_common_goods` VALUES ('15', '2', 'Periodic 4', '8000.00', '0.00', '200.00', '1', '200.00', '18000.00', '2.50', '90', '1', '2', 'AVIVA', '2026-03-24 12:08:10', null, null, '0', '15', '1', '0', '0.00', '0.10', '0.03', '0.01', '5', '0', '1440');
INSERT INTO `ntp_common_goods` VALUES ('16', '2', 'Periodic 5', '10000.00', '0.00', '280.00', '1', '280.00', '50400.00', '2.80', '180', '1', '2', 'AVIVA', '2026-03-24 12:08:10', null, null, '0', '16', '1', '0', '0.00', '0.10', '0.03', '0.01', '5', '0', '1440');
INSERT INTO `ntp_common_goods` VALUES ('17', '2', 'Periodic 6', '15000.00', '0.00', '525.00', '1', '525.00', '191625.00', '3.50', '365', '1', '2', 'AVIVA', '2026-03-24 12:08:10', null, null, '0', '17', '1', '0', '0.00', '0.10', '0.03', '0.01', '5', '0', '1440');
INSERT INTO `ntp_common_goods` VALUES ('24', '3', '产品260327003719_18', '2154.90', '67.22', '184.48', '2', '96.73', '7932.64', '14.85', '43', '0', '1', '担保公司18', '2026-03-27 00:37:19', '/uploads/goods/202603/goods_260327003719_18.png', '/uploads/goods/202603/goods_detail_260327003719_18.png', '0', '18', '1', '0', '6.82', '10.79', '29.09', '1.06', '5', '7', '115');
INSERT INTO `ntp_common_goods` VALUES ('25', '3', '产品260327003719_19', '977.35', '58.29', '87.13', '2', '43.81', '1132.69', '10.69', '13', '1', '2', '担保公司19', '2026-03-27 00:37:19', '/uploads/goods/202603/goods_260327003719_19.png', '/uploads/goods/202603/goods_detail_260327003719_19.png', '1', '19', '1', '0', '31.63', '36.91', '28.70', '1.38', '5', '10', '36');
INSERT INTO `ntp_common_goods` VALUES ('26', '5', '产品260327003719_20', '2488.60', '27.84', '16.96', '3', '76.64', '763.20', '23.64', '45', '2', '1', '担保公司20', '2026-03-27 00:37:19', '/uploads/goods/202603/goods_260327003719_20.png', '/uploads/goods/202603/goods_detail_260327003719_20.png', '0', '20', '1', '0', '60.86', '14.45', '26.58', '1.51', '5', '0', '55');

-- ----------------------------
-- Table structure for ntp_common_goods_order
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_goods_order`;
CREATE TABLE `ntp_common_goods_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `user_name` varchar(50) NOT NULL,
  `goods_name` varchar(50) NOT NULL,
  `goods_id` int(11) NOT NULL,
  `goods_type_id` int(11) NOT NULL COMMENT '商品类型id',
  `goods_money` decimal(12,2) NOT NULL COMMENT '商品价格',
  `goods_type_name` varchar(50) NOT NULL,
  `total_red_money` decimal(20,2) NOT NULL COMMENT '全部应该获得的分红金额',
  `already_red_money` decimal(20,2) NOT NULL COMMENT '已经获得的分红金额',
  `surplus_red_money` decimal(20,2) NOT NULL COMMENT '剩余应该获得的分红',
  `red_day` int(12) NOT NULL DEFAULT '0' COMMENT '总分红天数',
  `already_red_day` int(11) NOT NULL COMMENT '已经分红的天数',
  `surplus_red_day` int(11) NOT NULL COMMENT '剩余分红的天数',
  `next_red_date` datetime NOT NULL COMMENT '下次分红日期',
  `last_red_date` datetime NOT NULL COMMENT '上次分红时间，默认是创建时间',
  `order_money` decimal(20,2) NOT NULL COMMENT '订单金额',
  `order_number` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `update_time` datetime NOT NULL COMMENT '更新时间',
  `is_coupon` tinyint(1) NOT NULL DEFAULT '0' COMMENT ' 使用优惠卷的优惠卷 ID  0表示没使用优惠卷',
  `coupon_money` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '使用优惠卷时优惠卷金额',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0正常 1 返佣完成，正在分红中，2 分红完成利息返回完成  3 本金返回完成 -1删除',
  `order_no` varchar(200) NOT NULL COMMENT '订单号',
  `one_money` decimal(20,0) NOT NULL DEFAULT '0' COMMENT '商品单价 单件商品价',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品订单表';

-- ----------------------------
-- Records of ntp_common_goods_order
-- ----------------------------
INSERT INTO `ntp_common_goods_order` VALUES ('21', '1003', '12131', 'Periodic 5', '16', '2', '10000.00', '分类2', '50400.00', '0.00', '50400.00', '180', '0', '180', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '10000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000001', '280');
INSERT INTO `ntp_common_goods_order` VALUES ('22', '1031', 'user_2603270037190017', 'Periodic 2', '13', '2', '3000.00', '分类2', '378.00', '0.00', '378.00', '7', '0', '7', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '3000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000002', '54');
INSERT INTO `ntp_common_goods_order` VALUES ('23', '3', '12131', 'Revenu fixe 9', '10', '1', '13000000.00', '分类1', '295650000.00', '0.00', '295650000.00', '365', '0', '365', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '13000000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000003', '810000');
INSERT INTO `ntp_common_goods_order` VALUES ('24', '1034', 'user_2603270037190020', 'Periodic 1', '12', '2', '1000.00', '分类2', '45.00', '0.00', '45.00', '3', '0', '3', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '1000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000004', '15');
INSERT INTO `ntp_common_goods_order` VALUES ('25', '1000', '12131', 'Revenu fixe 10', '11', '1', '18000000.00', '分类1', '438000000.00', '0.00', '438000000.00', '365', '0', '365', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '18000000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000005', '1200000');
INSERT INTO `ntp_common_goods_order` VALUES ('26', '1031', 'user_2603270037190017', 'Periodic 3', '14', '2', '5000.00', '分类2', '3300.00', '0.00', '3300.00', '30', '0', '30', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '5000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000006', '110');
INSERT INTO `ntp_common_goods_order` VALUES ('27', '1001', '12131', '产品260327003719_19', '25', '3', '977.35', '分类3', '1132.69', '0.00', '1132.69', '13', '0', '13', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '977.35', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000007', '87');
INSERT INTO `ntp_common_goods_order` VALUES ('28', '1005', '12131', 'Periodic 3', '14', '2', '5000.00', '分类2', '3300.00', '0.00', '3300.00', '30', '0', '30', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '5000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000008', '110');
INSERT INTO `ntp_common_goods_order` VALUES ('29', '3', '12131', 'Revenu fixe 2', '3', '1', '45000.00', '分类1', '584000.00', '0.00', '584000.00', '365', '0', '365', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '45000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000009', '1600');
INSERT INTO `ntp_common_goods_order` VALUES ('30', '1032', 'user_2603270037190018', 'Revenu fixe 1', '2', '1', '8000.00', '分类1', '120450.00', '0.00', '120450.00', '365', '0', '365', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '8000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000010', '330');
INSERT INTO `ntp_common_goods_order` VALUES ('31', '1027', 'user_2603270037190013', 'Periodic 4', '15', '2', '8000.00', '分类2', '18000.00', '0.00', '18000.00', '90', '0', '90', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '8000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000011', '200');
INSERT INTO `ntp_common_goods_order` VALUES ('32', '1005', '12131', 'Produit d\'expérience', '1', '1', '0.00', '分类1', '330.00', '0.00', '330.00', '3', '0', '3', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '0.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000012', '110');
INSERT INTO `ntp_common_goods_order` VALUES ('33', '1006', '12131', 'Revenu fixe 3', '4', '1', '100000.00', '分类1', '1314000.00', '0.00', '1314000.00', '365', '0', '365', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '100000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000013', '3600');
INSERT INTO `ntp_common_goods_order` VALUES ('34', '1008', '12131', 'Periodic 1', '12', '2', '1000.00', '分类2', '45.00', '0.00', '45.00', '3', '0', '3', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '1000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000014', '15');
INSERT INTO `ntp_common_goods_order` VALUES ('35', '1033', 'user_2603270037190019', 'Revenu fixe 7', '8', '1', '3000000.00', '分类1', '58400000.00', '0.00', '58400000.00', '365', '0', '365', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '3000000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000015', '160000');
INSERT INTO `ntp_common_goods_order` VALUES ('36', '1002', '12131', 'Periodic 3', '14', '2', '5000.00', '分类2', '3300.00', '0.00', '3300.00', '30', '0', '30', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '5000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000016', '110');
INSERT INTO `ntp_common_goods_order` VALUES ('37', '1007', '12131', '产品260327003719_18', '24', '3', '2154.90', '分类3', '7932.64', '0.00', '7932.64', '43', '0', '43', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '2154.90', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000017', '184');
INSERT INTO `ntp_common_goods_order` VALUES ('38', '1031', 'user_2603270037190017', 'Revenu fixe 2', '3', '1', '45000.00', '分类1', '584000.00', '0.00', '584000.00', '365', '0', '365', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '45000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000018', '1600');
INSERT INTO `ntp_common_goods_order` VALUES ('39', '1003', '12131', 'Revenu fixe 10', '11', '1', '18000000.00', '分类1', '438000000.00', '0.00', '438000000.00', '365', '0', '365', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '18000000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000019', '1200000');
INSERT INTO `ntp_common_goods_order` VALUES ('40', '1033', 'user_2603270037190019', 'Periodic 3', '14', '2', '5000.00', '分类2', '3300.00', '0.00', '3300.00', '30', '0', '30', '2026-03-28 00:37:19', '2026-03-27 00:37:19', '5000.00', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '0', '0.00', '0', 'GO260327003719000020', '110');

-- ----------------------------
-- Table structure for ntp_common_home_token
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_home_token`;
CREATE TABLE `ntp_common_home_token` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL COMMENT '登陆凭证',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `user_id` int(10) DEFAULT NULL COMMENT '管理员ID',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='前台token';

-- ----------------------------
-- Records of ntp_common_home_token
-- ----------------------------
INSERT INTO `ntp_common_home_token` VALUES ('1', '93008da141ded594d8ba275ff948d007', '2026-03-24 22:00:48', '2');

-- ----------------------------
-- Table structure for ntp_common_income_claim_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_income_claim_log`;
CREATE TABLE `ntp_common_income_claim_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `order_id` int(11) NOT NULL COMMENT '订单ID',
  `claim_amount` decimal(12,2) NOT NULL COMMENT '领取金额',
  `claim_time` datetime DEFAULT NULL COMMENT '领取时间',
  `expire_time` datetime NOT NULL COMMENT '过期时间',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0待领取 1已领取 2已过期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '商品id',
  `date_time` date NOT NULL COMMENT '发放的年月日',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_order` (`user_id`,`order_id`) USING BTREE,
  KEY `idx_status` (`status`,`expire_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='收益领取记录表';

-- ----------------------------
-- Records of ntp_common_income_claim_log
-- ----------------------------
INSERT INTO `ntp_common_income_claim_log` VALUES ('21', '1001', '27', '43.61', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '25', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('22', '1005', '28', '46.95', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '14', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('23', '1008', '34', '17.04', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '12', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('24', '1034', '24', '45.87', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '12', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('25', '1031', '22', '39.73', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '13', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('26', '1006', '33', '10.24', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '4', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('27', '3', '23', '1.77', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '10', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('28', '1005', '32', '13.96', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '1', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('29', '1031', '26', '31.08', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '14', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('30', '3', '23', '12.00', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '10', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('31', '1002', '36', '40.58', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '14', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('32', '1005', '28', '33.04', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '14', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('33', '1001', '27', '1.34', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '25', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('34', '1033', '35', '11.12', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '8', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('35', '1033', '40', '47.14', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '14', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('36', '3', '29', '23.60', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '3', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('37', '1034', '24', '46.74', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '12', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('38', '1031', '38', '46.56', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '3', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('39', '1005', '32', '36.82', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '1', '2026-03-27 00:37:19', '1', '2026-03-27');
INSERT INTO `ntp_common_income_claim_log` VALUES ('40', '1005', '28', '15.89', '2026-03-27 00:37:19', '2026-03-28 00:37:19', '0', '2026-03-27 00:37:19', '14', '2026-03-27');

-- ----------------------------
-- Table structure for ntp_common_lottery_chance
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_lottery_chance`;
CREATE TABLE `ntp_common_lottery_chance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `total_chance` int(11) DEFAULT '0' COMMENT '总次数',
  `used_chance` int(11) DEFAULT '0' COMMENT '已使用次数',
  `today_chance` int(11) DEFAULT '0' COMMENT '今日已转次数',
  `rest_chance` int(11) NOT NULL DEFAULT '0' COMMENT '剩余次数',
  `last_spin_date` date DEFAULT NULL COMMENT '最后转盘日期',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `expire_time` datetime DEFAULT NULL COMMENT '过期时间',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`,`user_id`) USING BTREE,
  UNIQUE KEY `uk_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户转盘次数表';

-- ----------------------------
-- Records of ntp_common_lottery_chance
-- ----------------------------
INSERT INTO `ntp_common_lottery_chance` VALUES ('1', '3', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('2', '1000', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('3', '1001', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('4', '1002', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('5', '1003', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('6', '1004', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('7', '1005', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('8', '1006', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('9', '1007', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('10', '1008', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('11', '1009', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('12', '1010', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('13', '1027', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('14', '1028', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('15', '1029', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('16', '1030', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('17', '1031', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('18', '1032', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('19', '1033', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_chance` VALUES ('20', '1034', '10', '2', '1', '8', '2026-03-27', '2026-03-27 00:37:19', '2026-04-03 00:37:19', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_lottery_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_lottery_log`;
CREATE TABLE `ntp_common_lottery_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `prize_id` int(11) NOT NULL COMMENT '奖品ID',
  `prize_name` varchar(100) NOT NULL COMMENT '奖品名称',
  `prize_type` tinyint(1) NOT NULL COMMENT '奖品类型',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '中奖金额',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户转盘记录表';

-- ----------------------------
-- Records of ntp_common_lottery_log
-- ----------------------------
INSERT INTO `ntp_common_lottery_log` VALUES ('1', '1003', '7', '充电宝', '2', '0.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('2', '1027', '9', '安卓手机', '2', '0.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('3', '1031', '9', '安卓手机', '2', '0.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('4', '1006', '2', '1000000 XAF', '1', '1000000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('5', '1006', '8', '600 XAF', '1', '600.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('6', '1028', '6', '5000 XAF', '1', '5000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('7', '1001', '5', '智能手表', '2', '0.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('8', '1003', '6', '5000 XAF', '1', '5000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('9', '1008', '6', '5000 XAF', '1', '5000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('10', '1033', '11', '1000 XAF', '1', '1000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('11', '1006', '2', '1000000 XAF', '1', '1000000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('12', '1032', '8', '600 XAF', '1', '600.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('13', '1031', '7', '充电宝', '2', '0.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('14', '3', '3', '36000 XAF', '1', '36000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('15', '1029', '7', '充电宝', '2', '0.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('16', '1008', '10', '300 XAF', '1', '300.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('17', '1029', '1', '10000 XAF', '1', '10000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('18', '1002', '10', '300 XAF', '1', '300.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('19', '1008', '6', '5000 XAF', '1', '5000.00', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_lottery_log` VALUES ('20', '1032', '4', '2000 XAF', '1', '2000.00', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_lottery_prize
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_lottery_prize`;
CREATE TABLE `ntp_common_lottery_prize` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL COMMENT '奖品名称',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '奖品类型 1现金 2实物',
  `amount` decimal(10,2) DEFAULT '0.00' COMMENT '现金金额',
  `probability` decimal(5,2) NOT NULL COMMENT '中奖概率(%)',
  `image` varchar(255) DEFAULT NULL COMMENT '奖品图片',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1启用 0禁用',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='转盘奖品配置表';

-- ----------------------------
-- Records of ntp_common_lottery_prize
-- ----------------------------
INSERT INTO `ntp_common_lottery_prize` VALUES ('1', '10000 XAF', '1', '10000.00', '15.00', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('2', '1000000 XAF', '1', '1000000.00', '0.10', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('3', '36000 XAF', '1', '36000.00', '0.30', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('4', '2000 XAF', '1', '2000.00', '2.00', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('5', '智能手表', '2', '0.00', '1.50', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('6', '5000 XAF', '1', '5000.00', '1.20', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('7', '充电宝', '2', '0.00', '1.80', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('8', '600 XAF', '1', '600.00', '5.00', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('9', '安卓手机', '2', '0.00', '2.50', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('10', '300 XAF', '1', '300.00', '8.00', null, '1', '2026-03-24 12:08:10');
INSERT INTO `ntp_common_lottery_prize` VALUES ('11', '1000 XAF', '1', '1000.00', '3.00', null, '1', '2026-03-24 12:08:10');

-- ----------------------------
-- Table structure for ntp_common_monthly_salary_config
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_monthly_salary_config`;
CREATE TABLE `ntp_common_monthly_salary_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `team_recharge_amount` decimal(20,2) NOT NULL COMMENT '团队LV1累计充值要求',
  `reward_amount` decimal(12,2) NOT NULL COMMENT '奖励金额',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='月薪奖励配置表';

-- ----------------------------
-- Records of ntp_common_monthly_salary_config
-- ----------------------------
INSERT INTO `ntp_common_monthly_salary_config` VALUES ('1', '300000.00', '3000.00', '1');
INSERT INTO `ntp_common_monthly_salary_config` VALUES ('2', '800000.00', '5000.00', '2');
INSERT INTO `ntp_common_monthly_salary_config` VALUES ('3', '1500000.00', '8000.00', '3');
INSERT INTO `ntp_common_monthly_salary_config` VALUES ('4', '3000000.00', '15000.00', '4');
INSERT INTO `ntp_common_monthly_salary_config` VALUES ('5', '8000000.00', '30000.00', '5');
INSERT INTO `ntp_common_monthly_salary_config` VALUES ('6', '30000000.00', '50000.00', '6');

-- ----------------------------
-- Table structure for ntp_common_monthly_salary_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_monthly_salary_log`;
CREATE TABLE `ntp_common_monthly_salary_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `team_recharge_amount` decimal(20,2) NOT NULL COMMENT '团队充值金额',
  `reward_amount` decimal(12,2) NOT NULL COMMENT '奖励金额',
  `claim_month` varchar(7) NOT NULL COMMENT '领取月份 格式:2026-03',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0待领取 1已领取 2已过期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_month` (`user_id`,`claim_month`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='月薪领取记录表';

-- ----------------------------
-- Records of ntp_common_monthly_salary_log
-- ----------------------------
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('1', '1005', '20616.51', '155.39', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('2', '1028', '26626.46', '180.61', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('3', '1004', '21557.13', '741.07', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('4', '1030', '24326.59', '209.33', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('5', '1009', '11077.21', '876.65', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('6', '1032', '26355.80', '580.22', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('7', '1034', '30714.96', '948.31', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('8', '1029', '17688.07', '208.35', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('9', '1010', '20190.50', '990.93', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('10', '1009', '49120.89', '118.47', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('11', '1030', '16020.83', '445.08', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('12', '1005', '30991.53', '98.39', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('13', '1005', '48367.22', '771.87', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('14', '1009', '15210.36', '380.88', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('15', '1002', '18681.02', '269.83', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('16', '1006', '28218.28', '322.77', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('17', '1029', '6706.60', '750.80', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('18', '1004', '18706.30', '365.90', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('19', '1032', '14588.71', '105.54', '2026-03', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_monthly_salary_log` VALUES ('20', '1033', '33154.24', '614.92', '2026-03', '2026-03-27 00:37:19', '1');

-- ----------------------------
-- Table structure for ntp_common_notification
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_notification`;
CREATE TABLE `ntp_common_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '通知类型: 1-系统通知, 2-交易通知',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '通知标题',
  `content` text COMMENT '通知内容',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读: 0-未读, 1-已读',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_is_read` (`is_read`) USING BTREE,
  KEY `idx_uid` (`uid`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='通知表';

-- ----------------------------
-- Records of ntp_common_notification
-- ----------------------------
INSERT INTO `ntp_common_notification` VALUES ('41', '1032', '1', '通知标题1', '通知内容1', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('42', '1004', '1', '通知标题2', '通知内容2', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('43', '1008', '1', '通知标题3', '通知内容3', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('44', '1005', '1', '通知标题4', '通知内容4', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('45', '1003', '1', '通知标题5', '通知内容5', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('46', '1008', '1', '通知标题6', '通知内容6', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('47', '1034', '1', '通知标题7', '通知内容7', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('48', '1004', '1', '通知标题8', '通知内容8', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('49', '1033', '1', '通知标题9', '通知内容9', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('50', '1007', '1', '通知标题10', '通知内容10', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('51', '1028', '1', '通知标题11', '通知内容11', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('52', '1000', '1', '通知标题12', '通知内容12', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('53', '3', '1', '通知标题13', '通知内容13', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('54', '1028', '1', '通知标题14', '通知内容14', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('55', '3', '1', '通知标题15', '通知内容15', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('56', '1031', '1', '通知标题16', '通知内容16', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('57', '1030', '1', '通知标题17', '通知内容17', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('58', '1033', '1', '通知标题18', '通知内容18', '0', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('59', '1034', '1', '通知标题19', '通知内容19', '1', '1774543039');
INSERT INTO `ntp_common_notification` VALUES ('60', '1004', '1', '通知标题20', '通知内容20', '0', '1774543039');

-- ----------------------------
-- Table structure for ntp_common_pay_cash
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_pay_cash`;
CREATE TABLE `ntp_common_pay_cash` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '提现时间',
  `success_time` datetime DEFAULT NULL COMMENT '到账时间（审核时间）',
  `money` decimal(20,2) DEFAULT NULL COMMENT '提现金额',
  `fee` decimal(12,2) DEFAULT '0.00' COMMENT '手续费',
  `actual_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实际到账金额',
  `reject_reason` varchar(255) DEFAULT NULL COMMENT '拒绝原因',
  `money_before` decimal(20,2) DEFAULT NULL COMMENT '用户开始金额',
  `money_end` decimal(20,2) DEFAULT NULL COMMENT '用户结束金额，余额',
  `money_fee` decimal(20,2) DEFAULT NULL COMMENT '手续费',
  `money_actual` decimal(20,2) DEFAULT NULL COMMENT '实际到账金额',
  `msg` varchar(200) DEFAULT NULL COMMENT '备注',
  `u_id` int(10) NOT NULL COMMENT '用户ID',
  `u_ip` varchar(200) DEFAULT NULL COMMENT '用户IP',
  `u_city` varchar(200) DEFAULT NULL COMMENT '用户地区',
  `admin_uid` int(10) DEFAULT NULL COMMENT '管理员ID',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '状态 0申请提现。1打款成功。 2拒绝',
  `pay_type` varchar(200) DEFAULT NULL COMMENT '支付方式',
  `u_bank_name` varchar(200) DEFAULT NULL COMMENT '用户收款银行名',
  `u_back_card` varchar(200) DEFAULT NULL COMMENT '用户收款账号',
  `u_back_user_name` varchar(200) DEFAULT NULL COMMENT '用户收款名',
  `market_uid` int(10) DEFAULT '0' COMMENT '业务员ID',
  `trilateral_order` varchar(200) DEFAULT NULL COMMENT '三方订单号',
  `order_on` varchar(200) DEFAULT NULL COMMENT '订单号',
  `is_status` tinyint(255) NOT NULL DEFAULT '0' COMMENT '1 提交到平台',
  `channel_id` int(11) DEFAULT NULL COMMENT '支付渠道id',
  `channel_name` varchar(100) DEFAULT NULL COMMENT '支付渠道名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提现表';

-- ----------------------------
-- Records of ntp_common_pay_cash
-- ----------------------------
INSERT INTO `ntp_common_pay_cash` VALUES ('21', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '432.64', '1.96', '430.68', '', '1817.52', '1384.88', '1.96', '430.68', '提现成功', '1033', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000001', '测试提现人', '0', 'CASH2603270037191', 'ORD2603270037191', '1', '4', '支付通道4');
INSERT INTO `ntp_common_pay_cash` VALUES ('22', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '440.23', '5.04', '435.19', '', '1186.30', '746.07', '5.04', '435.19', '提现成功', '1000', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000002', '测试提现人', '0', 'CASH2603270037192', 'ORD2603270037192', '1', '15', '支付通道15');
INSERT INTO `ntp_common_pay_cash` VALUES ('23', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '205.88', '7.15', '198.73', '', '2241.22', '2035.34', '7.15', '198.73', '提现成功', '1004', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000003', '测试提现人', '0', 'CASH2603270037193', 'ORD2603270037193', '1', '19', '支付通道19');
INSERT INTO `ntp_common_pay_cash` VALUES ('24', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '417.18', '8.70', '408.48', '', '2169.92', '1752.74', '8.70', '408.48', '提现成功', '1006', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000004', '测试提现人', '0', 'CASH2603270037194', 'ORD2603270037194', '1', '8', '支付通道8');
INSERT INTO `ntp_common_pay_cash` VALUES ('25', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '64.55', '2.79', '61.76', '', '2932.49', '2867.94', '2.79', '61.76', '提现成功', '1029', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000005', '测试提现人', '0', 'CASH2603270037195', 'ORD2603270037195', '1', '12', '支付通道12');
INSERT INTO `ntp_common_pay_cash` VALUES ('26', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '426.16', '6.61', '419.55', '', '941.67', '515.51', '6.61', '419.55', '提现成功', '1010', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000006', '测试提现人', '0', 'CASH2603270037196', 'ORD2603270037196', '1', '3', '支付通道3');
INSERT INTO `ntp_common_pay_cash` VALUES ('27', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '258.95', '1.30', '257.65', '', '2567.75', '2308.80', '1.30', '257.65', '提现成功', '1000', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000007', '测试提现人', '0', 'CASH2603270037197', 'ORD2603270037197', '1', '14', '支付通道14');
INSERT INTO `ntp_common_pay_cash` VALUES ('28', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '337.33', '2.33', '335.00', '', '2277.18', '1939.85', '2.33', '335.00', '提现成功', '1006', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000008', '测试提现人', '0', 'CASH2603270037198', 'ORD2603270037198', '1', '9', '支付通道9');
INSERT INTO `ntp_common_pay_cash` VALUES ('29', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '174.49', '1.32', '173.17', '', '557.26', '382.77', '1.32', '173.17', '提现成功', '1005', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000009', '测试提现人', '0', 'CASH2603270037199', 'ORD2603270037199', '1', '5', '支付通道5');
INSERT INTO `ntp_common_pay_cash` VALUES ('30', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '51.47', '9.25', '42.22', '', '1465.37', '1413.90', '9.25', '42.22', '提现成功', '1001', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000010', '测试提现人', '0', 'CASH26032700371910', 'ORD26032700371910', '1', '18', '支付通道18');
INSERT INTO `ntp_common_pay_cash` VALUES ('31', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '193.26', '2.80', '190.46', '', '2302.29', '2109.03', '2.80', '190.46', '提现成功', '1003', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000011', '测试提现人', '0', 'CASH26032700371911', 'ORD26032700371911', '1', '16', '支付通道16');
INSERT INTO `ntp_common_pay_cash` VALUES ('32', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '65.63', '2.42', '63.21', '', '856.82', '791.19', '2.42', '63.21', '提现成功', '1027', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000012', '测试提现人', '0', 'CASH26032700371912', 'ORD26032700371912', '1', '9', '支付通道9');
INSERT INTO `ntp_common_pay_cash` VALUES ('33', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '463.65', '9.46', '454.19', '', '1020.03', '556.38', '9.46', '454.19', '提现成功', '1007', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000013', '测试提现人', '0', 'CASH26032700371913', 'ORD26032700371913', '1', '3', '支付通道3');
INSERT INTO `ntp_common_pay_cash` VALUES ('34', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '396.07', '3.00', '393.07', '', '2680.68', '2284.61', '3.00', '393.07', '提现成功', '1001', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000014', '测试提现人', '0', 'CASH26032700371914', 'ORD26032700371914', '1', '2', '支付通道2');
INSERT INTO `ntp_common_pay_cash` VALUES ('35', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '136.98', '4.18', '132.80', '', '1683.92', '1546.94', '4.18', '132.80', '提现成功', '1010', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000015', '测试提现人', '0', 'CASH26032700371915', 'ORD26032700371915', '1', '17', '支付通道17');
INSERT INTO `ntp_common_pay_cash` VALUES ('36', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '207.73', '9.95', '197.78', '', '694.67', '486.94', '9.95', '197.78', '提现成功', '1010', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000016', '测试提现人', '0', 'CASH26032700371916', 'ORD26032700371916', '1', '2', '支付通道2');
INSERT INTO `ntp_common_pay_cash` VALUES ('37', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '292.92', '8.93', '283.99', '', '1374.85', '1081.93', '8.93', '283.99', '提现成功', '1001', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000017', '测试提现人', '0', 'CASH26032700371917', 'ORD26032700371917', '1', '1', '支付通道1');
INSERT INTO `ntp_common_pay_cash` VALUES ('38', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '224.81', '3.41', '221.40', '', '1384.50', '1159.69', '3.41', '221.40', '提现成功', '1003', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000018', '测试提现人', '0', 'CASH26032700371918', 'ORD26032700371918', '1', '10', '支付通道10');
INSERT INTO `ntp_common_pay_cash` VALUES ('39', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '246.70', '3.82', '242.88', '', '2709.38', '2462.68', '3.82', '242.88', '提现成功', '1032', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000019', '测试提现人', '0', 'CASH26032700371919', 'ORD26032700371919', '1', '9', '支付通道9');
INSERT INTO `ntp_common_pay_cash` VALUES ('40', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '186.66', '9.22', '177.44', '', '1802.39', '1615.73', '9.22', '177.44', '提现成功', '1032', '127.0.0.1', 'Shanghai', '1', '1', 'bank', '测试银行', '6222333300000020', '测试提现人', '0', 'CASH26032700371920', 'ORD26032700371920', '1', '20', '支付通道20');

-- ----------------------------
-- Table structure for ntp_common_pay_channel
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_pay_channel`;
CREATE TABLE `ntp_common_pay_channel` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `json_value` text COMMENT '支付信息内容',
  `type` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 充值渠道   2 提现渠道',
  `name` varchar(100) NOT NULL COMMENT '通道名称',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '1 上架  0 下架',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='z支付渠道表';

-- ----------------------------
-- Records of ntp_common_pay_channel
-- ----------------------------
INSERT INTO `ntp_common_pay_channel` VALUES ('1', '{\"account\":\"demo1\"}', '2', '支付通道1', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('2', '{\"account\":\"demo2\"}', '1', '支付通道2', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('3', '{\"account\":\"demo3\"}', '2', '支付通道3', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('4', '{\"account\":\"demo4\"}', '1', '支付通道4', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('5', '{\"account\":\"demo5\"}', '2', '支付通道5', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('6', '{\"account\":\"demo6\"}', '1', '支付通道6', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('7', '{\"account\":\"demo7\"}', '2', '支付通道7', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('8', '{\"account\":\"demo8\"}', '1', '支付通道8', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('9', '{\"account\":\"demo9\"}', '2', '支付通道9', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('10', '{\"account\":\"demo10\"}', '1', '支付通道10', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('11', '{\"account\":\"demo11\"}', '2', '支付通道11', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('12', '{\"account\":\"demo12\"}', '1', '支付通道12', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('13', '{\"account\":\"demo13\"}', '2', '支付通道13', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('14', '{\"account\":\"demo14\"}', '1', '支付通道14', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('15', '{\"account\":\"demo15\"}', '2', '支付通道15', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('16', '{\"account\":\"demo16\"}', '1', '支付通道16', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('17', '{\"account\":\"demo17\"}', '2', '支付通道17', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('18', '{\"account\":\"demo18\"}', '1', '支付通道18', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('19', '{\"account\":\"demo19\"}', '2', '支付通道19', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_pay_channel` VALUES ('20', '{\"account\":\"demo20\"}', '1', '支付通道20', '1', '2026-03-27 00:30:38');

-- ----------------------------
-- Table structure for ntp_common_pay_coupon
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_pay_coupon`;
CREATE TABLE `ntp_common_pay_coupon` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `money` decimal(10,2) NOT NULL COMMENT '优惠卷价值',
  `type` tinyint(4) NOT NULL COMMENT '1 支付优惠卷',
  `uid` int(11) NOT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL,
  `use_time` datetime DEFAULT NULL COMMENT '使用时间',
  `status` tinyint(4) NOT NULL COMMENT '1 使用了  2未使用',
  `exp_time` datetime NOT NULL COMMENT '过期时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED COMMENT='付款优惠卷';

-- ----------------------------
-- Records of ntp_common_pay_coupon
-- ----------------------------
INSERT INTO `ntp_common_pay_coupon` VALUES ('1', '95.76', '1', '1009', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('2', '15.66', '1', '1023', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('3', '9.09', '1', '1023', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('4', '5.30', '1', '1006', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('5', '47.70', '1', '1020', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('6', '8.92', '1', '1023', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('7', '95.45', '1', '1006', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('8', '85.73', '1', '1005', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('9', '80.20', '1', '1003', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('10', '13.79', '1', '1000', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('11', '80.71', '1', '3', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('12', '87.29', '1', '1004', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('13', '13.35', '1', '1010', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('14', '21.27', '1', '1022', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('15', '36.75', '1', '1026', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('16', '92.05', '1', '1002', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('17', '36.61', '1', '1001', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('18', '87.78', '1', '1007', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('19', '64.93', '1', '1021', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');
INSERT INTO `ntp_common_pay_coupon` VALUES ('20', '38.18', '1', '1001', '2026-03-27 00:33:21', null, '0', '2026-04-26 00:33:21');

-- ----------------------------
-- Table structure for ntp_common_pay_money_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_pay_money_log`;
CREATE TABLE `ntp_common_pay_money_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '时间',
  `type` tinyint(1) NOT NULL COMMENT '类型 1收入 2支出',
  `status` int(3) NOT NULL COMMENT '详细类型 101充值  102 签到 103 用户每日收益 104 代理返佣  110 购买商品消费金额  111 购买商品消耗积分 201 提现',
  `money_type` tinyint(2) NOT NULL COMMENT '1余额 2积分',
  `money_before` decimal(30,2) DEFAULT '0.00' COMMENT '变化前金额',
  `money_end` decimal(30,2) DEFAULT '0.00' COMMENT '变化后金额',
  `money` decimal(30,2) NOT NULL COMMENT '变化金额',
  `uid` int(10) NOT NULL COMMENT '用户ID',
  `source_id` int(10) DEFAULT NULL COMMENT '源头ID',
  `market_uid` int(10) DEFAULT '0' COMMENT '业务员ID',
  `rmark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sel` (`type`,`status`,`uid`,`money_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='资金流水表';

-- ----------------------------
-- Records of ntp_common_pay_money_log
-- ----------------------------
INSERT INTO `ntp_common_pay_money_log` VALUES ('21', '2026-03-27 00:37:19', '1', '1', '1', '1449.68', '1535.65', '85.97', '1007', '1', '0', '资金流水1');
INSERT INTO `ntp_common_pay_money_log` VALUES ('22', '2026-03-27 00:37:19', '1', '1', '1', '452.38', '465.23', '12.85', '1010', '2', '0', '资金流水2');
INSERT INTO `ntp_common_pay_money_log` VALUES ('23', '2026-03-27 00:37:19', '1', '1', '1', '490.88', '584.24', '93.36', '1034', '3', '0', '资金流水3');
INSERT INTO `ntp_common_pay_money_log` VALUES ('24', '2026-03-27 00:37:19', '1', '1', '1', '498.41', '631.63', '133.22', '1033', '4', '0', '资金流水4');
INSERT INTO `ntp_common_pay_money_log` VALUES ('25', '2026-03-27 00:37:19', '1', '1', '1', '108.60', '136.98', '28.38', '1031', '5', '0', '资金流水5');
INSERT INTO `ntp_common_pay_money_log` VALUES ('26', '2026-03-27 00:37:19', '1', '1', '1', '1777.56', '1853.32', '75.76', '1007', '6', '0', '资金流水6');
INSERT INTO `ntp_common_pay_money_log` VALUES ('27', '2026-03-27 00:37:19', '1', '1', '1', '654.16', '814.57', '160.41', '1005', '7', '0', '资金流水7');
INSERT INTO `ntp_common_pay_money_log` VALUES ('28', '2026-03-27 00:37:19', '1', '1', '1', '1907.62', '1975.40', '67.78', '1004', '8', '0', '资金流水8');
INSERT INTO `ntp_common_pay_money_log` VALUES ('29', '2026-03-27 00:37:19', '1', '1', '1', '1831.73', '1862.24', '30.51', '1008', '9', '0', '资金流水9');
INSERT INTO `ntp_common_pay_money_log` VALUES ('30', '2026-03-27 00:37:19', '1', '1', '1', '644.61', '693.58', '48.97', '1028', '10', '0', '资金流水10');
INSERT INTO `ntp_common_pay_money_log` VALUES ('31', '2026-03-27 00:37:19', '1', '1', '1', '322.40', '335.32', '12.92', '1008', '11', '0', '资金流水11');
INSERT INTO `ntp_common_pay_money_log` VALUES ('32', '2026-03-27 00:37:19', '1', '1', '1', '1984.11', '2166.66', '182.55', '1007', '12', '0', '资金流水12');
INSERT INTO `ntp_common_pay_money_log` VALUES ('33', '2026-03-27 00:37:19', '1', '1', '1', '1590.80', '1626.98', '36.18', '1000', '13', '0', '资金流水13');
INSERT INTO `ntp_common_pay_money_log` VALUES ('34', '2026-03-27 00:37:19', '1', '1', '1', '944.73', '1137.75', '193.02', '1005', '14', '0', '资金流水14');
INSERT INTO `ntp_common_pay_money_log` VALUES ('35', '2026-03-27 00:37:19', '1', '1', '1', '1607.88', '1662.76', '54.88', '1000', '15', '0', '资金流水15');
INSERT INTO `ntp_common_pay_money_log` VALUES ('36', '2026-03-27 00:37:19', '1', '1', '1', '1778.43', '1963.10', '184.67', '1034', '16', '0', '资金流水16');
INSERT INTO `ntp_common_pay_money_log` VALUES ('37', '2026-03-27 00:37:19', '1', '1', '1', '1493.64', '1658.44', '164.80', '1033', '17', '0', '资金流水17');
INSERT INTO `ntp_common_pay_money_log` VALUES ('38', '2026-03-27 00:37:19', '1', '1', '1', '870.63', '1018.57', '147.94', '1030', '18', '0', '资金流水18');
INSERT INTO `ntp_common_pay_money_log` VALUES ('39', '2026-03-27 00:37:19', '1', '1', '1', '448.23', '469.91', '21.68', '1007', '19', '0', '资金流水19');
INSERT INTO `ntp_common_pay_money_log` VALUES ('40', '2026-03-27 00:37:19', '1', '1', '1', '217.24', '406.12', '188.88', '1003', '20', '0', '资金流水20');

-- ----------------------------
-- Table structure for ntp_common_pay_recharge
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_pay_recharge`;
CREATE TABLE `ntp_common_pay_recharge` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `create_time` datetime DEFAULT NULL COMMENT '充值时间',
  `expire_at` datetime DEFAULT NULL COMMENT '订单过期时间',
  `success_time` datetime DEFAULT NULL COMMENT '到账时间(审核时间)',
  `money` decimal(20,2) DEFAULT NULL COMMENT '充值金额',
  `actual_amount` decimal(12,2) DEFAULT '0.00' COMMENT '实际到账金额',
  `admin_uid` int(10) DEFAULT NULL COMMENT '管理员ID',
  `uid` int(10) DEFAULT NULL COMMENT '用户ID',
  `u_ip` varchar(200) DEFAULT NULL COMMENT '用户ip',
  `u_city` varchar(200) DEFAULT NULL COMMENT '地区',
  `sys_bank_id` varchar(200) DEFAULT NULL COMMENT '收款账号',
  `u_bank_name` varchar(200) DEFAULT NULL COMMENT '打款银行名',
  `u_bank_user_name` varchar(200) DEFAULT NULL COMMENT '打款用户名',
  `u_bank_card` varchar(200) DEFAULT NULL COMMENT '打款银行卡号',
  `market_uid` int(10) DEFAULT '0' COMMENT '业务员ID',
  `order_no` varchar(200) DEFAULT NULL COMMENT '充值订单编号',
  `status` int(11) NOT NULL DEFAULT '0' COMMENT '充值订单状态 0创建订单  1待支付  2支付成功 3支付失败，拒绝支付',
  `trilateral_order` varchar(200) DEFAULT NULL COMMENT '三方订单号',
  `money_end` decimal(20,2) DEFAULT NULL,
  `money_before` decimal(20,2) DEFAULT NULL,
  `channel_id` int(11) DEFAULT NULL COMMENT '支付渠道id',
  `channel_name` varchar(100) DEFAULT NULL COMMENT '支付渠道名称',
  `image_url` text COMMENT '图片凭证地址',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='充值表';

-- ----------------------------
-- Records of ntp_common_pay_recharge
-- ----------------------------
INSERT INTO `ntp_common_pay_recharge` VALUES ('21', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '329.84', '329.84', '1', '1034', '127.0.0.1', 'Shanghai', 'BANK1', '测试银行', '测试姓名', '6222000000000001', '0', 'RC260327003719000001', '1', 'TRI2603270037191', '2045.84', '1716.00', '5', '支付通道5', '/uploads/recharge/202603/voucher_1.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('22', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '384.81', '384.81', '1', '3', '127.0.0.1', 'Shanghai', 'BANK2', '测试银行', '测试姓名', '6222000000000002', '0', 'RC260327003719000002', '1', 'TRI2603270037192', '4877.36', '4492.55', '2', '支付通道2', '/uploads/recharge/202603/voucher_2.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('23', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '111.33', '111.33', '1', '1010', '127.0.0.1', 'Shanghai', 'BANK3', '测试银行', '测试姓名', '6222000000000003', '0', 'RC260327003719000003', '1', 'TRI2603270037193', '689.81', '578.48', '1', '支付通道1', '/uploads/recharge/202603/voucher_3.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('24', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '120.03', '120.03', '1', '1033', '127.0.0.1', 'Shanghai', 'BANK4', '测试银行', '测试姓名', '6222000000000004', '0', 'RC260327003719000004', '1', 'TRI2603270037194', '2355.48', '2235.45', '20', '支付通道20', '/uploads/recharge/202603/voucher_4.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('25', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '213.87', '213.87', '1', '1032', '127.0.0.1', 'Shanghai', 'BANK5', '测试银行', '测试姓名', '6222000000000005', '0', 'RC260327003719000005', '1', 'TRI2603270037195', '3576.78', '3362.91', '6', '支付通道6', '/uploads/recharge/202603/voucher_5.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('26', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '456.48', '456.48', '1', '1002', '127.0.0.1', 'Shanghai', 'BANK6', '测试银行', '测试姓名', '6222000000000006', '0', 'RC260327003719000006', '1', 'TRI2603270037196', '4939.44', '4482.96', '3', '支付通道3', '/uploads/recharge/202603/voucher_6.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('27', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '167.13', '167.13', '1', '1008', '127.0.0.1', 'Shanghai', 'BANK7', '测试银行', '测试姓名', '6222000000000007', '0', 'RC260327003719000007', '1', 'TRI2603270037197', '4609.73', '4442.60', '5', '支付通道5', '/uploads/recharge/202603/voucher_7.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('28', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '390.79', '390.79', '1', '1007', '127.0.0.1', 'Shanghai', 'BANK8', '测试银行', '测试姓名', '6222000000000008', '0', 'RC260327003719000008', '1', 'TRI2603270037198', '3662.94', '3272.15', '16', '支付通道16', '/uploads/recharge/202603/voucher_8.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('29', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '748.57', '748.57', '1', '1028', '127.0.0.1', 'Shanghai', 'BANK9', '测试银行', '测试姓名', '6222000000000009', '0', 'RC260327003719000009', '1', 'TRI2603270037199', '2254.05', '1505.48', '6', '支付通道6', '/uploads/recharge/202603/voucher_9.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('30', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '708.32', '708.32', '1', '1003', '127.0.0.1', 'Shanghai', 'BANK10', '测试银行', '测试姓名', '6222000000000010', '0', 'RC260327003719000010', '1', 'TRI26032700371910', '5058.03', '4349.71', '13', '支付通道13', '/uploads/recharge/202603/voucher_10.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('31', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '957.31', '957.31', '1', '1034', '127.0.0.1', 'Shanghai', 'BANK11', '测试银行', '测试姓名', '6222000000000011', '0', 'RC260327003719000011', '1', 'TRI26032700371911', '3498.62', '2541.31', '19', '支付通道19', '/uploads/recharge/202603/voucher_11.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('32', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '689.88', '689.88', '1', '3', '127.0.0.1', 'Shanghai', 'BANK12', '测试银行', '测试姓名', '6222000000000012', '0', 'RC260327003719000012', '1', 'TRI26032700371912', '2468.19', '1778.31', '4', '支付通道4', '/uploads/recharge/202603/voucher_12.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('33', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '299.87', '299.87', '1', '1003', '127.0.0.1', 'Shanghai', 'BANK13', '测试银行', '测试姓名', '6222000000000013', '0', 'RC260327003719000013', '1', 'TRI26032700371913', '3961.31', '3661.44', '20', '支付通道20', '/uploads/recharge/202603/voucher_13.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('34', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '931.83', '931.83', '1', '1002', '127.0.0.1', 'Shanghai', 'BANK14', '测试银行', '测试姓名', '6222000000000014', '0', 'RC260327003719000014', '1', 'TRI26032700371914', '4025.05', '3093.22', '18', '支付通道18', '/uploads/recharge/202603/voucher_14.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('35', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '679.67', '679.67', '1', '3', '127.0.0.1', 'Shanghai', 'BANK15', '测试银行', '测试姓名', '6222000000000015', '0', 'RC260327003719000015', '1', 'TRI26032700371915', '4895.69', '4216.02', '14', '支付通道14', '/uploads/recharge/202603/voucher_15.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('36', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '463.08', '463.08', '1', '1001', '127.0.0.1', 'Shanghai', 'BANK16', '测试银行', '测试姓名', '6222000000000016', '0', 'RC260327003719000016', '1', 'TRI26032700371916', '1013.82', '550.74', '12', '支付通道12', '/uploads/recharge/202603/voucher_16.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('37', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '228.61', '228.61', '1', '1033', '127.0.0.1', 'Shanghai', 'BANK17', '测试银行', '测试姓名', '6222000000000017', '0', 'RC260327003719000017', '1', 'TRI26032700371917', '1622.17', '1393.56', '14', '支付通道14', '/uploads/recharge/202603/voucher_17.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('38', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '413.96', '413.96', '1', '1029', '127.0.0.1', 'Shanghai', 'BANK18', '测试银行', '测试姓名', '6222000000000018', '0', 'RC260327003719000018', '1', 'TRI26032700371918', '1150.56', '736.60', '9', '支付通道9', '/uploads/recharge/202603/voucher_18.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('39', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '257.66', '257.66', '1', '1003', '127.0.0.1', 'Shanghai', 'BANK19', '测试银行', '测试姓名', '6222000000000019', '0', 'RC260327003719000019', '1', 'TRI26032700371919', '5117.95', '4860.29', '2', '支付通道2', '/uploads/recharge/202603/voucher_19.png');
INSERT INTO `ntp_common_pay_recharge` VALUES ('40', '2026-03-27 00:37:19', '2026-03-29 00:37:19', '2026-03-27 00:37:19', '429.49', '429.49', '1', '1008', '127.0.0.1', 'Shanghai', 'BANK20', '测试银行', '测试姓名', '6222000000000020', '0', 'RC260327003719000020', '1', 'TRI26032700371920', '604.18', '174.69', '19', '支付通道19', '/uploads/recharge/202603/voucher_20.png');

-- ----------------------------
-- Table structure for ntp_common_prize_pool_config
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_prize_pool_config`;
CREATE TABLE `ntp_common_prize_pool_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `daily_amount` decimal(12,2) NOT NULL COMMENT '每日投入金额',
  `prize_1_amount` decimal(12,2) NOT NULL COMMENT '一等奖金额',
  `prize_2_amount` decimal(12,2) NOT NULL COMMENT '二等奖金额',
  `prize_3_amount` decimal(12,2) NOT NULL COMMENT '三等奖金额',
  `draw_time` varchar(5) NOT NULL COMMENT '开奖时间 格式:05:00',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='奖池配置表';

-- ----------------------------
-- Records of ntp_common_prize_pool_config
-- ----------------------------
INSERT INTO `ntp_common_prize_pool_config` VALUES ('1', '3000.00', '1388.00', '888.00', '688.00', '05:00');

-- ----------------------------
-- Table structure for ntp_common_prize_pool_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_prize_pool_log`;
CREATE TABLE `ntp_common_prize_pool_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `user_name` varchar(50) NOT NULL COMMENT '用户名',
  `prize_level` tinyint(1) NOT NULL COMMENT '奖项 1一等奖 2二等奖 3三等奖',
  `prize_amount` decimal(12,2) NOT NULL COMMENT '奖励金额',
  `prize_date` date NOT NULL COMMENT '获奖日期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态 0待领取 1已领取 2已过期',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_date` (`prize_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='每日奖池获奖记录表';

-- ----------------------------
-- Records of ntp_common_prize_pool_log
-- ----------------------------
INSERT INTO `ntp_common_prize_pool_log` VALUES ('1', '1000', '12131', '1', '276.88', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('2', '1034', 'user_2603270037190020', '3', '169.06', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('3', '1007', '12131', '3', '183.37', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('4', '1009', '12131', '3', '212.17', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('5', '1010', '12131', '1', '246.23', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('6', '1031', 'user_2603270037190017', '3', '295.69', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('7', '1030', 'user_2603270037190016', '2', '39.33', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('8', '1033', 'user_2603270037190019', '1', '159.64', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('9', '1007', '12131', '1', '104.38', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('10', '1034', 'user_2603270037190020', '1', '289.18', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('11', '1010', '12131', '1', '262.22', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('12', '1003', '12131', '3', '63.72', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('13', '1028', 'user_2603270037190014', '3', '111.73', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('14', '1029', 'user_2603270037190015', '2', '77.61', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('15', '1030', 'user_2603270037190016', '1', '10.22', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('16', '1033', 'user_2603270037190019', '3', '33.73', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('17', '1001', '12131', '1', '191.10', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('18', '1003', '12131', '3', '178.56', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('19', '1009', '12131', '1', '168.69', '2026-03-27', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_prize_pool_log` VALUES ('20', '1002', '12131', '3', '225.60', '2026-03-27', '2026-03-27 00:37:19', '1');

-- ----------------------------
-- Table structure for ntp_common_recharge_voucher
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_recharge_voucher`;
CREATE TABLE `ntp_common_recharge_voucher` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `recharge_id` int(11) NOT NULL COMMENT '充值订单ID',
  `voucher_image` varchar(255) NOT NULL COMMENT '凭证图片',
  `amount` decimal(12,2) NOT NULL COMMENT '充值金额',
  `status` tinyint(1) DEFAULT '0' COMMENT '状态 0待审核 1通过 2拒绝',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='充值凭证表';

-- ----------------------------
-- Records of ntp_common_recharge_voucher
-- ----------------------------
INSERT INTO `ntp_common_recharge_voucher` VALUES ('21', '1029', '38', '/uploads/recharge/202603/voucher_18.png', '413.96', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('22', '1002', '34', '/uploads/recharge/202603/voucher_14.png', '931.83', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('23', '3', '35', '/uploads/recharge/202603/voucher_15.png', '679.67', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('24', '1008', '40', '/uploads/recharge/202603/voucher_20.png', '429.49', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('25', '1029', '38', '/uploads/recharge/202603/voucher_18.png', '413.96', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('26', '1033', '37', '/uploads/recharge/202603/voucher_17.png', '228.61', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('27', '1003', '33', '/uploads/recharge/202603/voucher_13.png', '299.87', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('28', '1033', '37', '/uploads/recharge/202603/voucher_17.png', '228.61', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('29', '3', '32', '/uploads/recharge/202603/voucher_12.png', '689.88', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('30', '1003', '39', '/uploads/recharge/202603/voucher_19.png', '257.66', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('31', '1010', '23', '/uploads/recharge/202603/voucher_3.png', '111.33', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('32', '1003', '30', '/uploads/recharge/202603/voucher_10.png', '708.32', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('33', '3', '22', '/uploads/recharge/202603/voucher_2.png', '384.81', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('34', '1029', '38', '/uploads/recharge/202603/voucher_18.png', '413.96', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('35', '1008', '27', '/uploads/recharge/202603/voucher_7.png', '167.13', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('36', '1008', '40', '/uploads/recharge/202603/voucher_20.png', '429.49', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('37', '1002', '26', '/uploads/recharge/202603/voucher_6.png', '456.48', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('38', '1003', '39', '/uploads/recharge/202603/voucher_19.png', '257.66', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('39', '1001', '36', '/uploads/recharge/202603/voucher_16.png', '463.08', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_recharge_voucher` VALUES ('40', '1002', '34', '/uploads/recharge/202603/voucher_14.png', '931.83', '1', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_sys_config`;
CREATE TABLE `ntp_common_sys_config` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) DEFAULT NULL COMMENT '配置中文名称',
  `value` longtext COMMENT '约束条件',
  `mark` varchar(200) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sel` (`name`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台配置表';

-- ----------------------------
-- Records of ntp_common_sys_config
-- ----------------------------
INSERT INTO `ntp_common_sys_config` VALUES ('1', 'recharge_message', '充值提示语', '充值提示语');
INSERT INTO `ntp_common_sys_config` VALUES ('2', 'withdraw_message', '提现提示语', '提现提示语');
INSERT INTO `ntp_common_sys_config` VALUES ('3', 'recharge_success_message', '充值成功提示语', '充值成功提示语');
INSERT INTO `ntp_common_sys_config` VALUES ('4', 'recharge_error_message', '充值事变提示语', '充值事变提示语');
INSERT INTO `ntp_common_sys_config` VALUES ('5', 'withdraw_success_message', '提现成功提示语', '提现成功提示语');
INSERT INTO `ntp_common_sys_config` VALUES ('6', 'withdraw_error_message', '提现事变提示语', '提现事变提示语');
INSERT INTO `ntp_common_sys_config` VALUES ('7', 'home_message', '首页提示语', '首页提示语');

-- ----------------------------
-- Table structure for ntp_common_task_config
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_task_config`;
CREATE TABLE `ntp_common_task_config` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `task_group` tinyint(2) NOT NULL COMMENT '任务组 1:LV2邀请 2:LV1邀请',
  `task_name` varchar(100) NOT NULL COMMENT '任务名称',
  `required_invites` int(11) NOT NULL COMMENT '需要邀请人数',
  `invite_level` varchar(10) NOT NULL COMMENT '邀请等级要求 LV1/LV2',
  `reward_amount` decimal(12,2) NOT NULL COMMENT '奖励金额',
  `sort` int(11) DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) DEFAULT '1' COMMENT '状态 1启用 0禁用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='任务配置表';

-- ----------------------------
-- Records of ntp_common_task_config
-- ----------------------------
INSERT INTO `ntp_common_task_config` VALUES ('1', '1', '完成LV2五人邀请', '5', 'LV2', '300.00', '1', '1');
INSERT INTO `ntp_common_task_config` VALUES ('2', '1', '完成LV2十人邀请', '10', 'LV2', '800.00', '2', '1');
INSERT INTO `ntp_common_task_config` VALUES ('3', '1', '完成LV2十五人邀请', '15', 'LV2', '1500.00', '3', '1');
INSERT INTO `ntp_common_task_config` VALUES ('4', '1', '完成LV2三十人邀请', '30', 'LV2', '3000.00', '4', '1');
INSERT INTO `ntp_common_task_config` VALUES ('5', '2', '完成LV1十人邀请', '10', 'LV1', '500.00', '1', '1');

-- ----------------------------
-- Table structure for ntp_common_task_progress
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_task_progress`;
CREATE TABLE `ntp_common_task_progress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `current_progress` int(11) DEFAULT '0' COMMENT '当前进度',
  `is_completed` tinyint(1) DEFAULT '0' COMMENT '是否完成 0未完成 1已完成',
  `is_claimed` tinyint(1) DEFAULT '0' COMMENT '是否领取 0未领取 1已领取',
  `completed_time` datetime DEFAULT NULL COMMENT '完成时间',
  `claimed_time` datetime DEFAULT NULL COMMENT '领取时间',
  `week_start_date` date NOT NULL COMMENT '周开始日期',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_task_week` (`user_id`,`task_id`,`week_start_date`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户任务进度表';

-- ----------------------------
-- Records of ntp_common_task_progress
-- ----------------------------
INSERT INTO `ntp_common_task_progress` VALUES ('1', '3', '1', '94', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('2', '1002', '2', '69', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('3', '1030', '1', '9', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('4', '1000', '4', '70', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('5', '1004', '2', '50', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('6', '1031', '5', '57', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('7', '1032', '1', '32', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('8', '1005', '5', '60', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('9', '1001', '1', '95', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('10', '1006', '3', '55', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('11', '1009', '2', '51', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('12', '1033', '2', '69', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('13', '1003', '1', '12', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('14', '1001', '5', '69', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('15', '1007', '1', '38', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('16', '1005', '4', '51', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('17', '1008', '5', '10', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('18', '1002', '3', '33', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('19', '1031', '4', '42', '1', '1', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '2026-03-23', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_task_progress` VALUES ('20', '1030', '4', '45', '0', '0', null, null, '2026-03-23', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_task_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_task_reward_log`;
CREATE TABLE `ntp_common_task_reward_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `task_id` int(11) NOT NULL COMMENT '任务ID',
  `reward_amount` decimal(12,2) NOT NULL COMMENT '奖励金额',
  `week_start_date` date NOT NULL COMMENT '周开始日期',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '领取时间',
  `task_name` varchar(255) DEFAULT NULL COMMENT '任务名称',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='任务奖励领取记录';

-- ----------------------------
-- Records of ntp_common_task_reward_log
-- ----------------------------
INSERT INTO `ntp_common_task_reward_log` VALUES ('1', '1000', '5', '22.61', '2026-03-23', '2026-03-27 00:37:19', '完成LV1十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('2', '1000', '1', '36.11', '2026-03-23', '2026-03-27 00:37:19', '完成LV2五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('3', '1007', '1', '70.89', '2026-03-23', '2026-03-27 00:37:19', '完成LV2五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('4', '1005', '3', '37.21', '2026-03-23', '2026-03-27 00:37:19', '完成LV2十五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('5', '1028', '5', '78.49', '2026-03-23', '2026-03-27 00:37:19', '完成LV1十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('6', '1006', '4', '99.24', '2026-03-23', '2026-03-27 00:37:19', '完成LV2三十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('7', '1029', '2', '11.89', '2026-03-23', '2026-03-27 00:37:19', '完成LV2十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('8', '1002', '3', '61.17', '2026-03-23', '2026-03-27 00:37:19', '完成LV2十五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('9', '1005', '5', '69.21', '2026-03-23', '2026-03-27 00:37:19', '完成LV1十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('10', '1007', '1', '25.53', '2026-03-23', '2026-03-27 00:37:19', '完成LV2五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('11', '1029', '3', '85.66', '2026-03-23', '2026-03-27 00:37:19', '完成LV2十五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('12', '1004', '3', '98.77', '2026-03-23', '2026-03-27 00:37:19', '完成LV2十五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('13', '1027', '4', '49.21', '2026-03-23', '2026-03-27 00:37:19', '完成LV2三十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('14', '1000', '4', '59.25', '2026-03-23', '2026-03-27 00:37:19', '完成LV2三十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('15', '1029', '3', '55.12', '2026-03-23', '2026-03-27 00:37:19', '完成LV2十五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('16', '1032', '4', '38.10', '2026-03-23', '2026-03-27 00:37:19', '完成LV2三十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('17', '1030', '1', '79.27', '2026-03-23', '2026-03-27 00:37:19', '完成LV2五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('18', '1002', '3', '92.69', '2026-03-23', '2026-03-27 00:37:19', '完成LV2十五人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('19', '1000', '2', '10.58', '2026-03-23', '2026-03-27 00:37:19', '完成LV2十人邀请');
INSERT INTO `ntp_common_task_reward_log` VALUES ('20', '1029', '4', '45.18', '2026-03-23', '2026-03-27 00:37:19', '完成LV2三十人邀请');

-- ----------------------------
-- Table structure for ntp_common_user
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_user`;
CREATE TABLE `ntp_common_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_no` bigint(20) NOT NULL COMMENT '也是唯一键',
  `user_name` varchar(30) NOT NULL,
  `nickname` varchar(30) DEFAULT NULL,
  `create_time` datetime NOT NULL,
  `pwd` varchar(70) NOT NULL COMMENT '密码 算法加密',
  `withdraw_pwd` varchar(50) NOT NULL COMMENT '提现密码 默认和密码一样 base64加密',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 正常 0冻结 -1 删除',
  `state` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 在线 0 不在线',
  `head_img` text COMMENT '头像',
  `is_real_name` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否实名 0未实名 1提交申请  2 通过申请 3拒绝申请',
  `market_uid` int(12) NOT NULL DEFAULT '0' COMMENT '业务员ID',
  `is_fictitious` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否虚拟账号 1是 0否',
  `phone` varchar(20) NOT NULL COMMENT '手机号码',
  `money_balance` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `money_freeze` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '冻结金额',
  `first_purchase_done` tinyint(1) DEFAULT '0' COMMENT '是否完成首购 0否 1是',
  `money_integral` decimal(20,2) NOT NULL DEFAULT '0.00' COMMENT '积分',
  `money_team` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '团队佣金',
  `user_team` int(12) NOT NULL COMMENT '所属团队',
  `ip` varchar(30) NOT NULL COMMENT '注册的IP地址',
  `total_withdraw` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '累计提现',
  `total_recharge` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '累计充值',
  `total_red` decimal(12,2) NOT NULL DEFAULT '0.00' COMMENT '总获得分红',
  `sfz` varchar(100) DEFAULT NULL COMMENT '身份证号',
  `is_withdraw` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否可提现。0不可 1可以',
  `agent_id_1` int(12) NOT NULL DEFAULT '0' COMMENT '1级',
  `agent_id_2` int(12) NOT NULL DEFAULT '0' COMMENT '2级',
  `agent_id_3` int(12) NOT NULL DEFAULT '0' COMMENT '3级',
  `agent_id` int(12) NOT NULL DEFAULT '0' COMMENT '上级代理，防止以后用到无限级',
  `level_vip` tinyint(4) NOT NULL DEFAULT '0' COMMENT 'vip等级',
  `agent_level` int(11) NOT NULL DEFAULT '0' COMMENT '代理级别 0-7',
  `agent_level_name` varchar(50) DEFAULT NULL COMMENT '代理级别名称',
  `current_experience` int(11) NOT NULL DEFAULT '0' COMMENT '当前经验(已经获得的经验)',
  `agent_lv` int(11) NOT NULL DEFAULT '0' COMMENT '代理的等级',
  `invitation_code` varchar(255) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `weiyiuser_no` (`user_no`) USING BTREE,
  UNIQUE KEY `weiyiphone` (`phone`) USING BTREE,
  KEY `sel` (`user_name`,`phone`,`agent_id_1`,`agent_id_2`,`agent_id_3`,`agent_id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE,
  KEY `is_real_name` (`is_real_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1035 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of ntp_common_user
-- ----------------------------
INSERT INTO `ntp_common_user` VALUES ('3', '1231232', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', null, '0', '0', '0', '894568454', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', null, '1', '0', '0', '0', '0', '0', '0', null, '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1000', '241233', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', null, '0', '0', '0', '231314134', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', null, '1', '0', '0', '0', '0', '0', '0', null, '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1001', '122312213', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '2313141341', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1002', '123123213', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '123544123', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1003', '32134421', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '2313414134534', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1004', '12321232', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '655', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1005', '666', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '1231421', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1006', '5555', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '556', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1007', '12231221312313', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '662123', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1008', '12321232313', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '23123145', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1009', '321344211312', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '151523', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1010', '1231232131231', '12131', '12313', '2026-03-26 17:21:16', 'NDU2Nzg5', '123123', '1', '0', '', '0', '0', '0', '735234', '0.00', '0.00', '0', '0.00', '0.00', '888888', '127.0.0.1', '0.00', '0.00', '0.00', '', '1', '0', '0', '0', '0', '0', '0', '', '0', '0', '888888');
INSERT INTO `ntp_common_user` VALUES ('1027', '92603270037190013', 'user_2603270037190013', '用户13', '2026-03-27 00:37:19', 'NDU2Nzg5', '123456', '1', '1', '/uploads/goods/202603/avatar_2603270037190013.png', '1', '0', '0', '13000000013', '1265.84', '0.00', '1', '36.61', '127.18', '14', '127.0.0.1', '385.22', '3869.74', '626.51', 'SFZ2603270037190013', '1', '0', '0', '0', '0', '3', '3', '代理等级3', '743', '1', 'INV047B579E');
INSERT INTO `ntp_common_user` VALUES ('1028', '92603270037190014', 'user_2603270037190014', '用户14', '2026-03-27 00:37:19', 'NDU2Nzg5', '123456', '1', '0', '/uploads/goods/202603/avatar_2603270037190014.png', '1', '0', '0', '13000000014', '1634.29', '0.00', '1', '49.20', '190.95', '33', '127.0.0.1', '356.64', '2603.37', '275.94', 'SFZ2603270037190014', '1', '0', '0', '0', '0', '4', '4', '代理等级4', '586', '2', 'INV61FA3280');
INSERT INTO `ntp_common_user` VALUES ('1029', '92603270037190015', 'user_2603270037190015', '用户15', '2026-03-27 00:37:19', 'NDU2Nzg5', '123456', '1', '1', '/uploads/goods/202603/avatar_2603270037190015.png', '1', '0', '0', '13000000015', '1122.94', '0.00', '1', '485.11', '22.40', '5', '127.0.0.1', '138.29', '3596.72', '447.69', 'SFZ2603270037190015', '1', '0', '0', '0', '0', '5', '0', '代理等级0', '255', '0', 'INVAFFB8ACD');
INSERT INTO `ntp_common_user` VALUES ('1030', '92603270037190016', 'user_2603270037190016', '用户16', '2026-03-27 00:37:19', 'NDU2Nzg5', '123456', '1', '0', '/uploads/goods/202603/avatar_2603270037190016.png', '1', '0', '0', '13000000016', '1088.22', '0.00', '1', '404.30', '25.75', '3', '127.0.0.1', '89.82', '3638.50', '406.48', 'SFZ2603270037190016', '1', '0', '0', '0', '0', '6', '1', '代理等级1', '760', '1', 'INVC8B71165');
INSERT INTO `ntp_common_user` VALUES ('1031', '92603270037190017', 'user_2603270037190017', '用户17', '2026-03-27 00:37:19', 'NDU2Nzg5', '123456', '1', '1', '/uploads/goods/202603/avatar_2603270037190017.png', '1', '0', '0', '13000000017', '1205.74', '0.00', '1', '358.92', '171.84', '13', '127.0.0.1', '227.95', '4139.48', '763.18', 'SFZ2603270037190017', '1', '0', '0', '0', '0', '7', '2', '代理等级2', '840', '2', 'INV434DA191');
INSERT INTO `ntp_common_user` VALUES ('1032', '92603270037190018', 'user_2603270037190018', '用户18', '2026-03-27 00:37:19', 'NDU2Nzg5', '123456', '1', '0', '/uploads/goods/202603/avatar_2603270037190018.png', '1', '0', '0', '13000000018', '1447.20', '0.00', '1', '107.70', '117.18', '30', '127.0.0.1', '401.13', '511.63', '515.50', 'SFZ2603270037190018', '1', '0', '0', '0', '0', '8', '3', '代理等级3', '853', '0', 'INVE5E99117');
INSERT INTO `ntp_common_user` VALUES ('1033', '92603270037190019', 'user_2603270037190019', '用户19', '2026-03-27 00:37:19', 'NDU2Nzg5', '123456', '1', '1', '/uploads/goods/202603/avatar_2603270037190019.png', '1', '0', '0', '13000000019', '1669.04', '0.00', '1', '316.53', '146.39', '29', '127.0.0.1', '69.45', '3063.67', '416.72', 'SFZ2603270037190019', '1', '0', '0', '0', '0', '9', '4', '代理等级4', '546', '1', 'INV3795B98F');
INSERT INTO `ntp_common_user` VALUES ('1034', '92603270037190020', 'user_2603270037190020', '用户20', '2026-03-27 00:37:19', 'NDU2Nzg5', '123456', '1', '0', '/uploads/goods/202603/avatar_2603270037190020.png', '1', '0', '0', '13000000020', '454.03', '0.00', '1', '428.42', '35.96', '48', '127.0.0.1', '57.51', '4481.96', '406.60', 'SFZ2603270037190020', '1', '0', '0', '0', '0', '0', '0', '代理等级0', '520', '2', 'INVE7943100');

-- ----------------------------
-- Table structure for ntp_common_user_sign_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_user_sign_log`;
CREATE TABLE `ntp_common_user_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `money` decimal(12,2) NOT NULL COMMENT '奖励金额',
  `create_time` datetime NOT NULL,
  `even_sign` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到天数',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `money` (`uid`,`money`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户签到';

-- ----------------------------
-- Records of ntp_common_user_sign_log
-- ----------------------------
INSERT INTO `ntp_common_user_sign_log` VALUES ('1', '1000', '18.30', '2026-03-27 00:37:19', '6');
INSERT INTO `ntp_common_user_sign_log` VALUES ('2', '1006', '5.77', '2026-03-27 00:37:19', '2');
INSERT INTO `ntp_common_user_sign_log` VALUES ('3', '1006', '11.39', '2026-03-27 00:37:19', '2');
INSERT INTO `ntp_common_user_sign_log` VALUES ('4', '1006', '12.77', '2026-03-27 00:37:19', '4');
INSERT INTO `ntp_common_user_sign_log` VALUES ('5', '1001', '1.70', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_user_sign_log` VALUES ('6', '1009', '13.82', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_user_sign_log` VALUES ('7', '1000', '5.44', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_user_sign_log` VALUES ('8', '1002', '10.44', '2026-03-27 00:37:19', '3');
INSERT INTO `ntp_common_user_sign_log` VALUES ('9', '1010', '8.22', '2026-03-27 00:37:19', '5');
INSERT INTO `ntp_common_user_sign_log` VALUES ('10', '3', '8.91', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_user_sign_log` VALUES ('11', '1000', '12.83', '2026-03-27 00:37:19', '5');
INSERT INTO `ntp_common_user_sign_log` VALUES ('12', '1007', '20.00', '2026-03-27 00:37:19', '1');
INSERT INTO `ntp_common_user_sign_log` VALUES ('13', '1032', '3.43', '2026-03-27 00:37:19', '7');
INSERT INTO `ntp_common_user_sign_log` VALUES ('14', '1032', '16.54', '2026-03-27 00:37:19', '3');
INSERT INTO `ntp_common_user_sign_log` VALUES ('15', '1032', '19.35', '2026-03-27 00:37:19', '3');
INSERT INTO `ntp_common_user_sign_log` VALUES ('16', '1009', '19.16', '2026-03-27 00:37:19', '3');
INSERT INTO `ntp_common_user_sign_log` VALUES ('17', '1031', '5.99', '2026-03-27 00:37:19', '6');
INSERT INTO `ntp_common_user_sign_log` VALUES ('18', '1002', '10.77', '2026-03-27 00:37:19', '7');
INSERT INTO `ntp_common_user_sign_log` VALUES ('19', '1029', '17.62', '2026-03-27 00:37:19', '5');
INSERT INTO `ntp_common_user_sign_log` VALUES ('20', '1007', '2.88', '2026-03-27 00:37:19', '6');

-- ----------------------------
-- Table structure for ntp_common_vip
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_vip`;
CREATE TABLE `ntp_common_vip` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `experience` int(11) NOT NULL DEFAULT '0' COMMENT '需要经验',
  `vip` int(11) NOT NULL DEFAULT '0' COMMENT 'vip等级',
  `reward_money` decimal(10,2) NOT NULL COMMENT '每日领取奖励',
  `buy_goods_id` int(11) NOT NULL DEFAULT '0' COMMENT '需要购买的产品id',
  `buy_goods_num` int(11) NOT NULL COMMENT '需要购买的产品数量',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED COMMENT='vip表';

-- ----------------------------
-- Records of ntp_common_vip
-- ----------------------------
INSERT INTO `ntp_common_vip` VALUES ('1', '0', '1', '50.00', '2', '2');
INSERT INTO `ntp_common_vip` VALUES ('2', '0', '2', '80.00', '3', '2');
INSERT INTO `ntp_common_vip` VALUES ('3', '0', '3', '120.00', '4', '2');
INSERT INTO `ntp_common_vip` VALUES ('4', '0', '4', '160.00', '5', '2');
INSERT INTO `ntp_common_vip` VALUES ('5', '0', '5', '200.00', '6', '2');
INSERT INTO `ntp_common_vip` VALUES ('6', '0', '6', '240.00', '7', '2');
INSERT INTO `ntp_common_vip` VALUES ('7', '0', '7', '280.00', '8', '2');
INSERT INTO `ntp_common_vip` VALUES ('8', '0', '8', '320.00', '9', '2');
INSERT INTO `ntp_common_vip` VALUES ('9', '0', '9', '360.00', '10', '2');
INSERT INTO `ntp_common_vip` VALUES ('10', '0', '10', '500.00', '11', '2');

-- ----------------------------
-- Table structure for ntp_common_vip_daily_reward_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_vip_daily_reward_log`;
CREATE TABLE `ntp_common_vip_daily_reward_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `vip_level` int(11) NOT NULL COMMENT 'VIP等级',
  `reward_amount` decimal(12,2) NOT NULL COMMENT '奖励金额',
  `claim_date` date NOT NULL COMMENT '领取日期',
  `create_time` datetime NOT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_date` (`user_id`,`claim_date`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='VIP每日奖励领取记录表';

-- ----------------------------
-- Records of ntp_common_vip_daily_reward_log
-- ----------------------------
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('1', '1033', '9', '5.89', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('2', '1007', '0', '24.11', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('3', '1033', '9', '37.04', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('4', '1004', '0', '39.61', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('5', '1007', '0', '10.32', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('6', '1000', '0', '44.83', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('7', '1030', '6', '47.52', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('8', '1005', '0', '41.64', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('9', '1010', '0', '42.70', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('10', '1029', '5', '29.25', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('11', '1003', '0', '45.86', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('12', '1005', '0', '3.90', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('13', '1029', '5', '42.21', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('14', '1003', '0', '8.85', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('15', '1029', '5', '33.44', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('16', '1008', '0', '41.77', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('17', '1006', '0', '15.65', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('18', '1028', '4', '34.41', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('19', '1034', '0', '26.35', '2026-03-27', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_vip_daily_reward_log` VALUES ('20', '1000', '0', '27.52', '2026-03-27', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_vip_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_vip_log`;
CREATE TABLE `ntp_common_vip_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `start_exp` int(11) NOT NULL DEFAULT '0' COMMENT '开始经验(可虚拟成购买的数量)',
  `end_exp` int(11) NOT NULL DEFAULT '0' COMMENT '结束经验(可虚拟成购买的数量)',
  `start_level` int(11) NOT NULL DEFAULT '0' COMMENT '开始等级',
  `end_level` int(11) NOT NULL DEFAULT '0' COMMENT '结束等级',
  `create_time` datetime NOT NULL,
  `update_time` datetime NOT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='vip日志表';

-- ----------------------------
-- Records of ntp_common_vip_log
-- ----------------------------
INSERT INTO `ntp_common_vip_log` VALUES ('1', '545', '1440', '8', '9', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志1');
INSERT INTO `ntp_common_vip_log` VALUES ('2', '177', '1527', '0', '3', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志2');
INSERT INTO `ntp_common_vip_log` VALUES ('3', '976', '2589', '2', '4', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志3');
INSERT INTO `ntp_common_vip_log` VALUES ('4', '610', '2475', '7', '8', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志4');
INSERT INTO `ntp_common_vip_log` VALUES ('5', '851', '2887', '7', '7', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志5');
INSERT INTO `ntp_common_vip_log` VALUES ('6', '349', '2255', '1', '9', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志6');
INSERT INTO `ntp_common_vip_log` VALUES ('7', '651', '2689', '9', '10', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志7');
INSERT INTO `ntp_common_vip_log` VALUES ('8', '937', '1011', '2', '2', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志8');
INSERT INTO `ntp_common_vip_log` VALUES ('9', '707', '1441', '9', '9', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志9');
INSERT INTO `ntp_common_vip_log` VALUES ('10', '890', '2816', '4', '9', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志10');
INSERT INTO `ntp_common_vip_log` VALUES ('11', '371', '1843', '6', '10', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志11');
INSERT INTO `ntp_common_vip_log` VALUES ('12', '456', '1433', '7', '9', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志12');
INSERT INTO `ntp_common_vip_log` VALUES ('13', '614', '2812', '1', '10', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志13');
INSERT INTO `ntp_common_vip_log` VALUES ('14', '340', '2715', '0', '9', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志14');
INSERT INTO `ntp_common_vip_log` VALUES ('15', '127', '1086', '0', '2', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志15');
INSERT INTO `ntp_common_vip_log` VALUES ('16', '528', '2985', '1', '10', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志16');
INSERT INTO `ntp_common_vip_log` VALUES ('17', '583', '2886', '6', '7', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志17');
INSERT INTO `ntp_common_vip_log` VALUES ('18', '794', '2112', '9', '9', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志18');
INSERT INTO `ntp_common_vip_log` VALUES ('19', '466', '1533', '4', '10', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志19');
INSERT INTO `ntp_common_vip_log` VALUES ('20', '610', '2057', '3', '7', '2026-03-27 00:37:19', '2026-03-27 00:37:19', 'VIP变更日志20');

-- ----------------------------
-- Table structure for ntp_common_wares
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_wares`;
CREATE TABLE `ntp_common_wares` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wares_type_id` int(11) NOT NULL COMMENT '商品分类',
  `wares_name` varchar(255) NOT NULL COMMENT '商品名称',
  `wares_money` decimal(12,2) NOT NULL COMMENT '商品需要积分',
  `wares_spec` varchar(255) NOT NULL COMMENT '商品规格，大，小，',
  `head_img` text COMMENT '商品图片',
  `content` text CHARACTER SET utf8 NOT NULL COMMENT '产品介绍',
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 下架，1 上架',
  `sort` int(12) NOT NULL DEFAULT '0',
  `is_type` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 积分兑换',
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积分兑换商品表';

-- ----------------------------
-- Records of ntp_common_wares
-- ----------------------------
INSERT INTO `ntp_common_wares` VALUES ('9', '1', '阿达大吗1', '20.00', '大的', null, '啊大家困难', '1', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('10', '1', '阿达大吗2', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('11', '1', '阿达大吗4', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('12', '1', '阿达大吗5', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('13', '1', '阿达大吗6', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('15', '1', '阿达大吗7', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('16', '1', '阿达大吗8', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('17', '1', '阿达大吗9', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('18', '1', '阿达大吗0', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('19', '1', '阿达大吗11', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('20', '1', '阿达大吗12', '20.00', '大的', '', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('21', '1', '阿达大吗13', '20.00', '大的', '/uploads/wares/202603/ecb30ece1d813fbb75e9858f2389c668.jpeg', '啊大家困难', '0', '0', '1', '2026-03-26 22:32:58');
INSERT INTO `ntp_common_wares` VALUES ('22', '2', '兑换商品260327003038_13', '1348.78', '规格13', '/uploads/wares/202603/wares_260327003038_13.png', '兑换商品描述13', '1', '13', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_wares` VALUES ('23', '2', '兑换商品260327003038_14', '2574.16', '规格14', '/uploads/wares/202603/wares_260327003038_14.png', '兑换商品描述14', '0', '14', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_wares` VALUES ('24', '3', '兑换商品260327003038_15', '415.61', '规格15', '/uploads/wares/202603/wares_260327003038_15.png', '兑换商品描述15', '1', '15', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_wares` VALUES ('25', '2', '兑换商品260327003038_16', '1486.88', '规格16', '/uploads/wares/202603/wares_260327003038_16.png', '兑换商品描述16', '0', '16', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_wares` VALUES ('26', '4', '兑换商品260327003038_17', '1239.96', '规格17', '/uploads/wares/202603/wares_260327003038_17.png', '兑换商品描述17', '1', '17', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_wares` VALUES ('27', '2', '兑换商品260327003038_18', '2814.79', '规格18', '/uploads/wares/202603/wares_260327003038_18.png', '兑换商品描述18', '0', '18', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_wares` VALUES ('28', '1', '兑换商品260327003038_19', '162.47', '规格19', '/uploads/wares/202603/wares_260327003038_19.png', '兑换商品描述19', '1', '19', '1', '2026-03-27 00:30:38');
INSERT INTO `ntp_common_wares` VALUES ('29', '3', '兑换商品260327003038_20', '1384.91', '规格20', '/uploads/wares/202603/wares_260327003038_20.png', '兑换商品描述20', '0', '20', '1', '2026-03-27 00:30:38');

-- ----------------------------
-- Table structure for ntp_common_wares_order
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_wares_order`;
CREATE TABLE `ntp_common_wares_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `wares_id` int(11) NOT NULL COMMENT '商品ID',
  `wares_type_id` int(11) NOT NULL COMMENT '分类ID',
  `wares_spec` varchar(255) NOT NULL COMMENT '商品规格',
  `head_img` varchar(255) DEFAULT NULL COMMENT '商品图片',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `address_id` int(11) NOT NULL COMMENT '商品购买地址',
  `address` varchar(255) NOT NULL COMMENT '购买地址',
  `wares_money` decimal(12,2) NOT NULL COMMENT '商品价格',
  `create_time` datetime DEFAULT NULL,
  `wares_no` varchar(200) NOT NULL COMMENT '订单号',
  `success_time` datetime DEFAULT NULL COMMENT '收获成功日期',
  `status` tinyint(255) NOT NULL COMMENT '0 下单，1 发货中 2 运输中 3 签收 4 拒签 ',
  `phone` varchar(30) NOT NULL COMMENT '联系电话',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `wares_no` (`wares_no`(191)) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积分兑换记录表';

-- ----------------------------
-- Records of ntp_common_wares_order
-- ----------------------------
INSERT INTO `ntp_common_wares_order` VALUES ('21', '15', '1', '大的', '', '1005', '1', '测试地址1', '20.00', '2026-03-27 00:37:19', 'WO260327003719000001', '2026-03-27 00:37:19', '1', '1231421');
INSERT INTO `ntp_common_wares_order` VALUES ('22', '27', '2', '规格18', '/uploads/wares/202603/wares_260327003038_18.png', '1029', '2', '测试地址2', '2814.79', '2026-03-27 00:37:19', 'WO260327003719000002', '2026-03-27 00:37:19', '0', '13000000015');
INSERT INTO `ntp_common_wares_order` VALUES ('23', '12', '1', '大的', '', '1009', '3', '测试地址3', '20.00', '2026-03-27 00:37:19', 'WO260327003719000003', '2026-03-27 00:37:19', '1', '151523');
INSERT INTO `ntp_common_wares_order` VALUES ('24', '19', '1', '大的', '', '1002', '4', '测试地址4', '20.00', '2026-03-27 00:37:19', 'WO260327003719000004', '2026-03-27 00:37:19', '0', '123544123');
INSERT INTO `ntp_common_wares_order` VALUES ('25', '16', '1', '大的', '', '1008', '5', '测试地址5', '20.00', '2026-03-27 00:37:19', 'WO260327003719000005', '2026-03-27 00:37:19', '1', '23123145');
INSERT INTO `ntp_common_wares_order` VALUES ('26', '21', '1', '大的', '/uploads/wares/202603/ecb30ece1d813fbb75e9858f2389c668.jpeg', '1002', '6', '测试地址6', '20.00', '2026-03-27 00:37:19', 'WO260327003719000006', '2026-03-27 00:37:19', '0', '123544123');
INSERT INTO `ntp_common_wares_order` VALUES ('27', '18', '1', '大的', '', '1028', '7', '测试地址7', '20.00', '2026-03-27 00:37:19', 'WO260327003719000007', '2026-03-27 00:37:19', '1', '13000000014');
INSERT INTO `ntp_common_wares_order` VALUES ('28', '22', '2', '规格13', '/uploads/wares/202603/wares_260327003038_13.png', '1033', '8', '测试地址8', '1348.78', '2026-03-27 00:37:19', 'WO260327003719000008', '2026-03-27 00:37:19', '0', '13000000019');
INSERT INTO `ntp_common_wares_order` VALUES ('29', '9', '1', '大的', null, '1028', '9', '测试地址9', '20.00', '2026-03-27 00:37:19', 'WO260327003719000009', '2026-03-27 00:37:19', '1', '13000000014');
INSERT INTO `ntp_common_wares_order` VALUES ('30', '22', '2', '规格13', '/uploads/wares/202603/wares_260327003038_13.png', '1030', '10', '测试地址10', '1348.78', '2026-03-27 00:37:19', 'WO260327003719000010', '2026-03-27 00:37:19', '0', '13000000016');
INSERT INTO `ntp_common_wares_order` VALUES ('31', '25', '2', '规格16', '/uploads/wares/202603/wares_260327003038_16.png', '1032', '11', '测试地址11', '1486.88', '2026-03-27 00:37:19', 'WO260327003719000011', '2026-03-27 00:37:19', '1', '13000000018');
INSERT INTO `ntp_common_wares_order` VALUES ('32', '10', '1', '大的', '', '1005', '12', '测试地址12', '20.00', '2026-03-27 00:37:19', 'WO260327003719000012', '2026-03-27 00:37:19', '0', '1231421');
INSERT INTO `ntp_common_wares_order` VALUES ('33', '16', '1', '大的', '', '1031', '13', '测试地址13', '20.00', '2026-03-27 00:37:19', 'WO260327003719000013', '2026-03-27 00:37:19', '1', '13000000017');
INSERT INTO `ntp_common_wares_order` VALUES ('34', '13', '1', '大的', '', '1003', '14', '测试地址14', '20.00', '2026-03-27 00:37:19', 'WO260327003719000014', '2026-03-27 00:37:19', '0', '2313414134534');
INSERT INTO `ntp_common_wares_order` VALUES ('35', '27', '2', '规格18', '/uploads/wares/202603/wares_260327003038_18.png', '1029', '15', '测试地址15', '2814.79', '2026-03-27 00:37:19', 'WO260327003719000015', '2026-03-27 00:37:19', '1', '13000000015');
INSERT INTO `ntp_common_wares_order` VALUES ('36', '28', '1', '规格19', '/uploads/wares/202603/wares_260327003038_19.png', '1034', '16', '测试地址16', '162.47', '2026-03-27 00:37:19', 'WO260327003719000016', '2026-03-27 00:37:19', '0', '13000000020');
INSERT INTO `ntp_common_wares_order` VALUES ('37', '16', '1', '大的', '', '1002', '17', '测试地址17', '20.00', '2026-03-27 00:37:19', 'WO260327003719000017', '2026-03-27 00:37:19', '1', '123544123');
INSERT INTO `ntp_common_wares_order` VALUES ('38', '13', '1', '大的', '', '3', '18', '测试地址18', '20.00', '2026-03-27 00:37:19', 'WO260327003719000018', '2026-03-27 00:37:19', '0', '894568454');
INSERT INTO `ntp_common_wares_order` VALUES ('39', '12', '1', '大的', '', '1006', '19', '测试地址19', '20.00', '2026-03-27 00:37:19', 'WO260327003719000019', '2026-03-27 00:37:19', '1', '556');
INSERT INTO `ntp_common_wares_order` VALUES ('40', '20', '1', '大的', '', '1008', '20', '测试地址20', '20.00', '2026-03-27 00:37:19', 'WO260327003719000020', '2026-03-27 00:37:19', '0', '23123145');

-- ----------------------------
-- Table structure for ntp_common_withdraw_comment
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_withdraw_comment`;
CREATE TABLE `ntp_common_withdraw_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `showcase_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `content` varchar(500) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='评论表';

-- ----------------------------
-- Records of ntp_common_withdraw_comment
-- ----------------------------
INSERT INTO `ntp_common_withdraw_comment` VALUES ('21', '26', '1000', '评论内容1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('22', '29', '1000', '评论内容2', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('23', '29', '1001', '评论内容3', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('24', '29', '1000', '评论内容4', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('25', '34', '1009', '评论内容5', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('26', '33', '1031', '评论内容6', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('27', '28', '1033', '评论内容7', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('28', '38', '1003', '评论内容8', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('29', '32', '1006', '评论内容9', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('30', '29', '1003', '评论内容10', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('31', '32', '1003', '评论内容11', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('32', '24', '1001', '评论内容12', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('33', '29', '1028', '评论内容13', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('34', '29', '1010', '评论内容14', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('35', '28', '1029', '评论内容15', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('36', '34', '1003', '评论内容16', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('37', '34', '1003', '评论内容17', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('38', '32', '1009', '评论内容18', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('39', '22', '1034', '评论内容19', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_comment` VALUES ('40', '32', '1004', '评论内容20', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_withdraw_like
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_withdraw_like`;
CREATE TABLE `ntp_common_withdraw_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `showcase_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_showcase_user` (`showcase_id`,`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='点赞表';

-- ----------------------------
-- Records of ntp_common_withdraw_like
-- ----------------------------
INSERT INTO `ntp_common_withdraw_like` VALUES ('21', '22', '1009', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('22', '38', '1003', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('23', '32', '1006', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('24', '27', '1007', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('25', '39', '1003', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('26', '26', '1010', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('27', '30', '1033', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('28', '36', '1028', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('29', '30', '1001', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('30', '27', '1031', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('31', '21', '1001', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('32', '37', '1003', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('33', '39', '1001', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('34', '34', '1027', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('35', '29', '1029', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('36', '40', '1000', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('37', '27', '1033', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('38', '29', '1027', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('39', '29', '1009', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_like` VALUES ('40', '27', '1003', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_common_withdraw_showcase
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_withdraw_showcase`;
CREATE TABLE `ntp_common_withdraw_showcase` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `withdraw_id` int(11) NOT NULL,
  `voucher_image` varchar(255) NOT NULL,
  `amount` decimal(12,2) NOT NULL,
  `like_count` int(11) DEFAULT '0',
  `comment_count` int(11) DEFAULT '0',
  `status` tinyint(1) DEFAULT '1',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提款凭证展示表';

-- ----------------------------
-- Records of ntp_common_withdraw_showcase
-- ----------------------------
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('21', '1006', '24', '/uploads/withdraw/202603/showcase_1.png', '408.48', '1', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('22', '1027', '32', '/uploads/withdraw/202603/showcase_2.png', '63.21', '1', '1', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('23', '1003', '38', '/uploads/withdraw/202603/showcase_3.png', '221.40', '0', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('24', '1033', '21', '/uploads/withdraw/202603/showcase_4.png', '430.68', '0', '1', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('25', '1006', '24', '/uploads/withdraw/202603/showcase_5.png', '408.48', '0', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('26', '1010', '36', '/uploads/withdraw/202603/showcase_6.png', '197.78', '1', '1', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('27', '1006', '28', '/uploads/withdraw/202603/showcase_7.png', '335.00', '4', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('28', '1001', '37', '/uploads/withdraw/202603/showcase_8.png', '283.99', '0', '2', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('29', '1006', '28', '/uploads/withdraw/202603/showcase_9.png', '335.00', '3', '6', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('30', '1032', '40', '/uploads/withdraw/202603/showcase_10.png', '177.44', '2', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('31', '1003', '31', '/uploads/withdraw/202603/showcase_11.png', '190.46', '0', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('32', '1006', '24', '/uploads/withdraw/202603/showcase_12.png', '408.48', '1', '4', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('33', '1007', '33', '/uploads/withdraw/202603/showcase_13.png', '454.19', '0', '1', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('34', '1010', '35', '/uploads/withdraw/202603/showcase_14.png', '132.80', '1', '3', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('35', '1003', '38', '/uploads/withdraw/202603/showcase_15.png', '221.40', '0', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('36', '1005', '29', '/uploads/withdraw/202603/showcase_16.png', '173.17', '1', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('37', '1007', '33', '/uploads/withdraw/202603/showcase_17.png', '454.19', '1', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('38', '1000', '27', '/uploads/withdraw/202603/showcase_18.png', '257.65', '1', '1', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('39', '1001', '30', '/uploads/withdraw/202603/showcase_19.png', '42.22', '2', '0', '1', '2026-03-27 00:37:19');
INSERT INTO `ntp_common_withdraw_showcase` VALUES ('40', '1010', '26', '/uploads/withdraw/202603/showcase_20.png', '419.55', '1', '0', '1', '2026-03-27 00:37:19');

-- ----------------------------
-- Table structure for ntp_money_fanyong_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_money_fanyong_log`;
CREATE TABLE `ntp_money_fanyong_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID 主键 自增',
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `money_amount` decimal(30,2) NOT NULL COMMENT '返佣金额',
  `money_type` int(11) NOT NULL COMMENT '返佣类型 1一直推返佣 2二级直推返佣 3三级直推返佣',
  `money_type_text` varchar(200) NOT NULL COMMENT '返佣类型 文字',
  `is_add_to_user_account` int(11) NOT NULL COMMENT '是否已经添加到用户账户0 否 1 是',
  `remark` varchar(600) NOT NULL COMMENT '信息完整备注',
  `user_name` varchar(200) NOT NULL COMMENT '用户昵称',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新到用户账户时间',
  `product_id` int(11) DEFAULT '0' COMMENT '产品ID',
  `product_lev` int(11) DEFAULT '0' COMMENT '产品等级ID',
  `sub_id` int(11) DEFAULT '0' COMMENT '下级ID',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `sel` (`user_id`,`money_type`,`is_add_to_user_account`,`user_name`,`create_time`,`product_id`,`sub_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户返佣表';

-- ----------------------------
-- Records of ntp_money_fanyong_log
-- ----------------------------
INSERT INTO `ntp_money_fanyong_log` VALUES ('1', '1006', '9.46', '1', '返佣', '1', '返佣记录1', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '14', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('2', '1000', '191.65', '1', '返佣', '1', '返佣记录2', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '12', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('3', '1000', '142.64', '1', '返佣', '1', '返佣记录3', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '8', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('4', '1032', '37.63', '1', '返佣', '1', '返佣记录4', 'user_2603270037190018', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '6', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('5', '1027', '71.22', '1', '返佣', '1', '返佣记录5', 'user_2603270037190013', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '11', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('6', '1006', '163.45', '1', '返佣', '1', '返佣记录6', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '12', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('7', '1005', '155.46', '1', '返佣', '1', '返佣记录7', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '9', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('8', '1004', '104.61', '1', '返佣', '1', '返佣记录8', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '9', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('9', '1034', '87.34', '1', '返佣', '1', '返佣记录9', 'user_2603270037190020', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '26', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('10', '1027', '132.22', '1', '返佣', '1', '返佣记录10', 'user_2603270037190013', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '1', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('11', '1007', '74.83', '1', '返佣', '1', '返佣记录11', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '9', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('12', '1008', '169.30', '1', '返佣', '1', '返佣记录12', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '25', '10', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('13', '1004', '8.76', '1', '返佣', '1', '返佣记录13', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '13', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('14', '1029', '84.99', '1', '返佣', '1', '返佣记录14', 'user_2603270037190015', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '25', '10', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('15', '1003', '65.00', '1', '返佣', '1', '返佣记录15', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '16', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('16', '1028', '70.31', '1', '返佣', '1', '返佣记录16', 'user_2603270037190014', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '3', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('17', '1029', '93.66', '1', '返佣', '1', '返佣记录17', 'user_2603270037190015', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '5', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('18', '1030', '25.97', '1', '返佣', '1', '返佣记录18', 'user_2603270037190016', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '10', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('19', '1003', '46.25', '1', '返佣', '1', '返佣记录19', '12131', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '16', '0', '0');
INSERT INTO `ntp_money_fanyong_log` VALUES ('20', '1032', '5.74', '1', '返佣', '1', '返佣记录20', 'user_2603270037190018', '2026-03-27 00:37:19', '2026-03-27 00:37:19', '9', '0', '0');
