-- ----------------------------
-- 用户信息表
-- ----------------------------
drop table if exists sys_user;
create table sys_user (
  user_id 			int(11) 		not null auto_increment    comment '用户ID',
  dept_id 			int(11) 		default null			   comment '部门ID',
  login_name 		varchar(30) 	not null 				   comment '登录账号',
  user_name 		varchar(30) 	not null 				   comment '用户昵称',
  user_type 		varchar(2) 	    default '00' 		       comment '用户类型（00系统用户）',
  email  			varchar(50) 	default '' 				   comment '用户邮箱',
  phonenumber  		varchar(11) 	default '' 				   comment '手机号码',
  sex  		        char(1) 	    default '0' 			   comment '用户性别（0男 1女 2未知）',
  avatar            varchar(100) 	default '' 				   comment '头像路径',
  password 			varchar(50) 	default '' 				   comment '密码',
  salt 				varchar(20) 	default '' 				   comment '盐加密',
  status 			char(1) 		default '0' 			   comment '帐号状态（0正常 1停用）',
  del_flag			char(1) 		default '0' 			   comment '删除标志（0代表存在 2代表删除）',
  login_ip          varchar(50)     default ''                 comment '最后登陆IP',
  login_date        datetime                                   comment '最后登陆时间',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time 	    datetime                                   comment '创建时间',
  update_by         varchar(64)     default ''                 comment '更新者',
  update_time       datetime                                   comment '更新时间',
  remark 		    varchar(500) 	default '' 				   comment '备注',
  primary key (user_id)
) engine=innodb auto_increment=100 default charset=utf8 comment = '用户信息表';

-- ----------------------------
-- 初始化-用户信息表数据
-- ----------------------------
insert into sys_user values(1,  103, 'admin', 'xxxx', '00', 'cs.chenzz@qq.com', '13888888888', '1', '', '639e49319f05bdfbc960acd029aa66ab', '3bc391', '0', '0', '127.0.0.1', '2018-09-10 11-33-00', 'admin', '2018-09-10 11-33-00', 'sb', '2018-03-16 11-33-00', '管理员');

-- ----------------------------
-- 角色信息表
-- ----------------------------
drop table if exists sys_role;
create table sys_role (
  role_id 			int(11) 		not null auto_increment    comment '角色ID',
  role_name 		varchar(30) 	not null 				   comment '角色名称',
  role_key 		    varchar(100) 	not null 				   comment '角色权限字符串',
  role_sort         int(4)          not null                   comment '显示顺序',
  data_scope        char(1) 	    default '1'				   comment '数据范围（1：全部数据权限 2：自定数据权限）',
  status 			char(1) 		not null 			       comment '角色状态（0正常 1停用）',
  del_flag			char(1) 		default '0' 			   comment '删除标志（0代表存在 2代表删除）',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time 		datetime                                   comment '创建时间',
  update_by 		varchar(64) 	default ''			       comment '更新者',
  update_time 		datetime                                   comment '更新时间',
  remark 			varchar(500) 	default null 				   comment '备注',
  primary key (role_id)
) engine=innodb auto_increment=100 default charset=utf8 comment = '角色信息表';

-- ----------------------------
-- 初始化-角色信息表数据
-- ----------------------------
insert into sys_role values('1', '管理员',   'admin',  1, 1, '0', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '管理员');
insert into sys_role values('2', '普通角色', 'common', 2, 2, '0', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '普通角色');


-- ----------------------------
-- 菜单权限表
-- ----------------------------
drop table if exists sys_menu;
create table sys_menu (
  menu_id 			int(11) 		not null auto_increment    comment '菜单ID',
  menu_name 		varchar(50) 	not null 				   comment '菜单名称',
  parent_id 		int(11) 		default 0 			       comment '父菜单ID',
  order_num 		int(4) 			default 0 			       comment '显示顺序',
  url 				varchar(200) 	default '#'				   comment '请求地址',
  menu_type 		char(1) 		default '' 			       comment '菜单类型（M目录 C菜单 F按钮）',
  visible 			char(1) 		default 0 				   comment '菜单状态（0显示 1隐藏）',
  perms 			varchar(100) 	default null 				   comment '权限标识',
  icon 				varchar(100) 	default '#' 			   comment '菜单图标',
  create_by         varchar(64)     default ''                 comment '创建者',
  create_time 		datetime                                   comment '创建时间',
  update_by 		varchar(64) 	default ''			       comment '更新者',
  update_time 		datetime                                   comment '更新时间',
  remark 			varchar(500) 	default '' 				   comment '备注',
  primary key (menu_id)
) engine=innodb auto_increment=2000 default charset=utf8 comment = '菜单权限表';

