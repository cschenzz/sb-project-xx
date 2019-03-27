package com.sibo.project.monitor.operlog.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sibo.project.monitor.operlog.entity.OperLogEntity;
import org.apache.ibatis.annotations.Delete;

/**
 * 操作日志 数据层
 *
 * @author chenzz
 */
public interface OperLogMapper extends BaseMapper<OperLogEntity> {
    /**
     * 清空操作日志
     */
    @Delete("truncate table sys_oper_log")
    void cleanOperLog();
}
