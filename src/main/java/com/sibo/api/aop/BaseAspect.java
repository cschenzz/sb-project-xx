package com.sibo.api.aop;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public abstract class BaseAspect {
    //当前激活的配置文件
    @Value("${spring.profiles.active}")
    protected String env;

    //密钥
    @Value("${application.api.secret}")
    protected String SECRET;

    @Autowired(required = false)
    protected HttpServletRequest request;

    @Autowired(required = false)
    protected HttpServletResponse response;

    /**
     * 获取请求的token
     */
    protected String getRequestToken(HttpServletRequest httpRequest) {
        //从header中获取token
        String token = httpRequest.getHeader("Authorization");

        //如果header中不存在token，则从参数中获取token
        if (StringUtils.isBlank(token)) {
            token = httpRequest.getParameter("Authorization");
        }

        return token;
    }
}
