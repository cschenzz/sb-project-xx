package com.sibo.project.system.user.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sibo.common.utils.StringUtils;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.project.system.role.service.IRoleService;
import com.sibo.project.system.user.entity.UserEntity;
import com.sibo.project.system.user.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import java.util.Arrays;
import java.util.List;

/**
 * 用户信息
 *
 * @author chenzz
 */
@Controller
@RequestMapping("/system/user")
public class UserController extends BaseController {
    private String prefix = "system/user";

    @Autowired
    private IUserService userService;

    @Autowired
    private IRoleService roleService;


    @RequiresPermissions("system:user:view")
    @GetMapping()
    public String user(ModelMap mmap) {
        putBaseModelMap(mmap, "system:user:view");
        return prefix + "/user";
    }

    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("system:user:list")
    public R listPage(UserEntity user) {
        IPage<?> listPage = userService.listPage(user);
        return R.ok().dataRows(listPage.getTotal(), listPage.getPages(), listPage.getRecords());
    }

    /**
     * 新增用户
     */
    @GetMapping("/add")
    public String add(ModelMap mmap) {
        mmap.put("roles", roleService.selectRoleAll());
        return prefix + "/add";
    }

    /**
     * 新增保存用户
     */
    @RequiresPermissions("system:user:add")
    @Log(title = "用户管理", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(UserEntity user) {
        if (StringUtils.isNotNull(user.getUserId()) && UserEntity.isAdmin(user.getUserId())) {
            return error("不允许修改超级管理员用户");
        }
        userService.addSave(user);
        return R.ok();
    }

    /**
     * 修改用户
     */
    @GetMapping("/edit/{userId}")
    public String edit(@PathVariable("userId") Long userId, ModelMap mmap) {
        mmap.put("user", userService.selectUserById(userId));
        mmap.put("roles", roleService.selectRolesByUserId(userId));
        return prefix + "/edit";
    }

    /**
     * 修改保存用户
     */
    @RequiresPermissions("system:user:edit")
    @Log(title = "用户管理", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(UserEntity user) {
        if (StringUtils.isNotNull(user.getUserId()) && UserEntity.isAdmin(user.getUserId())) {
            return error("不允许修改超级管理员用户");
        }
        userService.editSave(user);
        return R.ok();
    }

    @RequiresPermissions("system:user:resetPwd")
    @Log(title = "重置密码", businessType = BusinessType.UPDATE)
    @GetMapping("/resetPwd/{userId}")
    public String resetPwd(@PathVariable("userId") Long userId, ModelMap mmap) {
        mmap.put("user", userService.selectUserById(userId));
        return prefix + "/resetPwd";
    }

    @RequiresPermissions("system:user:resetPwd")
    @Log(title = "重置密码", businessType = BusinessType.UPDATE)
    @PostMapping("/resetPwd")
    @ResponseBody
    public R resetPwd(UserEntity user) {
        return toAjax(userService.resetUserPwd(user));
    }

    @RequiresPermissions("system:user:remove")
    @Log(title = "用户管理", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        for (String userId : idList) {
            if ("1".equals(userId)) {
                return R.error("不允许删除超级管理员用户");
            }
        }
        boolean result = userService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }

    /**
     * 校验用户名
     */
    @PostMapping("/checkLoginNameUnique")
    @ResponseBody
    public String checkLoginNameUnique(UserEntity user) {
        return userService.checkLoginNameUnique(user.getLoginName());
    }

    /**
     * 校验手机号码
     */
    @PostMapping("/checkPhoneUnique")
    @ResponseBody
    public String checkPhoneUnique(UserEntity user) {
        return userService.checkPhoneUnique(user);
    }

    /**
     * 校验email邮箱
     */
    @PostMapping("/checkEmailUnique")
    @ResponseBody
    public String checkEmailUnique(UserEntity user) {
        return userService.checkEmailUnique(user);
    }

}
