package com.sibo.project.iot.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.iot.user.entity.UserEntity;

/**
 * 用户 服务层
 *
 * @author chenzz
 * @date 2019-03-12
 */
public interface IUserService extends IService<UserEntity> {
    void addSave(UserEntity user);

    void editSave(UserEntity user);

    String randomSalt();
}
