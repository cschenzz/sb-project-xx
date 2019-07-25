package com.example.project.system.config.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.project.system.config.entity.ConfigEntity;

/**
 * 参数配置 服务层
 *
 * @author chenzz
 */
public interface IConfigService extends IService<ConfigEntity> {

    IPage<?> listPage(ConfigEntity config);

    /**
     * 根据键名查询参数配置信息
     *
     * @param configKey 参数键名
     * @return 参数键值
     */
    String selectConfigByKey(String configKey);

    /**
     * 新增参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    boolean insertConfig(ConfigEntity config);

    /**
     * 修改参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    boolean updateConfig(ConfigEntity config);

    /**
     * 校验参数键名是否唯一
     *
     * @param config 参数信息
     * @return 结果
     */
    String checkConfigKeyUnique(ConfigEntity config);

}
