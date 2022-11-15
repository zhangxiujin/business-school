package com.bs.common.destory;

import org.springframework.beans.factory.support.MergedBeanDefinitionPostProcessor;
import org.springframework.beans.factory.support.RootBeanDefinition;
import org.springframework.stereotype.Component;

@Component
public class DestroyWorker05 implements MergedBeanDefinitionPostProcessor {
	
	@Override
	public void postProcessMergedBeanDefinition(
			RootBeanDefinition beanDefinition, Class<?> beanType, String beanName) {
		if(beanName.equals("xianJian")){
			beanDefinition.setDestroyMethodName("(inferred)");
		}
	}

	@Override
	public void resetBeanDefinition(String beanName) {
		MergedBeanDefinitionPostProcessor.super.resetBeanDefinition(beanName);
	}
}
