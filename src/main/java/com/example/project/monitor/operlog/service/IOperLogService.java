package com.example.project.monitor.operlog.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.project.monitor.operlog.entity.OperLogEntity;

/**
 * 操作日志 服务层
 *
 * @author chenzz
 */
public interface IOperLogService extends IService<OperLogEntity> {
    IPage<?> listPage(OperLogEntity operLog);

    /**
     * 清空操作日志
     */
    void cleanOperLog();
}
