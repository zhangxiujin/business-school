package com.bs.common.filter;

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.core.util.ByteUtil;
import cn.hutool.core.util.ObjectUtil;
import com.bs.common.login.vo.LoginInfoResponseVo;
import com.bs.common.response.ResponseEnum;
import com.bs.user.po.User;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.WebAuthenticationDetailsSource;
import org.springframework.stereotype.Component;
import org.springframework.web.filter.OncePerRequestFilter;

import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.beans.Encoder;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.nio.charset.StandardCharsets;
import java.time.Duration;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

@Component
public class AuthenticationTokenFilter extends OncePerRequestFilter {

    @Autowired
    private RedisTemplate redisTemplate;

    @Value("${config.token.expired}")
    private long tokenExpired;

    @Override
    protected void doFilterInternal(HttpServletRequest request,
            HttpServletResponse response, FilterChain filterChain) throws ServletException, IOException {
        String uri = request.getRequestURI();
        if (
//            uri.contains("/login")
//            || uri.contains("/captcha/captchaImage")
//            || uri.contains("/sms")
//            || uri.contains("/reward/queryRewardDetail")
//            || uri.contains("/reward/queryAllPublishedRewards")
//            || uri.contains("/statistics/browerCount")
//            || uri.contains("/reward/importSensitives")
//            || uri.contains("/upload/uploadFile")
                uri.contains("/")
        ) {
            filterChain.doFilter(request, response);
        } else {
            //??????token????????????????????????????????????token
            String token = request.getHeader("Token");
            response.setCharacterEncoding("UTF-8");
            ServletOutputStream outputStream = response.getOutputStream();
            if (!StringUtils.isNotEmpty(token)) {
//            Map<String, Object> result = new HashMap<>();
//            result.put("code", ResponseEnum.TOKEN_NOT_EMPTY.getCode());
//            result.put("codeMsg", ResponseEnum.TOKEN_NOT_EMPTY.getCodeMsg());
                String json = "{\"code\": "+ "\"" + ResponseEnum.TOKEN_NOT_EMPTY.getCode() + "\"" + "," +
                        " \"codeMsg\": "+ "\"" + ResponseEnum.TOKEN_NOT_EMPTY.getCodeMsg() + "\"" + "}";
                outputStream.write(json.getBytes(StandardCharsets.UTF_8));
                outputStream.flush();
                outputStream.close();
            } else {
                Object user = redisTemplate.opsForValue().get(token);
                if (ObjectUtil.isEmpty(user)) {
                    //token??????
                    String json = "{\"code\": "+ "\"" + ResponseEnum.TOKEN_EXPIRED.getCode() + "\"" + "," +
                            " \"codeMsg\": "+ "\"" + ResponseEnum.TOKEN_EXPIRED.getCodeMsg() + "\"" + "}";
                    outputStream.write(json.getBytes(StandardCharsets.UTF_8));
                    outputStream.flush();
                    outputStream.close();
                } else {
                    // token??????
                    refreshToken(token, (User)user);
                    // ????????????
                    UsernamePasswordAuthenticationToken authenticationToken
                            = new UsernamePasswordAuthenticationToken(((User)user).getUsername(), null, null);
                    authenticationToken.setDetails(new WebAuthenticationDetailsSource().buildDetails(request));
                    SecurityContextHolder.getContext().setAuthentication(authenticationToken);
                    filterChain.doFilter(request, response);
                }
            }
        }
    }

    /**
     * token??????
     * @param token
     * @param user
     */
    private void refreshToken(String token, User user) {
        //??????token???redis??????????????????
        redisTemplate.opsForValue().set(token, user, Duration.ofMinutes(tokenExpired));
    }
}
