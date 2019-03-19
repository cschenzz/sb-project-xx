package com.sibo.project.system.user.controller;

import com.sibo.common.utils.file.FileUploadUtils;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.config.SbConfig;
import com.sibo.framework.shiro.service.PasswordService;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.framework.web.service.DictService;
import com.sibo.project.system.user.entity.UserEntity;
import com.sibo.project.system.user.service.IUserService;
import org.apache.commons.lang3.StringUtils;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

/**
 * 个人信息 业务处理
 *
 * @author chenzz
 */
@Controller
@RequestMapping("/system/user/profile")
public class ProfileController extends BaseController {
    private static final Logger log = LoggerFactory.getLogger(ProfileController.class);

    private String prefix = "system/user/profile";

    @Autowired
    private PasswordService passwordService;

    @Autowired
    private IUserService userService;

    @Autowired
    private DictService dict;

    /**
     * 个人信息
     */
    @GetMapping()
    public String profile(ModelMap mmap) {
        UserEntity user = getUser();
        mmap.put("user", user);
        return prefix + "/profile";
    }

    @GetMapping("/checkPassword")
    @ResponseBody
    public boolean checkPassword(String password) {
        UserEntity user = getUser();
        String encrypt = new Md5Hash(user.getName() + password + user.getSalt()).toHex().toString();
        if (user.getPassword().equals(encrypt)) {
            return true;
        }
        return false;
    }

    @GetMapping("/resetPwd/{userId}")
    public String resetPwd(@PathVariable("userId") Long userId, ModelMap mmap) {
        mmap.put("user", userService.selectUserById(userId));
        return prefix + "/resetPwd";
    }

    @Log(title = "重置密码", businessType = BusinessType.UPDATE)
    @PostMapping("/resetPwd")
    @ResponseBody
    public R resetPwd(String oldPassword, String newPassword) {
        UserEntity user = getUser();
        if (StringUtils.isNotEmpty(newPassword) && passwordService.matches(user, oldPassword)) {
            user.setPassword(newPassword);
            if (userService.resetUserPwd(user)) {
                setUser(userService.selectUserById(user.getId()));
                return success();
            }
            return error();
        } else {
            return error("修改密码失败，旧密码错误");
        }

    }

    /**
     * 修改用户
     */
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, ModelMap mmap) {
        mmap.put("user", userService.selectUserById(userId));
        return prefix + "/edit";
    }

    /**
     * 修改头像
     */
    @GetMapping("/avatar/{userId}")
    public String avatar(@PathVariable("userId") Long userId, ModelMap mmap) {
        mmap.put("user", userService.selectUserById(userId));
        return prefix + "/avatar";
    }

    /**
     * 修改用户
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PostMapping("/update")
    @ResponseBody
    public R update(UserEntity user) {
        if (userService.updateUserInfo(user)) {
            setUser(userService.selectUserById(user.getId()));
            return success();
        }
        return error();
    }

    /**
     * 保存头像
     */
    @Log(title = "个人信息", businessType = BusinessType.UPDATE)
    @PostMapping("/updateAvatar")
    @ResponseBody
    public R updateAvatar(UserEntity user, @RequestParam("avatarfile") MultipartFile file) {
        try {
            if (!file.isEmpty()) {
                String avatar = FileUploadUtils.upload(SbConfig.getAvatarPath(), file);
                user.setAvatar(avatar);
                if (userService.updateUserInfo(user)) {
                    setUser(userService.selectUserById(user.getId()));
                    return success();
                }
            }
            return error();
        } catch (Exception e) {
            log.error("修改头像失败！", e);
            return error(e.getMessage());
        }
    }
}
