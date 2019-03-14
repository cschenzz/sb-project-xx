package com.sibo.project.iot.iotParameterType.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.iotParameterType.dao.IotParameterTypeDao;
import com.sibo.project.iot.iotParameterType.entity.IotParameterTypeEntity;
import com.sibo.project.iot.iotParameterType.service.IIotParameterTypeService;

/**
 * 参数类型 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@Service("iotParameterTypeService")
public class IotParameterTypeServiceImpl extends ServiceImpl<IotParameterTypeDao, IotParameterTypeEntity> implements IIotParameterTypeService {
}
