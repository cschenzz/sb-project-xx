package com.example.project.system.dict.service;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.IService;
import com.example.project.system.dict.entity.DictDataEntity;

import java.util.List;

/**
 * 字典 业务层
 *
 * @author chenzz
 */
public interface IDictDataService extends IService<DictDataEntity> {

    IPage<?> listPage(DictDataEntity dictData);

    /**
     * 根据字典类型查询字典数据
     *
     * @param dictType 字典类型
     * @return 字典数据集合信息
     */
    List<DictDataEntity> selectDictDataByType(String dictType);

    /**
     * 根据字典类型和字典键值查询字典数据信息
     *
     * @param dictType  字典类型
     * @param dictValue 字典键值
     * @return 字典标签
     */
    String selectDictLabel(String dictType, String dictValue);

    /**
     * 根据字典数据ID查询信息
     *
     * @param dictCode 字典数据ID
     * @return 字典数据
     */
    DictDataEntity selectDictDataById(Long dictCode);

    /**
     * 批量删除字典数据
     *
     * @param ids 需要删除的数据
     * @return 结果
     */
    boolean deleteDictDataByIds(String ids);

    /**
     * 新增保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    boolean insertDictData(DictDataEntity dictData);

    /**
     * 修改保存字典数据信息
     *
     * @param dictData 字典数据信息
     * @return 结果
     */
    boolean updateDictData(DictDataEntity dictData);

}
