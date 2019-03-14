package com.sibo.project.iot.iotProjects.service.impl;

import org.springframework.stereotype.Service;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.project.iot.iotProjects.dao.IotProjectsDao;
import com.sibo.project.iot.iotProjects.entity.IotProjectsEntity;
import com.sibo.project.iot.iotProjects.service.IIotProjectsService;

/**
 * 项目 服务层实现
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@Service("iotProjectsService")
public class IotProjectsServiceImpl extends ServiceImpl<IotProjectsDao, IotProjectsEntity> implements IIotProjectsService {
}
