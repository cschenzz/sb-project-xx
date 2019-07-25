package com.example.project.iot.iotProtocol.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.framework.web.page.PageDomain;
import com.example.framework.web.page.TableSupport;
import com.example.project.iot.iotProtocol.dao.IotProtocolDao;
import com.example.project.iot.iotProtocol.entity.IotProtocolEntity;
import com.example.project.iot.iotProtocol.service.IIotProtocolService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

/**
 * 协议 服务层实现
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Service("iotProtocolService")
public class IotProtocolServiceImpl extends ServiceImpl<IotProtocolDao, IotProtocolEntity> implements IIotProtocolService {

    /**
     * 分页查询:协议
     *
     * @return 分页page
     */
    @Override
    public IPage<?> listPage(IotProtocolEntity iotProtocol) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotProtocolEntity> wrapper = new LambdaQueryWrapper<IotProtocolEntity>()
                    .like(IotProtocolEntity::getProtocol, keyWord)
                    // .or().like(IotProtocolEntity::getSummary, keyWord)
                    .orderByDesc(IotProtocolEntity::getId);

            //---------------------------
            IPage<IotProtocolEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        //---------------------------
        Wrapper<IotProtocolEntity> wrapperSort = new LambdaQueryWrapper<IotProtocolEntity>()
                .orderByDesc(IotProtocolEntity::getId);

        IPage<IotProtocolEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
    }

}
