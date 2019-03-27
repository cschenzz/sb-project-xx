package com.sibo.project.system.dict.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sibo.project.system.dict.entity.DictTypeEntity;

import java.util.List;

/**
 * 字典表 数据层
 *
 * @author chenzz
 */
public interface DictTypeMapper extends BaseMapper<DictTypeEntity> {
    /**
     * 根据条件分页查询字典类型
     *
     * @param dictType 字典类型信息
     * @return 字典类型集合信息
     */
    List<DictTypeEntity> selectDictTypeList(DictTypeEntity dictType);

    /**
     * 根据所有字典类型
     *
     * @return 字典类型集合信息
     */
    List<DictTypeEntity> selectDictTypeAll();

    /**
     * 根据字典类型ID查询信息
     *
     * @param dictId 字典类型ID
     * @return 字典类型
     */
    DictTypeEntity selectDictTypeById(Long dictId);

    /**
     * 通过字典ID删除字典信息
     *
     * @param dictId 字典ID
     * @return 结果
     */
    int deleteDictTypeById(Long dictId);

    /**
     * 批量删除字典类型
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    int deleteDictTypeByIds(Long[] ids);

    /**
     * 新增字典类型信息
     *
     * @param dictType 字典类型信息
     * @return 结果
     */
    int insertDictType(DictTypeEntity dictType);

    /**
     * 修改字典类型信息
     *
     * @param dictType 字典类型信息
     * @return 结果
     */
    int updateDictType(DictTypeEntity dictType);

    /**
     * 校验字典类型称是否唯一
     *
     * @param dictType 字典类型
     * @return 结果
     */
    DictTypeEntity checkDictTypeUnique(String dictType);
}
