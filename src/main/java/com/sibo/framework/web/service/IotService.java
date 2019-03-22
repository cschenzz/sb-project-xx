package com.sibo.framework.web.service;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.sibo.project.iot.iotModels.entity.IotModelsEntity;
import com.sibo.project.iot.iotModels.service.IIotModelsService;
import com.sibo.project.iot.iotParameterType.entity.IotParameterTypeEntity;
import com.sibo.project.iot.iotParameterType.service.IIotParameterTypeService;
import com.sibo.project.iot.iotProjects.entity.IotProjectsEntity;
import com.sibo.project.iot.iotProjects.service.IIotProjectsService;
import com.sibo.project.iot.iotProtocol.entity.IotProtocolEntity;
import com.sibo.project.iot.iotProtocol.service.IIotProtocolService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

/**
 * @author chenzz
 */
@Service("iotss")
public class IotService {

    @Autowired
    private IIotProjectsService projectsService;


    /**
     * 返回所有项目
     *
     * @return
     */
    public List<Map<String, Object>> getProjects() {
        Wrapper<IotProjectsEntity> wrapper = new LambdaQueryWrapper<IotProjectsEntity>()
                .select(IotProjectsEntity::getId, IotProjectsEntity::getProjectName, IotProjectsEntity::getToken)
                .orderByDesc(IotProjectsEntity::getId);

        return projectsService.listMaps(wrapper);
    }

    @Autowired
    private IIotProtocolService protocolService;


    /**
     * 返回所有协议
     *
     * @return
     */
    public List<Map<String, Object>> getProtocols() {
        Wrapper<IotProtocolEntity> wrapper = new LambdaQueryWrapper<IotProtocolEntity>()
                .select(IotProtocolEntity::getId, IotProtocolEntity::getProtocol)
                .orderByDesc(IotProtocolEntity::getId);

        return protocolService.listMaps(wrapper);
    }

    @Autowired
    private IIotModelsService modelsService;

    /**
     * 返回所有模型
     *
     * @return
     */
    public List<Map<String, Object>> getModels() {
        Wrapper<IotModelsEntity> wrapper = new LambdaQueryWrapper<IotModelsEntity>()
                .select(IotModelsEntity::getId, IotModelsEntity::getModelName, IotModelsEntity::getModelId, IotModelsEntity::getToken)
                .orderByDesc(IotModelsEntity::getId);

        return modelsService.listMaps(wrapper);
    }

    @Autowired
    private IIotParameterTypeService typeService;

    /**
     * 返回参数类型
     *
     * @return
     */
    public List<Map<String, Object>> getParameterTypes() {
        Wrapper<IotParameterTypeEntity> wrapper = new LambdaQueryWrapper<IotParameterTypeEntity>()
                .select(IotParameterTypeEntity::getId, IotParameterTypeEntity::getTypeName)
                .orderByDesc(IotParameterTypeEntity::getId);

        return typeService.listMaps(wrapper);
    }
}
