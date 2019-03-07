package com.sibo.project.yl.article.entity;

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
 * 文章表 tb_article
 *
 * @author chenzz
 * @date 2018-10-21
 */
@TableName("tb_article")
public class ArticleEntity extends BaseXEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增id
     */
    //主键
    @TableId
    private Long id;

    /**
     * 标题
     */
    private String title;

    /**
     * 摘要
     */
    private String summary;

    /**
     * 文章内容
     */
    private String htmlContext;

    /**
     * 添加时间
     */
    private Date createTime;

    /**
     * 修改时间
     */
    private Date updateTime;

    /**
     * 标签
     */
    private String tag;

    /**
     * 添加用户id
     */
    private Long addUserId;

    /**
     * 修改用户id
     */
    private Long updateUserId;

    /**
     * 类别关键字
     */
    private String typeKey;

    //----------------------------------

    @TableField(exist = false)
    private String loginName;

    @TableField(exist = false)
    private String userName;

    @TableField(exist = false)
    private String email;

    public String getLoginName() {
        return loginName;
    }

    public void setLoginName(String loginName) {
        this.loginName = loginName;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    //----------------------------------

    public void setId(Long id) {
        this.id = id;
    }

    public Long getId() {
        return id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getTitle() {
        return title;
    }

    public void setSummary(String summary) {
        this.summary = summary;
    }

    public String getSummary() {
        return summary;
    }

    public void setHtmlContext(String htmlContext) {
        this.htmlContext = htmlContext;
    }

    public String getHtmlContext() {
        return htmlContext;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public String getTag() {
        return tag;
    }

    public void setAddUserId(Long addUserId) {
        this.addUserId = addUserId;
    }

    public Long getAddUserId() {
        return addUserId;
    }

    public void setUpdateUserId(Long updateUserId) {
        this.updateUserId = updateUserId;
    }

    public Long getUpdateUserId() {
        return updateUserId;
    }

    public void setTypeKey(String typeKey) {
        this.typeKey = typeKey;
    }

    public String getTypeKey() {
        return typeKey;
    }


    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("title", getTitle())
                .append("summary", getSummary())
                .append("htmlContext", getHtmlContext())
                .append("createTime", getCreateTime())
                .append("updateTime", getUpdateTime())
                .append("tag", getTag())
                .append("addUserId", getAddUserId())
                .append("updateUserId", getUpdateUserId())
                .append("typeKey", getTypeKey())
                .toString();
    }

}
