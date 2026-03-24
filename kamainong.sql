/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50726
Source Host           : localhost:3306
Source Database       : kamainong

Target Server Type    : MYSQL
Target Server Version : 50726
File Encoding         : 65001

Date: 2026-03-24 23:05:28
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台管理员表';

-- ----------------------------
-- Records of ntp_common_admin
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台确定单点登陆';

-- ----------------------------
-- Records of ntp_common_admin_token
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci ROW_FORMAT=DYNAMIC COMMENT='轮播图';

-- ----------------------------
-- Records of ntp_common_ads
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户所有上一级';

-- ----------------------------
-- Records of ntp_common_agent_path
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='邮件发送表';

-- ----------------------------
-- Records of ntp_common_email
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='礼品码表';

-- ----------------------------
-- Records of ntp_common_gift_code
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='礼品码使用记录';

-- ----------------------------
-- Records of ntp_common_gift_code_log
-- ----------------------------

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
  `status` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 上架，2即将推出，0下架上架',
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
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='项目表';

-- ----------------------------
-- Records of ntp_common_goods
-- ----------------------------
INSERT INTO `ntp_common_goods` VALUES ('1', '1', 'Produit d\'expérience', '0.00', '0.00', '110.00', '1', '110.00', '330.00', '0.00', '3', '1', '2', 'AVIVA', '2026-03-23 15:15:07', null, null, '1', '1', '1', '0', '0.00', '0.00', '0.00', '0.00', '1', '0', '0');
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
  `day_id` int(11) NOT NULL,
  `goods_type_id` int(11) NOT NULL,
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='商品订单表';

-- ----------------------------
-- Records of ntp_common_goods_order
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_order` (`user_id`,`order_id`) USING BTREE,
  KEY `idx_status` (`status`,`expire_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='收益领取记录表';

-- ----------------------------
-- Records of ntp_common_income_claim_log
-- ----------------------------

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
  `last_spin_date` date DEFAULT NULL COMMENT '最后转盘日期',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `uk_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户转盘次数表';

-- ----------------------------
-- Records of ntp_common_lottery_chance
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户转盘记录表';

-- ----------------------------
-- Records of ntp_common_lottery_log
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_month` (`user_id`,`claim_month`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='月薪领取记录表';

-- ----------------------------
-- Records of ntp_common_monthly_salary_log
-- ----------------------------

-- ----------------------------
-- Table structure for ntp_common_notification
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_notification`;
CREATE TABLE `ntp_common_notification` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '通知ID',
  `uid` int(11) NOT NULL DEFAULT '0' COMMENT '用户ID',
  `type` varchar(50) NOT NULL DEFAULT 'system' COMMENT '通知类型: system-系统通知, transaction-交易通知',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '通知标题',
  `content` text COMMENT '通知内容',
  `is_read` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否已读: 0-未读, 1-已读',
  `create_time` int(11) NOT NULL DEFAULT '0' COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_is_read` (`is_read`) USING BTREE,
  KEY `idx_uid` (`uid`) USING BTREE,
  KEY `idx_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='通知表';

-- ----------------------------
-- Records of ntp_common_notification
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提现表';

-- ----------------------------
-- Records of ntp_common_pay_cash
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='z支付渠道表';

-- ----------------------------
-- Records of ntp_common_pay_channel
-- ----------------------------

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
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb4 ROW_FORMAT=FIXED COMMENT='付款优惠卷';

-- ----------------------------
-- Records of ntp_common_pay_coupon
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='资金流水表';

-- ----------------------------
-- Records of ntp_common_pay_money_log
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='充值表';

-- ----------------------------
-- Records of ntp_common_pay_recharge
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_date` (`prize_date`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='每日奖池获奖记录表';

-- ----------------------------
-- Records of ntp_common_prize_pool_log
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='充值凭证表';

-- ----------------------------
-- Records of ntp_common_recharge_voucher
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='后台配置表';

-- ----------------------------
-- Records of ntp_common_sys_config
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户任务进度表';

-- ----------------------------
-- Records of ntp_common_task_progress
-- ----------------------------

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
  PRIMARY KEY (`id`) USING BTREE,
  KEY `idx_user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='任务奖励领取记录';

-- ----------------------------
-- Records of ntp_common_task_reward_log
-- ----------------------------

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
  PRIMARY KEY (`id`,`user_no`) USING BTREE,
  KEY `sel` (`user_name`,`phone`,`agent_id_1`,`agent_id_2`,`agent_id_3`,`agent_id`) USING BTREE,
  KEY `agent_id` (`agent_id`) USING BTREE,
  KEY `is_real_name` (`is_real_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of ntp_common_user
-- ----------------------------
INSERT INTO `ntp_common_user` VALUES ('1', '1001', 'user_1774360816', null, '2026-03-24 22:00:16', 'c51cd8e64b0aeb778364765013df9ebe', 'cTEyMzQ1Ng==', '1', '0', null, '0', '0', '0', '666666666', '0.00', '0.00', '0', '0.00', '0.00', '1001', '127.0.0.1', '0.00', '0.00', '0.00', null, '1', '0', '0', '0', '0', '0', '0', null, '0', '0', 'A6A4A3D9');
INSERT INTO `ntp_common_user` VALUES ('2', '1002', 'user_1774360848', null, '2026-03-24 22:00:48', 'c51cd8e64b0aeb778364765013df9ebe', 'cTEyMzQ1Ng==', '1', '0', null, '0', '0', '0', '666666665', '0.00', '0.00', '0', '0.00', '0.00', '1002', '127.0.0.1', '0.00', '0.00', '0.00', null, '1', '0', '0', '0', '0', '0', '0', null, '0', '0', 'DEBB0388');

-- ----------------------------
-- Table structure for ntp_common_user_sign_log
-- ----------------------------
DROP TABLE IF EXISTS `ntp_common_user_sign_log`;
CREATE TABLE `ntp_common_user_sign_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` int(11) NOT NULL,
  `money` decimal(12,2) NOT NULL,
  `create_time` datetime NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `money` (`uid`,`money`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='用户签到';

-- ----------------------------
-- Records of ntp_common_user_sign_log
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='VIP每日奖励领取记录表';

-- ----------------------------
-- Records of ntp_common_vip_daily_reward_log
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='vip日志表';

-- ----------------------------
-- Records of ntp_common_vip_log
-- ----------------------------

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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积分兑换商品表';

-- ----------------------------
-- Records of ntp_common_wares
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='积分兑换记录表';

-- ----------------------------
-- Records of ntp_common_wares_order
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='评论表';

-- ----------------------------
-- Records of ntp_common_withdraw_comment
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='点赞表';

-- ----------------------------
-- Records of ntp_common_withdraw_like
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC COMMENT='提款凭证展示表';

-- ----------------------------
-- Records of ntp_common_withdraw_showcase
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户返佣表';

-- ----------------------------
-- Records of ntp_money_fanyong_log
-- ----------------------------
