package com.nbs.jiaxiao.domain.vo;

import com.nbs.jiaxiao.constant.ResCode;

public class BaseRes<T> {
	private boolean isSuccess;
	private String code;
	private String msg;
	private T data;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static BaseRes ERROR = new BaseRes(false, "-1", "系统异常，请稍后再试", null);
	
	public BaseRes(boolean isSuccess, String code, String msg, T data) {
		this.isSuccess = isSuccess;
		this.code = code;
		this.msg = msg;
		this.data = data;
	}
	
	@SuppressWarnings("unchecked")
	public static <A> BaseRes<A> Error() {
		return ERROR;
	}
	
	public static <A> BaseRes<A> buildSuccess(A a) {
		return new BaseRes<A>(true, "0", "成功", a);
	}
	
	public static <A> BaseRes<A> build(String code, String msg) {
		return new BaseRes<A>(true, code, msg, null);
	}
	
	public static <A> BaseRes<A> build(String code, String msg, A a) {
		return new BaseRes<A>(true, code, msg, a);
	}
	
	public static <A> BaseRes<A> build(ResCode resCode) {
		return new BaseRes<A>(true, resCode.getCode(), resCode.getDesc(), null);
	}
	
	public static <A> BaseRes<A> build(ResCode resCode, A a) {
		return new BaseRes<A>(true, resCode.getCode(), resCode.getDesc(), a);
	}
	
	
	public boolean isSuccess() {
		return isSuccess;
	}
	
	public void setSuccess(boolean isSuccess) {
		this.isSuccess = isSuccess;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	public T getData() {
		return data;
	}

	public void setData(T data) {
		this.data = data;
	}
}
