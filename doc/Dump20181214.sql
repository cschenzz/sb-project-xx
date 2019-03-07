-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 192.168.3.126    Database: sibo-gxy-2
-- ------------------------------------------------------
-- Server version	5.7.17-log

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
INSERT INTO `sys_dict_data` VALUES (1,1,'男','0','sys_user_sex','','','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','性别男'),(2,2,'女','1','sys_user_sex','','','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','性别女'),(4,1,'显示','0','sys_show_hide','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','显示菜单'),(5,2,'隐藏','1','sys_show_hide','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','隐藏菜单'),(6,1,'正常','0','sys_normal_disable','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','正常状态'),(7,2,'停用','1','sys_normal_disable','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','停用状态'),(8,1,'正常','0','sys_job_status','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','正常状态'),(9,2,'暂停','1','sys_job_status','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','停用状态'),(10,1,'是','Y','sys_yes_no','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统默认是'),(11,2,'否','N','sys_yes_no','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统默认否'),(12,1,'通知','1','sys_notice_type','','warning','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','通知'),(13,2,'公告','2','sys_notice_type','','success','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','公告'),(14,1,'正常','0','sys_notice_status','','primary','Y','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','正常状态'),(15,2,'关闭','1','sys_notice_status','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','关闭状态'),(16,1,'新增','1','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','新增操作'),(17,2,'修改','2','sys_oper_type','','info','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','修改操作'),(18,3,'删除','3','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','删除操作'),(19,4,'授权','4','sys_oper_type','','primary','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','授权操作'),(20,5,'导出','5','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','导出操作'),(21,6,'导入','6','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','导入操作'),(22,7,'强退','7','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','强退操作'),(23,8,'生成代码','8','sys_oper_type','','warning','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','生成操作'),(24,8,'清空数据','9','sys_oper_type','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','清空操作'),(25,1,'成功','0','sys_common_status','','primary','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','正常状态'),(26,2,'失败','1','sys_common_status','','danger','N','0','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','停用状态'),(27,1,'A型','A型','blood_type','','default','N','0','sibo-chenzz','2018-10-31 10:17:17','',NULL,'A型'),(28,2,'B型','B型','blood_type','','default','N','0','sibo-chenzz','2018-10-31 10:17:42','',NULL,'B型'),(29,3,'AB型','AB型','blood_type','','default','N','0','sibo-chenzz','2018-10-31 10:18:08','',NULL,'AB型'),(30,4,'O型','O型','blood_type','','default','N','0','sibo-chenzz','2018-10-31 10:18:32','',NULL,'O型'),(32,1,'已婚','已婚','config_marriage','','default','N','0','sibo-chenzz','2018-10-31 18:16:42','',NULL,''),(33,2,'未婚','未婚','config_marriage','','default','N','0','sibo-chenzz','2018-10-31 18:17:04','',NULL,''),(34,1,'健康资讯','健康资讯','article_type','','default','Y','0','sibo-chenzz','2018-10-31 19:27:14','',NULL,''),(35,2,'健康小常识','健康小常识','article_type','','default','N','0','sibo-chenzz','2018-10-31 19:28:12','',NULL,'健康小常识');
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
) ENGINE=InnoDB AUTO_INCREMENT=2083 DEFAULT CHARSET=utf8 COMMENT='菜单权限表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_menu`
--

