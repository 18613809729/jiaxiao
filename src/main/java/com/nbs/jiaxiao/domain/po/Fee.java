package com.nbs.jiaxiao.domain.po;

import com.nbs.jiaxiao.domain.base.Base;

/**
 * 
 * 缴费表
 *
 */
public class Fee extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* 用户Id */
	private java.lang.Integer userId;
	/* 费用类型 */
	private java.lang.String type;
	/* 金额 */
	private java.math.BigDecimal money;
	/* 缴费日期 */
	private java.sql.Date payDate;
	/* 缴费方式 */
	private java.lang.String payType;
	/* 备注 */
	private java.lang.String remark;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.Integer getUserId() {
		return userId;
	}

	public void setUserId(java.lang.Integer userId) {
		this.userId = userId;
	}
	
	public java.lang.String getType() {
		return type;
	}

	public void setType(java.lang.String type) {
		if (type != null) {
			this.type = type.trim();
		}
	}
	
	public java.math.BigDecimal getMoney() {
		return money;
	}

	public void setMoney(java.math.BigDecimal money) {
		this.money = money;
	}
	
	public java.sql.Date getPayDate() {
		return payDate;
	}

	public void setPayDate(java.sql.Date payDate) {
		this.payDate = payDate;
	}
	
	public java.lang.String getPayType() {
		return payType;
	}

	public void setPayType(java.lang.String payType) {
		if (payType != null) {
			this.payType = payType.trim();
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
	
	/* customized code start */
	
	/* customized code end */
}
