package com.nbs.jiaxiao.domain.po;

import com.nbs.jiaxiao.domain.base.Base;

/**
 * 
 * 用户信息表
 *
 */
public class UserInfo extends Base{
	
	/* id */
	private java.lang.Integer id;
	/* 用户id */
	private java.lang.String pin;
	/* 用户姓名 */
	private java.lang.String custName;
	/* 手机号 */
	private java.lang.String mobile;
	/* 邮箱号 */
	private java.lang.String email;
	/* 盐值 */
	private java.lang.String salt;
	/* 密码哈希 */
	private java.lang.String pwd;
	/* 账户状态,0:有效，1:锁定 */
	private java.lang.Integer status;
	/* 备注 */
	private java.lang.String remark;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.String getPin() {
		return pin;
	}

	public void setPin(java.lang.String pin) {
		if (pin != null) {
			this.pin = pin.trim();
		}
	}
	
	public java.lang.String getCustName() {
		return custName;
	}

	public void setCustName(java.lang.String custName) {
		if (custName != null) {
			this.custName = custName.trim();
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
	
	public java.lang.String getEmail() {
		return email;
	}

	public void setEmail(java.lang.String email) {
		if (email != null) {
			this.email = email.trim();
		}
	}
	
	public java.lang.String getSalt() {
		return salt;
	}

	public void setSalt(java.lang.String salt) {
		if (salt != null) {
			this.salt = salt.trim();
		}
	}
	
	public java.lang.String getPwd() {
		return pwd;
	}

	public void setPwd(java.lang.String pwd) {
		if (pwd != null) {
			this.pwd = pwd.trim();
		}
	}
	
	public java.lang.Integer getStatus() {
		return status;
	}

	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}
	
	public java.lang.String getRemark() {
		return remark;
	}

	public void setRemark(java.lang.String remark) {
		if (remark != null) {
			this.remark = remark.trim();
		}
	}

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", pin=" + pin + ", custName=" + custName + ", mobile=" + mobile + ", email="
				+ email + ", salt=" + salt + ", pwd=" + pwd + ", status=" + status + ", remark=" + remark
				+ ", createdTime=" + createdTime + ", modifiedTime=" + modifiedTime + ", lastUpdateNo=" + lastUpdateNo
				+ ", lastUpdateNoUserId=" + lastUpdateNoUserId + "]";
	}
}
