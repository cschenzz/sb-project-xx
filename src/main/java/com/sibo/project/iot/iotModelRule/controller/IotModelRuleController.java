package com.sibo.project.iot.iotModelRule.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sibo.common.validator.ValidatorUtils;
import com.sibo.common.validator.group.AddGroup;
import com.sibo.common.validator.group.UpdateGroup;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.iot.iotModelRule.entity.IotModelRuleEntity;
import com.sibo.project.iot.iotModelRule.service.IIotModelRuleService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

//----------------------------
//-----------------------------
//-----------------------

/**
 * 规则 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-14
 */
@Controller
@RequestMapping("iot/iotModelRule")
public class IotModelRuleController extends BaseController {

    private String prefix = "iot/iotModelRule";

    @Autowired
    private IIotModelRuleService iotModelRuleService;

    /**
     * 规则列表
     */
    @RequiresPermissions("iot:iotModelRule:view")
    @GetMapping()
    public String iotModelRule(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:iotModelRule:view");
        return prefix + "/iotModelRule";
    }

    /**
     * 新增规则
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改规则
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        IotModelRuleEntity iotModelRule = iotModelRuleService.getById(id);
        mmap.put("iotModelRule", iotModelRule);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        IotModelRuleEntity iotModelRule = iotModelRuleService.getById(id);
        mmap.put("iotModelRule", iotModelRule);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:iotModelRule:list")
    public R listPage(IotModelRuleEntity iotModelRule) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotModelRuleEntity> wrapper = new LambdaQueryWrapper<IotModelRuleEntity>()
                    .like(IotModelRuleEntity::getRuleName, keyWord)
                    //.or().like(IotModelRuleEntity::getSummary, keyWord)
                    .orderByDesc(IotModelRuleEntity::getId);

            //---------------------------
            IPage<IotModelRuleEntity> pageList = iotModelRuleService.page(new Page<>(pageNum, pageSize), wrapper);
            return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
            //-----------
        }

        IPage<IotModelRuleEntity> pageList = iotModelRuleService.page(new Page<>(pageNum, pageSize), null);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:iotModelRule:info")
    public R info(@PathVariable("id") Integer id) {
        IotModelRuleEntity iotModelRule = iotModelRuleService.getById(id);
        return R.ok().data(iotModelRule);
    }

    /**
     * 新增保存规则
     */
    @RequiresPermissions("iot:iotModelRule:add")
    @Log(title = "规则", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(IotModelRuleEntity iotModelRule) {
        ValidatorUtils.validateEntity(iotModelRule, AddGroup.class);
        iotModelRule.setRuleModitime(new Date());
        iotModelRuleService.save(iotModelRule);
        return R.ok();
    }

    /**
     * 修改保存规则
     */
    @RequiresPermissions("iot:iotModelRule:edit")
    @Log(title = "规则", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(IotModelRuleEntity iotModelRule) {
        ValidatorUtils.validateEntity(iotModelRule, UpdateGroup.class);
        iotModelRuleService.updateById(iotModelRule);
        return R.ok();
    }

    /**
     * 删除规则(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:iotModelRule:remove")
    @Log(title = "规则", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = iotModelRuleService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
