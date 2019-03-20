package com.sibo.project.iot.logLogin.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.iot.logLogin.entity.LogLoginEntity;

/**
 * 系统访问记录 服务层
 *
 * @author chenzz
 * @date 2019-03-12
 */
public interface ILogLoginService extends IService<LogLoginEntity> {
    void recordLogininfor(String username, String status, String message);
}
