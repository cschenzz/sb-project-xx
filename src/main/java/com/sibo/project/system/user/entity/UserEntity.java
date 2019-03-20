package com.sibo.project.system.user.entity;

import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sibo.framework.web.entity.BaseXEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;
import java.util.Date;
//-----------------------------------

/**
 * 用户表 sys_user
 *
 * @author chenzz
 * @date 2019-03-12
 */
@TableName("sys_user")
public class UserEntity extends BaseXEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @TableId("id")
    private Long userId;

    /**
     * 登录账号
     */
    @TableField("name")
    private String loginName;

    /**
     * 密码
     */
    private String password;

    /**
     * 盐加密
     */
    private String salt;

    /**
     * 用户邮箱
     */
    private String email;

    /**
     * 手机号码
     */
    @TableField("mobile")
    private String phonenumber;

    /**
     * 省
     */
    private Integer province;

    /**
     * 市
     */
    private Integer city;

    /**
     * 县
     */
    private Integer area;

    /**
     * 地址
     */
    private String address;

    /**
     * 用户性别（0男 1女 2未知）
     */
    private Integer sex;

    /**
     * 真实姓名
     */
    private String realname;

    /**
     * 用户级别
     */
    private Integer userrank;

    /**
     * 注册时间
     */
    private Date regtime;

    /**
     * 最后登录时间
     */
    private Date lastLogintime;

    /**
     * 最后登陆IP
     */
    private String lastLoginIp;

    /**
     * 头像路径
     */
    private String avatar;

    /**
     * 帐号状态（1正常 0停用）
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;

    public Long getUserId() {
        return userId;
    }

    public void setUserId(Long userId) {
        this.userId = userId;
    }

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPassword() {
        return password;
    }

    public void setSalt(String salt) {
        this.salt = salt;
    }

    public String getSalt() {
        return salt;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public String getPhonenumber() {
        return phonenumber;
    }

    public void setPhonenumber(String phonenumber) {
        this.phonenumber = phonenumber;
    }

    public void setProvince(Integer province) {
        this.province = province;
    }

    public Integer getProvince() {
        return province;
    }

    public void setCity(Integer city) {
        this.city = city;
    }

    public Integer getCity() {
        return city;
    }

    public void setArea(Integer area) {
        this.area = area;
    }

    public Integer getArea() {
        return area;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getAddress() {
        return address;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public Integer getSex() {
        return sex;
    }

    public void setRealname(String realname) {
        this.realname = realname;
    }

    public String getRealname() {
        return realname;
    }

    public void setUserrank(Integer userrank) {
        this.userrank = userrank;
    }

    public Integer getUserrank() {
        return userrank;
    }

    public void setRegtime(Date regtime) {
        this.regtime = regtime;
    }

    public Date getRegtime() {
        return regtime;
    }

    public void setLastLogintime(Date lastLogintime) {
        this.lastLogintime = lastLogintime;
    }

    public Date getLastLogintime() {
        return lastLogintime;
    }

    public void setLastLoginIp(String lastLoginIp) {
        this.lastLoginIp = lastLoginIp;
    }

    public String getLastLoginIp() {
        return lastLoginIp;
    }

    public void setAvatar(String avatar) {
        this.avatar = avatar;
    }

    public String getAvatar() {
        return avatar;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getStatus() {
        return status;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getRemark() {
        return remark;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("userId", getUserId())
                .append("loginName", getLoginName())
                .append("password", getPassword())
                .append("salt", getSalt())
                .append("email", getEmail())
                .append("phonenumber", getPhonenumber())
                .append("province", getProvince())
                .append("city", getCity())
                .append("area", getArea())
                .append("address", getAddress())
                .append("sex", getSex())
                .append("realname", getRealname())
                .append("userrank", getUserrank())
                .append("regtime", getRegtime())
                .append("lastLogintime", getLastLogintime())
                .append("lastLoginIp", getLastLoginIp())
                .append("avatar", getAvatar())
                .append("status", getStatus())
                .append("remark", getRemark())
                .toString();
    }
}
