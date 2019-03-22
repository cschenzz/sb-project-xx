package com.sibo.project.iot.iotParameterType.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sibo.common.validator.ValidatorUtils;
import com.sibo.common.validator.group.AddGroup;
import com.sibo.common.validator.group.UpdateGroup;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.project.iot.iotParameterType.entity.IotParameterTypeEntity;
import com.sibo.project.iot.iotParameterType.service.IIotParameterTypeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 参数类型 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-22
 */
@Controller
@RequestMapping("iot/iotParameterType")
public class IotParameterTypeController extends BaseController {

    private String prefix = "iot/iotParameterType";

    @Autowired
    private IIotParameterTypeService iotParameterTypeService;

    /**
     * 参数类型列表
     */
    @RequiresPermissions("iot:iotParameterType:view")
    @GetMapping()
    public String iotParameterType(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:iotParameterType:view");
        return prefix + "/iotParameterType";
    }

    /**
     * 新增参数类型
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改参数类型
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        IotParameterTypeEntity iotParameterType = iotParameterTypeService.getById(id);
        mmap.put("iotParameterType", iotParameterType);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        IotParameterTypeEntity iotParameterType = iotParameterTypeService.getById(id);
        mmap.put("iotParameterType", iotParameterType);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:iotParameterType:list")
    public R listPage(IotParameterTypeEntity iotParameterType) {
        IPage<?> listPage = iotParameterTypeService.listPage(iotParameterType);
        return R.ok().dataRows(listPage.getTotal(), listPage.getPages(), listPage.getRecords());
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:iotParameterType:info")
    public R info(@PathVariable("id") Integer id) {
        IotParameterTypeEntity iotParameterType = iotParameterTypeService.getById(id);
        return R.ok().data(iotParameterType);
    }

    /**
     * 新增保存参数类型
     */
    @RequiresPermissions("iot:iotParameterType:add")
    @Log(title = "参数类型", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(IotParameterTypeEntity iotParameterType) {
        ValidatorUtils.validateEntity(iotParameterType, AddGroup.class);
        iotParameterType.setCreateTime(new Date());
        iotParameterTypeService.save(iotParameterType);
        return R.ok();
    }

    /**
     * 修改保存参数类型
     */
    @RequiresPermissions("iot:iotParameterType:edit")
    @Log(title = "参数类型", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(IotParameterTypeEntity iotParameterType) {
        ValidatorUtils.validateEntity(iotParameterType, UpdateGroup.class);
        iotParameterTypeService.updateById(iotParameterType);
        return R.ok();
    }

    /**
     * 删除参数类型(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:iotParameterType:remove")
    @Log(title = "参数类型", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = iotParameterTypeService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
