package com.sibo.api.entity;

public class UserTokenDtoEntity {

    private Long userid;
    private String authorization;


    public Long getUserid() {
        return userid;
    }

    public String getAuthorization() {
        return authorization;
    }

    public void setAuthorization(String authorization) {
        this.authorization = authorization;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

}
