package com.sibo.project.iot.logOper.entity;

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
 * 操作日志记录表 sys_log_oper
 * 
 * @author chenzz
 * @date 2019-03-12
 */
@TableName("sys_log_oper")
public class LogOperEntity extends BaseXEntity implements Serializable {

	private static final long serialVersionUID = 1L;

	/** 日志主键 */
    @TableId
	private Integer id;

	/** 模块标题 */
	private String title;

	/** 业务类型（0其它 1新增 2修改 3删除） */
	private Integer businessType;

	/** 方法名称 */
	private String method;

	/** 操作人员 */
	private Integer userId;

	/** 请求URL */
	private String operUrl;

	/** 主机地址 */
	private String operIp;

	/** 操作地点 */
	private String operLocation;

	/** 请求参数 */
	private String operParam;

	/** 操作状态（0正常 1异常） */
	private Integer status;

	/** 错误消息 */
	private String errorMsg;

	/** 操作时间 */
	private Date operTime;


	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getId() {
		return id;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getTitle() {
		return title;
	}

	public void setBusinessType(Integer businessType) {
		this.businessType = businessType;
	}

	public Integer getBusinessType() {
		return businessType;
	}

	public void setMethod(String method) {
		this.method = method;
	}

	public String getMethod() {
		return method;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setOperUrl(String operUrl) {
		this.operUrl = operUrl;
	}

	public String getOperUrl() {
		return operUrl;
	}

	public void setOperIp(String operIp) {
		this.operIp = operIp;
	}

	public String getOperIp() {
		return operIp;
	}

	public void setOperLocation(String operLocation) {
		this.operLocation = operLocation;
	}

	public String getOperLocation() {
		return operLocation;
	}

	public void setOperParam(String operParam) {
		this.operParam = operParam;
	}

	public String getOperParam() {
		return operParam;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getStatus() {
		return status;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setOperTime(Date operTime) {
		this.operTime = operTime;
	}

	public Date getOperTime() {
		return operTime;
	}


    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
            .append("id", getId())
            .append("title", getTitle())
            .append("businessType", getBusinessType())
            .append("method", getMethod())
            .append("userId", getUserId())
            .append("operUrl", getOperUrl())
            .append("operIp", getOperIp())
            .append("operLocation", getOperLocation())
            .append("operParam", getOperParam())
            .append("status", getStatus())
            .append("errorMsg", getErrorMsg())
            .append("operTime", getOperTime())
            .toString();
    }
}
