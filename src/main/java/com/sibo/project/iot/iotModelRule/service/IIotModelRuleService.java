package com.sibo.project.iot.iotModelRule.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.iot.iotModelRule.entity.IotModelRuleEntity;

/**
 * 规则 服务层
 *
 * @author chenzz
 * @date 2019-03-28
 */
public interface IIotModelRuleService extends IService<IotModelRuleEntity> {

    /**
     * 分页查询:规则
     *
     * @return 分页page
     */
    IPage<?> listPage(IotModelRuleEntity iotModelRule);
}
