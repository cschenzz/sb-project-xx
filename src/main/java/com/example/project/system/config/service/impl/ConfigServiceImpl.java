package com.example.project.system.config.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.common.constant.UserConstants;
import com.example.common.utils.StringUtils;
import com.example.common.utils.security.ShiroUtils;
import com.example.framework.web.page.PageDomain;
import com.example.framework.web.page.TableSupport;
import com.example.project.system.config.dao.ConfigMapper;
import com.example.project.system.config.entity.ConfigEntity;
import com.example.project.system.config.service.IConfigService;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * 参数配置 服务层实现
 *
 * @author chenzz
 */
@Service
public class ConfigServiceImpl extends ServiceImpl<ConfigMapper, ConfigEntity> implements IConfigService {

    /**
     * 分页查询:参数类型
     *
     * @return 分页page
     */
    @Override
    public IPage<?> listPage(ConfigEntity config) {
        //-----------------------
        //http://localhost:5000/sys/user/listFuncs?limit=10&page=1&sidx=create_time&asc=desc&_=1534490135367
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<ConfigEntity> wrapper = new LambdaQueryWrapper<ConfigEntity>()
                    .like(ConfigEntity::getConfigKey, keyWord)
                    .or().like(ConfigEntity::getConfigName, keyWord)
                    .or().like(ConfigEntity::getConfigValue, keyWord)
                    .orderByDesc(ConfigEntity::getConfigId);

            //---------------------------
            IPage<ConfigEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        Wrapper<ConfigEntity> wrapperSort = new LambdaQueryWrapper<ConfigEntity>()
                .orderByDesc(ConfigEntity::getConfigId);

        IPage<ConfigEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
        //----------------------------------------------
    }

    /**
     * 根据键名查询参数配置信息
     *
     * @param configKey 参数名称
     * @return 参数键值
     */
    @Override
    public String selectConfigByKey(String configKey) {
        Wrapper<ConfigEntity> wrapper = new LambdaQueryWrapper<ConfigEntity>()
                .eq(ConfigEntity::getConfigKey, configKey);
        ConfigEntity retConfig = this.getOne(wrapper);
        return StringUtils.isNotNull(retConfig) ? retConfig.getConfigValue() : "";
    }

    /**
     * 新增参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public boolean insertConfig(ConfigEntity config) {
        config.setCreateBy(ShiroUtils.getLoginName());
        config.setCreateTime(new Date());
        return this.save(config);
    }

    /**
     * 修改参数配置
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public boolean updateConfig(ConfigEntity config) {
        config.setUpdateBy(ShiroUtils.getLoginName());
        config.setUpdateTime(new Date());
        return this.updateById(config);
    }

    /**
     * 校验参数键名是否唯一
     *
     * @param config 参数配置信息
     * @return 结果
     */
    @Override
    public String checkConfigKeyUnique(ConfigEntity config) {
        Long configId = StringUtils.isNull(config.getConfigId()) ? -1L : config.getConfigId();

        Wrapper<ConfigEntity> wrapper = new LambdaQueryWrapper<ConfigEntity>()
                .eq(ConfigEntity::getConfigKey, config.getConfigKey());
        ConfigEntity info = this.getOne(wrapper);
        if (StringUtils.isNotNull(info) && info.getConfigId().longValue() != configId.longValue()) {
            return UserConstants.CONFIG_KEY_NOT_UNIQUE;
        }
        return UserConstants.CONFIG_KEY_UNIQUE;
    }

}
