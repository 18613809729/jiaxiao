package com.nbs.jiaxiao.domain.vo;

public class BaseRes<T> {
	private boolean isSuccess;
	private String code;
	private String msg;
	private T t;
	
	@SuppressWarnings({ "unchecked", "rawtypes" })
	public static BaseRes ERROR = new BaseRes(false, "-1", "一套异常，请稍后再试", null);
	
	public BaseRes(boolean isSuccess, String code, String msg, T t) {
		this.isSuccess = isSuccess;
		this.code = code;
		this.msg = msg;
		this.t = t;
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
	public T getT() {
		return t;
	}
	public void setT(T t) {
		this.t = t;
	}
	
}
