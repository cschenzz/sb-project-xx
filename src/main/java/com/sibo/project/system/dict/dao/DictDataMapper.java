package com.sibo.project.system.dict.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.sibo.project.system.dict.entity.DictDataEntity;
import org.apache.ibatis.annotations.Param;

/**
 * 字典表 数据层
 *
 * @author chenzz
 */
public interface DictDataMapper extends BaseMapper<DictDataEntity> {
    /**
     * 同步修改字典类型
     *
     * @param oldDictType 旧字典类型
     * @param newDictType 新旧字典类型
     * @return 结果
     */
    int updateDictDataType(@Param("oldDictType") String oldDictType, @Param("newDictType") String newDictType);
}
