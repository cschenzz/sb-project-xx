package com.sibo.project.iot.user.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.user.dao.UserDao;
import com.sibo.project.iot.user.entity.UserEntity;
import com.sibo.project.iot.user.service.IUserService;

/**
 * 用户 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-12
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements IUserService {
}
