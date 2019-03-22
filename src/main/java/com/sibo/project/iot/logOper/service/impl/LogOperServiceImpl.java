package com.sibo.project.iot.logOper.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.iot.logOper.dao.LogOperDao;
import com.sibo.project.iot.logOper.entity.LogOperEntity;
import com.sibo.project.iot.logOper.service.ILogOperService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 操作日志记录 服务层实现
 *
 * @author chenzz
 * @date 2019-03-12
 */
@Service("logOperService")
public class LogOperServiceImpl extends ServiceImpl<LogOperDao, LogOperEntity> implements ILogOperService {

    @Override
    public IPage<?> listPage() {

        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<LogOperEntity> wrapper = new LambdaQueryWrapper<LogOperEntity>()
                    .like(LogOperEntity::getTitle, keyWord)
                    //.or().like(LogOperEntity::getSummary, keyWord)
                    .orderByDesc(LogOperEntity::getId);

            //---------------------------
            IPage<LogOperEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }
        //------------------------------
        Wrapper<LogOperEntity> wrapperSort = new LambdaQueryWrapper<LogOperEntity>()
                .orderByDesc(LogOperEntity::getId);

        IPage<LogOperEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
    }

}
