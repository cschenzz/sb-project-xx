package com.sibo.project.iot.iotParameterType.entity;

import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import com.sibo.framework.web.entity.BaseXEntity;
//-----------------------------------
import java.util.Date;

/**
 * 参数类型表 iot_parameter_type
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@TableName("iot_parameter_type")
public class IotParameterTypeEntity extends BaseXEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 自增id */
    @TableId
	private Integer id;

	/** 名称 */
	private String typeName;

	/** 添加时间 */
	private Date createTime;


	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getCreateTime() {
		return createTime;
	}


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("typeName", getTypeName())
            .append("createTime", getCreateTime())
            .toString();
    }
}
