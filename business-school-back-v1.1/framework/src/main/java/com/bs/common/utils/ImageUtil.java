package com.bs.common.utils;

import cn.hutool.captcha.CaptchaUtil;
import cn.hutool.captcha.LineCaptcha;
import com.bs.common.capatch.exception.CapatchImageFailException;
import com.bs.common.response.ResponseEnum;
import com.sun.imageio.plugins.jpeg.JPEGImageWriter;
import com.sun.imageio.plugins.jpeg.JPEGImageWriterSpi;

import javax.imageio.*;
import javax.imageio.metadata.IIOMetadata;
import javax.imageio.spi.ImageWriterSpi;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;

public class ImageUtil {

    public static String generateImageBase64(String code) throws IOException, CapatchImageFailException {
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        BufferedOutputStream bufferedOutputStream = new BufferedOutputStream(bos);
        LineCaptcha lineCaptcha = CaptchaUtil.createLineCaptcha(
                800, 800, 4, 2);
        return lineCaptcha.getImageBase64();
    }
}
