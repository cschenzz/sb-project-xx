-- --------------------------------------------------------
-- 主机:                           192.168.3.200
-- 服务器版本:                        5.7.19-log - Source distribution
-- 服务器操作系统:                      Linux
-- HeidiSQL 版本:                  9.5.0.5196
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;

-- 导出  表 sibo-iot-dev.sys_dept 结构
CREATE TABLE IF NOT EXISTS `sys_dept` (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` int(11) DEFAULT '0' COMMENT '父部门id',
  `ancestors` varchar(50) DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) DEFAULT '' COMMENT '部门名称',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `leader` varchar(20) DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `status` char(1) DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- 正在导出表  sibo-iot-dev.sys_dept 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.sys_dict_data 结构
CREATE TABLE IF NOT EXISTS `sys_dict_data` (
  `dict_code` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(4) DEFAULT '0' COMMENT '字典排序',
  `dict_label` varchar(100) DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典数据表';

-- 正在导出表  sibo-iot-dev.sys_dict_data 的数据：~26 rows (大约)
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` (`dict_code`, `dict_sort`, `dict_label`, `dict_value`, `dict_type`, `css_class`, `list_class`, `is_default`, `status`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '性别男'),
	(2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '性别女'),
	(3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '性别未知'),
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
	(26, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '停用状态');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.sys_dict_type 结构
CREATE TABLE IF NOT EXISTS `sys_dict_type` (
  `dict_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) DEFAULT '' COMMENT '字典类型',
  `status` char(1) DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`),
  UNIQUE KEY `dict_type` (`dict_type`)
) ENGINE=InnoDB AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 COMMENT='字典类型表';

-- 正在导出表  sibo-iot-dev.sys_dict_type 的数据：~9 rows (大约)
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
	(9, '系统状态', 'sys_common_status', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '登录状态列表');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.sys_log_login 结构
CREATE TABLE IF NOT EXISTS `sys_log_login` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `userid` int(11) NOT NULL COMMENT '登陆用户id',
  `login_name` varchar(50) NOT NULL DEFAULT '' COMMENT '登录账号',
  `login_ip` varchar(50) DEFAULT '' COMMENT '登录IP地址',
  `login_result` int(11) DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `message` varchar(255) DEFAULT '' COMMENT '提示消息',
  `login_time` datetime DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=144 DEFAULT CHARSET=utf8 COMMENT='系统访问记录';

-- 导出  表 sibo-iot-dev.sys_log_oper 结构
CREATE TABLE IF NOT EXISTS `sys_log_oper` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) DEFAULT '' COMMENT '模块标题',
  `business_type` int(2) DEFAULT '0' COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) DEFAULT '' COMMENT '方法名称',
  `user_id` int(11) DEFAULT NULL COMMENT '操作人员',
  `oper_url` varchar(255) DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(50) DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) DEFAULT '' COMMENT '请求参数',
  `status` int(1) DEFAULT '0' COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=196 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';

