package com.bs.common.sms.service;

import cn.hutool.core.util.PhoneUtil;
import com.bs.common.exception.PhoneException;
import com.bs.common.response.ResponseEnum;
import com.bs.common.response.ResponseResult;
import com.bs.common.utils.RandomUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import java.time.Duration;

@Service
public class SMSServiceImpl {

    @Value("${config.sms.expired}")
    private Long smsCodeExpired;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 发送短信
     * @return
     */
    public String send(String phone) {
        if (!PhoneUtil.isMobile(phone)){
            throw new PhoneException(ResponseEnum.PHONE_FORMAT_ERROR.getCode(),
                    ResponseEnum.PHONE_FORMAT_ERROR.getCodeMsg());
        }
        String code = RandomUtil.generateRandomStr(6);
        redisTemplate.opsForValue().set(phone, code, Duration.ofMinutes(smsCodeExpired));
        return code;
    }
}
