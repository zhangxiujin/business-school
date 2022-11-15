package com.bs.common.quartz.scheduler;

import java.util.Date;

import cn.hutool.core.util.ObjectUtil;
import com.bs.common.quartz.task.JobTask;
import com.bs.common.quartz.task.TaskData;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.quartz.JobBuilder;
import org.quartz.JobDataMap;
import org.quartz.JobDetail;
import org.quartz.JobKey;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.scheduling.quartz.SimpleTriggerFactoryBean;
import org.springframework.stereotype.Component;



@Component
@ConditionalOnClass(org.quartz.Scheduler.class)
public class QuartzTaskScheduler {
	
	private static Logger logger = LogManager.getLogger(QuartzTaskScheduler.class);
	
	@Autowired
	private Scheduler scheduler;
	
	public int scheduler(Class<? extends JobTask> jobTaskClazz, TaskData taskData) {
		return scheduler(jobTaskClazz, taskData, new Date(System.currentTimeMillis()));
	}
	
	public int scheduler(Class<? extends JobTask> jobTaskClazz, TaskData taskData, Date startTime) {
		//验证消息是否为空
		verifyMessageIsNull(taskData);
		//设置jobkey
		JobKey jobKey = JobKey.jobKey(String.valueOf(taskData.getDataId()));
		//检查是否重复添加
		checkRepeatJob(jobKey);
		//新建job
		JobBuilder jobBuilder = JobBuilder.newJob(jobTaskClazz);
		//配置执行某个job的execute方法没有执行下去时，是否重新执行这个job
		jobBuilder.requestRecovery(true);
		//设置job数据
		JobDataMap jobDataMap = new JobDataMap();
		jobDataMap.put("scheduler-" + taskData.getDataId(), taskData);
		//构建jobDetail
		JobDetail jobDetail = jobBuilder.setJobData(jobDataMap).withIdentity(jobKey).build();
		//创建cron触发器
//		CronTriggerFactoryBean triggerFactoryBean = new CronTriggerFactoryBean();
//		triggerFactoryBean.setName("rkMessageCronTrigger---" + message.getMessageId());
//		triggerFactoryBean.setJobDetail(jobDetail);
//		triggerFactoryBean.setCronExpression("0 */1 * * * ?");  //每隔一分钟
		//创建简单触发器
		SimpleTriggerFactoryBean triggerFactoryBean = new SimpleTriggerFactoryBean();
		triggerFactoryBean.setName("simpleTrigger---" + taskData.getDataId());
		triggerFactoryBean.setJobDetail(jobDetail);
		triggerFactoryBean.setStartTime(startTime);
		triggerFactoryBean.setRepeatCount(0);
		triggerFactoryBean.afterPropertiesSet();
		try {
			scheduler.scheduleJob(jobDetail, triggerFactoryBean.getObject());
			return 1;
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 检查job任务是否重复添加
	 */
	private void checkRepeatJob(JobKey jobKey) {
		try {  
            if (scheduler.checkExists(jobKey)) {
            	logger.info("job任务重复添加! jobKey = " + jobKey.getName());  
                throw new RuntimeException("job任务重复添加!");
            }
        } catch (SchedulerException e) {
        	logger.error("get exception:" + e.getMessage(), e);  
            throw new RuntimeException(e);
        }  
	}

	/**
	 *	验证消息是否为空 
	 */
	private void verifyMessageIsNull(Object TaskData) {
		if (ObjectUtil.isEmpty(TaskData)) {
			throw new RuntimeException("任务数据不能为空!");
		}
	}

}