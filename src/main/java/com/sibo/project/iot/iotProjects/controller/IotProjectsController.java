package com.sibo.project.iot.iotProjects.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sibo.common.validator.ValidatorUtils;
import com.sibo.common.validator.group.AddGroup;
import com.sibo.common.validator.group.UpdateGroup;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.project.iot.iotProjects.entity.IotProjectsEntity;
import com.sibo.project.iot.iotProjects.service.IIotProjectsService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 项目 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Controller
@RequestMapping("iot/iotProjects")
public class IotProjectsController extends BaseController {

    private String prefix = "iot/iotProjects";

    @Autowired
    private IIotProjectsService iotProjectsService;

    /**
     * 项目列表
     */
    @RequiresPermissions("iot:iotProjects:view")
    @GetMapping()
    public String iotProjects(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:iotProjects:view");
        return prefix + "/iotProjects";
    }

    /**
     * 新增项目
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改项目
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        IotProjectsEntity iotProjects = iotProjectsService.getById(id);
        mmap.put("iotProjects", iotProjects);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        IotProjectsEntity iotProjects = iotProjectsService.getById(id);
        mmap.put("iotProjects", iotProjects);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:iotProjects:list")
    public R listPage(IotProjectsEntity iotProjects) {
        IPage<?> listPage = iotProjectsService.listPage(iotProjects);
        return R.ok().dataRows(listPage.getTotal(), listPage.getPages(), listPage.getRecords());
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:iotProjects:info")
    public R info(@PathVariable("id") Integer id) {
        IotProjectsEntity iotProjects = iotProjectsService.getById(id);
        return R.ok().data(iotProjects);
    }

    /**
     * 新增保存项目
     */
    @RequiresPermissions("iot:iotProjects:add")
    @Log(title = "项目", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(IotProjectsEntity iotProjects) {
        ValidatorUtils.validateEntity(iotProjects, AddGroup.class);
        iotProjects.setProjectId("SO" + System.currentTimeMillis());
        return iotProjectsService.save(iotProjects) ? R.ok() : R.error();
    }

    /**
     * 修改保存项目
     */
    @RequiresPermissions("iot:iotProjects:edit")
    @Log(title = "项目", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(IotProjectsEntity iotProjects) {
        ValidatorUtils.validateEntity(iotProjects, UpdateGroup.class);
        return iotProjectsService.updateById(iotProjects) ? R.ok() : R.error();
    }

    /**
     * 删除项目(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:iotProjects:remove")
    @Log(title = "项目", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = iotProjectsService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
