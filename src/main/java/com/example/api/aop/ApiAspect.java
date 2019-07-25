package com.example.api.aop;

import com.example.framework.web.entity.R;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

/**
 * @author chenzz
 * @email cs.chenzz@qq.com
 * @date 2018-04-28 16:18:21
 */

@Aspect
@Component
public class ApiAspect extends BaseAspect {

    private final static Logger logger = LoggerFactory.getLogger(ApiAspect.class);

    @Pointcut("@within(org.springframework.web.bind.annotation.RestController) && within(com.example.api.controller..*)")
    public void apiPointcut() {
    }

    @Around("apiPointcut()")
    public Object requestAround(ProceedingJoinPoint joinPoint) throws Throwable {

        long startMs = System.currentTimeMillis();
        logRequestInfo(joinPoint);
        //--------------------
        checkAuthorizationOrToken();
        //-----------------------------
        try {
            Object resultObj = joinPoint.proceed(joinPoint.getArgs());
            return resultObj;
        } catch (Exception e) {
            e.printStackTrace();
            return R.error(e.getMessage());
        } finally {
            long executiveMs = System.currentTimeMillis() - startMs;
            logger.debug("call {} spend time: {} ms", joinPoint.toLongString(), executiveMs);
        }
    }

    /**
     * 是否启用签名认证
     *
     * @return true, 验证签名;false,不验证
     */
    @Override
    protected boolean isCheckAuthorizationOrToken() {

        if (!"dev-xxxx".equals(env)) {
            //非开发模式启用签名认证
            String uri = request.getRequestURI();

            //先放行公共接口,再使用白名单模式
            if (uri.startsWith("/api/public")) {
                //公共接口,不验证签名
                return false;
            } else if (uri.indexOf("/login") > -1) {
                return false;
            } else if (uri.indexOf("/user/login-by-pwd") > -1) {
                return false;
            } else if (uri.indexOf("/register") > -1) {
                return false;
            } else if (uri.indexOf("/getcode") > -1) {
                return false;
            }
            //---------------------
            return true;
        }

        return false;
    }

}
