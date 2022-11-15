package com.bs.user.service;

import cn.hutool.core.date.DateUtil;
import com.bs.common.utils.IdUtil;
import com.bs.user.mapper.UserMapper;
import com.bs.user.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;

@Service
public class UserServiceImpl {
    @Autowired
    private UserMapper userMapper;

    /**
     * 通过用户名查询用户信息
     * @param username 用户名
     * @return 用户实体信息
     */
    public User queryUserByUsername(String username) {
        return userMapper.selectUserByUsername(username);
    }

    /**
     * 保存用户信息
     */
    public Long saveUser(User user) {
        long id = IdUtil.nextId();
        user.setId(id);
        user.setCreateTime(new Date(System.currentTimeMillis()));
        user.setEnabled(1);
        user.setNickname(user.getUsername());
        userMapper.insertUser(user);
        return id;
    }

}
