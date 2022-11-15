package com.bs.common.destory;

import org.springframework.context.annotation.Bean;

public class DestroyWorker03 {

    @Bean(destroyMethod = "destroyResource")
    public Worker getWorker() {
        return new Worker();
    }

    class Worker {
        public void destroyResource() {
            System.out.println("bean销毁前的资源回收");
        }
    }
}
