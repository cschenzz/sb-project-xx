insert into sys_menu (menu_name, parent_id, order_num, url,menu_type, visible, perms, icon, create_by, create_time, update_by, update_time, remark)
values('医院资料', '2000', '200', '/yl/hospital/hospitalDetail', 'C', '0', 'yl:hospital:viewdetail', '#', 'admin', '2018-03-01', 'ry', '2018-03-01', '医院资料');



CREATE TABLE `tb_hand_msg` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `cs` varchar(15) DEFAULT NULL COMMENT '厂商',
  `device_id` varchar(55) DEFAULT NULL COMMENT '设备id',
  `data_length` varchar(5) DEFAULT NULL COMMENT '数据长度',
  `data_type` varchar(15) DEFAULT NULL COMMENT '数据类型',
  `data` text COMMENT '数据',
  `raw_data` text COMMENT '原始数据',
  `data_time` datetime DEFAULT NULL COMMENT '数据时间',
  PRIMARY KEY (`id`),
  KEY `deviceId` (`device_id`),
  KEY `dataTime` (`data_time`),
  KEY `dataType` (`data_type`)
) ENGINE=InnoDB AUTO_INCREMENT=2433818 DEFAULT CHARSET=utf8 COMMENT='手环数据表';

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
) ENGINE=InnoDB AUTO_INCREMENT=100000000 DEFAULT CHARSET=utf8 COMMENT='亲友表';

CREATE TABLE `tb_user_device` (
  `user_id` bigint(20) NOT NULL COMMENT '用户ID',
  `barcode` varchar(100) NOT NULL COMMENT '设备条码',
  `xo_active` tinyint(1) unsigned DEFAULT NULL COMMENT '是否默认设备,1为默认,0不是',
  `type` tinyint(1) unsigned DEFAULT NULL COMMENT '设备类型,1为病人本人设备,2为亲友关注的设备',
  `pid` bigint(20) DEFAULT NULL COMMENT '设备对应的病人id',
  `devicename` varchar(245) DEFAULT NULL COMMENT '设备名称',
  PRIMARY KEY (`user_id`,`barcode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户和设备关联表';


CREATE TABLE `tb_user_friend_relation` (
	`pid` BIGINT(20) NOT NULL COMMENT '病人用户ID',
	`fid` BIGINT(20) NOT NULL COMMENT '亲友用户ID',
	`barcode` VARCHAR(245) NULL DEFAULT NULL COMMENT '设备条码',
	`deviceid` BIGINT(20) NULL DEFAULT NULL COMMENT '病人表中的设备id',
	`current_device` TINYINT(1) UNSIGNED NULL DEFAULT '0' COMMENT '是否当前设备,1为当前,0不是',
	PRIMARY KEY (`pid`, `fid`)
)
COMMENT='病人和亲友关联表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
;

CREATE TABLE `tb_patient_user` (
	`id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '主键,自增长',
	`uuid` VARCHAR(60) NULL DEFAULT NULL COMMENT 'uuid,程序生成',
	`user_id` VARCHAR(45) NULL DEFAULT NULL COMMENT '用户数字账号',
	`username` VARCHAR(50) NULL DEFAULT NULL COMMENT '用户名',
	`password` VARCHAR(100) NULL DEFAULT NULL COMMENT '密码',
	`nick_name` VARCHAR(145) NULL DEFAULT NULL,
	`salt` VARCHAR(20) NULL DEFAULT NULL COMMENT '盐',
	`user_type` VARCHAR(2) NULL DEFAULT NULL COMMENT '用户类型（00系统用户）',
	`email` VARCHAR(100) NULL DEFAULT NULL COMMENT '邮箱',
	`mobile_phone` VARCHAR(20) NULL DEFAULT NULL COMMENT '手机号',
	`status` TINYINT(4) NULL DEFAULT '1' COMMENT '状态  0：禁用   1：正常',
	`create_time` DATETIME NULL DEFAULT NULL COMMENT '创建时间',
	`last_logintime` DATETIME NULL DEFAULT NULL COMMENT '最后登陆时间',
	`avatar` VARCHAR(245) NULL DEFAULT '' COMMENT '头像',
	`sex` TINYINT(4) NULL DEFAULT '0' COMMENT '性别  1：男   2：女',
	`realname` VARCHAR(60) NULL DEFAULT NULL COMMENT '用户姓名,真实名',
	`register_type` INT(11) NULL DEFAULT NULL COMMENT '用户首次注册时的类型,如1.手机号,2.email,3.qq,4.微信等',
	`height` INT(11) NULL DEFAULT NULL COMMENT '身高(cm)',
	`weight` INT(11) NULL DEFAULT NULL COMMENT '体重(kg)',
	`birthday` DATETIME NULL DEFAULT NULL COMMENT '出生年月',
	`blood_type` CHAR(10) NULL DEFAULT NULL COMMENT '血型',
	`job` VARCHAR(205) NULL DEFAULT NULL COMMENT '职业',
	`marriage` VARCHAR(45) NULL DEFAULT NULL COMMENT '婚姻,已婚,未婚',
	`allergic_substance` VARCHAR(245) NULL DEFAULT NULL COMMENT '过敏物质',
	`drug_allergy` VARCHAR(245) NULL DEFAULT NULL COMMENT '药物过敏史',
	`smoke` VARCHAR(245) NULL DEFAULT NULL COMMENT '吸烟状况',
	`drinking_frequency` VARCHAR(245) NULL DEFAULT NULL COMMENT '饮酒频率',
	`exercise_frequency` VARCHAR(245) NULL DEFAULT NULL COMMENT '锻炼频率',
	`history_disease` VARCHAR(245) NULL DEFAULT NULL COMMENT '疾病史',
	`time_illness` VARCHAR(245) NULL DEFAULT NULL COMMENT '患病时间',
	`other_diseases` VARCHAR(245) NULL DEFAULT NULL COMMENT '其他疾病',
	`other_time_illness` VARCHAR(245) NULL DEFAULT NULL COMMENT '其他疾病患病时间',
	`major_surgical_history` VARCHAR(245) NULL DEFAULT NULL COMMENT '重大手术史',
	`doctor_id` BIGINT(20) NULL DEFAULT NULL COMMENT '医生id',
	`address` VARCHAR(545) NULL DEFAULT NULL COMMENT '地址',
	`device_id` BIGINT(20) NULL DEFAULT '0' COMMENT '设备id',
	`valid_date` DATETIME NULL DEFAULT NULL COMMENT '服务期',
	`high_standard` INT(11) NULL DEFAULT '120' COMMENT '高压标准值 120',
	`low_standard` INT(11) NULL DEFAULT '80' COMMENT '低压标准值 80',
	`high_high_value` INT(11) NULL DEFAULT '140' COMMENT '高压高值 140',
	`low_high_value` INT(11) NULL DEFAULT '90' COMMENT '低压高值 90',
	`high_low_value` INT(11) NULL DEFAULT '119' COMMENT '高压低值 119',
	`low_low_value` INT(11) NULL DEFAULT '79' COMMENT '低压低值 79',
	`heart_standard` INT(11) NULL DEFAULT '80' COMMENT '心率标准值 80',
	PRIMARY KEY (`id`)
)
COMMENT='病人表'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=38
;

