package com.bs.common.annotation;

import java.lang.annotation.*;

@Target({
        ElementType.TYPE  //这个注解只能用在类上
})
@Retention(RetentionPolicy.RUNTIME)
@Inherited
public @interface MyAnnotation {

}
