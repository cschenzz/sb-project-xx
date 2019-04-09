package com.sibo.api.controller;

import com.sibo.framework.config.SbConfig;
import com.sibo.framework.web.entity.R;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

/**
 * public下接口为公共接口,不需要验证签名
 *
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2019-04-02 16:18:21
 */
@RestController("publicApiController")
@RequestMapping("/api/public")
public class PublicApiController {

    @Autowired
    private SbConfig xxConfig;

    /**
     * 访问地址
     * localhost:8888/api/public/test-config-array
     *
     * @return
     */
    @GetMapping("/test-get-name")
    public R testConfigArray() {
        return R.ok("name").data(xxConfig.getName());
    }

}
