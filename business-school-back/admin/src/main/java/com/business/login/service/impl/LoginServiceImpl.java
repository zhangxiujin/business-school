package com.business.login.service.impl;

import com.business.login.service.ILoginService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class LoginServiceImpl implements ILoginService {

    @Autowired
    private AuthenticationManager authenticationManager;

    /**
     * 登录方法
     * @param username
     * @param password
     * @param code
     * @param uuid
     * @return token
     */
    @Override
    public String login(String username, String password, String code, String uuid) {
        // 用户验证
        Authentication authentication = null;
        try
        {
            UsernamePasswordAuthenticationToken authenticationToken
                    = new UsernamePasswordAuthenticationToken(username, password);
//            AuthenticationContextHolder.setContext(authenticationToken);
            // 该方法会去调用UserDetailsServiceImpl.loadUserByUsername
            authentication = authenticationManager.authenticate(authenticationToken);
        }
        catch (Exception e)
        {
            e.printStackTrace();
            if (e instanceof BadCredentialsException)
            {
                throw new RuntimeException("密码不匹配");
//                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, MessageUtils.message("user.password.not.match")));
//                throw new UserPasswordNotMatchException();
            }
            else
            {
                throw new RuntimeException("服务未知异常");
//                AsyncManager.me().execute(AsyncFactory.recordLogininfor(username, Constants.LOGIN_FAIL, e.getMessage()));
//                throw new ServiceException(e.getMessage());
            }
        }
        finally
        {
//            AuthenticationContextHolder.clearContext();
        }
        return "token123456";
    }
}
