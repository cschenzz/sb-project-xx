package com.sibo.project.iot.iotModelParameters.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.iotModelParameters.dao.IotModelParametersDao;
import com.sibo.project.iot.iotModelParameters.entity.IotModelParametersEntity;
import com.sibo.project.iot.iotModelParameters.service.IIotModelParametersService;

/**
 * 参数 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@Service("iotModelParametersService")
public class IotModelParametersServiceImpl extends ServiceImpl<IotModelParametersDao, IotModelParametersEntity> implements IIotModelParametersService {
}
