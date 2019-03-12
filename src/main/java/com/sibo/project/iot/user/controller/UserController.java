package com.sibo.project.iot.user.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.iot.user.entity.UserEntity;
import com.sibo.project.iot.user.service.IUserService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

//----------------------------
//-----------------------------
//-----------------------

/**
 * 用户 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-12
 */
@Controller("iotUserController")
@RequestMapping("iot/user")
public class UserController extends BaseController {

    private String prefix = "iot/user";

    @Autowired
    private IUserService userService;

    /**
     * 用户列表
     */
    @RequiresPermissions("iot:user:view")
    @GetMapping()
    public String user(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:user:view");
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
    @RequiresPermissions("iot:user:list")
    public R listPage(UserEntity user) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<UserEntity> wrapper = new LambdaQueryWrapper<UserEntity>()
                    .like(UserEntity::getName, keyWord)
                    .or().like(UserEntity::getMobile, keyWord)
                    .or().like(UserEntity::getEmail, keyWord)
                    .orderByDesc(UserEntity::getId);

            //---------------------------
            IPage<UserEntity> pageList = userService.page(new Page<>(pageNum, pageSize), wrapper);
            return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
            //-----------
        }

        IPage<UserEntity> pageList = userService.page(new Page<>(pageNum, pageSize), null);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:user:info")
    public R info(@PathVariable("id") Integer id) {
        UserEntity user = userService.getById(id);
        return R.ok().data(user);
    }

    /**
     * 新增保存用户
     */
    @RequiresPermissions("iot:user:add")
    @Log(title = "用户", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(UserEntity user) {
        userService.save(user);
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
        userService.updateById(user);
        return R.ok();
    }

    /**
     * 删除用户(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:user:remove")
    @Log(title = "用户", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = userService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
