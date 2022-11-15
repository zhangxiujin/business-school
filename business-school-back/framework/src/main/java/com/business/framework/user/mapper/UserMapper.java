package com.business.framework.user.mapper;

import com.business.framework.user.po.User;
import org.springframework.stereotype.Repository;

@Repository
public interface UserMapper {

    User selectUserByUsername(String username);
}
