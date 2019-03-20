package com.sibo.project.system.user.controller;

import cn.hutool.core.util.StrUtil;
import com.google.code.kaptcha.Constants;
import com.sibo.common.utils.MessageUtils;
import com.sibo.common.utils.ServletUtils;
import com.sibo.common.utils.StringUtils;
import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.framework.web.controller.BaseController;
import com.sibo.framework.web.entity.R;
import com.sibo.project.iot.logLogin.service.ILogLoginService;
import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 登录验证
 *
 * @author chenzz
 */
@Controller
public class LoginController extends BaseController {

    @Autowired
    private ILogLoginService logLoginService;

    @GetMapping("/login")
    public String login(HttpServletRequest request, HttpServletResponse response) {
        // 如果是Ajax请求，返回Json字符串。
        if (ServletUtils.isAjaxRequest(request)) {
            return ServletUtils.renderString(response, "{\"code\":\"1\",\"msg\":\"未登录或登录超时。请重新登录\"}");
        }

        return "login";
    }

    @PostMapping("/login")
    @ResponseBody
    public R ajaxLogin(String username, String password, String validateCode, Boolean rememberMe, boolean isValidCode) {
        //-----------------
        //验证验证码
        if (isValidCode) {
            if (StrUtil.isEmpty(validateCode)) {
                logLoginService.recordLogininfor(username, com.sibo.common.constant.Constants.LOGIN_FAIL, MessageUtils.message("user.jcaptcha.error"));
                return R.error("验证码错误!");
            }

            Object obj = ShiroUtils.getSession().getAttribute(Constants.KAPTCHA_SESSION_KEY);
            String code = String.valueOf(obj != null ? obj : "");
            if (!validateCode.equalsIgnoreCase(code))
                return R.error("验证码错误!");
        }
        //-----------------
        UsernamePasswordToken token = new UsernamePasswordToken(username, password, rememberMe);
        Subject subject = SecurityUtils.getSubject();
        try {
            subject.login(token);
            return success();
        } catch (AuthenticationException e) {
            String msg = "用户或密码错误";
            if (StringUtils.isNotEmpty(e.getMessage())) {
                msg = e.getMessage();
            }
            return error(msg);
        }
    }

    @GetMapping("/unauth")
    public String unauth() {
        return "/error/unauth";
    }
}
