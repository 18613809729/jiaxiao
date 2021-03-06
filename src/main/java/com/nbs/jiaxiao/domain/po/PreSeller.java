package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 销售员报名表
 *
 */
public class PreSeller extends Base{
	
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
	/* 上级销售员代码 */
	private java.lang.Integer parentId;
	/* 状态 */
	private java.lang.String state;
	
	
	
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
	
	public java.lang.Integer getParentId() {
		return parentId;
	}

	public void setParentId(java.lang.Integer parentId) {
		this.parentId = parentId;
	}
	
	public java.lang.String getState() {
		return state;
	}

	public void setState(java.lang.String state) {
		if (state != null) {
			this.state = state.trim();
		}
	}
	
	/* customized code start */
	
	private User user;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}
	
	/* customized code end */
}
