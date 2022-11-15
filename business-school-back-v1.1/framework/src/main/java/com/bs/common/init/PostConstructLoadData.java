package com.bs.common.init;

import com.bs.reward.service.IRewardService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.annotation.PreDestroy;

@Component
public class PostConstructLoadData {

    @Autowired
    private IRewardService rewardService;

    public PostConstructLoadData() {
        System.out.println("调用LoadData构造方法");
    }

    @PostConstruct
    public void init() throws InterruptedException {
        Thread.sleep(2000);
    }

    /**
     * spring容器销毁时执行
     */
    @PreDestroy
    public void destroy(){
        System.out.println("系统运行结束");
    }

}
