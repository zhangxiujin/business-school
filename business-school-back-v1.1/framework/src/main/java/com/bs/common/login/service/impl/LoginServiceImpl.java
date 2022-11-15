package com.bs.common.login.service.impl;

import com.bs.common.capatch.exception.CapatchImageFailException;
import com.bs.common.login.service.ILoginService;
import com.bs.common.login.vo.LoginInfoRequestVo;
import com.bs.common.login.vo.LoginInfoResponseVo;
import com.bs.common.response.ResponseEnum;
import com.bs.common.sms.exception.SMSException;
import com.bs.user.po.User;
import com.bs.user.service.UserServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.stereotype.Service;

import java.time.Duration;
import java.util.UUID;

@Service
public class LoginServiceImpl implements ILoginService {

    @Value("${config.token.expired}")
    private Long tokenExpired;

    /**
     * 认证管理器
     */
    @Autowired
    private AuthenticationManager authenticationManager;
    @Autowired
    private RedisTemplate redisTemplate;
    @Autowired
    private UserServiceImpl userService;

    @Override
    public LoginInfoResponseVo login(LoginInfoRequestVo loginInfoRequestVo) {
        //图形验证码校验
        Object obj = redisTemplate.opsForValue().get(Long.parseLong(loginInfoRequestVo.getUuid()));
        if (obj == null) {
            throw new CapatchImageFailException(ResponseEnum.CAPATCH_CODE_EXPIRED.getCode(),
                    ResponseEnum.CAPATCH_CODE_EXPIRED.getCodeMsg());
        }
        String code = (String) obj;
        if (!code.equals(loginInfoRequestVo.getCode())) {
            throw new CapatchImageFailException(ResponseEnum.CAPATCH_CODE_INPUT_ERROR.getCode(),
                    ResponseEnum.CAPATCH_CODE_INPUT_ERROR.getCodeMsg());
        }
        redisTemplate.delete(Long.parseLong(loginInfoRequestVo.getUuid()));

        //短信验证码校验
        Object phone = redisTemplate.opsForValue().get(loginInfoRequestVo.getUsername());
        if (phone == null) {
            throw new SMSException(ResponseEnum.SMS_EXPIRED.getCode(),
                    ResponseEnum.SMS_EXPIRED.getCodeMsg());
        }
        if (!((String) phone).equals(loginInfoRequestVo.getSmsCode())) {
            throw new SMSException(ResponseEnum.SMS_ERROR.getCode(),
                    ResponseEnum.SMS_ERROR.getCodeMsg());
        }
        redisTemplate.delete(loginInfoRequestVo.getUsername());

        synchronized (this) {
            //查询用户名是否存在库中
            User _user = userService.queryUserByUsername(loginInfoRequestVo.getUsername());
            if (_user == null) {
                //未注册
                //保存用户入库
                _user = new User();
                _user.setUsername(loginInfoRequestVo.getUsername());
                userService.saveUser(_user);
            }
        }

        //按照spring security的要求，我们要讲用户名和密码封装到spring security给我提供的对象中
        UsernamePasswordAuthenticationToken usernamePasswordAuthenticationToken =
                new UsernamePasswordAuthenticationToken(loginInfoRequestVo.getUsername(),
                        null);
        try {
            authenticationManager.authenticate(usernamePasswordAuthenticationToken);
        } catch (AuthenticationException e) {
            e.printStackTrace();
            if (!(e instanceof BadCredentialsException)) {
                throw new RuntimeException("身份校验失败!");
            }
        }

        //基于uuid的方式来创建token
        String token = UUID.randomUUID().toString();
        //查询用户信息

        User user = userService.queryUserByUsername(loginInfoRequestVo.getUsername());
        user.setPassword(null);
        //将token放入我们的redis缓存
        redisTemplate.opsForValue().set(token, user, Duration.ofMinutes(tokenExpired));
        LoginInfoResponseVo loginInfoResponseVo = new LoginInfoResponseVo();
        loginInfoResponseVo.setToken(token);
        loginInfoResponseVo.setUser(user);
        return loginInfoResponseVo;
    }
}
