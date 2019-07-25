package com.example.framework.config;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

/**
 * 读取项目相关配置,对应application-dev.yml中配置项
 * 用法:使用Autowired声明bean再调用对应的实例方法
 *
 * @author chenzz
 */
@Component
@ConfigurationProperties(prefix = "cnsibo")
public class SbConfig {
    /**
     * 项目名称
     */
    private String name;
    /**
     * 版本
     */
    private String version;
    /**
     * 版权年份
     */
    private String copyrightYear;
    /**
     * 上传路径
     */
    private static String profile;
    /**
     * 获取地址开关
     */
    private static boolean addressEnabled;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getVersion() {
        return version;
    }

    public void setVersion(String version) {
        this.version = version;
    }

    public String getCopyrightYear() {
        return copyrightYear;
    }

    public void setCopyrightYear(String copyrightYear) {
        this.copyrightYear = copyrightYear;
    }

    public static String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        SbConfig.profile = profile;
    }

    public static boolean isAddressEnabled() {
        return addressEnabled;
    }

    public void setAddressEnabled(boolean addressEnabled) {
        SbConfig.addressEnabled = addressEnabled;
    }

    public static String getAvatarPath() {
        return profile + "avatar/";
    }

    public static String getDownloadPath() {
        return profile + "download/";
    }

    public static String getUploadPath() {
        return profile + "upload/";
    }
}

