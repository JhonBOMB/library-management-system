SET NAMES utf8mb4;

-- =============================================
-- 图书管理系统数据库表结构（仅表结构和数据）
-- =============================================

USE ry-vue;

-- ----------------------------
-- 1. 图书分类表
-- ----------------------------
DROP TABLE IF EXISTS `lib_category`;
CREATE TABLE `lib_category` (
  `category_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '分类ID',
  `parent_id` bigint(20) DEFAULT 0 COMMENT '父分类ID',
  `category_name` varchar(50) NOT NULL COMMENT '分类名称',
  `order_num` int(4) DEFAULT 0 COMMENT '显示顺序',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='图书分类表';

-- ----------------------------
-- 2. 图书信息表
-- ----------------------------
DROP TABLE IF EXISTS `lib_book`;
CREATE TABLE `lib_book` (
  `book_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '图书ID',
  `isbn` varchar(20) DEFAULT NULL COMMENT 'ISBN号',
  `book_name` varchar(200) NOT NULL COMMENT '书名',
  `author` varchar(100) DEFAULT NULL COMMENT '作者',
  `publisher` varchar(100) DEFAULT NULL COMMENT '出版社',
  `publish_date` date DEFAULT NULL COMMENT '出版日期',
  `category_id` bigint(20) DEFAULT NULL COMMENT '分类ID',
  `price` decimal(10,2) DEFAULT NULL COMMENT '价格',
  `total_quantity` int(11) DEFAULT 0 COMMENT '总库存数量',
  `available_quantity` int(11) DEFAULT 0 COMMENT '可借数量',
  `cover_image` varchar(500) DEFAULT NULL COMMENT '封面图片URL',
  `description` text COMMENT '图书简介',
  `location` varchar(100) DEFAULT NULL COMMENT '存放位置',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`book_id`),
  UNIQUE KEY `idx_isbn` (`isbn`),
  KEY `idx_category` (`category_id`),
  KEY `idx_book_name` (`book_name`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='图书信息表';

-- ----------------------------
-- 3. 读者信息表
-- ----------------------------
DROP TABLE IF EXISTS `lib_reader`;
CREATE TABLE `lib_reader` (
  `reader_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '读者ID',
  `card_no` varchar(50) NOT NULL COMMENT '借书证号',
  `reader_name` varchar(50) NOT NULL COMMENT '读者姓名',
  `gender` char(1) DEFAULT '0' COMMENT '性别（0男 1女 2未知）',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `id_card` varchar(18) DEFAULT NULL COMMENT '身份证号',
  `address` varchar(200) DEFAULT NULL COMMENT '地址',
  `reader_type` char(1) DEFAULT '0' COMMENT '读者类型（0普通读者 1VIP读者 2教师 3学生）',
  `max_borrow_count` int(4) DEFAULT 5 COMMENT '最大借阅数量',
  `max_borrow_days` int(4) DEFAULT 30 COMMENT '最大借阅天数',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用 2冻结）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`reader_id`),
  UNIQUE KEY `idx_card_no` (`card_no`),
  KEY `idx_reader_name` (`reader_name`),
  KEY `idx_phone` (`phone`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='读者信息表';

-- ----------------------------
-- 4. 借阅记录表
-- ----------------------------
DROP TABLE IF EXISTS `lib_borrow_record`;
CREATE TABLE `lib_borrow_record` (
  `record_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '记录ID',
  `book_id` bigint(20) NOT NULL COMMENT '图书ID',
  `reader_id` bigint(20) NOT NULL COMMENT '读者ID',
  `borrow_date` datetime NOT NULL COMMENT '借阅日期',
  `due_date` datetime NOT NULL COMMENT '应还日期',
  `return_date` datetime DEFAULT NULL COMMENT '实际归还日期',
  `renew_count` int(4) DEFAULT 0 COMMENT '续借次数',
  `status` char(1) DEFAULT '0' COMMENT '状态（0借阅中 1已归还 2逾期 3已续借）',
  `overdue_days` int(11) DEFAULT 0 COMMENT '逾期天数',
  `fine_amount` decimal(10,2) DEFAULT 0.00 COMMENT '罚金金额',
  `is_paid` char(1) DEFAULT '0' COMMENT '罚金是否已支付（0未支付 1已支付）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0存在 2删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`record_id`),
  KEY `idx_book_id` (`book_id`),
  KEY `idx_reader_id` (`reader_id`),
  KEY `idx_status` (`status`),
  KEY `idx_borrow_date` (`borrow_date`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8mb4 COMMENT='借阅记录表';

-- ----------------------------
-- 初始化图书分类数据
-- ----------------------------
INSERT INTO `lib_category` VALUES (1, 0, '计算机类', 1, '0', '0', 'admin', NOW(), '', NULL, '计算机相关书籍');
INSERT INTO `lib_category` VALUES (2, 1, '编程语言', 1, '0', '0', 'admin', NOW(), '', NULL, 'Java、Python等编程语言');
INSERT INTO `lib_category` VALUES (3, 1, '数据库', 2, '0', '0', 'admin', NOW(), '', NULL, 'MySQL、Oracle等数据库');
INSERT INTO `lib_category` VALUES (4, 1, '算法与数据结构', 3, '0', '0', 'admin', NOW(), '', NULL, '算法、数据结构相关');
INSERT INTO `lib_category` VALUES (5, 0, '文学类', 2, '0', '0', 'admin', NOW(), '', NULL, '文学作品');
INSERT INTO `lib_category` VALUES (6, 5, '小说', 1, '0', '0', 'admin', NOW(), '', NULL, '各类小说');
INSERT INTO `lib_category` VALUES (7, 5, '散文', 2, '0', '0', 'admin', NOW(), '', NULL, '散文作品');
INSERT INTO `lib_category` VALUES (8, 0, '历史类', 3, '0', '0', 'admin', NOW(), '', NULL, '历史相关书籍');
INSERT INTO `lib_category` VALUES (9, 0, '经济管理', 4, '0', '0', 'admin', NOW(), '', NULL, '经济管理类书籍');
INSERT INTO `lib_category` VALUES (10, 0, '科学技术', 5, '0', '0', 'admin', NOW(), '', NULL, '科学技术类书籍');

-- ----------------------------
-- 初始化示例图书数据
-- ----------------------------
INSERT INTO `lib_book` VALUES (1, '9787115428028', 'Java核心技术 卷I', 'Cay S. Horstmann', '人民邮电出版社', '2016-09-01', 2, 119.00, 10, 8, NULL, 'Java领域经典参考书，详细介绍了Java语言的核心概念', 'A区-01架', '0', '0', 'admin', NOW(), '', NULL, '推荐书籍');
INSERT INTO `lib_book` VALUES (2, '9787115545664', 'Python编程：从入门到实践', 'Eric Matthes', '人民邮电出版社', '2020-10-01', 2, 89.00, 15, 12, NULL, 'Python入门经典教程，适合初学者', 'A区-02架', '0', '0', 'admin', NOW(), '', NULL, NULL);
INSERT INTO `lib_book` VALUES (3, '9787111558422', 'MySQL必知必会', 'Ben Forta', '机械工业出版社', '2017-01-01', 3, 39.00, 8, 6, NULL, 'MySQL入门经典，简明实用', 'A区-03架', '0', '0', 'admin', NOW(), '', NULL, NULL);
INSERT INTO `lib_book` VALUES (4, '9787111641247', '算法导论（第3版）', 'Thomas H.Cormen等', '机械工业出版社', '2019-12-01', 4, 128.00, 5, 4, NULL, '算法领域的经典之作', 'A区-04架', '0', '0', 'admin', NOW(), '', NULL, '经典教材');
INSERT INTO `lib_book` VALUES (5, '9787020002207', '红楼梦', '曹雪芹', '人民文学出版社', '1996-12-01', 6, 59.70, 20, 15, NULL, '中国古典四大名著之一', 'B区-01架', '0', '0', 'admin', NOW(), '', NULL, '名著');

-- ----------------------------
-- 初始化示例读者数据
-- ----------------------------
INSERT INTO `lib_reader` VALUES (1, 'RC202401001', '张三', '0', '13800138001', 'zhangsan@example.com', '110101199001011234', '北京市朝阳区', '3', 10, 60, '0', '0', 'admin', NOW(), '', NULL, '学生读者');
INSERT INTO `lib_reader` VALUES (2, 'RC202401002', '李四', '1', '13800138002', 'lisi@example.com', '110101199102021234', '北京市海淀区', '0', 5, 30, '0', '0', 'admin', NOW(), '', NULL, '普通读者');
INSERT INTO `lib_reader` VALUES (3, 'RC202401003', '王五', '0', '13800138003', 'wangwu@example.com', '110101198503031234', '北京市东城区', '2', 15, 90, '0', '0', 'admin', NOW(), '', NULL, '教师读者');

SELECT 'Library tables created and data inserted successfully!' AS Result;
