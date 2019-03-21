package com.sibo.framework.web.controller;

import com.sibo.common.utils.StringUtils;
import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.framework.web.entity.R;
import com.sibo.project.system.menu.entity.Menu;
import com.sibo.project.system.menu.service.IMenuService;
import com.sibo.project.system.user.entity.UserEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.ModelMap;

import java.util.ArrayList;
import java.util.List;

/**
 * web层通用数据处理
 *
 * @author chenzz
 */
public class BaseController {

    @Autowired
    private IMenuService menuService;

    protected void putBaseModelMap(ModelMap mmap, String annotationValue) {
        // 取身份信息
        UserEntity user = getUser();
        // 根据用户id取出菜单
        List<Menu> menus = menuService.selectMenusByUser(user);
        mmap.put("menus", menus);
        mmap.put("user", user);
        //-----------------
        List<Menu> curPageMenus = new ArrayList<>();
        for (Menu m : menus) {
            for (Menu cm : m.getChildren()) {
                if (cm.getPerms().equalsIgnoreCase(annotationValue)) {
                    curPageMenus.add(cm);
                }
            }
        }
        if (curPageMenus.size() > 0) {
            Menu curMenu = curPageMenus.get(0);
            mmap.put("m1", "m1_" + curMenu.getParentId());
            mmap.put("m2", "m2_" + curMenu.getMenuId());
        } else {
            mmap.put("m1", annotationValue);
            mmap.put("m2", "");
        }

    }

    /**
     * 响应返回结果
     *
     * @param rows 影响行数
     * @return 操作结果
     */
    protected R toAjax(int rows) {
        return rows > 0 ? success() : error();
    }

    /**
     * 返回成功
     */
    public R success() {
        return R.ok();
    }

    /**
     * 返回失败消息
     */
    public R error() {
        return R.error();
    }

    /**
     * 返回成功消息
     */
    public R success(String message) {
        return R.ok(message);
    }

    /**
     * 返回失败消息
     */
    public R error(String message) {
        return R.error(message);
    }

    /**
     * 返回错误码消息
     */
    public R error(int code, String message) {
        return R.error(code, message);
    }

    /**
     * 页面跳转
     */
    public String redirect(String url) {
        return StringUtils.format("redirect:{}", url);
    }

    public UserEntity getUser() {
        return ShiroUtils.getUser();
    }

    public void setUser(UserEntity user) {
        ShiroUtils.setUser(user);
    }

    public Long getUserId() {
        return getUser().getUserId();
    }

    public String getLoginName() {
        return getUser().getLoginName();
    }

}
