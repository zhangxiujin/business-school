package com.bs.common.init;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.config.BeanPostProcessor;
import org.springframework.stereotype.Component;

@Component
public class BeanPostProcesserInitData implements BeanPostProcessor {

    /**
     * bean初始化之前执行
     * @param bean
     * @param beanName
     * @return
     * @throws BeansException
     */
    @Override
    public Object postProcessBeforeInitialization(
            Object bean, String beanName) throws BeansException {
        if (bean instanceof PostConstructLoadData) {
            System.out.println("LoadData实例初始化之前");
        }
        return bean;
    }

    /**
     * bean初始化之后执行
     * @param bean
     * @param beanName
     * @return
     * @throws BeansException
     */
    @Override
    public Object postProcessAfterInitialization(
            Object bean, String beanName) throws BeansException {
        if (bean instanceof PostConstructLoadData) {
            System.out.println("LoadData实例初始化之后");
        }
        return bean;
    }
}
