package com.bs.common.utils;

import com.bs.reward.dto.RewardDTO;
import com.bs.reward.po.Reward;

import java.lang.reflect.Field;

public class BeanUtil {

    public static <T2,T1> T2 convert(T1 source, Class<T2> target) throws IllegalAccessException, InstantiationException, NoSuchFieldException {
//        Field[] declaredFields = source.getClass().getDeclaredFields();
//        String sourceClassName = source.getClass().getSimpleName();
//        T2 t2 = target.newInstance();
//        Field declaredField1 = t2.getClass().getDeclaredField(sourceClassName);
//        Field[] subClassFields = declaredField1.getClass().getDeclaredFields();
//        for (int i = 0; i < declaredFields.length; i++) {
//            Field declaredField = declaredFields[i];
//            declaredField.setAccessible(true);
//            Object o = declaredField.get(source);
//            Field field = subClassFields[i];
//            field.setAccessible(true);
////            System.out.println(declaredField.getName());
//            field.set(declaredField1, o);
//        }
//        return t2;

        Field[] declaredFields = source.getClass().getDeclaredFields();
        T2 t2 = target.newInstance();
        for (int i = 0; i < declaredFields.length; i++) {
            declaredFields[i].setAccessible(true);
            Field targetField = t2.getClass().getDeclaredField(declaredFields[i].getName());
            targetField.setAccessible(true);
            targetField.set(t2, declaredFields[i].get(source));
        }
        return t2;
    }

}
