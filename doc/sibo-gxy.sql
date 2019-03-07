-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: sibo-gxy-2
-- ------------------------------------------------------
-- Server version	5.5.53

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `sys_config`
--

DROP TABLE IF EXISTS `sys_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_config` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_config`
--

LOCK TABLES `sys_config` WRITE;
/*!40000 ALTER TABLE `sys_config` DISABLE KEYS */;
INSERT INTO `sys_config` VALUES (1,'主框架页-默认皮肤样式名称','sys.index.skinName','skin-default','Y','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','默认 skin-default、蓝色 skin-blue、黄色 skin-yellow'),(2,'用户管理-账号初始密码','sys.user.initPassword','88888888','Y','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','初始化密码 88888888');
/*!40000 ALTER TABLE `sys_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dept`
--

DROP TABLE IF EXISTS `sys_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dept` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dept`
--

LOCK TABLES `sys_dept` WRITE;
/*!40000 ALTER TABLE `sys_dept` DISABLE KEYS */;
INSERT INTO `sys_dept` VALUES (100,0,'0','医疗卫生部',0,'SIBO','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00'),(101,100,'0,100','南昌医院',1,'SIBO','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00'),(102,100,'0,100','九江医院',2,'zy','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-24 11:54:18'),(103,101,'0,100,101','办公室',1,'SIBO','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:37:30'),(104,101,'0,100,101','药品部',2,'SIBO','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:37:54'),(105,101,'0,100,101','住院部',3,'SIBO','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:38:13'),(106,101,'0,100,101','财务部门',4,'SIBO','15888888888','cs.chenzz@qq.com','0','2','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00'),(107,101,'0,100,101','后勤部',5,'SIBO','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:38:33'),(108,102,'0,100,102','办公室',1,'SIBO','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:38:53'),(109,102,'0,100,102','药品部',2,'SIBO','15888888888','cs.chenzz@qq.com','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:39:09');
/*!40000 ALTER TABLE `sys_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_data`
--

DROP TABLE IF EXISTS `sys_dict_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_data` (
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
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='字典数据表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_data`
--

LOCK TABLES `sys_dict_data` WRITE;
/*!40000 ALTER TABLE `sys_dict_data` DISABLE KEYS */;
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','性别女'),(3,3,'未知','2','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','性别未知'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','停用状态'),(10,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统默认是'),(11,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统默认否'),(12,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','通知'),(13,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','公告'),(14,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','正常状态'),(15,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','关闭状态'),(16,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','新增操作'),(17,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','修改操作'),(18,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','删除操作'),(19,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','授权操作'),(20,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','导出操作'),(21,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','导入操作'),(22,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','强退操作'),(23,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','生成操作'),(24,8,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','清空操作'),(25,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','正常状态'),(26,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','停用状态'),(27,1,'A型','A型','blood_type','','default','N','0','sibo-chenzz','2018-10-31 10:17:17','',NULL,'A型'),(28,2,'B型','B型','blood_type','','default','N','0','sibo-chenzz','2018-10-31 10:17:42','',NULL,'B型'),(29,3,'AB型','AB型','blood_type','','default','N','0','sibo-chenzz','2018-10-31 10:18:08','',NULL,'AB型'),(30,4,'O型','O型','blood_type','','default','N','0','sibo-chenzz','2018-10-31 10:18:32','',NULL,'O型'),(31,5,'其他','其他','blood_type','','default','Y','0','sibo-chenzz','2018-10-31 10:19:07','',NULL,'其他'),(32,1,'已婚','已婚','config_marriage','','default','N','0','sibo-chenzz','2018-10-31 18:16:42','',NULL,''),(33,2,'未婚','未婚','config_marriage','','default','N','0','sibo-chenzz','2018-10-31 18:17:04','',NULL,''),(34,1,'健康资讯','健康资讯','article_type','','default','Y','0','sibo-chenzz','2018-10-31 19:27:14','',NULL,''),(35,2,'健康小常识','健康小常识','article_type','','default','N','0','sibo-chenzz','2018-10-31 19:28:12','',NULL,'健康小常识');
/*!40000 ALTER TABLE `sys_dict_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_dict_type`
--

DROP TABLE IF EXISTS `sys_dict_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_dict_type` (
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
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='字典类型表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_dict_type`
--

LOCK TABLES `sys_dict_type` WRITE;
/*!40000 ALTER TABLE `sys_dict_type` DISABLE KEYS */;
INSERT INTO `sys_dict_type` VALUES (1,'用户性别','sys_user_sex','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','用户性别列表'),(2,'菜单状态','sys_show_hide','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','菜单状态列表'),(3,'系统开关','sys_normal_disable','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统开关列表'),(4,'任务状态','sys_job_status','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','任务状态列表'),(5,'系统是否','sys_yes_no','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统是否列表'),(6,'通知类型','sys_notice_type','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','通知类型列表'),(7,'通知状态','sys_notice_status','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','通知状态列表'),(8,'操作类型','sys_oper_type','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','操作类型列表'),(9,'系统状态','sys_common_status','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','登录状态列表'),(10,'血型','blood_type','0','sibo-chenzz','2018-10-30 16:22:10','sibo-chenzz','2018-10-30 16:57:50','血型'),(11,'婚姻','config_marriage','0','sibo-chenzz','2018-10-31 18:15:53','',NULL,''),(12,'文章类别','article_type','0','sibo-chenzz','2018-10-31 19:25:56','',NULL,'文章类别');
/*!40000 ALTER TABLE `sys_dict_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job`
--

DROP TABLE IF EXISTS `sys_job`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job`
--

LOCK TABLES `sys_job` WRITE;
/*!40000 ALTER TABLE `sys_job` DISABLE KEYS */;
INSERT INTO `sys_job` VALUES (1,'sbTask','系统默认（无参）','sbNoParams','','0/10 * * * * ?','1','1','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(2,'sbTask','系统默认（有参）','sbParams','sb','0/20 * * * * ?','1','1','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','');
/*!40000 ALTER TABLE `sys_job` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_job_log`
--

DROP TABLE IF EXISTS `sys_job_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_job_log` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_job_log`
--

LOCK TABLES `sys_job_log` WRITE;
/*!40000 ALTER TABLE `sys_job_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_job_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_logininfor`
--

DROP TABLE IF EXISTS `sys_logininfor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_logininfor` (
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统访问记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_logininfor`
--

LOCK TABLES `sys_logininfor` WRITE;
/*!40000 ALTER TABLE `sys_logininfor` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_logininfor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_menu`
--

DROP TABLE IF EXISTS `sys_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_menu` (
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
) ENGINE=InnoDB AUTO_INCREMENT=2052 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'#','M','0','','fa fa-gear','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统管理目录'),(2,'系统监控',0,2,'#','M','0','','fa fa-video-camera','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统监控目录'),(100,'用户管理',1,1,'/system/user','C','0','system:user:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','用户管理菜单'),(101,'角色管理',1,2,'/system/role','C','0','system:role:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','角色管理菜单'),(102,'菜单管理',1,3,'/system/menu','C','0','system:menu:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','菜单管理菜单'),(103,'部门管理',1,4,'/system/dept','C','0','system:dept:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','部门管理菜单'),(104,'岗位管理',1,5,'/system/post','C','0','system:post:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','岗位管理菜单'),(105,'字典管理',1,6,'/system/dict','C','0','system:dict:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','字典管理菜单'),(106,'参数设置',1,7,'/system/config','C','0','system:config:view','#','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-24 11:58:21','参数设置菜单'),(107,'通知公告',1,8,'/system/notice','C','0','system:notice:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','通知公告菜单'),(109,'在线用户',2,1,'/monitor/online','C','0','monitor:online:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','在线用户菜单'),(111,'数据监控',2,3,'/monitor/data','C','0','monitor:data:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','数据监控菜单'),(500,'操作日志',1,20,'/monitor/operlog','C','0','monitor:operlog:view','#','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-19 20:11:18','操作日志菜单'),(501,'登录日志',1,30,'/monitor/logininfor','C','0','monitor:logininfor:view','#','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-19 20:12:18','登录日志菜单'),(1000,'用户查询',100,1,'#','F','0','system:user:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1001,'用户新增',100,2,'#','F','0','system:user:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1002,'用户修改',100,3,'#','F','0','system:user:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1003,'用户删除',100,4,'#','F','0','system:user:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1004,'用户导出',100,5,'#','F','0','system:user:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1005,'重置密码',100,5,'#','F','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1006,'角色查询',101,1,'#','F','0','system:role:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1007,'角色新增',101,2,'#','F','0','system:role:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1008,'角色修改',101,3,'#','F','0','system:role:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1009,'角色删除',101,4,'#','F','0','system:role:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1010,'角色导出',101,4,'#','F','0','system:role:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1011,'菜单查询',102,1,'#','F','0','system:menu:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1012,'菜单新增',102,2,'#','F','0','system:menu:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1013,'菜单修改',102,3,'#','F','0','system:menu:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1014,'菜单删除',102,4,'#','F','0','system:menu:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1015,'部门查询',103,1,'#','F','0','system:dept:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1016,'部门新增',103,2,'#','F','0','system:dept:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1017,'部门修改',103,3,'#','F','0','system:dept:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1018,'部门删除',103,4,'#','F','0','system:dept:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1019,'岗位查询',104,1,'#','F','0','system:post:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1020,'岗位新增',104,2,'#','F','0','system:post:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1021,'岗位修改',104,3,'#','F','0','system:post:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1022,'岗位删除',104,4,'#','F','0','system:post:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1023,'岗位导出',104,4,'#','F','0','system:post:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1024,'字典查询',105,1,'#','F','0','system:dict:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1025,'字典新增',105,2,'#','F','0','system:dict:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1026,'字典修改',105,3,'#','F','0','system:dict:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1027,'字典删除',105,4,'#','F','0','system:dict:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1028,'字典导出',105,4,'#','F','0','system:dict:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1029,'参数查询',106,1,'#','F','0','system:config:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1030,'参数新增',106,2,'#','F','0','system:config:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1031,'参数修改',106,3,'#','F','0','system:config:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1032,'参数删除',106,4,'#','F','0','system:config:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1033,'参数导出',106,4,'#','F','0','system:config:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1034,'公告查询',107,1,'#','F','0','system:notice:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1035,'公告新增',107,2,'#','F','0','system:notice:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1036,'公告修改',107,3,'#','F','0','system:notice:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1037,'公告删除',107,4,'#','F','0','system:notice:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1038,'操作查询',500,1,'#','F','0','monitor:operlog:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1039,'操作删除',500,2,'#','F','0','monitor:operlog:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1040,'详细信息',500,3,'#','F','0','monitor:operlog:detail','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1041,'日志导出',500,3,'#','F','0','monitor:operlog:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1042,'登录查询',501,1,'#','F','0','monitor:logininfor:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1043,'登录删除',501,2,'#','F','0','monitor:logininfor:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1044,'日志导出',501,2,'#','F','0','monitor:logininfor:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1045,'在线查询',109,1,'#','F','0','monitor:online:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1046,'批量强退',109,2,'#','F','0','monitor:online:batchForceLogout','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1047,'单条强退',109,3,'#','F','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(2000,'医院医生',0,20,'#','M','0','','fa fa-bank','sibo-chenzz','2018-10-19 20:20:24','',NULL,''),(2001,'患者咨询',0,30,'#','M','0','','fa fa-address-card-o','sibo-chenzz','2018-10-19 20:21:21','sibo-chenzz','2018-10-26 17:35:36',''),(2004,'健康资讯',0,40,'#','M','0','','fa fa-cutlery','sibo-chenzz','2018-10-19 20:56:03','',NULL,''),(2012,'患者管理',2001,1,'/yl/patientUser','C','0','yl:patientUser:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-20 15:09:36','用户(相当于患者),针对前台app类用户菜单'),(2013,'用户查询',2012,1,'#','F','0','yl:patientUser:list','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 10:58:52',''),(2014,'用户新增',2012,2,'#','F','0','yl:patientUser:add','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 10:59:04',''),(2015,'用户修改',2012,3,'#','F','0','yl:patientUser:edit','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 11:02:15',''),(2016,'用户删除',2012,4,'#','F','0','yl:patientUser:remove','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 11:02:27',''),(2017,'资讯文章',2004,1,'/yl/article','C','0','yl:article:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-21 14:01:21','文章菜单'),(2018,'文章查询',2017,1,'#','F','0','yl:article:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2019,'文章新增',2017,2,'#','F','0','yl:article:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2020,'文章修改',2017,3,'#','F','0','yl:article:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2021,'文章删除',2017,4,'#','F','0','yl:article:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2022,'医院管理',2000,1,'/yl/hospital','C','0','yl:hospital:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-22 18:08:08','医院菜单'),(2023,'医院查询',2022,1,'#','F','0','yl:hospital:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2024,'医院新增',2022,2,'#','F','0','yl:hospital:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2025,'医院修改',2022,3,'#','F','0','yl:hospital:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2026,'医院删除',2022,4,'#','F','0','yl:hospital:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2027,'医生管理',2000,10,'/yl/doctor','C','0','yl:doctor:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 19:17:57','医生菜单'),(2028,'医生查询',2027,1,'#','F','0','yl:doctor:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2029,'医生新增',2027,2,'#','F','0','yl:doctor:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2030,'医生修改',2027,3,'#','F','0','yl:doctor:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2031,'医生删除',2027,4,'#','F','0','yl:doctor:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2032,'消息管理',2004,10,'/yl/message','C','0','yl:message:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 17:01:05','消息菜单'),(2033,'消息查询',2032,1,'#','F','0','yl:message:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2034,'消息新增',2032,2,'#','F','0','yl:message:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2035,'消息修改',2032,3,'#','F','0','yl:message:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2036,'消息删除',2032,4,'#','F','0','yl:message:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2037,'咨询回复',2001,40,'/yl/askReply','C','1','yl:askReply:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-11-01 19:01:42','咨询建议菜单'),(2038,'回复查询',2037,1,'#','F','0','yl:askReply:list','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:28:32',''),(2039,'回复新增',2037,2,'#','F','0','yl:askReply:add','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:28:52',''),(2040,'回复修改',2037,3,'#','F','0','yl:askReply:edit','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:29:11',''),(2041,'回复删除',2037,4,'#','F','0','yl:askReply:remove','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:29:28',''),(2042,'咨询建议',2001,30,'/yl/ask','C','0','yl:ask:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:30:28','咨询菜单'),(2043,'咨询查询',2042,1,'#','F','0','yl:ask:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2044,'咨询新增',2042,2,'#','F','0','yl:ask:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2045,'咨询修改',2042,3,'#','F','0','yl:ask:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2046,'咨询删除',2042,4,'#','F','0','yl:ask:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2047,'病人亲友',2001,5,'/yl/friend','C','0','yl:friend:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-11-01 16:37:27','病人亲友菜单'),(2048,'病人亲友查询',2047,1,'#','F','0','yl:friend:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2049,'病人亲友新增',2047,2,'#','F','0','yl:friend:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2050,'病人亲友修改',2047,3,'#','F','0','yl:friend:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2051,'病人亲友删除',2047,4,'#','F','0','yl:friend:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','');
/*!40000 ALTER TABLE `sys_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_notice`
--

DROP TABLE IF EXISTS `sys_notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_notice` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_notice`
--

LOCK TABLES `sys_notice` WRITE;
/*!40000 ALTER TABLE `sys_notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `sys_notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_oper_log`
--

DROP TABLE IF EXISTS `sys_oper_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_oper_log` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'操作日志',9,'com.sibo.project.monitor.operlog.controller.OperlogController.clean()',1,'sibo-chenzz','办公室','/monitor/operlog/clean','127.0.0.1','内网IP','{}',0,NULL,'2018-11-01 21:46:31'),(2,'登陆日志',9,'com.sibo.project.monitor.logininfor.controller.LogininforController.clean()',1,'sibo-chenzz','办公室','/monitor/logininfor/clean','127.0.0.1','内网IP','{}',0,NULL,'2018-11-01 21:46:50');
/*!40000 ALTER TABLE `sys_oper_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_post`
--

DROP TABLE IF EXISTS `sys_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_post` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_post`
--

LOCK TABLES `sys_post` WRITE;
/*!40000 ALTER TABLE `sys_post` DISABLE KEYS */;
INSERT INTO `sys_post` VALUES (1,'administrator','管理员',1,'0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:41:55',''),(2,'president','院长',2,'0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:42:09',''),(3,'chairman','主任',3,'0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:42:55',''),(4,'user','普通办公人员',4,'0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-31 11:43:25','');
/*!40000 ALTER TABLE `sys_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role`
--

DROP TABLE IF EXISTS `sys_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role`
--

LOCK TABLES `sys_role` WRITE;
/*!40000 ALTER TABLE `sys_role` DISABLE KEYS */;
INSERT INTO `sys_role` VALUES (1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-19 20:35:00','管理员'),(2,'普通角色','common',2,'2','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-27 15:19:11','普通角色'),(3,'医院管理员','hospital-admin',3,'2','0','0','sibo-chenzz','2018-10-23 17:07:20','sibo-chenzz','2018-10-26 14:42:14',''),(4,'医院医生','doctor',4,'1','0','0','sibo-chenzz','2018-10-23 17:08:45','',NULL,''),(5,'项目监测功能组','project-monitor',5,'1','0','0','sibo-chenzz','2018-10-23 17:12:17','',NULL,'');
/*!40000 ALTER TABLE `sys_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_dept`
--

DROP TABLE IF EXISTS `sys_role_dept`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_dept` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `dept_id` int(11) NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`,`dept_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和部门关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_dept`
--

LOCK TABLES `sys_role_dept` WRITE;
/*!40000 ALTER TABLE `sys_role_dept` DISABLE KEYS */;
INSERT INTO `sys_role_dept` VALUES (2,100),(2,101),(2,105),(3,100),(3,102),(3,109);
/*!40000 ALTER TABLE `sys_role_dept` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_role_menu`
--

DROP TABLE IF EXISTS `sys_role_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_role_menu` (
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  `menu_id` int(11) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`,`menu_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色和菜单关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_role_menu`
--

LOCK TABLES `sys_role_menu` WRITE;
/*!40000 ALTER TABLE `sys_role_menu` DISABLE KEYS */;
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,105),(2,106),(2,107),(2,109),(2,111),(2,500),(2,501),(2,1024),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1040),(2,1041),(2,1042),(2,1044),(2,1045),(2,2000),(2,2001),(2,2004),(2,2012),(2,2013),(2,2014),(2,2015),(2,2016),(2,2017),(2,2018),(2,2019),(2,2020),(2,2021),(2,2022),(2,2023),(2,2024),(2,2025),(2,2026),(2,2027),(2,2028),(2,2029),(2,2030),(2,2031),(2,2032),(2,2033),(2,2034),(2,2035),(2,2036),(2,2037),(2,2038),(2,2039),(2,2040),(2,2041),(2,2042),(2,2043),(2,2044),(2,2045),(2,2046),(3,2000),(3,2001),(3,2004),(3,2012),(3,2013),(3,2014),(3,2015),(3,2016),(3,2017),(3,2018),(3,2019),(3,2020),(3,2021),(3,2022),(3,2023),(3,2024),(3,2025),(3,2027),(3,2028),(3,2029),(3,2030),(3,2031),(3,2032),(3,2033),(3,2034),(3,2035),(3,2036),(4,2001),(4,2004),(4,2012),(4,2013),(4,2014),(4,2015),(4,2016),(4,2017),(4,2018),(4,2019),(4,2020),(4,2021),(4,2032),(4,2033),(4,2034),(4,2035),(4,2036),(5,1),(5,103),(5,107),(5,500),(5,501),(5,1015),(5,1034),(5,1038),(5,1040),(5,1041),(5,1042),(5,1044),(5,2000),(5,2001),(5,2004),(5,2012),(5,2013),(5,2017),(5,2018),(5,2022),(5,2023),(5,2027),(5,2028),(5,2032),(5,2033);
/*!40000 ALTER TABLE `sys_role_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user`
--

DROP TABLE IF EXISTS `sys_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user` (
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'sibo-chenzz','SIBO','00','116211148@qq.com','13888888888','0','0a46930e695175d049ec64820be54982.jpg','2d6215056301788ba3b0c7cc02217b20','3bc391','0','0','127.0.0.1','2018-11-01 21:12:50','admin','2018-09-10 11:33:00','sb','2018-11-01 21:12:50','管理员'),(2,105,'admin','SIBO','00','cs.chenzz@qq.com','15170707553','1','','3f794667b83a0eb0d839b06c778036cb','7a1eb0','0','0','127.0.0.1','2018-10-31 19:47:16','admin','2018-03-16 11:33:00','sb','2018-10-31 19:47:16','测试员'),(3,107,'sibo5','监测用户','00','aaaaa@qq.com','13800138000','0','','bc34ab2ceb40cc55a57d102519992f6f','1ccb08','0','0','127.0.0.1','2018-10-23 17:14:39','sibo-chenzz','2018-10-23 17:14:27','','2018-10-23 17:14:43',''),(4,108,'sibo3','医院管理员','00','aaa@qq.com','13800138001','0','','bdf3dfe318b9cb3579d5c1e89f12c341','8141c2','0','0','127.0.0.1','2018-10-23 19:59:11','sibo-chenzz','2018-10-23 17:51:26','','2018-10-23 19:59:13',''),(5,108,'sibo555','医院管理员','00','cs.chenzz@qq.com','13800138000','0','','aebdd058450accfffc556ac8ab4f4589','1eaa5e','0','0','127.0.0.1','2018-10-26 14:42:32','admin','2018-10-26 11:45:38','','2018-10-26 14:42:33',''),(6,100,'sibo444','医院管理员','00','cs.chenzzz@qq.com','13800138002','0','','4fba57d9e4e50c7fbac4f0a7d8fe51f0','9fde43','0','0','127.0.0.1','2018-10-26 12:00:13','admin','2018-10-26 11:59:23','','2018-10-26 12:00:17','医院管理员,sibo444'),(8,100,'ys5','医院医生','00','aaaa@qq.com','13800138005','0','','0aaf8c4f84135437b6b8ac4c72a51293','3de90b','0','0','127.0.0.1','2018-10-26 14:57:20','admin','2018-10-26 14:56:33','','2018-10-26 14:57:21','医院医生,ys5'),(10,100,'doctor','医院医生','00','691484729','12','0','','5dd7026790c74a116643703098d90256','163bca','0','0','',NULL,'sibo-chenzz','2018-11-01 12:03:06','',NULL,'医院医生,doctor');
/*!40000 ALTER TABLE `sys_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_online`
--

DROP TABLE IF EXISTS `sys_user_online`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_online` (
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_online`
--

LOCK TABLES `sys_user_online` WRITE;
/*!40000 ALTER TABLE `sys_user_online` DISABLE KEYS */;
INSERT INTO `sys_user_online` VALUES ('dad28453-c10c-44fc-8adc-baf5bbd7642c','sibo-chenzz','办公室','127.0.0.1','内网IP','Chrome','Windows 10','on_line','2018-11-01 21:12:45','2018-11-01 21:46:31',1800000);
/*!40000 ALTER TABLE `sys_user_online` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_post`
--

DROP TABLE IF EXISTS `sys_user_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_post` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `post_id` int(11) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`,`post_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户与岗位关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_post`
--

LOCK TABLES `sys_user_post` WRITE;
/*!40000 ALTER TABLE `sys_user_post` DISABLE KEYS */;
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(3,4),(4,4),(5,4),(6,4),(8,4),(10,4);
/*!40000 ALTER TABLE `sys_user_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sys_user_role`
--

DROP TABLE IF EXISTS `sys_user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sys_user_role` (
  `user_id` int(11) NOT NULL COMMENT '用户ID',
  `role_id` int(11) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和角色关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user_role`
--

LOCK TABLES `sys_user_role` WRITE;
/*!40000 ALTER TABLE `sys_user_role` DISABLE KEYS */;
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,5),(4,3),(5,3),(6,3),(8,4),(10,4);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_article`
--

DROP TABLE IF EXISTS `tb_article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_article` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='文章表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_article`
--

