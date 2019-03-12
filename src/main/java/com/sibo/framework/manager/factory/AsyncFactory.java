package com.sibo.framework.manager.factory;

import com.sibo.common.constant.Constants;
import com.sibo.common.utils.AddressUtils;
import com.sibo.common.utils.LogUtils;
import com.sibo.common.utils.ServletUtils;
import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.common.utils.spring.SpringUtils;
import com.sibo.project.iot.logLogin.entity.LogLoginEntity;
import com.sibo.project.iot.logLogin.service.ILogLoginService;
import com.sibo.project.iot.logOper.entity.LogOperEntity;
import com.sibo.project.iot.logOper.service.ILogOperService;
import eu.bitwalker.useragentutils.UserAgent;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.util.TimerTask;

/**
 * 异步工厂（产生任务用）
 *
 * @author liuhulu
 */
public class AsyncFactory {
    private static final Logger sys_user_logger = LoggerFactory.getLogger("sys-user");

    /**
     * 操作日志记录
     *
     * @param operLog 操作日志信息
     * @return 任务task
     */
    public static TimerTask recordOper(final LogOperEntity operLog) {
        return new TimerTask() {
            @Override
            public void run() {
                // 远程查询操作地点
                operLog.setOperLocation(AddressUtils.getRealAddressByIP(operLog.getOperIp()));
                SpringUtils.getBean(ILogOperService.class).save(operLog);
            }
        };
    }

    /**
     * 记录登陆信息
     *
     * @param username 用户名
     * @param status   状态
     * @param message  消息
     * @param args     列表
     * @return 任务task
     */
    public static TimerTask recordLogininfor(final String username, final String status, final String message, final Object... args) {
        final UserAgent userAgent = UserAgent.parseUserAgentString(ServletUtils.getRequest().getHeader("User-Agent"));
        final String ip = ShiroUtils.getIp();
        return new TimerTask() {
            @Override
            public void run() {
                StringBuilder s = new StringBuilder();
                s.append(LogUtils.getBlock(ip));
                s.append(AddressUtils.getRealAddressByIP(ip));
                s.append(LogUtils.getBlock(username));
                s.append(LogUtils.getBlock(status));
                s.append(LogUtils.getBlock(message));
                // 打印信息到日志
                sys_user_logger.info(s.toString(), args);
                // 获取客户端操作系统
                String os = userAgent.getOperatingSystem().getName();
                // 获取客户端浏览器
                String browser = userAgent.getBrowser().getName();
                // 封装对象
                LogLoginEntity logininfor = new LogLoginEntity();
                logininfor.setLoginName(username);
                logininfor.setLoginIp(ip);
                logininfor.setMessage(message);
                // 日志状态
                if (Constants.LOGIN_SUCCESS.equals(status) || Constants.LOGOUT.equals(status)) {
                    logininfor.setLoginResult(0);
                } else if (Constants.LOGIN_FAIL.equals(status)) {
                    logininfor.setLoginResult(1);
                }
                // 插入数据
                SpringUtils.getBean(ILogLoginService.class).save(logininfor);
            }
        };
    }
}