-- ----------------------------
-- 用户和角色关联表  用户N-1角色
-- ----------------------------
drop table if exists sys_user_role;
create table sys_user_role (
  user_id 	int(11) not null comment '用户ID',
  role_id 	int(11) not null comment '角色ID',
  primary key(user_id, role_id)
) engine=innodb default charset=utf8 comment = '用户和角色关联表';

-- ----------------------------
-- 初始化-用户和角色关联表数据
-- ----------------------------
insert into sys_user_role values ('1', '1');

-- ----------------------------
-- 角色和菜单关联表  角色1-N菜单
-- ----------------------------
drop table if exists sys_role_menu;
create table sys_role_menu (
  role_id 	int(11) not null comment '角色ID',
  menu_id 	int(11) not null comment '菜单ID',
  primary key(role_id, menu_id)
) engine=innodb default charset=utf8 comment = '角色和菜单关联表';

-- ----------------------------
-- 操作日志记录
-- ----------------------------
drop table if exists sys_oper_log;
create table sys_oper_log (
  oper_id 			int(11) 		not null auto_increment    comment '日志主键',
  title             varchar(50)     default ''                 comment '模块标题',
  business_type     int(2)          default 0                  comment '业务类型（0其它 1新增 2修改 3删除）',
  method            varchar(100)    default ''                 comment '方法名称',
  operator_type     int(1)          default 0                  comment '操作类别（0其它 1后台用户 2手机端用户）',
  oper_name 	    varchar(50)     default '' 		 	 	   comment '操作人员',
  dept_name 		varchar(50)     default '' 		 	 	   comment '部门名称',
  oper_url 		    varchar(255) 	default '' 				   comment '请求URL',
  oper_ip 			varchar(50) 	default '' 				   comment '主机地址',
  oper_location     varchar(255)    default ''                 comment '操作地点',
  oper_param 		varchar(2000) 	default '' 				   comment '请求参数',
  status 			int(1) 		    default 0				   comment '操作状态（0正常 1异常）',
  error_msg 		varchar(2000) 	default '' 				   comment '错误消息',
  oper_time 		datetime                                   comment '操作时间',
  primary key (oper_id)
) engine=innodb auto_increment=100 default charset=utf8 comment = '操作日志记录';


-- ----------------------------
-- 字典类型表
-- ----------------------------
drop table if exists sys_dict_type;
create table sys_dict_type
(
	dict_id          int(11) 		 not null auto_increment    comment '字典主键',
	dict_name        varchar(100)    default ''                 comment '字典名称',
	dict_type        varchar(100)    default ''                 comment '字典类型',
  status 			 char(1) 		 default '0'			    comment '状态（0正常 1停用）',
  create_by        varchar(64)     default ''                 comment '创建者',
  create_time      datetime                                   comment '创建时间',
  update_by        varchar(64) 	 default ''			        comment '更新者',
	update_time      datetime                                   comment '更新时间',
  remark 	         varchar(500) 	 default null 				comment '备注',
	primary key (dict_id),
	unique (dict_type)
) engine=innodb auto_increment=100 default charset=utf8 comment = '字典类型表';

