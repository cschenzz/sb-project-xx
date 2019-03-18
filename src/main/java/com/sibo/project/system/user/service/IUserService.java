package com.sibo.project.system.user.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.system.user.entity.UserEntity;


/**
 * 用户 业务层
 *
 * @author chenzz
 */
public interface IUserService extends IService<UserEntity> {
    void addSave(UserEntity user);

    void editSave(UserEntity user);

    String randomSalt();

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    UserEntity selectUserByLoginName(String userName);

    /**
     * 通过手机号码查询用户
     *
     * @param phoneNumber 手机号码
     * @return 用户对象信息
     */
    UserEntity selectUserByPhoneNumber(String phoneNumber);

    /**
     * 通过邮箱查询用户
     *
     * @param email 邮箱
     * @return 用户对象信息
     */
    UserEntity selectUserByEmail(String email);

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    UserEntity selectUserById(Long userId);

    /**
     * 修改用户详细信息
     *
     * @param user 用户信息
     * @return 结果
     */
    boolean updateUserInfo(UserEntity user);

}
