/*
 Navicat Premium Dump SQL

 Source Server         : back_system
 Source Server Type    : MySQL
 Source Server Version : 50728 (5.7.28)
 Source Host           : localhost:3306
 Source Schema         : back_system

 Target Server Type    : MySQL
 Target Server Version : 50728 (5.7.28)
 File Encoding         : 65001

 Date: 11/05/2025 11:15:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for course
-- ----------------------------
DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(12) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_type` varchar(255) DEFAULT NULL,
  `course_desc` varchar(255) DEFAULT NULL,
  `teacher` varchar(255) DEFAULT NULL,
  `course_create_time` datetime DEFAULT NULL,
  `course_update_time` datetime DEFAULT NULL,
  `select_status` int(11) DEFAULT '0',
  `course_apply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of course
-- ----------------------------
BEGIN;
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (1, 23, '数据分析', '专业课', '222121', '马克思', '2025-05-10 13:36:37', NULL, 0, NULL);
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (2, 45, '统计学', '公共课', '222121', '马克思', '2025-05-10 13:37:24', NULL, 0, NULL);
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (3, 12212, '人工智能', 'specialized', '人工智能研究', '李飞', '2025-05-10 15:19:45', NULL, 1, '2025-05-10 17:28:11');
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (4, 8888, '应用数学与计算机', 'common', '应用数学与计算机应用数学与计算机', '张飞', '2025-05-10 15:22:55', NULL, 1, '2025-05-10 17:29:24');
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (5, 8888, '应用数学与计算机', 'common', '应用数学与计算机应用数学与计算机', '张飞', '2025-05-10 15:24:52', NULL, 1, '2025-05-10 17:32:17');
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (6, 123455, '马克思主义', 'common', '', '马斯卡', '2025-05-10 15:30:26', NULL, 0, NULL);
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (7, 473733, '区块链技术', 'specialized', '区块链技术挖矿', '马克', '2025-05-10 15:59:24', NULL, 0, NULL);
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (8, 775473537, '广告设计', 'specialized', '广告设计广告设计', '希冀', '2025-05-10 16:19:02', NULL, 1, '2025-05-10 17:37:57');
INSERT INTO `course` (`id`, `course_id`, `course_name`, `course_type`, `course_desc`, `teacher`, `course_create_time`, `course_update_time`, `select_status`, `course_apply_time`) VALUES (9, 66666666, '管理学', 'common', '管理学', '李四', '2025-05-10 16:41:59', NULL, 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for files
-- ----------------------------
DROP TABLE IF EXISTS `files`;
CREATE TABLE `files` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `file_name` varchar(255) DEFAULT NULL,
  `file_url` varchar(255) DEFAULT NULL,
  `file_size` varchar(255) DEFAULT NULL,
  `upload_person` varchar(255) DEFAULT NULL,
  `upload_time` varchar(255) DEFAULT NULL,
  `download_number` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of files
-- ----------------------------
BEGIN;
INSERT INTO `files` (`id`, `file_name`, `file_url`, `file_size`, `upload_person`, `upload_time`, `download_number`) VALUES (28, '截屏2025-03-14 17.12.37.png', 'http://127.0.0.1:3007/upload/截屏2025-03-14 17.12.37.png', '1677.560546875', 'null', '2025-05-06 14:57:49.168', 0);
INSERT INTO `files` (`id`, `file_name`, `file_url`, `file_size`, `upload_person`, `upload_time`, `download_number`) VALUES (29, '论文撰写规范-初稿.pdf', 'http://127.0.0.1:3007/upload/论文撰写规范-初稿.pdf', '1592.1953125', 'null', '2025-05-09 18:43:13.024', 0);
COMMIT;

-- ----------------------------
-- Table structure for image
-- ----------------------------
DROP TABLE IF EXISTS `image`;
CREATE TABLE `image` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `image_url` varchar(255) DEFAULT NULL,
  `account` int(255) DEFAULT NULL,
  `onlyId` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of image
-- ----------------------------
BEGIN;
INSERT INTO `image` (`id`, `image_url`, `account`, `onlyId`) VALUES (13, 'http://127.0.0.1:3007/upload/avatar.jpg', 123666, 'b8df7fcd-15b7-40be-8e9e-76d72b1ed84b');
COMMIT;

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(12) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `login_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of login_log
-- ----------------------------
BEGIN;
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (8, 123456, NULL, NULL, '2025-05-02 20:01:35.771');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (9, 123456, NULL, NULL, '2025-05-07 09:22:05.133');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (10, 123456, NULL, NULL, '2025-05-07 09:24:01.507');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (11, 123456, NULL, NULL, '2025-05-07 09:55:45.076');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (12, 123456, NULL, NULL, '2025-05-07 10:05:30.946');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (13, 123456, '小蒋', NULL, '2025-05-07 14:09:55.292');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (14, 999999, '李四', '111@163.com', '2025-05-07 14:22:32.239');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (15, 123456, '小蒋', NULL, '2025-05-07 20:15:11.776');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (16, 123456, '小蒋', NULL, '2025-05-08 18:21:26.467');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (17, 123456, '小蒋', NULL, '2025-05-08 18:50:35.422');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (18, 123456, '小蒋', NULL, '2025-05-08 19:05:45.052');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (19, 123456, '小蒋', NULL, '2025-05-08 19:08:39.744');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (20, 123456, '小蒋', NULL, '2025-05-08 19:32:24.919');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (21, 123456, '小蒋', NULL, '2025-05-08 19:33:08.340');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (22, 123456, '小蒋', NULL, '2025-05-08 19:34:17.115');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (23, 123456, '小蒋', NULL, '2025-05-08 19:35:49.322');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (24, 123456, '小蒋', NULL, '2025-05-09 09:28:45.914');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (25, 999999, '李四', '111@163.com', '2025-05-09 09:30:11.572');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (26, 1122233, NULL, NULL, '2025-05-09 11:11:49.757');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (27, 11223344, NULL, NULL, '2025-05-09 11:19:44.758');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (28, 123456, '小蒋', NULL, '2025-05-09 11:27:11.506');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (29, 12344555, NULL, NULL, '2025-05-09 17:41:28.001');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (30, 6677777, NULL, NULL, '2025-05-09 17:48:02.001');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (31, 88888888, NULL, NULL, '2025-05-09 18:45:36.379');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (32, 1458151695, 'jn', '1111@qq.com', '2025-05-09 18:47:34.597');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (33, 1458151695, 'jn', '1111@qq.com', '2025-05-09 18:49:33.885');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (34, 127777, 'jz', '11@153.com', '2025-05-09 18:50:30.020');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (35, 123456, '小蒋', NULL, '2025-05-09 19:42:39.799');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (36, 1458151695, 'jn', '1111@qq.com', '2025-05-09 19:51:15.165');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (37, 345678, 'jn', '1234@163.com', '2025-05-09 19:54:32.133');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (38, 123456, '小蒋', NULL, '2025-05-09 19:57:18.220');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (39, 345678, 'jn', '1234@163.com', '2025-05-09 19:58:54.720');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (40, 123456, '小蒋', NULL, '2025-05-09 20:20:35.538');
INSERT INTO `login_log` (`id`, `account`, `name`, `email`, `login_time`) VALUES (41, 345678, 'jn', '1234@163.com', '2025-05-10 14:14:49.479');
COMMIT;

-- ----------------------------
-- Table structure for message
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message_title` varchar(255) DEFAULT NULL,
  `message_category` varchar(255) DEFAULT NULL,
  `message_publish_department` varchar(255) DEFAULT NULL,
  `message_publish_name` varchar(255) DEFAULT NULL,
  `message_receipt_object` varchar(255) DEFAULT NULL,
  `message_click_number` int(11) DEFAULT NULL,
  `message_content` varchar(255) DEFAULT NULL,
  `message_publish_time` varchar(255) DEFAULT NULL,
  `message_update_time` varchar(255) DEFAULT NULL,
  `message_level` varchar(255) DEFAULT NULL,
  `message_status` int(11) DEFAULT NULL,
  `message_delete_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------
BEGIN;
INSERT INTO `message` (`id`, `message_title`, `message_category`, `message_publish_department`, `message_publish_name`, `message_receipt_object`, `message_click_number`, `message_content`, `message_publish_time`, `message_update_time`, `message_level`, `message_status`, `message_delete_time`) VALUES (36, '111', '公司公告', '组织部', 'null', '总裁办', 0, '<p>111111</p>', '2025-05-06 15:00:32.105', '2025-05-07 09:57:29.833', '一般', 1, '2025-05-07 10:22:09.148');
INSERT INTO `message` (`id`, `message_title`, `message_category`, `message_publish_department`, `message_publish_name`, `message_receipt_object`, `message_click_number`, `message_content`, `message_publish_time`, `message_update_time`, `message_level`, `message_status`, `message_delete_time`) VALUES (37, 'ssaa', '系统消息', '组织部', 'null', '总裁办', 0, '<p>111111</p>', '2025-05-06 15:00:45.036', NULL, '一般', 0, NULL);
INSERT INTO `message` (`id`, `message_title`, `message_category`, `message_publish_department`, `message_publish_name`, `message_receipt_object`, `message_click_number`, `message_content`, `message_publish_time`, `message_update_time`, `message_level`, `message_status`, `message_delete_time`) VALUES (38, '公司团建公告', '系统消息', '', 'null', '', 0, '', '2025-05-07 10:20:57.768', NULL, '', 0, NULL);
INSERT INTO `message` (`id`, `message_title`, `message_category`, `message_publish_department`, `message_publish_name`, `message_receipt_object`, `message_click_number`, `message_content`, `message_publish_time`, `message_update_time`, `message_level`, `message_status`, `message_delete_time`) VALUES (39, '春节放假通知', '公司公告', '组织部', 'null', '电子信息系', 1, '<p>正月初一到初七休息</p>', '2025-05-07 10:22:05.649', '2025-05-10 14:16:24.112', '一般', 0, NULL);
INSERT INTO `message` (`id`, `message_title`, `message_category`, `message_publish_department`, `message_publish_name`, `message_receipt_object`, `message_click_number`, `message_content`, `message_publish_time`, `message_update_time`, `message_level`, `message_status`, `message_delete_time`) VALUES (40, '元旦放假通知', '公司公告', '组织部', 'null', '电子信息系', 1, '', '2025-05-10 14:15:52.262', '2025-05-10 14:16:06.060', '一般', 0, NULL);
COMMIT;

-- ----------------------------
-- Table structure for mycourse
-- ----------------------------
DROP TABLE IF EXISTS `mycourse`;
CREATE TABLE `mycourse` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `course_id` int(11) DEFAULT NULL,
  `course_name` varchar(255) DEFAULT NULL,
  `course_type` varchar(255) DEFAULT NULL,
  `course_desc` varchar(255) DEFAULT NULL,
  `teacher` varchar(255) DEFAULT NULL,
  `course_apply_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mycourse
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for operation_log
-- ----------------------------
DROP TABLE IF EXISTS `operation_log`;
CREATE TABLE `operation_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `operation_person` varchar(255) DEFAULT NULL,
  `operation_content` varchar(255) DEFAULT NULL,
  `operation_level` varchar(255) DEFAULT NULL,
  `operation_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of operation_log
-- ----------------------------
BEGIN;
COMMIT;

-- ----------------------------
-- Table structure for outproduct
-- ----------------------------
DROP TABLE IF EXISTS `outproduct`;
CREATE TABLE `outproduct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_out_id` int(11) DEFAULT NULL,
  `product_out_number` int(11) DEFAULT NULL,
  `product_out_price` int(11) DEFAULT NULL,
  `product_out_apply_person` varchar(255) DEFAULT NULL,
  `product_audit_time` varchar(255) DEFAULT NULL,
  `product_out_audit_person` varchar(255) DEFAULT NULL,
  `audit_memo` varchar(255) DEFAULT NULL,
  `product_apply_time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of outproduct
-- ----------------------------
BEGIN;
INSERT INTO `outproduct` (`id`, `product_out_id`, `product_out_number`, `product_out_price`, `product_out_apply_person`, `product_audit_time`, `product_out_audit_person`, `audit_memo`, `product_apply_time`) VALUES (7, 2222, 1, 1, '小蒋', '2025-05-08 16:06:26.011', '小蒋', NULL, '2025-05-08 16:06:10.745');
INSERT INTO `outproduct` (`id`, `product_out_id`, `product_out_number`, `product_out_price`, `product_out_apply_person`, `product_audit_time`, `product_out_audit_person`, `audit_memo`, `product_apply_time`) VALUES (8, 33344, 1, 1, '小蒋', '2025-05-09 16:37:36.732', '小蒋', NULL, '2025-05-09 16:36:45.683');
COMMIT;

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(10) DEFAULT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_category` varchar(255) DEFAULT NULL,
  `product_unit` varchar(255) DEFAULT NULL,
  `product_in_warehouse_number` int(11) DEFAULT NULL,
  `product_single_price` int(11) DEFAULT NULL,
  `product_all_price` int(11) DEFAULT NULL,
  `product_status` varchar(255) DEFAULT NULL,
  `product_create_person` varchar(255) DEFAULT NULL,
  `product_create_time` varchar(255) DEFAULT NULL,
  `product_update_time` varchar(255) DEFAULT NULL,
  `in_memo` varchar(255) DEFAULT NULL,
  `product_out_id` int(11) DEFAULT NULL,
  `product_out_number` int(11) DEFAULT NULL,
  `product_out_price` int(11) DEFAULT NULL,
  `product_out_apply_person` varchar(255) DEFAULT NULL,
  `product_apply_time` varchar(255) DEFAULT NULL,
  `apply_memo` varchar(255) DEFAULT NULL,
  `product_out_status` varchar(255) DEFAULT NULL,
  `product_audit_time` varchar(255) DEFAULT NULL,
  `product_out_audit_person` varchar(255) DEFAULT NULL,
  `audit_memo` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of product
-- ----------------------------
BEGIN;
INSERT INTO `product` (`id`, `product_id`, `product_name`, `product_category`, `product_unit`, `product_in_warehouse_number`, `product_single_price`, `product_all_price`, `product_status`, `product_create_person`, `product_create_time`, `product_update_time`, `in_memo`, `product_out_id`, `product_out_number`, `product_out_price`, `product_out_apply_person`, `product_apply_time`, `apply_memo`, `product_out_status`, `product_audit_time`, `product_out_audit_person`, `audit_memo`) VALUES (10, 1111, '222', '食品类', '个', 1, 1, 1, NULL, 'jn', '2025-05-06 15:04:28.785', '2025-05-09 16:35:48.701', '', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `product` (`id`, `product_id`, `product_name`, `product_category`, `product_unit`, `product_in_warehouse_number`, `product_single_price`, `product_all_price`, `product_status`, `product_create_person`, `product_create_time`, `product_update_time`, `in_memo`, `product_out_id`, `product_out_number`, `product_out_price`, `product_out_apply_person`, `product_apply_time`, `apply_memo`, `product_out_status`, `product_audit_time`, `product_out_audit_person`, `audit_memo`) VALUES (11, 333333, '大数据', '食品类', '个', 1, 2, 2, NULL, '李四', '2025-05-09 16:35:35.431', NULL, '', 33333, 1, 2, '小蒋', '2025-05-09 16:44:50.529', '', '申请出库', NULL, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for setting
-- ----------------------------
DROP TABLE IF EXISTS `setting`;
CREATE TABLE `setting` (
  `id` int(11) NOT NULL,
  `set_name` varchar(255) DEFAULT NULL,
  `set_value` varchar(255) DEFAULT NULL,
  `set_text` text,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of setting
-- ----------------------------
BEGIN;
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (1, 'swiper1', 'http://127.0.0.1:3007/upload/90.jpeg', NULL);
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (2, 'swiper2', 'http://127.0.0.1:3007/upload/understanding_os_windows_01279.jpg', NULL);
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (3, 'swiper3', 'http://127.0.0.1:3007/upload/bg.jpg', NULL);
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (4, 'swiper4', 'http://127.0.0.1:3007/upload/8860603b42c0687.jpg', NULL);
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (5, 'swiper5', 'http://127.0.0.1:3007/upload/sys.jpg', NULL);
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (6, 'swiper6', 'http://127.0.0.1:3007/upload/v2-cffa191bc6fe5502e016ac4a83685143_b.jpg', NULL);
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (7, '公司名称', '公司名称', NULL);
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (8, '公司介绍', NULL, '<p>有限责任公司旗下XXXX平台位是一家立足西部，辐射全国区的专业、正规投融资对接信息服务商，借助我们拥有多年的的投融资服务经验。打造政、银、企三方投融资自主对接平台，破解投融资信息不对称难题，降低资本与项目对接成本，切实提高对接成功率，助推企业转型升级和稳健成长，服务西部产业结构调整。</p>');
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (9, '公司架构', NULL, '<p>222CEO：首席执行官（Chief Executive Officer)职位名称，是在一个企业中负责日常事务的最高行政官员，主司企业行政事务，故又称作司政、行政总裁、总经理或最高执行长。\n\nCOO：首席运营官（Chief Operating Officer，缩写COO，首席营运长官），又称：运营总监，就是制定企业长远战略，督导各分公司总经理执行工作的岗位。主要是负责公司的日常运营，辅助CEO的工作。对CEO负责，负责企业的运营管理。COO在某些公司中同时任职总裁，但他们通常是常务或资深的副总裁。\n\nCFO：首席财务官——CFO（Chief Financial Officer）是企业治理结构发展到一个新阶段的必然产物。没有首席财务官的治理结构不是现代意义上完善的治理结构。从这一层面上看，中国构造治理结构也应设立CFO之类的职位。</p>');
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (10, '公司战略', NULL, '<p>111打造开放、共赢、创新、高效、诚信为基础、企业、政府、个人参与投融资对接服务平台，实现更快捷、更低成本融资和更稳健投资收益，为中小企业家人群、政府、个人等高成长发展群体提供方便快捷的金融服务，助力他们改变自己的发展和生活。</p>');
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (11, '公司高层', NULL, '<p>公司的高层管理团队是公司发展和成长的引擎和支撑，他们带领团队不断挑战和超越自我，实现公司战略目标和长远愿景。 在未来的发展道路上，高层管理团队将继续发扬团结合作、勇挑重担、创新驱动的精神，为公司的腾飞添砖加瓦。</p>');
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (12, '部门设置', '[\"电子信息系\",\"软件工程系\"]', NULL);
INSERT INTO `setting` (`id`, `set_name`, `set_value`, `set_text`) VALUES (13, '产品设置', '[\"计算机科学与技术\",\"软件工程\",\"数据分析\"]', NULL);
COMMIT;

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `account` int(12) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `identity` varchar(255) DEFAULT NULL,
  `department` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `sex` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL,
  `create_time` varchar(255) DEFAULT NULL,
  `update_time` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL,
  `read_list` varchar(255) DEFAULT NULL,
  `read_status` int(1) DEFAULT '0',
  `role` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of users
-- ----------------------------
BEGIN;
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (43, 123666, '$2a$10$TyJm48diZ6VgnsjxSdEKBOR9rfAiH/pcVjrH/RjUKzVWkakNFPBcu', '超级管理员', '总裁办', '张三', '男', '123@qq.com', 'http://127.0.0.1:3007/upload/avatar.jpg', '2024-01-31 10:44:18.102', NULL, '0', '[36,36]', 1, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (49, 123456, '$2a$10$cuRNgnT7OxVS8mMinpsLZ.SY/y1g2mUbVU0Wc7ypUaGSXqf35ZD1G', '用户', '组织部', '小蒋', '男', NULL, NULL, '2025-05-02 20:01:15.691', NULL, '0', '[]', 1, 'student');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (50, 1111111, '$2a$10$79Mbk.gGSoQqJzf.uEFHy.CvvWamvOb1C.oPC84jyX92i1tUDf8vu', '产品管理员', '总裁办', '蒋宁', '男', '111@163.com', NULL, '2025-05-06 20:06:04.297', NULL, '0', NULL, 0, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (51, 666666, '$2a$10$F.Y4/pglW4LsHWPzeKJ4cO71Uagks3j0PwCgnT4CheMSeljWZn73i', '用户', '组织部', '赵云', '男', '11@129.com', NULL, '2025-05-07 10:19:27.622', '2025-05-07 14:19:25.414', '0', NULL, 0, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (52, 888888, '$2a$10$WyhBlM0we6ysiA6ra550Se0v4jD0iCfDHVmTwfHlhtgSBzdAXqvhq', '消息管理员', '总裁办', '张飞', '男', '1222@163.com', NULL, '2025-05-07 10:20:08.202', NULL, '0', NULL, 0, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (53, 999999, '$2a$10$JfAbmOdhAFqERP5zv89CeuLg4Iw8vI4XjTgqf0sqg9jZGc/WDmsRO', '用户管理员', '总裁办', '李四', '女', '111@163.com', NULL, '2025-05-07 14:22:01.414', NULL, '0', '[37]', 1, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (54, 234567, '$2a$10$7a53MKazQhpKXFkFeQazBu/3VF9UC8G8fhZptI1h8BO3CUj6zmNMq', '用户', NULL, NULL, NULL, NULL, NULL, '2025-05-09 10:58:31.608', NULL, '0', NULL, 0, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (55, 555555, '$2a$10$5vl2syxwuoFe46F9mfJH/uI0UJj36Vgo.BemaNysTokbRgi8KAjc.', '用户', NULL, NULL, NULL, NULL, NULL, '2025-05-09 11:00:41.454', NULL, '0', NULL, 0, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (56, 333333, '$2a$10$ANRUWoYu40YqfCkuwQ8rk.SRiMxP30iMMHdvVLe4itjB0U/RXCLjC', '用户', NULL, NULL, NULL, NULL, NULL, '2025-05-09 11:02:06.512', NULL, '0', NULL, 0, 'teacher');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (57, 1122233, '$2a$10$cTJA79AFWPcIoAy8g/Y00.ZJuKZJTLoj8B/SrSfuy8/.uiIIDCz5m', '用户', NULL, NULL, NULL, NULL, NULL, '2025-05-09 11:11:16.141', NULL, '0', '[]', 1, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (58, 11223344, '$2a$10$ob6vVwRzJfabyMZNVT/dkOrYtBQiCzgWZWwhM8S0DxP55PFwuaKq.', '用户', NULL, NULL, NULL, NULL, NULL, '2025-05-09 11:19:14.042', NULL, '0', '[]', 1, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (59, 4656565, '$2a$10$LWjOxM6ObRfVCd1sjdsZBu2Qa54a9ZDK.NSLS/n7bBU6uvawNuWgi', '产品管理员', '电子信息系', '杰克', '男', '111@15.com', NULL, '2025-05-09 11:49:42.503', NULL, '0', NULL, 0, '');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (60, 3373473, '$2a$10$tTflyvwyHTqePJSfzGXtB.8v5t2BhpsqB.RgEj2kFpe8YGvg58g8i', '学生', '电子信息系', '李二', '男', '122@163.com', NULL, '2025-05-09 12:15:13.880', NULL, '0', NULL, 0, 'student');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (61, 57757475, '$2a$10$9/d9hrh45dJ1IWnuPB1wJOeyc7TRZu0GdMH/D4GuWI36vrVTjPlvu', '用户', '软件工程系', '李老师', '男', '12@163.com', NULL, '2025-05-09 12:16:07.245', NULL, '0', NULL, 0, 'teacher');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (62, 33328383, '$2a$10$mPrm6l1.kB1WsVm3B3HRmeIHn8JVKfcZOpOg0abCgVVVqVZ3vw48.', '用户', '电子信息系', '管理员', '男', '1111@qq.com', NULL, '2025-05-09 12:17:37.545', '2025-05-09 17:09:20.207', '0', NULL, 0, 'admin');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (63, 8778878, '$2a$10$oSJeBbwkLlEj0XmsF69EgeVwj0bIfQkIeoVLlownHsD3ullEWwOW2', '用户', '电子信息系', 'admin', '女', '111@11.com', NULL, '2025-05-09 12:18:29.863', NULL, '0', NULL, 0, 'admin');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (64, 12344555, '$2a$10$ZOG5zRtk05hKduH.6cX5V.LM8GEE88xPTFsPc8UAXo0ronhMmQrZq', '用户', NULL, NULL, NULL, NULL, NULL, '2025-05-09 17:41:03.621', NULL, '0', '[]', 1, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (65, 6677777, '$2a$10$XzgFyRoUJ/bItx8DJGtmkOyf8Y8oozBxgQPgQc86cSTLEp7HWpYw2', '教师', NULL, NULL, NULL, NULL, NULL, '2025-05-09 17:47:34.291', NULL, '0', '[]', 1, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (66, 88888888, '$2a$10$Bf69NOPr3qZr9SrAP6.8Je6L19a77X1Qo1WdfclJTT9NwhDZj8UL2', '教师', NULL, NULL, NULL, NULL, NULL, '2025-05-09 18:40:28.586', NULL, '0', '[]', 1, NULL);
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (67, 1458151695, '$2a$10$1A49KuNTfjgoaunu3PLF/OhnU.TdfvVfOfago0QO9AP.iesMvxCtS', '教师', '电子信息系', 'jn', '男', '1111@qq.com', NULL, '2025-05-09 18:46:48.372', NULL, '0', '[39,40]', 1, 'teacher');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (68, 127777, '$2a$10$CDs2DTSr35IpBwFrCt68z.chiKj6X1L.gV0vDs3vPmrpIadLPFwOG', '学生', '电子信息系', 'jz', '男', '11@153.com', NULL, '2025-05-09 18:50:17.718', NULL, '0', '[39,40]', 1, 'student');
INSERT INTO `users` (`id`, `account`, `password`, `identity`, `department`, `name`, `sex`, `email`, `image_url`, `create_time`, `update_time`, `status`, `read_list`, `read_status`, `role`) VALUES (69, 345678, '$2a$10$/ucbaK0ynpzGQWGXxgWe2.//sWoe3KBQ2.m4VGXfGSJejAQAsMKfq', '管理员', '电子信息系', 'jn', '男', '1234@163.com', NULL, '2025-05-09 19:53:42.793', NULL, '0', '[]', 1, 'admin');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
