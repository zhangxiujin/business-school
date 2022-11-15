package com.bs.common.destory;

import org.springframework.stereotype.Component;

@Component
public class DestroyWorker04 implements AutoCloseable{

    @Override
    public void close() throws Exception {
        System.out.println("调用close方法，执行bean销毁前的资源回收");
    }
}
