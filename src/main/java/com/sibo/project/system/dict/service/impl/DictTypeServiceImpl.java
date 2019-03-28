package com.sibo.project.system.dict.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.common.constant.UserConstants;
import com.sibo.common.utils.StringUtils;
import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.system.dict.dao.DictDataMapper;
import com.sibo.project.system.dict.dao.DictTypeMapper;
import com.sibo.project.system.dict.entity.DictTypeEntity;
import com.sibo.project.system.dict.service.IDictTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Arrays;
import java.util.Date;
import java.util.List;

/**
 * 字典 业务层处理
 *
 * @author chenzz
 */
@Service
public class DictTypeServiceImpl extends ServiceImpl<DictTypeMapper, DictTypeEntity> implements IDictTypeService {

    @Autowired
    private DictTypeMapper dictTypeMapper;

    @Autowired
    private DictDataMapper dictDataMapper;

    @Override
    public IPage<?> listPage(DictTypeEntity dictType) {
        //-----------------------
        //http://localhost:5000/sys/user/listFuncs?limit=10&page=1&sidx=create_time&asc=desc&_=1534490135367
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();
        String keyWord = pageDomain.getSearchKeyWord();

        if (!StringUtils.isEmpty(keyWord)) {
            //-----------------------
            Wrapper<DictTypeEntity> wrapper = new LambdaQueryWrapper<DictTypeEntity>()
                    .like(DictTypeEntity::getDictName, keyWord)
                    .orderByDesc(DictTypeEntity::getDictId);

            //---------------------------
            IPage<DictTypeEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        Wrapper<DictTypeEntity> wrapperSort = new LambdaQueryWrapper<DictTypeEntity>()
                .orderByDesc(DictTypeEntity::getDictId);

        IPage<DictTypeEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapperSort);
        return pageList;
        //----------------------------------------------
    }

    /**
     * 根据所有字典类型
     *
     * @return 字典类型集合信息
     */
    @Override
    public List<DictTypeEntity> selectDictTypeAll() {
        return this.list();
    }

    /**
     * 根据字典类型ID查询信息
     *
     * @param dictId 字典类型ID
     * @return 字典类型
     */
    @Override
    public DictTypeEntity selectDictTypeById(Long dictId) {
        Wrapper<DictTypeEntity> wrapper = new LambdaQueryWrapper<DictTypeEntity>()
                .eq(DictTypeEntity::getDictId, dictId);
        return this.getOne(wrapper);
    }


    /**
     * 批量删除字典类型
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    @Override
    public int deleteDictTypeByIds(String ids) throws Exception {
        // Long[] dictIds = Convert.toLongArray(ids);
        List<String> dictIds = Arrays.asList(ids.split(","));
        for (String dictId : dictIds) {
            DictTypeEntity dictType = selectDictTypeById(Long.parseLong(dictId));

            Wrapper<DictTypeEntity> wrapper = new LambdaQueryWrapper<DictTypeEntity>()
                    .eq(DictTypeEntity::getDictType, dictType.getDictType());

            if (this.count(wrapper) > 0) {
                throw new Exception(String.format("%1$s已分配,不能删除", dictType.getDictName()));
            }
        }

        return dictTypeMapper.deleteBatchIds(dictIds);
    }

    /**
     * 新增保存字典类型信息
     *
     * @param dictType 字典类型信息
     * @return 结果
     */
    @Override
    public boolean insertDictType(DictTypeEntity dictType) {
        dictType.setCreateBy(ShiroUtils.getLoginName());
        dictType.setCreateTime(new Date());
        return this.save(dictType);
    }

    /**
     * 修改保存字典类型信息
     *
     * @param dictType 字典类型信息
     * @return 结果
     */
    @Override
    public boolean updateDictType(DictTypeEntity dictType) {
        dictType.setUpdateBy(ShiroUtils.getLoginName());
        dictType.setUpdateTime(new Date());

        DictTypeEntity oldDict = this.getById(dictType.getDictId());
        dictDataMapper.updateDictDataType(oldDict.getDictType(), dictType.getDictType());

        return this.updateById(dictType);
    }

    /**
     * 校验字典类型称是否唯一
     *
     * @param dict 字典类型
     * @return 结果
     */
    @Override
    public String checkDictTypeUnique(DictTypeEntity dict) {
        Long dictId = StringUtils.isNull(dict.getDictId()) ? -1L : dict.getDictId();

        Wrapper<DictTypeEntity> wrapper = new LambdaQueryWrapper<DictTypeEntity>()
                .eq(DictTypeEntity::getDictType, dict.getDictType());

        DictTypeEntity dictType = this.getOne(wrapper);
        if (StringUtils.isNotNull(dictType) && dictType.getDictId().longValue() != dictId.longValue()) {
            return UserConstants.DICT_TYPE_NOT_UNIQUE;
        }
        return UserConstants.DICT_TYPE_UNIQUE;
    }
}
