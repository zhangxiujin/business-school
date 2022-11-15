package com.bs.common.destory;

import org.springframework.stereotype.Component;

import javax.annotation.PreDestroy;

@Component
public class DestroyWorker02 {

    @PreDestroy
    public void destroy() {
        System.out.println("执行销毁的逻辑");
    }
}
