package com.sibo.api.entity;

public class UserTokenDtoEntity {

    private Long userid;
    private Long usertype;
    private String token;

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public Long getUsertype() {
        return usertype;
    }

    public void setUsertype(Long usertype) {
        this.usertype = usertype;
    }

    public Long getUserid() {
        return userid;
    }

    public void setUserid(Long userid) {
        this.userid = userid;
    }

}
