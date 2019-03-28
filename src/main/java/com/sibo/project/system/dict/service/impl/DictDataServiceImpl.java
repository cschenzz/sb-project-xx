package com.sibo.project.system.dict.service.impl;

import com.baomidou.mybatisplus.core.conditions.Wrapper;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.sibo.common.utils.StringUtils;
import com.sibo.common.utils.security.ShiroUtils;
import com.sibo.framework.web.page.PageDomain;
import com.sibo.framework.web.page.TableSupport;
import com.sibo.project.system.dict.dao.DictDataMapper;
import com.sibo.project.system.dict.entity.DictDataEntity;
import com.sibo.project.system.dict.service.IDictDataService;
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
public class DictDataServiceImpl extends ServiceImpl<DictDataMapper, DictDataEntity> implements IDictDataService {

    @Override
    public IPage<?> listPage(DictDataEntity dictData) {
        //-----------------------
        PageDomain pageDomain = TableSupport.buildPageRequest();
        Integer pageNum = pageDomain.getPageNum();
        Integer pageSize = pageDomain.getPageSize();

        if (!StringUtils.isEmpty(dictData.getDictType())) {
            //-----------------------
            Wrapper<DictDataEntity> wrapper = new LambdaQueryWrapper<DictDataEntity>()
                    .eq(DictDataEntity::getDictType, dictData.getDictType());

            //---------------------------
            IPage<DictDataEntity> pageList = this.page(new Page<>(pageNum, pageSize), wrapper);
            return pageList;
            //-----------
        }

        IPage<DictDataEntity> pageList = this.page(new Page<>(pageNum, pageSize), null);
        return pageList;
        //----------------------------------------------
    }


    /**
     * 根据字典类型查询字典数据
     *
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    @Override
    public List<DictDataEntity> selectDictDataByType(String dictType) {
        Wrapper<DictDataEntity> wrapper = new LambdaQueryWrapper<DictDataEntity>()
                .eq(DictDataEntity::getDictType, dictType);
        return this.list(wrapper);
    }

    /**
     * 根据字典类型和字典键值查询字典数据信息
     *
     * @param dictType  字典类型
     * @param dictValue 字典键值
     * @return 字典标签
     */
    @Override
    public String selectDictLabel(String dictType, String dictValue) {
        Wrapper<DictDataEntity> wrapper = new LambdaQueryWrapper<DictDataEntity>()
                .eq(DictDataEntity::getDictType, dictType)
                .eq(DictDataEntity::getDictValue, dictValue);
        DictDataEntity entity = this.getOne(wrapper);
        return entity != null ? entity.getDictLabel() : "";
    }

    /**
     * 根据字典数据ID查询信息
     *
     * @param dictCode 字典数据ID
     * @return 字典数据
     */
    @Override
    public DictDataEntity selectDictDataById(Long dictCode) {
        Wrapper<DictDataEntity> wrapper = new LambdaQueryWrapper<DictDataEntity>()
                .eq(DictDataEntity::getDictCode, dictCode);
        return this.getOne(wrapper);
    }

    /**
     * 批量删除字典数据
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    @Override
    public boolean deleteDictDataByIds(String ids) {
        List<String> dictIds = Arrays.asList(ids.split(","));
        return this.removeByIds(dictIds);
    }

    /**
     * 新增保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    @Override
    public boolean insertDictData(DictDataEntity dictData) {
        dictData.setCreateBy(ShiroUtils.getLoginName());
        dictData.setCreateTime(new Date());
        return this.save(dictData);
    }

    /**
     * 修改保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    @Override
    public boolean updateDictData(DictDataEntity dictData) {
        dictData.setUpdateBy(ShiroUtils.getLoginName());
        dictData.setUpdateTime(new Date());

        //更新记录
        Wrapper<DictDataEntity> wrapper = new QueryWrapper<DictDataEntity>().lambda()
                //--------where-----------
                .eq(DictDataEntity::getDictCode, dictData.getDictCode());

        //根据条件更新记录
        return this.update(dictData, wrapper);
    }

}
