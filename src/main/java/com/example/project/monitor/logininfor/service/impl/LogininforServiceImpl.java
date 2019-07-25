package com.example.project.monitor.logininfor.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.framework.web.page.PageDomain;
import com.example.framework.web.page.TableSupport;
import com.example.project.monitor.logininfor.dao.LogininforMapper;
import com.example.project.monitor.logininfor.entity.LogininforEntity;
import com.example.project.monitor.logininfor.service.ILogininforService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * 系统访问日志情况信息 服务层处理
 *
 * @author chenzz
 */
@Service
public class LogininforServiceImpl extends ServiceImpl<LogininforMapper, LogininforEntity> implements ILogininforService {

    @Override
    public IPage<?> listPage(LogininforEntity user) {
        //-----------------------
        //http://localhost:5000/sys/user/listFuncs?limit=10&page=1&sidx=create_time&asc=desc&_=1534490135367
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<LogininforEntity> wrapper = new LambdaQueryWrapper<LogininforEntity>()
                    .like(LogininforEntity::getLoginName, keyWord)
                    .or().like(LogininforEntity::getBrowser, keyWord)
                    .or().like(LogininforEntity::getMsg, keyWord)
                    .orderByDesc(LogininforEntity::getInfoId);

            //---------------------------
            IPage<LogininforEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        Wrapper<LogininforEntity> wrapperSort = new LambdaQueryWrapper<LogininforEntity>()
                .orderByDesc(LogininforEntity::getInfoId);

        IPage<LogininforEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
        //----------------------------------------------
    }

    /**
     * 清空系统登录日志
     */
    @Override
    public void cleanLogininfor() {
        baseMapper.cleanLogininfor();
    }

}
