/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2022-11-15 18:45:32
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for attach
-- ----------------------------
DROP TABLE IF EXISTS `attach`;
CREATE TABLE `attach` (
  `file_id` bigint(20) NOT NULL,
  `business_id` bigint(20) DEFAULT NULL,
  `file_name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_size` bigint(11) NOT NULL COMMENT '单位是byte',
  `file_ext` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `file_url` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of attach
-- ----------------------------
INSERT INTO `attach` VALUES ('1508500970668096', '1508500970668064', '20220804.docx', '15030', 'docx', '20220804_1665994079321.docx', '2022-10-17 16:08:36');
INSERT INTO `attach` VALUES ('1508500970668128', '1508500970668064', 'jquery-3.6.0.js', '288580', '6', 'jquery-3_1665994081907.6', '2022-10-17 16:08:36');
INSERT INTO `attach` VALUES ('1508505106251840', '1508505106251808', '20220804.docx', '15030', 'docx', '20220804_1665996080427.docx', '2022-10-17 16:41:28');
INSERT INTO `attach` VALUES ('1508505106251872', '1508505106251808', 'jquery-3.6.0.js', '288580', '6', 'jquery-3_1665996082897.6', '2022-10-17 16:41:28');
INSERT INTO `attach` VALUES ('1508505106251904', '1508505106251808', 'login.html', '523', 'html', 'login_1665996086183.html', '2022-10-17 16:41:28');

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `title` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `index_age_name` (`age`,`name`) USING BTREE,
  KEY `title_index` (`title`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of demo
-- ----------------------------
INSERT INTO `demo` VALUES ('1', '张三', '20', null);
INSERT INTO `demo` VALUES ('2', '李四', '21', null);
INSERT INTO `demo` VALUES ('3', '王五', '20', null);
INSERT INTO `demo` VALUES ('4', '张三丰', '20', null);
INSERT INTO `demo` VALUES ('5', '张无忌', '20', null);

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table` (
  `table_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) COLLATE utf8_bin DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) COLLATE utf8_bin DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) COLLATE utf8_bin DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) COLLATE utf8_bin DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表';

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES ('1', 'user', '', null, null, 'User', 'crud', 'com.ruoyi.system', 'system', 'user', null, 'ruoyi', '0', '/', null, 'admin', '2022-09-19 16:33:36', '', null, null);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column` (
  `column_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) COLLATE utf8_bin DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) COLLATE utf8_bin DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '字典类型',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='代码生成业务表字段';

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES ('1', '1', 'id', null, 'bigint(20)', 'Long', 'id', '1', '0', null, '1', null, null, null, 'EQ', 'input', '', '1', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('2', '1', 'username', null, 'varchar(15)', 'String', 'username', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '2', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('3', '1', 'password', null, 'varchar(255)', 'String', 'password', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '3', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('4', '1', 'phone', null, 'varchar(11)', 'String', 'phone', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '4', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('5', '1', 'age', null, 'tinyint(3)', 'Integer', 'age', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '5', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('6', '1', 'nickname', null, 'varchar(20)', 'String', 'nickname', '0', '0', null, '1', '1', '1', '1', 'LIKE', 'input', '', '6', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('7', '1', 'sex', '0男 1女 2未知', 'tinyint(1)', 'Integer', 'sex', '0', '0', null, '1', '1', '1', '1', 'EQ', 'select', '', '7', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('8', '1', 'enabled', '0停用 1启用', 'tinyint(1)', 'Integer', 'enabled', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '8', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('9', '1', 'description', null, 'varchar(300)', 'String', 'description', '0', '0', null, '1', '1', '1', '1', 'EQ', 'input', '', '9', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('10', '1', 'create_time', null, 'datetime', 'Date', 'createTime', '0', '0', null, '1', null, null, null, 'EQ', 'datetime', '', '10', 'admin', '2022-09-19 16:33:36', '', null);
INSERT INTO `gen_table_column` VALUES ('11', '1', 'update_time', null, 'datetime', 'Date', 'updateTime', '0', '0', null, '1', '1', null, null, 'EQ', 'datetime', '', '11', 'admin', '2022-09-19 16:33:36', '', null);

-- ----------------------------
-- Table structure for login_log
-- ----------------------------
DROP TABLE IF EXISTS `login_log`;
CREATE TABLE `login_log` (
  `log_id` bigint(20) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of login_log
-- ----------------------------

-- ----------------------------
-- Table structure for login_log_copy
-- ----------------------------
DROP TABLE IF EXISTS `login_log_copy`;
CREATE TABLE `login_log_copy` (
  `log_id` bigint(20) NOT NULL,
  `username` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of login_log_copy
-- ----------------------------

-- ----------------------------
-- Table structure for parameter
-- ----------------------------
DROP TABLE IF EXISTS `parameter`;
CREATE TABLE `parameter` (
  `parameter_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `appeal` bigint(20) DEFAULT NULL COMMENT '众裁申诉期',
  `peoper` bigint(20) DEFAULT NULL COMMENT '众裁人数',
  `Publisher` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '发布者',
  `Respondent` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '悬赏者',
  `collect` bigint(20) DEFAULT NULL COMMENT '收集时间',
  PRIMARY KEY (`parameter_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of parameter
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='Blob类型的触发器表';

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`,`calendar_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='日历信息表';

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) COLLATE utf8_bin DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='Cron类型的触发器表';

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) COLLATE utf8_bin NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(20) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(20) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='已触发的触发器表';

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) COLLATE utf8_bin NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) COLLATE utf8_bin NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='任务详细信息表';

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) COLLATE utf8_bin NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`,`lock_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------
INSERT INTO `qrtz_locks` VALUES ('quartzScheduler', 'TRIGGER_ACCESS');

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='暂停的触发器表';

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(20) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(20) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='调度器状态表';

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(20) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(20) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(20) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='简单触发器的信息表';

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) COLLATE utf8_bin DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(11) DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(20) DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13,4) DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='同步机制的行锁表';

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) COLLATE utf8_bin DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(20) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(20) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(20) NOT NULL COMMENT '开始时间',
  `end_time` bigint(20) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(6) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`) USING BTREE,
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='触发器详细信息表';

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for reward
-- ----------------------------
DROP TABLE IF EXISTS `reward`;
CREATE TABLE `reward` (
  `reward_id` bigint(20) NOT NULL,
  `id` bigint(20) DEFAULT NULL,
  `title` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `status` varchar(2) COLLATE utf8_bin DEFAULT NULL COMMENT '10 草稿 11 已发布 ',
  `verify` tinyint(1) DEFAULT NULL COMMENT '0未通过 1审核中 2通过',
  `amount` int(11) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `shield` tinyint(1) DEFAULT NULL COMMENT '屏蔽 0否 1是',
  `del` tinyint(1) DEFAULT NULL COMMENT '0否 1是',
  `top` tinyint(1) DEFAULT NULL,
  `best_answer` tinyint(1) DEFAULT NULL,
  `recommend` tinyint(1) DEFAULT NULL,
  `time_out` tinyint(1) DEFAULT NULL COMMENT '0正常 1超时',
  `published_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`reward_id`) USING BTREE,
  KEY `FK_Reference_1` (`id`) USING BTREE,
  KEY `reward_title_index` (`title`) USING BTREE,
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='主表';

-- ----------------------------
-- Records of reward
-- ----------------------------
INSERT INTO `reward` VALUES ('1', '1', '悬赏1', 0xE4B88EE6B094E58099E58F98E58C96E8B59BE8B791EFBC8CE4B8ADE59BBDE4BC81E4B89AE4B880E9A9ACE5BD93E58588E38082E7BB8FE8BF87E5A49AE5B9B4E79A84E4BAA7E4B89AE7A7AFE7B4AFEFBC8CE4B8ADE59BBDE4BC81E4B89AE5B7B2E59CA8E7BBBFE889B2E4BAA4E9809AE9A286E59F9FE585B7E69C89E4B8BBE59CBAE4BC98E58ABFE28094E28094E4B8ADE59BBDE4BC81E4B89AE7949FE4BAA7E4BA86E585A8E79083E8B685E8BF87E4B880E58D8AE79A84E794B5E58AA8E6B1BDE8BDA6EFBC8CE5908CE697B6E68890E4B8BAE79BAEE5898DE585A8E79083E794B5E6B1A0E4BAA7E4B89AE79A84E4B8ADE5BF83EFBC8CE794B5E6B1A0E4BAA7E9878FE4B88EE5B882E59CBAE8A784E6A8A1E59D87E5B185E4B896E7958CE7ACACE4B880EFBC8CE5AE9EE78EB0E4BA86E59CA8E6B1BDE8BDA6E4BAA7E4B89AE79A84E68DA2E98193E8B685E8BDA6E380820D0A0D0AE59CA8E58AA0E585A5E8BF9CE699AFE99B86E59BA2E4B98BE5898DEFBC8CE5BC97E69C97E88CA8E59CA8E5BEB7E4BC81E68B85E4BBBBE4BA863230E5A49AE5B9B4E9AB98E7AEA1EFBC8CE4B8BBE8A681E8B49FE8B4A3E8B1AAE58D8EE8BDA6E7BB86E58886E5B882E59CBAE38082E2809CE4B880E4B8AAE581B6E784B6E79A84E69CBAE4BC9AEFBC8CE68891E590ACE588B0E8BF9CE699AFE99B86E59BA2E5889BE5A78BE4BABAE585BCE9A696E5B8ADE689A7E8A18CE5AE98E5BCA0E99BB7E58886E4BAABE99B86E59BA2E5AFB9E58FAFE5868DE7949FE883BDE6BA90E38081E794B5E6B1A0E38081E582A8E883BDE38081E58585E794B5E5928CE699BAE883BDE789A9E88194E9A286E59F9FE79A84E585B3E6B3A8E5928CE68EA2E7B4A2EFBC8CE794A8E7A791E68A80E5889BE696B0E58AA9E58A9BE99BB6E7A2B3E8BDACE59E8BEFBC8CE99D9EE5B8B8E585B7E69C89E5898DE79EBBE680A7EFBC8CE4B88EE68891E5BD93E697B6E5819AE79A84E5B7A5E4BD9CE4B88DE4B880E6A0B7E38082E2809DE5BC97E69C97E88CA8E59B9EE5BF86E98193EFBC8CE4BA8EE698AFE4BB96E586B3E5AE9AE58AA0E585A5E8BF99E5AEB6E585A8E79083E9A286E58588E79A84E7BBBFE889B2E7A791E68A80E585ACE58FB8EFBC8CE4B8BAE585ACE58FB8E58F91E5B195E58AA9E58A9BEFBC8CE5ADA6E4B9A0E69BB4E5A49AE696B0E4BA8BE789A9E38082, '11', '2', '11111', null, null, null, '1', null, null, null, '2022-10-04 14:22:32', '2022-10-04 10:23:11');
INSERT INTO `reward` VALUES ('2', '1', '悬赏标题', null, '11', '2', null, null, null, null, '1', null, null, null, '2022-10-05 14:23:00', '2022-10-05 12:23:03');
INSERT INTO `reward` VALUES ('3', '1', '悬赏发布草稿', null, '10', '2', null, null, null, null, '0', null, null, null, null, '2022-10-05 14:27:37');
INSERT INTO `reward` VALUES ('4', '1', '悬赏2', 0x32333231333132, '11', '2', '10000', null, null, null, '0', null, null, null, '2022-10-07 03:50:22', '2022-10-06 14:50:25');
INSERT INTO `reward` VALUES ('5', '1', '悬赏3', 0xE8BF99E4B8AAE998BFE696AFE89282E88AACE68980E58F91E7949FE79A84, '11', '2', '20062', null, null, null, '0', null, null, null, '2022-10-07 14:51:15', '2022-10-07 14:51:12');
INSERT INTO `reward` VALUES ('6', '1', '悬赏4', 0xE4B8ADE59BBDE69C89E5A49AE5B091E4B8AAE79C81E5B882, '11', '2', '15021', null, null, null, '0', null, null, null, '2022-10-07 14:52:04', '2022-10-07 14:52:02');
INSERT INTO `reward` VALUES ('7', '1', '悬赏5', 0x313233333231, '11', '2', '123456', null, '0', '0', '0', '0', '0', '0', '2022-10-07 17:25:41', '2022-10-07 17:25:38');
INSERT INTO `reward` VALUES ('1507414501228576', '1', '发布的悬赏001', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C2F703E, '11', '2', '1000', '2022-10-14 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-11 16:14:08', '2022-10-11 16:14:08');
INSERT INTO `reward` VALUES ('1507414677389344', '1', '保存草稿的悬赏001', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682AC3C2F7370616E3E3C2F703E3C703E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE8B58FE58685E5AEB93C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C7370616E207374796C653D22636F6C6F723A20233630363236363B20666F6E742D66616D696C793A20496E7465722C202D6170706C652D73797374656D2C20426C696E6B4D616353797374656D466F6E742C202671756F743B5365676F652055492671756F743B2C20526F626F746F2C204F787967656E2C205562756E74752C2043616E746172656C6C2C202671756F743B466972612053616E732671756F743B2C202671756F743B44726F69642053616E732671756F743B2C202671756F743B48656C766574696361204E6575652671756F743B2C2073616E732D73657269663B20666F6E742D73697A653A20313470783B206261636B67726F756E642D636F6C6F723A20234646464646463B223EE682ACE8B58FE58685E5AEB93C2F7370616E3E3C2F703E3C703E3C62722F3E3C2F703E3C703E68656C6C6C6F20776F726C643C2F703E3C703EE5BE90E698AFE593AAE4B8AA3C2F703E, '10', '2', '2536', '2022-10-14 00:00:00', '0', '0', '0', '0', '0', '0', null, '2022-10-11 16:15:32');
INSERT INTO `reward` VALUES ('1507416529174560', '1', 'fffffff', 0x3C703E31323331323331323332313C2F703E, '11', '2', '1', '2022-10-13 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-11 16:30:14', '2022-10-11 16:30:14');
INSERT INTO `reward` VALUES ('1507416634032160', '1', 'sdfsdfsdfsdf', 0x3C703E313233313233313233323131323331323331323332313132333132333132333231313233313233313233323131323331323331323332313132333132333132333231313233313233313233323131323331323331323332313132333132333132333231313233313233313233323131323331323331323332313C2F703E, '11', '2', '1', '2022-10-13 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-11 16:31:04', '2022-10-11 16:31:04');
INSERT INTO `reward` VALUES ('1507416688558112', '1', 'sdfsdfsdfsdf', 0x3C703E313233313233313233323131323331323331323332313132333132333132333231313233313233313233323131323331323331323332313132333132333132333231313233313233313233323131323331323331323332313132333132333132333231313233313233313233323131323331323331323332313C2F703E, '11', '2', '1', '2022-10-13 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-11 16:31:31', '2022-10-11 16:31:31');
INSERT INTO `reward` VALUES ('1507424185876512', '1', '定时任务1', 0x3C703E313233323133313C2F703E, '11', '2', '111', '2022-10-11 17:32:00', '0', '0', '0', '0', '0', '0', '2022-10-11 17:31:06', '2022-10-11 17:31:06');
INSERT INTO `reward` VALUES ('1507424701775904', '1', '定时任务2', 0x3C703E313233323133313C2F703E, '11', '2', '111', '2022-10-11 17:36:00', '0', '0', '0', '0', '0', '0', '2022-10-11 17:35:11', '2022-10-11 17:35:11');
INSERT INTO `reward` VALUES ('1507604144586784', '1', '共产党', 0x3C703E31323132313231323C2F703E, '11', '2', '1212', '2022-10-29 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-12 17:21:16', '2022-10-12 17:21:16');
INSERT INTO `reward` VALUES ('1507604601765920', '1', '我发布的悬赏1', 0x3C703E31323132313231323C2F703E, '11', '2', '1212', '2022-10-29 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-12 17:24:55', '2022-10-12 17:24:55');
INSERT INTO `reward` VALUES ('1507604610154528', '1', '我发布的悬赏2', 0x3C703E31323132313231323C2F703E, '11', '2', '1212', '2022-10-29 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-12 17:24:59', '2022-10-12 17:24:59');
INSERT INTO `reward` VALUES ('1507604618543136', '1', '我发布的悬赏3', 0x3C703E31323132313231323C2F703E, '11', '2', '1212', '2022-10-29 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-12 17:25:02', '2022-10-12 17:25:02');
INSERT INTO `reward` VALUES ('1507604626931744', '1', '我发布的悬赏4', 0x3C703E31323132313231323C2F703E, '11', '2', '1212', '2022-10-29 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-12 17:25:07', '2022-10-12 17:25:07');
INSERT INTO `reward` VALUES ('1507606134784032', '1', '腐败悬挂', 0x3C703E73646673666673643C2F703E, '10', null, '111', '2022-10-14 00:00:00', '0', '0', '0', '0', '0', '0', null, '2022-10-12 17:37:05');
INSERT INTO `reward` VALUES ('1507606862495776', '1', '312321', 0x3C703E31333231333231333C2F703E, '11', '1', '1', '2022-10-14 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-12 17:42:53', '2022-10-12 17:42:53');
INSERT INTO `reward` VALUES ('1507606933798944', '1', 'sdfsdf', '', '10', null, null, null, '0', '0', '0', '0', '0', '0', null, '2022-10-12 17:43:27');
INSERT INTO `reward` VALUES ('1507607038656544', '1', '312312312', 0x3C703E31333231333132333C2F703E, '11', '1', '1', '2022-10-15 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-12 17:44:16', '2022-10-12 17:44:16');
INSERT INTO `reward` VALUES ('1507607051239456', '1', 'sdfdsfdsfsd', '', '10', null, null, null, '0', '0', '0', '0', '0', '0', null, '2022-10-12 17:44:22');
INSERT INTO `reward` VALUES ('1507607361617952', '1', '31321312', 0x3C703E3232313331323331323C2F703E, '10', null, '1', '2022-10-22 00:00:00', '0', '0', '0', '0', '0', '0', null, '2022-10-12 17:46:50');
INSERT INTO `reward` VALUES ('1507607437115424', '1', '2131', 0x3C703E313233323133313C2F703E, '10', null, '1', '2022-10-15 00:00:00', '0', '0', '0', '0', '0', '0', null, '2022-10-12 17:47:27');
INSERT INTO `reward` VALUES ('1507607460184096', '1', '12321312', 0x3C703E31323332313331323C2F703E, '11', '2', '1', '2022-10-12 17:47:34', '0', '0', '0', '0', '0', '0', '2022-10-13 23:59:59', '2022-10-12 17:47:37');
INSERT INTO `reward` VALUES ('1508500970668064', '1', '附件上传1', 0x3C703E66647366736466733C2F703E, '11', '1', '111', '2022-10-19 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-17 16:08:36', '2022-10-17 16:08:36');
INSERT INTO `reward` VALUES ('1508505106251808', '1', '测试附件2', 0x3C703E73667364667364667364663C2F703E, '11', '1', '123', '2022-10-18 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-17 16:41:28', '2022-10-17 16:41:28');
INSERT INTO `reward` VALUES ('1508667874607136', '1', '定时1', 0x3C703E3132336464643C2F703E, '11', '1', '123', '2022-11-18 14:16:00', '0', '0', '0', '0', '0', '0', '2022-10-18 14:15:02', '2022-10-18 14:15:02');
INSERT INTO `reward` VALUES ('1508668512141344', '1', 'dingshi1', 0x3C703E323132313231323132313C2F703E, '11', '1', '11', '2022-10-19 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-18 14:20:06', '2022-10-18 14:20:06');
INSERT INTO `reward` VALUES ('1508668744925216', '1', 'dingshi2', 0x3C703E31313131313C2F703E, '11', '1', '11', '2022-10-19 00:00:00', '0', '0', '0', '0', '0', '0', '2022-10-18 14:21:57', '2022-10-18 14:21:57');
INSERT INTO `reward` VALUES ('1508669172744224', '1', 'dingshi3', 0x3C703E3132313231323132313C2F703E, '11', '1', '11', '2022-10-19 00:00:00', '0', '0', '0', '0', '0', '1', '2022-10-18 14:25:21', '2022-10-20 14:25:55');
INSERT INTO `reward` VALUES ('1508670527504416', '1', '定时任务11', 0x3C703E323331323331323331323331323C2F703E, '11', '1', '112', '2022-10-18 14:36:50', '0', '0', '0', '0', '0', '1', '2022-10-18 14:36:07', '2022-10-18 14:37:05');
INSERT INTO `reward` VALUES ('1508671322325024', '1', '定时任务12', 0x3C703E3331323331323331323C2F703E, '11', '1', '123', '2022-10-18 14:43:20', '0', '0', '0', '0', '0', '1', '2022-10-18 14:42:26', '2022-10-18 14:48:38');
INSERT INTO `reward` VALUES ('1508672184254496', '1', '定时任务13', 0x3C703E31323331323331323C2F703E, '11', '1', '123', '2022-10-18 14:49:40', '0', '0', '0', '0', '0', '1', '2022-10-18 14:49:17', '2022-10-18 14:49:45');
INSERT INTO `reward` VALUES ('1508672538673184', '1', '定时任务14', 0x3C703E3132333132333C2F703E, '11', '2', '123', '2022-10-18 14:52:20', '0', '0', '0', '0', '0', '0', '2022-10-18 14:52:06', '2022-10-27 17:43:42');

-- ----------------------------
-- Table structure for reward_answer
-- ----------------------------
DROP TABLE IF EXISTS `reward_answer`;
CREATE TABLE `reward_answer` (
  `answer_id` bigint(20) NOT NULL,
  `reward_id` bigint(20) DEFAULT NULL,
  `id` bigint(20) DEFAULT NULL,
  `content` text COLLATE utf8_bin,
  `best_answer` tinyint(1) DEFAULT NULL COMMENT '0否 1是',
  `answer_time` datetime DEFAULT NULL,
  PRIMARY KEY (`answer_id`) USING BTREE,
  KEY `FK_Reference_3` (`id`) USING BTREE,
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of reward_answer
-- ----------------------------
INSERT INTO `reward_answer` VALUES ('1506514875449376', '1', '1', 0x3C703E64736664736664736673643C2F703E, '0', '2022-10-06 17:04:32');
INSERT INTO `reward_answer` VALUES ('1506516829995040', '1', '1', 0x3C703E313233313233323133323133323C2F703E, '0', '2022-10-06 17:20:04');
INSERT INTO `reward_answer` VALUES ('1506676863664160', '1', '1', 0x3C703EE59B9EE7AD943C2F703E, '0', '2022-10-07 14:31:54');
INSERT INTO `reward_answer` VALUES ('1506685338255392', '2', '1', 0x3C703EE59B9EE7AD943C2F703E, '0', '2022-10-07 15:39:15');
INSERT INTO `reward_answer` VALUES ('1506692843962400', '2', '1', 0x3C703EE59B9EE7AD943132333C2F703E, '0', '2022-10-07 16:38:55');
INSERT INTO `reward_answer` VALUES ('1507420134178848', '1507414501228576', '1', 0x3C703E736673667366733C2F703E, '0', '2022-10-11 16:58:54');

-- ----------------------------
-- Table structure for sensitives
-- ----------------------------
DROP TABLE IF EXISTS `sensitives`;
CREATE TABLE `sensitives` (
  `id` bigint(20) NOT NULL,
  `word` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of sensitives
-- ----------------------------
INSERT INTO `sensitives` VALUES ('1507599654584352', '穴海', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584384', '协警', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584416', '纳米比亚', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584448', '专业调查', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584480', '有华龙', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584512', 'jq的来', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584544', '电信路', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584576', '第一夫人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584608', '党鞭', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584640', '黄巨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584672', '荡尽天下', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584704', '家元自称玉皇大帝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584736', '主席李世民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584768', '何祚庥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584800', '刘刚', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584832', '不要沉默', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584864', '后勤集团', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584896', '食堂涨价', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584928', '发国难财', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584960', '浪漫邂逅', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654584992', '红满堂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585024', '张小洋', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585056', '炸学校', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585088', '子宫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585120', '叫晶晶的女孩', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585152', '回派', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585184', '社会黑暗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585216', '国之母', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585248', '国母', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585280', '国姆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585312', '东方微点', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585344', '震惊全球', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585376', 'nowto', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585408', 'chengdu', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585440', '徐明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585472', '六月飞雪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585504', '暴力虐待', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585536', '暴力袭击', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585568', '天府广场', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585600', '粮荒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585632', '洗脑班', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585664', '李愚蠢', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585696', '中国猪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585728', '台湾猪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585760', '进化不完全的生命体', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585792', '震死他们', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585856', '10010', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585888', '10086', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585920', '10159', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585952', '13423205670', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654585984', '13725516608', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586016', '13875448369', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586048', '15112886328', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586080', '189', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586112', '6-4tianwang', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586144', '64', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586176', '68170802', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586208', '6a6.net', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586240', '7.31', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586272', '7.310', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586304', '89-64cdjp', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586336', '8945212', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586368', '23条', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586400', '259o', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586432', '381929279', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586464', '3P', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586496', '4-Jun', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586528', 'AV', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586560', 'BJ', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586592', 'CBD', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586624', 'CCTV', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586656', 'CDMA', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586688', 'DICK', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586720', 'Dick', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586752', 'FLG', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586784', 'FOCUSC', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586816', 'FUCK', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586848', 'Fuck', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586880', 'GAMEMASTER', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586912', 'GCD', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586944', 'GameMaster', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654586976', 'IP17908', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587008', 'KEY_TEXT', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587040', 'NMD', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587072', 'QQb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587104', 'SM', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587136', 'Soccer01.com', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587168', 'TMD', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587200', 'UltraSurf', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587232', 'bignews', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587264', 'Bitch', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587296', 'boxun', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587328', 'Chinaliberal', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587360', 'chinamz', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587392', 'Chinesenewsnet', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587424', 'cnd', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587456', 'Creaders', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587488', 'dafa', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587520', 'Dajiyuan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587552', 'df\'d', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587584', 'Dfdz', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587616', 'die', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587648', 'dpp', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587680', 'Freechina', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587712', 'freedom', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587744', 'Freenet', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587776', 'fuck', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587808', 'fuck your mother', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587840', 'hongzhi', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587872', 'hrichina', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587904', 'huanet', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587936', 'hypermart.net', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654587968', 'incest', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588000', 'jiangdongriji', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588032', 'l2590803027', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588064', 'lihongzhi', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588096', 'ma', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588128', 'making', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588160', 'minghui', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588192', 'minghuinews', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588224', 'nacb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588256', 'na?ve', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588288', 'nmis', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588320', 'paper64', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588352', 'peacehall', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588384', 'piao', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588416', 'playboy', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588448', 'renminbao', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588480', 'renmingbao', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588512', 'rfa', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588544', 'safeweb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588576', 'sex', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588608', 'shit', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588640', 'simple', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588672', 'svdc', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588704', 'taip', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588736', 'tibetalk', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588768', 'triangle', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588800', 'triangleboy', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588832', 'txwq.net', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588864', 'unixbox', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588896', 'ustibet', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588928', 'voa', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588960', 'voachinese', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654588992', 'wangce', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589024', 'wstaiji', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589056', 'www', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589088', 'xinsheng', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589120', 'yuming', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589152', 'yy通讯录', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589184', 'zhengjian', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589216', 'zhengjianwang', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589248', 'zhenshanren', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589280', 'zhuanfalu', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589312', 'zhuanfalun', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589344', '八九', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589376', '八老', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589408', '腐败中国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589440', '三个呆婊', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589472', '你办事我放心', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589504', '社会主义灭亡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589536', '打倒中国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589568', '打倒共产党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589600', '打倒共产主义', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589632', '打倒胡锦涛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589664', '打倒江泽民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589696', '打倒江主席', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589728', '打倒李鹏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589760', '打倒罗干', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589792', '打倒温家宝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589824', '打倒中共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589856', '打倒朱镕', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589888', '抵制共产党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589920', '抵制共产主义', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589952', '抵制胡锦涛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654589984', '抵制江泽民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590016', '抵制江主席', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590048', '抵制李鹏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590080', '抵制罗干', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590112', '抵制温家宝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590144', '抵制中共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590176', '抵制朱镕基', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590208', '灭亡中国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590240', '亡党亡国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590272', '粉碎四人帮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590304', '激流中国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590336', '特供', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590368', '特贡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590400', '特共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590432', 'zf大楼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590464', '殃视', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590496', '贪污腐败', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590528', '强制拆除', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590560', '形式主义', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590592', '政治风波', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590624', '太子党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590656', '上海帮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590688', '北京帮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590720', '清华帮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590752', '红色贵族', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590784', '权贵集团', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590816', '河蟹社会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590848', '喝血社会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590880', '九风', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590912', '9风', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590944', '十七大', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654590976', '十7大', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591008', '17da', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591040', '九学', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591072', '9学', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591104', '四风', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591136', '4风', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591168', '双规', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591200', '南街村', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591232', '最淫官员', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591264', '警匪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591296', '官匪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591328', '独夫民贼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591360', '官商勾结', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591392', '城管暴力执法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591424', '强制捐款', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591456', '毒豺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591488', '一党执政', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591520', '一党专制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591552', '一党专政', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591584', '专制政权', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591616', '宪法法院', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591648', '胡平', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591680', '苏晓康', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591712', '贺卫方', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591744', '谭作人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591776', '焦国标', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591808', '万润南', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591840', '张志新', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591872', '辛灝年', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591904', '高勤荣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591936', '王炳章', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654591968', '高智晟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592000', '司马璐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592032', '刘晓竹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592064', '刘宾雁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592096', '魏京生', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592128', '寻找林昭的灵魂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592160', '别梦成灰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592192', '谁是新中国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592224', '讨伐中宣部', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592256', '异议人士', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592288', '民运人士', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592320', '启蒙派', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592352', '选国家主席', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592384', '民一主', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592416', 'min主', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592448', '民竹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592480', '民珠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592512', '民猪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592544', 'chinesedemocracy', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592576', '大赦国际', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592608', '国际特赦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592640', 'da选', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592672', '投公', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592704', '公头', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592736', '宪政', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592768', '平反', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592800', '党章', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592832', '维权', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592864', '昝爱宗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592896', '宪章', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592928', '08宪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592960', '08xz', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654592992', '抿主', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593024', '敏主', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593056', '人拳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593088', '人木又', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593120', '人quan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593152', 'renquan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593184', '中国人权', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593216', '中国新民党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593248', '群体事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593280', '群体性事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593312', '上中央', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593344', '去中央', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593376', '讨说法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593408', '请愿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593440', '请命', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593472', '公开信', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593504', '联名上书', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593536', '万人大签名', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593568', '万人骚动', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593600', '截访', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593632', '上访', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593664', 'shangfang', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593696', '信访', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593728', '访民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593760', '集合', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593792', '集会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593824', '组织集体', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593856', '静坐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593888', '静zuo', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593920', 'jing坐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593952', '示威', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654593984', '示wei', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594016', '游行', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594048', 'you行', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594080', '油行', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594112', '游xing', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594144', 'youxing', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594176', '官逼民反', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594208', '反party', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594240', '反共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594272', '抗议', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594304', '亢议', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594336', '抵制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594368', '低制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594400', '底制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594432', 'di制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594464', '抵zhi', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594496', 'dizhi', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594528', 'boycott', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594560', '血书', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594592', '焚烧中国国旗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594624', 'baoluan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594656', '流血冲突', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594688', '出现暴动', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594720', '发生暴动', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594752', '引起暴动', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594784', 'baodong', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594816', '灭共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594848', '杀毙', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594880', '罢工', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594912', '霸工', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594944', '罢考', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654594976', '罢餐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595008', '霸餐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595040', '罢参', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595072', '罢饭', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595104', '罢吃', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595136', '罢食', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595168', '罢课', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595200', '罢ke', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595232', '霸课', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595264', 'ba课', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595296', '罢教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595328', '罢学', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595360', '罢运', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595392', '网特', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595424', '网评员', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595456', '网络评论员', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595488', '五毛党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595520', '五毛们', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595552', '5毛党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595584', '戒严', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595616', 'jieyan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595648', 'jie严', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595680', '戒yan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595712', '8的平方事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595744', '知道64', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595776', '八九年', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595808', '贰拾年', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595840', '2o年', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595872', '20和谐年', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595904', '贰拾周年', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595936', '六四', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654595968', '六河蟹四', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596000', '六百度四', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596032', '六和谐四', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596064', '陆四', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596096', '陆肆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596128', '198964', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596160', '5月35', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596192', '89年春夏之交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596224', '64惨案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596256', '64时期', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596288', '64运动', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596320', '4事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596352', '四事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596384', '北京风波', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596416', '学潮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596448', '学chao', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596480', 'xuechao', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596512', '学百度潮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596544', '门安天', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596576', '天按门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596608', '坦克压大学生', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596640', '民主女神', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596672', '历史的伤口', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596704', '高自联', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596736', '北高联', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596768', '血洗京城', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596800', '四二六社论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596832', '王丹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596864', '柴玲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596896', '沈彤', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596928', '封从德', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596960', '王超华', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654596992', '王维林', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597024', '吾尔开希', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597056', '吾尔开西', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597088', '侯德健', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597120', '阎明复', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597152', '方励之', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597184', '蒋捷连', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597216', '丁子霖', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597248', '辛灏年', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597280', '蒋彦永', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597312', '严家其', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597344', '陈一咨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597376', '中华局域网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597408', '党的喉舌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597440', '互联网审查', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597472', '当局严密封锁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597504', '新闻封锁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597536', '封锁消息', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597568', '爱国者同盟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597600', '关闭所有论坛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597632', '网络封锁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597664', '金盾工程', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597696', 'gfw', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597728', '无界浏览', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597760', '无界网络', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597792', '自由门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597824', '何清涟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597856', '中国的陷阱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597888', '汪兆钧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597920', '记者无疆界', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597952', '境外媒体', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654597984', '维基百科', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598016', '纽约时报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598048', 'bbc中文网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598080', '华盛顿邮报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598112', '世界日报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598144', '东森新闻网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598176', '东森电视', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598208', '星岛日报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598240', 'wikipedia', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598272', 'youtube', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598304', 'googleblogger', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598336', '美国广播公司', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598368', '英国金融时报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598400', '自由亚洲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598432', '自由时报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598464', '中国时报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598496', '反分裂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598528', '威胁论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598560', '左翼联盟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598592', '钓鱼岛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598624', '保钓组织', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598656', '主权', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598688', '弓单', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598720', '火乍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598752', '木仓', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598784', '石肖', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598816', '核蛋', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598848', '步qiang', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598880', 'bao炸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598912', '爆zha', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598944', 'baozha', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654598976', 'zha药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599008', 'zha弹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599040', '炸dan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599072', '炸yao', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599104', 'zhadan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599136', 'zhayao', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599168', 'hmtd', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599200', '三硝基甲苯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599232', '六氟化铀', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599264', '炸药配方', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599296', '弹药配方', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599328', '炸弹配方', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599360', '皮箱炸弹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599392', '火药配方', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599424', '人体炸弹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599456', '人肉炸弹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599488', '解放军', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599520', '兵力部署', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599552', '军转', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599584', '军事社', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599616', '8341部队', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599648', '第21集团军', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599680', '七大军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599712', '7大军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599744', '北京军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599776', '沈阳军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599808', '济南军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599840', '成都军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599872', '广州军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599904', '南京军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599936', '兰州军区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654599968', '颜色革命', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600000', '规模冲突', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600032', '塔利班', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600064', '基地组织', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600096', '恐怖分子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600128', '恐怖份子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600160', '三股势力', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600192', '印尼屠华', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600224', '印尼事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600256', '蒋公纪念歌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600288', '马英九', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600320', 'mayingjiu', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600352', '李天羽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600384', '苏贞昌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600416', '林文漪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600448', '陈水扁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600480', '陈s扁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600512', '陈随便', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600544', '阿扁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600576', 'a扁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600608', '告全国同胞书', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600640', '台百度湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600672', '台完', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600704', '台wan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600736', 'taiwan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600768', '台弯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600800', '湾台', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600832', '台湾国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600864', '台湾共和国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600896', '台军', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600928', '台独', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600960', '台毒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654600992', '台du', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601024', 'taidu', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601056', 'twdl', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601088', '一中一台', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601120', '打台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601152', '两岸战争', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601184', '攻占台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601216', '支持台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601248', '进攻台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601280', '占领台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601312', '统一台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601344', '收复台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601376', '登陆台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601408', '解放台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601440', '解放tw', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601472', '解决台湾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601504', '光复民国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601536', '台湾独立', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601568', '台湾问题', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601600', '台海问题', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601632', '台海危机', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601664', '台海统一', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601696', '台海大战', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601728', '台海战争', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601760', '台海局势', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601792', '入联', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601824', '入耳关', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601856', '中华联邦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601888', '国民党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601920', 'x民党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601952', '民进党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654601984', '青天白日', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602016', '闹独立', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602048', 'duli', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602080', 'fenlie', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602112', '日本万岁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602144', '小泽一郎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602176', '劣等民族', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602208', '汉人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602240', '汉维', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602272', '维汉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602304', '维吾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602336', '吾尔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602368', '热比娅', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602400', '伊力哈木', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602432', '疆独', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602464', '东突厥斯坦解放组织', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602496', '东突解放组织', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602528', '蒙古分裂分子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602560', '列确', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602592', '阿旺晋美', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602624', '藏人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602656', '臧人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602688', 'zang人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602720', '藏民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602752', '藏m', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602784', '达赖', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602816', '赖达', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602848', 'dalai', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602880', '哒赖', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602912', 'dl喇嘛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602944', '丹增嘉措', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654602976', '打砸抢', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603008', '西独', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603040', '藏独', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603072', '葬独', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603104', '臧独', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603136', '藏毒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603168', '藏du', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603200', 'zangdu', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603232', '支持zd', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603264', '藏暴乱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603296', '藏青会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603328', '雪山狮子旗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603360', '拉萨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603392', '啦萨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603424', '啦沙', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603456', '啦撒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603488', '拉sa', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603520', 'lasa', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603552', 'la萨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603584', '西藏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603616', '藏西', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603648', '藏春阁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603680', '藏獨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603712', '藏独', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603744', '藏独立', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603776', '藏妇会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603808', '藏青会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603840', '藏字石', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603872', 'xizang', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603904', 'xi藏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603936', 'x藏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654603968', '西z', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604000', 'tibet', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604032', '希葬', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604064', '希藏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604096', '硒藏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604128', '稀藏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604160', '西脏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604192', '西奘', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604224', '西葬', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604256', '西臧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604288', '援藏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604320', 'bjork', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604352', '王千源', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604384', '安拉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604416', '回教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604448', '回族', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604480', '回回', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604512', '回民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604544', '穆斯林', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604576', '穆罕穆德', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604608', '穆罕默德', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604640', '默罕默德', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604672', '伊斯兰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604704', '圣战组织', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604736', '清真', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604768', '清zhen', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604800', 'qingzhen', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604832', '真主', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604864', '阿拉伯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604896', '高丽棒子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604928', '韩国狗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604960', '满洲第三帝国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654604992', '满狗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605024', '鞑子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605056', '江丑闻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605088', '江嫡系', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605120', '江毒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605152', '江独裁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605184', '江蛤蟆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605216', '江核心', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605248', '江黑心', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605280', '江胡内斗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605312', '江祸心', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605344', '江家帮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605376', '江绵恒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605408', '江派和胡派', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605440', '江派人马', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605472', '江泉集团', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605504', '江人马', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605536', '江三条腿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605568', '江氏集团', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605600', '江氏家族', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605632', '江氏政治局', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605664', '江氏政治委员', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605696', '江梳头', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605728', '江太上', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605760', '江戏子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605792', '江系人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605824', '江系人马', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605856', '江宰民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605888', '江贼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605920', '江贼民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605952', '江主席', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654605984', '麻果丸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606016', '麻将透', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606048', '麻醉弹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606080', '麻醉狗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606112', '麻醉枪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606144', '麻醉槍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606176', '麻醉药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606208', '麻醉藥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606240', '台独', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606272', '台湾版假币', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606304', '台湾独立', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606336', '台湾国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606368', '台湾应该独立', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606400', '台湾有权独立', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606432', '天灭中共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606464', '中共帮凶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606496', '中共保命', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606528', '中共裁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606560', '中共党文化', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606592', '中共腐败', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606624', '中共的血旗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606656', '中共的罪恶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606688', '中共帝国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606720', '中共独裁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606752', '中共封锁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606784', '中共封网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606816', '中共腐败', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606848', '中共黑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606880', '中共黑帮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606912', '中共解体', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606944', '中共近期权力斗争', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654606976', '中共恐惧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607008', '中共权力斗争', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607040', '中共任用', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607072', '中共退党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607104', '中共洗脑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607136', '中共邪教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607168', '中共邪毒素', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607200', '中共政治游戏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607232', '福音会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607264', '中国教徒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607296', '统一教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607328', '观音法门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607360', '清海无上师', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607392', '盘古', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607424', '李洪志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607456', '志洪李', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607488', '李宏志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607520', '轮功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607552', '法轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607584', '轮法功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607616', '三去车仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607648', '氵去车仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607680', '发论工', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607712', '法x功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607744', '法o功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607776', '法0功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607808', '法一轮一功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607840', '轮子功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607872', '车仑工力', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607904', '法lun', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607936', 'fa轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654607968', '法lg', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608000', 'flg', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608032', 'fl功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608064', 'falungong', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608096', '大法弟子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608128', '大纪元', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608160', 'dajiyuan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608192', '明慧网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608224', '明慧周报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608256', '正见网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608288', '新唐人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608320', '伪火', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608352', '退党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608384', 'tuidang', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608416', '退dang', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608448', '超越红墙', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608480', '自fen', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608512', '真善忍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608544', '九评', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608576', '9评', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608608', '9ping', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608640', '九ping', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608672', 'jiuping', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608704', '藏字石', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608736', '集体自杀', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608768', '自sha', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608800', 'zi杀', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608832', 'suicide', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608864', 'titor', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608896', '逢8必灾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608928', '逢八必灾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608960', '逢9必乱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654608992', '逢九必乱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609024', '朱瑟里诺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609056', '根达亚文明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609088', '诺查丹玛斯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609120', '人类灭亡进程表', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609152', '按照马雅历法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609184', '推背图', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609216', '推bei图', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609248', '济世灵文', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609280', '诸世纪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609312', '电狗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609344', '电话定位器', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609376', '电话拦截器', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609408', '电话窃听', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609440', '电话监', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609472', '电话交友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609504', '电话追杀系统', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609536', '电击枪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609568', '电鸡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609600', '电警棒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609632', '枪出售', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609664', '枪的制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609696', '枪货到', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609728', '枪决女犯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609760', '枪模', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609792', '枪手', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609824', '枪销售', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609856', '枪械制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609888', '枪子弹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609920', '售步枪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609952', '售纯度', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654609984', '售单管', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610016', '售弹簧刀', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610048', '售防身', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610080', '售狗子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610112', '售虎头', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610144', '售火药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610176', '售假币', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610208', '售健卫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610240', '售军用', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610272', '售猎枪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610304', '售氯胺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610336', '售麻醉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610368', '售枪支', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610400', '售热武', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610432', '售三棱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610464', '售手枪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610496', '售五四', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610528', '售一元硬', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610560', '售子弹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610592', '售左轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610624', '亚砷（酸）酐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610656', '亚砷酸钾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610688', '亚砷酸钠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610720', '亚硒酸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610752', '亚硒酸二钠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610784', '亚硒酸镁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610816', '亚硒酸钠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610848', '亚硒酸氢钠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610880', '亚硝酸乙酯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610912', '亚硝酰乙氧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610944', '氧化二丁基锡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654610976', '氧化汞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611008', '氧化铊', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611040', '氧化亚铊', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611072', '氧氯化磷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611104', '原装弹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611136', '原子弹方法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611168', '原子弹清单', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611200', '安眠酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611232', '代血浆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611264', '普萘洛尔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611296', '呋塞米', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611328', '西布曲明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611360', 'testosterone', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611392', '胰岛素样生长因子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611424', '促红细胞生成素', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611456', '地西泮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611488', '尼可刹米', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611520', '甲睾酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611552', 'adrenaline', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611584', 'erythropoietin', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611616', '地奈德', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611648', '莫达非尼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611680', '氯噻嗪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611712', '苯巴比妥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611744', '促性腺激素', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611776', '泼尼松', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611808', '麻黄草', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611840', '雄烯二醇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611872', '地塞米松', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611904', 'tamoxifen', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611936', 'strychnine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654611968', 'androst', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612000', '新型毒品', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612032', '杜冷丁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612064', '兴奋剂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612096', 'mdma', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612128', '海洛因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612160', '海luo因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612192', 'heroin', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612224', 'diamorphine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612256', 'diacetylmorphine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612288', '鸦片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612320', '阿芙蓉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612352', '咖啡因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612384', 'cocain', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612416', '三唑仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612448', '美沙酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612480', '麻古', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612512', 'k粉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612544', '凯他敏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612576', 'ketamine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612608', '冰毒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612640', '苯丙胺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612672', 'cannabis', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612704', '大麻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612736', '爱他死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612768', '氯胺酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612800', 'benzodiazepines', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612832', '甲基安非他明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612864', '安非他命', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612896', '吗啡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612928', '打人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612960', '打人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654612992', '拆迁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613024', '拆迁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613056', '纠纷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613088', '纠纷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613120', '盗窃', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613152', '盗窃', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613184', '安眠酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613216', '代药物毒品类：血浆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613248', '普萘洛尔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613280', '呋塞米', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613312', '西布曲明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613344', 'testosterone', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613376', '胰岛素样生长因子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613408', '促红细胞生成素', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613440', '地西泮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613472', '尼可刹米', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613504', '甲睾酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613536', 'adrenaline', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613568', 'erythropoietin', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613600', '地奈德', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613632', '莫达非尼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613664', '氯噻嗪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613696', '苯巴比妥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613728', '促性腺激素', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613760', '泼尼松', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613792', '麻黄草', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613824', '雄烯二醇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613856', '地塞米松', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613888', 'tamoxifen', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613920', 'strychnine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613952', 'androst', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654613984', '新型毒品', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614016', '杜冷丁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614048', '兴奋剂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614080', 'mdma', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614112', '海洛因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614144', '海luo因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614176', 'heroin', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614208', 'diamorphine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614240', 'diacetylmorphine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614272', '鸦片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614304', '阿芙蓉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614336', '咖啡因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614368', 'cocain', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614400', '三唑仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614432', '美沙酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614464', '麻古', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614496', 'k粉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614528', '凯他敏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614560', 'ketamine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614592', '冰毒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614624', '苯丙胺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614656', 'cannabis', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614688', '大麻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614720', '爱他死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614752', '氯胺酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614784', 'benzodiazepines', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614816', '甲基安非他明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614848', '安非他命', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614880', '吗啡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614912', 'morphine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614944', '摇头丸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654614976', '迷药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615008', '乖乖粉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615040', 'narcotic', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615072', '麻醉药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615104', '精神药品', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615136', '专业代理', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615168', '帮忙点一下', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615200', '帮忙点下', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615232', '请点击进入', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615264', '详情请进入', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615296', '私人侦探', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615328', '私家侦探', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615360', '针孔摄象', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615392', '调查婚外情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615424', '信用卡提现', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615456', '无抵押贷款', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615488', '广告代理', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615520', '原音铃声', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615552', '借腹生子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615584', '找个妈妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615616', '找个爸爸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615648', '代孕妈妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615680', '代生孩子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615712', '代开发票', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615744', '腾讯客服电话', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615776', '销售热线', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615808', '免费订购热线', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615840', '低价出售', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615872', '款到发货', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615904', '回复可见', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615936', '连锁加盟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654615968', '加盟连锁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616000', '免费二级域名', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616032', '免费使用', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616064', '免费索取', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616096', '蚁力神', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616128', '婴儿汤', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616160', '售肾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616192', '刻章办', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616224', '买小车', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616256', '套牌车', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616288', '玛雅网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616320', '电脑传讯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616352', '视频来源', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616384', '下载速度', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616416', '高清在线', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616448', '全集在线', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616480', '在线播放', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616512', 'txt下载', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616544', '六位qq', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616576', '6位qq', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616608', '位的qq', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616640', '个qb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616672', '送qb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616704', '用刀横向切腹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616736', '完全自杀手册', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616768', '四海帮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616800', '足球投注', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616832', '地下钱庄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616864', '中国复兴党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616896', '阿波罗网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616928', '曾道人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616960', '六合彩', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654616992', '改卷内幕', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617024', '替考试', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617056', '隐形耳机', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617088', '出售答案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617120', '考中答案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617152', '答an', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617184', 'da案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617216', '资金周转', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617248', '救市', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617280', '股市圈钱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617312', '崩盘', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617344', '资金短缺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617376', '证监会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617408', '质押贷款', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617440', '小额贷款', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617472', '周小川', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617504', '刘明康', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617536', '尚福林', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617568', '孔丹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617600', '汉芯造假', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617632', '杨树宽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617664', '中印边界谈判结果', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617696', '喂奶门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617728', '摸nai门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617760', '酒瓶门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617792', '脱裤门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617824', '75事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617856', '乌鲁木齐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617888', '新疆骚乱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617920', '针刺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617952', '打针', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654617984', '食堂涨价', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618016', '饭菜涨价', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618048', 'h1n1', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618080', '瘟疫爆发', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618112', 'yangjia', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618144', 'y佳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618176', 'yang佳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618208', '杨佳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618240', '杨j', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618272', '袭警', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618304', '杀警', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618336', '武侯祠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618368', '川b26931', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618400', '贺立旗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618432', '周正毅', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618464', 'px项目', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618496', '骂四川', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618528', '家l福', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618560', '家le福', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618592', '加了服', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618624', '麦当劳被砸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618656', '豆腐渣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618688', '这不是天灾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618720', '龙小霞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618752', '震其国土', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618784', 'yuce', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618816', '提前预测', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618848', '地震预测', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618880', '隐瞒地震', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618912', '李四光预测', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618944', '蟾蜍迁徙', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654618976', '地震来得更猛烈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619008', '八级地震毫无预报', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619040', '踩踏事故', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619072', '聂树斌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619104', '万里大造林', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619136', '陈相贵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619168', '张丹红', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619200', '尹方明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619232', '李树菲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619264', '王奉友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619296', '零八奥运艰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619328', '惨奥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619360', '奥晕', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619392', '凹晕', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619424', '懊运', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619456', '懊孕', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619488', '奥孕', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619520', '奥你妈的运', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619552', '反奥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619584', '628事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619616', 'weng安', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619648', 'wengan', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619680', '翁安', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619712', '瓮安事件', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619744', '化工厂爆炸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619776', '讨回工资', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619808', '代办发票', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619840', '代办各', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619872', '代办文', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619904', '代办学', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619936', '代办制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654619968', '代辦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620000', '代表烦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620032', '代开发票', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620064', '代開', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620096', '代考', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620128', '代理发票', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620160', '代理票据', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620192', '代您考', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620224', '代讨债', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620256', '代写毕', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620288', '代写论文', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620320', '代孕', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620352', '代追债', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620384', '考后付款', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620416', '考机构', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620448', '考考邓', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620480', '考联盟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620512', '考前答案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620544', '考前付', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620576', '考前密卷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620608', '考前预测', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620640', '考试,答案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620672', '考试,作弊器', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620704', '考试包过', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620736', '考试保', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620768', '考试答案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620800', '考试机构', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620832', '考试联盟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620864', '考试枪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620896', '考试作弊', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620928', '考试作弊器', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620960', '考研考中', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654620992', '考中答案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621024', '透视功能', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621056', '透视镜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621088', '透视扑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621120', '透视器', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621152', '透视眼睛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621184', '透视眼镜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621216', '透视药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621248', '透视仪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621280', '打死经过', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621312', '打死人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621344', '打砸办公', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621376', '打砸抢', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621408', '安眠酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621440', '代血浆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621472', '普萘洛尔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621504', '呋塞米', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621536', '西布曲明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621568', 'testosterone', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621600', '胰岛素样生长因子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621632', '促红细胞生成素', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621664', '地西泮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621696', '尼可刹米', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621728', '甲睾酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621760', 'adrenaline', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621792', 'erythropoietin', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621824', '地奈德', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621856', '莫达非尼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621888', '氯噻嗪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621920', '苯巴比妥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621952', '促性腺激素', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654621984', '泼尼松', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622016', '麻黄草', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622048', '雄烯二醇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622080', '地塞米松', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622112', 'tamoxifen', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622144', 'strychnine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622176', 'androst', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622208', '新型毒品', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622240', '杜冷丁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622272', '兴奋剂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622304', 'mdma', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622336', '海洛因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622368', '海luo因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622400', 'heroin', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622432', 'diamorphine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622464', 'diacetylmorphine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622496', '鸦片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622528', '阿芙蓉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622560', '咖啡因', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622592', 'cocain', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622624', '三唑仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622656', '美沙酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622688', '麻古', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622720', 'k粉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622752', '凯他敏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622784', 'ketamine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622816', '冰毒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622848', '苯丙胺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622880', 'cannabis', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622912', '大麻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622944', '爱他死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654622976', '氯胺酮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623008', 'benzodiazepines', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623040', '甲基安非他明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623072', '安非他命', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623104', '吗啡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623136', 'KC短信', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623168', 'KC嘉年华', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623200', '短信广告', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623232', '短信群发', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623264', '短信群发器', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623296', '小6灵通', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623328', '短信商务广告', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623360', '段录定', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623392', '无界浏览', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623424', '无界浏览器', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623456', '无界', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623488', '无网界', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623520', '无网界浏览', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623552', '无帮国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623584', 'KC提示', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623616', 'KC网站', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623648', 'UP8新势力', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623680', '白皮书', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623712', 'UP新势力', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623744', '移民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623776', '易达网络卡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623808', '安魂网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623840', '罢工', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623872', '罢课', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623904', '纽崔莱七折', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623936', '手机复制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654623968', '手机铃声', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624000', '网关', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624032', '神通加持法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624064', '全1球通', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624096', '如6意通', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624128', '清仓', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624160', '灵动卡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624192', '答案卫星接收机', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624224', '高薪养廉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624256', '考后付款', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624288', '佳静安定片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624320', '航空母舰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624352', '航空售票', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624384', '号码百事通', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624416', '考前发放', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624448', '成本价', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624480', '诚信通手机商城', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624512', '高利贷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624544', '联4通', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624576', '黑庄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624608', '黑手党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624640', '黑车', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624672', '联通贵宾卡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624704', '联总', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624736', '联总这声传单', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624768', '联总之声传单', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624800', '高息贷款', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624832', '高干子弟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624864', '恭喜你的号码', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624896', '恭喜您的号码', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624928', '高干子女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624960', '各个银行全称', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654624992', '各种发票', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625024', '高官', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625056', '高官互调', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625088', '高官子女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625120', '喝一送一', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625152', '卡号', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625184', '复制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625216', '监听王', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625248', '传单', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625280', '旦科', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625312', '钓鱼岛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625344', '钓鱼台', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625376', '当官靠后台', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625408', '党校安插亲信', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625440', '传九促三', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625472', '客户端非法字符', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625504', '刻章', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625536', '大麻树脂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625568', '大麻油', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625600', '大法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625632', '大法弟子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625664', 'dpp大法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625696', 'fa lun', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625728', 'falu', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625760', '发抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625792', '发抡功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625824', '洗脑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625856', '下法轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625888', '发轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625920', '发伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625952', '发伦功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654625984', '发仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626016', '发沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626048', '发纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626080', '发论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626112', '发论功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626144', '发论公', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626176', '发正念', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626208', '发囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626240', '发愣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626272', '发瞟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626304', '罚抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626336', '罚伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626368', '罚仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626400', '罚沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626432', '罚纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626464', '罚囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626496', '筏抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626528', '筏轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626560', '筏伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626592', '筏仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626624', '筏沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626656', '筏纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626688', '筏论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626720', '筏囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626752', '伐抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626784', '伐轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626816', '伐伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626848', '伐仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626880', '伐沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626912', '伐论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626944', '伐囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654626976', '乏抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627008', '乏轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627040', '乏伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627072', '乏仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627104', '乏沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627136', '乏纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627168', '乏论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627200', '乏囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627232', '阀抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627264', '阀伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627296', '阀仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627328', '阀沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627360', '阀纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627392', '阀论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627424', '阀囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627456', '法 轮 功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627488', '法*功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627520', '法.轮.功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627552', '法L功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627584', '法lun功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627616', '法功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627648', '法会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627680', '法抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627712', '法抡功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627744', '法轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627776', '法轮大法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627808', '法轮佛法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627840', '法轮功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627872', '法伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627904', '法仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627936', '法沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654627968', '法纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628000', '法论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628032', '法十轮十功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628064', '法西斯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628096', '法院', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628128', '法正', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628160', '法谪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628192', '法谪功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628224', '法輪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628256', '法囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628288', '法愣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628320', '珐.輪功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628352', '珐抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628384', '珐轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628416', '珐伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628448', '珐仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628480', '珐沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628512', '五不', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628544', '五不争鸣论坛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628576', '五出三进', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628608', '五套功法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628640', '邝锦文', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628672', '垡抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628704', '垡轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628736', '垡伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628768', '垡仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628800', '垡沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628832', '垡纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628864', '垡论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628896', '垡囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628928', '茳澤民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628960', '荭志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654628992', '闳志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629024', '闵维方', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629056', '氵去', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629088', '氵去车仑工力', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629120', '转法轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629152', '砝抡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629184', '砝轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629216', '砝伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629248', '砝仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629280', '砝沦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629312', '砝纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629344', '真、善、忍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629376', '真理教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629408', '真善美', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629440', '真善忍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629472', '砝论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629504', '砝囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629536', '泓志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629568', '屙民', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629600', '珐纶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629632', '珐论', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629664', '珐囵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629696', 'falun', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629728', 'Falundafa', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629760', 'fa轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629792', 'Flg', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629824', '弟子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629856', '地下教会', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629888', '炼功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629920', '梦网洪志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629952', '轮大', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654629984', '抡功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630016', '轮功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630048', '伦功', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630080', '摩门教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630112', '三水法轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630144', '三唑仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630176', '天皇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630208', '天怒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630240', '天葬', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630272', '车臣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630304', '达赖', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630336', '功法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630368', '讲法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630400', '基督', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630432', '基督教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630464', '护法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630496', '回教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630528', '教徒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630560', '功友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630592', '大师', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630624', '达赖喇嘛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630656', '虹志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630688', '鸿志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630720', '洪传', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630752', '贯通两极法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630784', '光祖', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630816', '洪吟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630848', '洪哲胜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630880', '洪志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630912', '宏法', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630944', '观世音', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654630976', '宏志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631008', '弘志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631040', '古兰经', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631072', '红志', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631104', '车库', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631136', '车仑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631168', '经文', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631200', '爱女人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631232', '爱液', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631264', '按摩棒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631296', '拔出来', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631328', '爆草', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631360', '包二奶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631392', '暴干', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631424', '暴奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631456', '暴乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631488', '爆乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631520', '暴淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631552', '屄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631584', '被操', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631616', '被插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631648', '被干', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631680', '逼奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631712', '仓井空', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631744', '插暴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631776', '操逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631808', '操黑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631840', '操烂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631872', '肏你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631904', '肏死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631936', '操死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654631968', '操我', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632000', '厕奴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632032', '插比', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632064', '插b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632096', '插逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632128', '插进', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632160', '插你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632192', '插我', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632224', '插阴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632256', '潮吹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632288', '潮喷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632320', '成人dv', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632352', '成人电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632384', '成人论坛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632416', '成人小说', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632448', '成人电', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632480', '成人电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632512', '成人卡通', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632544', '成人聊', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632576', '成人片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632608', '成人视', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632640', '成人图', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632672', '成人文', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632704', '成人小', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632736', '成人电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632768', '成人论坛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632800', '成人色情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632832', '成人网站', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632864', '成人文学', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632896', '成人小说', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632928', '艳情小说', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632960', '成人游戏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654632992', '吃精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633024', '赤裸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633056', '抽插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633088', '扌由插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633120', '抽一插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633152', '春药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633184', '大波', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633216', '大力抽送', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633248', '大乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633280', '荡妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633312', '荡女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633344', '盗撮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633376', '多人轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633408', '发浪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633440', '放尿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633472', '肥逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633504', '粉穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633536', '封面女郎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633568', '风月大陆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633600', '干死你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633632', '干穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633664', '肛交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633696', '肛门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633728', '龟头', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633760', '裹本', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633792', '国产av', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633824', '好嫩', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633856', '豪乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633888', '黑逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633920', '后庭', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633952', '后穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654633984', '虎骑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634016', '花花公子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634048', '换妻俱乐部', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634080', '黄片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634112', '几吧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634144', '鸡吧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634176', '鸡巴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634208', '鸡奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634240', '寂寞男', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634272', '寂寞女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634304', '妓女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634336', '激情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634368', '集体淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634400', '奸情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634432', '叫床', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634464', '脚交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634496', '金鳞岂是池中物', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634528', '金麟岂是池中物', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634560', '精液', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634592', '就去日', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634624', '巨屌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634656', '菊花洞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634688', '菊门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634720', '巨奶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634752', '巨乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634784', '菊穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634816', '开苞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634848', '口爆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634880', '口活', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634912', '口交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634944', '口射', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654634976', '口淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635008', '裤袜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635040', '狂操', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635072', '狂插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635104', '浪逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635136', '浪妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635168', '浪叫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635200', '浪女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635232', '狼友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635264', '聊性', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635296', '流淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635328', '铃木麻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635360', '凌辱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635392', '漏乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635424', '露b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635456', '乱交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635488', '乱伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635520', '轮暴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635552', '轮操', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635584', '轮奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635616', '裸陪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635648', '买春', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635680', '美逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635712', '美少妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635744', '美乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635776', '美腿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635808', '美穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635840', '美幼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635872', '秘唇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635904', '迷奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635936', '密穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654635968', '蜜穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636000', '蜜液', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636032', '摸奶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636064', '摸胸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636096', '母奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636128', '奈美', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636160', '奶子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636192', '男奴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636224', '内射', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636256', '嫩逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636288', '嫩女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636320', '嫩穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636352', '捏弄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636384', '女优', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636416', '炮友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636448', '砲友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636480', '喷精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636512', '屁眼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636544', '品香堂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636576', '前凸后翘', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636608', '强jian', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636640', '强暴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636672', '强奸处女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636704', '情趣用品', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636736', '情色', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636768', '拳交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636800', '全裸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636832', '群交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636864', '惹火身材', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636896', '人妻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636928', '人兽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636960', '日逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654636992', '日烂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637024', '肉棒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637056', '肉逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637088', '肉唇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637120', '肉洞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637152', '肉缝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637184', '肉棍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637216', '肉茎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637248', '肉具', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637280', '揉乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637312', '肉穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637344', '肉欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637376', '乳爆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637408', '乳房', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637440', '乳沟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637472', '乳交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637504', '乳头', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637536', '三级片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637568', '骚逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637600', '骚比', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637632', '骚女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637664', '骚水', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637696', '骚穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637728', '色逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637760', '色界', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637792', '色猫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637824', '色盟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637856', '色情网站', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637888', '色区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637920', '色色', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637952', '色诱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654637984', '色欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638016', '色b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638048', '少年阿宾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638080', '少修正', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638112', '射爽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638144', '射颜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638176', '食精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638208', '释欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638240', '兽奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638272', '兽交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638304', '手淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638336', '兽欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638368', '熟妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638400', '熟母', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638432', '熟女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638464', '爽片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638496', '爽死我了', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638528', '双臀', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638560', '死逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638592', '丝袜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638624', '丝诱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638656', '松岛枫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638688', '酥痒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638720', '汤加丽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638752', '套弄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638784', '体奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638816', '体位', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638848', '舔脚', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638880', '舔阴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638912', '调教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638944', '偷欢', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654638976', '偷拍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639008', '推油', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639040', '脱内裤', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639072', '文做', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639104', '我就色', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639136', '无码', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639168', '舞女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639200', '无修正', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639232', '吸精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639264', '夏川纯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639296', '相奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639328', '小逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639360', '校鸡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639392', '小穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639424', '小xue', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639456', '写真', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639488', '性感妖娆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639520', '性感诱惑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639552', '性虎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639584', '性饥渴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639616', '性技巧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639648', '性交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639680', '性奴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639712', '性虐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639744', '性息', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639776', '性欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639808', '胸推', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639840', '穴口', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639872', '学生妹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639904', '穴图', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639936', '亚情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654639968', '颜射', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640000', '阳具', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640032', '杨思敏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640064', '要射了', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640096', '夜勤病栋', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640128', '一本道', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640160', '一夜欢', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640192', '一夜情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640224', '一ye情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640256', '阴部', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640288', '淫虫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640320', '阴唇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640352', '淫荡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640384', '阴道', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640416', '淫电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640448', '阴阜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640480', '淫妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640512', '淫河', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640544', '阴核', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640576', '阴户', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640608', '淫贱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640640', '淫叫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640672', '淫教师', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640704', '阴茎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640736', '阴精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640768', '淫浪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640800', '淫媚', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640832', '淫糜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640864', '淫魔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640896', '淫母', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640928', '淫女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640960', '淫虐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654640992', '淫妻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641024', '淫情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641056', '淫色', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641088', '淫声浪语', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641120', '淫兽学园', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641152', '淫书', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641184', '淫术炼金士', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641216', '淫水', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641248', '淫娃', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641280', '淫威', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641312', '淫亵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641344', '淫样', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641376', '淫液', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641408', '淫照', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641440', '阴b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641472', '应召', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641504', '幼交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641536', '幼男', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641568', '幼女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641600', '欲火', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641632', '欲女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641664', '玉女心经', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641696', '玉蒲团', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641728', '玉乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641760', '欲仙欲死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641792', '玉穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641824', '援交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641856', '原味内衣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641888', '援助交际', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641920', '张筱雨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641952', '招鸡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654641984', '招妓', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642016', '中年美妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642048', '抓胸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642080', '自拍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642112', '自慰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642144', '作爱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642176', '18禁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642208', '99bb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642240', 'a4u', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642272', 'a4y', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642304', 'adult', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642336', 'amateur', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642368', 'anal', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642400', 'a片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642432', 'fuck', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642464', 'gay片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642496', 'g点', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642528', 'g片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642560', 'hardcore', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642592', 'h动画', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642624', 'h动漫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642656', 'incest', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642688', 'porn', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642720', 'secom', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642752', 'sexinsex', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642784', 'sm女王', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642816', 'xiao77', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642848', 'xing伴侣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642880', 'tokyohot', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642912', 'yin荡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642944', '贱人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654642976', '装b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643008', '大sb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643040', '傻逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643072', '傻b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643104', '煞逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643136', '煞笔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643168', '刹笔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643200', '傻比', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643232', '沙比', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643264', '欠干', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643296', '婊子养的', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643328', '我日你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643360', '我操', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643392', '我草', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643424', '卧艹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643456', '卧槽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643488', '爆你菊', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643520', '艹你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643552', 'cao你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643584', '你他妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643616', '真他妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643648', '别他吗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643680', '草你吗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643712', '草你丫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643744', '操你妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643776', '擦你妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643808', '操你娘', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643840', '操他妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643872', '日你妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643904', '干你妈', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643936', '干你娘', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654643968', '娘西皮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644000', '狗操', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644032', '狗草', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644064', '狗杂种', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644096', '狗日的', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644128', '操你祖宗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644160', '操你全家', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644192', '操你大爷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644224', '妈逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644256', '你麻痹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644288', '麻痹的', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644320', '妈了个逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644352', '马勒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644384', '狗娘养', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644416', '贱比', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644448', '贱b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644480', '下贱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644512', '死全家', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644544', '全家死光', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644576', '全家不得好死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644608', '全家死绝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644640', '白痴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644672', '无耻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644704', 'sb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644736', '杀b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644768', '你吗b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644800', '你妈的', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644832', '婊子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644864', '贱货', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644896', '人渣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644928', '混蛋', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644960', '媚外', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654644992', '和弦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645024', '兼职', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645056', '限量', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645088', '铃声', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645120', '性伴侣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645152', '男公关', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645184', '火辣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645216', '精子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645248', '射精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645280', '诱奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645312', '强奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645344', '做爱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645376', '性爱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645408', '发生关系', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645440', '按摩', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645472', '快感', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645504', '处男', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645536', '猛男', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645568', '少妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645600', '屌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645632', '屁股', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645664', '下体', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645696', 'a片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645728', '内裤', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645760', '浑圆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645792', '咪咪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645824', '发情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645856', '刺激', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645888', '白嫩', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645920', '粉嫩', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645952', '兽性', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654645984', '风骚', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646016', '呻吟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646048', 'sm', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646080', '阉割', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646112', '高潮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646144', '裸露', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646176', '不穿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646208', '一丝不挂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646240', '脱光', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646272', '干你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646304', '干死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646336', '我干', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646368', '裙中性运动', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646400', '乱奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646432', '乱伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646464', '乱伦类', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646496', '乱伦小', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646528', '伦理大', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646560', '伦理电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646592', '伦理毛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646624', '伦理片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646656', '裸聊', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646688', '裸聊网', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646720', '裸体写真', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646752', '裸舞视', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646784', '裸照', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646816', '美女裸体', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646848', '美女写真', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646880', '美女上门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646912', '美艳少妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646944', '妹按摩', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654646976', '妹上门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647008', '迷幻药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647040', '迷幻藥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647072', '迷昏口', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647104', '迷昏药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647136', '迷昏藥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647168', '迷魂香', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647200', '迷魂药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647232', '迷魂藥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647264', '迷奸粉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647296', '迷奸药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647328', '迷情粉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647360', '迷情水', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647392', '迷情药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647424', '迷药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647456', '迷藥', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647488', '谜奸药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647520', '骚妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647552', '骚货', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647584', '骚浪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647616', '骚女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647648', '骚嘴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647680', '色电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647712', '色妹妹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647744', '色情表演', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647776', '色情电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647808', '色情服务', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647840', '色情图片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647872', '色情小说', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647904', '色情影片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647936', '色情表演', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654647968', '色情电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648000', '色情服务', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648032', '色情片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648064', '色视频', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648096', '色小说', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648128', '性伴侣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648160', '性服务', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648192', '性福情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648224', '性感少', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648256', '性伙伴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648288', '性交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648320', '性交视频', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648352', '性交图片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648384', '性奴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648416', '性奴集中营', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648448', '性虐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648480', '阴唇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648512', '阴道', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648544', '阴蒂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648576', '阴户', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648608', '阴间来电', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648640', '阴茎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648672', '阴茎增大', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648704', '阴茎助勃', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648736', '阴毛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648768', '陰唇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648800', '陰道', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648832', '陰戶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648864', '淫荡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648896', '淫荡美女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648928', '淫荡视频', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648960', '淫荡照片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654648992', '淫乱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649024', '淫靡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649056', '淫魔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649088', '淫魔舞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649120', '淫女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649152', '淫情女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649184', '淫肉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649216', '淫騷妹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649248', '淫兽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649280', '淫兽学', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649312', '淫水', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649344', '淫穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649376', 'morphine', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649408', '摇头丸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649440', '迷药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649472', '乖乖粉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649504', 'narcotic', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649536', '麻醉药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649568', '精神药品', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649600', '爱女人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649632', '爱液', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649664', '按摩棒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649696', '拔出来', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649728', '爆草', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649760', '包二奶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649792', '暴干', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649824', '暴奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649856', '暴乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649888', '爆乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649920', '暴淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649952', '屄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654649984', '被操', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650016', '被插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650048', '被干', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650080', '逼奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650112', '仓井空', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650144', '插暴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650176', '操逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650208', '操黑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650240', '操烂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650272', '肏你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650304', '肏死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650336', '操死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650368', '操我', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650400', '厕奴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650432', '插比', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650464', '插b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650496', '插逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650528', '插进', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650560', '插你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650592', '插我', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650624', '插阴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650656', '潮吹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650688', '潮喷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650720', '成人电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650752', '成人论坛', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650784', '成人色情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650816', '成人网站', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650848', '成人文学', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650880', '成人小说', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650912', '艳情小说', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650944', '成人游戏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654650976', '吃精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651008', '赤裸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651040', '抽插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651072', '扌由插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651104', '抽一插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651136', '春药', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651168', '大波', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651200', '大力抽送', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651232', '大乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651264', '荡妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651296', '荡女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651328', '盗撮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651360', '多人轮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651392', '发浪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651424', '放尿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651456', '肥逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651488', '粉穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651520', '封面女郎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651552', '风月大陆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651584', '干死你', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651616', '干穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651648', '肛交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651680', '肛门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651712', '龟头', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651744', '裹本', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651776', '国产av', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651808', '好嫩', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651840', '豪乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651872', '黑逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651904', '后庭', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651936', '后穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654651968', '虎骑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652000', '花花公子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652032', '换妻俱乐部', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652064', '黄片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652096', '几吧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652128', '鸡吧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652160', '鸡巴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652192', '鸡奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652224', '寂寞男', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652256', '寂寞女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652288', '妓女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652320', '激情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652352', '集体淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652384', '奸情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652416', '叫床', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652448', '脚交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652480', '金鳞岂是池中物', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652512', '金麟岂是池中物', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652544', '精液', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652576', '就去日', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652608', '巨屌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652640', '菊花洞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652672', '菊门', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652704', '巨奶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652736', '巨乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652768', '菊穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652800', '开苞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652832', '口爆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652864', '口活', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652896', '口交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652928', '口射', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652960', '口淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654652992', '裤袜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653024', '狂操', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653056', '狂插', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653088', '浪逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653120', '浪妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653152', '浪叫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653184', '浪女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653216', '狼友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653248', '聊性', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653280', '流淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653312', '铃木麻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653344', '凌辱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653376', '漏乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653408', '露b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653440', '乱交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653472', '乱伦', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653504', '轮暴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653536', '轮操', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653568', '轮奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653600', '裸陪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653632', '买春', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653664', '美逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653696', '美少妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653728', '美乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653760', '美腿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653792', '美穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653824', '美幼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653856', '秘唇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653888', '迷奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653920', '密穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653952', '蜜穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654653984', '蜜液', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654016', '摸奶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654048', '摸胸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654080', '母奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654112', '奈美', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654144', '奶子', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654176', '男奴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654208', '内射', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654240', '嫩逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654272', '嫩女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654304', '嫩穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654336', '捏弄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654368', '女优', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654400', '炮友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654432', '砲友', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654464', '喷精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654496', '屁眼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654528', '品香堂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654560', '前凸后翘', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654592', '强jian', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654624', '强暴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654656', '强奸处女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654688', '情趣用品', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654720', '情色', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654752', '拳交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654784', '全裸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654816', '群交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654848', '惹火身材', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654880', '人妻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654912', '人兽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654944', '日逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654654976', '日烂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655008', '肉棒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655040', '肉逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655072', '肉唇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655104', '肉洞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655136', '肉缝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655168', '肉棍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655200', '肉茎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655232', '肉具', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655264', '揉乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655296', '肉穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655328', '肉欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655360', '乳爆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655392', '乳房', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655424', '乳沟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655456', '乳交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655488', '乳头', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655520', '三级片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655552', '骚逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655584', '骚比', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655616', '骚女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655648', '骚水', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655680', '骚穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655712', '色逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655744', '色界', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655776', '色猫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655808', '色盟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655840', '色情网站', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655872', '色区', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655904', '色色', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655936', '色诱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654655968', '色欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656000', '色b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656032', '少年阿宾', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656064', '少修正', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656096', '射爽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656128', '射颜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656160', '食精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656192', '释欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656224', '兽奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656256', '兽交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656288', '手淫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656320', '兽欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656352', '熟妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656384', '熟母', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656416', '熟女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656448', '爽片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656480', '爽死我了', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656512', '双臀', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656544', '死逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656576', '丝袜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656608', '丝诱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656640', '松岛枫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656672', '酥痒', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656704', '汤加丽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656736', '套弄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656768', '体奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656800', '体位', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656832', '舔脚', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656864', '舔阴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656896', '调教', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656928', '偷欢', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656960', '偷拍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654656992', '推油', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657024', '脱内裤', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657056', '文做', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657088', '我就色', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657120', '无码', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657152', '舞女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657184', '无修正', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657216', '吸精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657248', '夏川纯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657280', '相奸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657312', '小逼', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657344', '校鸡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657376', '小穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657408', '小xue', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657440', '写真', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657472', '性感妖娆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657504', '性感诱惑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657536', '性虎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657568', '性饥渴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657600', '性技巧', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657632', '性交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657664', '性奴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657696', '性虐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657728', '性息', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657760', '性欲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657792', '胸推', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657824', '穴口', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657856', '学生妹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657888', '穴图', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657920', '亚情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657952', '颜射', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654657984', '阳具', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658016', '杨思敏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658048', '要射了', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658080', '夜勤病栋', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658112', '一本道', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658144', '一夜欢', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658176', '一夜情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658208', '一ye情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658240', '阴部', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658272', '淫虫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658304', '阴唇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658336', '淫荡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658368', '阴道', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658400', '淫电影', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658432', '阴阜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658464', '淫妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658496', '淫河', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658528', '阴核', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658560', '阴户', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658592', '淫贱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658624', '淫叫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658656', '淫教师', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658688', '阴茎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658720', '阴精', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658752', '淫浪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658784', '淫媚', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658816', '淫糜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658848', '淫魔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658880', '淫母', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658912', '淫女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658944', '淫虐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654658976', '淫妻', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659008', '淫情', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659040', '淫色', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659072', '淫声浪语', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659104', '淫兽学园', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659136', '淫书', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659168', '淫术炼金士', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659200', '淫水', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659232', '淫娃', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659264', '淫威', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659296', '淫亵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659328', '淫样', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659360', '淫液', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659392', '淫照', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659424', '阴b', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659456', '应召', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659488', '幼交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659520', '幼男', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659552', '幼女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659584', '欲火', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659616', '欲女', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659648', '玉女心经', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659680', '玉蒲团', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659712', '玉乳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659744', '欲仙欲死', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659776', '玉穴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659808', '援交', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659840', '原味内衣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659872', '援助交际', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659904', '张筱雨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659936', '招鸡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654659968', '招妓', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660000', '中年美妇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660032', '抓胸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660064', '自拍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660096', '自慰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660128', '作爱', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660160', '18禁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660192', '99bb', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660224', 'a4u', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660256', 'a4y', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660288', 'adult', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660320', 'amateur', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660352', 'anal', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660384', 'a片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660416', 'fuck', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660448', 'gay片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660480', 'g点', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660512', 'g片', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660544', 'hardcore', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660576', 'h动画', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660608', 'h动漫', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660640', 'incest', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660672', 'porn', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660704', 'secom', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660736', 'sexinsex', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660768', 'sm女王', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660800', 'xiao77', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660832', 'xing伴侣', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660864', 'tokyohot', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660896', 'yin荡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660928', '腐败', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660960', '贪污', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654660992', 'gcd', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661024', '共贪党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661056', 'gongchandang', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661088', '阿共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661120', '共一产一党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661152', '产党共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661184', '公产党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661216', '工产党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661248', '共c党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661280', '共x党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661312', '共铲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661344', '供产', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661376', '共惨', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661408', '供铲党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661440', '供铲谠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661472', '供铲裆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661504', '共残党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661536', '共残主义', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661568', '共产主义的幽灵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661600', '拱铲', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661632', '老共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661664', '中珙', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661696', '中gong', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661728', 'gc党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661760', '贡挡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661792', 'gong党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661824', 'g产', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661856', '狗产蛋', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661888', '共残裆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661920', '恶党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661952', '邪党', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654661984', '共产专制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662016', '共产王朝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662048', '裆中央', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662080', '土共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662112', '土g', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662144', '共狗', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662176', 'g匪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662208', '共匪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662240', '仇共', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662272', '共产党腐败', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662304', '共产党专制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662336', '共产党的报应', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662368', '共产党的末日', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662400', '共产党专制', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662432', 'communistparty', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662464', '症腐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662496', '政腐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662528', '政付', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662560', '正府', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662592', '政俯', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662624', '政f', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662656', 'zhengfu', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662688', '政zhi', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662720', '挡中央', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662752', '档中央', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662784', '中国zf', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662816', '中央zf', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662848', '国wu院', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662880', '中华帝国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662912', 'gong和', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662944', '大陆官方', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654662976', '北京政权', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663008', '刘志军', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663040', '张曙', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663072', '刘志军', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663104', '买别墅', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663136', '玩女人', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663168', '贪20亿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663200', '许宗衡', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663232', '贪财物', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663264', '李启红', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663296', '贪腐财富', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663328', '落马', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663360', '高官名单', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663392', '陈希同', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663424', '贪污', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663456', '玩忽职守', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663488', '有期徒刑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663520', '陈良宇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663552', '受贿罪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663584', '滥用职权', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663616', '有期徒刑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663648', '没收个人财产', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663680', '成克杰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663712', '死刑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663744', '程维高', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663776', '严重违纪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663808', '开除党籍', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663840', '撤销职务', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663872', '刘方仁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663904', '无期徒刑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663936', '倪献策', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654663968', '徇私舞弊', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664000', '梁湘', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664032', '以权谋私', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664064', '撤职。', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664096', '李嘉廷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664128', '死刑缓期', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664160', '张国光', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664192', '韩桂芝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664224', '宋平顺', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664256', '自杀', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664288', '黄瑶', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664320', '双规', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664352', '陈绍基', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664384', '判处死刑', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664416', '剥夺政治权利终身', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664448', '没收个人全部财产', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664480', '石兆彬', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664512', '侯伍杰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664544', '王昭耀', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664576', '剥夺政治权利', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664608', '杜世成', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664640', '沈图', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664672', '叛逃美国', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664704', '罗云光', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664736', '起诉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664768', '张辛泰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664800', '李效时', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664832', '边少斌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664864', '徐鹏航', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664896', '违纪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664928', '收受股票', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664960', '王乐毅', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654664992', '李纪周', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665024', '郑光迪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665056', '田凤山。', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665088', '邱晓华', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665120', '郑筱萸', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665152', '孙鹤龄', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665184', '蓝田造假案', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665216', '于幼军', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665248', '留党察看', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665280', '何洪达', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665312', '朱志刚', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665344', '杨汇泉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665376', '官僚主义', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665408', '徐炳松', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665440', '托乎提沙比尔', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665472', '王宝森', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665504', '经济犯罪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665536', '畏罪自杀。', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665568', '陈水文', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665600', '孟庆平', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665632', '胡长清', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665664', '朱川', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665696', '许运鸿', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665728', '丘广钟', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665760', '刘知炳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665792', '丛福奎', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665824', '王怀忠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665856', '巨额财产', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665888', '来源不明罪', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665920', '李达昌', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665952', '刘长贵', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654665984', '王钟麓', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666016', '阿曼哈吉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666048', '付晓光', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666080', '自动辞', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666112', '刘克田', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666144', '吕德彬', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666176', '刘维明', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666208', '双开', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666240', '刘志华', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666272', '孙瑜', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666304', '李堂堂', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666336', '韩福才 青海', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666368', '欧阳德 广东', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666400', '韦泽芳 海南', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666432', '铁英 北京', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666464', '辛业江 海南', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666496', '于飞 广东', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666528', '姜殿武 河北', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666560', '秦昌典 重庆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666592', '范广举 黑龙江', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666624', '张凯广东', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666656', '王厚宏海南', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666688', '陈维席安徽', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666720', '王有杰河南', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666752', '王武龙江苏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666784', '米凤君吉林', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666816', '宋勇辽宁', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666848', '张家盟浙江', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666880', '马烈孙宁夏', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666912', '黄纪诚北京', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666944', '常征贵州', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654666976', '王式惠重庆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667008', '周文吉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667040', '王庆录广西', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667072', '潘广田山东', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667104', '朱作勇甘肃', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667136', '孙善武河南', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667168', '宋晨光江西', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667200', '梁春禄广西政协', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667232', '鲁家善 中国交通', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667264', '金德琴 中信', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667296', '李大强 神华', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667328', '吴文英 纺织', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667360', '查克明 华能', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667392', '朱小华光大', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667424', '高严 国家电力', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667456', '王雪冰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667488', '林孔兴', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667520', '刘金宝', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667552', '张恩照', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667584', '陈同海', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667616', '康日新', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667648', '王益', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667680', '张春江', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667712', '洪清源', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667744', '平义杰', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667776', '李恩潮', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667808', '孙小虹', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667840', '陈忠', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667872', '慕绥新', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667904', '田凤岐', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667936', '麦崇楷', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654667968', '柴王群', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668000', '吴振汉', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668032', '张秋阳', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668064', '徐衍东', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668096', '徐发 黑龙江', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668128', '张宗海', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668160', '丁鑫发', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668192', '徐国健', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668224', '李宝金', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668256', '单平', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668288', '段义和', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668320', '荆福生', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668352', '陈少勇', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668384', '黄松有', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668416', '皮黔生', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668448', '王华元', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668480', '王守业', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668512', '刘连昆', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668544', '孙晋美', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668576', '邵松高', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668608', '肖怀枢', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668640', '刘广智 空军', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668672', '姬胜德 总参', '2022-10-12 16:45:36');
INSERT INTO `sensitives` VALUES ('1507599654668704', '廖伯年 北京', '2022-10-12 16:45:36');

-- ----------------------------
-- Table structure for statistic
-- ----------------------------
DROP TABLE IF EXISTS `statistic`;
CREATE TABLE `statistic` (
  `statistic_id` bigint(20) NOT NULL,
  `operator_id` bigint(20) DEFAULT NULL COMMENT '操作人id',
  `operate_time` datetime DEFAULT NULL COMMENT '操作时间',
  `catalog` varchar(255) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '栏目',
  `business_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`statistic_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of statistic
-- ----------------------------
INSERT INTO `statistic` VALUES ('1506692529389600', null, '2022-10-07 16:36:25', 'reward', null);
INSERT INTO `statistic` VALUES ('1506692716036128', null, '2022-10-07 16:37:54', 'reward', null);
INSERT INTO `statistic` VALUES ('1506692879613984', '1', '2022-10-07 16:39:12', 'reward', null);
INSERT INTO `statistic` VALUES ('1506693313724448', '1', '2022-10-07 16:42:39', 'reward', null);
INSERT INTO `statistic` VALUES ('1506693389221920', '1', '2022-10-07 16:43:14', 'reward', null);
INSERT INTO `statistic` VALUES ('1506693512953888', '1', '2022-10-07 16:44:14', 'reward', '2');
INSERT INTO `statistic` VALUES ('1506693552799776', '1', '2022-10-07 16:44:33', 'reward', '6');
INSERT INTO `statistic` VALUES ('1506693559091232', '1', '2022-10-07 16:44:35', 'reward', '1');
INSERT INTO `statistic` VALUES ('1506693561188384', '1', '2022-10-07 16:44:37', 'reward', '2');
INSERT INTO `statistic` VALUES ('1506693567479840', '1', '2022-10-07 16:44:39', 'reward', '5');
INSERT INTO `statistic` VALUES ('1506693571674144', '1', '2022-10-07 16:44:41', 'reward', '2');
INSERT INTO `statistic` VALUES ('1506698160242720', null, '2022-10-07 17:21:10', 'reward', '2');
INSERT INTO `statistic` VALUES ('1507407490449440', null, '2022-10-11 15:18:25', 'reward', '2');
INSERT INTO `statistic` VALUES ('1507419934949408', '1', '2022-10-11 16:57:18', 'reward', '1507416688558112');
INSERT INTO `statistic` VALUES ('1507420069167136', '1', '2022-10-11 16:58:22', 'reward', '1507416634032160');
INSERT INTO `statistic` VALUES ('1507420077555744', '1', '2022-10-11 16:58:27', 'reward', '1507416529174560');
INSERT INTO `statistic` VALUES ('1507420092235808', '1', '2022-10-11 16:58:34', 'reward', '6');
INSERT INTO `statistic` VALUES ('1507420102721568', '1', '2022-10-11 16:58:39', 'reward', '1507414501228576');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='参数配置表';

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES ('1', '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-09-11 11:48:21', '', null, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES ('2', '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-09-11 11:48:21', '', null, '初始化密码 123456');
INSERT INTO `sys_config` VALUES ('3', '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-09-11 11:48:21', '', null, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES ('4', '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-09-11 11:48:21', '', null, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES ('5', '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2022-09-11 11:48:21', '', null, '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `dept_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('100', '0', '0', '若依科技', '0', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('101', '100', '0,100', '深圳总公司', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('102', '100', '0,100', '长沙分公司', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('103', '101', '0,100,101', '研发部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('104', '101', '0,100,101', '市场部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('105', '101', '0,100,101', '测试部门', '3', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('106', '101', '0,100,101', '财务部门', '4', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('107', '101', '0,100,101', '运维部门', '5', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('108', '102', '0,100,102', '市场部门', '1', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);
INSERT INTO `sys_dept` VALUES ('109', '102', '0,100,102', '财务部门', '2', '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-09-11 11:48:21', '', null);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data` (
  `dict_code` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(11) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='字典数据表';

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES ('1', '1', '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2022-09-11 11:48:21', '', null, '性别男');
INSERT INTO `sys_dict_data` VALUES ('2', '2', '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '性别女');
INSERT INTO `sys_dict_data` VALUES ('3', '3', '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '性别未知');
INSERT INTO `sys_dict_data` VALUES ('4', '1', '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-09-11 11:48:21', '', null, '显示菜单');
INSERT INTO `sys_dict_data` VALUES ('5', '2', '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES ('6', '1', '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-09-11 11:48:21', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('7', '2', '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('8', '1', '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-09-11 11:48:21', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('9', '2', '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '停用状态');
INSERT INTO `sys_dict_data` VALUES ('10', '1', '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2022-09-11 11:48:21', '', null, '默认分组');
INSERT INTO `sys_dict_data` VALUES ('11', '2', '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '系统分组');
INSERT INTO `sys_dict_data` VALUES ('12', '1', '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-09-11 11:48:21', '', null, '系统默认是');
INSERT INTO `sys_dict_data` VALUES ('13', '2', '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '系统默认否');
INSERT INTO `sys_dict_data` VALUES ('14', '1', '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-09-11 11:48:21', '', null, '通知');
INSERT INTO `sys_dict_data` VALUES ('15', '2', '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '公告');
INSERT INTO `sys_dict_data` VALUES ('16', '1', '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-09-11 11:48:21', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('17', '2', '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '关闭状态');
INSERT INTO `sys_dict_data` VALUES ('18', '99', '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '其他操作');
INSERT INTO `sys_dict_data` VALUES ('19', '1', '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '新增操作');
INSERT INTO `sys_dict_data` VALUES ('20', '2', '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '修改操作');
INSERT INTO `sys_dict_data` VALUES ('21', '3', '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '删除操作');
INSERT INTO `sys_dict_data` VALUES ('22', '4', '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '授权操作');
INSERT INTO `sys_dict_data` VALUES ('23', '5', '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '导出操作');
INSERT INTO `sys_dict_data` VALUES ('24', '6', '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '导入操作');
INSERT INTO `sys_dict_data` VALUES ('25', '7', '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '强退操作');
INSERT INTO `sys_dict_data` VALUES ('26', '8', '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '生成操作');
INSERT INTO `sys_dict_data` VALUES ('27', '9', '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '清空操作');
INSERT INTO `sys_dict_data` VALUES ('28', '1', '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '正常状态');
INSERT INTO `sys_dict_data` VALUES ('29', '2', '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-09-11 11:48:21', '', null, '停用状态');

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type` (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '字典类型',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE KEY `dict_type` (`dict_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='字典类型表';

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES ('1', '用户性别', 'sys_user_sex', '0', 'admin', '2022-09-11 11:48:21', '', null, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES ('2', '菜单状态', 'sys_show_hide', '0', 'admin', '2022-09-11 11:48:21', '', null, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES ('3', '系统开关', 'sys_normal_disable', '0', 'admin', '2022-09-11 11:48:21', '', null, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES ('4', '任务状态', 'sys_job_status', '0', 'admin', '2022-09-11 11:48:21', '', null, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES ('5', '任务分组', 'sys_job_group', '0', 'admin', '2022-09-11 11:48:21', '', null, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES ('6', '系统是否', 'sys_yes_no', '0', 'admin', '2022-09-11 11:48:21', '', null, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES ('7', '通知类型', 'sys_notice_type', '0', 'admin', '2022-09-11 11:48:21', '', null, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES ('8', '通知状态', 'sys_notice_status', '0', 'admin', '2022-09-11 11:48:21', '', null, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES ('9', '操作类型', 'sys_oper_type', '0', 'admin', '2022-09-11 11:48:21', '', null, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES ('10', '系统状态', 'sys_common_status', '0', 'admin', '2022-09-11 11:48:21', '', null, '登录状态列表');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job` (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_bin NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) COLLATE utf8_bin DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度表';

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES ('1', '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_job` VALUES ('2', '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_job` VALUES ('3', '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-09-11 11:48:21', '', null, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log` (
  `job_log_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) COLLATE utf8_bin NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '日志信息',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='定时任务调度日志表';

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor` (
  `info_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '操作系统',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=138 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='系统访问记录';

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES ('100', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-11 11:51:27');
INSERT INTO `sys_logininfor` VALUES ('101', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-09-11 11:54:04');
INSERT INTO `sys_logininfor` VALUES ('102', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误1次', '2022-09-11 11:54:11');
INSERT INTO `sys_logininfor` VALUES ('103', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-09-11 11:54:11');
INSERT INTO `sys_logininfor` VALUES ('104', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码错误', '2022-09-11 11:54:15');
INSERT INTO `sys_logininfor` VALUES ('105', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-09-11 11:54:18');
INSERT INTO `sys_logininfor` VALUES ('106', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误2次', '2022-09-11 11:54:18');
INSERT INTO `sys_logininfor` VALUES ('107', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误3次', '2022-09-11 11:54:36');
INSERT INTO `sys_logininfor` VALUES ('108', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-09-11 11:54:36');
INSERT INTO `sys_logininfor` VALUES ('109', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-09-11 11:54:53');
INSERT INTO `sys_logininfor` VALUES ('110', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误4次', '2022-09-11 11:54:53');
INSERT INTO `sys_logininfor` VALUES ('111', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '用户不存在/密码错误', '2022-09-11 11:54:57');
INSERT INTO `sys_logininfor` VALUES ('112', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误5次', '2022-09-11 11:54:57');
INSERT INTO `sys_logininfor` VALUES ('113', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-09-11 11:55:04');
INSERT INTO `sys_logininfor` VALUES ('114', 'ry', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-09-11 11:55:04');
INSERT INTO `sys_logininfor` VALUES ('115', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-11 11:56:50');
INSERT INTO `sys_logininfor` VALUES ('116', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-18 17:17:19');
INSERT INTO `sys_logininfor` VALUES ('117', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-09-18 17:25:23');
INSERT INTO `sys_logininfor` VALUES ('118', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-09-18 18:07:14');
INSERT INTO `sys_logininfor` VALUES ('119', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-09-18 18:08:00');
INSERT INTO `sys_logininfor` VALUES ('120', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-18 18:13:07');
INSERT INTO `sys_logininfor` VALUES ('121', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-18 18:18:37');
INSERT INTO `sys_logininfor` VALUES ('122', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '1', '验证码已失效', '2022-09-19 16:32:55');
INSERT INTO `sys_logininfor` VALUES ('123', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-19 16:32:59');
INSERT INTO `sys_logininfor` VALUES ('124', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-20 16:41:41');
INSERT INTO `sys_logininfor` VALUES ('125', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-09-20 16:43:12');
INSERT INTO `sys_logininfor` VALUES ('126', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-09-20 16:43:16');
INSERT INTO `sys_logininfor` VALUES ('127', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-17 16:50:33');
INSERT INTO `sys_logininfor` VALUES ('128', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-17 17:00:42');
INSERT INTO `sys_logininfor` VALUES ('129', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '退出成功', '2022-10-17 17:03:39');
INSERT INTO `sys_logininfor` VALUES ('130', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-17 17:03:44');
INSERT INTO `sys_logininfor` VALUES ('131', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-10-17 17:19:15');
INSERT INTO `sys_logininfor` VALUES ('132', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-17 17:19:19');
INSERT INTO `sys_logininfor` VALUES ('133', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 16:04:32');
INSERT INTO `sys_logininfor` VALUES ('134', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-18 17:00:18');
INSERT INTO `sys_logininfor` VALUES ('135', 'admin', '127.0.0.1', '内网IP', 'Chrome 9', 'Windows 10', '0', '登录成功', '2022-10-18 17:16:50');
INSERT INTO `sys_logininfor` VALUES ('136', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-20 14:30:58');
INSERT INTO `sys_logininfor` VALUES ('137', 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-10-27 16:02:36');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(11) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(11) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(11) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) COLLATE utf8_bin DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) COLLATE utf8_bin DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) COLLATE utf8_bin DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='菜单权限表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '系统管理', '0', '1', 'system', null, '', '1', '0', 'M', '0', '0', '', 'system', 'admin', '2022-09-11 11:48:21', '', null, '系统管理目录');
INSERT INTO `sys_menu` VALUES ('2', '系统监控', '0', '2', 'monitor', null, '', '1', '0', 'M', '0', '0', '', 'monitor', 'admin', '2022-09-11 11:48:21', '', null, '系统监控目录');
INSERT INTO `sys_menu` VALUES ('3', '系统工具', '0', '3', 'tool', null, '', '1', '0', 'M', '0', '0', '', 'tool', 'admin', '2022-09-11 11:48:21', '', null, '系统工具目录');
INSERT INTO `sys_menu` VALUES ('4', '若依官网', '0', '4', 'http://ruoyi.vip', null, '', '0', '0', 'M', '0', '0', '', 'guide', 'admin', '2022-09-11 11:48:21', '', null, '若依官网地址');
INSERT INTO `sys_menu` VALUES ('100', '用户管理', '1', '1', 'user', 'system/user/index', '', '1', '0', 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-09-11 11:48:21', '', null, '用户管理菜单');
INSERT INTO `sys_menu` VALUES ('101', '角色管理', '1', '2', 'role', 'system/role/index', '', '1', '0', 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-09-11 11:48:21', '', null, '角色管理菜单');
INSERT INTO `sys_menu` VALUES ('102', '菜单管理', '1', '3', 'menu', 'system/menu/index', '', '1', '0', 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-09-11 11:48:21', '', null, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES ('103', '部门管理', '1', '4', 'dept', 'system/dept/index', '', '1', '0', 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-09-11 11:48:21', '', null, '部门管理菜单');
INSERT INTO `sys_menu` VALUES ('104', '岗位管理', '1', '5', 'post', 'system/post/index', '', '1', '0', 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-09-11 11:48:21', '', null, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES ('105', '字典管理', '1', '6', 'dict', 'system/dict/index', '', '1', '0', 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-09-11 11:48:21', '', null, '字典管理菜单');
INSERT INTO `sys_menu` VALUES ('106', '参数设置', '1', '7', 'config', 'system/config/index', '', '1', '0', 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-09-11 11:48:21', '', null, '参数设置菜单');
INSERT INTO `sys_menu` VALUES ('107', '通知公告', '1', '8', 'notice', 'system/notice/index', '', '1', '0', 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-09-11 11:48:21', '', null, '通知公告菜单');
INSERT INTO `sys_menu` VALUES ('108', '日志管理', '1', '9', 'log', '', '', '1', '0', 'M', '0', '0', '', 'log', 'admin', '2022-09-11 11:48:21', '', null, '日志管理菜单');
INSERT INTO `sys_menu` VALUES ('109', '在线用户', '2', '1', 'online', 'monitor/online/index', '', '1', '0', 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-09-11 11:48:21', '', null, '在线用户菜单');
INSERT INTO `sys_menu` VALUES ('110', '定时任务', '2', '2', 'job', 'monitor/job/index', '', '1', '0', 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-09-11 11:48:21', '', null, '定时任务菜单');
INSERT INTO `sys_menu` VALUES ('111', '数据监控', '2', '3', 'druid', 'monitor/druid/index', '', '1', '0', 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-09-11 11:48:21', '', null, '数据监控菜单');
INSERT INTO `sys_menu` VALUES ('112', '服务监控', '2', '4', 'server', 'monitor/server/index', '', '1', '0', 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-09-11 11:48:21', '', null, '服务监控菜单');
INSERT INTO `sys_menu` VALUES ('113', '缓存监控', '2', '5', 'cache', 'monitor/cache/index', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-09-11 11:48:21', '', null, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES ('114', '缓存列表', '2', '6', 'cacheList', 'monitor/cache/list', '', '1', '0', 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-09-11 11:48:21', '', null, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES ('115', '表单构建', '3', '1', 'build', 'tool/build/index', '', '1', '0', 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-09-11 11:48:21', '', null, '表单构建菜单');
INSERT INTO `sys_menu` VALUES ('116', '代码生成', '3', '2', 'gen', 'tool/gen/index', '', '1', '0', 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-09-11 11:48:21', '', null, '代码生成菜单');
INSERT INTO `sys_menu` VALUES ('117', '系统接口', '3', '3', 'swagger', 'tool/swagger/index', '', '1', '0', 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-09-11 11:48:21', '', null, '系统接口菜单');
INSERT INTO `sys_menu` VALUES ('500', '操作日志', '108', '1', 'operlog', 'monitor/operlog/index', '', '1', '0', 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-09-11 11:48:21', '', null, '操作日志菜单');
INSERT INTO `sys_menu` VALUES ('501', '登录日志', '108', '2', 'logininfor', 'monitor/logininfor/index', '', '1', '0', 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-09-11 11:48:21', '', null, '登录日志菜单');
INSERT INTO `sys_menu` VALUES ('1000', '用户查询', '100', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1001', '用户新增', '100', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1002', '用户修改', '100', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1003', '用户删除', '100', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1004', '用户导出', '100', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1005', '用户导入', '100', '6', '', '', '', '1', '0', 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1006', '重置密码', '100', '7', '', '', '', '1', '0', 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1007', '角色查询', '101', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1008', '角色新增', '101', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1009', '角色修改', '101', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1010', '角色删除', '101', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1011', '角色导出', '101', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1012', '菜单查询', '102', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1013', '菜单新增', '102', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1014', '菜单修改', '102', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1015', '菜单删除', '102', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1016', '部门查询', '103', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1017', '部门新增', '103', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1018', '部门修改', '103', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1019', '部门删除', '103', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1020', '岗位查询', '104', '1', '', '', '', '1', '0', 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1021', '岗位新增', '104', '2', '', '', '', '1', '0', 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1022', '岗位修改', '104', '3', '', '', '', '1', '0', 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1023', '岗位删除', '104', '4', '', '', '', '1', '0', 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1024', '岗位导出', '104', '5', '', '', '', '1', '0', 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1025', '字典查询', '105', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1026', '字典新增', '105', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1027', '字典修改', '105', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1028', '字典删除', '105', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1029', '字典导出', '105', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1030', '参数查询', '106', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1031', '参数新增', '106', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1032', '参数修改', '106', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1033', '参数删除', '106', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1034', '参数导出', '106', '5', '#', '', '', '1', '0', 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1035', '公告查询', '107', '1', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1036', '公告新增', '107', '2', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1037', '公告修改', '107', '3', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1038', '公告删除', '107', '4', '#', '', '', '1', '0', 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1039', '操作查询', '500', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1040', '操作删除', '500', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1041', '日志导出', '500', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1042', '登录查询', '501', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1043', '登录删除', '501', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1044', '日志导出', '501', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1045', '账户解锁', '501', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1046', '在线查询', '109', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1047', '批量强退', '109', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1048', '单条强退', '109', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1049', '任务查询', '110', '1', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1050', '任务新增', '110', '2', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1051', '任务修改', '110', '3', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1052', '任务删除', '110', '4', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1053', '状态修改', '110', '5', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1054', '任务导出', '110', '6', '#', '', '', '1', '0', 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1055', '生成查询', '116', '1', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1056', '生成修改', '116', '2', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1057', '生成删除', '116', '3', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1058', '导入代码', '116', '4', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1059', '预览代码', '116', '5', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1060', '生成代码', '116', '6', '#', '', '', '1', '0', 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_menu` VALUES ('1061', '悬赏管理', '0', '1', 'reward', 'reward/index', null, '1', '0', 'C', '0', '0', 'reward:list:edit', 'build', 'admin', '2022-09-20 16:42:58', 'admin', '2022-10-17 17:19:05', '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='通知公告表';

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES ('1', '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2022-09-11 11:48:21', '', null, '管理员');
INSERT INTO `sys_notice` VALUES ('2', '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2022-09-11 11:48:21', '', null, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log` (
  `oper_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '模块标题',
  `business_type` int(11) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_bin DEFAULT '' COMMENT '请求方式',
  `operator_type` int(11) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '返回参数',
  `status` int(11) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-11 11:48:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-09-11 11:53:59');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"user\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-09-19 16:33:36');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"悬赏管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/reward\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-09-20 16:42:58');
INSERT INTO `sys_oper_log` VALUES ('103', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"reward/rewardList\",\"createTime\":\"2022-09-20 16:42:58\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"悬赏管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"reward\",\"perms\":\"reward:list:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-10-17 17:03:33');
INSERT INTO `sys_oper_log` VALUES ('104', '菜单管理', '2', 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"reward/index\",\"createTime\":\"2022-09-20 16:42:58\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":1061,\"menuName\":\"悬赏管理\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"reward\",\"perms\":\"reward:list:edit\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-10-17 17:19:05');
INSERT INTO `sys_oper_log` VALUES ('105', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"button\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"悬赏详情\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"\\\\system\\\\\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-10-18 18:07:11');
INSERT INTO `sys_oper_log` VALUES ('106', '菜单管理', '3', 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', '1', 'admin', null, '/system/menu/1062', '127.0.0.1', '内网IP', '{menuId=1062}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-10-18 18:17:21');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(11) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='岗位信息表';

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES ('1', 'ceo', '董事长', '1', '0', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_post` VALUES ('2', 'se', '项目经理', '2', '0', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_post` VALUES ('3', 'hr', '人力资源', '3', '0', 'admin', '2022-09-11 11:48:21', '', null, '');
INSERT INTO `sys_post` VALUES ('4', 'user', '普通员工', '4', '0', 'admin', '2022-09-11 11:48:21', '', null, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) COLLATE utf8_bin NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(11) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) COLLATE utf8_bin DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) DEFAULT '1' COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) DEFAULT '1' COMMENT '部门树选择项是否关联显示',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='角色信息表';

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES ('1', '超级管理员', 'admin', '1', '1', '1', '1', '0', '0', 'admin', '2022-09-11 11:48:21', '', null, '超级管理员');
INSERT INTO `sys_role` VALUES ('2', '普通角色', 'common', '2', '2', '1', '1', '0', '0', 'admin', '2022-09-11 11:48:21', 'admin', '2022-09-11 11:53:59', '普通角色');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `dept_id` bigint(20) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='角色和部门关联表';

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES ('2', '100');
INSERT INTO `sys_role_dept` VALUES ('2', '101');
INSERT INTO `sys_role_dept` VALUES ('2', '105');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu` (
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(20) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='角色和菜单关联表';

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES ('2', '1');
INSERT INTO `sys_role_menu` VALUES ('2', '100');
INSERT INTO `sys_role_menu` VALUES ('2', '101');
INSERT INTO `sys_role_menu` VALUES ('2', '102');
INSERT INTO `sys_role_menu` VALUES ('2', '103');
INSERT INTO `sys_role_menu` VALUES ('2', '104');
INSERT INTO `sys_role_menu` VALUES ('2', '105');
INSERT INTO `sys_role_menu` VALUES ('2', '106');
INSERT INTO `sys_role_menu` VALUES ('2', '107');
INSERT INTO `sys_role_menu` VALUES ('2', '108');
INSERT INTO `sys_role_menu` VALUES ('2', '500');
INSERT INTO `sys_role_menu` VALUES ('2', '501');
INSERT INTO `sys_role_menu` VALUES ('2', '1000');
INSERT INTO `sys_role_menu` VALUES ('2', '1001');
INSERT INTO `sys_role_menu` VALUES ('2', '1002');
INSERT INTO `sys_role_menu` VALUES ('2', '1003');
INSERT INTO `sys_role_menu` VALUES ('2', '1004');
INSERT INTO `sys_role_menu` VALUES ('2', '1005');
INSERT INTO `sys_role_menu` VALUES ('2', '1006');
INSERT INTO `sys_role_menu` VALUES ('2', '1007');
INSERT INTO `sys_role_menu` VALUES ('2', '1008');
INSERT INTO `sys_role_menu` VALUES ('2', '1009');
INSERT INTO `sys_role_menu` VALUES ('2', '1010');
INSERT INTO `sys_role_menu` VALUES ('2', '1011');
INSERT INTO `sys_role_menu` VALUES ('2', '1012');
INSERT INTO `sys_role_menu` VALUES ('2', '1013');
INSERT INTO `sys_role_menu` VALUES ('2', '1014');
INSERT INTO `sys_role_menu` VALUES ('2', '1015');
INSERT INTO `sys_role_menu` VALUES ('2', '1016');
INSERT INTO `sys_role_menu` VALUES ('2', '1017');
INSERT INTO `sys_role_menu` VALUES ('2', '1018');
INSERT INTO `sys_role_menu` VALUES ('2', '1019');
INSERT INTO `sys_role_menu` VALUES ('2', '1020');
INSERT INTO `sys_role_menu` VALUES ('2', '1021');
INSERT INTO `sys_role_menu` VALUES ('2', '1022');
INSERT INTO `sys_role_menu` VALUES ('2', '1023');
INSERT INTO `sys_role_menu` VALUES ('2', '1024');
INSERT INTO `sys_role_menu` VALUES ('2', '1025');
INSERT INTO `sys_role_menu` VALUES ('2', '1026');
INSERT INTO `sys_role_menu` VALUES ('2', '1027');
INSERT INTO `sys_role_menu` VALUES ('2', '1028');
INSERT INTO `sys_role_menu` VALUES ('2', '1029');
INSERT INTO `sys_role_menu` VALUES ('2', '1030');
INSERT INTO `sys_role_menu` VALUES ('2', '1031');
INSERT INTO `sys_role_menu` VALUES ('2', '1032');
INSERT INTO `sys_role_menu` VALUES ('2', '1033');
INSERT INTO `sys_role_menu` VALUES ('2', '1034');
INSERT INTO `sys_role_menu` VALUES ('2', '1035');
INSERT INTO `sys_role_menu` VALUES ('2', '1036');
INSERT INTO `sys_role_menu` VALUES ('2', '1037');
INSERT INTO `sys_role_menu` VALUES ('2', '1038');
INSERT INTO `sys_role_menu` VALUES ('2', '1039');
INSERT INTO `sys_role_menu` VALUES ('2', '1040');
INSERT INTO `sys_role_menu` VALUES ('2', '1041');
INSERT INTO `sys_role_menu` VALUES ('2', '1042');
INSERT INTO `sys_role_menu` VALUES ('2', '1043');
INSERT INTO `sys_role_menu` VALUES ('2', '1044');
INSERT INTO `sys_role_menu` VALUES ('2', '1045');

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(20) DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) COLLATE utf8_bin NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) COLLATE utf8_bin DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) COLLATE utf8_bin DEFAULT '' COMMENT '手机号码',
  `sex` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '密码',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-10-27 16:02:36', 'admin', '2022-09-11 11:48:21', '', '2022-10-27 16:02:36', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-09-11 11:48:21', 'admin', '2022-09-11 11:48:21', '', null, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='用户与岗位关联表';

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES ('1', '1');
INSERT INTO `sys_user_post` VALUES ('2', '2');

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `role_id` bigint(20) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC COMMENT='用户和角色关联表';

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES ('1', '1');
INSERT INTO `sys_user_role` VALUES ('2', '2');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `username` varchar(15) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL,
  `age` tinyint(4) DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL COMMENT '0男 1女 2未知',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '0停用 1启用',
  `description` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `username_index` (`username`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '13623603552', '12321', null, null, null, null, null, null, null, null);
INSERT INTO `user` VALUES ('1510809551241248', '13623603675', null, null, null, '13623603675', null, '1', null, '2022-10-30 09:55:33', null);
