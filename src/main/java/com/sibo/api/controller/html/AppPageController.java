package com.sibo.api.controller.html;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

/**
 * app主页
 */
@Controller
@RequestMapping("/app/html")
public class AppPageController {

    private String prefix = "apphtml";

    /**
     * app主页
     */
    @GetMapping("/home")
    public String home(@RequestParam(value = "userid", required = false) Long userId, Model model) {
        return prefix + "/home";

    }

    /**
     * app用户协议
     */
    @GetMapping("/usage-protocol")
    public String usageProtocol(ModelMap mmap) {
        mmap.put("name", "chenzz");
        return prefix + "/usage-protocol";
    }

}
