package com.sibo.project.system.user.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;
import org.apache.shiro.crypto.SecureRandomNumberGenerator;

import java.io.Serializable;
import java.util.Date;
//-----------------------------------

/**
 * 用户表 sys_user
 *
 * @author chenzz
 * @date 2019-03-11
 */
@TableName("sys_user")
public class User implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 用户ID
     */
    @TableId
    private Long id;

    /**
     * 登录账号
     */
    private String name;

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
    private String mobile;

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
     * 帐号状态（0正常 1停用）
     */
    private Integer status;

    /**
     * 备注
     */
    private String remark;


    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getName() {
        return name;
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

    /**
     * 生成随机盐
     */
    public void randomSalt() {
        // 一个Byte占两个字节，此处生成的3字节，字符串长度为6
        SecureRandomNumberGenerator secureRandom = new SecureRandomNumberGenerator();
        String hex = secureRandom.nextBytes(3).toHex();
        setSalt(hex);
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getEmail() {
        return email;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getMobile() {
        return mobile;
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
                .append("id", getId())
                .append("name", getName())
                .append("password", getPassword())
                .append("salt", getSalt())
                .append("email", getEmail())
                .append("mobile", getMobile())
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
