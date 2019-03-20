package com.sibo.project.iot.logLogin.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sibo.framework.web.entity.BaseXEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;

//-----------------------------------

/**
 * 系统访问记录表 sys_log_login
 *
 * @author chenzz
 * @date 2019-03-12
 */
@TableName("sys_log_login")
public class LogLoginEntity extends BaseXEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 访问ID
     */
    @TableId
    private Integer id;

    /**
     * 登陆用户id
     */
    private Long userid;

    /**
     * 登录账号
     */
    private String loginName;

    /**
     * 登录IP地址
     */
    private String loginIp;

    /**
     * 登录状态（0成功 1失败）
     */
    private Integer loginResult;

    /**
     * 提示消息
     */
    private String message;

    /**
     * 访问时间
     */
    private Date loginTime;


    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

    public Long getUserid() {
        return userid;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginIp(String loginIp) {
        this.loginIp = loginIp;
    }

    public String getLoginIp() {
        return loginIp;
    }

    public void setLoginResult(Integer loginResult) {
        this.loginResult = loginResult;
    }

    public Integer getLoginResult() {
        return loginResult;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getMessage() {
        return message;
    }

    public void setLoginTime(Date loginTime) {
        this.loginTime = loginTime;
    }

    public Date getLoginTime() {
        return loginTime;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("userid", getUserid())
                .append("loginName", getLoginName())
                .append("loginIp", getLoginIp())
                .append("loginResult", getLoginResult())
                .append("message", getMessage())
                .append("loginTime", getLoginTime())
                .toString();
    }
}
