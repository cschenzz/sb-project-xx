package com.example.project.iot.iotProjects.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.example.framework.web.entity.BaseXEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;

/**
 * 项目表 iot_projects
 *
 * @author chenzz
 * @date 2019-03-28
 */
@TableName("iot_projects")
public class IotProjectsEntity extends BaseXEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增
     */
    @TableId
    private Integer id;

    /**
     * 项目id,程序生成,唯一
     */
    private String projectId;

    /**
     * 项目名称
     */
    private String projectName;

    /**
     * 访问地址
     */
    private String projectUrl;

    /**
     * 绑定域名
     */
    private String projectDomain;

    /**
     * 项目TOKEN
     */
    private String token;

    /**
     * 项目LOGO
     */
    private String projectLogo;

    /**
     * 项目说明
     */
    private String projectDescription;

    /**
     * 负责人
     */
    private String projectCharge;

    /**
     * 负责人电话
     */
    private String chargetel;

    /**
     * 负责人邮箱
     */
    private String chargeemail;

    /**
     * 项目状态
     */
    private Integer projectStatus;

    /**
     * 所属用户
     */
    private Integer userid;


    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setProjectId(String projectId) {
        this.projectId = projectId;
    }

    public String getProjectId() {
        return projectId;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectUrl(String projectUrl) {
        this.projectUrl = projectUrl;
    }

    public String getProjectUrl() {
        return projectUrl;
    }

    public void setProjectDomain(String projectDomain) {
        this.projectDomain = projectDomain;
    }

    public String getProjectDomain() {
        return projectDomain;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public String getToken() {
        return token;
    }

    public void setProjectLogo(String projectLogo) {
        this.projectLogo = projectLogo;
    }

    public String getProjectLogo() {
        return projectLogo;
    }

    public void setProjectDescription(String projectDescription) {
        this.projectDescription = projectDescription;
    }

    public String getProjectDescription() {
        return projectDescription;
    }

    public void setProjectCharge(String projectCharge) {
        this.projectCharge = projectCharge;
    }

    public String getProjectCharge() {
        return projectCharge;
    }

    public void setChargetel(String chargetel) {
        this.chargetel = chargetel;
    }

    public String getChargetel() {
        return chargetel;
    }

    public void setChargeemail(String chargeemail) {
        this.chargeemail = chargeemail;
    }

    public String getChargeemail() {
        return chargeemail;
    }

    public void setProjectStatus(Integer projectStatus) {
        this.projectStatus = projectStatus;
    }

    public Integer getProjectStatus() {
        return projectStatus;
    }

    public void setUserid(Integer userid) {
        this.userid = userid;
    }

    public Integer getUserid() {
        return userid;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("projectId", getProjectId())
                .append("projectName", getProjectName())
                .append("projectUrl", getProjectUrl())
                .append("projectDomain", getProjectDomain())
                .append("token", getToken())
                .append("projectLogo", getProjectLogo())
                .append("projectDescription", getProjectDescription())
                .append("projectCharge", getProjectCharge())
                .append("chargetel", getChargetel())
                .append("chargeemail", getChargeemail())
                .append("projectStatus", getProjectStatus())
                .append("userid", getUserid())
                .toString();
    }
}
