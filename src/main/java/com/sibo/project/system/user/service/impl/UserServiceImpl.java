package com.sibo.project.system.user.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.common.constant.UserConstants;
import com.sibo.framework.shiro.service.PasswordService;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.system.user.dao.UserDao;
import com.sibo.project.system.user.entity.UserEntity;
import com.sibo.project.system.user.service.IUserService;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import java.util.Date;

/**
 * 用户 业务层处理
 *
 * @author chenzz
 */
@Service
public class UserServiceImpl extends ServiceImpl<UserDao, UserEntity> implements IUserService {

    @Autowired
    private PasswordService passwordService;

    /**
     * 分页查询:用户
     *
     * @return 分页page
     */
    @Override
    public IPage<?> listPage(UserEntity user) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                    .like(UserEntity::getLoginName, keyWord)
                    .or().like(UserEntity::getPhonenumber, keyWord)
                    .orderByDesc(UserEntity::getUserId);

            //---------------------------
            IPage<UserEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        //---------------------------
        Wrapper<UserEntity> wrapperSort = new LambdaQueryWrapper<UserEntity>()
                .orderByDesc(UserEntity::getUserId);

        IPage<UserEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
    }

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
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), salt));

        user.setCreateTime(new Date());
        baseMapper.insert(user);
    }

    @Override
    public void editSave(UserEntity user) {
        baseMapper.updateById(user);
    }
    //-------------------

    /**
     * 通过用户名查询用户
     *
     * @param userName 用户名
     * @return 用户对象信息
     */
    @Override
    public UserEntity selectUserByLoginName(String userName) {
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .eq(UserEntity::getLoginName, userName);
        return super.getOne(wrapper);
    }

    /**
     * 通过手机号码查询用户
     *
     * @param phoneNumber 手机号
     * @return 用户对象信息
     */
    @Override
    public UserEntity selectUserByPhoneNumber(String phoneNumber) {
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .eq(UserEntity::getPhonenumber, phoneNumber);
        return super.getOne(wrapper);
    }

    /**
     * 通过邮箱查询用户
     *
     * @param email 邮箱
     * @return 用户对象信息
     */
    @Override
    public UserEntity selectUserByEmail(String email) {
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .eq(UserEntity::getEmail, email);
        return super.getOne(wrapper);
    }

    /**
     * 通过用户ID查询用户
     *
     * @param userId 用户ID
     * @return 用户对象信息
     */
    @Override
    public UserEntity selectUserById(Long userId) {
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .eq(UserEntity::getUserId, userId);
        return super.getOne(wrapper);
    }

    /**
     * 修改用户个人详细信息
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean updateUserInfo(UserEntity user) {
        return updateById(user);
    }

    /**
     * 修改用户密码
     *
     * @param user 用户信息
     * @return 结果
     */
    @Override
    public boolean resetUserPwd(UserEntity user) {
        String salt = randomSalt();
        user.setSalt(salt);
        user.setPassword(passwordService.encryptPassword(user.getLoginName(), user.getPassword(), salt));
        return updateUserInfo(user);
    }

    /**
     * 校验用户名称是否唯一
     *
     * @param loginName 用户名
     * @return
     */
    @Override
    public String checkLoginNameUnique(String loginName) {
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .eq(UserEntity::getLoginName, loginName);

        int count = this.count(wrapper);
        if (count > 0) {
            return UserConstants.USER_NAME_NOT_UNIQUE;
        }
        return UserConstants.USER_NAME_UNIQUE;
    }

    /**
     * 校验用户名称是否唯一
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public String checkPhoneUnique(UserEntity user) {
        Long userId = user.getUserId() == null ? -1L : user.getUserId();
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .eq(UserEntity::getPhonenumber, user.getPhonenumber());

        UserEntity info = this.getOne(wrapper);

        if (info != null && info.getUserId().longValue() != userId.longValue()) {
            return UserConstants.USER_PHONE_NOT_UNIQUE;
        }
        return UserConstants.USER_PHONE_UNIQUE;
    }

    /**
     * 校验email是否唯一
     *
     * @param user 用户信息
     * @return
     */
    @Override
    public String checkEmailUnique(UserEntity user) {
        Long userId = user.getUserId() == null ? -1L : user.getUserId();
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .eq(UserEntity::getEmail, user.getEmail());

        UserEntity info = this.getOne(wrapper);

        if (info != null && info.getUserId().longValue() != userId.longValue()) {
            return UserConstants.USER_EMAIL_NOT_UNIQUE;
        }
        return UserConstants.USER_EMAIL_UNIQUE;
    }
}