LOCK TABLES `sys_menu` WRITE;
/*!40000 ALTER TABLE `sys_menu` DISABLE KEYS */;
INSERT INTO `sys_menu` VALUES (1,'系统管理',0,1,'#','M','0','','fa fa-gear','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统管理目录'),(2,'系统监控',0,2,'#','M','0','','fa fa-video-camera','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','系统监控目录'),(100,'用户管理',1,1,'/system/user','C','0','system:user:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','用户管理菜单'),(101,'角色管理',1,2,'/system/role','C','0','system:role:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','角色管理菜单'),(102,'菜单管理',1,3,'/system/menu','C','0','system:menu:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','菜单管理菜单'),(103,'部门管理',1,4,'/system/dept','C','0','system:dept:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','部门管理菜单'),(104,'岗位管理',1,5,'/system/post','C','0','system:post:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','岗位管理菜单'),(105,'字典管理',1,6,'/system/dict','C','0','system:dict:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','字典管理菜单'),(106,'参数设置',1,7,'/system/config','C','0','system:config:view','#','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-24 11:58:21','参数设置菜单'),(107,'通知公告',1,8,'/system/notice','C','1','system:notice:view','#','admin','2018-03-16 11:33:00','sibo-chenzz','2018-11-02 16:53:37','通知公告菜单'),(109,'在线用户',2,1,'/monitor/online','C','0','monitor:online:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','在线用户菜单'),(111,'数据监控',2,3,'/monitor/data','C','0','monitor:data:view','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00','数据监控菜单'),(500,'操作日志',1,20,'/monitor/operlog','C','0','monitor:operlog:view','#','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-19 20:11:18','操作日志菜单'),(501,'登录日志',1,30,'/monitor/logininfor','C','0','monitor:logininfor:view','#','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-19 20:12:18','登录日志菜单'),(1000,'用户查询',100,1,'#','F','0','system:user:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1001,'用户新增',100,2,'#','F','0','system:user:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1002,'用户修改',100,3,'#','F','0','system:user:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1003,'用户删除',100,4,'#','F','0','system:user:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1004,'用户导出',100,5,'#','F','0','system:user:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1005,'重置密码',100,5,'#','F','0','system:user:resetPwd','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1006,'角色查询',101,1,'#','F','0','system:role:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1007,'角色新增',101,2,'#','F','0','system:role:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1008,'角色修改',101,3,'#','F','0','system:role:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1009,'角色删除',101,4,'#','F','0','system:role:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1010,'角色导出',101,4,'#','F','0','system:role:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1011,'菜单查询',102,1,'#','F','0','system:menu:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1012,'菜单新增',102,2,'#','F','0','system:menu:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1013,'菜单修改',102,3,'#','F','0','system:menu:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1014,'菜单删除',102,4,'#','F','0','system:menu:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1015,'部门查询',103,1,'#','F','0','system:dept:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1016,'部门新增',103,2,'#','F','0','system:dept:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1017,'部门修改',103,3,'#','F','0','system:dept:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1018,'部门删除',103,4,'#','F','0','system:dept:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1019,'岗位查询',104,1,'#','F','0','system:post:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1020,'岗位新增',104,2,'#','F','0','system:post:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1021,'岗位修改',104,3,'#','F','0','system:post:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1022,'岗位删除',104,4,'#','F','0','system:post:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1023,'岗位导出',104,4,'#','F','0','system:post:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1024,'字典查询',105,1,'#','F','0','system:dict:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1025,'字典新增',105,2,'#','F','0','system:dict:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1026,'字典修改',105,3,'#','F','0','system:dict:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1027,'字典删除',105,4,'#','F','0','system:dict:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1028,'字典导出',105,4,'#','F','0','system:dict:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1029,'参数查询',106,1,'#','F','0','system:config:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1030,'参数新增',106,2,'#','F','0','system:config:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1031,'参数修改',106,3,'#','F','0','system:config:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1032,'参数删除',106,4,'#','F','0','system:config:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1033,'参数导出',106,4,'#','F','0','system:config:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1034,'公告查询',107,1,'#','F','0','system:notice:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1035,'公告新增',107,2,'#','F','0','system:notice:add','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1036,'公告修改',107,3,'#','F','0','system:notice:edit','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1037,'公告删除',107,4,'#','F','0','system:notice:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1038,'操作查询',500,1,'#','F','0','monitor:operlog:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1039,'操作删除',500,2,'#','F','0','monitor:operlog:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1040,'详细信息',500,3,'#','F','0','monitor:operlog:detail','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1041,'日志导出',500,3,'#','F','0','monitor:operlog:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1042,'登录查询',501,1,'#','F','0','monitor:logininfor:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1043,'登录删除',501,2,'#','F','0','monitor:logininfor:remove','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1044,'日志导出',501,2,'#','F','0','monitor:logininfor:export','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1045,'在线查询',109,1,'#','F','0','monitor:online:list','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1046,'批量强退',109,2,'#','F','0','monitor:online:batchForceLogout','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(1047,'单条强退',109,3,'#','F','0','monitor:online:forceLogout','#','admin','2018-03-16 11:33:00','sb','2018-03-16 11:33:00',''),(2000,'医院医生',0,20,'#','M','0','','fa fa-bank','sibo-chenzz','2018-10-19 20:20:24','',NULL,''),(2001,'患者管理',0,30,'#','M','0','','fa fa-address-card-o','sibo-chenzz','2018-10-19 20:21:21','sibo-chenzz','2018-12-06 14:40:06',''),(2004,'健康资讯',0,40,'#','M','0','','fa fa-cutlery','sibo-chenzz','2018-10-19 20:56:03','',NULL,''),(2012,'患者管理',2001,1,'/yl/patientUser','C','0','yl:patientUser:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-20 15:09:36','用户(相当于患者),针对前台app类用户菜单'),(2013,'用户查询',2012,1,'#','F','0','yl:patientUser:list','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 10:58:52',''),(2014,'用户新增',2012,2,'#','F','0','yl:patientUser:add','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 10:59:04',''),(2015,'用户修改',2012,3,'#','F','0','yl:patientUser:edit','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 11:02:15',''),(2016,'用户删除',2012,4,'#','F','0','yl:patientUser:remove','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 11:02:27',''),(2017,'资讯文章',2004,1,'/yl/article','C','0','yl:article:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-21 14:01:21','文章菜单'),(2018,'文章查询',2017,1,'#','F','0','yl:article:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2019,'文章新增',2017,2,'#','F','0','yl:article:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2020,'文章修改',2017,3,'#','F','0','yl:article:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2021,'文章删除',2017,4,'#','F','0','yl:article:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2022,'医院管理',2000,1,'/yl/hospital','C','0','yl:hospital:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-22 18:08:08','医院菜单'),(2023,'医院查询',2022,1,'#','F','0','yl:hospital:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2024,'医院新增',2022,2,'#','F','0','yl:hospital:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2025,'医院修改',2022,3,'#','F','0','yl:hospital:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2026,'医院删除',2022,4,'#','F','0','yl:hospital:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2027,'医生管理',2000,10,'/yl/doctor','C','0','yl:doctor:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-23 19:17:57','医生菜单'),(2028,'医生查询',2027,1,'#','F','0','yl:doctor:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2029,'医生新增',2027,2,'#','F','0','yl:doctor:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2030,'医生修改',2027,3,'#','F','0','yl:doctor:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2031,'医生删除',2027,4,'#','F','0','yl:doctor:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2032,'消息建议',2004,10,'/yl/message','C','0','yl:message:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-12-02 14:52:56','消息菜单'),(2033,'消息查询',2032,1,'#','F','0','yl:message:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2034,'消息新增',2032,2,'#','F','1','yl:message:add','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-12-02 15:10:18',''),(2035,'消息修改',2032,3,'#','F','1','yl:message:edit','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-12-02 15:10:40',''),(2036,'消息删除',2032,4,'#','F','0','yl:message:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2037,'咨询回复',2001,40,'/yl/askReply','C','1','yl:askReply:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-11-01 19:01:42','咨询建议菜单'),(2038,'回复查询',2037,1,'#','F','0','yl:askReply:list','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:28:32',''),(2039,'回复新增',2037,2,'#','F','0','yl:askReply:add','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:28:52',''),(2040,'回复修改',2037,3,'#','F','0','yl:askReply:edit','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:29:11',''),(2041,'回复删除',2037,4,'#','F','0','yl:askReply:remove','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:29:28',''),(2042,'咨询管理',2001,30,'/yl/ask','C','0','yl:ask:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-10-26 17:30:28','咨询菜单'),(2043,'咨询查询',2042,1,'#','F','0','yl:ask:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2044,'咨询新增',2042,2,'#','F','0','yl:ask:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2045,'咨询修改',2042,3,'#','F','0','yl:ask:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2046,'咨询删除',2042,4,'#','F','0','yl:ask:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2052,'患者亲友',2001,100,'/yl/userFriend','C','1','yl:userFriend:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-11-30 15:06:18','亲友菜单'),(2053,'亲友查询',2052,1,'#','F','0','yl:userFriend:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2054,'亲友新增',2052,2,'#','F','0','yl:userFriend:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2055,'亲友修改',2052,3,'#','F','0','yl:userFriend:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2056,'亲友删除',2052,4,'#','F','0','yl:userFriend:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2057,'患者设备',2001,200,'/yl/device','C','0','yl:device:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-11-30 10:21:19','设备菜单'),(2058,'设备查询',2057,1,'#','F','0','yl:device:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2059,'设备新增',2057,2,'#','F','0','yl:device:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2060,'设备修改',2057,3,'#','F','0','yl:device:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2061,'设备删除',2057,4,'#','F','0','yl:device:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2072,'报警记录',2000,200,'/yl/warningHistory','C','0','yl:warningHistory:view','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-12-06 16:03:01','报警记录菜单'),(2073,'报警记录查询',2072,1,'#','F','0','yl:warningHistory:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2074,'报警记录新增',2072,2,'#','F','0','yl:warningHistory:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2075,'报警记录修改',2072,3,'#','F','0','yl:warningHistory:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2076,'报警记录删除',2072,4,'#','F','0','yl:warningHistory:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2077,'医院资料',2000,5,'/yl/hospital/hospitalDetail','C','0','yl:hospital:viewdetail','#','admin','2018-03-01 00:00:00','sibo-chenzz','2018-12-07 15:42:48','医院资料'),(2078,'短信记录',1,100,'/yl/smsHistory','C','0','yl:smsHistory:view','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','短信记录菜单'),(2079,'短信记录查询',2078,1,'#','F','0','yl:smsHistory:list','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2080,'短信记录新增',2078,2,'#','F','0','yl:smsHistory:add','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2081,'短信记录修改',2078,3,'#','F','0','yl:smsHistory:edit','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00',''),(2082,'短信记录删除',2078,4,'#','F','0','yl:smsHistory:remove','#','admin','2018-03-01 00:00:00','ry','2018-03-01 00:00:00','');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='操作日志记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_oper_log`
--

LOCK TABLES `sys_oper_log` WRITE;
/*!40000 ALTER TABLE `sys_oper_log` DISABLE KEYS */;
INSERT INTO `sys_oper_log` VALUES (1,'操作日志',9,'com.sibo.project.monitor.operlog.controller.OperlogController.clean()',1,'admin','研发部门','/monitor/operlog/clean','127.0.0.1','内网IP','{}',0,NULL,'2018-12-14 14:50:37');
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
INSERT INTO `sys_role` VALUES (1,'管理员','admin',1,'1','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-19 20:35:00','管理员'),(2,'普通角色','common',2,'2','0','0','admin','2018-03-16 11:33:00','sibo-chenzz','2018-10-27 15:19:11','普通角色'),(3,'医院管理员','hospital-admin',3,'2','0','0','sibo-chenzz','2018-10-23 17:07:20','sibo-chenzz','2018-12-07 16:39:32',''),(4,'医院医生','doctor',4,'1','0','0','sibo-chenzz','2018-10-23 17:08:45','sibo-chenzz','2018-12-06 19:03:18',''),(5,'项目监测功能组','project-monitor',5,'1','0','0','sibo-chenzz','2018-10-23 17:12:17','sibo-chenzz','2018-12-07 16:42:38','');
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
INSERT INTO `sys_role_menu` VALUES (2,1),(2,2),(2,105),(2,106),(2,107),(2,109),(2,111),(2,500),(2,501),(2,1024),(2,1028),(2,1029),(2,1030),(2,1031),(2,1032),(2,1033),(2,1034),(2,1035),(2,1036),(2,1037),(2,1038),(2,1040),(2,1041),(2,1042),(2,1044),(2,1045),(2,2000),(2,2001),(2,2004),(2,2012),(2,2013),(2,2014),(2,2015),(2,2016),(2,2017),(2,2018),(2,2019),(2,2020),(2,2021),(2,2022),(2,2023),(2,2024),(2,2025),(2,2026),(2,2027),(2,2028),(2,2029),(2,2030),(2,2031),(2,2032),(2,2033),(2,2034),(2,2035),(2,2036),(2,2037),(2,2038),(2,2039),(2,2040),(2,2041),(2,2042),(2,2043),(2,2044),(2,2045),(2,2046),(3,2000),(3,2001),(3,2012),(3,2013),(3,2027),(3,2028),(3,2029),(3,2030),(3,2077),(4,2000),(4,2001),(4,2004),(4,2012),(4,2013),(4,2014),(4,2015),(4,2032),(4,2033),(4,2034),(4,2035),(4,2037),(4,2038),(4,2039),(4,2040),(4,2041),(4,2042),(4,2043),(4,2044),(4,2045),(4,2046),(4,2072),(4,2073),(4,2074),(4,2075),(4,2076),(5,1),(5,103),(5,500),(5,501),(5,1015),(5,1038),(5,1040),(5,1041),(5,1042),(5,1044),(5,2000),(5,2001),(5,2004),(5,2012),(5,2013),(5,2017),(5,2018),(5,2019),(5,2020),(5,2021),(5,2022),(5,2023),(5,2027),(5,2028),(5,2032),(5,2033),(5,2042),(5,2043),(5,2057),(5,2058),(5,2072),(5,2073),(5,2078),(5,2079);
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='用户信息表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sys_user`
--

LOCK TABLES `sys_user` WRITE;
/*!40000 ALTER TABLE `sys_user` DISABLE KEYS */;
INSERT INTO `sys_user` VALUES (1,103,'sibo-chenzz','SIBO','00','116211148@qq.com','13888888888','0','0a46930e695175d049ec64820be54982.jpg','2d6215056301788ba3b0c7cc02217b20','3bc391','0','0','127.0.0.1','2018-12-14 11:03:03','admin','2018-09-10 11:33:00','sb','2018-12-14 11:03:03','管理员'),(2,105,'admin','SIBO','00','cs.chenzz@qq.com','15170707553','1','','3f794667b83a0eb0d839b06c778036cb','7a1eb0','0','0','127.0.0.1','2018-10-31 19:47:16','admin','2018-03-16 11:33:00','sb','2018-10-31 19:47:16','测试员'),(3,107,'sibo5','监测用户','00','aaaaa@qq.com','13800138000','0','','bc34ab2ceb40cc55a57d102519992f6f','1ccb08','0','0','127.0.0.1','2018-10-23 17:14:39','sibo-chenzz','2018-10-23 17:14:27','','2018-10-23 17:14:43',''),(4,108,'sibo3','医院管理员','00','aaa@qq.com','13800138001','0','','bdf3dfe318b9cb3579d5c1e89f12c341','8141c2','0','0','127.0.0.1','2018-12-06 15:20:35','sibo-chenzz','2018-10-23 17:51:26','','2018-12-06 15:20:37',''),(5,108,'sibo555','医院管理员','00','cs.chenzz@qq.com','13800138000','0','','aebdd058450accfffc556ac8ab4f4589','1eaa5e','0','0','127.0.0.1','2018-12-09 16:22:58','admin','2018-10-26 11:45:38','','2018-12-09 16:23:00',''),(6,100,'sibo444','医院管理员','00','cs.chenzzz@qq.com','13800138002','0','','8378d2d8f10cf6d8f0e4d829c2a53edc','bfc1bc','0','0','127.0.0.1','2018-12-03 11:57:59','admin','2018-10-26 11:59:23','','2018-12-03 11:57:58','医院管理员,sibo444'),(7,100,'ys5','医院医生','00','aaaa@qq.com','13800138005','0','','b586d285be0419c5afb8d00a750e883f','b4f21c','0','0','192.168.3.135','2018-12-12 15:11:13','admin','2018-10-26 14:56:33','sibo-chenzz','2018-12-12 15:11:27','医院医生,ys5'),(10,100,'doctor','医院医生','00','691484729','12','0','','c08de400e48d02c92cafde74345cd82d','666e73','0','0','127.0.0.1','2018-12-06 16:12:23','sibo-chenzz','2018-11-01 12:03:06','','2018-12-06 16:12:23','医院医生,doctor'),(11,100,'yy5','医院管理员','00','yiming.tim@qq.com','13888888880','0','','bcb2328b39a19da73e462af99b33b5f7','123e5a','0','0','192.168.3.135','2018-12-11 14:43:38','sibo-chenzz','2018-12-08 15:34:00','','2018-12-11 14:43:42','医院管理员,yy5'),(12,100,'ys6','医院医生','00','aaaaaa@qq.com','13800000000','0','','f398e95c807fc4b0bc1eeb75685e5acb','101a2e','0','0','192.168.3.135','2018-12-11 14:45:09','yy5','2018-12-11 14:29:36','','2018-12-11 14:45:12','医院医生,ys6'),(13,100,'ys7','医院医生','00','ssssss@qq.com','13466666666','0','','2256a6a15cc0dc08736fd7b79df99dbb','51ddc3','0','0','127.0.0.1','2018-12-11 17:08:45','yy5','2018-12-11 14:36:33','','2018-12-11 17:08:48','医院医生,ys7');
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
INSERT INTO `sys_user_online` VALUES ('0c271805-5ae0-4897-aaf9-93460c82b25c','admin','研发部门','127.0.0.1','内网IP','Mobile Safari','Mac OS X (iPhone)','on_line','2018-12-14 14:46:36','2018-12-14 14:50:06',1800000);
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
INSERT INTO `sys_user_post` VALUES (1,1),(2,2),(3,4),(4,4),(5,4),(6,4),(8,4),(10,4),(11,4),(12,4),(13,4);
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
INSERT INTO `sys_user_role` VALUES (1,1),(2,2),(3,5),(4,3),(5,3),(6,3),(7,4),(8,4),(10,4),(11,3),(12,4),(13,4);
/*!40000 ALTER TABLE `sys_user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_appuser_registerid`
--

DROP TABLE IF EXISTS `tb_appuser_registerid`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_appuser_registerid` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` bigint(20) NOT NULL COMMENT '用户id',
  `mobileno` varchar(100) DEFAULT '' COMMENT '手机号码',
  `regid` varchar(100) DEFAULT '' COMMENT '推送设备id',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `update_time` datetime DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='app用户id推送设备id表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_appuser_registerid`
--

LOCK TABLES `tb_appuser_registerid` WRITE;
/*!40000 ALTER TABLE `tb_appuser_registerid` DISABLE KEYS */;
INSERT INTO `tb_appuser_registerid` VALUES (1,25,'','120c83f7600d3f8f7ca','2018-11-27 19:34:16','2018-12-13 16:47:02',''),(2,11,'','120c83f7600d3f8f7ca','2018-11-29 15:28:43','2018-12-12 12:10:03',''),(3,11,'','','2018-12-03 09:55:50',NULL,''),(4,11,'','120c83f7600d203eaf0','2018-12-03 09:55:57','2018-12-05 10:04:58',''),(5,45,'','120c83f7600d3f8f7ca','2018-12-05 09:51:06','2018-12-05 09:51:14',''),(6,25,'','120c83f7600d203eaf0','2018-12-09 16:47:59','2018-12-12 11:35:21',''),(7,28,'','120c83f7600d203eaf0','2018-12-11 16:34:46','2018-12-11 16:36:03',''),(8,35,'','120c83f7600d3f8f7ca','2018-12-11 16:35:25','2018-12-13 12:03:14',''),(9,27,'','120c83f7600d203eaf0','2018-12-11 16:52:37','2018-12-12 10:27:22',''),(10,34,'','120c83f7600d203eaf0','2018-12-11 16:54:54',NULL,''),(11,37,'','120c83f7600d203eaf0','2018-12-11 17:01:20','2018-12-12 15:28:03',''),(12,1000000,'','13065ffa4e516eee2a6','2018-12-14 11:16:18',NULL,''),(13,35,'','13065ffa4e516eee2a6','2018-12-14 11:50:57','2018-12-14 11:55:32','');
/*!40000 ALTER TABLE `tb_appuser_registerid` ENABLE KEYS */;
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
INSERT INTO `tb_article` VALUES (8,'高血压分类',NULL,'<div class=\"para\" label-module=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">1.原发性高血压</span></div><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">是一种以血压升高为主要临床表现而病因尚未明确的独立疾病，占所有高血压患者的90%以上。<span style=\"font-weight: 700;\"></span></div><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\"><span style=\"font-weight: 700;\">2.继发性高血压</span></div><div class=\"para\" label-module=\"para\" style=\"font-size: 14px; overflow-wrap: break-word; color: rgb(51, 51, 51); margin-bottom: 15px; text-indent: 2em; line-height: 24px; zoom: 1; font-family: arial, 宋体, sans-serif;\">又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。</div>','2018-10-30 15:28:00','2018-10-31 19:29:55','高血压',2,1,'健康小常识'),(9,'高血压分类',NULL,'<p>xxxxxxxxx</p>','2018-10-31 20:03:57',NULL,NULL,1,NULL,'健康资讯');
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
  `title` varchar(450) DEFAULT NULL COMMENT '标题',
  `html_context` longtext NOT NULL COMMENT '咨询内容',
  `create_time` datetime DEFAULT NULL COMMENT '添加时间',
  `update_time` datetime DEFAULT NULL COMMENT '修改时间',
  `tag` varchar(450) DEFAULT NULL COMMENT '标签',
  `add_user_id` int(11) DEFAULT NULL COMMENT '添加用户id',
  `update_user_id` int(11) DEFAULT NULL COMMENT '修改用户id',
  `type_key` varchar(80) DEFAULT NULL COMMENT '类别关键字',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COMMENT='咨询表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ask`
--

LOCK TABLES `tb_ask` WRITE;
/*!40000 ALTER TABLE `tb_ask` DISABLE KEYS */;
INSERT INTO `tb_ask` VALUES (1,'高血压要注意些什么?','继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。\r\n    继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。','2018-10-08 00:00:00','2018-11-01 16:01:44',NULL,28,1,'高血压'),(2,'继发性高血压 ','继发性高血压\r\n    又称为症状性高血压，在这类疾病中病因明确，高血压仅是该种疾病的临床表现之一，血压可暂时性或持久性升高。','2018-11-01 16:03:15',NULL,NULL,28,NULL,NULL),(3,'2.继发性高血压 ','2继发性高血压 \r\n2继发性高血压 2继发性高血压 ','2018-11-01 16:12:55',NULL,NULL,28,NULL,NULL),(4,'3继发性高血压 ','3继发性高血压 \r\n3继发性高血压 \r\n3继发性高血压 ','2018-11-01 16:13:19',NULL,NULL,28,NULL,NULL),(5,'高血压饮食要注意什么','嘻嘻嘻,高血压饮食要注意什么','2018-11-15 14:48:22','2018-11-15 14:48:43',NULL,28,1,NULL),(9,NULL,'高血压药注意什么','2018-12-02 10:25:45',NULL,NULL,25,NULL,NULL),(10,'title','咨询医生,高血压药注意什么','2018-12-02 10:33:08',NULL,NULL,25,NULL,NULL),(11,'title','高血压饮食要注意什么?','2018-12-02 10:45:53',NULL,NULL,25,NULL,NULL),(12,'title','你好，陈医生，如何预防高血压','2018-12-02 13:20:56',NULL,NULL,25,NULL,NULL),(13,'title','你好医生','2018-12-02 15:13:53',NULL,NULL,25,NULL,NULL),(14,'title','高血压需要住院治疗吗？','2018-12-02 15:18:52',NULL,NULL,25,NULL,NULL),(18,NULL,'hi,dir sun,are you ok?','2018-12-11 17:14:49',NULL,NULL,35,NULL,NULL);
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
  `reply_user_id` bigint(20) DEFAULT '0' COMMENT '回复的用户id',
  `reply_doctor_id` bigint(20) DEFAULT '0' COMMENT '回复的医生id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COMMENT='咨询回复表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_ask_reply`
--

LOCK TABLES `tb_ask_reply` WRITE;
/*!40000 ALTER TABLE `tb_ask_reply` DISABLE KEYS */;
INSERT INTO `tb_ask_reply` VALUES (1,2,'住院观察一段时间','2018-11-02 16:08:51','2018-11-02 16:24:32',0,1),(2,1,'eeeeeeeeeeeeeee','2018-11-02 16:09:14',NULL,0,1),(3,3,'这里有脑残片一颗','2018-11-02 16:18:59',NULL,0,1),(4,1,'来瓶印度神油','2018-11-02 16:23:51',NULL,0,1),(5,13,'有什么事?','2018-12-02 15:16:13',NULL,0,1),(6,12,'注意饮食,清淡为主','2018-12-02 15:16:50',NULL,0,1),(7,14,'根据病情自行选择是否住院','2018-12-02 15:19:25',NULL,0,1),(8,14,'现在什么情况了','2018-12-10 17:23:49',NULL,0,1),(9,14,'情况有所好转,谢谢?','2018-12-10 17:24:10',NULL,25,0),(10,10,'搞么子','2018-12-10 17:29:24',NULL,0,1),(11,14,'期待早日康复','2018-12-10 17:58:53',NULL,0,1),(12,14,'~_^','2018-12-10 17:59:24',NULL,25,0),(13,5,'少吃辛辣食物,多运动','2018-12-10 18:10:20',NULL,0,1),(14,18,'在,什么事情','2018-12-11 17:15:15',NULL,0,4);
/*!40000 ALTER TABLE `tb_ask_reply` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_device`
--

DROP TABLE IF EXISTS `tb_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_device` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `name` varchar(50) DEFAULT '健康手环' COMMENT '设备名称',
  `barcode` varchar(100) DEFAULT NULL COMMENT '设备条码',
  `status` tinyint(4) DEFAULT NULL COMMENT '状态  1：正常使用   2：已注销',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `friend_id` varchar(1000) DEFAULT NULL COMMENT '亲友id,用逗号隔开',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8 COMMENT='设备表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_device`
--

LOCK TABLES `tb_device` WRITE;
/*!40000 ALTER TABLE `tb_device` DISABLE KEYS */;
INSERT INTO `tb_device` VALUES (34,'赵先生的手环','8800000010',NULL,NULL,NULL),(35,'张先生的手环','8800000011',NULL,NULL,NULL),(36,'秦先生的手环','8800000012',NULL,NULL,''),(37,'潘小姐的手环','8800000013',NULL,NULL,''),(38,'健康手环','8800000014',NULL,NULL,''),(39,'健康手环','8800000015',NULL,NULL,'40,41,42,43,44,45'),(40,'健康手环','8800000015',NULL,NULL,''),(41,'健康手环','8800000016',NULL,NULL,''),(42,'健康手环','8800000017',NULL,NULL,''),(43,'健康手环','8800000018',NULL,NULL,''),(44,'健康手环','8800000019',NULL,'2018-12-12 17:47:53',NULL),(45,'手环','8800000020',NULL,'2018-12-13 10:33:27',NULL),(46,'手环','8800000021',NULL,'2018-12-13 10:34:09',NULL),(47,'手环','8800000022',NULL,'2018-12-13 10:35:44',NULL);
/*!40000 ALTER TABLE `tb_device` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COMMENT='医生表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_doctor`
--

LOCK TABLES `tb_doctor` WRITE;
/*!40000 ALTER TABLE `tb_doctor` DISABLE KEYS */;
INSERT INTO `tb_doctor` VALUES (1,7,7,'陈鹏','外科主任','外科',0,'1977-10-15 00:00:00',170,55,NULL,'1','2018-10-26 14:56:33','',NULL,''),(2,10,8,'赵一曼','主任','产科',1,'1973-12-08 00:00:00',165,55,NULL,'1','2018-11-01 12:03:06','',NULL,''),(3,12,8,'张大虎','主治医生','神经科',0,'1980-12-11 00:00:00',175,80,'治疗神经病的专家','11','2018-12-11 14:29:33','',NULL,''),(4,13,8,'孙玉仁','主治医生','儿科',0,'1979-12-11 00:00:00',178,80,'儿科专家','11','2018-12-11 14:36:30','',NULL,'');
/*!40000 ALTER TABLE `tb_doctor` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COMMENT='医院表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_hospital`
--

LOCK TABLES `tb_hospital` WRITE;
/*!40000 ALTER TABLE `tb_hospital` DISABLE KEYS */;
INSERT INTO `tb_hospital` VALUES (7,5,'江西省人民医院','江西南昌','江西省人民医院创建于1897年，前身是美国卫理公会创办的教会医院，是南昌地区第一所西医医院','',NULL,'',NULL,''),(8,11,'南昌妇幼保健院','江西南昌进贤路','南昌市妇幼保健医院始建于1953年，是一家妇幼保健院','1','2018-12-08 15:33:56','',NULL,'公立医院');
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
  `to_userid` bigint(20) DEFAULT NULL COMMENT '目标用户id',
  `is_read` char(1) DEFAULT '0' COMMENT '状态（0未读 1已读）',
  `type` int(11) DEFAULT '1' COMMENT '类别,1消息;2建议',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8mb4 COMMENT='消息建议表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_message`
--

LOCK TABLES `tb_message` WRITE;
/*!40000 ALTER TABLE `tb_message` DISABLE KEYS */;
INSERT INTO `tb_message` VALUES (19,2,'2018-10-30 13:15:47','sdgasg',28,NULL,2),(20,1,'2018-11-05 10:55:43','sdgfagaf',28,NULL,2),(21,1,'2018-11-28 11:57:37','吃饭了,大家好',28,NULL,2),(23,1,'2018-11-28 12:03:18','Git 是 Linus Torvalds 为了帮助管理 Linux 内核开发而开发的一个开放源码的版本控制软件。 Torvalds 开始着手开发 Git 是为了作为一种过渡方案来替代 BitKeeper，后者之前一直是 Linux 内核开发人员在全球使用的主要源代码工具。',28,NULL,2),(24,1,'2018-11-28 14:30:36','为什么总有些傻逼从来不为别人考虑,自私自利,天天弄个机械键盘,噼里啪啦的,还觉得自己很酷,一个屋里就属这人动静大.真是吵死了\r\n\r\n为什么总有些傻逼从来不为别人考虑,自私自利,天天弄个机械键盘,噼里啪啦的,还觉得自己很酷,一个屋里就属这人动静大.真是吵死了',28,'0',2),(25,1,'2018-11-28 14:51:26','2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留',28,'0',2),(26,1,'2018-11-28 14:51:55','2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留',28,'0',2),(27,1,'2018-11-28 14:53:34','2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留',28,'0',2),(28,1,'2018-11-28 14:58:33','2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留',25,'0',1),(29,1,'2018-11-28 14:59:13','2018年11月26日，石景山公安分局根据群众举报，在本市某小区抓获2名涉毒违法人员陈某（男，43岁，歌手）和何某某（女，25岁，无业），现场起获冰毒7.96克、大麻2.14克。经尿检，陈某呈冰毒类和大麻类阳性，何某某呈大麻类阳性。目前，陈某因吸毒、非法持有毒品，何某某因吸毒均被行政拘留',25,'0',1),(30,1,'2018-11-28 15:04:46','制香水的方法有很多，最简单的便是将带有独特香味的花瓣或草药捣碎泡入酒精中，让酒精溶解植物里的芳香油，最后过滤掉残留物，加入水稀释即可使用。',25,'0',1),(31,1,'2018-11-28 16:34:46','test aaaaaaaaaaaaaaa',25,'0',1),(32,1,'2018-11-28 16:49:15','请按时吃药.每次3片',25,'0',1),(33,1,'2018-11-28 16:52:21','按时吃药,不要忘记治疗!!!!',25,'0',1),(34,1,'2018-11-29 09:41:57','ddddddddddddddddd',25,'0',1),(35,1,'2018-12-01 17:23:28','建议多喝水',25,'0',2),(36,1,'2018-12-01 17:24:44','多喝水',35,'1',1),(37,13,'2018-12-11 17:30:56','建议多喝水',35,'1',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8 COMMENT='手机发送验证码表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_mobile_code`
--

LOCK TABLES `tb_mobile_code` WRITE;
/*!40000 ALTER TABLE `tb_mobile_code` DISABLE KEYS */;
INSERT INTO `tb_mobile_code` VALUES (10,'6b765013-c8bf-41a8-ab02-d04d4fd1a1a8','13800000000','921309','2018-12-12 15:07:08'),(11,'928a80d4-633c-41b7-bf4a-dafb44fbccea','13800000008','808975','2018-10-23 18:20:18'),(12,'67028064-85a8-4ca4-af20-c05eafe095fd','1380000000','610231','2018-10-23 20:06:46'),(13,'a22b3457-6990-4213-8eeb-7ad6b8bc9327','111','305981','2018-11-01 15:17:48'),(14,'231ec052-1f19-4b53-a46d-0b59c06683d0','11333338000','950424','2018-10-26 09:24:36'),(15,'91fc24ef-dbc3-4fb4-bccd-45597b912772','1355','903891','2018-10-26 19:23:58'),(16,'4a1d6e7f-7574-4874-881e-5586fd0997a6','13555','632020','2018-10-27 10:13:03'),(17,'3156b14d-0373-4b6c-b4a0-48e3404a9fb4','13666','469082','2018-10-29 09:30:21'),(18,'95fcdc30-fe8c-4c4a-aacd-b365fe53960a','11','847231','2018-10-31 10:03:18'),(19,'35782007-f42a-48a9-9014-ef16c094c841','15170707553','159591','2018-11-06 19:39:39'),(20,'352a9523-de23-4cb5-987f-d64d93964f27','123','232847','2018-11-02 15:40:32'),(21,'d2c750fd-2dc6-4bc3-aaff-418636629873','1313','862637','2018-11-03 17:57:42'),(22,'f663d8c3-d15d-4866-bb4c-bf236115e1b8','1','335567','2018-11-05 17:04:50'),(23,'9e5a65b3-51f1-4f75-8756-c8c0c1ba2221','13555852213','417299','2018-11-06 09:53:37'),(24,'a516f94f-9b73-4629-a472-c36fedda6c53','15000218819','452349','2018-11-13 09:29:36'),(25,'1178321d-60bc-4c89-bde7-ae58903d6298','13555555555','264625','2018-11-12 09:54:59'),(26,'5d7ee7d9-ebca-4000-95bc-48021a3f7d57','13586632569','595438','2018-11-12 15:53:30'),(27,'49ad8426-645a-43a3-9a81-3ebb5177bd32','13684943579','266307','2018-12-11 16:54:49'),(28,'84f57423-d9c8-406a-8c8b-6141b9a916b1','13123569965','552880','2018-11-13 09:29:25'),(29,'d684c9be-89dd-4d58-9746-413bcc23ed21','13800138000','663494','2018-12-13 16:46:56'),(30,'dc361473-2f18-4dc1-ad15-04996554c0b2','15888085213','779202','2018-11-15 10:50:42'),(31,'e1d088cb-2a5d-412c-99a8-439b4a4c28a0','13522213313','719354','2018-12-12 10:27:13'),(32,'13fefbba-5937-4f19-9a79-d264c779a2ba','15888213315','941785','2018-12-11 16:34:38'),(33,'f563e34a-37a0-4fd3-befb-658d842cd8fc','13666421311','651883','2018-11-27 16:33:33'),(34,'2c3e2cb7-1fe2-4587-8e14-f91888744eb2','13585224613','673255','2018-11-28 11:19:50'),(35,'a487fac9-40ea-4087-8dae-1a785c6bb5e4','13428795901','251747','2018-12-14 11:16:04'),(36,'2cc08a49-e42f-4a5a-8bcc-92d314ab50e6','15170707559','355260','2018-12-05 09:51:00'),(37,'f36a9cde-1b65-411b-8bc2-6224827bce96','17722490213','876950','2018-12-06 13:08:00'),(38,'0e3834a5-dad0-4a0d-b3c9-b2d3a1dc8b0c','16620846645','588239','2018-12-14 11:50:42'),(39,'2b9bbda5-f80f-4ac4-80f9-097532b3d6ba','15000000009','899876','2018-12-12 15:14:22');
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
  `address` varchar(545) DEFAULT NULL COMMENT '地址',
  `device_id` bigint(20) DEFAULT '0' COMMENT '设备id',
  `valid_date` datetime DEFAULT NULL COMMENT '服务期',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='用户表(相当于患者表),针对前台app类用户';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_patient_user`
--

LOCK TABLES `tb_patient_user` WRITE;
/*!40000 ALTER TABLE `tb_patient_user` DISABLE KEYS */;
INSERT INTO `tb_patient_user` VALUES (10,'31918ce0-6b43-4da5-815d-e2a29db28c2e','10000','lin',NULL,'lin',NULL,NULL,NULL,'13800000008',1,'2018-10-23 18:20:25','2018-10-23 18:20:25','',0,'林先生',1,166,55,'1965-12-01 00:00:00','A型','教师','已婚','无','无','无','无','无','无','2018-12-01',NULL,NULL,'无',0,'深圳市龙岗区大运',34,'2020-12-09 00:00:00'),(11,'75803a4d-a796-46bc-ad87-5ba62fa64f11','10000',NULL,NULL,NULL,NULL,NULL,NULL,'13800000000',1,'2018-10-23 20:07:01','2018-12-05 16:32:57','',0,'陈先生',1,178,60,NULL,'A型',NULL,'已婚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'江西省南昌',35,NULL),(25,'53681175-82f7-4fa5-8631-638a66bd5240','10000','lai',NULL,'lai',NULL,NULL,NULL,'13800138000',1,'2018-11-13 11:29:18','2018-12-02 13:12:31','',1,'赖女士',1,178,77,'1977-12-01 00:00:00','A型','律师','已婚','无','无','无','无','无','无','2004-11-01','无',NULL,'无',1,'深圳市龙岗区天安数码城',39,'2018-12-28 00:00:00'),(27,'f8c1b34d-07fd-48ff-8be1-b1aca290a5ce','10000',NULL,NULL,NULL,NULL,NULL,NULL,'13522213313',1,'2018-11-22 10:28:43','2018-11-22 10:28:43','',0,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,NULL,40,NULL),(28,'75dcdbaa-30f6-4b29-af07-9567b76253ab','10000','zhang',NULL,'zhang',NULL,NULL,'691484729@qq.com','15888213315',1,'2018-11-23 11:27:37','2018-11-23 11:27:37','',0,'张先生',1,168,66,'1967-12-01 00:00:00','A型','教师','已婚','无','无','无','无','无','无','2018-10-09','无',NULL,'无',2,'深圳市龙岗区缤纷世纪公寓',41,'2019-12-11 00:00:00'),(33,'72dcdbaa-30f6-4b29-af07-9567b76223ab',NULL,'liu','88888888','liu',NULL,NULL,'691484729@qq.com','15170707553',1,NULL,NULL,'',0,'刘先生',0,177,70,'1981-12-08 00:00:00','A型','律师','已婚','无','无','3年','无','无','无','2015-10-06','无',NULL,'无',1,'深圳市龙岗区黄阁坑新秀新村',42,'2021-12-09 00:00:00'),(34,'71dcdbaa-30f6-4b29-af07-9567b76223ab',NULL,'zy','1c7656e8556803764c38ba66e8daf5b5',NULL,'3a8e9d',NULL,'123@123.com','13684943579',1,NULL,NULL,'',0,'123',0,170,66,'2018-12-06 00:00:00','A型','工人','已婚','花粉','无','2年','不饮酒','锻炼频率','无','2018-12-06','无',NULL,'无',1,'123',43,'2018-12-27 00:00:00'),(35,'75dcdbca-30f6-4b29-af07-9567b76223ab',NULL,NULL,'4e062df340d25c77b63d32e1589bc3a6',NULL,'fc25b6',NULL,NULL,'16620846645',1,NULL,NULL,'20181212_14483956358_1544597312165.JPEG',0,'李世民',0,170,70,'1986-12-11 00:00:00','A型','公务员','已婚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,4,'广东省深圳市龙华区',44,'2019-12-11 00:00:00'),(36,'75dcdbaa-3126-4b29-af07-9567b76223ab',NULL,NULL,'5a6dca1a04570b4a80bfa0a302376ebb',NULL,'65f220',NULL,NULL,'15000000000',1,NULL,NULL,'',0,'陈伟',0,168,45,'1965-12-14 00:00:00','A型',NULL,'已婚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'江西省九江市浔阳区湖滨路48号',45,'2019-04-19 00:00:00'),(37,'75dcdbaa-30f6-4b29-af07-9567b76223a',NULL,NULL,'65d78bbbebd62df7b036a3f7733f9f79',NULL,'a7715e',NULL,NULL,'15000000009',1,NULL,NULL,'',0,'王伟',0,168,45,'1969-12-08 00:00:00','A型',NULL,'已婚',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,1,'江西省九江市浔阳区湖滨路48号',46,NULL);
/*!40000 ALTER TABLE `tb_patient_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_sms_history`
--

DROP TABLE IF EXISTS `tb_sms_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_sms_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `to_mobile_no` varchar(20) DEFAULT NULL COMMENT '接收人手机号码',
  `send_time` datetime DEFAULT NULL COMMENT '发送时间',
  `parameter` varchar(1000) DEFAULT NULL COMMENT '参数以及值',
  `module` varchar(245) DEFAULT NULL COMMENT '模块',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8mb4 COMMENT='发送短信记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_sms_history`
--

LOCK TABLES `tb_sms_history` WRITE;
/*!40000 ALTER TABLE `tb_sms_history` DISABLE KEYS */;
INSERT INTO `tb_sms_history` VALUES (54,'15170707553','2018-12-07 16:24:39','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(55,'15170707554','2018-12-07 16:24:40','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(56,'15170707555','2018-12-07 16:24:40','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(57,'15170707556','2018-12-07 16:24:40','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(58,'13428795901','2018-12-07 16:24:40','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(59,'15170707559','2018-12-07 16:24:40','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(60,'15170707553','2018-12-11 16:53:41','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(61,'15170707554','2018-12-11 16:53:41','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(62,'15170707555','2018-12-11 16:53:41','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(63,'15170707556','2018-12-11 16:53:42','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(64,'13428795901','2018-12-11 16:53:42','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(65,'15170707559','2018-12-11 16:53:42','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(66,'15170707553','2018-12-11 16:53:42','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(67,'15170707554','2018-12-11 16:53:43','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(68,'15170707555','2018-12-11 16:53:43','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(69,'15170707556','2018-12-11 16:53:43','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(70,'13428795901','2018-12-11 16:53:43','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(71,'15170707559','2018-12-11 16:53:43','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(72,'15170707553','2018-12-11 16:53:44','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(73,'15170707554','2018-12-11 16:53:44','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(74,'15170707555','2018-12-11 16:53:44','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(75,'15170707556','2018-12-11 16:53:45','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(76,'13428795901','2018-12-11 16:53:45','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(77,'15170707559','2018-12-11 16:53:45','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(78,'15170707553','2018-12-11 16:54:01','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(79,'15170707554','2018-12-11 16:54:01','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(80,'15170707555','2018-12-11 16:54:02','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(81,'15170707556','2018-12-11 16:54:02','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(82,'13428795901','2018-12-11 16:54:02','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(83,'15170707559','2018-12-11 16:54:02','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(84,'15170707553','2018-12-11 17:37:24','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(85,'15170707554','2018-12-11 17:37:24','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(86,'15170707555','2018-12-11 17:37:25','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(87,'15170707556','2018-12-11 17:37:25','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(88,'13428795901','2018-12-11 17:37:25','手机号: 13800138000, 姓名: 赖女士','报警呼救'),(89,'15170707559','2018-12-11 17:37:25','手机号: 13800138000, 姓名: 赖女士','报警呼救');
/*!40000 ALTER TABLE `tb_sms_history` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_device`
--

DROP TABLE IF EXISTS `tb_user_device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_device` (
  `pid` bigint(20) NOT NULL COMMENT '设备对应的病人id',
  `barcode` varchar(100) NOT NULL COMMENT '设备条码',
  `user_id` bigint(20) DEFAULT NULL COMMENT '用户ID',
  `xo_active` tinyint(1) unsigned DEFAULT NULL COMMENT '是否默认设备,1为默认,0不是',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '设备类型,1为病人本人设备,2为亲友关注的设备',
  `devicename` varchar(245) DEFAULT NULL COMMENT '设备名称',
  PRIMARY KEY (`pid`,`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和设备关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_device`
--

LOCK TABLES `tb_user_device` WRITE;
/*!40000 ALTER TABLE `tb_user_device` DISABLE KEYS */;
INSERT INTO `tb_user_device` VALUES (35,'8800000022',NULL,NULL,NULL,'手环');
/*!40000 ALTER TABLE `tb_user_device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_friend`
--

DROP TABLE IF EXISTS `tb_user_friend`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_friend` (
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
) ENGINE=InnoDB AUTO_INCREMENT=1000001 DEFAULT CHARSET=utf8 COMMENT='亲友表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_friend`
--

LOCK TABLES `tb_user_friend` WRITE;
/*!40000 ALTER TABLE `tb_user_friend` DISABLE KEYS */;
INSERT INTO `tb_user_friend` VALUES (1000000,NULL,NULL,NULL,'781d6a0b030d9cb56a0960db8ec8267f',NULL,'849e7d',NULL,NULL,'13428795901',1,'2018-12-12 16:33:36',NULL,NULL,0,'方世玉',NULL,NULL,NULL,NULL,'教练',NULL,'广东佛山');
/*!40000 ALTER TABLE `tb_user_friend` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_user_friend_relation`
--

DROP TABLE IF EXISTS `tb_user_friend_relation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_user_friend_relation` (
  `pid` bigint(20) NOT NULL COMMENT '病人用户ID',
  `fid` bigint(20) NOT NULL COMMENT '亲友用户ID',
  `barcode` varchar(245) DEFAULT NULL COMMENT '设备条码',
  `deviceid` bigint(20) DEFAULT NULL COMMENT '病人表中的设备id',
  `current_device` tinyint(1) unsigned DEFAULT NULL COMMENT '是否当前设备,1为当前,0不是',
  PRIMARY KEY (`pid`,`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='病人和亲友关联表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_friend_relation`
--

LOCK TABLES `tb_user_friend_relation` WRITE;
/*!40000 ALTER TABLE `tb_user_friend_relation` DISABLE KEYS */;
INSERT INTO `tb_user_friend_relation` VALUES (34,1000000,NULL,43,0),(35,1000000,NULL,44,1);
/*!40000 ALTER TABLE `tb_user_friend_relation` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=99 DEFAULT CHARSET=utf8mb4 COMMENT='针对移动端App的token验证表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_user_token`
--

LOCK TABLES `tb_user_token` WRITE;
/*!40000 ALTER TABLE `tb_user_token` DISABLE KEYS */;
INSERT INTO `tb_user_token` VALUES (31,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMDI3MTk1LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA2MzE5OTV9.yzYwHmN60UZDaxeqMZ1fMu8TKiGOyxDJgt97RsHiAzA',NULL,'2018-10-27 17:19:56','2018-10-20 17:19:56',NULL),(33,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MDI5NjQyMSwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQwOTAxMjIxfQ.O1Iwvz0uMj4EqTTUwCcRWWTqdgfP5BSeT1d3PK83EoM',NULL,'2018-10-30 20:07:01','2018-10-23 20:07:01',NULL),(34,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzQ3NjQzLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NTI0NDN9.wu8uSRSUK3uiOAbjXM0Zw4BanMzS05MO6TyqNMXXFGc',NULL,'2018-10-31 10:20:44','2018-10-24 10:20:44',NULL),(35,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzQ5NTI0LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NTQzMjR9.ejd2EJ4LgCguNvyGL1yiQfRqnmiIYbaNeBjRi_A10uI',NULL,'2018-10-31 10:52:04','2018-10-24 10:52:04',NULL),(36,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwMzY3OTQyLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDA5NzI3NDJ9.sxZ01BAIcNTttcsHJrhaEcUiwAlpDp4gJJjae8h8CG8',NULL,'2018-10-31 15:59:02','2018-10-24 15:59:02',NULL),(37,12,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDQzMjg2OCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMDM3NjY4fQ.Qq9e0EfBDGULWUHv8zDJPQz35czOptifPoy0DYtSswA',NULL,'2018-11-01 10:01:09','2018-10-25 10:01:09',NULL),(38,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNDM3Njk1LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEwNDI0OTV9.wJaeLEinOjE0LhirXVD73SLxzCNnCKS02861AOYS-vI',NULL,'2018-11-01 11:21:36','2018-10-25 11:21:36',NULL),(40,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNTQzMDg3LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDExNDc4ODd9.PDTusfFSgYRVKEKXPwgzHhKV1mTuYUaoVMERXH6fcbA',NULL,'2018-11-02 16:38:07','2018-10-26 16:38:07',NULL),(41,14,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxNCIsImlhdCI6MTU0MDU1MzA0NCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMTU3ODQ0fQ.991wYlcnXpmxf9SrG_RIHD3BwVDvPmMOkOVmN2U0z9E',NULL,'2018-11-02 19:24:05','2018-10-26 19:24:05',NULL),(43,12,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDYwODUzOCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMjEzMzM4fQ.YxBBuvVu5a0fkjFCgzblHN1wyVLAfcjhlQ0eou8x7sI',NULL,'2018-11-03 10:48:59','2018-10-27 10:48:59',NULL),(44,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNjExMTU5LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEyMTU5NTl9.U_AsdF2J2Hgon_FG9yCW6XX3b_FApFZ2m0IjGgGANLE',NULL,'2018-11-03 11:32:40','2018-10-27 11:32:40',NULL),(45,16,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxNiIsImlhdCI6MTU0MDc3NjYyNiwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxMzgxNDI2fQ.Py22X-wSq_weKpb0snmNHjlzMgGetV0fah5ecwIfpVI',NULL,'2018-11-05 09:30:27','2018-10-29 09:30:27',NULL),(46,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwNzc4NTc4LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDEzODMzNzh9.iBLP1s2GmKjdk_7gNygfooQerlLIlXHhSAQrFa0ve4o',NULL,'2018-11-05 10:02:58','2018-10-29 10:02:58',NULL),(47,12,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MDk1MTQxMiwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxNTU2MjEyfQ.2_inhKehe_sj-zW0LGxLAu0Z8QVYR118ArRSuFz_fis',NULL,'2018-11-07 10:03:33','2018-10-31 10:03:33',NULL),(51,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwOTcxMTM5LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE1NzU5Mzl9.AKV_aNiVQhgCqe-Egd8AF3yT2VgKzvn8hYbIAB0ELdM',NULL,'2018-11-07 15:32:20','2018-10-31 15:32:20',NULL),(52,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQwOTc0Njc2LCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE1Nzk0NzZ9.GQPM4TwJEy4iu5bOBRqTCDSjK2bcW0k8JV0ygeOwoFo',NULL,'2018-11-07 16:31:16','2018-10-31 16:31:16',NULL),(53,12,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMiIsImlhdCI6MTU0MTA1NjY3Mywic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxNjYxNDczfQ.rWOUoa4MAGPFSlFy5lV-5NRAUmVzc2-YX8H7xpZJYyg',NULL,'2018-11-08 15:17:53','2018-11-01 15:17:53',NULL),(54,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQxMTI4NTgxLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE3MzMzODF9.7n7gZZEHG2ZKThXdbwAwEiSvRsGcu1uPoaMNr3MuzYU',NULL,'2018-11-09 11:16:22','2018-11-02 11:16:22',NULL),(55,18,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxOCIsImlhdCI6MTU0MTE0NDQ0Niwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxNzQ5MjQ2fQ.AHBqqp8S-mn6Ant1edf4vlcexQc1EDpF4mltDg_6kdc',NULL,'2018-11-09 15:40:47','2018-11-02 15:40:47',NULL),(56,19,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxOSIsImlhdCI6MTU0MTIzOTA3NCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQxODQzODc0fQ.J2_wUyfgaOV86nC8Ke3UYXsQ-eJZu8F01JMxLx7ft_M',NULL,'2018-11-10 17:57:55','2018-11-03 17:57:55',NULL),(57,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQxMzg3MTEzLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDE5OTE5MTN9.J11smfgCH3ZupluGwcfEA9z99FKXKyNmsLNhzJ5Ittg',NULL,'2018-11-12 11:05:14','2018-11-05 11:05:14',NULL),(58,20,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMCIsImlhdCI6MTU0MTQwODY5Niwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyMDEzNDk2fQ.cZ58hT6u8EkMeougdKNGzx0f4pStuJ-9h1BIwRBaTfU',NULL,'2018-11-12 17:04:56','2018-11-05 17:04:56',NULL),(60,22,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMiIsImlhdCI6MTU0MTQ3MDYyMiwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyMDc1NDIyfQ.XnWKPi03aODETW3lGoC5IVCOmwep9rfY5J8B7h24UgE',NULL,'2018-11-13 10:17:03','2018-11-06 10:17:03',NULL),(62,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQxNDkyNTcwLCJzdWIiOiJqd3R0b2tlbiIsImlzcyI6InNpYm8iLCJleHAiOjE1NDIwOTczNzB9.Rcq6CiWkod0qSUwCza2dV_OLXJatvdRsLOJr8Tp96ZY',NULL,'2018-11-13 16:22:51','2018-11-06 16:22:51',NULL),(63,17,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxNyIsImlhdCI6MTU0MTUwNDQwMywic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyMTA5MjAzfQ.eUSmN_GG-nJMx-7J3DrutnIZs1CWmtCz0TN0NuS7jyA',NULL,'2018-11-13 19:40:03','2018-11-06 19:40:03',NULL),(64,23,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMyIsImlhdCI6MTU0MTU1NjM5NCwic3ViIjoiand0dG9rZW4iLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyMTYxMTk0fQ.NbbK1NRBNt1F7b4UAOemYHVij3JPn2nxYHCzZDz6qyc',NULL,'2018-11-14 10:06:34','2018-11-07 10:06:34',NULL),(65,23,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMyIsImlhdCI6MTU0MTk4NzcwNCwiaXNzIjoic2libyIsImV4cCI6MTU0MjU5MjUwNH0.fXx7uIehmz83_26kuvUE3yf4P06NQCN86m8X-FVPCN0',NULL,'2018-11-19 09:55:04','2018-11-12 09:55:04',NULL),(67,24,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyNCIsImlhdCI6MTU0MjAxMzU5NSwiaXNzIjoic2libyIsImV4cCI6MTU0MjYxODM5NX0.0QIYio38thXz1neLragGMU0kt1z8QJkWGRcgeAS44wM',NULL,'2018-11-19 17:06:36','2018-11-12 17:06:36',NULL),(68,22,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyMiIsImlhdCI6MTU0MjA3MjU5MywiaXNzIjoic2libyIsImV4cCI6MTU0MjY3NzM5M30.NbqeubRcdkKm8EjMPx4bmhbpHoyUCCnUksg_KXEAmAs',NULL,'2018-11-20 09:29:54','2018-11-13 09:29:54',NULL),(71,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQyMTAyNzQwLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyNzA3NTQwfQ.bUA-AsALEswUBFjxZdM0fcGlJZkDel7qe7MkZ51cdz4',NULL,'2018-11-20 17:52:21','2018-11-13 17:52:21',NULL),(72,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQyMTY1OTEzLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyNzcwNzEzfQ.A1kigpV0S_UgQhBwCtUQFz-aJFSUAuQGtQYdmHE066c',NULL,'2018-11-21 11:25:14','2018-11-14 11:25:14',NULL),(73,26,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyNiIsImlhdCI6MTU0MjI1MDI0OCwiaXNzIjoic2libyIsImV4cCI6MTU0Mjg1NTA0OH0.l4E-6pM9sWJMhcrQ96x_yj-v8R1QYMdSxLOZldlYN-I',NULL,'2018-11-22 10:50:49','2018-11-15 10:50:49',NULL),(74,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQyMjcyODIyLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQyODc3NjIyfQ.IZtlerRzmUbNLN9Tgm4jyq8DnOWGXzTOOIPxS0ONw1A',NULL,'2018-11-22 17:07:03','2018-11-15 17:07:03',NULL),(76,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQyNzAyMDE0LCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQzMzA2ODE0fQ.68dfo4DXVInfdG797wsr3jm5Q30OMRqTDCJE6qH92TM',NULL,'2018-11-27 16:20:15','2018-11-20 16:20:15',NULL),(77,27,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyNyIsImlhdCI6MTU0Mjg1MzcyMywiaXNzIjoic2libyIsImV4cCI6MTU0MzQ1ODUyM30.EGiNcwvluEdUcQ9rcGzfz31okoS2Ayusb1lFGNpAKIU',NULL,'2018-11-29 10:28:43','2018-11-22 10:28:43',NULL),(78,28,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyOCIsImlhdCI6MTU0Mjk0MzY1NiwiaXNzIjoic2libyIsImV4cCI6MTU0MzU0ODQ1Nn0.O4gDnsGGfwlpulo86opiqHr2297PNEOHbT1A6-u7-v8',NULL,'2018-11-30 11:27:37','2018-11-23 11:27:37',NULL),(80,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQzMjg5NzEzLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQzODk0NTEzfQ.ejAZJh6qCtjA0vAE-UWBtq4GMT5SzNo56wMGMXfqwcA',NULL,'2018-12-04 11:35:14','2018-11-27 11:35:14',NULL),(83,29,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIyOSIsImlhdCI6MTU0MzMwNzYxOCwiaXNzIjoic2libyIsImV4cCI6MTU0MzkxMjQxOH0.WoPfm7OTgk1GO7rkLkg9hZsrkznyAgOX9jOptTZl52Y',NULL,'2018-12-04 16:33:38','2018-11-27 16:33:38',NULL),(85,30,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIzMCIsImlhdCI6MTU0MzM3NTE5OCwiaXNzIjoic2libyIsImV4cCI6MTU0Mzk3OTk5OH0.xBkfQxFvrcjzIGF-RB87JCEkSuaOnF2t-gO7Ncy2Jr4',NULL,'2018-12-05 11:19:59','2018-11-28 11:19:59',NULL),(88,9,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiI5IiwiaWF0IjoxNTQzNDYwNDAyLCJpc3MiOiJzaWJvIiwiZXhwIjoxNTQ0MDY1MjAyfQ.Q9ioe4DEnzFAsFClrEBAZW9v6GDPYHzUqRB0rFucHlg',NULL,'2018-12-06 11:00:03','2018-11-29 11:00:03',NULL),(89,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MzQ3MzI5NywiaXNzIjoic2libyIsImV4cCI6MTU0NDA3ODA5N30.PEPAxg1-yDqZdzh4qwIQYegYmnctsR3mRCARhJumBNw',NULL,'2018-12-06 14:34:57','2018-11-29 14:34:57',NULL),(91,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MzY2MDQ0NywiaXNzIjoic2libyIsImV4cCI6MTU0NDI2NTI0N30.NKTi_EFHliupsSw8xdzpzSgGYnoT6-CQJQ--Xg53a3M',NULL,'2018-12-08 18:34:07','2018-12-01 18:34:07',NULL),(92,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MzcxNDU3MCwiaXNzIjoic2libyIsImV4cCI6MTU0NDMxOTM3MH0.ZluaRgb0QcmFGhS2b826q9jYl2uZ-MoF_4O0JnSkE9M',NULL,'2018-12-09 09:36:10','2018-12-02 09:36:10',NULL),(94,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0MzkxODc2NCwiaXNzIjoic2libyIsImV4cCI6MTU0NDUyMzU2NH0.WRB3tgmTuwResjULRGD2Dv2958ie8s-gx0uKAALZlkE',NULL,'2018-12-11 18:19:25','2018-12-04 18:19:25',NULL),(95,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0Mzk5ODc1MiwiaXNzIjoic2libyIsImV4cCI6MTU0NDYwMzU1Mn0.YZSOQpTF_86oXsnMcbpS326Qe5kHuI_qyaQwLUsU748',NULL,'2018-12-12 16:32:33','2018-12-05 16:32:33',NULL),(96,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0Mzk5ODc2NiwiaXNzIjoic2libyIsImV4cCI6MTU0NDYwMzU2Nn0.8TR8lW0MVgSTRXcc-EshuVnKKNTwexIlhj6kkO79FSc',NULL,'2018-12-12 16:32:46','2018-12-05 16:32:46',NULL),(97,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0Mzk5ODc3MCwiaXNzIjoic2libyIsImV4cCI6MTU0NDYwMzU3MH0.XH22rU2hnlqDKE7Y-MPMbXXpb-HWd-oBrkFXF1extoA',NULL,'2018-12-12 16:32:51','2018-12-05 16:32:51',NULL),(98,11,'eyJhbGciOiJIUzI1NiJ9.eyJqdGkiOiIxMSIsImlhdCI6MTU0Mzk5ODc3NywiaXNzIjoic2libyIsImV4cCI6MTU0NDYwMzU3N30.HIoBkJvR-In3pdObiujVCEIVEUWEj3d0f_379HdUqL0',NULL,'2018-12-12 16:32:57','2018-12-05 16:32:57',NULL);
/*!40000 ALTER TABLE `tb_user_token` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_warning_history`
--

DROP TABLE IF EXISTS `tb_warning_history`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_warning_history` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
  `pid` bigint(20) NOT NULL COMMENT '病人id',
  `realname` varchar(20) DEFAULT NULL COMMENT '用户姓名',
  `send_time` datetime DEFAULT NULL COMMENT '报警时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='报警记录表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_warning_history`
--

LOCK TABLES `tb_warning_history` WRITE;
/*!40000 ALTER TABLE `tb_warning_history` DISABLE KEYS */;
INSERT INTO `tb_warning_history` VALUES (48,25,'赖女士','2018-12-06 16:25:02'),(49,25,'赖女士','2018-12-07 16:24:40'),(50,25,'赖女士','2018-12-11 16:53:42'),(51,25,'赖女士','2018-12-11 16:53:43'),(52,25,'赖女士','2018-12-11 16:53:45'),(53,25,'赖女士','2018-12-11 16:54:02'),(54,25,'赖女士','2018-12-11 17:37:25');
/*!40000 ALTER TABLE `tb_warning_history` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-14 14:51:29
