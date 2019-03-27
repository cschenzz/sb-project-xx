package com.sibo.project.monitor.logininfor.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.monitor.logininfor.entity.LogininforEntity;

/**
 * 系统访问日志情况信息 服务层
 *
 * @author chenzz
 */
public interface ILogininforService extends IService<LogininforEntity> {
    IPage<?> listPage(LogininforEntity user);

    /**
     * 清空系统登录日志
     */
    void cleanLogininfor();
}
