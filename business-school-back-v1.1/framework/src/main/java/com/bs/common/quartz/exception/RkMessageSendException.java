package com.bs.common.quartz.exception;

import java.util.Stack;

public class RkMessageSendException extends Throwable {

	private static final long serialVersionUID = 1L;
	
	private SendExceptionStack<Throwable> exceptionStacks = new SendExceptionStack<Throwable>();
	
	public SendExceptionStack<Throwable> getExceptionStacks() {
		return exceptionStacks;
	}
	
	public RkMessageSendException(String msg, Throwable e) {
		super(msg, e);
	}
	
	public RkMessageSendException(String msg) {
		super(msg);
	}
	
	public RkMessageSendException(Throwable e) {
		super(e);
	}
	
	public RkMessageSendException() {}

	
	public class SendExceptionStack<E> extends Stack<E> {
		private static final long serialVersionUID = 1L;
		
		public SendExceptionStack<E> Push(E item) {
			super.push(item);
			return this;
		}
	}
	
}
