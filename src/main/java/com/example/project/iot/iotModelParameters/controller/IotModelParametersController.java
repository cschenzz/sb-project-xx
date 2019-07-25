package com.example.project.iot.iotModelParameters.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.common.validator.ValidatorUtils;
import com.example.common.validator.group.AddGroup;
import com.example.common.validator.group.UpdateGroup;
import com.example.framework.aspectj.lang.annotation.Log;
import com.example.framework.aspectj.lang.enums.BusinessType;
import com.example.framework.web.controller.BaseController;
import com.example.framework.web.entity.R;
import com.example.project.iot.iotModelParameters.entity.IotModelParametersEntity;
import com.example.project.iot.iotModelParameters.service.IIotModelParametersService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 参数 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Controller
@RequestMapping("iot/iotModelParameters")
public class IotModelParametersController extends BaseController {

    private String prefix = "iot/iotModelParameters";

    @Autowired
    private IIotModelParametersService iotModelParametersService;

    /**
     * 参数列表
     */
    @RequiresPermissions("iot:iotModelParameters:view")
    @GetMapping()
    public String iotModelParameters(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:iotModelParameters:view");
        return prefix + "/iotModelParameters";
    }

    /**
     * 新增参数
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改参数
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        IotModelParametersEntity iotModelParameters = iotModelParametersService.getById(id);
        mmap.put("iotModelParameters", iotModelParameters);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        IotModelParametersEntity iotModelParameters = iotModelParametersService.getById(id);
        mmap.put("iotModelParameters", iotModelParameters);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:iotModelParameters:list")
    public R listPage(IotModelParametersEntity iotModelParameters) {
        IPage<?> listPage = iotModelParametersService.listPage(iotModelParameters);
        return R.ok().dataRows(listPage.getTotal(), listPage.getPages(), listPage.getRecords());
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:iotModelParameters:info")
    public R info(@PathVariable("id") Integer id) {
        IotModelParametersEntity iotModelParameters = iotModelParametersService.getById(id);
        return R.ok().data(iotModelParameters);
    }

    /**
     * 新增保存参数
     */
    @RequiresPermissions("iot:iotModelParameters:add")
    @Log(title = "参数", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(IotModelParametersEntity iotModelParameters) {
        ValidatorUtils.validateEntity(iotModelParameters, AddGroup.class);
        iotModelParameters.setModifyTime(new Date());
        return iotModelParametersService.save(iotModelParameters) ? R.ok() : R.error();
    }

    /**
     * 修改保存参数
     */
    @RequiresPermissions("iot:iotModelParameters:edit")
    @Log(title = "参数", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(IotModelParametersEntity iotModelParameters) {
        ValidatorUtils.validateEntity(iotModelParameters, UpdateGroup.class);
        return iotModelParametersService.updateById(iotModelParameters) ? R.ok() : R.error();
    }

    /**
     * 删除参数(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:iotModelParameters:remove")
    @Log(title = "参数", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = iotModelParametersService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
