#### 项目介绍
根据高血压健康管理平台改写成cnSibo用户中心,物联网平台

sibo后台通用框架,用户表做了一些字段上的修改

| Entity   |  原来表字段  |  本系统表字段 |
|----------|:------------:|------:|
| userId |  user_id | id |
| loginName |    login_name   |   name |
| phonenumber | phonenumber |    mobile |


在其他系统中使用请注意根据实际需要进行修改
另外,因为修改这些字段导致mapper/system/RoleMapper.xml中关联sys_user表查询时的user_id字段修改为id
还有把不需要的sys_dept等几个表也删除了

如有需要,请参考原设计

#### 软件架构
软件架构说明

#### 使用说明

1. 删除不相干文件
2. 修改登录界面(背景图)
3. 后台管理界面做调整