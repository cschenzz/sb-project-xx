package com.example.project.iot.iotProtocol.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.common.validator.ValidatorUtils;
import com.example.common.validator.group.AddGroup;
import com.example.common.validator.group.UpdateGroup;
import com.example.framework.aspectj.lang.annotation.Log;
import com.example.framework.aspectj.lang.enums.BusinessType;
import com.example.framework.web.controller.BaseController;
import com.example.framework.web.entity.R;
import com.example.project.iot.iotProtocol.entity.IotProtocolEntity;
import com.example.project.iot.iotProtocol.service.IIotProtocolService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 协议 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Controller
@RequestMapping("iot/iotProtocol")
public class IotProtocolController extends BaseController {

    private String prefix = "iot/iotProtocol";

    @Autowired
    private IIotProtocolService iotProtocolService;

    /**
     * 协议列表
     */
    @RequiresPermissions("iot:iotProtocol:view")
    @GetMapping()
    public String iotProtocol(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:iotProtocol:view");
        return prefix + "/iotProtocol";
    }

    /**
     * 新增协议
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改协议
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        IotProtocolEntity iotProtocol = iotProtocolService.getById(id);
        mmap.put("iotProtocol", iotProtocol);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        IotProtocolEntity iotProtocol = iotProtocolService.getById(id);
        mmap.put("iotProtocol", iotProtocol);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:iotProtocol:list")
    public R listPage(IotProtocolEntity iotProtocol) {
        IPage<?> listPage = iotProtocolService.listPage(iotProtocol);
        return R.ok().dataRows(listPage.getTotal(), listPage.getPages(), listPage.getRecords());
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:iotProtocol:info")
    public R info(@PathVariable("id") Integer id) {
        IotProtocolEntity iotProtocol = iotProtocolService.getById(id);
        return R.ok().data(iotProtocol);
    }

    /**
     * 新增保存协议
     */
    @RequiresPermissions("iot:iotProtocol:add")
    @Log(title = "协议", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(IotProtocolEntity iotProtocol) {
        ValidatorUtils.validateEntity(iotProtocol, AddGroup.class);
        return iotProtocolService.save(iotProtocol) ? R.ok() : R.error();
    }

    /**
     * 修改保存协议
     */
    @RequiresPermissions("iot:iotProtocol:edit")
    @Log(title = "协议", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(IotProtocolEntity iotProtocol) {
        ValidatorUtils.validateEntity(iotProtocol, UpdateGroup.class);
        return iotProtocolService.updateById(iotProtocol) ? R.ok() : R.error();
    }

    /**
     * 删除协议(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:iotProtocol:remove")
    @Log(title = "协议", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = iotProtocolService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
