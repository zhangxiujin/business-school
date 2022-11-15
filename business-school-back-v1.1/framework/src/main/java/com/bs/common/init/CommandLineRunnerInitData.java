package com.bs.common.init;

import org.springframework.boot.CommandLineRunner;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Component;

@Order(1)
@Component
public class CommandLineRunnerInitData implements CommandLineRunner {
    @Override
    public void run(String... args) throws Exception {
        // 初始化相关热点数据
        System.out.println("加载数据到内存前");
        Thread.sleep(1000);
        System.out.println("加载数据到内存后");
    }
}
