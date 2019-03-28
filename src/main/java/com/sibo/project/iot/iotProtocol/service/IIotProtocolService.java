package com.sibo.project.iot.iotProtocol.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.iot.iotProtocol.entity.IotProtocolEntity;

/**
 * 协议 服务层
 *
 * @author chenzz
 * @date 2019-03-28
 */
public interface IIotProtocolService extends IService<IotProtocolEntity> {

    /**
     * 分页查询:协议
     *
     * @return 分页page
     */
    IPage<?> listPage(IotProtocolEntity iotProtocol);
}
