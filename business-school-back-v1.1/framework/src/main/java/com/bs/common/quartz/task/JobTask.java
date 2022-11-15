package com.bs.common.quartz.task;

import org.quartz.Job;
import org.quartz.JobDataMap;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;



/**
 *	类描述：罗克消息发送任务
 *	
 *	功能描述：负责发送待办、分发、已办消息到罗克服务端显示消息提醒，当消息发送失败时会将异常信息记录到数据库中，如果数据库记录失败
 *			   则会将异常信息记录到服务器磁盘日志文件中
 *
 *	异常处理机制：1.当任务在完成前系统突然中断，则会在恢复正常情况后再次重复执行此任务
 *				 2.当任务在完成前数据库中断，则会立即记录磁盘日志文件中
 *				 3.当任务执行过程中出现未知异常，则会记录到数据库中，如果数据库记录失败则会尝试记录到磁盘日志文件中
 */
//@Service
@Transactional
public abstract class JobTask implements Job {
	
//	@Resource(name = "IDBCommonRepo")
//	private IDBCommonRepo<?> repo;
	
	/**
	 * 	任务执行方法
	 * @param TaskData
	 * @return 执行成功返回1、执行失败返回 0
	 */
	public abstract int execute(TaskData TaskData);
	
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
//		IMessage message = null;
		try {
			JobDataMap jobDataMap = context.getJobDetail().getJobDataMap();
			String key = (String) jobDataMap.keySet().toArray()[0];
			int result = execute((TaskData) jobDataMap.get(key));
			if (result != 1) {
				throw new RuntimeException("task execute fail...");
			}
//			System.out.println("执行结果=========" + result);
//			message = (IMessage) jobDataMap.get(key);
//			MessageSend sender = new MessageSend();
//			if(message instanceof Task) {
//				sender.sendTask((Task) message);
//			} else if(message instanceof TaskStatus) {
//				sender.sendTaskStatus((TaskStatus) message);
//			}
		} catch(NullPointerException e) {
			// 记录到错误日志中
		} catch (Exception e) {
			e.printStackTrace();
			JobExecutionException jobExecutionException = new JobExecutionException(e);
//			TOAComMessageRkRecord toaComMessageRkRecord = null;
//			try {
				//记录异常信息入库
//				DBParams dbParams = new DBParams();
//				Stack<Throwable> stack = new Stack<Throwable>(); stack.push(e);
//				toaComMessageRkRecord = wrapMessageToRecord(message, stack);
//				dbParams.setInsertPo(toaComMessageRkRecord);
//				repo.insert(dbParams);
//			} catch (Exception ex) {
//				ex.printStackTrace();
				//记录文件
//				RkExceptionFileLog rkExceptionFileLog = new RkExceptionFileLog();
//				rkExceptionFileLog.getException().getExceptionStacks().Push(e).Push(ex);
//				rkExceptionFileLog.setBussinessId(toaComMessageRkRecord.getBussinessId());
//				rkExceptionFileLog.setTaskId(message.getMessageId());
//				rkExceptionFileLog.setLogName(message.getMessageId() + ".log");
//				rkExceptionFileLog.setTaskTitle(toaComMessageRkRecord.getBussinessTitle());
//				rkExceptionFileLog.setMessage(message);
//				new RkMessageExceptionLogger().recordLog(rkExceptionFileLog);
//				throw jobExecutionException;
//			}
			jobExecutionException.setRefireImmediately(true);
			throw jobExecutionException;
		}
	}

	
//	private TOAComMessageRkRecord wrapMessageToRecord(IMessage message, Stack<Throwable> stack) {
//		
//		if(message instanceof RkTodoMessage) {
//			
//			RkTodoMessage rkTodoMessage = (RkTodoMessage) message;
//			TOAComMessageRkRecord tOAComMessageRkRecord = new TOAComMessageRkRecord();
//			tOAComMessageRkRecord.setBussinessId(rkTodoMessage.getBussinessId());
//			tOAComMessageRkRecord.setBussinessTitle(rkTodoMessage.getTaskTitle());
//			tOAComMessageRkRecord.setFailedReason(new NormalExceptionFormatter(stack).toString());
//			tOAComMessageRkRecord.setFailedTime(DateUtil.getCurrentDate());
//			tOAComMessageRkRecord.setPushUid(rkTodoMessage.getSenderSign());
//			tOAComMessageRkRecord.setPushUname(rkTodoMessage.getSender());
//			tOAComMessageRkRecord.setRecUid(rkTodoMessage.getReceiveSign());
//			tOAComMessageRkRecord.setRecUname(rkTodoMessage.getReceive());
//			tOAComMessageRkRecord.setRkPushRecordId(PrimaryKeyUtil.create());
//			tOAComMessageRkRecord.setTaskId(rkTodoMessage.getTaskCode());
//			tOAComMessageRkRecord.setTaskType(rkTodoMessage.getTaskType());
//			tOAComMessageRkRecord.setMessageData(ObjectUtil.ObjectToByte(rkTodoMessage));
//			return tOAComMessageRkRecord;
//			
//		} else if(message instanceof RkHasDoMessage) {
//			
//			RkHasDoMessage rkHasDoMessage = (RkHasDoMessage) message;
//			TOAComMessageRkRecord tOAComMessageRkRecord = new TOAComMessageRkRecord();
//			tOAComMessageRkRecord.setBussinessId(rkHasDoMessage.getBussinessId());
//			tOAComMessageRkRecord.setBussinessTitle(rkHasDoMessage.getTaskTitle());
//			tOAComMessageRkRecord.setFailedReason(new NormalExceptionFormatter(stack).toString());
//			tOAComMessageRkRecord.setFailedTime(DateUtil.getCurrentDate());
//			tOAComMessageRkRecord.setMessageData(ObjectUtil.ObjectToByte(rkHasDoMessage));
//			tOAComMessageRkRecord.setRkPushRecordId(PrimaryKeyUtil.create());
//			tOAComMessageRkRecord.setTaskId(rkHasDoMessage.getTaskCode());
//			return tOAComMessageRkRecord;
//			
//		}
//		
//		return null;
//	}
}
