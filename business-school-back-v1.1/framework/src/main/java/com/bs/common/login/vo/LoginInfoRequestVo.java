package com.bs.common.login.vo;

import lombok.Data;

@Data
public class LoginInfoRequestVo {
    /**
     * 用户名(手机号)
     */
    private String username;
    /**
     * 图形验证码
     */
    private String code;
    /**
     * 图形验证码的uuid，用来从redis里查询图形验证码
     */
    private String uuid;
    /**
     * 短信验证码，例如：6728
     */
    private String smsCode;
}
