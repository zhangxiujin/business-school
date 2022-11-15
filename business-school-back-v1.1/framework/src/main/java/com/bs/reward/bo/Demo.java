package com.bs.reward.bo;

import java.lang.annotation.Annotation;

public class Demo extends RewardBO {
    public static void main(String[] args) {
        Class<? super Demo> superclass = Demo.class.getSuperclass();
        Annotation[] declaredAnnotations = superclass.getDeclaredAnnotations();
        for (Annotation declaredAnnotation : declaredAnnotations) {
            System.out.println(declaredAnnotation.annotationType());
        }
    }
}
