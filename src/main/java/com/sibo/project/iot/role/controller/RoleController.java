package com.sibo.project.iot.role.controller;

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
import com.sibo.project.iot.role.entity.RoleEntity;
import com.sibo.project.iot.role.service.IRoleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 角色 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-12
 */
@Controller("iotRoleController")
@RequestMapping("iot/role")
public class RoleController extends BaseController {

    private String prefix = "iot/role";

    @Autowired
    private IRoleService roleService;

    /**
     * 角色列表
     */
    @RequiresPermissions("iot:role:view")
    @GetMapping()
    public String role(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:role:view");
        return prefix + "/role";
    }

    /**
     * 新增角色
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改角色
     */
    @GetMapping("/edit/{roleId}")
    public String edit(@PathVariable("roleId") Integer roleId, ModelMap mmap) {
        RoleEntity role = roleService.getById(roleId);
        mmap.put("role", role);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{roleId}")
    public String detail(@PathVariable("roleId") Integer roleId, ModelMap mmap) {
        RoleEntity role = roleService.getById(roleId);
        mmap.put("role", role);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:role:list")
    public R listPage(RoleEntity role) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<RoleEntity> wrapper = new LambdaQueryWrapper<RoleEntity>()
                    .like(RoleEntity::getRoleName, keyWord)
                    .orderByDesc(RoleEntity::getRoleId);

            //---------------------------
            IPage<RoleEntity> pageList = roleService.page(new Page<>(pageNum, pageSize), wrapper);
            return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
            //-----------
        }

        IPage<RoleEntity> pageList = roleService.page(new Page<>(pageNum, pageSize), null);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{roleId}")
    @ResponseBody
    @RequiresPermissions("iot:role:info")
    public R info(@PathVariable("roleId") Integer roleId) {
        RoleEntity role = roleService.getById(roleId);
        return R.ok().data(role);
    }

    /**
     * 新增保存角色
     */
    @RequiresPermissions("iot:role:add")
    @Log(title = "角色", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(RoleEntity role) {
        roleService.save(role);
        return R.ok();
    }

    /**
     * 修改保存角色
     */
    @RequiresPermissions("iot:role:edit")
    @Log(title = "角色", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(RoleEntity role) {
        roleService.updateById(role);
        return R.ok();
    }

    /**
     * 删除角色(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:role:remove")
    @Log(title = "角色", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = roleService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
