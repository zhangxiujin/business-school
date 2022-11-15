package com.bs.common.security;

import com.bs.common.filter.AuthenticationTokenFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.filter.CorsFilter;

@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    /**
     * 自定义用户认证的逻辑
     */
    @Autowired
    private UserDetailsService userDetailsService;
    @Autowired
    private AuthenticationTokenFilter authenticationTokenFilter;
    @Autowired
    private CorsFilter corsFilter;

    /**
     * 创建spring security的认证管理器
     */
    @Bean
    @Override
    public AuthenticationManager authenticationManagerBean() throws Exception {
        return super.authenticationManagerBean();
    }

    @Override
    protected void configure(HttpSecurity httpSecurity) throws Exception {
        httpSecurity.csrf().disable()
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS)
                .and()
                //过滤请求
                .authorizeRequests()
                //配置可以匿名访问的url
//                .antMatchers("/login",
//                        "/captcha/captchaImage",
//                        "/sms/**",
//                        "/reward/queryAllPublishedRewards",
//                        "/reward/queryRewardDetail",
//                        "/statistics/browerCount",
//                        "/reward/importSensitives",
//                        "/upload/uploadFile",
//                ).anonymous()
                .antMatchers("/**").anonymous()
                //静态资源 TODO
                //除了上面的url，其余的都有经过认证后才能访问
                .anyRequest().authenticated()
                .and()
                .headers().frameOptions().disable();


        //添加 token filter
        httpSecurity.addFilterBefore(authenticationTokenFilter, UsernamePasswordAuthenticationFilter.class);
        //添加跨域 filter
        httpSecurity.addFilterBefore(corsFilter, AuthenticationTokenFilter.class);
//        httpSecurity.addFilterBefore(corsFilter, AuthenticationTokenFilter.class);
    }

    /**
     * 加密器
     */
    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder(){
        return new BCryptPasswordEncoder();
    }

    /**
     * 密码校验
     */
    @Override
    protected void configure(AuthenticationManagerBuilder authenticationManagerBuilder) throws Exception {
        authenticationManagerBuilder.userDetailsService(userDetailsService).passwordEncoder(bCryptPasswordEncoder());
    }

}
