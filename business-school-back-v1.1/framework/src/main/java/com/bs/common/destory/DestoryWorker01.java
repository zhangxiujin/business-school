package com.bs.common.destory;

import org.springframework.beans.factory.DisposableBean;
import org.springframework.stereotype.Component;

@Component
public class DestoryWorker01 implements DisposableBean {

    @Override
    public void destroy() throws Exception {
        //bean销毁后释放资源
    }
}