insert into sys_dict_type values(1,  '用户性别', 'sys_user_sex',        '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '用户性别列表');
insert into sys_dict_type values(2,  '菜单状态', 'sys_show_hide',       '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '菜单状态列表');
insert into sys_dict_type values(3,  '系统开关', 'sys_normal_disable',  '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '系统开关列表');
insert into sys_dict_type values(4,  '任务状态', 'sys_job_status',      '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '任务状态列表');
insert into sys_dict_type values(5,  '系统是否', 'sys_yes_no',          '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '系统是否列表');
insert into sys_dict_type values(6,  '通知类型', 'sys_notice_type',     '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '通知类型列表');
insert into sys_dict_type values(7,  '通知状态', 'sys_notice_status',   '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '通知状态列表');
insert into sys_dict_type values(8,  '操作类型', 'sys_oper_type',       '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '操作类型列表');
insert into sys_dict_type values(9,  '系统状态', 'sys_common_status',   '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '登录状态列表');


-- ----------------------------
-- 字典数据表
-- ----------------------------
drop table if exists sys_dict_data;
create table sys_dict_data
(
	dict_code        int(11) 		 not null auto_increment    comment '字典编码',
	dict_sort        int(4)          default 0                  comment '字典排序',
	dict_label       varchar(100)    default ''                 comment '字典标签',
	dict_value       varchar(100)    default ''                 comment '字典键值',
	dict_type        varchar(100)    default ''                 comment '字典类型',
	css_class        varchar(100)    default null                 comment '样式属性（其他样式扩展）',
	list_class       varchar(100)    default null                 comment '表格回显样式',
	is_default       char(1)         default 'N'                comment '是否默认（Y是 N否）',
  status 			     char(1) 		 default '0'			    comment '状态（0正常 1停用）',
  create_by        varchar(64)     default ''                 comment '创建者',
  create_time      datetime                                   comment '创建时间',
  update_by        varchar(64) 	 default ''			        comment '更新者',
	update_time      datetime                                   comment '更新时间',
  remark 	         varchar(500) 	 default null 				comment '备注',
	primary key (dict_code)
) engine=innodb auto_increment=100 default charset=utf8 comment = '字典数据表';


insert into sys_dict_data values(1,  1,  '男',       '0',  'sys_user_sex',        '',   '',        'Y', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '性别男');
insert into sys_dict_data values(2,  2,  '女',       '1',  'sys_user_sex',        '',   '',        'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '性别女');
insert into sys_dict_data values(3,  3,  '未知',     '2',  'sys_user_sex',        '',   '',        'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '性别未知');
insert into sys_dict_data values(4,  1,  '显示',     '0',  'sys_show_hide',       '',   'primary', 'Y', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '显示菜单');
insert into sys_dict_data values(5,  2,  '隐藏',     '1',  'sys_show_hide',       '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '隐藏菜单');
insert into sys_dict_data values(6,  1,  '正常',     '0',  'sys_normal_disable',  '',   'primary', 'Y', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '正常状态');
insert into sys_dict_data values(7,  2,  '停用',     '1',  'sys_normal_disable',  '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '停用状态');
insert into sys_dict_data values(8,  1,  '正常',     '0',  'sys_job_status',      '',   'primary', 'Y', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '正常状态');
insert into sys_dict_data values(9,  2,  '暂停',     '1',  'sys_job_status',      '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '停用状态');
insert into sys_dict_data values(10, 1,  '是',       'Y',  'sys_yes_no',          '',   'primary', 'Y', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '系统默认是');
insert into sys_dict_data values(11, 2,  '否',       'N',  'sys_yes_no',          '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '系统默认否');
insert into sys_dict_data values(12, 1,  '通知',     '1',  'sys_notice_type',     '',   'warning', 'Y', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '通知');
insert into sys_dict_data values(13, 2,  '公告',     '2',  'sys_notice_type',     '',   'success', 'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '公告');
insert into sys_dict_data values(14, 1,  '正常',     '0',  'sys_notice_status',   '',   'primary', 'Y', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '正常状态');
insert into sys_dict_data values(15, 2,  '关闭',     '1',  'sys_notice_status',   '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '关闭状态');
insert into sys_dict_data values(16, 1,  '新增',     '1',  'sys_oper_type',       '',   'info',    'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '新增操作');
insert into sys_dict_data values(17, 2,  '修改',     '2',  'sys_oper_type',       '',   'info',    'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '修改操作');
insert into sys_dict_data values(18, 3,  '删除',     '3',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '删除操作');
insert into sys_dict_data values(19, 4,  '授权',     '4',  'sys_oper_type',       '',   'primary', 'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '授权操作');
insert into sys_dict_data values(20, 5,  '导出',     '5',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '导出操作');
insert into sys_dict_data values(21, 6,  '导入',     '6',  'sys_oper_type',       '',   'warning', 'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '导入操作');
insert into sys_dict_data values(22, 7,  '强退',     '7',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '强退操作');
insert into sys_dict_data values(24, 8,  '清空数据', '9',  'sys_oper_type',       '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '清空操作');
insert into sys_dict_data values(25, 1,  '成功',     '0',  'sys_common_status',   '',   'primary', 'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '正常状态');
insert into sys_dict_data values(26, 2,  '失败',     '1',  'sys_common_status',   '',   'danger',  'N', '0', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '停用状态');

-- ----------------------------
-- 参数配置表
-- ----------------------------
drop table if exists sys_config;
create table sys_config (
	config_id 		   int(5) 	     not null auto_increment    comment '参数主键',
	config_name        varchar(100)  default ''                 comment '参数名称',
	config_key         varchar(100)  default ''                 comment '参数键名',
	config_value       varchar(100)  default ''                 comment '参数键值',
	config_type        char(1)       default 'N'                comment '系统内置（Y是 N否）',
  create_by          varchar(64)   default ''                 comment '创建者',
  create_time 	   datetime                                 comment '创建时间',
  update_by          varchar(64)   default ''                 comment '更新者',
  update_time        datetime                                 comment '更新时间',
	remark 	           varchar(500)  default null 				comment '备注',
	primary key (config_id)
) engine=innodb auto_increment=100 default charset=utf8 comment = '参数配置表';

insert into sys_config values(1, '主框架页-默认皮肤样式名称', 'sys.index.skinName',     'skin-blue',     'Y', 'admin', '2018-03-16 11-33-00', 'ry', '2018-03-16 11-33-00', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow' );
insert into sys_config values(2, '用户管理-账号初始密码',     'sys.user.initPassword',  '88888888',        'Y', 'admin', '2018-03-16 11-33-00', 'sb', '2018-03-16 11-33-00', '初始化密码 88888888' );


-- ----------------------------
-- 系统访问记录
-- ----------------------------
drop table if exists sys_logininfor;
create table sys_logininfor (
  info_id 		 int(11) 	   not null auto_increment   comment '访问ID',
  login_name 	 varchar(50)   default '' 			     comment '登录账号',
  ipaddr 		 varchar(50)   default '' 			     comment '登录IP地址',
  login_location varchar(255)  default ''                comment '登录地点',
  browser  		 varchar(50)   default '' 			     comment '浏览器类型',
  os      		 varchar(50)   default '' 			     comment '操作系统',
  status 		 char(1) 	   default '0' 			     comment '登录状态（0成功 1失败）',
  msg      		 varchar(255)  default '' 			     comment '提示消息',
  login_time 	 datetime                                comment '访问时间',
  primary key (info_id)
) engine=innodb auto_increment=100 default charset=utf8 comment = '系统访问记录';


-- ----------------------------
-- 在线用户记录
-- ----------------------------
drop table if exists sys_user_online;
create table sys_user_online (
  sessionId 	    varchar(50)  default ''              	comment '用户会话id',
  login_name 	    varchar(50)  default '' 		 	 	comment '登录账号',
  dept_name 		varchar(50)  default '' 		 	 	comment '部门名称',
  ipaddr 		    varchar(50)  default '' 			 	comment '登录IP地址',
  login_location    varchar(255) default ''                 comment '登录地点',
  browser  		    varchar(50)  default '' 			 	comment '浏览器类型',
  os      		    varchar(50)  default '' 			 	comment '操作系统',
  status      	    varchar(10)  default '' 			 	comment '在线状态on_line在线off_line离线',
  start_timestamp 	datetime                                comment 'session创建时间',
  last_access_time  datetime                                comment 'session最后访问时间',
  expire_time 	    int(5) 		 default 0 			 	    comment '超时时间，单位为分钟',
  primary key (sessionId)
) engine=innodb default charset=utf8 comment = '在线用户记录';
