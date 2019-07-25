package com.example.project.monitor.operlog.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.framework.web.page.PageDomain;
import com.example.framework.web.page.TableSupport;
import com.example.project.monitor.operlog.dao.OperLogMapper;
import com.example.project.monitor.operlog.entity.OperLogEntity;
import com.example.project.monitor.operlog.service.IOperLogService;
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

        //当系统模块和操作类型有一个有值,根据条件查询,条件不多的时候可以使用mp3.x提供的Wrapper实现
        //如果条件比较多,建议在xml中直接使用sql实现,因为使用mp实现条件判断太多,反而让程序变复杂
        //具体实现可以参考sb-admin-fast中实现,可以结合mp3.x的分页插件实现
        if (!StringUtils.isEmpty(operLog.getTitle())
                || operLog.getBusinessType() != null) {
            //-----------------------
            Wrapper<OperLogEntity> wrapper;
            if (operLog.getBusinessType() != null) {
                //按操作类型和系统模块查询(系统模块为空时不影响)
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
