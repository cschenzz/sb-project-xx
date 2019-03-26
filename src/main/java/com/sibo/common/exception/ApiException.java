package com.sibo.common.exception;

public class ApiException extends RuntimeException {

    private static final long serialVersionUID = 1L;

    private final int code;
    private final String errMessage;

    public ApiException(String errMessage) {
        this(500, errMessage);
    }

    public ApiException(int code, String errMessage) {
        this.code = code;
        this.errMessage = errMessage;
    }

    public int getCode() {
        return code;
    }

    @Override
    public String getMessage() {
        return errMessage;
    }

}