package com.nbs.jiaxiao.wx.vo;

public class BaseRes {
	public static final int EXP = -1;
	public static final int SUCCESS = 0;
	
	private int errcode;
	private String errmsg;
	public int getErrcode() {
		return errcode;
	}
	public void setErrcode(int errcode) {
		this.errcode = errcode;
	}
	public String getErrmsg() {
		return errmsg;
	}
	public void setErrmsg(String errmsg) {
		this.errmsg = errmsg;
	}
	
	
}
