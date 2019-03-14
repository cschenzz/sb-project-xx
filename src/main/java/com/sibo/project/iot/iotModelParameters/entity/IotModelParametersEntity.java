package com.sibo.project.iot.iotModelParameters.entity;

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
 * 参数表 iot_model_parameters
 * 
 * @author chenzz
 * @date 2019-03-14
 */
@TableName("iot_model_parameters")
public class IotModelParametersEntity extends BaseXEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 自增id */
    @TableId
	private Integer id;

	/** 模型id */
	private Integer modelId;

	/** 参数名 */
	private String parameterName;

	/** 显示名称 */
	private String parameterShowname;

	/** 类型 */
	private Integer parameterType;

	/** 默认值 */
	private String parameterDefault;

	/** 单位 */
	private String parameterUnit;

	/** 说明 */
	private String parameterDescription;

	/** 添加,修改时间 */
	private Date modifyTime;


	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setModelId(Integer modelId) {
		this.modelId = modelId;
	}

	public Integer getModelId() {
		return modelId;
	}

	public void setParameterName(String parameterName) {
		this.parameterName = parameterName;
	}

	public String getParameterName() {
		return parameterName;
	}

	public void setParameterShowname(String parameterShowname) {
		this.parameterShowname = parameterShowname;
	}

	public String getParameterShowname() {
		return parameterShowname;
	}

	public void setParameterType(Integer parameterType) {
		this.parameterType = parameterType;
	}

	public Integer getParameterType() {
		return parameterType;
	}

	public void setParameterDefault(String parameterDefault) {
		this.parameterDefault = parameterDefault;
	}

	public String getParameterDefault() {
		return parameterDefault;
	}

	public void setParameterUnit(String parameterUnit) {
		this.parameterUnit = parameterUnit;
	}

	public String getParameterUnit() {
		return parameterUnit;
	}

	public void setParameterDescription(String parameterDescription) {
		this.parameterDescription = parameterDescription;
	}

	public String getParameterDescription() {
		return parameterDescription;
	}

	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}

	public Date getModifyTime() {
		return modifyTime;
	}


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("modelId", getModelId())
            .append("parameterName", getParameterName())
            .append("parameterShowname", getParameterShowname())
            .append("parameterType", getParameterType())
            .append("parameterDefault", getParameterDefault())
            .append("parameterUnit", getParameterUnit())
            .append("parameterDescription", getParameterDescription())
            .append("modifyTime", getModifyTime())
            .toString();
    }
}
