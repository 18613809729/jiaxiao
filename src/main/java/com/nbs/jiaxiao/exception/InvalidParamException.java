package com.nbs.jiaxiao.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

@ResponseStatus(code=HttpStatus.BAD_REQUEST)
public class InvalidParamException extends RuntimeException{


	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public InvalidParamException(String message) {
        super(message);
    }
}
