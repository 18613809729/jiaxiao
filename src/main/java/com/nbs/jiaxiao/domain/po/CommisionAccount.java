package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 佣金流水表
 *
 */
public class CommisionAccount extends Base{
	
	/* 自增主键 */
	private java.lang.Integer id;
	/* 销售人员Id */
	private java.lang.Integer sellerId;
	/* 总金额 */
	private java.math.BigDecimal totalMoney;
	/* 佣金笔数 */
	private java.lang.Integer amount;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(java.lang.Integer sellerId) {
		this.sellerId = sellerId;
	}
	
	public java.math.BigDecimal getTotalMoney() {
		return totalMoney;
	}

	public void setTotalMoney(java.math.BigDecimal totalMoney) {
		this.totalMoney = totalMoney;
	}
	
	public java.lang.Integer getAmount() {
		return amount;
	}

	public void setAmount(java.lang.Integer amount) {
		this.amount = amount;
	}
	
	/* customized code start */
	
	/* customized code end */
}
