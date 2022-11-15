package com.bs.common.response;

/**
 * 包含响应code和codeMsg
 */
public enum ResponseEnum {

    SUCCESS(200, "SUCCESS"),
    USER_NOT_FOUND(101, "USER_NOT_FOUND"),
    CAPATCH_IMAGE_GEN_FAIL(102, "CAPATCH_IMAGE_GEN_FAIL"),
    CAPATCH_CODE_EXPIRED(103, "CAPATCH_CODE_EXPIRED"),
    CAPATCH_CODE_INPUT_ERROR(104, "CAPATCH_CODE_INPUT_ERROR"),
    SMS_EXPIRED(105, "SMS_EXPIRED"),
    SMS_ERROR(106, "SMS_ERROR"),
    PHONE_FORMAT_ERROR(107, "PHONE_FORMAT_ERROR"),
    SYSTEM_ERROR(9999, "SYSTEM_ERROR"),
    TOKEN_NOT_EMPTY(108, "TOKEN_NOT_EMPTY"),
    TOKEN_EXPIRED(109, "TOKEN_EXPIRED"),
    ARGUMENT_CHECK_FAIL(110, "ARGUMENT_CHECK_FAIL"),
    TITLE_SENSITIVE(111, "TITLE_SENSITIVE"),
    CONTENT_SENSITIVE(112, "CONTENT_SENSITIVE");

    private Integer code;
    private String codeMsg;

    ResponseEnum(Integer code, String codeMsg) {
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
