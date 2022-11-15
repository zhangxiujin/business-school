package com.business.framework.user.service.impl;


import com.business.framework.user.mapper.UserMapper;
import com.business.framework.user.po.User;
import com.business.framework.user.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * 用户实现类
 */
@Service
public class UserServiceImpl implements IUserService {

        @Autowired
        private UserMapper userMapper;

        @Override
        public User selectUserByUsername(String username) {
                return userMapper.selectUserByUsername(username);
        }
}
