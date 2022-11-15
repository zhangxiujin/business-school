package com.bs.common.login.controller;

import com.bs.common.login.service.impl.LoginServiceImpl;
import com.bs.common.login.vo.LoginInfoRequestVo;
import com.bs.common.login.vo.LoginInfoResponseVo;
import com.bs.common.response.ResponseResult;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class LoginController {
    @Autowired
    private LoginServiceImpl loginService;

    @PostMapping("/login")
    public ResponseResult login(@RequestBody LoginInfoRequestVo loginInfoRequestVo) {
        LoginInfoResponseVo responseVo = loginService.login(loginInfoRequestVo);
        return new ResponseResult(responseVo);
    }
}
