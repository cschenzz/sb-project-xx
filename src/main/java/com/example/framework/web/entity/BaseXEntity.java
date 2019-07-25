package com.example.framework.web.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.google.common.collect.Maps;

import java.io.Serializable;
import java.util.Map;

/**
 * Entity基类,主要用于查询,不添加多余字段
 *
 * @author chenzz
 */
public class BaseXEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 搜索值
     */
    @TableField(exist = false)
    private String searchValue;

    /**
     * 请求参数
     */
    @TableField(exist = false)
    private Map<String, Object> params;

    public String getSearchValue() {
        return searchValue;
    }

    public void setSearchValue(String searchValue) {
        this.searchValue = searchValue;
    }

    public Map<String, Object> getParams() {
        if (params == null) {
            params = Maps.newHashMap();
        }
        return params;
    }

    public void setParams(Map<String, Object> params) {
        this.params = params;
    }
}
