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

-- 导出  表 sibo-iot-dev.iot_models 结构
CREATE TABLE IF NOT EXISTS `iot_models` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `model_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模型名称',
  `model_description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模型说明',
  `protocol_id` int(11) DEFAULT NULL COMMENT '协议类型',
  `user_id` int(11) DEFAULT NULL COMMENT '用户id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `model_id` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '模型id',
  `gate_way` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '网管地址',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT 'token,系统生成,唯一',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='模型表';

-- 正在导出表  sibo-iot-dev.iot_models 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `iot_models` DISABLE KEYS */;
INSERT INTO `iot_models` (`id`, `model_name`, `model_description`, `protocol_id`, `user_id`, `create_time`, `status`, `model_id`, `gate_way`, `token`) VALUES
	(1, '数据采集器', 'cccc', 1, NULL, NULL, 0, NULL, NULL, NULL),
	(2, '数据采集器2', 'eeee', 2, 103, '2019-03-22 15:23:03', 1, NULL, 'cccc', NULL);
/*!40000 ALTER TABLE `iot_models` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.iot_model_parameters 结构
CREATE TABLE IF NOT EXISTS `iot_model_parameters` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `model_id` int(11) DEFAULT NULL COMMENT '模型id',
  `parameter_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '参数名',
  `parameter_showname` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '显示名称',
  `parameter_type` int(11) DEFAULT NULL COMMENT '类型',
  `parameter_default` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '默认值',
  `parameter_unit` varchar(10) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '单位',
  `parameter_description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '说明',
  `modify_time` datetime DEFAULT NULL COMMENT '添加,修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数表';

-- 正在导出表  sibo-iot-dev.iot_model_parameters 的数据：~1 rows (大约)
/*!40000 ALTER TABLE `iot_model_parameters` DISABLE KEYS */;
INSERT INTO `iot_model_parameters` (`id`, `model_id`, `parameter_name`, `parameter_showname`, `parameter_type`, `parameter_default`, `parameter_unit`, `parameter_description`, `modify_time`) VALUES
	(1, 1, 'length', '长度', 1, '10', 'cm', NULL, NULL);
/*!40000 ALTER TABLE `iot_model_parameters` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.iot_model_rule 结构
CREATE TABLE IF NOT EXISTS `iot_model_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `model_id` int(11) DEFAULT NULL COMMENT '模型id',
  `rule_execute_order` int(11) DEFAULT NULL COMMENT '执行顺序',
  `rule_name` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则名称',
  `rule_condition` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则条件',
  `rule_do` varchar(1000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '执行动作',
  `rule_description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '规则说明',
  `rule_moditime` datetime DEFAULT NULL COMMENT '添加,修改时间',
  `approval_status` int(11) DEFAULT NULL COMMENT '审核状态',
  `approval_time` datetime DEFAULT NULL COMMENT '审核时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='规则表';

-- 正在导出表  sibo-iot-dev.iot_model_rule 的数据：~0 rows (大约)
/*!40000 ALTER TABLE `iot_model_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `iot_model_rule` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.iot_parameter_type 结构
CREATE TABLE IF NOT EXISTS `iot_parameter_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type_name` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '名称',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='参数类型表';

-- 正在导出表  sibo-iot-dev.iot_parameter_type 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `iot_parameter_type` DISABLE KEYS */;
INSERT INTO `iot_parameter_type` (`id`, `type_name`, `create_time`) VALUES
	(1, '字符型', '2019-03-21 15:31:04'),
	(3, '整型', '2019-03-21 17:43:00');
/*!40000 ALTER TABLE `iot_parameter_type` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.iot_projects 结构
CREATE TABLE IF NOT EXISTS `iot_projects` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增',
  `project_id` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目id,程序生成,唯一',
  `project_name` varchar(80) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目名称',
  `project_url` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '访问地址',
  `project_domain` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '绑定域名',
  `token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目TOKEN',
  `project_logo` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目LOGO',
  `project_description` varchar(2000) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '项目说明',
  `project_charge` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人',
  `chargetel` varchar(20) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '负责人电话',
  `chargeemail` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT ' 负责人邮箱',
  `project_status` int(11) DEFAULT NULL COMMENT '项目状态',
  `userid` int(11) DEFAULT NULL COMMENT '所属用户',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='项目表';

-- 正在导出表  sibo-iot-dev.iot_projects 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `iot_projects` DISABLE KEYS */;
INSERT INTO `iot_projects` (`id`, `project_id`, `project_name`, `project_url`, `project_domain`, `token`, `project_logo`, `project_description`, `project_charge`, `chargetel`, `chargeemail`, `project_status`, `userid`) VALUES
	(1, 'n100000001', '空调节能', 'http://www.cnsibo.com/jn', NULL, 'xxxxxx-xxxx-xxxxxx', NULL, NULL, 'czz', '111111111111111', NULL, 1, 1),
	(3, 'SO1553158198073', 'hhhhhhhhhhhhhhh', 'http://www.cnsibo.com/jn', NULL, 'eeeeeeeeeeeeeeeeeee', NULL, NULL, 'czz', '111111111111111', NULL, 0, 2);
/*!40000 ALTER TABLE `iot_projects` ENABLE KEYS */;

-- 导出  表 sibo-iot-dev.iot_protocol 结构
CREATE TABLE IF NOT EXISTS `iot_protocol` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `protocol` varchar(45) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '协议名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='协议表';

-- 正在导出表  sibo-iot-dev.iot_protocol 的数据：~2 rows (大约)
/*!40000 ALTER TABLE `iot_protocol` DISABLE KEYS */;
INSERT INTO `iot_protocol` (`id`, `protocol`) VALUES
	(1, 'TCP'),
	(2, 'xnpp');
/*!40000 ALTER TABLE `iot_protocol` ENABLE KEYS */;
