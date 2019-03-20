package com.sibo.framework.shiro.service;

import com.sibo.common.constant.Constants;
import com.sibo.common.constant.UserConstants;
import com.sibo.common.exception.user.UserBlockedException;
import com.sibo.common.exception.user.UserNotExistsException;
import com.sibo.common.exception.user.UserPasswordNotMatchException;
import com.sibo.common.utils.DateUtils;
import com.sibo.common.utils.MessageUtils;
import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.project.iot.logLogin.service.ILogLoginService;
import com.sibo.project.system.user.entity.UserEntity;
import com.sibo.project.system.user.entity.UserStatus;
import com.sibo.project.system.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.util.StringUtils;

/**
 * 登录校验方法
 *
 * @author chenzz
 */
@Component
public class LoginService {
    @Autowired
    private PasswordService passwordService;

    @Autowired
    private IUserService userService;

    @Autowired
    private ILogLoginService logLoginService;

    /**
     * 登录
     */
    public UserEntity login(String username, String password) {

        // 用户名或密码为空 错误
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            logLoginService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("not.null"));
            throw new UserNotExistsException();
        }
        // 密码如果不在指定范围内 错误
        if (password.length() < UserConstants.PASSWORD_MIN_LENGTH
                || password.length() > UserConstants.PASSWORD_MAX_LENGTH) {
            logLoginService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match"));
            throw new UserPasswordNotMatchException();
        }

        // 用户名不在指定范围内 错误
        if (username.length() < UserConstants.USERNAME_MIN_LENGTH
                || username.length() > UserConstants.USERNAME_MAX_LENGTH) {
            logLoginService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match"));
            throw new UserPasswordNotMatchException();
        }

        // 查询用户信息
        UserEntity user = userService.selectUserByLoginName(username);

        if (user == null && maybeMobilePhoneNumber(username)) {
            user = userService.selectUserByPhoneNumber(username);
        }

        if (user == null && maybeEmail(username)) {
            user = userService.selectUserByEmail(username);
        }

        if (user == null) {
            logLoginService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.not.exists"));
            throw new UserNotExistsException();
        }

        if (UserStatus.DISABLE.getCode().equals(user.getStatus())) {
            logLoginService.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.blocked", "其他"));
            throw new UserBlockedException("其他");
        }

        passwordService.validate(user, password);

        logLoginService.recordLogininfor(username, Constants.LOGIN_SUCCESS, MessageUtils.message("user.login.success"));
        recordLoginInfo(user);
        return user;
    }

    private boolean maybeEmail(String username) {
        if (!username.matches(UserConstants.EMAIL_PATTERN)) {
            return false;
        }
        return true;
    }

    private boolean maybeMobilePhoneNumber(String username) {
        if (!username.matches(UserConstants.MOBILE_PHONE_NUMBER_PATTERN)) {
            return false;
        }
        return true;
    }

    /**
     * 记录登录信息
     */
    public void recordLoginInfo(UserEntity user) {
        user.setLastLoginIp(ShiroUtils.getIp());
        user.setLastLogintime(DateUtils.getNowDate());
        userService.updateUserInfo(user);
    }

}
