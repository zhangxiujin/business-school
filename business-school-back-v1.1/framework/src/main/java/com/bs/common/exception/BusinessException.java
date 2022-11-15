package com.bs.common.exception;

/**
 * 业务类异常
 */
public class BusinessException extends RuntimeException {
    private Integer code;
    private String codeMsg;

    public BusinessException(Integer code, String codeMsg) {
        this.code = code;
        this.codeMsg = codeMsg;
    }

    public Integer getCode() {
        return code;
    }

    public String getCodeMsg() {
        return codeMsg;
    }
}
