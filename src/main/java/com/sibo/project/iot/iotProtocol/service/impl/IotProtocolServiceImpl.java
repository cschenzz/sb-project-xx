package com.sibo.project.iot.iotProtocol.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.iotProtocol.dao.IotProtocolDao;
import com.sibo.project.iot.iotProtocol.entity.IotProtocolEntity;
import com.sibo.project.iot.iotProtocol.service.IIotProtocolService;

/**
 * 协议 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@Service("iotProtocolService")
public class IotProtocolServiceImpl extends ServiceImpl<IotProtocolDao, IotProtocolEntity> implements IIotProtocolService {
}
