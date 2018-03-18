package com.nbs.jiaoxiao.exception;

/**
 * 将受检查异常转为运行时异常
 * @author lifeng
 *
 */
public class CheckToRuntimeException extends RuntimeException{
	 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CheckToRuntimeException(Throwable cause) {
	        super(cause);
	    }
}
