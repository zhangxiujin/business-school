package com.business.framework.user.service;


import com.business.framework.user.po.User;

/**
 * 用户接口
 */
public interface IUserService {

    /**
     * 通过用户名来查询用户信息
     * @param username
     * @return 用户信息
     */
    User selectUserByUsername(String username);
}
