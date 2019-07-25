package com.example.project.system.user.controller;

import com.example.framework.config.SbConfig;
import com.example.framework.web.controller.BaseController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * 首页 业务处理
 *
 * @author chenzz
 */
@Controller
public class IndexController extends BaseController {

    @Autowired
    private SbConfig sbConfig;

    /**
     * 系统首页
     *
     * @param mmap
     * @return
     */
    @GetMapping("/index")
    public String index(ModelMap mmap) {
        putBaseModelMap(mmap, "home");
        return "index_1" ;
    }

    /**
     * 系统介绍
     *
     * @param mmap
     * @return
     */
    @GetMapping("/system/main")
    public String main(ModelMap mmap) {
        mmap.put("version", sbConfig.getVersion());
        return "main" ;
    }

}
