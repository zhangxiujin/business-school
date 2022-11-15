/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50515
Source Host           : localhost:3306
Source Database       : ruoyi

Target Server Type    : MYSQL
Target Server Version : 50515
File Encoding         : 65001

Date: 2022-10-07 13:56:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for demo
-- ----------------------------
DROP TABLE IF EXISTS `demo`;
CREATE TABLE `demo` (
  `id` varchar(50) COLLATE utf8_bin NOT NULL,
  `name` varchar(50) COLLATE utf8_bin DEFAULT NULL,
  `password` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of demo
-- ----------------------------

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
  PRIMARY KEY (`table_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码生成业务表';

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
  PRIMARY KEY (`column_id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='代码生成业务表字段';

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
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  PRIMARY KEY (`log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  PRIMARY KEY (`parameter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

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
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Blob类型的触发器表';

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
  PRIMARY KEY (`sched_name`,`calendar_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='日历信息表';

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
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Cron类型的触发器表';

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
  `fired_time` bigint(13) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(13) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(11) NOT NULL COMMENT '优先级',
  `state` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '状态',
  `job_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) COLLATE utf8_bin DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`,`entry_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='已触发的触发器表';

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
  PRIMARY KEY (`sched_name`,`job_name`,`job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='任务详细信息表';

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
  PRIMARY KEY (`sched_name`,`lock_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='存储的悲观锁信息表';

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps` (
  `sched_name` varchar(120) COLLATE utf8_bin NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) COLLATE utf8_bin NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`,`trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='暂停的触发器表';

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
  `last_checkin_time` bigint(13) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(13) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`,`instance_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='调度器状态表';

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
  `repeat_count` bigint(7) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(12) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(10) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='简单触发器的信息表';

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
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='同步机制的行锁表';

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
  `next_fire_time` bigint(13) DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(13) DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(11) DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) COLLATE utf8_bin NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) COLLATE utf8_bin NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(13) NOT NULL COMMENT '开始时间',
  `end_time` bigint(13) DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) COLLATE utf8_bin DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(2) DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`,`trigger_name`,`trigger_group`),
  KEY `sched_name` (`sched_name`,`job_name`,`job_group`),
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='触发器详细信息表';

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
  `verify` tinyint(1) DEFAULT NULL COMMENT '0未通过 1通过',
  `amount` int(11) DEFAULT NULL,
  `end_time` datetime DEFAULT NULL,
  `shield` tinyint(1) DEFAULT NULL,
  `del` tinyint(1) DEFAULT NULL,
  `top` tinyint(1) DEFAULT NULL,
  `best_answer` tinyint(1) DEFAULT NULL,
  `recommend` tinyint(1) DEFAULT NULL,
  `time_out` tinyint(1) DEFAULT NULL COMMENT '0正常 1超时',
  `published_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`reward_id`),
  KEY `FK_Reference_1` (`id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='主表';

-- ----------------------------
-- Records of reward
-- ----------------------------
INSERT INTO `reward` VALUES ('1', '1', '悬赏1', 0xE4B88EE6B094E58099E58F98E58C96E8B59BE8B791EFBC8CE4B8ADE59BBDE4BC81E4B89AE4B880E9A9ACE5BD93E58588E38082E7BB8FE8BF87E5A49AE5B9B4E79A84E4BAA7E4B89AE7A7AFE7B4AFEFBC8CE4B8ADE59BBDE4BC81E4B89AE5B7B2E59CA8E7BBBFE889B2E4BAA4E9809AE9A286E59F9FE585B7E69C89E4B8BBE59CBAE4BC98E58ABFE28094E28094E4B8ADE59BBDE4BC81E4B89AE7949FE4BAA7E4BA86E585A8E79083E8B685E8BF87E4B880E58D8AE79A84E794B5E58AA8E6B1BDE8BDA6EFBC8CE5908CE697B6E68890E4B8BAE79BAEE5898DE585A8E79083E794B5E6B1A0E4BAA7E4B89AE79A84E4B8ADE5BF83EFBC8CE794B5E6B1A0E4BAA7E9878FE4B88EE5B882E59CBAE8A784E6A8A1E59D87E5B185E4B896E7958CE7ACACE4B880EFBC8CE5AE9EE78EB0E4BA86E59CA8E6B1BDE8BDA6E4BAA7E4B89AE79A84E68DA2E98193E8B685E8BDA6E380820D0A0D0AE59CA8E58AA0E585A5E8BF9CE699AFE99B86E59BA2E4B98BE5898DEFBC8CE5BC97E69C97E88CA8E59CA8E5BEB7E4BC81E68B85E4BBBBE4BA863230E5A49AE5B9B4E9AB98E7AEA1EFBC8CE4B8BBE8A681E8B49FE8B4A3E8B1AAE58D8EE8BDA6E7BB86E58886E5B882E59CBAE38082E2809CE4B880E4B8AAE581B6E784B6E79A84E69CBAE4BC9AEFBC8CE68891E590ACE588B0E8BF9CE699AFE99B86E59BA2E5889BE5A78BE4BABAE585BCE9A696E5B8ADE689A7E8A18CE5AE98E5BCA0E99BB7E58886E4BAABE99B86E59BA2E5AFB9E58FAFE5868DE7949FE883BDE6BA90E38081E794B5E6B1A0E38081E582A8E883BDE38081E58585E794B5E5928CE699BAE883BDE789A9E88194E9A286E59F9FE79A84E585B3E6B3A8E5928CE68EA2E7B4A2EFBC8CE794A8E7A791E68A80E5889BE696B0E58AA9E58A9BE99BB6E7A2B3E8BDACE59E8BEFBC8CE99D9EE5B8B8E585B7E69C89E5898DE79EBBE680A7EFBC8CE4B88EE68891E5BD93E697B6E5819AE79A84E5B7A5E4BD9CE4B88DE4B880E6A0B7E38082E2809DE5BC97E69C97E88CA8E59B9EE5BF86E98193EFBC8CE4BA8EE698AFE4BB96E586B3E5AE9AE58AA0E585A5E8BF99E5AEB6E585A8E79083E9A286E58588E79A84E7BBBFE889B2E7A791E68A80E585ACE58FB8EFBC8CE4B8BAE585ACE58FB8E58F91E5B195E58AA9E58A9BEFBC8CE5ADA6E4B9A0E69BB4E5A49AE696B0E4BA8BE789A9E38082, '11', null, '11111', null, null, null, null, null, null, null, '2022-10-04 14:22:32', '2022-10-04 10:23:11');
INSERT INTO `reward` VALUES ('2', '1', '悬赏标题', null, '11', null, null, null, null, null, null, null, null, null, '2022-10-05 14:23:00', '2022-10-05 12:23:03');
INSERT INTO `reward` VALUES ('3', '1', '悬赏发布草稿', null, '10', null, null, null, null, null, null, null, null, null, null, '2022-10-05 14:27:37');

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
  PRIMARY KEY (`answer_id`),
  KEY `FK_Reference_2` (`reward_id`),
  KEY `FK_Reference_3` (`id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`reward_id`) REFERENCES `reward` (`reward_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of reward_answer
-- ----------------------------
INSERT INTO `reward_answer` VALUES ('1506514875449376', '1', '1', 0x3C703E64736664736664736673643C2F703E, '0', '2022-10-06 17:04:32');
INSERT INTO `reward_answer` VALUES ('1506516829995040', '1', '1', 0x3C703E313233313233323133323133323C2F703E, '0', '2022-10-06 17:20:04');

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) COLLATE utf8_bin DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) COLLATE utf8_bin DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='参数配置表';

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
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) COLLATE utf8_bin DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) COLLATE utf8_bin DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) COLLATE utf8_bin DEFAULT NULL COMMENT '邮箱',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='部门表';

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
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
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
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典数据表';

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
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='字典类型表';

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
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='定时任务调度表';

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
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='定时任务调度日志表';

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
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=127 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='系统访问记录';

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

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(20) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `path` varchar(200) COLLATE utf8_bin DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(1) DEFAULT '1' COMMENT '是否为外链（0是 1否）',
  `is_cache` int(1) DEFAULT '0' COMMENT '是否缓存（0缓存 1不缓存）',
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
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1062 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='菜单权限表';

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
INSERT INTO `sys_menu` VALUES ('1061', '悬赏管理', '0', '1', '/reward', null, null, '1', '0', 'M', '0', '0', null, 'build', 'admin', '2022-09-20 16:42:58', '', null, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '公告标题',
  `notice_type` char(1) COLLATE utf8_bin NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob COMMENT '公告内容',
  `status` char(1) COLLATE utf8_bin DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='通知公告表';

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
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) COLLATE utf8_bin DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) COLLATE utf8_bin DEFAULT '' COMMENT '请求方式',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) COLLATE utf8_bin DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) COLLATE utf8_bin DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) COLLATE utf8_bin DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '返回参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) COLLATE utf8_bin DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='操作日志记录';

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES ('100', '角色管理', '2', 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', '1', 'admin', null, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-09-11 11:48:21\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[1,100,1000,1001,1002,1003,1004,1005,1006,101,1007,1008,1009,1010,1011,102,1012,1013,1014,1015,103,1016,1017,1018,1019,104,1020,1021,1022,1023,1024,105,1025,1026,1027,1028,1029,106,1030,1031,1032,1033,1034,107,1035,1036,1037,1038,108,500,1039,1040,1041,501,1042,1043,1044,1045],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":\"2\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-09-11 11:53:59');
INSERT INTO `sys_oper_log` VALUES ('101', '代码生成', '6', 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', '1', 'admin', null, '/tool/gen/importTable', '127.0.0.1', '内网IP', '\"user\"', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-09-19 16:33:36');
INSERT INTO `sys_oper_log` VALUES ('102', '菜单管理', '1', 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', '1', 'admin', null, '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"build\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"悬赏管理\",\"menuType\":\"M\",\"orderNum\":1,\"params\":{},\"parentId\":0,\"path\":\"/reward\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', '0', null, '2022-09-20 16:42:58');

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post` (
  `post_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) COLLATE utf8_bin NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) COLLATE utf8_bin NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) COLLATE utf8_bin NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) COLLATE utf8_bin DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) COLLATE utf8_bin DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='岗位信息表';

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
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
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
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色信息表';

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
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色和部门关联表';

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
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='角色和菜单关联表';

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
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户信息表';

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES ('1', '103', 'admin', '若依', '00', 'ry@163.com', '15888888888', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-09-20 16:43:16', 'admin', '2022-09-11 11:48:21', '', '2022-09-20 16:43:16', '管理员');
INSERT INTO `sys_user` VALUES ('2', '105', 'ry', '若依', '00', 'ry@qq.com', '15666666666', '1', '', '$2a$10$7JB720yubVSZvUI0rEqK/.VqGOZTH.ulu33dHOiBE8ByOhJIrdAu2', '0', '0', '127.0.0.1', '2022-09-11 11:48:21', 'admin', '2022-09-11 11:48:21', '', null, '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `post_id` bigint(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户与岗位关联表';

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
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='用户和角色关联表';

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
  `age` tinyint(3) DEFAULT NULL,
  `nickname` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `sex` tinyint(1) DEFAULT NULL COMMENT '0男 1女 2未知',
  `enabled` tinyint(1) DEFAULT NULL COMMENT '0停用 1启用',
  `description` varchar(300) COLLATE utf8_bin DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', '13623603675', '12321', null, null, null, null, null, null, null, null);
