package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 预报名学员表
 *
 */
public class SignStudent extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* 用户姓名 */
	private java.lang.String username;
	/* 微信号openId */
	private java.lang.String openId;
	/* 手机号 */
	private java.lang.String mobile;
	/* 备注 */
	private java.lang.String remark;
	/* 状态, 0:未查看， 1：已查看 */
	private java.lang.String state;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.String getUsername() {
		return username;
	}

	public void setUsername(java.lang.String username) {
		if (username != null) {
			this.username = username.trim();
		}
	}
	
	public java.lang.String getOpenId() {
		return openId;
	}

	public void setOpenId(java.lang.String openId) {
		if (openId != null) {
			this.openId = openId.trim();
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
	
	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		if (remark != null) {
			this.remark = remark.trim();
		}
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
