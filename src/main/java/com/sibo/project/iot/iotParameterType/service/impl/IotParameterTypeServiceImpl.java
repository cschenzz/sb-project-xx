package com.sibo.project.iot.iotParameterType.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.iot.iotParameterType.dao.IotParameterTypeDao;
import com.sibo.project.iot.iotParameterType.entity.IotParameterTypeEntity;
import com.sibo.project.iot.iotParameterType.service.IIotParameterTypeService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 参数类型 服务层实现
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Service("iotParameterTypeService")
public class IotParameterTypeServiceImpl extends ServiceImpl<IotParameterTypeDao, IotParameterTypeEntity> implements IIotParameterTypeService {

    /**
     * 分页查询:参数类型
     *
     * @return 分页page
     */
    @Override
    public IPage<?> listPage(IotParameterTypeEntity iotParameterType) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotParameterTypeEntity> wrapper = new LambdaQueryWrapper<IotParameterTypeEntity>()
                    //.like(IotParameterTypeEntity::getTitle, keyWord)
                    //.or().like(IotParameterTypeEntity::getSummary, keyWord)
                    .orderByDesc(IotParameterTypeEntity::getId);

            //---------------------------
            IPage<IotParameterTypeEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        //---------------------------
        Wrapper<IotParameterTypeEntity> wrapperSort = new LambdaQueryWrapper<IotParameterTypeEntity>()
                .orderByDesc(IotParameterTypeEntity::getId);

        IPage<IotParameterTypeEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
    }

}
