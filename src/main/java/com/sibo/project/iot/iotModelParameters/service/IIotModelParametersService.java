package com.sibo.project.iot.iotModelParameters.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.iot.iotModelParameters.entity.IotModelParametersEntity;

/**
 * 参数 服务层
 *
 * @author chenzz
 * @date 2019-03-28
 */
public interface IIotModelParametersService extends IService<IotModelParametersEntity> {

    /**
     * 分页查询:参数
     *
     * @return 分页page
     */
    IPage<?> listPage(IotModelParametersEntity iotModelParameters);
}
