package com.sibo.project.iot.user.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.framework.shiro.service.PasswordService;
import com.sibo.project.iot.user.dao.UserDao;
import com.sibo.project.iot.user.entity.UserEntity;
import com.sibo.project.iot.user.service.IUserService;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 用户 服务层实现
 *
 * @author chenzz
 * @date 2019-03-12
 */
@Service("userService")
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements IUserService {

    @Autowired
    private PasswordService passwordService;

    @Override
    public String randomSalt() {
        // 一个Byte占两个字节，此处生成的3字节，字符串长度为6
        SecureRandomNumberGenerator secureRandom = new SecureRandomNumberGenerator();
        String hex = secureRandom.nextBytes(3).toHex();
        return hex;
    }

    @Override
    public void addSave(UserEntity user) {
        String salt = randomSalt();
        user.setSalt(salt);
        user.setPassword(passwordService.encryptPassword(user.getName(), user.getPassword(), salt));

        user.setRegtime(new Date());
        baseMapper.insert(user);
    }

    @Override
    public void editSave(UserEntity user) {
        baseMapper.updateById(user);
    }
}
