package com.sibo.project.iot.iotModels.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.iotModels.dao.IotModelsDao;
import com.sibo.project.iot.iotModels.entity.IotModelsEntity;
import com.sibo.project.iot.iotModels.service.IIotModelsService;

/**
 * 模型 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@Service("iotModelsService")
public class IotModelsServiceImpl extends ServiceImpl<IotModelsDao, IotModelsEntity> implements IIotModelsService {
}
