package com.bs.common.login.service;

import com.bs.common.login.vo.LoginInfoRequestVo;
import com.bs.common.login.vo.LoginInfoResponseVo;

public interface ILoginService {
    /**
     * 登录方法
     * @param loginInfoRequestVo 请求参数的vo
     * @return 响应vo (view object)
     */
    LoginInfoResponseVo login(LoginInfoRequestVo loginInfoRequestVo);
}
