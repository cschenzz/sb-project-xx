package com.sibo.project.system.user.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sibo.common.constant.UserConstants;
import com.sibo.common.validator.Assert;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.project.system.user.entity.UserEntity;
import com.sibo.project.system.user.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 用户信息
 *
 * @author chenzz
 */
@Controller
@RequestMapping("system/user")
public class UserController extends BaseController {

    private String prefix = "system/user";

    @Autowired
    private IUserService userService;

    /**
     * 用户列表
     */
    @RequiresPermissions("system:user:view")
    @GetMapping()
    public String user(ModelMap mmap) {
        putBaseModelMap(mmap, "system:user:view");
        return prefix + "/user";
    }

    /**
     * 新增用户
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改用户
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        UserEntity user = userService.getById(id);
        mmap.put("user", user);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        UserEntity user = userService.getById(id);
        mmap.put("user", user);
        return prefix + "/detail";
    }

    //-----------------json----------------


    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("system:user:list")
    public R listPage(UserEntity user) {
        IPage<?> listPage = userService.listPage(user);
        return R.ok().dataRows(listPage.getTotal(), listPage.getPages(), listPage.getRecords());
    }

    /**
     * 校验用户名
     */
    @PostMapping("/checkLoginNameUnique")
    @ResponseBody
    public String checkLoginNameUnique(UserEntity user) {
        Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                .eq(UserEntity::getLoginName, user.getLoginName());

        int count = userService.count(wrapper);
        if (count > 0) {
            return UserConstants.USER_NAME_NOT_UNIQUE;
        }
        return UserConstants.USER_NAME_UNIQUE;
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("system:user:info")
    public R info(@PathVariable("id") Integer id) {
        UserEntity user = userService.getById(id);
        //return R.ok().data(user);
        return R.ok().put("user", user);
    }

    /**
     * 新增保存用户
     */
    @RequiresPermissions("iot:user:add")
    @Log(title = "用户", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(UserEntity user) {
        verifyForm(user);

        userService.addSave(user);
        return R.ok();
    }

    /**
     * 修改保存用户
     */
    @RequiresPermissions("iot:user:edit")
    @Log(title = "用户", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(UserEntity user) {
        // verifyForm(user);
        userService.editSave(user);
        return R.ok();
    }

    /**
     * 删除用户
     */
    @RequiresPermissions("system:user:remove")
    @Log(title = "用户", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = userService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }

    //-------------------

    private void verifyForm(UserEntity user) {
        Assert.isBlank(user.getLoginName(), "登录名不能为空");
        Assert.isBlank(user.getEmail(), "email不能为空");
        Assert.isBlank(user.getPhonenumber(), "手机号不能为空");
        Assert.isBlank(user.getPassword(), "密码不能为空");

        Assert.isNull(user.getProvince(), "省不能为空");
        Assert.isNull(user.getCity(), "市不能为空");
        Assert.isNull(user.getArea(), "县不能为空");
    }
}
