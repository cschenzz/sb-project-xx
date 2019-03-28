package com.sibo.project.iot.iotModelRule.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sibo.framework.web.entity.BaseXEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;

/**
 * 规则表 iot_model_rule
 *
 * @author chenzz
 * @date 2019-03-28
 */
@TableName("iot_model_rule")
public class IotModelRuleEntity extends BaseXEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增id
     */
    @TableId
    private Integer id;

    /**
     * 模型id
     */
    private Integer modelId;

    /**
     * 执行顺序
     */
    private Integer ruleExecuteOrder;

    /**
     * 规则名称
     */
    private String ruleName;

    /**
     * 规则条件
     */
    private String ruleCondition;

    /**
     * 执行动作
     */
    private String ruleDo;

    /**
     * 规则说明
     */
    private String ruleDescription;

    /**
     * 添加,修改时间
     */
    private Date ruleModitime;

    /**
     * 审核状态
     */
    private Integer approvalStatus;

    /**
     * 审核时间
     */
    private Date approvalTime;


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

    public void setRuleExecuteOrder(Integer ruleExecuteOrder) {
        this.ruleExecuteOrder = ruleExecuteOrder;
    }

    public Integer getRuleExecuteOrder() {
        return ruleExecuteOrder;
    }

    public void setRuleName(String ruleName) {
        this.ruleName = ruleName;
    }

    public String getRuleName() {
        return ruleName;
    }

    public void setRuleCondition(String ruleCondition) {
        this.ruleCondition = ruleCondition;
    }

    public String getRuleCondition() {
        return ruleCondition;
    }

    public void setRuleDo(String ruleDo) {
        this.ruleDo = ruleDo;
    }

    public String getRuleDo() {
        return ruleDo;
    }

    public void setRuleDescription(String ruleDescription) {
        this.ruleDescription = ruleDescription;
    }

    public String getRuleDescription() {
        return ruleDescription;
    }

    public void setRuleModitime(Date ruleModitime) {
        this.ruleModitime = ruleModitime;
    }

    public Date getRuleModitime() {
        return ruleModitime;
    }

    public void setApprovalStatus(Integer approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public Integer getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalTime(Date approvalTime) {
        this.approvalTime = approvalTime;
    }

    public Date getApprovalTime() {
        return approvalTime;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("modelId", getModelId())
                .append("ruleExecuteOrder", getRuleExecuteOrder())
                .append("ruleName", getRuleName())
                .append("ruleCondition", getRuleCondition())
                .append("ruleDo", getRuleDo())
                .append("ruleDescription", getRuleDescription())
                .append("ruleModitime", getRuleModitime())
                .append("approvalStatus", getApprovalStatus())
                .append("approvalTime", getApprovalTime())
                .toString();
    }
}
