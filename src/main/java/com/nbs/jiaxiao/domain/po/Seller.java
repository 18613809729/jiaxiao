package com.nbs.jiaxiao.domain.po;

import com.nbs.jiaxiao.domain.base.Base;

/**
 * 
 * 分销员表
 *
 */
public class Seller extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* 微信ID */
	private java.lang.String openId;
	/* 姓名 */
	private java.lang.String username;
	/* 手机号 */
	private java.lang.String mobile;
	/* 等级 */
	private java.lang.Integer level;
	/* 上级分销员代码 */
	private java.lang.Integer parenId;
	/* 状态 */
	private java.lang.String status;
	/* 类型 */
	private java.lang.String type;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.String getOpenId() {
		return openId;
	}

	public void setOpenId(java.lang.String openId) {
		if (openId != null) {
			this.openId = openId.trim();
		}
	}
	
	public java.lang.String getUsername() {
		return username;
	}

	public void setUsername(java.lang.String username) {
		if (username != null) {
			this.username = username.trim();
		}
	}
	
	public java.lang.String getMobile() {
		return mobile;
	}

	public void setMobile(java.lang.String mobile) {
		if (mobile != null) {
			this.mobile = mobile.trim();
		}
	}
	
	public java.lang.Integer getLevel() {
		return level;
	}

	public void setLevel(java.lang.Integer level) {
		this.level = level;
	}
	
	public java.lang.Integer getParenId() {
		return parenId;
	}

	public void setParenId(java.lang.Integer parenId) {
		this.parenId = parenId;
	}
	
	public java.lang.String getStatus() {
		return status;
	}

	public void setStatus(java.lang.String status) {
		if (status != null) {
			this.status = status.trim();
		}
	}
	
	public java.lang.String getType() {
		return type;
	}

	public void setType(java.lang.String type) {
		if (type != null) {
			this.type = type.trim();
		}
	}
	
	/* customized code start */
	
	@Override
	public String toString() {
		// TODO Auto-generated method stub
		return super.toString();
	}
	
	/* customized code end */
}
