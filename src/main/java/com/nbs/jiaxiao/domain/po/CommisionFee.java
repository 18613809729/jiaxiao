package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 佣金明细
 *
 */
public class CommisionFee extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* 学员ID */
	private java.lang.Integer studentId;
	/* 销售员Id */
	private java.lang.Integer sellerId;
	/* 费用金额 */
	private java.math.BigDecimal money;
	/* 状态 */
	private java.lang.String status;
	/*  */
	private java.lang.String remark;
	/* 支付流水 */
	private java.lang.Integer payId;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(java.lang.Integer studentId) {
		this.studentId = studentId;
	}
	
	public java.lang.Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(java.lang.Integer sellerId) {
		this.sellerId = sellerId;
	}
	
	public java.math.BigDecimal getMoney() {
		return money;
	}

	public void setMoney(java.math.BigDecimal money) {
		this.money = money;
	}
	
	public java.lang.String getStatus() {
		return status;
	}

	public void setStatus(java.lang.String status) {
		if (status != null) {
			this.status = status.trim();
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
	
	public java.lang.Integer getPayId() {
		return payId;
	}

	public void setPayId(java.lang.Integer payId) {
		this.payId = payId;
	}
	
	/* customized code start */
	
	/* customized code end */
}
