package com.nbs.jiaxiao.exception;

import com.nbs.jiaxiao.domain.vo.BaseRes;

public class ResException extends Exception {
	private static final long serialVersionUID = 1L;
	private BaseRes<Object> res;

	public ResException(String message, BaseRes<Object> res) {
		super(message);
		this.res = res;
	}

	public ResException(String message, Throwable cause, BaseRes<Object> res) {
		super(message, cause);
		this.res = res;
	}

	public BaseRes<Object> getRes() {
		return res;
	}

	public void setRes(BaseRes<Object> res) {
		this.res = res;
	}

}
