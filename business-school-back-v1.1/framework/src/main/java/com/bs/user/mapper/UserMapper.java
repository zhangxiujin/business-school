package com.bs.user.mapper;

import com.bs.user.po.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {
    /**
     * 通过用户名查询用户信息
     * @param username
     * @return 用户信息
     */
    User selectUserByUsername(String username);

    /**
     * 保存用户信息
     * @param user
     */
    int insertUser(User user);
}
