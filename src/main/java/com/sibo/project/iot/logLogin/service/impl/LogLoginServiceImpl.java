package com.sibo.project.iot.logLogin.service.impl;

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.common.constant.Constants;
import com.sibo.common.utils.ServletUtils;
import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.project.iot.logLogin.dao.LogLoginDao;
import com.sibo.project.iot.logLogin.entity.LogLoginEntity;
import com.sibo.project.iot.logLogin.service.ILogLoginService;
import eu.bitwalker.useragentutils.UserAgent;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 系统访问记录 服务层实现
 *
 * @author chenzz
 * @date 2019-03-12
 */
@Service("logLoginService")
public class LogLoginServiceImpl extends ServiceImpl<LogLoginDao, LogLoginEntity> implements ILogLoginService {
    @Override
    public void recordLogininfor(String username, String status, String message) {
        final UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        final String ip = ShiroUtils.getIp();

        LogLoginEntity logininfor = new LogLoginEntity();
        logininfor.setUserid(0L);
        logininfor.setLoginName(username);
        logininfor.setLoginIp(ip);
        logininfor.setMessage(message);
        // 日志状态
        if (Constants.LOGIN_SUCCESS.equals(status) || Constants.LOGOUT.equals(status)) {
            logininfor.setLoginResult(0);
        } else if (Constants.LOGIN_FAIL.equals(status)) {
            logininfor.setLoginResult(1);
        }
        logininfor.setLoginTime(new Date());

        this.save(logininfor);
    }
}
