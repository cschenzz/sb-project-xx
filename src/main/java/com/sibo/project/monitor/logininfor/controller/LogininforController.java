package com.sibo.project.monitor.logininfor.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.project.monitor.logininfor.entity.LogininforEntity;
import com.sibo.project.monitor.logininfor.service.ILogininforService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.Arrays;
import java.util.List;

/**
 * 系统访问记录
 *
 * @author chenzz
 */
@Controller
@RequestMapping("/monitor/logininfor")
public class LogininforController extends BaseController {
    private String prefix = "monitor/logininfor";

    @Autowired
    private ILogininforService logininforService;

    @RequiresPermissions("monitor:logininfor:view")
    @GetMapping()
    public String logininfor(ModelMap mmap) {
        putBaseModelMap(mmap, "monitor:logininfor:view");
        return prefix + "/logininfor";
    }

    @RequiresPermissions("monitor:logininfor:list")
    @PostMapping("/list")
    @ResponseBody
    public R list(LogininforEntity logininfor) {
        IPage<?> listPage = logininforService.listPage(logininfor);
        return R.ok().dataRows(listPage.getTotal(), listPage.getPages(), listPage.getRecords());
    }

    @RequiresPermissions("monitor:logininfor:remove")
    @Log(title = "登陆日志", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = logininforService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }

    @RequiresPermissions("monitor:logininfor:remove")
    @Log(title = "登陆日志", businessType = BusinessType.CLEAN)
    @PostMapping("/clean")
    @ResponseBody
    public R clean() {
        logininforService.cleanLogininfor();
        return success();
    }

}
