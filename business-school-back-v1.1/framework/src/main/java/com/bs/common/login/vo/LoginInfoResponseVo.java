package com.bs.common.login.vo;

import com.bs.user.po.User;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class LoginInfoResponseVo {
    /**
     * 用户令牌
     */
    private String token;

    /**
     * 用户的信息
     */
    private User user;
}
