package com.example.project.iot.iotModels.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.project.iot.iotModels.entity.IotModelsEntity;

/**
 * 模型 服务层
 *
 * @author chenzz
 * @date 2019-03-28
 */
public interface IIotModelsService extends IService<IotModelsEntity> {

    /**
     * 分页查询:模型
     *
     * @return 分页page
     */
    IPage<?> listPage(IotModelsEntity iotModels);
}
