package com.sibo.project.iot.logLogin.controller;

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
import com.sibo.project.iot.logLogin.entity.LogLoginEntity;
import com.sibo.project.iot.logLogin.service.ILogLoginService;
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
 * 系统访问记录 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-12
 */
@Controller
@RequestMapping("iot/logLogin")
public class LogLoginController extends BaseController {

    private String prefix = "iot/logLogin";

    @Autowired
    private ILogLoginService logLoginService;

    /**
     * 系统访问记录列表
     */
    @RequiresPermissions("iot:logLogin:view")
    @GetMapping()
    public String logLogin(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:logLogin:view");
        return prefix + "/logLogin";
    }

    /**
     * 新增系统访问记录
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改系统访问记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        LogLoginEntity logLogin = logLoginService.getById(id);
        mmap.put("logLogin", logLogin);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        LogLoginEntity logLogin = logLoginService.getById(id);
        mmap.put("logLogin", logLogin);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:logLogin:list")
    public R listPage(LogLoginEntity logLogin) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<LogLoginEntity> wrapper = new LambdaQueryWrapper<LogLoginEntity>()
                    .like(LogLoginEntity::getMessage, keyWord)
                    //.or().like(LogLoginEntity::getSummary, keyWord)
                    .orderByDesc(LogLoginEntity::getId);

            //---------------------------
            IPage<LogLoginEntity> pageList = logLoginService.page(new Page<>(pageNum, pageSize), wrapper);
            return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
            //-----------
        }

        IPage<LogLoginEntity> pageList = logLoginService.page(new Page<>(pageNum, pageSize), null);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:logLogin:info")
    public R info(@PathVariable("id") Integer id) {
        LogLoginEntity logLogin = logLoginService.getById(id);
        return R.ok().data(logLogin);
    }

    /**
     * 新增保存系统访问记录
     */
    @RequiresPermissions("iot:logLogin:add")
    @Log(title = "系统访问记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(LogLoginEntity logLogin) {
        logLoginService.save(logLogin);
        return R.ok();
    }

    /**
     * 修改保存系统访问记录
     */
    @RequiresPermissions("iot:logLogin:edit")
    @Log(title = "系统访问记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(LogLoginEntity logLogin) {
        logLoginService.updateById(logLogin);
        return R.ok();
    }

    /**
     * 删除系统访问记录(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:logLogin:remove")
    @Log(title = "系统访问记录", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = logLoginService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
