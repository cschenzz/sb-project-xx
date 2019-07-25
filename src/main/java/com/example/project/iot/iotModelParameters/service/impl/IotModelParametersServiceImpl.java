package com.example.project.iot.iotModelParameters.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.framework.web.page.PageDomain;
import com.example.framework.web.page.TableSupport;
import com.example.project.iot.iotModelParameters.dao.IotModelParametersDao;
import com.example.project.iot.iotModelParameters.entity.IotModelParametersEntity;
import com.example.project.iot.iotModelParameters.service.IIotModelParametersService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 参数 服务层实现
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Service("iotModelParametersService")
public class IotModelParametersServiceImpl extends ServiceImpl<IotModelParametersDao, IotModelParametersEntity> implements IIotModelParametersService {

    /**
     * 分页查询:参数
     *
     * @return 分页page
     */
    @Override
    public IPage<?> listPage(IotModelParametersEntity iotModelParameters) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotModelParametersEntity> wrapper = new LambdaQueryWrapper<IotModelParametersEntity>()
                    .like(IotModelParametersEntity::getParameterName, keyWord)
                    .or().like(IotModelParametersEntity::getParameterShowname, keyWord)
                    .orderByDesc(IotModelParametersEntity::getId);

            //---------------------------
            IPage<IotModelParametersEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        //---------------------------
        Wrapper<IotModelParametersEntity> wrapperSort = new LambdaQueryWrapper<IotModelParametersEntity>()
                .orderByDesc(IotModelParametersEntity::getId);

        IPage<IotModelParametersEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
    }

}
