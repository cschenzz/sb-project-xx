package com.example.project.iot.iotModels.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.framework.web.entity.BaseXEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;

/**
 * 模型表 iot_models
 *
 * @author chenzz
 * @date 2019-03-28
 */
@TableName("iot_models")
public class IotModelsEntity extends BaseXEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增
     */
    @TableId
    private Integer id;

    /**
     * 模型名称
     */
    private String modelName;

    /**
     * 模型说明
     */
    private String modelDescription;

    /**
     * 协议类型
     */
    private Integer protocolId;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 状态
     */
    private Integer status;

    /**
     * 模型id
     */
    private String modelId;

    /**
     * 网管地址
     */
    private String gateWay;

    /**
     * token,系统生成,唯一
     */
    private String token;


    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }

    public String getModelName() {
        return modelName;
    }

    public void setModelDescription(String modelDescription) {
        this.modelDescription = modelDescription;
    }

    public String getModelDescription() {
        return modelDescription;
    }

    public void setProtocolId(Integer protocolId) {
        this.protocolId = protocolId;
    }

    public Integer getProtocolId() {
        return protocolId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setModelId(String modelId) {
        this.modelId = modelId;
    }

    public String getModelId() {
        return modelId;
    }

    public void setGateWay(String gateWay) {
        this.gateWay = gateWay;
    }

    public String getGateWay() {
        return gateWay;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("modelName", getModelName())
                .append("modelDescription", getModelDescription())
                .append("protocolId", getProtocolId())
                .append("userId", getUserId())
                .append("createTime", getCreateTime())
                .append("status", getStatus())
                .append("modelId", getModelId())
                .append("gateWay", getGateWay())
                .append("token", getToken())
                .toString();
    }
}