-- 导出  表 sibo-iot-dev.sys_menu 结构
CREATE TABLE IF NOT EXISTS `sys_menu` (
  `menu_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) NOT NULL COMMENT '菜单名称',
  `parent_id` int(11) DEFAULT '0' COMMENT '父菜单ID',
  `order_num` int(4) DEFAULT '0' COMMENT '显示顺序',
  `url` varchar(200) DEFAULT '#' COMMENT '请求地址',
  `menu_type` char(1) DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `perms` varchar(100) DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) DEFAULT '' COMMENT '创建者',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) DEFAULT '' COMMENT '更新者',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2050 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';

-- 正在导出表  sibo-iot-dev.sys_menu 的数据：~130 rows (大约)
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` (`menu_id`, `menu_name`, `parent_id`, `order_num`, `url`, `menu_type`, `visible`, `perms`, `icon`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '系统管理', 0, 1, '#', 'M', '1', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统管理目录'),
	(2, '系统监控', 0, 2, '#', 'M', '1', '', 'fa fa-video-camera', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统监控目录'),
	(3, '系统工具', 0, 3, '#', 'M', '1', '', 'fa fa-bars', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统工具目录'),
	(4, '系统管理', 0, 3, '#', 'M', '0', '', 'fa fa-gear', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', 'IOT管理'),
	(100, '用户管理', 4, 1, '/system/user', 'C', '0', 'system:user:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '用户管理菜单'),
	(101, '角色管理', 4, 2, '/system/role', 'C', '0', 'system:role:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '角色管理菜单'),
	(102, '菜单管理', 1, 3, '/system/menu', 'C', '0', 'system:menu:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '菜单管理菜单'),
	(103, '部门管理', 1, 4, '/system/dept', 'C', '1', 'system:dept:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-11 15:29:19', '部门管理菜单'),
	(104, '岗位管理', 1, 5, '/system/post', 'C', '1', 'system:post:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-11 15:29:06', '岗位管理菜单'),
	(105, '字典管理', 1, 6, '/system/dict', 'C', '1', 'system:dict:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-11 15:29:58', '字典管理菜单'),
	(106, '参数设置', 1, 7, '/system/config', 'C', '1', 'system:config:view', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-11 15:28:54', '参数设置菜单'),
	(107, '通知公告', 1, 8, '/system/notice', 'C', '1', 'system:notice:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '通知公告菜单'),
	(108, '日志管理', 1, 9, '#', 'M', '1', '', '#', 'admin', '2018-03-16 11:33:00', 'admin', '2019-03-11 15:28:35', '日志管理菜单'),
	(109, '在线用户', 2, 1, '/monitor/online', 'C', '0', 'monitor:online:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '在线用户菜单'),
	(110, '定时任务', 2, 2, '/monitor/job', 'C', '0', 'monitor:job:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '定时任务菜单'),
	(111, '数据监控', 2, 3, '/monitor/data', 'C', '0', 'monitor:data:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '数据监控菜单'),
	(112, '服务监控', 2, 3, '/monitor/server', 'C', '0', 'monitor:server:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '服务监控菜单'),
	(113, '表单构建', 3, 1, '/tool/build', 'C', '0', 'tool:build:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '表单构建菜单'),
	(114, '代码生成', 3, 2, '/tool/gen', 'C', '0', 'tool:gen:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '代码生成菜单'),
	(115, '系统接口', 3, 3, '/tool/swagger', 'C', '0', 'tool:swagger:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '系统接口菜单'),
	(500, '操作日志', 1, 20, '/monitor/operlog', 'C', '0', 'monitor:operlog:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '操作日志菜单'),
	(501, '登录日志', 1, 30, '/monitor/logininfor', 'C', '0', 'monitor:logininfor:view', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '登录日志菜单'),
	(1000, '用户查询', 100, 1, '#', 'F', '0', 'system:user:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1001, '用户新增', 100, 2, '#', 'F', '0', 'system:user:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1002, '用户修改', 100, 3, '#', 'F', '0', 'system:user:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1003, '用户删除', 100, 4, '#', 'F', '0', 'system:user:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1004, '用户导出', 100, 5, '#', 'F', '0', 'system:user:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1005, '用户导入', 100, 6, '#', 'F', '0', 'system:user:import', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1006, '重置密码', 100, 7, '#', 'F', '0', 'system:user:resetPwd', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1007, '角色查询', 101, 1, '#', 'F', '0', 'system:role:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1008, '角色新增', 101, 2, '#', 'F', '0', 'system:role:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1009, '角色修改', 101, 3, '#', 'F', '0', 'system:role:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1010, '角色删除', 101, 4, '#', 'F', '0', 'system:role:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1011, '角色导出', 101, 5, '#', 'F', '0', 'system:role:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1012, '菜单查询', 102, 1, '#', 'F', '0', 'system:menu:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1013, '菜单新增', 102, 2, '#', 'F', '0', 'system:menu:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1014, '菜单修改', 102, 3, '#', 'F', '0', 'system:menu:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1015, '菜单删除', 102, 4, '#', 'F', '0', 'system:menu:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1016, '部门查询', 103, 1, '#', 'F', '0', 'system:dept:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1017, '部门新增', 103, 2, '#', 'F', '0', 'system:dept:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1018, '部门修改', 103, 3, '#', 'F', '0', 'system:dept:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1019, '部门删除', 103, 4, '#', 'F', '0', 'system:dept:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1020, '岗位查询', 104, 1, '#', 'F', '0', 'system:post:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1021, '岗位新增', 104, 2, '#', 'F', '0', 'system:post:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1022, '岗位修改', 104, 3, '#', 'F', '0', 'system:post:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1023, '岗位删除', 104, 4, '#', 'F', '0', 'system:post:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1024, '岗位导出', 104, 5, '#', 'F', '0', 'system:post:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1025, '字典查询', 105, 1, '#', 'F', '0', 'system:dict:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1026, '字典新增', 105, 2, '#', 'F', '0', 'system:dict:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1027, '字典修改', 105, 3, '#', 'F', '0', 'system:dict:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1028, '字典删除', 105, 4, '#', 'F', '0', 'system:dict:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1029, '字典导出', 105, 5, '#', 'F', '0', 'system:dict:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1030, '参数查询', 106, 1, '#', 'F', '0', 'system:config:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1031, '参数新增', 106, 2, '#', 'F', '0', 'system:config:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1032, '参数修改', 106, 3, '#', 'F', '0', 'system:config:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1033, '参数删除', 106, 4, '#', 'F', '0', 'system:config:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1034, '参数导出', 106, 5, '#', 'F', '0', 'system:config:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1035, '公告查询', 107, 1, '#', 'F', '0', 'system:notice:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1036, '公告新增', 107, 2, '#', 'F', '0', 'system:notice:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1037, '公告修改', 107, 3, '#', 'F', '0', 'system:notice:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1038, '公告删除', 107, 4, '#', 'F', '0', 'system:notice:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1039, '操作查询', 500, 1, '#', 'F', '0', 'monitor:operlog:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1040, '操作删除', 500, 2, '#', 'F', '0', 'monitor:operlog:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1041, '详细信息', 500, 3, '#', 'F', '0', 'monitor:operlog:detail', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1042, '日志导出', 500, 4, '#', 'F', '0', 'monitor:operlog:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1043, '登录查询', 501, 1, '#', 'F', '0', 'monitor:logininfor:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1044, '登录删除', 501, 2, '#', 'F', '0', 'monitor:logininfor:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1045, '日志导出', 501, 3, '#', 'F', '0', 'monitor:logininfor:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1046, '在线查询', 109, 1, '#', 'F', '0', 'monitor:online:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1047, '批量强退', 109, 2, '#', 'F', '0', 'monitor:online:batchForceLogout', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1048, '单条强退', 109, 3, '#', 'F', '0', 'monitor:online:forceLogout', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1049, '任务查询', 110, 1, '#', 'F', '0', 'monitor:job:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1050, '任务新增', 110, 2, '#', 'F', '0', 'monitor:job:add', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1051, '任务修改', 110, 3, '#', 'F', '0', 'monitor:job:edit', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1052, '任务删除', 110, 4, '#', 'F', '0', 'monitor:job:remove', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1053, '状态修改', 110, 5, '#', 'F', '0', 'monitor:job:changeStatus', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1054, '任务详细', 110, 6, '#', 'F', '0', 'monitor:job:detail', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1055, '任务导出', 110, 7, '#', 'F', '0', 'monitor:job:export', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1056, '生成查询', 114, 1, '#', 'F', '0', 'tool:gen:list', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(1057, '生成代码', 114, 2, '#', 'F', '0', 'tool:gen:code', '#', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', ''),
	(2000, '角色管理', 4, 90, '/iot/role', 'C', '1', 'iot:role:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '角色菜单'),
	(2001, '角色查询', 2000, 1, '#', 'F', '0', 'iot:role:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2002, '角色新增', 2000, 2, '#', 'F', '0', 'iot:role:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2003, '角色修改', 2000, 3, '#', 'F', '0', 'iot:role:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2004, '角色删除', 2000, 4, '#', 'F', '0', 'iot:role:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2005, '登录日志', 4, 100, '/iot/logLogin', 'C', '0', 'iot:logLogin:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '系统访问记录菜单'),
	(2006, '系统访问记录查询', 2005, 1, '#', 'F', '0', 'iot:logLogin:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2007, '系统访问记录新增', 2005, 2, '#', 'F', '0', 'iot:logLogin:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2008, '系统访问记录修改', 2005, 3, '#', 'F', '0', 'iot:logLogin:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2009, '系统访问记录删除', 2005, 4, '#', 'F', '0', 'iot:logLogin:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2010, '操作日志', 4, 200, '/iot/logOper', 'C', '0', 'iot:logOper:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '操作日志记录菜单'),
	(2011, '操作日志记录查询', 2010, 1, '#', 'F', '0', 'iot:logOper:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2012, '操作日志记录新增', 2010, 2, '#', 'F', '0', 'iot:logOper:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2013, '操作日志记录修改', 2010, 3, '#', 'F', '0', 'iot:logOper:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2014, '操作日志记录删除', 2010, 4, '#', 'F', '0', 'iot:logOper:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2015, '用户管理', 4, 10, '/iot/user', 'C', '1', 'iot:user:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '用户菜单'),
	(2016, '用户查询', 2015, 1, '#', 'F', '0', 'iot:user:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2017, '用户新增', 2015, 2, '#', 'F', '0', 'iot:user:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2018, '用户修改', 2015, 3, '#', 'F', '0', 'iot:user:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2019, '用户删除', 2015, 4, '#', 'F', '0', 'iot:user:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2020, '项目管理', 4, 210, '/iot/iotProjects', 'C', '0', 'iot:iotProjects:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '项目菜单'),
	(2021, '项目查询', 2020, 1, '#', 'F', '0', 'iot:iotProjects:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2022, '项目新增', 2020, 2, '#', 'F', '0', 'iot:iotProjects:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2023, '项目修改', 2020, 3, '#', 'F', '0', 'iot:iotProjects:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2024, '项目删除', 2020, 4, '#', 'F', '0', 'iot:iotProjects:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2025, '协议管理', 4, 300, '/iot/iotProtocol', 'C', '0', 'iot:iotProtocol:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '协议菜单'),
	(2026, '协议查询', 2025, 1, '#', 'F', '0', 'iot:iotProtocol:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2027, '协议新增', 2025, 2, '#', 'F', '0', 'iot:iotProtocol:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2028, '协议修改', 2025, 3, '#', 'F', '0', 'iot:iotProtocol:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2029, '协议删除', 2025, 4, '#', 'F', '0', 'iot:iotProtocol:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2030, '参数管理', 4, 215, '/iot/iotModelParameters', 'C', '0', 'iot:iotModelParameters:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '参数菜单'),
	(2031, '参数查询', 2030, 1, '#', 'F', '0', 'iot:iotModelParameters:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2032, '参数新增', 2030, 2, '#', 'F', '0', 'iot:iotModelParameters:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2033, '参数修改', 2030, 3, '#', 'F', '0', 'iot:iotModelParameters:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2034, '参数删除', 2030, 4, '#', 'F', '0', 'iot:iotModelParameters:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2035, '参数类型', 4, 500, '/iot/iotParameterType', 'C', '0', 'iot:iotParameterType:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '参数类型菜单'),
	(2036, '参数类型查询', 2035, 1, '#', 'F', '0', 'iot:iotParameterType:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2037, '参数类型新增', 2035, 2, '#', 'F', '0', 'iot:iotParameterType:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2038, '参数类型修改', 2035, 3, '#', 'F', '0', 'iot:iotParameterType:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2039, '参数类型删除', 2035, 4, '#', 'F', '0', 'iot:iotParameterType:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2040, '模型管理', 4, 211, '/iot/iotModels', 'C', '0', 'iot:iotModels:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '模型菜单'),
	(2041, '模型查询', 2040, 1, '#', 'F', '0', 'iot:iotModels:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2042, '模型新增', 2040, 2, '#', 'F', '0', 'iot:iotModels:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2043, '模型修改', 2040, 3, '#', 'F', '0', 'iot:iotModels:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2044, '模型删除', 2040, 4, '#', 'F', '0', 'iot:iotModels:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2045, '规则管理', 4, 212, '/iot/iotModelRule', 'C', '0', 'iot:iotModelRule:view', '#', 'admin', '2018-03-01 00:00:00', 'admin', '2018-03-01 00:00:00', '规则菜单'),
	(2046, '规则查询', 2045, 1, '#', 'F', '0', 'iot:iotModelRule:list', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2047, '规则新增', 2045, 2, '#', 'F', '0', 'iot:iotModelRule:add', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2048, '规则修改', 2045, 3, '#', 'F', '0', 'iot:iotModelRule:edit', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', ''),
	(2049, '规则删除', 2045, 4, '#', 'F', '0', 'iot:iotModelRule:remove', '#', 'admin', '2018-09-01 00:00:00', 'admin', '2018-09-01 00:00:00', '');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.sys_role 结构
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
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='角色信息表';

-- 正在导出表  sibo-iot-dev.sys_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` (`role_id`, `role_name`, `role_key`, `role_sort`, `data_scope`, `status`, `del_flag`, `create_by`, `create_time`, `update_by`, `update_time`, `remark`) VALUES
	(1, '管理员', 'admin', 1, '1', '0', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '管理员'),
	(2, '普通角色', 'common', 2, '2', '0', '0', 'admin', '2018-03-16 11:33:00', 'sb', '2018-03-16 11:33:00', '普通角色');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.sys_role_menu 结构
CREATE TABLE IF NOT EXISTS `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';

-- 正在导出表  sibo-iot-dev.sys_role_menu 的数据：~79 rows (大约)
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` (`role_id`, `menu_id`) VALUES
	(2, 1),
	(2, 2),
	(2, 3),
	(2, 100),
	(2, 101),
	(2, 102),
	(2, 103),
	(2, 104),
	(2, 105),
	(2, 106),
	(2, 107),
	(2, 108),
	(2, 109),
	(2, 110),
	(2, 111),
	(2, 112),
	(2, 113),
	(2, 114),
	(2, 115),
	(2, 500),
	(2, 501),
	(2, 1000),
	(2, 1001),
	(2, 1002),
	(2, 1003),
	(2, 1004),
	(2, 1005),
	(2, 1006),
	(2, 1007),
	(2, 1008),
	(2, 1009),
	(2, 1010),
	(2, 1011),
	(2, 1012),
	(2, 1013),
	(2, 1014),
	(2, 1015),
	(2, 1016),
	(2, 1017),
	(2, 1018),
	(2, 1019),
	(2, 1020),
	(2, 1021),
	(2, 1022),
	(2, 1023),
	(2, 1024),
	(2, 1025),
	(2, 1026),
	(2, 1027),
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
	(2, 1039),
	(2, 1040),
	(2, 1041),
	(2, 1042),
	(2, 1043),
	(2, 1044),
	(2, 1045),
	(2, 1046),
	(2, 1047),
	(2, 1048),
	(2, 1049),
	(2, 1050),
	(2, 1051),
	(2, 1052),
	(2, 1053),
	(2, 1054),
	(2, 1055),
	(2, 1056),
	(2, 1057);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.sys_user 结构
CREATE TABLE IF NOT EXISTS `sys_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `name` varchar(30) NOT NULL COMMENT '登录账号',
  `password` varchar(50) DEFAULT '' COMMENT '密码',
  `salt` varchar(20) DEFAULT '' COMMENT '盐加密',
  `email` varchar(50) DEFAULT '' COMMENT '用户邮箱',
  `mobile` varchar(11) DEFAULT '' COMMENT '手机号码',
  `province` int(3) DEFAULT NULL COMMENT '省',
  `city` int(4) DEFAULT NULL COMMENT '市',
  `area` int(5) DEFAULT NULL COMMENT '县',
  `address` varchar(255) DEFAULT NULL COMMENT '地址',
  `sex` int(11) DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `realname` varchar(50) DEFAULT NULL COMMENT '真实姓名',
  `userrank` int(1) DEFAULT NULL COMMENT '用户级别',
  `regtime` datetime DEFAULT NULL COMMENT '注册时间',
  `last_logintime` datetime DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(50) DEFAULT '' COMMENT '最后登陆IP',
  `avatar` varchar(100) DEFAULT '' COMMENT '头像路径',
  `status` int(11) DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=108 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- 正在导出表  sibo-iot-dev.sys_user 的数据：~3 rows (大约)
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` (`id`, `name`, `password`, `salt`, `email`, `mobile`, `province`, `city`, `area`, `address`, `sex`, `realname`, `userrank`, `regtime`, `last_logintime`, `last_login_ip`, `avatar`, `status`, `remark`) VALUES
	(1, 'admin', '505476fa7502ee29aea4b9db5726b3cb', 'c21232', '116211148@qq.com', '13888888887', NULL, NULL, NULL, NULL, 1, NULL, NULL, '2018-09-10 11:33:00', '2019-03-23 16:19:46', '0:0:0:0:0:0:0:1', '', 0, '管理员'),
	(2, 'chenzz', '271e309d965403fe19edc90c8207160b', '7ce249', 'cs.chenzz@qq.com', '13888888888', NULL, NULL, NULL, NULL, 1, 'xxxx', NULL, '2018-03-16 11:33:00', '2018-03-16 11:33:00', '127.0.0.1', '', 0, '测试员'),
	(103, 'tim', 'ab270336790a78a6a8710703478058df', 'dcd4a8', 'cs.chenzz@qq.com', '16620846645', NULL, NULL, NULL, NULL, 0, NULL, NULL, '2019-03-18 15:11:27', '2019-03-18 15:11:41', '0:0:0:0:0:0:0:1', '', 0, '');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.sys_user_role 结构
CREATE TABLE IF NOT EXISTS `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';

-- 正在导出表  sibo-iot-dev.sys_user_role 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` (`user_id`, `role_id`) VALUES
	(1, 1),
	(2, 2);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
