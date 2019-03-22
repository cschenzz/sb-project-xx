package com.sibo.project.iot.iotParameterType.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.iot.iotParameterType.entity.IotParameterTypeEntity;

/**
 * 参数类型 服务层
 *
 * @author chenzz
 * @date 2019-03-22
 */
public interface IIotParameterTypeService extends IService<IotParameterTypeEntity> {

    /**
     * 分页查询:参数类型
     *
     * @return 分页page
     */
    IPage<?> listPage(IotParameterTypeEntity iotParameterType);
}
