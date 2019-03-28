package com.sibo.project.iot.iotProjects.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.sibo.project.iot.iotProjects.entity.IotProjectsEntity;

/**
 * 项目 服务层
 *
 * @author chenzz
 * @date 2019-03-28
 */
public interface IIotProjectsService extends IService<IotProjectsEntity> {

    /**
     * 分页查询:项目
     *
     * @return 分页page
     */
    IPage<?> listPage(IotProjectsEntity iotProjects);
}
