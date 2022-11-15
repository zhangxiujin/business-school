package com.business.login.service;

/**
 * 登录接口
 */
public interface ILoginService {

    String login(String username, String password, String code, String uuid);
}
