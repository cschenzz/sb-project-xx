package com.sibo.framework.web.exception;

import com.sibo.common.exception.DemoModeException;
import com.sibo.common.utils.security.PermissionUtils;
import com.sibo.framework.web.entity.R;
import org.apache.shiro.authz.AuthorizationException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.HttpRequestMethodNotSupportedException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

/**
 * 自定义异常处理器
 *
 * @author chenzz
 */
@RestControllerAdvice
public class DefaultExceptionHandler {
    private static final Logger log = LoggerFactory.getLogger(DefaultExceptionHandler.class);

    /**
     * 权限校验失败
     */
    @ExceptionHandler(AuthorizationException.class)
    public R handleAuthorizationException(AuthorizationException e) {
        log.error(e.getMessage(), e);
        return R.error(PermissionUtils.getMsg(e.getMessage()));
    }

    /**
     * 请求方式不支持
     */
    @ExceptionHandler({HttpRequestMethodNotSupportedException.class})
    public R handleException(HttpRequestMethodNotSupportedException e) {
        log.error(e.getMessage(), e);
        return R.error("不支持' " + e.getMethod() + "'请求");
    }

    /**
     * 拦截未知的运行时异常
     */
    @ExceptionHandler(RuntimeException.class)
    public R notFount(RuntimeException e) {
        log.error("运行时异常:", e);
        if (e instanceof java.lang.NumberFormatException) {
            return R.error("数据格式错误!");
        } else if (e instanceof org.springframework.web.client.ResourceAccessException) {
            return R.error("连接服务器出错!");
        } else if (e instanceof org.springframework.web.method.annotation.MethodArgumentTypeMismatchException) {
            return R.error("参数类型错误!");
        }
        //------------------------------
        return R.error(e.getMessage());
    }

    /**
     * 系统异常
     */
    @ExceptionHandler(Exception.class)
    public R handleException(Exception e) {
        log.error(e.getMessage(), e);
        return R.error("服务器错误，请联系管理员");
    }

    /**
     * 演示模式异常
     */
    @ExceptionHandler(DemoModeException.class)
    public R demoModeException(DemoModeException e) {
        return R.error("演示模式，不允许操作");
    }

}
