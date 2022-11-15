//package com.bs.common.capatch.service;
//
//import cn.hutool.core.codec.Base64;
//import com.bs.common.capatch.exception.CapatchImageFailException;
//import com.bs.common.utils.IdUtil;
//import com.bs.common.utils.ImageUtil;
//import com.bs.common.utils.RandomUtil;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.beans.factory.annotation.Value;
//import org.springframework.data.redis.core.RedisTemplate;
//import org.springframework.stereotype.Service;
//
//import java.io.IOException;
//import java.time.Duration;
//import java.util.HashMap;
//import java.util.Map;
//
//@Service
//public class CapatchImageServiceImpl {
//
//    @Value("${config.capatch.expired}")
//    private Long capatchImageExpired;
//
//    @Autowired
//    private RedisTemplate redisTemplate;
//
//    public Map<String, Object> generateImageBase64() throws IOException, CapatchImageFailException {
//        String code = RandomUtil.generateRandomStr(6);
//        System.out.println("图形验证码：" + code);
//        String base64Str = ImageUtil.generateImageBase64(code);
//        long uuid = IdUtil.nextId();
//        redisTemplate.opsForValue().set(uuid, code, Duration.ofMinutes(capatchImageExpired));
//        Map map = new HashMap();
//        map.put("imageBase64str", base64Str);
//        map.put("imageUUID", uuid);
//        return map;
//    }
//}
