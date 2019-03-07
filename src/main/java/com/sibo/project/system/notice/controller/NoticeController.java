package com.sibo.project.system.notice.controller;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.sibo.common.utils.DateUtils;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.project.system.notice.entity.Notice;
import com.sibo.project.system.notice.service.INoticeService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * 公告 信息操作处理
 *
 * @author chenzz
 */
@Controller
@RequestMapping("/system/notice")
public class NoticeController extends BaseController {
    private String prefix = "system/notice";

    @Autowired
    private INoticeService noticeService;

    @RequiresPermissions("system:notice:view")
    @GetMapping()
    public String notice() {
        return prefix + "/notice";
    }

    //-----------------------------

    @GetMapping("/listAll")
    @ResponseBody
    public R listAll(@RequestParam Map<String, Object> params) {
        //--------------------------------------
        // if (params.containsKey("page") && params.containsKey("limit")) {
        // }
        //---------------------------------------
        int page = Integer.parseInt(params.get("page").toString());
        int limit = Integer.parseInt(params.get("limit").toString());

        Wrapper<Notice> wrapper = new QueryWrapper<Notice>().lambda()
                // .like(Notice::getNickName, searchValue)
                // .or().like(Notice::getMobilePhone, searchValue)
                // .or().like(Notice::getEmail, searchValue)
                // .or().like(Notice::getRealname, searchValue)
                .orderByDesc(Notice::getNoticeId);

        IPage<Notice> pageList = noticeService.page(new Page<>(page, limit), wrapper);
        return R.ok().dataRows(pageList.getTotal(), pageList.getPages(), pageList.getRecords());

    }

    /**
     * 查询公告列表
     */
    @RequiresPermissions("system:notice:list")
    @PostMapping("/list")
    @ResponseBody
    public R list(Notice notice) {
        startPage();
        List<Notice> list = noticeService.selectNoticeList(notice);
        return getDataTable(list);
    }

    /**
     * 新增公告
     */
    @GetMapping("/add")
    public String add() {
        return prefix + "/add";
    }

    /**
     * 新增保存公告
     */
    @RequiresPermissions("system:notice:add")
    @Log(title = "通知公告", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public R addSave(Notice notice) {
        return toAjax(noticeService.insertNotice(notice));
    }

    /**
     * 修改公告
     */
    @GetMapping("/edit/{noticeId}")
    public String edit(@PathVariable("noticeId") Long noticeId, ModelMap mmap) {
        mmap.put("notice", noticeService.selectNoticeById(noticeId));
        return prefix + "/edit";
    }

    /**
     * 预览公告
     */
    @GetMapping("/viewNotice/{noticeId}")
    public String viewNotice(@PathVariable("noticeId") Long noticeId, ModelMap mmap) {
        mmap.put("notice", noticeService.selectNoticeById(noticeId));
        //-----------------
        mmap.addAttribute("gtmModified", DateUtils.dateTime(new Date()));
        mmap.addAttribute("author", "chenzz");
        //-----------------
        return prefix + "/view";
    }

    /**
     * 修改保存公告
     */
    @RequiresPermissions("system:notice:edit")
    @Log(title = "通知公告", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public R editSave(Notice notice) {
        return toAjax(noticeService.updateNotice(notice));
    }

    /**
     * 删除公告
     */
    @RequiresPermissions("system:notice:remove")
    @Log(title = "通知公告", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public R remove(String ids) {
        return toAjax(noticeService.deleteNoticeByIds(ids));
    }

}
