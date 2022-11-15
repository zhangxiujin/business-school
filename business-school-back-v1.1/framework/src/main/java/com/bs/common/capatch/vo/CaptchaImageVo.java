package com.bs.common.capatch.vo;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CaptchaImageVo {

    // 图片验证码的uuid
    private String uuid;
    // 图片验证码的base64字符串
    private String base64Str;
}
