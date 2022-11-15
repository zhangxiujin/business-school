package com.business.login.controller;

import com.business.login.service.ILoginService;
import com.business.login.vo.LoginVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping
public class LoginController {

    @Autowired
    private ILoginService loginService;

    /**
     * 登录
     * @return token
     */
    @PostMapping("/login")
    public String login(@RequestBody LoginVo loginVo) {
        // 基于 spring security框架来实现
        return loginService.login(loginVo.getUsername(), loginVo.getPassword(), null, null);
    }

    /**
     * 登出
     */
    @PostMapping("/logout")
    public void logout() {

    }

    /**
     * public UserListVo queryUserList() {}
     * public RewardListVo queryRewardList() {}
     */
}
