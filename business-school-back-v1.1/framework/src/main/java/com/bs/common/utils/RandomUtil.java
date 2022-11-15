package com.bs.common.utils;

public class RandomUtil {

    public static String generateRandomStr(int length) {
        return cn.hutool.core.util.RandomUtil.randomNumbers(length);
    }

}
