package com.sibo.project.iot.iotModels.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.iot.iotModels.dao.IotModelsDao;
import com.sibo.project.iot.iotModels.entity.IotModelsEntity;
import com.sibo.project.iot.iotModels.service.IIotModelsService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 模型 服务层实现
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Service("iotModelsService")
public class IotModelsServiceImpl extends ServiceImpl<IotModelsDao, IotModelsEntity> implements IIotModelsService {

    /**
     * 分页查询:模型
     *
     * @return 分页page
     */
    @Override
    public IPage<?> listPage(IotModelsEntity iotModels) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotModelsEntity> wrapper = new LambdaQueryWrapper<IotModelsEntity>()
                    .like(IotModelsEntity::getModelName, keyWord)
                    .or().like(IotModelsEntity::getModelDescription, keyWord)
                    .orderByDesc(IotModelsEntity::getId);

            //---------------------------
            IPage<IotModelsEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        //---------------------------
        Wrapper<IotModelsEntity> wrapperSort = new LambdaQueryWrapper<IotModelsEntity>()
                .orderByDesc(IotModelsEntity::getId);

        IPage<IotModelsEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
    }

}