LOCK TABLES `tb_article` WRITE;
/*!40000 ALTER TABLE `tb_article` DISABLE KEYS */;
INSERT INTO `tb_article` VALUES (8,'高血压分类',NULL,'<div class=\"para\" label-module=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">1.原发性高血压</span></div><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">是一种以血压升高为主要临床表现而病因尚未明确的独立疾病，占所有高血压患者的90%以上。<span style=\"font-weight: 700;\"></span></div><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">2.继发性高血压</span></div><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。</div>','2018-10-30 15:28:00','2018-11-01 21:13:22','高血压',2,1,'健康小常识'),(9,'高血压分类',NULL,'<p>xxxxxxxxx</p>','2018-10-31 20:03:57',NULL,NULL,1,NULL,'健康资讯');
/*!40000 ALTER TABLE `tb_article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ask`
--

DROP TABLE IF EXISTS `tb_ask`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ask` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(450) NOT NULL COMMENT '标题',
  `html_context` longtext COMMENT '咨询内容',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `tag` varchar(450) DEFAULT NULL COMMENT '标签',
  `add_user_id` int(11) DEFAULT NULL COMMENT '添加用户id',
  `update_user_id` int(11) DEFAULT NULL COMMENT '修改用户id',
  `type_key` varchar(80) DEFAULT NULL COMMENT '类别关键字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ask`
--

LOCK TABLES `tb_ask` WRITE;
/*!40000 ALTER TABLE `tb_ask` DISABLE KEYS */;
INSERT INTO `tb_ask` VALUES (1,'高血压要注意些什么?','继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。\r\n    继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。','2018-10-08 00:00:00','2018-11-01 16:01:44',NULL,NULL,1,'高血压'),(2,'继发性高血压 ','继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。','2018-11-01 16:03:15',NULL,NULL,1,NULL,NULL),(3,'2.继发性高血压 ','2继发性高血压 \r\n2继发性高血压 2继发性高血压 ','2018-11-01 16:12:55',NULL,NULL,1,NULL,NULL),(4,'3继发性高血压 ','3继发性高血压 \r\n3继发性高血压 \r\n3继发性高血压 ','2018-11-01 16:13:19',NULL,NULL,1,NULL,NULL);
/*!40000 ALTER TABLE `tb_ask` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_ask_reply`
--

DROP TABLE IF EXISTS `tb_ask_reply`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_ask_reply` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `ask_id` bigint(20) DEFAULT NULL COMMENT '咨询记录id',
  `html_context` longtext COMMENT '回复内容',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `add_user_id` int(11) DEFAULT NULL COMMENT '添加用户id',
  `update_user_id` int(11) DEFAULT NULL COMMENT '修改用户id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='咨询回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ask_reply`
--

LOCK TABLES `tb_ask_reply` WRITE;
/*!40000 ALTER TABLE `tb_ask_reply` DISABLE KEYS */;
/*!40000 ALTER TABLE `tb_ask_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_doctor`
--

DROP TABLE IF EXISTS `tb_doctor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_doctor` (
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='医生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_doctor`
--

LOCK TABLES `tb_doctor` WRITE;
/*!40000 ALTER TABLE `tb_doctor` DISABLE KEYS */;
INSERT INTO `tb_doctor` VALUES (1,8,8,'陈鹏','外科主任','外科',0,'2018-10-15 00:00:00',168,NULL,NULL,'2','2018-10-26 14:56:33','',NULL,''),(2,10,0,'doctor',NULL,NULL,0,NULL,NULL,NULL,NULL,'1','2018-11-01 12:03:06','',NULL,'');
/*!40000 ALTER TABLE `tb_doctor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_friend`
--

DROP TABLE IF EXISTS `tb_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_friend` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` bigint(20) NOT NULL COMMENT '病人用户id',
  `name` varchar(450) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '亲友姓名',
  `relation` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '关系',
  `birthday` datetime DEFAULT NULL COMMENT '生日',
  `telephone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '电话',
  `organization` varchar(200) COLLATE utf8mb4_unicode_ci DEFAULT NULL COMMENT '组织单位',
  `remark` longtext COLLATE utf8mb4_unicode_ci COMMENT '其他备注',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci COMMENT='病人亲友表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_friend`
--

LOCK TABLES `tb_friend` WRITE;
/*!40000 ALTER TABLE `tb_friend` DISABLE KEYS */;
INSERT INTO `tb_friend` VALUES (2,9,'猪八戒','儿子','2000-06-25 00:00:00','1380000000','天宫','高老庄上门女婿');
/*!40000 ALTER TABLE `tb_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_hospital`
--

DROP TABLE IF EXISTS `tb_hospital`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_hospital` (
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
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COMMENT='医院表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hospital`
--

LOCK TABLES `tb_hospital` WRITE;
/*!40000 ALTER TABLE `tb_hospital` DISABLE KEYS */;
INSERT INTO `tb_hospital` VALUES (7,5,'江西中医药','江西南昌','中医药','',NULL,'',NULL,''),(8,1,'江西第一人民医院','南昌','综合性医院','2','2018-10-26 11:45:34','',NULL,''),(9,6,'江西第二人民医院','江西南昌XX街道','综合性医院','2','2018-10-26 11:59:19','',NULL,'he he');
/*!40000 ALTER TABLE `tb_hospital` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_message`
--

DROP TABLE IF EXISTS `tb_message`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `send_userid` bigint(20) DEFAULT NULL COMMENT '发送用户id',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `content` longtext COMMENT '消息内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COMMENT='消息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message`
--

LOCK TABLES `tb_message` WRITE;
/*!40000 ALTER TABLE `tb_message` DISABLE KEYS */;
INSERT INTO `tb_message` VALUES (19,2,'2018-10-30 13:15:47','<p>this is test message</p>');
/*!40000 ALTER TABLE `tb_message` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_mobile_code`
--

DROP TABLE IF EXISTS `tb_mobile_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_mobile_code` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `uuid` varchar(45) NOT NULL,
  `mobile` varchar(20) NOT NULL COMMENT '手机号',
  `code` varchar(255) NOT NULL COMMENT '验证码,再次发送时更新记录,并更新时间',
  `date` datetime NOT NULL COMMENT '生成时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='手机发送验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mobile_code`
--

LOCK TABLES `tb_mobile_code` WRITE;
/*!40000 ALTER TABLE `tb_mobile_code` DISABLE KEYS */;
INSERT INTO `tb_mobile_code` VALUES (10,'6b765013-c8bf-41a8-ab02-d04d4fd1a1a8','13800000000','178990','2018-10-31 16:31:07'),(11,'928a80d4-633c-41b7-bf4a-dafb44fbccea','13800000008','808975','2018-10-23 18:20:18'),(12,'67028064-85a8-4ca4-af20-c05eafe095fd','1380000000','610231','2018-10-23 20:06:46'),(13,'a22b3457-6990-4213-8eeb-7ad6b8bc9327','111','305981','2018-11-01 15:17:48'),(14,'231ec052-1f19-4b53-a46d-0b59c06683d0','11333338000','950424','2018-10-26 09:24:36'),(15,'91fc24ef-dbc3-4fb4-bccd-45597b912772','1355','903891','2018-10-26 19:23:58'),(16,'4a1d6e7f-7574-4874-881e-5586fd0997a6','13555','632020','2018-10-27 10:13:03'),(17,'3156b14d-0373-4b6c-b4a0-48e3404a9fb4','13666','469082','2018-10-29 09:30:21'),(18,'95fcdc30-fe8c-4c4a-aacd-b365fe53960a','11','847231','2018-10-31 10:03:18'),(19,'35782007-f42a-48a9-9014-ef16c094c841','15170707553','794840','2018-10-31 11:23:49');
/*!40000 ALTER TABLE `tb_mobile_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_patient_user`
--

DROP TABLE IF EXISTS `tb_patient_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_patient_user` (
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
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  0：禁用   1：正常',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `last_logintime` datetime DEFAULT NULL COMMENT '最后登陆时间',
  `avatar` varchar(245) DEFAULT NULL COMMENT '头像',
  `sex` tinyint(4) DEFAULT NULL COMMENT '性别  1：男   2：女',
  `realname` varchar(60) DEFAULT NULL COMMENT '用户真实名',
  `register_type` int(11) DEFAULT NULL COMMENT '用户首次注册时的类型,如1.手机号,2.email,3.qq,4.微信等',
  `height` int(11) DEFAULT NULL COMMENT '身高(cm)',
  `weight` int(11) DEFAULT NULL COMMENT '体重(kg)',
  `birthday` datetime DEFAULT NULL COMMENT '出生年月',
  `blood_type` char(10) DEFAULT NULL COMMENT '血型',
  `job` varchar(205) DEFAULT NULL COMMENT '职业',
  `marriage` varchar(45) DEFAULT NULL COMMENT '婚姻,已婚,未婚',
  `allergic_substance` varchar(245) DEFAULT NULL COMMENT '过敏物质',
  `drug_allergy` varchar(245) DEFAULT NULL COMMENT '药物过敏史',
  `smoke` varchar(245) DEFAULT NULL COMMENT '吸烟状况',
  `drinking_frequency` varchar(245) DEFAULT NULL COMMENT '饮酒频率',
  `exercise_frequency` varchar(245) DEFAULT NULL COMMENT '锻炼频率',
  `history_disease` varchar(245) DEFAULT NULL COMMENT '疾病史',
  `time_illness` varchar(245) DEFAULT NULL COMMENT '患病时间',
  `other_diseases` varchar(245) DEFAULT NULL COMMENT '其他疾病',
  `other_time_illness` varchar(245) DEFAULT NULL COMMENT '其他疾病患病时间',
  `major_surgical_history` varchar(245) DEFAULT NULL COMMENT '重大手术史',
  `doctor_id` bigint(20) DEFAULT NULL COMMENT '医生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户表(相当于患者表),针对前台app类用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_patient_user`
--

LOCK TABLES `tb_patient_user` WRITE;
/*!40000 ALTER TABLE `tb_patient_user` DISABLE KEYS */;
INSERT INTO `tb_patient_user` VALUES (9,'55437810-bf67-4274-9c56-04a29d7b0e95','10000',NULL,NULL,'张先生',NULL,NULL,NULL,'13800000000',1,'2018-10-20 17:17:08','2018-10-31 16:31:16','20181020_17233626509_1540027420009.JPEG',1,'张果老',1,170,66,'2010-10-24 00:00:00','AB型','个体工商户','已婚','无',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,2),(10,'31918ce0-6b43-4da5-815d-e2a29db28c2e','10000',NULL,NULL,NULL,NULL,NULL,NULL,'13800000008',1,'2018-10-23 18:20:25','2018-10-23 18:20:25',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(11,'75803a4d-a796-46bc-ad87-5ba62fa64f11','10000',NULL,NULL,NULL,NULL,NULL,NULL,'1380000000',1,'2018-10-23 20:07:01','2018-10-23 20:07:01',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(12,'4d5a5784-20bb-4772-b72b-12dfd116791e','10000',NULL,NULL,NULL,NULL,NULL,NULL,'111',1,'2018-10-25 10:01:08','2018-11-01 15:17:53',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(13,'beb854ff-3a81-4ab2-9dc2-4dc992d23ef0','10000',NULL,NULL,NULL,NULL,NULL,NULL,'11333338000',1,'2018-10-26 09:24:43','2018-10-26 09:24:43',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(14,'b255e66d-d7bf-4fd6-adc8-66b6036a6eee','10000',NULL,NULL,NULL,NULL,NULL,NULL,'1355',1,'2018-10-26 19:24:05','2018-10-26 19:24:05',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(15,'04745c9e-3dd8-4466-b1a0-8cafb3456b09','10000',NULL,NULL,NULL,NULL,NULL,NULL,'13555',1,'2018-10-27 10:13:08','2018-10-27 10:13:08',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(16,'edb2a5a0-2052-42fb-8b26-90d5a92bc58f','10000',NULL,NULL,NULL,NULL,NULL,NULL,'13666',1,'2018-10-29 09:30:27','2018-10-29 09:30:27',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1),(17,'0641d574-10fc-4ce7-b571-ed7f3a277b43','10000',NULL,NULL,NULL,NULL,NULL,NULL,'15170707553',1,'2018-10-31 10:30:37','2018-10-31 11:23:57',NULL,NULL,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `tb_patient_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_token`
--

DROP TABLE IF EXISTS `tb_user_token`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_token` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `user___id` int(11) NOT NULL COMMENT '关联user表的主键id,关联例外表用3个_连接对应字段',
  `token` varchar(1000) NOT NULL COMMENT '每次登陆生成的token',
  `sign` varchar(60) DEFAULT NULL COMMENT '签名',
  `valid_time` datetime DEFAULT NULL COMMENT '有效时间',
  `create_time` datetime DEFAULT NULL,
  `update_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8mb4 COMMENT='针对移动端App的token验证表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_token`
--

LOCK TABLES `tb_user_token` WRITE;
/*!40000 ALTER TABLE `tb_user_token` DISABLE KEYS */;
INSERT INTO `tb_user_token` VALUES (31,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMDI3MTk1LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA2MzE5OTV9.yzYwHmN60UZDaxeqMZ1fMu8TKiGOyxDJgt97RsHiAzA',NULL,'2018-10-27 17:19:56','2018-10-20 17:19:56',NULL),(33,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MDI5NjQyMSwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQwOTAxMjIxfQ.O1Iwvz0uMj4EqTTUwCcRWWTqdgfP5BSeT1d3PK83EoM',NULL,'2018-10-30 20:07:01','2018-10-23 20:07:01',NULL),(34,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzQ3NjQzLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NTI0NDN9.wu8uSRSUK3uiOAbjXM0Zw4BanMzS05MO6TyqNMXXFGc',NULL,'2018-10-31 10:20:44','2018-10-24 10:20:44',NULL),(35,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzQ5NTI0LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NTQzMjR9.ejd2EJ4LgCguNvyGL1yiQfRqnmiIYbaNeBjRi_A10uI',NULL,'2018-10-31 10:52:04','2018-10-24 10:52:04',NULL),(36,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzY3OTQyLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NzI3NDJ9.sxZ01BAIcNTttcsHJrhaEcUiwAlpDp4gJJjae8h8CG8',NULL,'2018-10-31 15:59:02','2018-10-24 15:59:02',NULL),(37,12,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDQzMjg2OCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMDM3NjY4fQ.Qq9e0EfBDGULWUHv8zDJPQz35czOptifPoy0DYtSswA',NULL,'2018-11-01 10:01:09','2018-10-25 10:01:09',NULL),(38,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNDM3Njk1LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEwNDI0OTV9.wJaeLEinOjE0LhirXVD73SLxzCNnCKS02861AOYS-vI',NULL,'2018-11-01 11:21:36','2018-10-25 11:21:36',NULL),(40,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNTQzMDg3LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDExNDc4ODd9.PDTusfFSgYRVKEKXPwgzHhKV1mTuYUaoVMERXH6fcbA',NULL,'2018-11-02 16:38:07','2018-10-26 16:38:07',NULL),(41,14,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxNCIsImlhdCI6MTU0MDU1MzA0NCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMTU3ODQ0fQ.991wYlcnXpmxf9SrG_RIHD3BwVDvPmMOkOVmN2U0z9E',NULL,'2018-11-02 19:24:05','2018-10-26 19:24:05',NULL),(43,12,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDYwODUzOCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMjEzMzM4fQ.YxBBuvVu5a0fkjFCgzblHN1wyVLAfcjhlQ0eou8x7sI',NULL,'2018-11-03 10:48:59','2018-10-27 10:48:59',NULL),(44,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNjExMTU5LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEyMTU5NTl9.U_AsdF2J2Hgon_FG9yCW6XX3b_FApFZ2m0IjGgGANLE',NULL,'2018-11-03 11:32:40','2018-10-27 11:32:40',NULL),(45,16,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxNiIsImlhdCI6MTU0MDc3NjYyNiwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMzgxNDI2fQ.Py22X-wSq_weKpb0snmNHjlzMgGetV0fah5ecwIfpVI',NULL,'2018-11-05 09:30:27','2018-10-29 09:30:27',NULL),(46,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNzc4NTc4LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEzODMzNzh9.iBLP1s2GmKjdk_7gNygfooQerlLIlXHhSAQrFa0ve4o',NULL,'2018-11-05 10:02:58','2018-10-29 10:02:58',NULL),(47,12,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDk1MTQxMiwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxNTU2MjEyfQ.2_inhKehe_sj-zW0LGxLAu0Z8QVYR118ArRSuFz_fis',NULL,'2018-11-07 10:03:33','2018-10-31 10:03:33',NULL),(51,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwOTcxMTM5LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE1NzU5Mzl9.AKV_aNiVQhgCqe-Egd8AF3yT2VgKzvn8hYbIAB0ELdM',NULL,'2018-11-07 15:32:20','2018-10-31 15:32:20',NULL),(52,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwOTc0Njc2LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE1Nzk0NzZ9.GQPM4TwJEy4iu5bOBRqTCDSjK2bcW0k8JV0ygeOwoFo',NULL,'2018-11-07 16:31:16','2018-10-31 16:31:16',NULL),(53,12,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MTA1NjY3Mywic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxNjYxNDczfQ.rWOUoa4MAGPFSlFy5lV-5NRAUmVzc2-YX8H7xpZJYyg',NULL,'2018-11-08 15:17:53','2018-11-01 15:17:53',NULL);
/*!40000 ALTER TABLE `tb_user_token` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-01 21:48:19
