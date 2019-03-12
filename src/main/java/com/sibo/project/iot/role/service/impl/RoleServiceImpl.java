package com.sibo.project.iot.role.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.role.dao.RoleDao;
import com.sibo.project.iot.role.entity.RoleEntity;
import com.sibo.project.iot.role.service.IRoleService;

/**
 * 角色 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-12
 */
@Service("roleService")
public class RoleServiceImpl extends ServiceImpl<RoleDao, RoleEntity> implements IRoleService {
}
