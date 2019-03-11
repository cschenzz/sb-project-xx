package com.sibo.project.system.user.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.system.user.entity.User;
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
        User user = userService.getById(id);
        mmap.put("user", user);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        User user = userService.getById(id);
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
    public R listPage(User user) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();

        IPage<User> pageList = userService.page(new Page<>(pageNum, pageSize), null);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("system:user:info")
    public R info(@PathVariable("id") Integer id) {
        User user = userService.getById(id);
        //return R.ok().data(user);
        return R.ok().put("user", user);
    }

    /**
     * 新增保存用户
     */
    @RequiresPermissions("system:user:add")
    @Log(title = "用户", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(User user) {
        userService.save(user);
        return R.ok();
    }

    /**
     * 修改保存用户
     */
    @RequiresPermissions("system:user:edit")
    @Log(title = "用户", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(User user) {
        userService.updateById(user);
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

    //--------------olddddd---------------

    /**
     * 删除单个项目,注意id字段类型是Integer还是Long
     */
    @GetMapping("/remove/{id}")
    @ResponseBody
    @RequiresPermissions("system:user:remove")
    public R remove(@PathVariable("id") Long id) {
        if (userService.removeById(id)) {
            return R.ok();
        }
        return R.error();
    }

    /**
     * 批量删除项目
     */
    @PostMapping("/batchRemove")
    @ResponseBody
    @RequiresPermissions("system:user:remove")
    public R remove(@RequestParam("ids[]") Long[] ids) {
        boolean result = userService.removeByIds(Arrays.asList(ids));
        return result ? R.ok() : R.error();
    }
    //-------------------

}
