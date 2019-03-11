package com.sibo.project.system.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.common.constant.UserConstants;
import com.sibo.common.support.Convert;
import com.sibo.common.utils.StringUtils;
import com.sibo.framework.shiro.service.PasswordService;
import com.sibo.project.system.role.dao.RoleMapper;
import com.sibo.project.system.role.entity.Role;
import com.sibo.project.system.user.dao.UserMapper;
import com.sibo.project.system.user.dao.UserRoleMapper;
import com.sibo.project.system.user.entity.User;
import com.sibo.project.system.user.entity.UserRole;
import com.sibo.project.system.user.service.IUserService;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 用户 业务层处理
 *
 * @author chenzz
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserMapper, User> implements IUserService {

    @Autowired
    private UserMapper userMapper;

    @Autowired
    private RoleMapper roleMapper;

    @Autowired
    private UserRoleMapper userRoleMapper;

    @Autowired
    private PasswordService passwordService;

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    @Override
    public User selectUserByLoginName(String userName) {
        Wrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .eq(User::getLoginName, userName);
        return super.getOne(wrapper);
    }

    /**
     * 通过手机号码查询用户
     *
     * @param phoneNumber 手机号
     * @return 用户对象信息
     */
    @Override
    public User selectUserByPhoneNumber(String phoneNumber) {
        Wrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .eq(User::getPhonenumber, phoneNumber);
        return super.getOne(wrapper);
    }

    /**
     * 通过邮箱查询用户
     *
     * @param email 邮箱
     * @return 用户对象信息
     */
    @Override
    public User selectUserByEmail(String email) {
        Wrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .eq(User::getEmail, email);
        return super.getOne(wrapper);
    }

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    @Override
    public User selectUserById(Long userId) {
        Wrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .eq(User::getUserId, userId);
        return super.getOne(wrapper);
    }

    /**
     * 通过用户ID删除用户
     *
     * @param userId 用户ID
     * @return 结果
     */
    @Override
    public boolean deleteUserById(Long userId) {
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        return super.removeById(userId);
    }

    /**
     * 批量删除用户信息
     *
     * @param ids 需要删除的数据ID
     * @return 结果
     */
    @Override
    public boolean deleteUserByIds(String ids) throws Exception {
        Long[] userIds = Convert.toLongArray(ids);
        for (Long userId : userIds) {
            if (User.isAdmin(userId)) {
                throw new Exception("不允许删除超级管理员用户");
            }
        }
        return super.removeByIds(Arrays.asList(userIds));
    }

    /**
     * 新增保存用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean insertUser(User user) {
        user.randomSalt();
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
        // 新增用户信息
        boolean result = super.save(user);
        // 新增用户与角色管理
        insertUserRole(user);
        return result;
    }

    /**
     * 修改保存用户信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean updateUser(User user) {
        Long userId = user.getUserId();
        // 删除用户与角色关联
        userRoleMapper.deleteUserRoleByUserId(userId);
        // 新增用户与角色管理
        insertUserRole(user);
        return super.updateById(user);
    }

    /**
     * 修改用户个人详细信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean updateUserInfo(User user) {
        return updateById(user);
    }

    /**
     * 修改用户密码
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean resetUserPwd(User user) {
        user.randomSalt();
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), user.getSalt()));
        return updateUserInfo(user);
    }

    /**
     * 新增用户角色信息
     *
     * @param user 用户对象
     */
    public void insertUserRole(User user) {
        // 新增用户与角色管理
        List<UserRole> list = new ArrayList<UserRole>();
        for (Long roleId : user.getRoleIds()) {
            UserRole ur = new UserRole();
            ur.setUserId(user.getUserId());
            ur.setRoleId(roleId);
            list.add(ur);
        }
        if (list.size() > 0) {
            userRoleMapper.batchUserRole(list);
        }
    }

    /**
     * 校验用户名称是否唯一
     *
     * @param loginName 用户名
     * @return
     */
    @Override
    public String checkLoginNameUnique(String loginName) {
        Wrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .eq(User::getLoginName, loginName);
        int count = super.count(wrapper);

        if (count > 0) {
            return UserConstants.USER_NAME_NOT_UNIQUE;
        }
        return UserConstants.USER_NAME_UNIQUE;
    }

    /**
     * 校验用户名称是否唯一
     *
     * @param user 用户
     * @return
     */
    @Override
    public String checkPhoneUnique(User user) {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();

        Wrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .eq(User::getPhonenumber, user.getPhonenumber());
        User info = super.getOne(wrapper);

        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
            return UserConstants.USER_PHONE_NOT_UNIQUE;
        }
        return UserConstants.USER_PHONE_UNIQUE;
    }

    /**
     * 校验email是否唯一
     *
     * @param user 用户
     * @return
     */
    @Override
    public String checkEmailUnique(User user) {
        Long userId = StringUtils.isNull(user.getUserId()) ? -1L : user.getUserId();
        Wrapper<User> wrapper = new LambdaQueryWrapper<User>()
                .eq(User::getEmail, user.getEmail());
        User info = super.getOne(wrapper);

        if (StringUtils.isNotNull(info) && info.getUserId().longValue() != userId.longValue()) {
            return UserConstants.USER_EMAIL_NOT_UNIQUE;
        }
        return UserConstants.USER_EMAIL_UNIQUE;
    }

    /**
     * 查询用户所属角色组
     *
     * @param userId 用户ID
     * @return 结果
     */
    @Override
    public String selectUserRoleGroup(Long userId) {
        List<Role> list = roleMapper.selectRolesByUserId(userId);
        StringBuffer idsStr = new StringBuffer();
        for (Role role : list) {
            idsStr.append(role.getRoleName()).append(",");
        }
        if (StringUtils.isNotEmpty(idsStr.toString())) {
            return idsStr.substring(0, idsStr.length() - 1);
        }
        return idsStr.toString();
    }

    /**
     * 根据用户名和密码登陆
     *
     * @param loginName
     * @param password
     * @return
     */
    @Override
    public User checkLogin(String loginName, String password) {

        User loginUser = selectUserByLoginName(loginName);
        if (loginUser != null) {
            //使用salt进行md5加密后验证密码
            String encryptPwd = passwordService.encryptPassword(loginName, password, loginUser.getSalt());
            if (encryptPwd.equals(loginUser.getPassword())) {
                return loginUser;
            }
        }

        return null;
    }

    @Override
    public boolean checkPassword(Long userid, String password) {

        User loginUser = selectUserById(userid);
        if (loginUser != null) {
            //使用salt进行md5加密后验证密码
            String encryptPwd = passwordService.encryptPassword(loginUser.getLoginName(), password, loginUser.getSalt());
            if (encryptPwd.equals(loginUser.getPassword())) {
                return true;
            }
        }

        return false;
    }

    @Override
    public String randomSalt() {
        // 一个Byte占两个字节，此处生成的3字节，字符串长度为6
        SecureRandomNumberGenerator secureRandom = new SecureRandomNumberGenerator();
        String hex = secureRandom.nextBytes(3).toHex();
        return hex;
    }

    @Override
    public boolean modifyNewPassword(Long userid, String newPasswod) {

        User loginUser = selectUserById(userid);
        if (loginUser != null) {
            //使用salt进行md5加密后验证密码
            String salt = randomSalt();
            String encryptPwd = passwordService.encryptPassword(loginUser.getLoginName(), newPasswod, salt);


            User u = new User();
            u.setUserId(userid);
            u.setSalt(salt);
            u.setPassword(encryptPwd);

            this.updateById(u);

            return true;

        }

        return false;
    }

    @Override
    public void registerUser(String name, String password, String email, String mobile, String address, String realname) {
        User u = new User();
        u.setUserName("sibo");
        u.setLoginName(name);
        u.setEmail(email);
        u.setPhonenumber(mobile);
        String salt = randomSalt();
        String encryptPwd = passwordService.encryptPassword(name, password, salt);
        u.setSalt(salt);
        u.setPassword(encryptPwd);
        u.setRegtime(new Date());

        this.save(u);

    }
}
