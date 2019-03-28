package com.sibo.project.iot.iotProjects.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.iot.iotProjects.dao.IotProjectsDao;
import com.sibo.project.iot.iotProjects.entity.IotProjectsEntity;
import com.sibo.project.iot.iotProjects.service.IIotProjectsService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 项目 服务层实现
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Service("iotProjectsService")
public class IotProjectsServiceImpl extends ServiceImpl<IotProjectsDao, IotProjectsEntity> implements IIotProjectsService {

    /**
     * 分页查询:项目
     *
     * @return 分页page
     */
    @Override
    public IPage<?> listPage(IotProjectsEntity iotProjects) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotProjectsEntity> wrapper = new LambdaQueryWrapper<IotProjectsEntity>()
                    //.like(IotProjectsEntity::getTitle, keyWord)
                    //.or().like(IotProjectsEntity::getSummary, keyWord)
                    .orderByDesc(IotProjectsEntity::getId);

            //---------------------------
            IPage<IotProjectsEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        //---------------------------
        Wrapper<IotProjectsEntity> wrapperSort = new LambdaQueryWrapper<IotProjectsEntity>()
                .orderByDesc(IotProjectsEntity::getId);

        IPage<IotProjectsEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
    }

}
