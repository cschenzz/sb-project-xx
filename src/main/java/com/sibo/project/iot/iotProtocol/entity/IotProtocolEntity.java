package com.sibo.project.iot.iotProtocol.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import com.sibo.framework.web.entity.BaseXEntity;
import org.apache.commons.lang3.builder.ToStringBuilder;
import org.apache.commons.lang3.builder.ToStringStyle;

import java.io.Serializable;

/**
 * 协议表 iot_protocol
 *
 * @author chenzz
 * @date 2019-03-28
 */
@TableName("iot_protocol")
public class IotProtocolEntity extends BaseXEntity implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 自增id
     */
    @TableId
    private Integer id;

    /**
     * 协议名称
     */
    private String protocol;


    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setProtocol(String protocol) {
        this.protocol = protocol;
    }

    public String getProtocol() {
        return protocol;
    }


    @Override
    public String toString() {
        return new ToStringBuilder(this, ToStringStyle.MULTI_LINE_STYLE)
                .append("id", getId())
                .append("protocol", getProtocol())
                .toString();
    }
}
