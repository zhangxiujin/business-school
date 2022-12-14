package com.bs.common.capatch.controller;

import cn.hutool.core.codec.Base64;
import com.bs.common.capatch.vo.CaptchaImageVo;
import com.bs.common.response.ResponseResult;
import com.bs.common.utils.IdUtil;
import com.google.code.kaptcha.Producer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.util.FastByteArrayOutputStream;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.annotation.Resource;
import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.TimeUnit;

@RestController
@RequestMapping("/captcha")
public class CaptchaController {

    @Resource(name = "captchaProducer")
    private Producer captchaProducer;

    @Autowired
    private RedisTemplate redisTemplate;

    /**
     * 生成验证码图片
     */
    @GetMapping("/captchaImage")
    public ResponseResult captchaImage(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // 通过java有ImageUtils这个工具
        // 123456 数字验证码
        String code = captchaProducer.createText();
        // 往redis存入登录验证码
        Long uuid = IdUtil.nextId();
        redisTemplate.opsForValue().set(uuid, code, 5L, TimeUnit.MINUTES);
        BufferedImage image = captchaProducer.createImage(code);
        FastByteArrayOutputStream os = new FastByteArrayOutputStream();
        ImageIO.write(image, "jpg", os);
        byte[] bytes = os.toByteArray();
        String base64Str = Base64.encode(bytes);
        Map map = new HashMap();
        map.put("imageBase64str", base64Str);
        map.put("imageUUID", uuid);
        return new ResponseResult(map);
    }
}
