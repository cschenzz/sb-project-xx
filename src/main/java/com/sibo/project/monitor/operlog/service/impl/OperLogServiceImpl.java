package com.sibo.project.monitor.operlog.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.monitor.operlog.dao.OperLogMapper;
import com.sibo.project.monitor.operlog.entity.OperLogEntity;
import com.sibo.project.monitor.operlog.service.IOperLogService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

/**
 * 操作日志 服务层处理
 *
 * @author chenzz
 */
@Service
public class OperLogServiceImpl extends ServiceImpl<OperLogMapper, OperLogEntity> implements IOperLogService {

    @Override
    public IPage<?> listPage(OperLogEntity operLog) {
        //-----------------------
        //http://localhost:5000/sys/user/listFuncs?limit=10&page=1&sidx=create_time&asc=desc&_=1534490135367
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();

        if (!StringUtils.isEmpty(operLog.getTitle())
                || operLog.getBusinessType() != null) {
            //-----------------------
            Wrapper<OperLogEntity> wrapper = null;
            if (operLog.getBusinessType() != null) {
                wrapper = new LambdaQueryWrapper<OperLogEntity>()
                        .like(OperLogEntity::getTitle, operLog.getTitle())
                        .eq(OperLogEntity::getBusinessType, operLog.getBusinessType())
                        .orderByDesc(OperLogEntity::getOperId);
            } else {
                wrapper = new LambdaQueryWrapper<OperLogEntity>()
                        .like(OperLogEntity::getTitle, operLog.getTitle())
                        .orderByDesc(OperLogEntity::getOperId);
            }

            //---------------------------
            IPage<OperLogEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        Wrapper<OperLogEntity> wrapperSort = new LambdaQueryWrapper<OperLogEntity>()
                .orderByDesc(OperLogEntity::getOperId);

        IPage<OperLogEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
        //----------------------------------------------
    }

    /**
     * 清空操作日志
     */
    @Override
    public void cleanOperLog() {
        baseMapper.cleanOperLog();
    }
}
