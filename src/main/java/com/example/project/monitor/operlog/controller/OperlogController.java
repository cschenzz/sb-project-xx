package com.example.project.monitor.operlog.controller;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.example.framework.aspectj.lang.annotation.Log;
import com.example.framework.aspectj.lang.enums.BusinessType;
import com.example.framework.web.controller.BaseController;
import com.example.framework.web.entity.R;
import com.example.project.monitor.operlog.entity.OperLogEntity;
import com.example.project.monitor.operlog.service.IOperLogService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.List;

/**
 * 操作日志记录
 *
 * @author chenzz
 */
@Controller
@RequestMapping("/monitor/operlog")
public class OperlogController extends BaseController {
    private String prefix = "monitor/operlog";

    @Autowired
    private IOperLogService operLogService;

    @RequiresPermissions("monitor:operlog:view")
    @GetMapping()
    public String operlog(ModelMap mmap) {
        putBaseModelMap(mmap, "monitor:operlog:view");
        return prefix + "/operlog";
    }

    @RequiresPermissions("monitor:operlog:list")
    @PostMapping("/list")
    @ResponseBody
    public R list(OperLogEntity operLog) {
        IPage<?> listPage = operLogService.listPage(operLog);
        return R.ok().dataRows(listPage.getTotal(), listPage.getPages(), listPage.getRecords());
    }

    @RequiresPermissions("monitor:operlog:remove")
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        List<String> idList = Arrays.asList(ids.split(","));
        boolean result = operLogService.removeByIds(idList);
        return result ? R.ok() : R.error();
    }

    @RequiresPermissions("monitor:operlog:detail")
    @GetMapping("/detail/{operId}")
    public String detail(@PathVariable("operId") Long operId, ModelMap mmap) {
        mmap.put("operLog", operLogService.getById(operId));
        return prefix + "/detail";
    }

    @Log(title = "操作日志", businessType = BusinessType.CLEAN)
    @RequiresPermissions("monitor:operlog:remove")
    @PostMapping("/clean")
    @ResponseBody
    public R clean() {
        operLogService.cleanOperLog();
        return success();
    }
}
