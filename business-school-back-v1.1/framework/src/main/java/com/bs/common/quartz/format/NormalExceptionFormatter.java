package com.bs.common.quartz.format;

import java.util.Stack;


public class NormalExceptionFormatter  {

	public static final String PATTERN = "\r\n异常类名:{exceptionName} \r\n栈信息:{messageStacks} \r\n详细信息:{detailMessage}";
	
	private String formatedMessage = "NormalExceptionFormat:";
	
	/**
	 *	@stack	异常堆栈 
	 */
	public NormalExceptionFormatter(Stack<Throwable> stack) {
		format(stack);
	}
	
	public String toString() {
		return formatedMessage;
	}

	public String format(Stack<Throwable> stack) {
		while(!stack.empty()) {
			String pattern = PATTERN;
			String messageStacks = "";
			Throwable exception = stack.pop();
			StackTraceElement[] stackTrace = exception.getStackTrace();
			for(StackTraceElement element : stackTrace) {
				messageStacks += element.toString() + "\r\n";
			}
			String detailMessage = exception.getMessage();
			String exceptionName = exception.getClass().getName();
			formatedMessage += "\r\n===============================================\r\n";
			pattern = pattern.replace("{exceptionName}", exceptionName).
				replace("{messageStacks}", messageStacks).
				replace("{detailMessage}", detailMessage == null ? "为空" : detailMessage);
			formatedMessage += pattern;
		}
		return formatedMessage;
	}
}
