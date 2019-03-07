-- --------------------------------------------------------
-- 主机:                           192.168.3.126
-- 服务器版本:                        5.7.17-log - MySQL Community Server (GPL)
-- 服务器操作系统:                      Win64
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 sibo-gxy-2.sys_config 结构
CREATE TABLE IF NOT EXISTS `sys_config` (
  `config_id` int(5) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(100) DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`config_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='参数配置表';

-- 正在导出表  sibo-gxy-2.sys_config 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` (`config_id`, `config_name`, `config_key`, `config_value`, `config_type`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-default', 'Y', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '默认 skin-default、蓝色 skin-blue、黄色 skin-yellow'),
	(2, '用户管理-账号初始密码', 'sys.user.initPassword', '88888888', 'Y', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '初始化密码 88888888');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_dept 结构
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT '' COMMENT '负责人',
  `phone` varchar(11) DEFAULT '' COMMENT '联系电话',
  `email` varchar(50) DEFAULT '' COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 正在导出表  sibo-gxy-2.sys_dept 的数据：~10 rows (大约)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` (`dept_id`, `parent_id`, `ancestors`, `dept_name`, `order_num`, `leader`, `phone`, `email`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`) VALUES
	(100, 0, '0', '医疗卫生部', 0, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00'),
	(101, 100, '0,100', '南昌医院', 1, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00'),
	(102, 100, '0,100', '九江医院', 2, 'zy', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-24 11:54:18'),
	(103, 101, '0,100,101', '办公室', 1, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:37:30'),
	(104, 101, '0,100,101', '药品部', 2, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:37:54'),
	(105, 101, '0,100,101', '住院部', 3, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:38:13'),
	(106, 101, '0,100,101', '财务部门', 4, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '2', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00'),
	(107, 101, '0,100,101', '后勤部', 5, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:38:33'),
	(108, 102, '0,100,102', '办公室', 1, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:38:53'),
	(109, 102, '0,100,102', '药品部', 2, 'SIBO', '15888888888', 'cs.chenzz@qq.com', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:39:09');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_dict_data 结构
CREATE TABLE IF NOT EXISTS `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(500) DEFAULT '' COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(500) DEFAULT '' COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- 正在导出表  sibo-gxy-2.sys_dict_data 的数据：~38 rows (大约)
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '性别男'),
	(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '性别女'),
	(4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '显示菜单'),
	(5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '隐藏菜单'),
	(6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '正常状态'),
	(7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '停用状态'),
	(8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '正常状态'),
	(9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '停用状态'),
	(10, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统默认是'),
	(11, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统默认否'),
	(12, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '通知'),
	(13, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '公告'),
	(14, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '正常状态'),
	(15, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '关闭状态'),
	(16, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '新增操作'),
	(17, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '修改操作'),
	(18, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '删除操作'),
	(19, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '授权操作'),
	(20, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '导出操作'),
	(21, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '导入操作'),
	(22, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '强退操作'),
	(23, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '生成操作'),
	(24, 8, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '清空操作'),
	(25, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '正常状态'),
	(26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '停用状态'),
	(27, 1, 'A型', 'A型', 'blood_type', '', 'default', 'N', '0', 'sibo-chenzz', '2018-10-31 10:17:17', '', NULL, 'A型'),
	(28, 2, 'B型', 'B型', 'blood_type', '', 'default', 'N', '0', 'sibo-chenzz', '2018-10-31 10:17:42', '', NULL, 'B型'),
	(29, 3, 'AB型', 'AB型', 'blood_type', '', 'default', 'N', '0', 'sibo-chenzz', '2018-10-31 10:18:08', '', NULL, 'AB型'),
	(30, 4, 'O型', 'O型', 'blood_type', '', 'default', 'N', '0', 'sibo-chenzz', '2018-10-31 10:18:32', '', NULL, 'O型'),
	(32, 1, '已婚', '已婚', 'config_marriage', '', 'default', 'N', '0', 'sibo-chenzz', '2018-10-31 18:16:42', '', NULL, ''),
	(33, 2, '未婚', '未婚', 'config_marriage', '', 'default', 'N', '0', 'sibo-chenzz', '2018-10-31 18:17:04', '', NULL, ''),
	(34, 1, '健康资讯', '健康资讯', 'article_type', '', 'default', 'Y', '0', 'sibo-chenzz', '2018-10-31 19:27:14', '', NULL, ''),
	(35, 2, '健康小常识', '健康小常识', 'article_type', '', 'default', 'N', '0', 'sibo-chenzz', '2018-10-31 19:28:12', '', NULL, '健康小常识'),
	(36, 1, '180', 'SOS_hight', 'SOS_trigger', '', 'default', 'N', '0', '', NULL, '', NULL, ''),
	(37, 2, '50', 'SOS_low', 'SOS_trigger', '', 'default', 'N', '0', '', NULL, '', NULL, ''),
	(38, 1, '普通', '1', 'illness_grade', '', '', 'Y', '0', 'sibo-chenzz', '2018-12-28 12:39:59', '', NULL, ''),
	(39, 2, '严重', '2', 'illness_grade', '', '', 'Y', '0', 'sibo-chenzz', '2018-12-28 12:40:16', '', NULL, ''),
	(40, 3, '高危', '3', 'illness_grade', '', '', 'Y', '0', 'sibo-chenzz', '2018-12-28 12:40:46', '', NULL, '');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_dict_type 结构
CREATE TABLE IF NOT EXISTS `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- 正在导出表  sibo-gxy-2.sys_dict_type 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` (`dict_id`, `dict_name`, `dict_type`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '用户性别', 'sys_user_sex', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '用户性别列表'),
	(2, '菜单状态', 'sys_show_hide', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '菜单状态列表'),
	(3, '系统开关', 'sys_normal_disable', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统开关列表'),
	(4, '任务状态', 'sys_job_status', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '任务状态列表'),
	(5, '系统是否', 'sys_yes_no', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统是否列表'),
	(6, '通知类型', 'sys_notice_type', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '通知类型列表'),
	(7, '通知状态', 'sys_notice_status', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '通知状态列表'),
	(8, '操作类型', 'sys_oper_type', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '操作类型列表'),
	(9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '登录状态列表'),
	(10, '血型', 'blood_type', '0', 'sibo-chenzz', '2018-10-30 16:22:10', 'sibo-chenzz', '2018-10-30 16:57:50', '血型'),
	(11, '婚姻', 'config_marriage', '0', 'sibo-chenzz', '2018-10-31 18:15:53', '', NULL, ''),
	(12, '文章类别', 'article_type', '0', 'sibo-chenzz', '2018-10-31 19:25:56', '', NULL, '文章类别'),
	(13, '报警触发', 'SOS_trigger', '0', 'sibo-chenzz', '2018-12-27 19:43:02', 'sibo-chenzz', '2018-12-27 19:44:18', '报警触发'),
	(14, '患者严重程度等级', 'illness_grade', '0', 'sibo-chenzz', '2018-12-28 12:35:58', '', NULL, '');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_job 结构
CREATE TABLE IF NOT EXISTS `sys_job` (
  `job_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL DEFAULT '' COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT '' COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `cron_expression` varchar(255) DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) DEFAULT '1' COMMENT '计划执行错误策略（1继续 2等待 3放弃）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`,`job_name`,`job_group`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='定时任务调度表';

-- 正在导出表  sibo-gxy-2.sys_job 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` (`job_id`, `job_name`, `job_group`, `method_name`, `method_params`, `cron_expression`, `misfire_policy`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'sbTask', '系统默认（无参）', 'sbNoParams', '', '0/10 * * * * ?', '1', '1', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(2, 'sbTask', '系统默认（有参）', 'sbParams', 'sb', '0/20 * * * * ?', '1', '1', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_job_log 结构
CREATE TABLE IF NOT EXISTS `sys_job_log` (
  `job_log_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) NOT NULL COMMENT '任务组名',
  `method_name` varchar(500) DEFAULT NULL COMMENT '任务方法',
  `method_params` varchar(200) DEFAULT '' COMMENT '方法参数',
  `job_message` varchar(500) DEFAULT NULL COMMENT '日志信息',
  `status` char(1) DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` text COMMENT '异常信息',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='定时任务调度日志表';

-- 正在导出表  sibo-gxy-2.sys_job_log 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_logininfor 结构
CREATE TABLE IF NOT EXISTS `sys_logininfor` (
  `info_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` char(1) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`)
) ENGINE=InnoDB AUTO_INCREMENT=143 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- 正在导出表  sibo-gxy-2.sys_logininfor 的数据：~129 rows (大约)
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
INSERT INTO `sys_logininfor` (`info_id`, `login_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `msg`, `login_time`) VALUES
	(1, 'admin', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-15 12:21:09'),
	(2, 'ys', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '用户不存在/密码错误', '2018-12-15 12:21:24'),
	(3, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-15 12:21:32'),
	(4, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-15 14:53:28'),
	(5, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-15 15:15:03'),
	(6, 'sibo-chenzz', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 15:08:42'),
	(7, 'ys5', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-16 16:28:31'),
	(8, 'ys5', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-16 16:28:42'),
	(9, 'ys5', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 16:29:28'),
	(10, 'ys5', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-16 16:30:42'),
	(11, 'yy5', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 16:30:51'),
	(12, 'sibo-chenzz', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 16:31:15'),
	(13, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 16:31:35'),
	(14, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-16 16:53:32'),
	(15, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 16:53:36'),
	(16, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 16:59:11'),
	(17, 'sibo-chenzz', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 17:13:30'),
	(18, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 17:25:01'),
	(19, 'sibo-chenzz', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-16 17:30:42'),
	(20, 'ys5', '192.168.3.135', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 12:13:40'),
	(21, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-17 18:21:24'),
	(22, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 09:38:37'),
	(23, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 12:19:01'),
	(24, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 12:53:23'),
	(25, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 14:36:22'),
	(26, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 15:08:02'),
	(27, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-18 15:25:18'),
	(28, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 15:25:21'),
	(29, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 15:34:14'),
	(30, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 15:53:25'),
	(31, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 16:20:48'),
	(32, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-18 16:26:29'),
	(33, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 16:26:40'),
	(34, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 16:37:15'),
	(35, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 16:59:48'),
	(36, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 17:02:35'),
	(37, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 17:16:48'),
	(38, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 18:18:10'),
	(39, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 18:19:50'),
	(40, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-18 18:20:58'),
	(41, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-19 10:13:44'),
	(42, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 10:13:48'),
	(43, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 10:43:03'),
	(44, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-19 17:38:17'),
	(45, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 09:54:33'),
	(46, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 10:15:37'),
	(47, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 10:42:28'),
	(48, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 11:15:54'),
	(49, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 11:18:06'),
	(50, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 11:18:41'),
	(51, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 11:33:09'),
	(52, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 11:42:11'),
	(53, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-20 12:08:46'),
	(54, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 09:50:47'),
	(55, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 10:32:47'),
	(56, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 10:34:13'),
	(57, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 10:38:48'),
	(58, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 10:42:50'),
	(59, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 11:19:57'),
	(60, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 11:49:17'),
	(61, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 14:30:43'),
	(62, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-21 15:49:55'),
	(63, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:21:45'),
	(64, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:25:41'),
	(65, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:31:19'),
	(66, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:37:47'),
	(67, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:44:00'),
	(68, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:45:12'),
	(69, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:47:15'),
	(70, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:53:37'),
	(71, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 10:56:51'),
	(72, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 11:03:08'),
	(73, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 11:06:23'),
	(74, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 11:07:55'),
	(75, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 17:32:47'),
	(76, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-24 17:42:17'),
	(77, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2018-12-24 17:42:20'),
	(78, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-24 17:42:23'),
	(79, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-24 17:42:26'),
	(80, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2018-12-24 17:42:28'),
	(81, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-24 17:42:36'),
	(82, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 15:31:00'),
	(83, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-27 15:36:01'),
	(84, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 15:36:14'),
	(85, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-27 15:37:39'),
	(86, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 15:58:06'),
	(87, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 16:52:20'),
	(88, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 17:39:30'),
	(89, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 17:48:03'),
	(90, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '验证码错误', '2018-12-27 18:04:26'),
	(91, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 18:04:29'),
	(92, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 18:07:22'),
	(93, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 18:20:27'),
	(94, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-27 18:31:01'),
	(95, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-28 09:46:17'),
	(96, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2018-12-28 09:46:18'),
	(97, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2018-12-28 09:46:19'),
	(98, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误4次', '2018-12-28 09:46:20'),
	(99, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误5次', '2018-12-28 09:46:21'),
	(100, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2018-12-28 09:46:25'),
	(101, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 09:46:25'),
	(102, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 10:05:16'),
	(103, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 10:10:10'),
	(104, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 10:20:38'),
	(105, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 10:40:36'),
	(106, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:35:41'),
	(107, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 11:59:54'),
	(108, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 12:16:48'),
	(109, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 12:19:07'),
	(110, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 12:29:35'),
	(111, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 12:31:13'),
	(112, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2018-12-28 12:34:53'),
	(113, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 12:35:00'),
	(114, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 15:03:40'),
	(115, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 15:32:28'),
	(116, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 15:58:32'),
	(117, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 16:04:48'),
	(118, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 16:13:53'),
	(119, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 16:49:52'),
	(120, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 17:10:31'),
	(121, 'ys7', '127.0.0.1', '内网IP', 'Firefox', 'Windows 10', '0', '登录成功', '2018-12-28 17:31:57'),
	(122, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误1次', '2018-12-28 18:42:26'),
	(123, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误2次', '2018-12-28 18:42:29'),
	(124, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误3次', '2018-12-28 18:42:30'),
	(125, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误4次', '2018-12-28 18:42:32'),
	(126, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误5次', '2018-12-28 18:42:38'),
	(127, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2018-12-28 18:42:42'),
	(128, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2018-12-28 18:42:42'),
	(129, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 14:33:33'),
	(130, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 15:24:30'),
	(131, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 15:26:57'),
	(132, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 16:03:45'),
	(133, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 16:14:59'),
	(134, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-01-03 16:15:23'),
	(135, 'yy5', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 16:15:30'),
	(136, 'yy5', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 16:20:26'),
	(137, 'yy5', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-01-03 16:21:59'),
	(138, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 16:22:06'),
	(139, 'sibo-chenzz', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '退出成功', '2019-01-03 16:27:54'),
	(140, 'ys7', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 16:28:01'),
	(141, 'yy5', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-03 16:50:54'),
	(142, 'yy5', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', '0', '登录成功', '2019-01-04 14:38:52');
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_menu 结构
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT '' COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2083 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- 正在导出表  sibo-gxy-2.sys_menu 的数据：~129 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `menu_type`, `visible`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '系统管理', 0, 1, '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统管理目录'),
	(2, '系统监控', 0, 2, '#', 'M', '0', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统监控目录'),
	(100, '用户管理', 1, 1, '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '用户管理菜单'),
	(101, '角色管理', 1, 2, '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '角色管理菜单'),
	(102, '菜单管理', 1, 3, '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '菜单管理菜单'),
	(103, '部门管理', 1, 4, '/system/dept', 'C', '0', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '部门管理菜单'),
	(104, '岗位管理', 1, 5, '/system/post', 'C', '0', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '岗位管理菜单'),
	(105, '字典管理', 1, 6, '/system/dict', 'C', '0', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '字典管理菜单'),
	(106, '参数设置', 1, 7, '/system/config', 'C', '0', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-24 11:58:21', '参数设置菜单'),
	(107, '通知公告', 1, 8, '/system/notice', 'C', '1', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-11-02 16:53:37', '通知公告菜单'),
	(109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '在线用户菜单'),
	(111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '数据监控菜单'),
	(500, '操作日志', 1, 20, '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-19 20:11:18', '操作日志菜单'),
	(501, '登录日志', 1, 30, '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-19 20:12:18', '登录日志菜单'),
	(1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1005, '重置密码', 100, 5, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1006, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1007, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1008, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1009, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1010, '角色导出', 101, 4, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1011, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1012, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1013, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1014, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1015, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1016, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1017, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1018, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1019, '岗位查询', 104, 1, '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1020, '岗位新增', 104, 2, '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1021, '岗位修改', 104, 3, '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1022, '岗位删除', 104, 4, '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1023, '岗位导出', 104, 4, '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1024, '字典查询', 105, 1, '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1025, '字典新增', 105, 2, '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1026, '字典修改', 105, 3, '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1027, '字典删除', 105, 4, '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1028, '字典导出', 105, 4, '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1029, '参数查询', 106, 1, '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1030, '参数新增', 106, 2, '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1031, '参数修改', 106, 3, '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1032, '参数删除', 106, 4, '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1033, '参数导出', 106, 4, '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1034, '公告查询', 107, 1, '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1035, '公告新增', 107, 2, '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1036, '公告修改', 107, 3, '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1037, '公告删除', 107, 4, '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1038, '操作查询', 500, 1, '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1039, '操作删除', 500, 2, '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1040, '详细信息', 500, 3, '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1041, '日志导出', 500, 3, '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1042, '登录查询', 501, 1, '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1043, '登录删除', 501, 2, '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1044, '日志导出', 501, 2, '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1045, '在线查询', 109, 1, '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1046, '批量强退', 109, 2, '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1047, '单条强退', 109, 3, '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(2000, '医院医生', 0, 20, '#', 'M', '0', '', 'fa fa-bank', 'sibo-chenzz', '2018-10-19 20:20:24', '', NULL, ''),
	(2001, '患者管理', 0, 30, '#', 'M', '0', '', 'fa fa-address-card-o', 'sibo-chenzz', '2018-10-19 20:21:21', 'sibo-chenzz', '2018-12-06 14:40:06', ''),
	(2004, '健康资讯', 0, 40, '#', 'M', '0', '', 'fa fa-cutlery', 'sibo-chenzz', '2018-10-19 20:56:03', '', NULL, ''),
	(2012, '患者管理', 2001, 1, '/yl/patientUser', 'C', '0', 'yl:patientUser:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-20 15:09:36', '用户(相当于患者),针对前台app类用户菜单'),
	(2013, '用户查询', 2012, 1, '#', 'F', '0', 'yl:patientUser:list', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-23 10:58:52', ''),
	(2014, '用户新增', 2012, 2, '#', 'F', '0', 'yl:patientUser:add', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-23 10:59:04', ''),
	(2015, '用户修改', 2012, 3, '#', 'F', '0', 'yl:patientUser:edit', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-23 11:02:15', ''),
	(2016, '用户删除', 2012, 4, '#', 'F', '0', 'yl:patientUser:remove', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-23 11:02:27', ''),
	(2017, '资讯文章', 2004, 1, '/yl/article', 'C', '0', 'yl:article:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-21 14:01:21', '文章菜单'),
	(2018, '文章查询', 2017, 1, '#', 'F', '0', 'yl:article:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2019, '文章新增', 2017, 2, '#', 'F', '0', 'yl:article:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2020, '文章修改', 2017, 3, '#', 'F', '0', 'yl:article:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2021, '文章删除', 2017, 4, '#', 'F', '0', 'yl:article:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2022, '医院管理', 2000, 1, '/yl/hospital', 'C', '0', 'yl:hospital:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-22 18:08:08', '医院菜单'),
	(2023, '医院查询', 2022, 1, '#', 'F', '0', 'yl:hospital:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2024, '医院新增', 2022, 2, '#', 'F', '0', 'yl:hospital:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2025, '医院修改', 2022, 3, '#', 'F', '0', 'yl:hospital:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2026, '医院删除', 2022, 4, '#', 'F', '0', 'yl:hospital:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2027, '医生管理', 2000, 10, '/yl/doctor', 'C', '0', 'yl:doctor:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-23 19:17:57', '医生菜单'),
	(2028, '医生查询', 2027, 1, '#', 'F', '0', 'yl:doctor:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2029, '医生新增', 2027, 2, '#', 'F', '0', 'yl:doctor:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2030, '医生修改', 2027, 3, '#', 'F', '0', 'yl:doctor:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2031, '医生删除', 2027, 4, '#', 'F', '0', 'yl:doctor:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2032, '消息建议', 2004, 10, '/yl/message', 'C', '0', 'yl:message:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-12-02 14:52:56', '消息菜单'),
	(2033, '消息查询', 2032, 1, '#', 'F', '0', 'yl:message:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2034, '消息新增', 2032, 2, '#', 'F', '1', 'yl:message:add', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-12-02 15:10:18', ''),
	(2035, '消息修改', 2032, 3, '#', 'F', '1', 'yl:message:edit', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-12-02 15:10:40', ''),
	(2036, '消息删除', 2032, 4, '#', 'F', '0', 'yl:message:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2037, '咨询回复', 2001, 40, '/yl/askReply', 'C', '1', 'yl:askReply:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-11-01 19:01:42', '咨询建议菜单'),
	(2038, '回复查询', 2037, 1, '#', 'F', '0', 'yl:askReply:list', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-26 17:28:32', ''),
	(2039, '回复新增', 2037, 2, '#', 'F', '0', 'yl:askReply:add', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-26 17:28:52', ''),
	(2040, '回复修改', 2037, 3, '#', 'F', '0', 'yl:askReply:edit', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-26 17:29:11', ''),
	(2041, '回复删除', 2037, 4, '#', 'F', '0', 'yl:askReply:remove', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-26 17:29:28', ''),
	(2042, '咨询管理', 2001, 30, '/yl/ask', 'C', '0', 'yl:ask:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-10-26 17:30:28', '咨询菜单'),
	(2043, '咨询查询', 2042, 1, '#', 'F', '0', 'yl:ask:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2044, '咨询新增', 2042, 2, '#', 'F', '0', 'yl:ask:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2045, '咨询修改', 2042, 3, '#', 'F', '0', 'yl:ask:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2046, '咨询删除', 2042, 4, '#', 'F', '0', 'yl:ask:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2052, '患者亲友', 2001, 100, '/yl/userFriend', 'C', '1', 'yl:userFriend:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-11-30 15:06:18', '亲友菜单'),
	(2053, '亲友查询', 2052, 1, '#', 'F', '0', 'yl:userFriend:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2054, '亲友新增', 2052, 2, '#', 'F', '0', 'yl:userFriend:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2055, '亲友修改', 2052, 3, '#', 'F', '0', 'yl:userFriend:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2056, '亲友删除', 2052, 4, '#', 'F', '0', 'yl:userFriend:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2057, '患者设备', 2001, 200, '/yl/device', 'C', '0', 'yl:device:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-11-30 10:21:19', '设备菜单'),
	(2058, '设备查询', 2057, 1, '#', 'F', '0', 'yl:device:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2059, '设备新增', 2057, 2, '#', 'F', '0', 'yl:device:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2060, '设备修改', 2057, 3, '#', 'F', '0', 'yl:device:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2061, '设备删除', 2057, 4, '#', 'F', '0', 'yl:device:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2072, '报警记录', 2000, 200, '/yl/warningHistory', 'C', '0', 'yl:warningHistory:view', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-12-06 16:03:01', '报警记录菜单'),
	(2073, '报警记录查询', 2072, 1, '#', 'F', '0', 'yl:warningHistory:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2074, '报警记录新增', 2072, 2, '#', 'F', '0', 'yl:warningHistory:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2075, '报警记录修改', 2072, 3, '#', 'F', '0', 'yl:warningHistory:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2076, '报警记录删除', 2072, 4, '#', 'F', '0', 'yl:warningHistory:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2077, '医院资料', 2000, 5, '/yl/hospital/hospitalDetail', 'C', '0', 'yl:hospital:viewdetail', '#', 'admin', '2018-03-01 00:00:00', 'sibo-chenzz', '2018-12-07 15:42:48', '医院资料'),
	(2078, '短信记录', 1, 100, '/yl/smsHistory', 'C', '0', 'yl:smsHistory:view', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '短信记录菜单'),
	(2079, '短信记录查询', 2078, 1, '#', 'F', '0', 'yl:smsHistory:list', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2080, '短信记录新增', 2078, 2, '#', 'F', '0', 'yl:smsHistory:add', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2081, '短信记录修改', 2078, 3, '#', 'F', '0', 'yl:smsHistory:edit', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', ''),
	(2082, '短信记录删除', 2078, 4, '#', 'F', '0', 'yl:smsHistory:remove', '#', 'admin', '2018-03-01 00:00:00', 'ry', '2018-03-01 00:00:00', '');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_notice 结构
CREATE TABLE IF NOT EXISTS `sys_notice` (
  `notice_id` int(4) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(500) NOT NULL COMMENT '公告标题',
  `notice_type` char(2) NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longtext NOT NULL COMMENT '公告内容',
  `status` char(1) DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`notice_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='通知公告表';

-- 正在导出表  sibo-gxy-2.sys_notice 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_oper_log 结构
CREATE TABLE IF NOT EXISTS `sys_oper_log` (
  `oper_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `operator_type` int(1) DEFAULT '0' COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(30) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(255) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- 正在导出表  sibo-gxy-2.sys_oper_log 的数据：~44 rows (大约)
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` (`oper_id`, `title`, `business_type`, `method`, `operator_type`, `oper_name`, `dept_name`, `oper_url`, `oper_ip`, `oper_location`, `oper_param`, `status`, `error_msg`, `oper_time`) VALUES
	(1, '操作日志', 9, 'com.sibo.project.monitor.operlog.controller.OperlogController.clean()', 1, 'admin', '研发部门', '/monitor/operlog/clean', '127.0.0.1', '内网IP', '{}', 0, NULL, '2018-12-14 14:50:37'),
	(2, '回复', 1, 'com.sibo.project.yl.ask.controller.AskController.reply()', 1, 'admin', '研发部门', '/yl/ask/reply', '127.0.0.1', '内网IP', '{"htmlContext":[""],"askId":["1"]}', 0, NULL, '2018-12-15 11:17:46'),
	(3, '重置密码', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.resetPwd()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/resetPwd', '127.0.0.1', '内网IP', '{"userId":["37"],"mobilePhone":["15000000009"],"password":["88888888"]}', 0, NULL, '2018-12-15 15:19:38'),
	(4, '重置密码', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.resetPwd()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/resetPwd', '127.0.0.1', '内网IP', '{"userId":["37"],"mobilePhone":["15000000009"],"password":["22222222222"]}', 0, NULL, '2018-12-15 15:22:07'),
	(5, '重置密码', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.resetPwd()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/resetPwd', '127.0.0.1', '内网IP', '{"id":["37"],"mobilePhone":["15000000009"],"password":["88888888"]}', 0, NULL, '2018-12-15 15:30:44'),
	(6, '重置密码', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.resetPwd()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/resetPwd', '127.0.0.1', '内网IP', '{"id":["37"],"mobilePhone":["15000000009"],"password":["88888888"]}', 0, NULL, '2018-12-15 15:31:17'),
	(7, '重置密码', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.resetPwd()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/resetPwd', '127.0.0.1', '内网IP', '{"id":["37"],"mobileNo":["15000000009"],"password":["88888888"]}', 0, NULL, '2018-12-15 15:37:45'),
	(8, '文章', 2, 'com.sibo.project.yl.article.controller.ArticleController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/edit', '127.0.0.1', '内网IP', '{"id":["8"],"title":["高血压分类"],"summary":[""],"tag":["高血压"],"typeKey":["健康小常识"],"htmlContext":["<div class=\\"para\\" label-module=\\"para\\" style=\\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; lin', 0, NULL, '2018-12-16 16:32:37'),
	(9, '文章', 1, 'com.sibo.project.yl.article.controller.ArticleController.addSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/add', '192.168.3.135', '内网IP', '{"title":["每顿一大把 我该如何吃"],"summary":["受访专家：中山大学孙逸仙纪念医院增城院区药剂科主任刘春霞"],"tag":["药品"],"typeKey":["健康资讯"],"htmlContext":["<p style=\\"margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica;', 0, NULL, '2018-12-16 17:18:18'),
	(10, '文章', 3, 'com.sibo.project.yl.article.controller.ArticleController.remove()', 1, 'sibo-chenzz', '办公室', '/yl/article/remove', '192.168.3.135', '内网IP', '{"ids":["9"]}', 0, NULL, '2018-12-16 17:18:23'),
	(11, '文章', 3, 'com.sibo.project.yl.article.controller.ArticleController.remove()', 1, 'sibo-chenzz', '办公室', '/yl/article/remove', '192.168.3.135', '内网IP', '{"ids":["8"]}', 0, NULL, '2018-12-16 17:18:26'),
	(12, '文章', 2, 'com.sibo.project.yl.article.controller.ArticleController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/edit', '192.168.3.135', '内网IP', '{"id":["10"],"title":["每顿一大把 我该如何吃"],"summary":["受访专家：中山大学孙逸仙纪念医院增城院区药剂科主任刘春霞"],"tag":["药品"],"typeKey":["健康资讯"],"htmlContext":["<p style=\\"margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;', 0, NULL, '2018-12-16 17:20:06'),
	(13, '文章', 2, 'com.sibo.project.yl.article.controller.ArticleController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/edit', '192.168.3.135', '内网IP', '{"id":["10"],"title":["每顿一大把 我该如何吃"],"summary":["受访专家：中山大学孙逸仙纪念医院增城院区药剂科主任刘春霞"],"tag":["药品"],"typeKey":["健康资讯"],"htmlContext":["<p style=\\"text-align: center; margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;M', 0, NULL, '2018-12-16 17:20:42'),
	(14, '文章', 2, 'com.sibo.project.yl.article.controller.ArticleController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/edit', '192.168.3.135', '内网IP', '{"id":["10"],"title":["每顿一大把 我该如何吃"],"summary":["受访专家：中山大学孙逸仙纪念医院增城院区药剂科主任刘春霞"],"tag":["药品"],"typeKey":["健康资讯"],"htmlContext":["<p style=\\"text-align: center; margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;M', 0, NULL, '2018-12-16 17:21:47'),
	(15, '文章', 1, 'com.sibo.project.yl.article.controller.ArticleController.addSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/add', '127.0.0.1', '内网IP', '{"title":["eeeeeeeeeeeeeeee"],"typeKey":["健康资讯"],"htmlContext":["<p>sssssssssssss</p>"]}', 0, NULL, '2018-12-16 17:26:28'),
	(16, '文章', 3, 'com.sibo.project.yl.article.controller.ArticleController.remove()', 1, 'sibo-chenzz', '办公室', '/yl/article/remove', '127.0.0.1', '内网IP', '{"ids":["11"]}', 0, NULL, '2018-12-16 17:26:34'),
	(17, '文章', 2, 'com.sibo.project.yl.article.controller.ArticleController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/edit', '192.168.3.135', '内网IP', '{"id":["10"],"title":["每顿一大把 我该如何吃"],"typeKey":["健康资讯"],"htmlContext":["<p style=\\"text-align: center; margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;\\"><br>', 0, NULL, '2018-12-16 17:32:20'),
	(18, '文章', 2, 'com.sibo.project.yl.article.controller.ArticleController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/edit', '192.168.3.135', '内网IP', '{"id":["10"],"title":["每顿一大把 我该如何吃"],"typeKey":["健康资讯"],"htmlContext":["<p style=\\"text-align: left; margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;\\"><br></', 0, NULL, '2018-12-16 17:33:03'),
	(19, '文章', 2, 'com.sibo.project.yl.article.controller.ArticleController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/edit', '192.168.3.135', '内网IP', '{"id":["10"],"title":["每顿一大把 我该如何吃"],"typeKey":["健康资讯"],"htmlContext":["<p style=\\"text-align: center; margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;\\"><br>', 0, NULL, '2018-12-16 17:33:51'),
	(20, '文章', 2, 'com.sibo.project.yl.article.controller.ArticleController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/article/edit', '192.168.3.135', '内网IP', '{"id":["10"],"title":["每顿一大把 我该如何吃"],"typeKey":["健康资讯"],"htmlContext":["<p style=\\"text-align: left; margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;\\"><img s', 0, NULL, '2018-12-16 17:34:19'),
	(21, '用户(相当于患者),针对前台app类用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["35"],"email":[""],"sex":["0"],"realname":["李世民"],"address":["广东省深圳市龙华区"],"highStandard":["121"],"lowStandard":["81"],"highHighValue":["140"],"lowHighValue":["91"],"highLowValue":["118"],"lowLowValue":["79"],"heartStandard":["85"],"height":["170"],', 0, NULL, '2018-12-20 11:33:30'),
	(22, '用户(相当于患者),针对前台app类用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["35"],"email":[""],"sex":["0"],"realname":["李世民"],"address":["广东省深圳市龙华区"],"highStandard":["122"],"lowStandard":["81"],"highHighValue":["140"],"lowHighValue":["91"],"highLowValue":["118"],"lowLowValue":["79"],"heartStandard":["85"],"height":["170"],', 0, NULL, '2018-12-20 11:42:28'),
	(23, '用户(相当于患者),针对前台app类用户', 1, 'com.sibo.project.yl.patientUser.controller.PatientUserController.addSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/add', '127.0.0.1', '内网IP', '{"mobilePhone":["16620846646"],"password":["88888888"],"realname":["张某某"],"address":["南昌"],"highStandard":["121"],"lowStandard":["80"],"highHighValue":["140"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height', 0, NULL, '2018-12-20 11:44:02'),
	(24, '病人用户', 1, 'com.sibo.project.yl.patientUser.controller.PatientUserController.addSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/add', '127.0.0.1', '内网IP', '{"mobilePhone":["16620846647"],"password":["88888888"],"realname":["张某某"],"address":["南昌"],"highStandard":["125"],"lowStandard":["88"],"highHighValue":["140"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height', 0, NULL, '2018-12-20 12:09:37'),
	(25, '病人用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["39"],"email":[""],"sex":["0"],"realname":["张某某"],"address":["南昌"],"highStandard":["125"],"lowStandard":["88"],"highHighValue":["145"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height":[""],"weight":[', 0, NULL, '2018-12-20 12:09:47'),
	(26, '回复', 1, 'com.sibo.project.yl.ask.controller.AskController.reply()', 1, 'ys7', '医疗卫生部', '/yl/ask/reply', '127.0.0.1', '内网IP', '{"htmlContext":[""],"askId":["18"]}', 0, NULL, '2018-12-27 17:48:57'),
	(27, '回复', 1, 'com.sibo.project.yl.ask.controller.AskController.reply()', 1, 'ys7', '医疗卫生部', '/yl/ask/reply', '127.0.0.1', '内网IP', '{"htmlContext":[""],"askId":["18"]}', 0, NULL, '2018-12-27 17:49:01'),
	(28, '字典类型', 1, 'com.sibo.project.system.dict.controller.DictTypeController.addSave()', 1, 'sibo-chenzz', '办公室', '/system/dict/add', '127.0.0.1', '内网IP', '{"dictName":["报警触发_高压"],"dictType":["SOS_hight"],"status":["0"],"remark":[""]}', 0, NULL, '2018-12-27 19:43:02'),
	(29, '字典类型', 2, 'com.sibo.project.system.dict.controller.DictTypeController.editSave()', 1, 'sibo-chenzz', '办公室', '/system/dict/edit', '127.0.0.1', '内网IP', '{"dictId":["13"],"dictName":["报警触发"],"dictType":["SOS_trigger"],"status":["0"],"remark":["报警触发"]}', 0, NULL, '2018-12-27 19:44:18'),
	(30, '字典类型', 1, 'com.sibo.project.system.dict.controller.DictTypeController.addSave()', 1, 'sibo-chenzz', '办公室', '/system/dict/add', '127.0.0.1', '内网IP', '{"dictName":["患者严重程度等级"],"dictType":["illness_grade"],"status":["0"],"remark":[""]}', 0, NULL, '2018-12-28 12:35:58'),
	(31, '字典数据', 1, 'com.sibo.project.system.dict.controller.DictDataController.addSave()', 1, 'sibo-chenzz', '办公室', '/system/dict/data/add', '127.0.0.1', '内网IP', '{"dictLabel":["初期"],"dictValue":["1"],"dictType":["illness_grade"],"cssClass":[""],"dictSort":["1"],"listClass":[""],"isDefault":["Y"],"status":["0"],"remark":[""]}', 0, NULL, '2018-12-28 12:39:59'),
	(32, '字典数据', 1, 'com.sibo.project.system.dict.controller.DictDataController.addSave()', 1, 'sibo-chenzz', '办公室', '/system/dict/data/add', '127.0.0.1', '内网IP', '{"dictLabel":["中期"],"dictValue":["2"],"dictType":["illness_grade"],"cssClass":[""],"dictSort":["2"],"listClass":[""],"isDefault":["Y"],"status":["0"],"remark":[""]}', 0, NULL, '2018-12-28 12:40:16'),
	(33, '字典数据', 1, 'com.sibo.project.system.dict.controller.DictDataController.addSave()', 1, 'sibo-chenzz', '办公室', '/system/dict/data/add', '127.0.0.1', '内网IP', '{"dictLabel":["高危"],"dictValue":["3"],"dictType":["illness_grade"],"cssClass":[""],"dictSort":["3"],"listClass":[""],"isDefault":["Y"],"status":["0"],"remark":[""]}', 0, NULL, '2018-12-28 12:40:46'),
	(34, '回复', 1, 'com.sibo.project.yl.ask.controller.AskController.reply()', 1, 'ys7', '医疗卫生部', '/yl/ask/reply', '127.0.0.1', '内网IP', '{"htmlContext":[""],"askId":["18"]}', 0, NULL, '2018-12-28 16:00:45'),
	(35, '发建议', 1, 'com.sibo.project.yl.patientUser.controller.PatientUserController.jpushSendAdviseToAppUser()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/jpushSendAdviseToAppUser', '127.0.0.1', '内网IP', '{"toUserid":["10"],"content":["多休息，尽量避免剧烈运动"]}', 0, NULL, '2018-12-28 17:25:54'),
	(36, '回复', 1, 'com.sibo.project.yl.ask.controller.AskController.reply()', 1, 'ys7', '医疗卫生部', '/yl/ask/reply', '127.0.0.1', '内网IP', '{"htmlContext":["请问,什么事?"],"askId":["19"]}', 0, NULL, '2018-12-28 17:32:21'),
	(37, '回复', 1, 'com.sibo.project.yl.ask.controller.AskController.reply()', 1, 'ys7', '医疗卫生部', '/yl/ask/reply', '127.0.0.1', '内网IP', '{"htmlContext":[""],"askId":["19"]}', 0, NULL, '2018-12-28 18:43:00'),
	(38, '病人用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["25"],"email":[""],"sex":["1"],"realname":["赖女士"],"address":["深圳市龙岗区天安数码城"],"highStandard":["120"],"lowStandard":["80"],"highHighValue":["140"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height":["178"', 0, NULL, '2019-01-03 14:34:18'),
	(39, '病人用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["25"],"email":[""],"sex":["1"],"realname":["赖女士"],"address":["深圳市龙岗区天安数码城"],"highStandard":["120"],"lowStandard":["80"],"highHighValue":["140"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height":["178"', 0, NULL, '2019-01-03 14:34:38'),
	(40, '病人用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'sibo-chenzz', '办公室', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["25"],"email":[""],"sex":["1"],"realname":["赖女士"],"address":["深圳市龙岗区天安数码城"],"highStandard":["120"],"lowStandard":["80"],"highHighValue":["140"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height":["178"', 0, NULL, '2019-01-03 14:40:19'),
	(41, '病人用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["10"],"email":[""],"sex":["0"],"realname":["林先生"],"address":["深圳市龙岗区大运"],"highStandard":["120"],"lowStandard":["80"],"highHighValue":["140"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height":["166"],"', 0, NULL, '2019-01-03 15:27:51'),
	(42, '病人用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["39"],"email":[""],"sex":["0"],"realname":["张某某"],"address":["南昌"],"highStandard":["125"],"lowStandard":["88"],"highHighValue":["145"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height":[""],"weight":[', 0, NULL, '2019-01-03 15:33:44'),
	(43, '病人用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["35"],"email":[""],"sex":["0"],"realname":["李世民"],"address":["广东省深圳市龙华区"],"highStandard":["122"],"lowStandard":["81"],"highHighValue":["140"],"lowHighValue":["91"],"highLowValue":["118"],"lowLowValue":["79"],"heartStandard":["85"],"height":["170"],', 0, NULL, '2019-01-03 16:28:21'),
	(44, '病人用户', 2, 'com.sibo.project.yl.patientUser.controller.PatientUserController.editSave()', 1, 'ys7', '医疗卫生部', '/yl/patientUser/edit', '127.0.0.1', '内网IP', '{"id":["38"],"email":[""],"sex":["0"],"realname":["张某某"],"address":["南昌"],"highStandard":["121"],"lowStandard":["80"],"highHighValue":["140"],"lowHighValue":["90"],"highLowValue":["119"],"lowLowValue":["79"],"heartStandard":["80"],"height":[""],"weight":[', 0, NULL, '2019-01-03 16:32:41');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_post 结构
CREATE TABLE IF NOT EXISTS `sys_post` (
  `post_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) NOT NULL COMMENT '岗位名称',
  `post_sort` int(4) NOT NULL COMMENT '显示顺序',
  `status` char(1) NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`post_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='岗位信息表';

-- 正在导出表  sibo-gxy-2.sys_post 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` (`post_id`, `post_code`, `post_name`, `post_sort`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 'administrator', '管理员', 1, '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:41:55', ''),
	(2, 'president', '院长', 2, '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:42:09', ''),
	(3, 'chairman', '主任', 3, '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:42:55', ''),
	(4, 'user', '普通办公人员', 4, '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-31 11:43:25', '');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_role 结构
CREATE TABLE IF NOT EXISTS `sys_role` (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(4) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限）',
  `status` char(1) NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- 正在导出表  sibo-gxy-2.sys_role 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-19 20:35:00', '管理员'),
	(2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'sibo-chenzz', '2018-10-27 15:19:11', '普通角色'),
	(3, '医院管理员', 'hospital-admin', 3, '2', '0', '0', 'sibo-chenzz', '2018-10-23 17:07:20', 'sibo-chenzz', '2018-12-07 16:39:32', ''),
	(4, '医院医生', 'doctor', 4, '1', '0', '0', 'sibo-chenzz', '2018-10-23 17:08:45', 'sibo-chenzz', '2018-12-06 19:03:18', ''),
	(5, '项目监测功能组', 'project-monitor', 5, '1', '0', '0', 'sibo-chenzz', '2018-10-23 17:12:17', 'sibo-chenzz', '2018-12-07 16:42:38', '');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_role_dept 结构
CREATE TABLE IF NOT EXISTS `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';

-- 正在导出表  sibo-gxy-2.sys_role_dept 的数据：~6 rows (大约)
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` (`role_id`, `dept_id`) VALUES
	(2, 100),
	(2, 101),
	(2, 105),
	(3, 100),
	(3, 102),
	(3, 109);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_role_menu 结构
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- 正在导出表  sibo-gxy-2.sys_role_menu 的数据：~133 rows (大约)
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(2, 1),
	(2, 2),
	(2, 105),
	(2, 106),
	(2, 107),
	(2, 109),
	(2, 111),
	(2, 500),
	(2, 501),
	(2, 1024),
	(2, 1028),
	(2, 1029),
	(2, 1030),
	(2, 1031),
	(2, 1032),
	(2, 1033),
	(2, 1034),
	(2, 1035),
	(2, 1036),
	(2, 1037),
	(2, 1038),
	(2, 1040),
	(2, 1041),
	(2, 1042),
	(2, 1044),
	(2, 1045),
	(2, 2000),
	(2, 2001),
	(2, 2004),
	(2, 2012),
	(2, 2013),
	(2, 2014),
	(2, 2015),
	(2, 2016),
	(2, 2017),
	(2, 2018),
	(2, 2019),
	(2, 2020),
	(2, 2021),
	(2, 2022),
	(2, 2023),
	(2, 2024),
	(2, 2025),
	(2, 2026),
	(2, 2027),
	(2, 2028),
	(2, 2029),
	(2, 2030),
	(2, 2031),
	(2, 2032),
	(2, 2033),
	(2, 2034),
	(2, 2035),
	(2, 2036),
	(2, 2037),
	(2, 2038),
	(2, 2039),
	(2, 2040),
	(2, 2041),
	(2, 2042),
	(2, 2043),
	(2, 2044),
	(2, 2045),
	(2, 2046),
	(3, 2000),
	(3, 2001),
	(3, 2012),
	(3, 2013),
	(3, 2027),
	(3, 2028),
	(3, 2029),
	(3, 2030),
	(3, 2077),
	(4, 2000),
	(4, 2001),
	(4, 2004),
	(4, 2012),
	(4, 2013),
	(4, 2014),
	(4, 2015),
	(4, 2032),
	(4, 2033),
	(4, 2034),
	(4, 2035),
	(4, 2037),
	(4, 2038),
	(4, 2039),
	(4, 2040),
	(4, 2041),
	(4, 2042),
	(4, 2043),
	(4, 2044),
	(4, 2045),
	(4, 2046),
	(4, 2072),
	(4, 2073),
	(4, 2074),
	(4, 2075),
	(4, 2076),
	(5, 1),
	(5, 103),
	(5, 500),
	(5, 501),
	(5, 1015),
	(5, 1038),
	(5, 1040),
	(5, 1041),
	(5, 1042),
	(5, 1044),
	(5, 2000),
	(5, 2001),
	(5, 2004),
	(5, 2012),
	(5, 2013),
	(5, 2017),
	(5, 2018),
	(5, 2019),
	(5, 2020),
	(5, 2021),
	(5, 2022),
	(5, 2023),
	(5, 2027),
	(5, 2028),
	(5, 2032),
	(5, 2033),
	(5, 2042),
	(5, 2043),
	(5, 2057),
	(5, 2058),
	(5, 2072),
	(5, 2073),
	(5, 2078),
	(5, 2079);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` int(11) DEFAULT NULL COMMENT '部门ID',
  `login_name` varchar(30) NOT NULL COMMENT '登录账号',
  `user_name` varchar(30) NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) DEFAULT '' COMMENT '手机号码',
  `sex` char(1) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `status` char(1) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(20) DEFAULT '' COMMENT '最后登陆IP',
  `login_date` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- 正在导出表  sibo-gxy-2.sys_user 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`user_id`, `dept_id`, `login_name`, `user_name`, `user_type`, `email`, `phonenumber`, `sex`, `avatar`, `password`, `salt`, `status`, `del_flag`, `login_ip`, `login_date`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 103, 'sibo-chenzz', 'SIBO', '00', '116211148@qq.com', '13888888888', '0', '0a46930e695175d049ec64820be54982.jpg', '2d6215056301788ba3b0c7cc02217b20', '3bc391', '0', '0', '127.0.0.1', '2019-01-03 16:22:05', 'admin', '2018-09-10 11:33:00', 'sb', '2019-01-03 16:22:06', '管理员'),
	(2, 105, 'admin', 'SIBO', '00', 'cs.chenzz@qq.com', '15170707553', '1', '', '3f794667b83a0eb0d839b06c778036cb', '7a1eb0', '0', '0', '127.0.0.1', '2018-10-31 19:47:16', 'admin', '2018-03-16 11:33:00', 'sb', '2018-10-31 19:47:16', '测试员'),
	(3, 107, 'sibo5', '监测用户', '00', 'aaaaa@qq.com', '13800138000', '0', '', 'bc34ab2ceb40cc55a57d102519992f6f', '1ccb08', '0', '0', '127.0.0.1', '2018-10-23 17:14:39', 'sibo-chenzz', '2018-10-23 17:14:27', '', '2018-10-23 17:14:43', ''),
	(4, 108, 'sibo3', '医院管理员', '00', 'aaa@qq.com', '13800138001', '0', '', 'bdf3dfe318b9cb3579d5c1e89f12c341', '8141c2', '0', '0', '127.0.0.1', '2018-12-06 15:20:35', 'sibo-chenzz', '2018-10-23 17:51:26', '', '2018-12-06 15:20:37', ''),
	(5, 108, 'sibo555', '医院管理员', '00', 'cs.chenzz@qq.com', '13800138000', '0', '', 'aebdd058450accfffc556ac8ab4f4589', '1eaa5e', '0', '0', '127.0.0.1', '2018-12-09 16:22:58', 'admin', '2018-10-26 11:45:38', '', '2018-12-09 16:23:00', ''),
	(6, 100, 'sibo444', '医院管理员', '00', 'cs.chenzzz@qq.com', '13800138002', '0', '', '8378d2d8f10cf6d8f0e4d829c2a53edc', 'bfc1bc', '0', '0', '127.0.0.1', '2018-12-03 11:57:59', 'admin', '2018-10-26 11:59:23', '', '2018-12-03 11:57:58', '医院管理员,sibo444'),
	(7, 100, 'ys5', '医院医生', '00', 'aaaa@qq.com', '13800138005', '0', '', 'b586d285be0419c5afb8d00a750e883f', 'b4f21c', '0', '0', '192.168.3.135', '2018-12-17 12:13:36', 'admin', '2018-10-26 14:56:33', 'sibo-chenzz', '2018-12-17 12:13:40', '医院医生,ys5'),
	(10, 100, 'doctor', '医院医生', '00', '691484729', '12', '0', '', 'c08de400e48d02c92cafde74345cd82d', '666e73', '0', '0', '127.0.0.1', '2018-12-06 16:12:23', 'sibo-chenzz', '2018-11-01 12:03:06', '', '2018-12-06 16:12:23', '医院医生,doctor'),
	(11, 100, 'yy5', '医院管理员', '00', 'yiming.tim@qq.com', '13888888880', '0', '', 'bcb2328b39a19da73e462af99b33b5f7', '123e5a', '0', '0', '127.0.0.1', '2019-01-04 14:38:54', 'sibo-chenzz', '2018-12-08 15:34:00', '', '2019-01-04 14:38:52', '医院管理员,yy5'),
	(12, 100, 'ys6', '医院医生', '00', 'aaaaaa@qq.com', '13800000000', '0', '', 'f398e95c807fc4b0bc1eeb75685e5acb', '101a2e', '0', '0', '192.168.3.135', '2018-12-11 14:45:09', 'yy5', '2018-12-11 14:29:36', '', '2018-12-11 14:45:12', '医院医生,ys6'),
	(13, 100, 'ys7', '医院医生', '00', 'ssssss@qq.com', '13466666666', '0', '', '2256a6a15cc0dc08736fd7b79df99dbb', '51ddc3', '0', '0', '127.0.0.1', '2019-01-03 16:28:00', 'yy5', '2018-12-11 14:36:33', '', '2019-01-03 16:28:01', '医院医生,ys7');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_user_online 结构
CREATE TABLE IF NOT EXISTS `sys_user_online` (
  `sessionId` varchar(50) NOT NULL DEFAULT '' COMMENT '用户会话id',
  `login_name` varchar(50) DEFAULT '' COMMENT '登录账号',
  `dept_name` varchar(50) DEFAULT '' COMMENT '部门名称',
  `ipaddr` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) DEFAULT '' COMMENT '操作系统',
  `status` varchar(10) DEFAULT '' COMMENT '在线状态on_line在线off_line离线',
  `start_timestamp` datetime DEFAULT NULL COMMENT 'session创建时间',
  `last_access_time` datetime DEFAULT NULL COMMENT 'session最后访问时间',
  `expire_time` int(5) DEFAULT '0' COMMENT '超时时间，单位为分钟',
  PRIMARY KEY (`sessionId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='在线用户记录';

-- 正在导出表  sibo-gxy-2.sys_user_online 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` (`sessionId`, `login_name`, `dept_name`, `ipaddr`, `login_location`, `browser`, `os`, `status`, `start_timestamp`, `last_access_time`, `expire_time`) VALUES
	('3ea98793-a43f-4a83-a3b9-cf9cf181b27c', 'yy5', '医疗卫生部', '127.0.0.1', '内网IP', 'Chrome', 'Windows 10', 'on_line', '2019-01-04 14:38:40', '2019-01-04 14:49:51', 18000000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_user_post 结构
CREATE TABLE IF NOT EXISTS `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';

-- 正在导出表  sibo-gxy-2.sys_user_post 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` (`user_id`, `post_id`) VALUES
	(1, 1),
	(2, 2),
	(3, 4),
	(4, 4),
	(5, 4),
	(6, 4),
	(8, 4),
	(10, 4),
	(11, 4),
	(12, 4),
	(13, 4);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- 正在导出表  sibo-gxy-2.sys_user_role 的数据：~8 rows (大约)
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2),
	(3, 5),
	(4, 3),
	(5, 3),
	(6, 3),
	(7, 4),
	(8, 4),
	(10, 4),
	(11, 3),
	(12, 4),
	(13, 4);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_appuser_registerid 结构
CREATE TABLE IF NOT EXISTS `tb_appuser_registerid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `mobileno` varchar(100) DEFAULT '' COMMENT '手机号码',
  `regid` varchar(100) DEFAULT '' COMMENT '推送设备id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='app用户id推送设备id表';

-- 正在导出表  sibo-gxy-2.tb_appuser_registerid 的数据：~18 rows (大约)
/*!40000 ALTER TABLE `tb_appuser_registerid` DISABLE KEYS */;
INSERT INTO `tb_appuser_registerid` (`id`, `userid`, `mobileno`, `regid`, `create_time`, `update_time`, `remark`) VALUES
	(1, 25, '', '120c83f7600d3f8f7ca', '2018-11-27 19:34:16', '2018-12-13 16:47:02', ''),
	(2, 11, '', '120c83f7600d3f8f7ca', '2018-11-29 15:28:43', '2018-12-12 12:10:03', ''),
	(3, 11, '', '', '2018-12-03 09:55:50', NULL, ''),
	(4, 11, '', '120c83f7600d203eaf0', '2018-12-03 09:55:57', '2018-12-05 10:04:58', ''),
	(5, 45, '', '120c83f7600d3f8f7ca', '2018-12-05 09:51:06', '2018-12-05 09:51:14', ''),
	(6, 25, '', '120c83f7600d203eaf0', '2018-12-09 16:47:59', '2018-12-16 16:17:55', ''),
	(7, 28, '', '120c83f7600d203eaf0', '2018-12-11 16:34:46', '2018-12-11 16:36:03', ''),
	(8, 35, '', '120c83f7600d3f8f7ca', '2018-12-11 16:35:25', '2018-12-13 12:03:14', ''),
	(9, 27, '', '120c83f7600d203eaf0', '2018-12-11 16:52:37', '2018-12-12 10:27:22', ''),
	(10, 34, '', '120c83f7600d203eaf0', '2018-12-11 16:54:54', NULL, ''),
	(11, 37, '', '120c83f7600d203eaf0', '2018-12-11 17:01:20', '2018-12-12 15:28:03', ''),
	(12, 1000000, '', '13065ffa4e516eee2a6', '2018-12-14 11:16:18', NULL, ''),
	(13, 35, '', '13065ffa4e516eee2a6', '2018-12-14 11:50:57', '2018-12-14 11:55:32', ''),
	(14, 35, '', '120c83f7607e62f24cc', '2018-12-14 18:10:57', '2018-12-15 11:53:36', ''),
	(15, 1000000, '', '120c83f7600d203eaf0', '2018-12-16 16:25:03', '2018-12-16 17:43:54', ''),
	(16, 1000000, '', '1104a89792f0d6d66f2', '2018-12-19 10:47:33', '2018-12-21 10:48:47', ''),
	(17, 1000001, '', '1104a89792f0d6d66f2', '2018-12-19 15:29:57', '2018-12-19 17:07:53', ''),
	(18, 35, '', '1104a89792f0d6d66f2', '2018-12-19 16:28:51', '2018-12-20 19:43:41', ''),
	(19, 1000003, '', '1104a89792f0d6d66f2', '2018-12-19 17:23:58', '2018-12-19 17:25:11', ''),
	(20, 25, '', '1104a89792f0d6d66f2', '2018-12-28 16:18:52', NULL, ''),
	(21, 10, '', '1104a89792f0d6d66f2', '2018-12-28 16:23:10', '2019-01-03 14:29:22', '');
/*!40000 ALTER TABLE `tb_appuser_registerid` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_article 结构
CREATE TABLE IF NOT EXISTS `tb_article` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(450) NOT NULL COMMENT '标题',
  `summary` varchar(1000) DEFAULT NULL COMMENT '摘要',
  `html_context` longtext COMMENT '文章内容',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `tag` varchar(450) DEFAULT NULL COMMENT '标签',
  `add_user_id` int(11) DEFAULT NULL COMMENT '添加用户id',
  `update_user_id` int(11) DEFAULT NULL COMMENT '修改用户id',
  `type_key` varchar(80) DEFAULT NULL COMMENT '类别关键字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';

-- 正在导出表  sibo-gxy-2.tb_article 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `tb_article` DISABLE KEYS */;
INSERT INTO `tb_article` (`id`, `title`, `summary`, `html_context`, `create_time`, `update_time`, `tag`, `add_user_id`, `update_user_id`, `type_key`) VALUES
	(10, '每顿一大把 我该如何吃', '受访专家：中山大学孙逸仙纪念医院增城院区药剂科主任刘春霞', '<p style="text-align: left; margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;"><img src="data:image/jpeg;base64,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Ym9vbAAAAAAAQmNrZ09iamMAAAABAAAAAAAAUkdCQwAAAAMAAAAAUmQgIGRvdWJAb+AAAAAAAAAAAABHcm4gZG91YkBv4AAAAAAAAAAAAEJsICBkb3ViQG/gAAAAAAAAAAAAQnJkVFVudEYjUmx0AAAAAAAAAAAAAAAAQmxkIFVudEYjUmx0AAAAAAAAAAAAAAAAUnNsdFVudEYjUHhsQFIAAAAAAAAAAAAKdmVjdG9yRGF0YWJvb2wBAAAAAFBnUHNlbnVtAAAAAFBnUHMAAAAAUGdQQwAAAABMZWZ0VW50RiNSbHQAAAAAAAAAAAAAAABUb3AgVW50RiNSbHQAAAAAAAAAAAAAAABTY2wgVW50RiNQcmNAWQAAAAAAADhCSU0D7QAAAAAAEABIAAAAAQACAEgAAAABAAI4QklNBCYAAAAAAA4AAAAAAAAAAAAAP4AAADhCSU0EDQAAAAAABAAAAHg4QklNBBkAAAAAAAQAAAAeOEJJTQPzAAAAAAAJAAAAAAAAAAABADhCSU0nEAAAAAAACgABAAAAAAAAAAI4QklNA/UAAAAAAEgAL2ZmAAEAbGZmAAYAAAAAAAEAL2ZmAAEAoZmaAAYAAAAAAAEAMgAAAAEAWgAAAAYAAAAAAAEANQAAAAEALQAAAAYAAAAAAAE4QklNA/gAAAAAAHAAAP////////////////////////////8D6AAAAAD/////////////////////////////A+gAAAAA/////////////////////////////wPoAAAAAP////////////////////////////8D6AAAOEJJTQQAAAAAAAACAAU4QklNBAIAAAAAAAwAAAAAAAAAAAAAAAA4QklNBDAAAAAAAAYBAQEBAQE4QklNBC0AAAAAAAYAAQAAAAY4QklNBAgAAAAAABAAAAABAAACQAAAAkAAAAAAOEJJTQQeAAAAAAAEAAAAADhCSU0EGgAAAAADPwAAAAYAAAAAAAAAAAAAASwAAAGQAAAABWcqaAeYmAAtADEAAAABAAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAZAAAAEsAAAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAEAAAAAEAAAAAAABudWxsAAAAAgAAAAZib3VuZHNPYmpjAAAA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PSIyMDE4LTEyLTE0VDEwOjQ3KzA4OjAwIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOkJGMzg5RjI1NDdGRkU4MTFBQzUwRTg0MTdFNUNDNjE0IiB4bXBNTTpEb2N1bWVudElEPSJ4bXAuZGlkOkJFMzg5RjI1NDdGRkU4MTFBQzUwRTg0MTdFNUNDNjE0IiB4bXBNTTpPcmlnaW5hbERvY3VtZW50SUQ9InhtcC5kaWQ6QkUzODlGMjU0N0ZGRTgxMUFDNTBFODQxN0U1Q0M2MTQiIGRjOmZvcm1hdD0iaW1hZ2UvanBlZyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyI+IDx4bXBNTTpIaXN0b3J5PiA8cmRmOlNlcT4gPHJkZjpsaSBzdEV2dDphY3Rpb249ImNyZWF0ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6QkUzODlGMjU0N0ZGRTgxMUFDNTBFODQxN0U1Q0M2MTQiIHN0RXZ0OndoZW49IjIwMTgtMTItMTRUMTA6NDcrMDg6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDUzUgV2luZG93cyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6QkYzODlGMjU0N0ZGRTgxMUFDNTBFODQxN0U1Q0M2MTQiIHN0RXZ0OndoZW49IjIwMTgtMTItMTRUMTA6NDcrMDg6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDUzUgV2luZG93cyIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8L3JkZjpTZXE+IDwveG1wTU06SGlzdG9yeT4gPC9yZGY6RGVzY3JpcHRpb24+IDwvcmRmOlJERj4gPC94OnhtcG1ldGE+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg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" style="width: 270.688px; height: 203.016px;"><br></p><p style="margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;">前不久,有位老人来药师门诊就诊:“医生给我开了各种药,每顿都要吃一大把,我是该一起吞下去,还是要分着吃?真弄不明白。”这种情况,在有多种合并症的老人身上很常见。不少老年人存在一人多病的情况,比如<a href="http://zzk.fh21.com.cn/symptom/detail/10741.html" target="_blank" style="color: rgb(77, 157, 245);">糖尿</a>病合并有高血压病、心脑血管病等,因此,每天都要吃很多种药,服用五种以上药品的情况十分常见,最多的甚至高达十几种。对于这种情形,我给出的建议是以下4点。</p><p style="margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;"><strong>1.阅读药品的说明书。</strong>吃药前,要了解每一种药品的用法用量,比如一天吃几次,一次应该吃几片,是饭前吃还是应该饭后吃等,同时还要关注药品的禁忌、不良反应以及注意事项等。只有充分了解药品,才能更好的服用药品。</p><p style="margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;"><strong>2.正确理解医生的专业术语。</strong>医生在开药时,常会在处方上标注一些专业术语,正确理解这些词汇很重要,比如服用方法上就包括:顿服(将一天的用药量一次服下)、空腹(清晨,或饭前1小时,或饭后2小时服用)、饭前(进餐前半小时)、饭后(进餐后半小时)、睡前(临睡前半小时或1小时)、必要时服(疾病发作时服)等。</p><p style="margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;"><strong>3.掌握好服药频率。</strong>合适的服药时间对药效的发挥十分重要。吃药的种类越多,越要重视不同药物的间隔时间。一般包括:</p><p style="margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;">每日一次:每日同一时间服用一次,比如每日清晨或晚上;每日二次:早晚各一次,两次服药的相隔约12小时;每日三次:每日早、午、晚各1次,相隔约8小时。比如早上六点服药一次,下午两点再服用一次,晚上十点再服用第三次,这样的间隔时间才是合适的。但降糖药例外,是随一日三餐服药;每日四次:每日相隔约6小时服药一次。</p><p style="margin-bottom: 0px; padding: 0px; text-indent: 2em; color: rgb(51, 51, 51); font-family: &quot;Microsoft Yahei&quot;, Helvetica; font-size: 16px;"><strong>4.中西药适当分开时间。</strong>有些中药所含的成分会影响其他药物的药效发挥,因此,最好将中药和西药分开服用,可以先服西药,再吃中药,一般间隔半小时即可。</p>', '2018-12-16 17:18:16', '2018-12-16 17:34:17', '药品', 1, 1, '健康资讯');
/*!40000 ALTER TABLE `tb_article` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_ask 结构
CREATE TABLE IF NOT EXISTS `tb_ask` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(450) DEFAULT NULL COMMENT '标题',
  `html_context` longtext NOT NULL COMMENT '咨询内容',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `tag` varchar(450) DEFAULT NULL COMMENT '标签',
  `add_user_id` int(11) DEFAULT NULL COMMENT '添加用户id',
  `update_user_id` int(11) DEFAULT NULL COMMENT '修改用户id',
  `type_key` varchar(80) DEFAULT NULL COMMENT '类别关键字',
  `status` tinyint(3) unsigned DEFAULT '0' COMMENT '状态,0初始,1已结单',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='咨询表';

-- 正在导出表  sibo-gxy-2.tb_ask 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `tb_ask` DISABLE KEYS */;
INSERT INTO `tb_ask` (`id`, `title`, `html_context`, `create_time`, `update_time`, `tag`, `add_user_id`, `update_user_id`, `type_key`, `status`) VALUES
	(1, '高血压要注意些什么?', '继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。\r\n    继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。', '2018-10-08 00:00:00', '2018-11-01 16:01:44', NULL, 28, 1, '高血压', 0),
	(2, '继发性高血压 ', '继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。', '2018-11-01 16:03:15', NULL, NULL, 28, NULL, NULL, 0),
	(3, '2.继发性高血压 ', '2继发性高血压 \r\n2继发性高血压 2继发性高血压 ', '2018-11-01 16:12:55', NULL, NULL, 28, NULL, NULL, 0),
	(4, '3继发性高血压 ', '3继发性高血压 \r\n3继发性高血压 \r\n3继发性高血压 ', '2018-11-01 16:13:19', NULL, NULL, 28, NULL, NULL, 0),
	(5, '高血压饮食要注意什么', '嘻嘻嘻,高血压饮食要注意什么', '2018-11-15 14:48:22', '2018-11-15 14:48:43', NULL, 28, 1, NULL, 0),
	(9, NULL, '高血压药注意什么', '2018-12-02 10:25:45', NULL, NULL, 25, NULL, NULL, 0),
	(10, 'title', '咨询医生,高血压药注意什么', '2018-12-02 10:33:08', NULL, NULL, 25, NULL, NULL, 0),
	(11, 'title', '高血压饮食要注意什么?', '2018-12-02 10:45:53', NULL, NULL, 25, NULL, NULL, 0),
	(12, 'title', '你好，陈医生，如何预防高血压', '2018-12-02 13:20:56', NULL, NULL, 25, NULL, NULL, 0),
	(13, 'title', '你好医生', '2018-12-02 15:13:53', NULL, NULL, 25, NULL, NULL, 0),
	(14, 'title', '高血压需要住院治疗吗？', '2018-12-02 15:18:52', NULL, NULL, 25, NULL, NULL, 0),
	(18, NULL, 'hi,dir sun,are you ok?', '2018-12-11 17:14:49', NULL, NULL, 35, NULL, NULL, 0),
	(19, NULL, '你好,孙主任', '2018-12-28 16:42:41', NULL, NULL, 10, NULL, NULL, 1);
/*!40000 ALTER TABLE `tb_ask` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_ask_reply 结构
CREATE TABLE IF NOT EXISTS `tb_ask_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ask_id` bigint(20) DEFAULT NULL COMMENT '咨询记录id',
  `html_context` longtext COMMENT '回复内容',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `reply_user_id` bigint(20) DEFAULT '0' COMMENT '回复的用户id',
  `reply_doctor_id` bigint(20) DEFAULT '0' COMMENT '回复的医生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COMMENT='咨询回复表';

-- 正在导出表  sibo-gxy-2.tb_ask_reply 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `tb_ask_reply` DISABLE KEYS */;
INSERT INTO `tb_ask_reply` (`id`, `ask_id`, `html_context`, `create_time`, `update_time`, `reply_user_id`, `reply_doctor_id`) VALUES
	(1, 2, '住院观察一段时间', '2018-11-02 16:08:51', '2018-11-02 16:24:32', 0, 1),
	(2, 1, 'eeeeeeeeeeeeeee', '2018-11-02 16:09:14', NULL, 0, 1),
	(3, 3, '这里有脑残片一颗', '2018-11-02 16:18:59', NULL, 0, 1),
	(4, 1, '来瓶印度神油', '2018-11-02 16:23:51', NULL, 0, 1),
	(5, 13, '有什么事?', '2018-12-02 15:16:13', NULL, 0, 1),
	(6, 12, '注意饮食,清淡为主', '2018-12-02 15:16:50', NULL, 0, 1),
	(7, 14, '根据病情自行选择是否住院', '2018-12-02 15:19:25', NULL, 0, 1),
	(8, 14, '现在什么情况了', '2018-12-10 17:23:49', NULL, 0, 1),
	(9, 14, '情况有所好转,谢谢?', '2018-12-10 17:24:10', NULL, 25, 0),
	(10, 10, '搞么子', '2018-12-10 17:29:24', NULL, 0, 1),
	(11, 14, '期待早日康复', '2018-12-10 17:58:53', NULL, 0, 1),
	(12, 14, '~_^', '2018-12-10 17:59:24', NULL, 25, 0),
	(13, 5, '少吃辛辣食物,多运动', '2018-12-10 18:10:20', NULL, 0, 1),
	(14, 18, '在,什么事情', '2018-12-11 17:15:15', NULL, 0, 4),
	(15, 19, '请问,什么事?', '2018-12-28 17:32:22', NULL, 0, 4),
	(16, 19, '如何预防高血压?', '2018-12-28 17:33:02', NULL, 10, 0),
	(17, 19, 'yyyyyyy', '2018-12-28 17:41:44', NULL, 10, 0),
	(18, 19, 'hello', '2019-01-02 15:56:11', NULL, 10, 0),
	(19, 19, 'what are you doing?', '2019-01-02 16:00:38', NULL, 10, 0),
	(20, 19, 'hello,how are you?', '2019-01-02 16:04:46', NULL, 10, 0),
	(21, 19, 'xxxxxxxxxx', '2019-01-02 16:09:52', NULL, 10, 0),
	(22, 19, 'eeeeeeeeeeeeeeeeeeeeeeeeeee', '2019-01-02 16:12:00', NULL, 10, 0),
	(23, 19, 'tttttt', '2019-01-02 16:12:06', NULL, 10, 0);
/*!40000 ALTER TABLE `tb_ask_reply` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_device 结构
CREATE TABLE IF NOT EXISTS `tb_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `name` varchar(50) DEFAULT '健康手环' COMMENT '设备名称',
  `barcode` varchar(100) DEFAULT NULL COMMENT '设备条码',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  1：正常使用   2：已注销',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `friend_id` varchar(1000) DEFAULT NULL COMMENT '亲友id,用逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='设备表';

-- 正在导出表  sibo-gxy-2.tb_device 的数据：~14 rows (大约)
/*!40000 ALTER TABLE `tb_device` DISABLE KEYS */;
INSERT INTO `tb_device` (`id`, `name`, `barcode`, `status`, `create_time`, `friend_id`) VALUES
	(34, '赵先生的手环', '8800000010', NULL, NULL, NULL),
	(35, '张先生的手环', '8800000011', NULL, NULL, NULL),
	(36, '秦先生的手环', '8800000012', NULL, NULL, ''),
	(37, '潘小姐的手环', '8800000013', NULL, NULL, ''),
	(38, '健康手环', '8800000014', NULL, NULL, ''),
	(39, '健康手环', '8800000015', NULL, NULL, '40,41,42,43,44,45'),
	(40, '健康手环', '8800000015', NULL, NULL, ''),
	(41, '健康手环', '8800000016', NULL, NULL, ''),
	(42, '健康手环', '8800000017', NULL, NULL, ''),
	(43, '健康手环', '8800000018', NULL, NULL, ''),
	(44, '健康手环', '8800000019', NULL, '2018-12-12 17:47:53', NULL),
	(45, '手环', '8800000020', NULL, '2018-12-13 10:33:27', NULL),
	(46, '手环', '8800000021', NULL, '2018-12-13 10:34:09', NULL),
	(47, '手环', '355583080471127', NULL, '2018-12-13 10:35:44', NULL);
/*!40000 ALTER TABLE `tb_device` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_doctor 结构
CREATE TABLE IF NOT EXISTS `tb_doctor` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sys_user_id` bigint(20) NOT NULL COMMENT '登录用户id',
  `hospital_id` bigint(20) NOT NULL COMMENT '医院id',
  `name` varchar(450) DEFAULT NULL COMMENT '名字',
  `rank` varchar(450) DEFAULT NULL COMMENT '头衔',
  `office` varchar(450) DEFAULT NULL COMMENT '科室',
  `sex` tinyint(1) DEFAULT NULL COMMENT '性别,1为男,2为女,3未知',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `height` int(11) DEFAULT NULL COMMENT '身高(cm)',
  `weight` int(11) DEFAULT NULL COMMENT '体重(kg)',
  `html_context` longtext COMMENT '医生简介',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='医生表';

-- 正在导出表  sibo-gxy-2.tb_doctor 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `tb_doctor` DISABLE KEYS */;
INSERT INTO `tb_doctor` (`id`, `sys_user_id`, `hospital_id`, `name`, `rank`, `office`, `sex`, `birthday`, `height`, `weight`, `html_context`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 7, 7, '陈鹏', '外科主任', '外科', 0, '1977-10-15 00:00:00', 170, 55, NULL, '1', '2018-10-26 14:56:33', '', NULL, ''),
	(2, 10, 8, '赵一曼', '主任', '产科', 1, '1973-12-08 00:00:00', 165, 55, NULL, '1', '2018-11-01 12:03:06', '', NULL, ''),
	(3, 12, 8, '张大虎', '主治医生', '神经科', 0, '1980-12-11 00:00:00', 175, 80, '治疗神经病的专家', '11', '2018-12-11 14:29:33', '', NULL, ''),
	(4, 13, 8, '孙玉仁', '主治医生', '儿科', 0, '1979-12-11 00:00:00', 178, 80, '儿科专家', '11', '2018-12-11 14:36:30', '', NULL, '');
/*!40000 ALTER TABLE `tb_doctor` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_hospital 结构
CREATE TABLE IF NOT EXISTS `tb_hospital` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `sys_user_id` bigint(20) NOT NULL COMMENT '登录用户id',
  `name` varchar(450) NOT NULL COMMENT '医院名字',
  `address` varchar(1000) DEFAULT NULL COMMENT '地址',
  `html_context` longtext COMMENT '医院简介',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='医院表';

-- 正在导出表  sibo-gxy-2.tb_hospital 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `tb_hospital` DISABLE KEYS */;
INSERT INTO `tb_hospital` (`id`, `sys_user_id`, `name`, `address`, `html_context`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(7, 5, '江西省人民医院', '江西南昌', '江西省人民医院创建于1897年，前身是美国卫理公会创办的教会医院，是南昌地区第一所西医医院', '', NULL, '', NULL, ''),
	(8, 11, '南昌妇幼保健院', '江西南昌进贤路', '南昌市妇幼保健医院始建于1953年，是一家妇幼保健院', '1', '2018-12-08 15:33:56', '', NULL, '公立医院');
/*!40000 ALTER TABLE `tb_hospital` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_message 结构
CREATE TABLE IF NOT EXISTS `tb_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `send_userid` bigint(20) DEFAULT NULL COMMENT '发送用户id',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `content` longtext COMMENT '消息内容',
  `to_userid` bigint(20) DEFAULT NULL COMMENT '目标用户id',
  `is_read` char(1) DEFAULT '0' COMMENT '状态（0未读 1已读）',
  `type` int(11) DEFAULT '1' COMMENT '类别,1消息;2建议,3其他报警消息',
  `jsondata` varchar(950) DEFAULT NULL COMMENT '其他数据,如报警时的gps位置等信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COMMENT='消息建议表';

-- 正在导出表  sibo-gxy-2.tb_message 的数据：~28 rows (大约)
/*!40000 ALTER TABLE `tb_message` DISABLE KEYS */;
INSERT INTO `tb_message` (`id`, `send_userid`, `send_time`, `content`, `to_userid`, `is_read`, `type`, `jsondata`) VALUES
	(19, 2, '2018-10-30 13:15:47', 'sdgasg', 28, NULL, 2, ''),
	(20, 1, '2018-11-05 10:55:43', 'sdgfagaf', 28, NULL, 2, ''),
	(21, 1, '2018-11-28 11:57:37', '吃饭了,大家好', 28, NULL, 2, ''),
	(23, 1, '2018-11-28 12:03:18', 'Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。 Torvalds 开始着手开发 Git 是为了作为一种过渡方案来替代 BitKeeper，后者之前一直是 Linux 内核开发人员在全球使用的主要源代码工具。', 28, NULL, 2, ''),
	(24, 1, '2018-11-28 14:30:36', '为什么总有些傻逼从来不为别人考虑,自私自利,天天弄个机械键盘,噼里啪啦的,还觉得自己很酷,一个屋里就属这人动静大.真是吵死了\r\n\r\n为什么总有些傻逼从来不为别人考虑,自私自利,天天弄个机械键盘,噼里啪啦的,还觉得自己很酷,一个屋里就属这人动静大.真是吵死了', 28, '0', 2, ''),
	(25, 1, '2018-11-28 14:51:26', '2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留', 28, '0', 2, ''),
	(26, 1, '2018-11-28 14:51:55', '2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留', 28, '0', 2, ''),
	(27, 1, '2018-11-28 14:53:34', '2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留', 28, '0', 2, ''),
	(28, 1, '2018-11-28 14:58:33', '2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留', 25, '1', 1, ''),
	(29, 1, '2018-11-28 14:59:13', '2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留', 25, '1', 1, ''),
	(30, 1, '2018-11-28 15:04:46', '制香水的方法有很多，最简单的便是将带有独特香味的花瓣或草药捣碎泡入酒精中，让酒精溶解植物里的芳香油，最后过滤掉残留物，加入水稀释即可使用。', 25, '1', 1, ''),
	(31, 1, '2018-11-28 16:34:46', 'test aaaaaaaaaaaaaaa', 25, '1', 1, ''),
	(32, 1, '2018-11-28 16:49:15', '请按时吃药.每次3片', 25, '1', 1, ''),
	(33, 1, '2018-11-28 16:52:21', '按时吃药,不要忘记治疗!!!!', 25, '1', 1, ''),
	(34, 1, '2018-11-29 09:41:57', 'ddddddddddddddddd', 25, '1', 1, ''),
	(35, 1, '2018-12-01 17:23:28', '建议多喝水', 25, '0', 2, ''),
	(36, 1, '2018-12-01 17:24:44', '您的亲友刘先生于2018-12-30检测到血压异常，收缩压80，舒张压120，心率110，<a href>点击查看位置', 35, '1', 3, ''),
	(37, 13, '2018-12-11 17:30:56', '建议多喝水', 35, '1', 1, ''),
	(38, 0, '2018-12-28 16:05:23', '您的亲友林先生于183检测到血压异常，收缩压65，舒张压88，心率0.000000,0.000000，<a href="http://www.baidu.com" target="_blank">点击查看位置</a>', 1000005, '0', 1, ''),
	(39, 0, '2018-12-28 16:11:12', '您的亲友林先生于183检测到血压异常，收缩压65，舒张压88，心率0.000000,0.000000，点击查看位置\n', 1000005, '0', 1, ''),
	(40, 0, '2018-12-28 16:15:11', '您的亲友林先生于183检测到血压异常，收缩压65，舒张压88，心率0.000000,0.000000，点击查看位置\n', 1000005, '0', 1, ''),
	(41, 0, '2018-12-28 16:27:33', '您的亲友林先生于183检测到血压异常，收缩压75，舒张压88，心率0.000000,0.000000，点击查看位置\n', 1000004, '0', 1, ''),
	(42, 0, '2018-12-28 16:27:33', '您的亲友林先生于183检测到血压异常，收缩压75，舒张压88，心率0.000000,0.000000，点击查看位置\n', 1000005, '0', 1, ''),
	(43, 0, '2018-12-28 16:27:33', '您的亲友林先生于183检测到血压异常，收缩压75，舒张压88，心率0.000000,0.000000，点击查看位置\n', 1000006, '0', 1, ''),
	(44, 0, '2018-12-28 16:28:04', '您的亲友林先生于183检测到血压异常，收缩压65，舒张压88，心率0.000000,0.000000，点击查看位置{}\n', 1000004, '0', 1, ''),
	(45, 0, '2018-12-28 16:28:05', '您的亲友林先生于183检测到血压异常，收缩压65，舒张压88，心率0.000000,0.000000，点击查看位置{}\n', 1000005, '0', 1, ''),
	(46, 0, '2018-12-28 16:28:05', '您的亲友林先生于183检测到血压异常，收缩压65，舒张压88，心率0.000000,0.000000，点击查看位置{}\n', 1000006, '0', 1, ''),
	(47, 1, '2018-12-28 17:25:54', '多休息，尽量避免剧烈运动', 10, '0', 2, '');
/*!40000 ALTER TABLE `tb_message` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_mobile_code 结构
CREATE TABLE IF NOT EXISTS `tb_mobile_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `code` varchar(255) NOT NULL COMMENT '验证码,再次发送时更新记录,并更新时间',
  `date` datetime NOT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='手机发送验证码表';

-- 正在导出表  sibo-gxy-2.tb_mobile_code 的数据：~19 rows (大约)
/*!40000 ALTER TABLE `tb_mobile_code` DISABLE KEYS */;
INSERT INTO `tb_mobile_code` (`id`, `uuid`, `mobile`, `code`, `date`) VALUES
	(10, '6b765013-c8bf-41a8-ab02-d04d4fd1a1a8', '13800000000', '921309', '2018-12-12 15:07:08'),
	(11, '928a80d4-633c-41b7-bf4a-dafb44fbccea', '13800000008', '606340', '2018-12-28 16:23:01'),
	(12, '67028064-85a8-4ca4-af20-c05eafe095fd', '1380000000', '610231', '2018-10-23 20:06:46'),
	(13, 'a22b3457-6990-4213-8eeb-7ad6b8bc9327', '111', '305981', '2018-11-01 15:17:48'),
	(14, '231ec052-1f19-4b53-a46d-0b59c06683d0', '11333338000', '950424', '2018-10-26 09:24:36'),
	(15, '91fc24ef-dbc3-4fb4-bccd-45597b912772', '1355', '903891', '2018-10-26 19:23:58'),
	(16, '4a1d6e7f-7574-4874-881e-5586fd0997a6', '13555', '632020', '2018-10-27 10:13:03'),
	(17, '3156b14d-0373-4b6c-b4a0-48e3404a9fb4', '13666', '469082', '2018-10-29 09:30:21'),
	(18, '95fcdc30-fe8c-4c4a-aacd-b365fe53960a', '11', '847231', '2018-10-31 10:03:18'),
	(19, '35782007-f42a-48a9-9014-ef16c094c841', '15170707553', '159591', '2018-11-06 19:39:39'),
	(20, '352a9523-de23-4cb5-987f-d64d93964f27', '123', '232847', '2018-11-02 15:40:32'),
	(21, 'd2c750fd-2dc6-4bc3-aaff-418636629873', '1313', '862637', '2018-11-03 17:57:42'),
	(22, 'f663d8c3-d15d-4866-bb4c-bf236115e1b8', '1', '335567', '2018-11-05 17:04:50'),
	(23, '9e5a65b3-51f1-4f75-8756-c8c0c1ba2221', '13555852213', '417299', '2018-11-06 09:53:37'),
	(24, 'a516f94f-9b73-4629-a472-c36fedda6c53', '15000218819', '452349', '2018-11-13 09:29:36'),
	(25, '1178321d-60bc-4c89-bde7-ae58903d6298', '13555555555', '264625', '2018-11-12 09:54:59'),
	(26, '5d7ee7d9-ebca-4000-95bc-48021a3f7d57', '13586632569', '595438', '2018-11-12 15:53:30'),
	(27, '49ad8426-645a-43a3-9a81-3ebb5177bd32', '13684943579', '266307', '2018-12-11 16:54:49'),
	(28, '84f57423-d9c8-406a-8c8b-6141b9a916b1', '13123569965', '552880', '2018-11-13 09:29:25'),
	(29, 'd684c9be-89dd-4d58-9746-413bcc23ed21', '13800138000', '312630', '2018-12-16 15:09:59'),
	(30, 'dc361473-2f18-4dc1-ad15-04996554c0b2', '15888085213', '779202', '2018-11-15 10:50:42'),
	(31, 'e1d088cb-2a5d-412c-99a8-439b4a4c28a0', '13522213313', '719354', '2018-12-12 10:27:13'),
	(32, '13fefbba-5937-4f19-9a79-d264c779a2ba', '15888213315', '941785', '2018-12-11 16:34:38'),
	(33, 'f563e34a-37a0-4fd3-befb-658d842cd8fc', '13666421311', '651883', '2018-11-27 16:33:33'),
	(34, '2c3e2cb7-1fe2-4587-8e14-f91888744eb2', '13585224613', '673255', '2018-11-28 11:19:50'),
	(35, 'a487fac9-40ea-4087-8dae-1a785c6bb5e4', '13428795901', '370897', '2018-12-19 17:07:00'),
	(36, '2cc08a49-e42f-4a5a-8bcc-92d314ab50e6', '15170707559', '355260', '2018-12-05 09:51:00'),
	(37, 'f36a9cde-1b65-411b-8bc2-6224827bce96', '17722490213', '876950', '2018-12-06 13:08:00'),
	(38, '0e3834a5-dad0-4a0d-b3c9-b2d3a1dc8b0c', '16620846645', '565798', '2018-12-19 17:26:29'),
	(39, '2b9bbda5-f80f-4ac4-80f9-097532b3d6ba', '15000000009', '899876', '2018-12-12 15:14:22'),
	(40, 'd6a28e36-5241-4232-b696-5b887affa31d', '13428795902', '292324', '2018-12-19 17:07:44'),
	(41, '82ff4717-8c87-4525-bee2-3d3cbcec141f', '13428795904', '512747', '2018-12-19 17:23:50');
/*!40000 ALTER TABLE `tb_mobile_code` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_patient_user 结构
CREATE TABLE IF NOT EXISTS `tb_patient_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `uuid` varchar(60) DEFAULT NULL COMMENT 'uuid,程序生成',
  `user_id` varchar(45) DEFAULT NULL COMMENT '用户数字账号',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(145) DEFAULT NULL,
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `user_type` varchar(2) DEFAULT NULL COMMENT '用户类型（00系统用户）',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile_phone` varchar(20) DEFAULT NULL COMMENT '手机号',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_logintime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `avatar` varchar(245) DEFAULT '' COMMENT '头像',
  `sex` tinyint(4) DEFAULT '0' COMMENT '性别  1：男   2：女',
  `realname` varchar(60) DEFAULT NULL COMMENT '用户姓名,真实名',
  `register_type` int(11) DEFAULT NULL COMMENT '用户首次注册时的类型,如1.手机号,2.email,3.qq,4.微信等',
  `height` int(11) DEFAULT NULL COMMENT '身高(cm)',
  `weight` int(11) DEFAULT NULL COMMENT '体重(kg)',
  `birthday` datetime DEFAULT NULL COMMENT '出生年月',
  `blood_type` char(10) DEFAULT NULL COMMENT '血型',
  `job` varchar(205) DEFAULT NULL COMMENT '职业',
  `marriage` varchar(45) DEFAULT NULL COMMENT '婚姻,已婚,未婚',
  `smoke` varchar(245) DEFAULT NULL COMMENT '吸烟状况',
  `drinking_frequency` varchar(245) DEFAULT NULL COMMENT '饮酒频率',
  `exercise_frequency` varchar(245) DEFAULT NULL COMMENT '锻炼频率',
  `time_illness` varchar(245) DEFAULT NULL COMMENT '患病时间',
  `other_diseases` varchar(245) DEFAULT NULL COMMENT '其他疾病',
  `other_time_illness` varchar(245) DEFAULT NULL COMMENT '其他疾病患病时间',
  `major_surgical_history` varchar(245) DEFAULT NULL COMMENT '重大手术史',
  `doctor_id` bigint(20) DEFAULT NULL COMMENT '医生id',
  `address` varchar(545) DEFAULT NULL COMMENT '地址',
  `device_id` bigint(20) DEFAULT '0' COMMENT '设备id',
  `valid_date` datetime DEFAULT NULL COMMENT '服务期',
  `high_standard` int(11) DEFAULT '120' COMMENT '高压标准值 120',
  `low_standard` int(11) DEFAULT '80' COMMENT '低压标准值 80',
  `high_high_value` int(11) DEFAULT '140' COMMENT '高压高值 140',
  `low_high_value` int(11) DEFAULT '90' COMMENT '低压高值 90',
  `high_low_value` int(11) DEFAULT '119' COMMENT '高压低值 119',
  `low_low_value` int(11) DEFAULT '79' COMMENT '低压低值 79',
  `heart_standard` int(11) DEFAULT '80' COMMENT '心率标准值 80',
  `illness_familly` varchar(500) DEFAULT NULL COMMENT '家族历',
  `illness_now` varchar(500) DEFAULT NULL COMMENT '现病史',
  `illness_history` varchar(500) DEFAULT NULL COMMENT '既往史',
  `illness_allergy` varchar(500) DEFAULT NULL COMMENT '过敏史',
  `illness_grade` tinyint(4) DEFAULT NULL COMMENT '疾病严重等级',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='用户表(相当于患者表),针对前台app类用户';

-- 正在导出表  sibo-gxy-2.tb_patient_user 的数据：~12 rows (大约)
/*!40000 ALTER TABLE `tb_patient_user` DISABLE KEYS */;
INSERT INTO `tb_patient_user` (`id`, `uuid`, `user_id`, `username`, `password`, `nick_name`, `salt`, `user_type`, `email`, `mobile_phone`, `status`, `create_time`, `last_logintime`, `avatar`, `sex`, `realname`, `register_type`, `height`, `weight`, `birthday`, `blood_type`, `job`, `marriage`, `smoke`, `drinking_frequency`, `exercise_frequency`, `time_illness`, `other_diseases`, `other_time_illness`, `major_surgical_history`, `doctor_id`, `address`, `device_id`, `valid_date`, `high_standard`, `low_standard`, `high_high_value`, `low_high_value`, `high_low_value`, `low_low_value`, `heart_standard`, `illness_familly`, `illness_now`, `illness_history`, `illness_allergy`, `illness_grade`) VALUES
	(10, '31918ce0-6b43-4da5-815d-e2a29db28c2e', '10000', 'lin', NULL, 'lin', NULL, NULL, NULL, '13800000008', 1, '2018-10-23 18:20:25', '2018-10-23 18:20:25', '', 0, '林先生', 1, 166, 55, '1965-12-01 00:00:00', 'A型', '教师', '已婚', '无', '无', '无', '2018-12-01', NULL, NULL, '无', 4, '深圳市龙岗区大运', 47, '2020-12-09 00:00:00', 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, 3),
	(11, '75803a4d-a796-46bc-ad87-5ba62fa64f11', '10000', NULL, NULL, NULL, NULL, NULL, NULL, '13800000000', 1, '2018-10-23 20:07:01', '2018-12-05 16:32:57', '', 0, '陈先生', 1, 178, 60, NULL, 'A型', NULL, '已婚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '江西省南昌', 35, NULL, 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, NULL),
	(25, '53681175-82f7-4fa5-8631-638a66bd5240', '10000', 'lai', NULL, 'lai', NULL, NULL, NULL, '13800138000', 1, '2018-11-13 11:29:18', '2018-12-02 13:12:31', '20181216_16126315022_1544947974133.JPEG', 1, '赖女士', 1, 178, 77, '1977-12-01 00:00:00', 'A型', '律师', '已婚', '无', '无', '无', '2004-11-01', '无', NULL, '无', 1, '深圳市龙岗区天安数码城', 39, '2018-12-28 00:00:00', 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, 3),
	(27, 'f8c1b34d-07fd-48ff-8be1-b1aca290a5ce', '10000', NULL, NULL, NULL, NULL, NULL, NULL, '13522213313', 1, '2018-11-22 10:28:43', '2018-11-22 10:28:43', '', 0, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, 40, NULL, 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, NULL),
	(28, '75dcdbaa-30f6-4b29-af07-9567b76253ab', '10000', 'zhang', NULL, 'zhang', NULL, NULL, '691484729@qq.com', '15888213315', 1, '2018-11-23 11:27:37', '2018-11-23 11:27:37', '', 0, '张先生', 1, 168, 66, '1967-12-01 00:00:00', 'A型', '教师', '已婚', '无', '无', '无', '2018-10-09', '无', NULL, '无', 2, '深圳市龙岗区缤纷世纪公寓', 41, '2019-12-11 00:00:00', 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, NULL),
	(33, '72dcdbaa-30f6-4b29-af07-9567b76223ab', NULL, 'liu', '88888888', 'liu', NULL, NULL, '691484729@qq.com', '15170707553', 1, NULL, NULL, '', 0, '刘先生', 0, 177, 70, '1981-12-08 00:00:00', 'A型', '律师', '已婚', '3年', '无', '无', '2015-10-06', '无', NULL, '无', 1, '深圳市龙岗区黄阁坑新秀新村', 42, '2021-12-09 00:00:00', 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, NULL),
	(34, '71dcdbaa-30f6-4b29-af07-9567b76223ab', NULL, 'zy', '1c7656e8556803764c38ba66e8daf5b5', NULL, '3a8e9d', NULL, '123@123.com', '13684943579', 1, NULL, NULL, '', 0, '123', 0, 170, 66, '2018-12-06 00:00:00', 'A型', '工人', '已婚', '2年', '不饮酒', '锻炼频率', '2018-12-06', '无', NULL, '无', 1, '123', 43, '2018-12-27 00:00:00', 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, NULL),
	(35, '75dcdbca-30f6-4b29-af07-9567b76223ab', NULL, NULL, '4e062df340d25c77b63d32e1589bc3a6', NULL, 'fc25b6', NULL, NULL, '16620846645', 1, NULL, NULL, '20181212_14483956358_1544597312165.JPEG', 0, '李世民', 0, 170, 70, '1986-12-11 00:00:00', 'A型', '公务员', '已婚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '广东省深圳市龙华区', 44, '2019-12-11 00:00:00', 122, 81, 140, 91, 118, 79, 85, NULL, NULL, NULL, NULL, 2),
	(36, '75dcdbaa-3126-4b29-af07-9567b76223ab', NULL, NULL, '5a6dca1a04570b4a80bfa0a302376ebb', NULL, '65f220', NULL, NULL, '15000000000', 1, NULL, NULL, '', 0, '陈伟', 0, 168, 45, '1965-12-14 00:00:00', 'A型', NULL, '已婚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '江西省九江市浔阳区湖滨路48号', 45, '2019-04-19 00:00:00', 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, NULL),
	(37, '75dcdbaa-30f6-4b29-af07-9567b76223a', NULL, NULL, '36e2254193447684edcceeaa87dec3dd', NULL, 'acf6b7', NULL, NULL, '15000000009', 1, NULL, NULL, '', 0, '王伟', 0, 168, 45, '1969-12-08 00:00:00', 'A型', NULL, '已婚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 1, '江西省九江市浔阳区湖滨路48号', 46, NULL, 120, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, NULL),
	(38, NULL, NULL, NULL, 'edb3c28b2c4c3d522e24ddede3ef4b29', NULL, '8b8c01', NULL, NULL, '16620846646', 1, '2018-12-20 11:44:02', NULL, '', 0, '张某某', NULL, NULL, NULL, NULL, 'A型', NULL, '已婚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '南昌', 0, NULL, 121, 80, 140, 90, 119, 79, 80, NULL, NULL, NULL, NULL, 1),
	(39, NULL, NULL, NULL, '22433db45c89ac5f9a0c39ca8cc45bf7', NULL, 'b933c1', NULL, NULL, '16620846647', 1, '2018-12-20 12:09:37', NULL, '', 0, '张某某', NULL, NULL, NULL, NULL, 'A型', NULL, '已婚', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 4, '南昌', 0, NULL, 125, 88, 145, 90, 119, 79, 80, NULL, NULL, NULL, NULL, 2);
/*!40000 ALTER TABLE `tb_patient_user` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_rate_ask 结构
CREATE TABLE IF NOT EXISTS `tb_rate_ask` (
  `ask_id` bigint(20) unsigned NOT NULL COMMENT '咨询记录id',
  `pid` bigint(20) unsigned DEFAULT NULL COMMENT '评价病人的id',
  `doctor_id` bigint(20) unsigned DEFAULT NULL COMMENT '医生id',
  `rate_value` int(10) unsigned DEFAULT NULL COMMENT '评价值',
  `rate_text` varchar(250) DEFAULT NULL COMMENT '评价内容'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='咨询评论表';

-- 正在导出表  sibo-gxy-2.tb_rate_ask 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `tb_rate_ask` DISABLE KEYS */;
INSERT INTO `tb_rate_ask` (`ask_id`, `pid`, `doctor_id`, `rate_value`, `rate_text`) VALUES
	(19, 10, NULL, 3, NULL),
	(19, 10, NULL, 5, NULL),
	(19, 10, NULL, 5, NULL);
/*!40000 ALTER TABLE `tb_rate_ask` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_sms_history 结构
CREATE TABLE IF NOT EXISTS `tb_sms_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `to_mobile_no` varchar(20) DEFAULT NULL COMMENT '接收人手机号码',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `parameter` varchar(1000) DEFAULT NULL COMMENT '参数以及值',
  `module` varchar(245) DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COMMENT='发送短信记录表';

-- 正在导出表  sibo-gxy-2.tb_sms_history 的数据：~46 rows (大约)
/*!40000 ALTER TABLE `tb_sms_history` DISABLE KEYS */;
INSERT INTO `tb_sms_history` (`id`, `to_mobile_no`, `send_time`, `parameter`, `module`) VALUES
	(54, '15170707553', '2018-12-07 16:24:39', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(55, '15170707554', '2018-12-07 16:24:40', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(56, '15170707555', '2018-12-07 16:24:40', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(57, '15170707556', '2018-12-07 16:24:40', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(58, '13428795901', '2018-12-07 16:24:40', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(59, '15170707559', '2018-12-07 16:24:40', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(60, '15170707553', '2018-12-11 16:53:41', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(61, '15170707554', '2018-12-11 16:53:41', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(62, '15170707555', '2018-12-11 16:53:41', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(63, '15170707556', '2018-12-11 16:53:42', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(64, '13428795901', '2018-12-11 16:53:42', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(65, '15170707559', '2018-12-11 16:53:42', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(66, '15170707553', '2018-12-11 16:53:42', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(67, '15170707554', '2018-12-11 16:53:43', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(68, '15170707555', '2018-12-11 16:53:43', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(69, '15170707556', '2018-12-11 16:53:43', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(70, '13428795901', '2018-12-11 16:53:43', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(71, '15170707559', '2018-12-11 16:53:43', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(72, '15170707553', '2018-12-11 16:53:44', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(73, '15170707554', '2018-12-11 16:53:44', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(74, '15170707555', '2018-12-11 16:53:44', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(75, '15170707556', '2018-12-11 16:53:45', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(76, '13428795901', '2018-12-11 16:53:45', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(77, '15170707559', '2018-12-11 16:53:45', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(78, '15170707553', '2018-12-11 16:54:01', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(79, '15170707554', '2018-12-11 16:54:01', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(80, '15170707555', '2018-12-11 16:54:02', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(81, '15170707556', '2018-12-11 16:54:02', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(82, '13428795901', '2018-12-11 16:54:02', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(83, '15170707559', '2018-12-11 16:54:02', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(84, '15170707553', '2018-12-11 17:37:24', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(85, '15170707554', '2018-12-11 17:37:24', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(86, '15170707555', '2018-12-11 17:37:25', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(87, '15170707556', '2018-12-11 17:37:25', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(88, '13428795901', '2018-12-11 17:37:25', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(89, '15170707559', '2018-12-11 17:37:25', '手机号: 13800138000, 姓名: 赖女士', '报警呼救'),
	(90, '13428795901', '2018-12-24 10:29:41', '手机号: 16620846645, 病人: 李世民, 血压: 130, 心率: 61', '报警呼救'),
	(91, '13428795903', '2018-12-24 10:29:41', '手机号: 16620846645, 病人: 李世民, 血压: 130, 心率: 61', '报警呼救'),
	(92, '13428795904', '2018-12-24 10:29:41', '手机号: 16620846645, 病人: 李世民, 血压: 130, 心率: 61', '报警呼救'),
	(93, '15170707553', '2018-12-24 10:34:05', '手机号: 16620846645, 病人: 李世民, 血压: 130, 心率: 61', '报警呼救'),
	(94, '13538266591', '2018-12-28 10:21:22', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救'),
	(95, '13538266591', '2018-12-28 11:02:23', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救'),
	(96, '13538266591', '2018-12-28 16:15:11', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救'),
	(97, '15170707553', '2018-12-28 16:27:33', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救'),
	(98, '13538266591', '2018-12-28 16:27:33', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救'),
	(99, '16620846645', '2018-12-28 16:27:33', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救'),
	(100, '15170707553', '2018-12-28 16:28:04', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救'),
	(101, '13538266591', '2018-12-28 16:28:05', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救'),
	(102, '16620846645', '2018-12-28 16:28:05', '手机号: 13800000008, 病人: 林先生, 血压: 183, 心率: 88', '报警呼救');
/*!40000 ALTER TABLE `tb_sms_history` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_user_device 结构
CREATE TABLE IF NOT EXISTS `tb_user_device` (
  `pid` bigint(20) NOT NULL COMMENT '设备对应的病人id',
  `barcode` varchar(100) NOT NULL COMMENT '设备条码',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `xo_active` tinyint(1) unsigned DEFAULT NULL COMMENT '是否默认设备,1为默认,0不是',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '设备类型,1为病人本人设备,2为亲友关注的设备',
  `devicename` varchar(245) DEFAULT NULL COMMENT '设备名称',
  PRIMARY KEY (`pid`,`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和设备关联表';

-- 正在导出表  sibo-gxy-2.tb_user_device 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `tb_user_device` DISABLE KEYS */;
INSERT INTO `tb_user_device` (`pid`, `barcode`, `user_id`, `xo_active`, `type`, `devicename`) VALUES
	(35, '8800000022', NULL, NULL, NULL, '手环');
/*!40000 ALTER TABLE `tb_user_device` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_user_friend 结构
CREATE TABLE IF NOT EXISTS `tb_user_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `uuid` varchar(60) DEFAULT NULL COMMENT 'uuid,程序生成',
  `user_id` varchar(45) DEFAULT NULL COMMENT '用户数字账号',
  `username` varchar(50) DEFAULT NULL COMMENT '用户名',
  `password` varchar(100) DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(145) DEFAULT NULL,
  `salt` varchar(20) DEFAULT NULL COMMENT '盐',
  `user_type` varchar(2) DEFAULT NULL COMMENT '用户类型（00系统用户）',
  `email` varchar(100) DEFAULT NULL COMMENT '邮箱',
  `mobile_phone` varchar(20) DEFAULT NULL COMMENT '手机号,手机号必须唯一',
  `status` tinyint(4) DEFAULT '1' COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_logintime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `avatar` varchar(245) DEFAULT NULL COMMENT '头像',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别  1：男   2：女',
  `realname` varchar(60) DEFAULT NULL COMMENT '用户真实名',
  `register_type` int(11) DEFAULT NULL COMMENT '用户首次注册时的类型,如1.手机号,2.email,3.qq,4.微信等',
  `height` int(11) DEFAULT NULL COMMENT '身高(cm)',
  `weight` int(11) DEFAULT NULL COMMENT '体重(kg)',
  `birthday` datetime DEFAULT NULL COMMENT '出生年月',
  `job` varchar(205) DEFAULT NULL COMMENT '职业',
  `marriage` varchar(45) DEFAULT NULL COMMENT '婚姻,已婚,未婚',
  `address` varchar(545) DEFAULT NULL COMMENT '地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='亲友表';

-- 正在导出表  sibo-gxy-2.tb_user_friend 的数据：~7 rows (大约)
/*!40000 ALTER TABLE `tb_user_friend` DISABLE KEYS */;
INSERT INTO `tb_user_friend` (`id`, `uuid`, `user_id`, `username`, `password`, `nick_name`, `salt`, `user_type`, `email`, `mobile_phone`, `status`, `create_time`, `last_logintime`, `avatar`, `sex`, `realname`, `register_type`, `height`, `weight`, `birthday`, `job`, `marriage`, `address`) VALUES
	(1000000, NULL, NULL, NULL, '781d6a0b030d9cb56a0960db8ec8267f', NULL, '849e7d', NULL, NULL, '13428795901', 1, '2018-12-12 16:33:36', NULL, NULL, 0, '方世玉', NULL, NULL, NULL, NULL, '教练', NULL, '广东佛山'),
	(1000001, NULL, NULL, NULL, '397b05475ff8805495396d2742672e4a', NULL, '8a06ac', NULL, NULL, '13428795902', 1, '2018-12-19 15:16:46', NULL, NULL, 0, '张某某', NULL, NULL, NULL, NULL, '教师', NULL, NULL),
	(1000002, NULL, NULL, NULL, '46e171322aa91bda6a12d08257e30d68', NULL, '6740c3', NULL, NULL, '13428795903', 1, '2018-12-19 17:16:09', NULL, NULL, 0, '周先生', NULL, NULL, NULL, NULL, '教授', NULL, '江西南昌'),
	(1000003, NULL, NULL, NULL, '580ec5a38f8c8822c2bcf57f0243bded', NULL, '094c15', NULL, NULL, '13428795904', 1, '2018-12-19 17:21:28', NULL, NULL, 0, '杨先生', NULL, NULL, NULL, NULL, '服务员', NULL, '南昌'),
	(1000004, NULL, NULL, NULL, '6de9f74bf3f13995ca90ae3c548d9caa', NULL, '1c6995', NULL, NULL, '15170707553', 1, '2018-12-24 10:33:53', NULL, NULL, 0, '陈先生', NULL, NULL, NULL, NULL, '教师', NULL, '江西赣州'),
	(1000005, NULL, NULL, NULL, '6de9f74bf3f13995ca90ae3c548d9caa', NULL, '1c6995', NULL, NULL, '13538266591', 1, '2018-12-24 10:33:53', NULL, NULL, 0, '陈先生', NULL, NULL, NULL, NULL, '教师', NULL, '江西赣州'),
	(1000006, NULL, NULL, NULL, '185fc2d5fbe61485311922b3d7d8eb95', NULL, '6cc933', NULL, NULL, '16620846645', 1, '2018-12-28 16:26:18', NULL, NULL, 0, 'chen', NULL, NULL, NULL, NULL, '教师', NULL, '广东深圳');
/*!40000 ALTER TABLE `tb_user_friend` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_user_friend_relation 结构
CREATE TABLE IF NOT EXISTS `tb_user_friend_relation` (
  `pid` bigint(20) NOT NULL COMMENT '病人用户ID',
  `fid` bigint(20) NOT NULL COMMENT '亲友用户ID',
  `barcode` varchar(245) DEFAULT NULL COMMENT '设备条码',
  `deviceid` bigint(20) DEFAULT NULL COMMENT '病人表中的设备id',
  `current_device` tinyint(1) unsigned DEFAULT '0' COMMENT '是否当前设备,1为当前,0不是',
  PRIMARY KEY (`pid`,`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='病人和亲友关联表';

-- 正在导出表  sibo-gxy-2.tb_user_friend_relation 的数据：~4 rows (大约)
/*!40000 ALTER TABLE `tb_user_friend_relation` DISABLE KEYS */;
INSERT INTO `tb_user_friend_relation` (`pid`, `fid`, `barcode`, `deviceid`, `current_device`) VALUES
	(10, 1000004, '355583080471127', 47, 0),
	(10, 1000005, '355583080471127', 47, 0),
	(10, 1000006, '355583080471127', 47, 0),
	(34, 1000000, NULL, 43, 0),
	(35, 1000004, '8800000019', 44, 0);
/*!40000 ALTER TABLE `tb_user_friend_relation` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_user_token 结构
CREATE TABLE IF NOT EXISTS `tb_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `user___id` int(11) NOT NULL COMMENT '关联user表的主键id,关联例外表用3个_连接对应字段',
  `token` varchar(1000) NOT NULL COMMENT '每次登陆生成的token',
  `sign` varchar(60) DEFAULT NULL COMMENT '签名',
  `valid_time` datetime DEFAULT NULL COMMENT '有效时间',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COMMENT='针对移动端App的token验证表';

-- 正在导出表  sibo-gxy-2.tb_user_token 的数据：~48 rows (大约)
/*!40000 ALTER TABLE `tb_user_token` DISABLE KEYS */;
INSERT INTO `tb_user_token` (`id`, `user___id`, `token`, `sign`, `valid_time`, `create_time`, `update_time`) VALUES
	(31, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMDI3MTk1LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA2MzE5OTV9.yzYwHmN60UZDaxeqMZ1fMu8TKiGOyxDJgt97RsHiAzA', NULL, '2018-10-27 17:19:56', '2018-10-20 17:19:56', NULL),
	(33, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MDI5NjQyMSwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQwOTAxMjIxfQ.O1Iwvz0uMj4EqTTUwCcRWWTqdgfP5BSeT1d3PK83EoM', NULL, '2018-10-30 20:07:01', '2018-10-23 20:07:01', NULL),
	(34, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzQ3NjQzLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NTI0NDN9.wu8uSRSUK3uiOAbjXM0Zw4BanMzS05MO6TyqNMXXFGc', NULL, '2018-10-31 10:20:44', '2018-10-24 10:20:44', NULL),
	(35, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzQ5NTI0LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NTQzMjR9.ejd2EJ4LgCguNvyGL1yiQfRqnmiIYbaNeBjRi_A10uI', NULL, '2018-10-31 10:52:04', '2018-10-24 10:52:04', NULL),
	(36, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzY3OTQyLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NzI3NDJ9.sxZ01BAIcNTttcsHJrhaEcUiwAlpDp4gJJjae8h8CG8', NULL, '2018-10-31 15:59:02', '2018-10-24 15:59:02', NULL),
	(37, 12, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDQzMjg2OCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMDM3NjY4fQ.Qq9e0EfBDGULWUHv8zDJPQz35czOptifPoy0DYtSswA', NULL, '2018-11-01 10:01:09', '2018-10-25 10:01:09', NULL),
	(38, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNDM3Njk1LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEwNDI0OTV9.wJaeLEinOjE0LhirXVD73SLxzCNnCKS02861AOYS-vI', NULL, '2018-11-01 11:21:36', '2018-10-25 11:21:36', NULL),
	(40, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNTQzMDg3LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDExNDc4ODd9.PDTusfFSgYRVKEKXPwgzHhKV1mTuYUaoVMERXH6fcbA', NULL, '2018-11-02 16:38:07', '2018-10-26 16:38:07', NULL),
	(41, 14, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxNCIsImlhdCI6MTU0MDU1MzA0NCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMTU3ODQ0fQ.991wYlcnXpmxf9SrG_RIHD3BwVDvPmMOkOVmN2U0z9E', NULL, '2018-11-02 19:24:05', '2018-10-26 19:24:05', NULL),
	(43, 12, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDYwODUzOCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMjEzMzM4fQ.YxBBuvVu5a0fkjFCgzblHN1wyVLAfcjhlQ0eou8x7sI', NULL, '2018-11-03 10:48:59', '2018-10-27 10:48:59', NULL),
	(44, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNjExMTU5LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEyMTU5NTl9.U_AsdF2J2Hgon_FG9yCW6XX3b_FApFZ2m0IjGgGANLE', NULL, '2018-11-03 11:32:40', '2018-10-27 11:32:40', NULL),
	(45, 16, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxNiIsImlhdCI6MTU0MDc3NjYyNiwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMzgxNDI2fQ.Py22X-wSq_weKpb0snmNHjlzMgGetV0fah5ecwIfpVI', NULL, '2018-11-05 09:30:27', '2018-10-29 09:30:27', NULL),
	(46, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNzc4NTc4LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEzODMzNzh9.iBLP1s2GmKjdk_7gNygfooQerlLIlXHhSAQrFa0ve4o', NULL, '2018-11-05 10:02:58', '2018-10-29 10:02:58', NULL),
	(47, 12, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDk1MTQxMiwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxNTU2MjEyfQ.2_inhKehe_sj-zW0LGxLAu0Z8QVYR118ArRSuFz_fis', NULL, '2018-11-07 10:03:33', '2018-10-31 10:03:33', NULL),
	(51, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwOTcxMTM5LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE1NzU5Mzl9.AKV_aNiVQhgCqe-Egd8AF3yT2VgKzvn8hYbIAB0ELdM', NULL, '2018-11-07 15:32:20', '2018-10-31 15:32:20', NULL),
	(52, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwOTc0Njc2LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE1Nzk0NzZ9.GQPM4TwJEy4iu5bOBRqTCDSjK2bcW0k8JV0ygeOwoFo', NULL, '2018-11-07 16:31:16', '2018-10-31 16:31:16', NULL),
	(53, 12, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MTA1NjY3Mywic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxNjYxNDczfQ.rWOUoa4MAGPFSlFy5lV-5NRAUmVzc2-YX8H7xpZJYyg', NULL, '2018-11-08 15:17:53', '2018-11-01 15:17:53', NULL),
	(54, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQxMTI4NTgxLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE3MzMzODF9.7n7gZZEHG2ZKThXdbwAwEiSvRsGcu1uPoaMNr3MuzYU', NULL, '2018-11-09 11:16:22', '2018-11-02 11:16:22', NULL),
	(55, 18, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxOCIsImlhdCI6MTU0MTE0NDQ0Niwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxNzQ5MjQ2fQ.AHBqqp8S-mn6Ant1edf4vlcexQc1EDpF4mltDg_6kdc', NULL, '2018-11-09 15:40:47', '2018-11-02 15:40:47', NULL),
	(56, 19, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxOSIsImlhdCI6MTU0MTIzOTA3NCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxODQzODc0fQ.J2_wUyfgaOV86nC8Ke3UYXsQ-eJZu8F01JMxLx7ft_M', NULL, '2018-11-10 17:57:55', '2018-11-03 17:57:55', NULL),
	(57, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQxMzg3MTEzLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE5OTE5MTN9.J11smfgCH3ZupluGwcfEA9z99FKXKyNmsLNhzJ5Ittg', NULL, '2018-11-12 11:05:14', '2018-11-05 11:05:14', NULL),
	(58, 20, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMCIsImlhdCI6MTU0MTQwODY5Niwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyMDEzNDk2fQ.cZ58hT6u8EkMeougdKNGzx0f4pStuJ-9h1BIwRBaTfU', NULL, '2018-11-12 17:04:56', '2018-11-05 17:04:56', NULL),
	(60, 22, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMiIsImlhdCI6MTU0MTQ3MDYyMiwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyMDc1NDIyfQ.XnWKPi03aODETW3lGoC5IVCOmwep9rfY5J8B7h24UgE', NULL, '2018-11-13 10:17:03', '2018-11-06 10:17:03', NULL),
	(62, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQxNDkyNTcwLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDIwOTczNzB9.Rcq6CiWkod0qSUwCza2dV_OLXJatvdRsLOJr8Tp96ZY', NULL, '2018-11-13 16:22:51', '2018-11-06 16:22:51', NULL),
	(63, 17, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxNyIsImlhdCI6MTU0MTUwNDQwMywic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyMTA5MjAzfQ.eUSmN_GG-nJMx-7J3DrutnIZs1CWmtCz0TN0NuS7jyA', NULL, '2018-11-13 19:40:03', '2018-11-06 19:40:03', NULL),
	(64, 23, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMyIsImlhdCI6MTU0MTU1NjM5NCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyMTYxMTk0fQ.NbbK1NRBNt1F7b4UAOemYHVij3JPn2nxYHCzZDz6qyc', NULL, '2018-11-14 10:06:34', '2018-11-07 10:06:34', NULL),
	(65, 23, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMyIsImlhdCI6MTU0MTk4NzcwNCwiaXNzIjoic2libyIsImV4cCI6MTU0MjU5MjUwNH0.fXx7uIehmz83_26kuvUE3yf4P06NQCN86m8X-FVPCN0', NULL, '2018-11-19 09:55:04', '2018-11-12 09:55:04', NULL),
	(67, 24, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyNCIsImlhdCI6MTU0MjAxMzU5NSwiaXNzIjoic2libyIsImV4cCI6MTU0MjYxODM5NX0.0QIYio38thXz1neLragGMU0kt1z8QJkWGRcgeAS44wM', NULL, '2018-11-19 17:06:36', '2018-11-12 17:06:36', NULL),
	(68, 22, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMiIsImlhdCI6MTU0MjA3MjU5MywiaXNzIjoic2libyIsImV4cCI6MTU0MjY3NzM5M30.NbqeubRcdkKm8EjMPx4bmhbpHoyUCCnUksg_KXEAmAs', NULL, '2018-11-20 09:29:54', '2018-11-13 09:29:54', NULL),
	(71, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQyMTAyNzQwLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyNzA3NTQwfQ.bUA-AsALEswUBFjxZdM0fcGlJZkDel7qe7MkZ51cdz4', NULL, '2018-11-20 17:52:21', '2018-11-13 17:52:21', NULL),
	(72, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQyMTY1OTEzLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyNzcwNzEzfQ.A1kigpV0S_UgQhBwCtUQFz-aJFSUAuQGtQYdmHE066c', NULL, '2018-11-21 11:25:14', '2018-11-14 11:25:14', NULL),
	(73, 26, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyNiIsImlhdCI6MTU0MjI1MDI0OCwiaXNzIjoic2libyIsImV4cCI6MTU0Mjg1NTA0OH0.l4E-6pM9sWJMhcrQ96x_yj-v8R1QYMdSxLOZldlYN-I', NULL, '2018-11-22 10:50:49', '2018-11-15 10:50:49', NULL),
	(74, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQyMjcyODIyLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyODc3NjIyfQ.IZtlerRzmUbNLN9Tgm4jyq8DnOWGXzTOOIPxS0ONw1A', NULL, '2018-11-22 17:07:03', '2018-11-15 17:07:03', NULL),
	(76, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQyNzAyMDE0LCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQzMzA2ODE0fQ.68dfo4DXVInfdG797wsr3jm5Q30OMRqTDCJE6qH92TM', NULL, '2018-11-27 16:20:15', '2018-11-20 16:20:15', NULL),
	(77, 27, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyNyIsImlhdCI6MTU0Mjg1MzcyMywiaXNzIjoic2libyIsImV4cCI6MTU0MzQ1ODUyM30.EGiNcwvluEdUcQ9rcGzfz31okoS2Ayusb1lFGNpAKIU', NULL, '2018-11-29 10:28:43', '2018-11-22 10:28:43', NULL),
	(78, 28, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyOCIsImlhdCI6MTU0Mjk0MzY1NiwiaXNzIjoic2libyIsImV4cCI6MTU0MzU0ODQ1Nn0.O4gDnsGGfwlpulo86opiqHr2297PNEOHbT1A6-u7-v8', NULL, '2018-11-30 11:27:37', '2018-11-23 11:27:37', NULL),
	(80, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQzMjg5NzEzLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQzODk0NTEzfQ.ejAZJh6qCtjA0vAE-UWBtq4GMT5SzNo56wMGMXfqwcA', NULL, '2018-12-04 11:35:14', '2018-11-27 11:35:14', NULL),
	(83, 29, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyOSIsImlhdCI6MTU0MzMwNzYxOCwiaXNzIjoic2libyIsImV4cCI6MTU0MzkxMjQxOH0.WoPfm7OTgk1GO7rkLkg9hZsrkznyAgOX9jOptTZl52Y', NULL, '2018-12-04 16:33:38', '2018-11-27 16:33:38', NULL),
	(85, 30, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIzMCIsImlhdCI6MTU0MzM3NTE5OCwiaXNzIjoic2libyIsImV4cCI6MTU0Mzk3OTk5OH0.xBkfQxFvrcjzIGF-RB87JCEkSuaOnF2t-gO7Ncy2Jr4', NULL, '2018-12-05 11:19:59', '2018-11-28 11:19:59', NULL),
	(88, 9, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQzNDYwNDAyLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQ0MDY1MjAyfQ.Q9ioe4DEnzFAsFClrEBAZW9v6GDPYHzUqRB0rFucHlg', NULL, '2018-12-06 11:00:03', '2018-11-29 11:00:03', NULL),
	(89, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MzQ3MzI5NywiaXNzIjoic2libyIsImV4cCI6MTU0NDA3ODA5N30.PEPAxg1-yDqZdzh4qwIQYegYmnctsR3mRCARhJumBNw', NULL, '2018-12-06 14:34:57', '2018-11-29 14:34:57', NULL),
	(91, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MzY2MDQ0NywiaXNzIjoic2libyIsImV4cCI6MTU0NDI2NTI0N30.NKTi_EFHliupsSw8xdzpzSgGYnoT6-CQJQ--Xg53a3M', NULL, '2018-12-08 18:34:07', '2018-12-01 18:34:07', NULL),
	(92, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MzcxNDU3MCwiaXNzIjoic2libyIsImV4cCI6MTU0NDMxOTM3MH0.ZluaRgb0QcmFGhS2b826q9jYl2uZ-MoF_4O0JnSkE9M', NULL, '2018-12-09 09:36:10', '2018-12-02 09:36:10', NULL),
	(94, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MzkxODc2NCwiaXNzIjoic2libyIsImV4cCI6MTU0NDUyMzU2NH0.WRB3tgmTuwResjULRGD2Dv2958ie8s-gx0uKAALZlkE', NULL, '2018-12-11 18:19:25', '2018-12-04 18:19:25', NULL),
	(95, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0Mzk5ODc1MiwiaXNzIjoic2libyIsImV4cCI6MTU0NDYwMzU1Mn0.YZSOQpTF_86oXsnMcbpS326Qe5kHuI_qyaQwLUsU748', NULL, '2018-12-12 16:32:33', '2018-12-05 16:32:33', NULL),
	(96, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0Mzk5ODc2NiwiaXNzIjoic2libyIsImV4cCI6MTU0NDYwMzU2Nn0.8TR8lW0MVgSTRXcc-EshuVnKKNTwexIlhj6kkO79FSc', NULL, '2018-12-12 16:32:46', '2018-12-05 16:32:46', NULL),
	(97, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0Mzk5ODc3MCwiaXNzIjoic2libyIsImV4cCI6MTU0NDYwMzU3MH0.XH22rU2hnlqDKE7Y-MPMbXXpb-HWd-oBrkFXF1extoA', NULL, '2018-12-12 16:32:51', '2018-12-05 16:32:51', NULL),
	(98, 11, 'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0Mzk5ODc3NywiaXNzIjoic2libyIsImV4cCI6MTU0NDYwMzU3N30.HIoBkJvR-In3pdObiujVCEIVEUWEj3d0f_379HdUqL0', NULL, '2018-12-12 16:32:57', '2018-12-05 16:32:57', NULL);
/*!40000 ALTER TABLE `tb_user_token` ENABLE KEYS */;

-- 导出  表 sibo-gxy-2.tb_warning_history 结构
CREATE TABLE IF NOT EXISTS `tb_warning_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `pid` bigint(20) NOT NULL COMMENT '病人id',
  `realname` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `send_time` datetime DEFAULT NULL COMMENT '报警时间',
  `gao_ya` int(10) unsigned DEFAULT '0' COMMENT '病人高压值',
  `di_ya` int(10) unsigned DEFAULT '0' COMMENT '病人低压值',
  `xin_lv` int(10) unsigned DEFAULT '0' COMMENT '病人心率',
  `gps_ll` varchar(300) DEFAULT '0' COMMENT '经纬度',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8mb4 COMMENT='报警记录表';

-- 正在导出表  sibo-gxy-2.tb_warning_history 的数据：~21 rows (大约)
/*!40000 ALTER TABLE `tb_warning_history` DISABLE KEYS */;
INSERT INTO `tb_warning_history` (`id`, `pid`, `realname`, `send_time`, `gao_ya`, `di_ya`, `xin_lv`, `gps_ll`) VALUES
	(48, 25, '赖女士', '2018-12-06 16:25:02', 0, 0, 0, '0'),
	(49, 25, '赖女士', '2018-12-07 16:24:40', 0, 0, 0, '0'),
	(50, 25, '赖女士', '2018-12-11 16:53:42', 0, 0, 0, '0'),
	(51, 25, '赖女士', '2018-12-11 16:53:43', 0, 0, 0, '0'),
	(52, 25, '赖女士', '2018-12-11 16:53:45', 0, 0, 0, '0'),
	(53, 25, '赖女士', '2018-12-11 16:54:02', 0, 0, 0, '0'),
	(54, 25, '赖女士', '2018-12-11 17:37:25', 0, 0, 0, '0'),
	(55, 25, '赖女士', '2018-12-16 17:38:50', 0, 0, 0, '0'),
	(56, 25, '赖女士', '2018-12-16 17:38:51', 0, 0, 0, '0'),
	(57, 25, '赖女士', '2018-12-19 16:13:32', 0, 0, 0, '0'),
	(58, 25, '赖女士', '2018-12-19 16:14:28', 0, 0, 0, '0'),
	(59, 25, '赖女士', '2018-12-19 16:27:31', 0, 0, 0, '0'),
	(60, 35, '李世民', '2018-12-24 10:27:28', 0, 0, 0, '0'),
	(61, 35, '李世民', '2018-12-24 10:29:41', 0, 0, 0, '0'),
	(62, 35, '李世民', '2018-12-24 10:34:05', 0, 0, 0, '0'),
	(63, 10, '林先生', '2018-12-28 10:01:22', 0, 0, 0, '0'),
	(64, 10, '林先生', '2018-12-28 11:02:23', 0, 0, 0, '0'),
	(65, 10, '林先生', '2018-12-28 15:09:43', 183, 65, 88, '0.000000,0.000000'),
	(66, 10, '林先生', '2018-12-28 15:05:23', 183, 65, 88, '0.000000,0.000000'),
	(67, 10, '林先生', '2018-12-28 15:11:12', 183, 65, 88, '0.000000,0.000000'),
	(68, 10, '林先生', '2018-12-28 15:15:11', 183, 65, 88, '0.000000,0.000000'),
	(69, 10, '林先生', '2018-12-28 15:27:33', 183, 75, 88, '0.000000,0.000000'),
	(70, 10, '林先生', '2018-12-28 16:28:05', 183, 65, 88, '0.000000,0.000000');
/*!40000 ALTER TABLE `tb_warning_history` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
