package com.sibo.project.iot.iotProjects.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
//---------------------------------
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
//---------------------------------
import com.sibo.project.iot.iotProjects.dao.IotProjectsDao;
import com.sibo.project.iot.iotProjects.entity.IotProjectsEntity;
import com.sibo.project.iot.iotProjects.service.IIotProjectsService;

/**
 * 项目 服务层实现
 *
 * @author chenzz
 * @date 2019-03-22
 */
@Service("iotProjectsService")
public class IotProjectsServiceImpl extends ServiceImpl<IotProjectsDao, IotProjectsEntity> implements IIotProjectsService {

    @Override
    public IPage<?> listPage() {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotProjectsEntity> wrapper = new LambdaQueryWrapper<IotProjectsEntity>()
                    .like(IotProjectsEntity::getProjectName, keyWord)
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
