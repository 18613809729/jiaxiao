package com.nbs.jiaxiao.exception;

public class ConcurrentException extends RuntimeException{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public ConcurrentException(String message) {
        super(message);
    }
}
