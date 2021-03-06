package com.example.api.controller;

import com.example.framework.web.entity.R;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

/**
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2018-04-28 16:18:21
 */
@RestController
@RequestMapping("/api")
public class ApiController {

    @GetMapping("/test1")
    public R test1() {
        return R.ok().data("test");
    }

    @GetMapping("/test2")
    public R test2() {
        return R.ok().data(LocalDateTime.now());
    }

}
