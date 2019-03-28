package com.sibo.project.iot.iotModelRule.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.iot.iotModelRule.dao.IotModelRuleDao;
import com.sibo.project.iot.iotModelRule.entity.IotModelRuleEntity;
import com.sibo.project.iot.iotModelRule.service.IIotModelRuleService;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

//---------------------------------
//---------------------------------

/**
 * 规则 服务层实现
 *
 * @author chenzz
 * @date 2019-03-28
 */
@Service("iotModelRuleService")
public class IotModelRuleServiceImpl extends ServiceImpl<IotModelRuleDao, IotModelRuleEntity> implements IIotModelRuleService {

    /**
     * 分页查询:规则
     *
     * @return 分页page
     */
    @Override
    public IPage<?> listPage(IotModelRuleEntity iotModelRule) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<IotModelRuleEntity> wrapper = new LambdaQueryWrapper<IotModelRuleEntity>()
                    //.like(IotModelRuleEntity::getTitle, keyWord)
                    //.or().like(IotModelRuleEntity::getSummary, keyWord)
                    .orderByDesc(IotModelRuleEntity::getId);

            //---------------------------
            IPage<IotModelRuleEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        //---------------------------
        Wrapper<IotModelRuleEntity> wrapperSort = new LambdaQueryWrapper<IotModelRuleEntity>()
                .orderByDesc(IotModelRuleEntity::getId);

        IPage<IotModelRuleEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
    }

}
