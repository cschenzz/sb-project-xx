package com.sibo.project.monitor.online.controller;

import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.framework.aspectj.lang.annotation.Log;
import com.sibo.framework.aspectj.lang.enums.BusinessType;
import com.sibo.framework.shiro.session.OnlineSessionDAO;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.project.monitor.online.entity.OnlineSession;
import com.sibo.project.monitor.online.entity.UserOnline;
import com.sibo.project.monitor.online.service.IUserOnlineService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * 在线用户监控
 *
 * @author chenzz
 */
@Controller
@RequestMapping("/monitor/online")
public class UserOnlineController extends BaseController {
    private String prefix = "monitor/online" ;

    @Autowired
    private IUserOnlineService userOnlineService;

    @Autowired
    private OnlineSessionDAO onlineSessionDAO;

    @RequiresPermissions("monitor:online:view")
    @GetMapping()
    public String online() {
        return prefix + "/online" ;
    }

    @RequiresPermissions("monitor:online:list")
    @PostMapping("/list")
    @ResponseBody
    public R list(UserOnline userOnline) {
        startPage();
        List<UserOnline> list = userOnlineService.selectUserOnlineList(userOnline);
        return getDataTable(list);
    }

    @RequiresPermissions("monitor:online:batchForceLogout")
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @PostMapping("/batchForceLogout")
    @ResponseBody
    public R batchForceLogout(@RequestParam("ids[]") String[] ids) {
        for (String sessionId : ids) {
            UserOnline online = userOnlineService.selectOnlineById(sessionId);
            if (online == null) {
                return error("用户已下线");
            }
            OnlineSession onlineSession = (OnlineSession) onlineSessionDAO.readSession(online.getSessionId());
            if (onlineSession == null) {
                return error("用户已下线");
            }
            if (sessionId.equals(ShiroUtils.getSessionId())) {
                return error("当前登陆用户无法强退");
            }
            onlineSession.setStatus(OnlineSession.OnlineStatus.off_line);
            online.setStatus(OnlineSession.OnlineStatus.off_line);
            userOnlineService.saveOnline(online);
        }
        return success();
    }

    @RequiresPermissions("monitor:online:forceLogout")
    @Log(title = "在线用户", businessType = BusinessType.FORCE)
    @PostMapping("/forceLogout")
    @ResponseBody
    public R forceLogout(String sessionId) {
        UserOnline online = userOnlineService.selectOnlineById(sessionId);
        if (sessionId.equals(ShiroUtils.getSessionId())) {
            return error("当前登陆用户无法强退");
        }
        if (online == null) {
            return error("用户已下线");
        }
        OnlineSession onlineSession = (OnlineSession) onlineSessionDAO.readSession(online.getSessionId());
        if (onlineSession == null) {
            return error("用户已下线");
        }
        onlineSession.setStatus(OnlineSession.OnlineStatus.off_line);
        online.setStatus(OnlineSession.OnlineStatus.off_line);
        userOnlineService.saveOnline(online);
        return success();
    }

}
