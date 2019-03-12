package com.sibo.project.iot.logOper.controller;

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
import com.sibo.project.iot.logOper.entity.LogOperEntity;
import com.sibo.project.iot.logOper.service.ILogOperService;
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
 * 操作日志记录 信息操作处理
 *
 * @author chenzz
 * @date 2019-03-12
 */
@Controller
@RequestMapping("iot/logOper")
public class LogOperController extends BaseController {

    private String prefix = "iot/logOper";

    @Autowired
    private ILogOperService logOperService;

    /**
     * 操作日志记录列表
     */
    @RequiresPermissions("iot:logOper:view")
    @GetMapping()
    public String logOper(ModelMap mmap) {
        putBaseModelMap(mmap, "iot:logOper:view");
        return prefix + "/logOper";
    }

    /**
     * 新增操作日志记录
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 修改操作日志记录
     */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Integer id, ModelMap mmap) {
        LogOperEntity logOper = logOperService.getById(id);
        mmap.put("logOper", logOper);
        return prefix + "/edit";
    }

    /**
     * 详情页面
     */
    @GetMapping("/detail/{id}")
    public String detail(@PathVariable("id") Integer id, ModelMap mmap) {
        LogOperEntity logOper = logOperService.getById(id);
        mmap.put("logOper", logOper);
        return prefix + "/detail";
    }

    //-----------------json----------------

    /**
     * 列表
     */
    @RequestMapping("/list")
    @ResponseBody
    @RequiresPermissions("iot:logOper:list")
    public R listPage(LogOperEntity logOper) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<LogOperEntity> wrapper = new LambdaQueryWrapper<LogOperEntity>()
                    .like(LogOperEntity::getTitle, keyWord)
                    //.or().like(LogOperEntity::getSummary, keyWord)
                    .orderByDesc(LogOperEntity::getId);

            //---------------------------
            IPage<LogOperEntity> pageList = logOperService.page(new Page<>(pageNum, pageSize), wrapper);
            return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
            //-----------
        }

        IPage<LogOperEntity> pageList = logOperService.page(new Page<>(pageNum, pageSize), null);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());
        //----------------------------------------------
    }

    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @ResponseBody
    @RequiresPermissions("iot:logOper:info")
    public R info(@PathVariable("id") Integer id) {
        LogOperEntity logOper = logOperService.getById(id);
        return R.ok().data(logOper);
    }

    /**
     * 新增保存操作日志记录
     */
    @RequiresPermissions("iot:logOper:add")
    @Log(title = "操作日志记录", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(LogOperEntity logOper) {
        logOperService.save(logOper);
        return R.ok();
    }

    /**
     * 修改保存操作日志记录
     */
    @RequiresPermissions("iot:logOper:edit")
    @Log(title = "操作日志记录", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(LogOperEntity logOper) {
        logOperService.updateById(logOper);
        return R.ok();
    }

    /**
     * 删除操作日志记录(多个id用逗号隔开)
     */
    @RequiresPermissions("iot:logOper:remove")
    @Log(title = "操作日志记录", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = logOperService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }
    //-------------------

}
