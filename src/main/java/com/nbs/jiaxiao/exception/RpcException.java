package com.nbs.jiaxiao.exception;

public class RpcException extends RuntimeException{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public RpcException(String message) {
        super(message);
    }
}
