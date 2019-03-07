package com.sibo.api.utils;

import com.sibo.api.entity.UserTokenDtoEntity;

public class LocalUtil {

    private static final ThreadLocal<UserTokenDtoEntity> LOCAL_USER = new ThreadLocal<>();

    public static void setLocalUser(UserTokenDtoEntity user) {
        LOCAL_USER.set(user);
    }

    public static UserTokenDtoEntity getLocalUser() {
        return LOCAL_USER.get();
    }

    public static Long getLocalUserId() {
        if (LOCAL_USER.get() == null) {
            return null;
        }
        return LOCAL_USER.get().getUserid();
    }
}