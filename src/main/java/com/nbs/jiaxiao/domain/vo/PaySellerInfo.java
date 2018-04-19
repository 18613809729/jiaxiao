package com.nbs.jiaxiao.domain.vo;

import java.time.LocalDateTime;

public class PaySellerInfo extends SellerInfo{
	private Integer payId;
	private LocalDateTime payTime;
	private Integer amount;
	public Integer getPayId() {
		return payId;
	}
	public void setPayId(Integer payId) {
		this.payId = payId;
	}
	public LocalDateTime getPayTime() {
		return payTime;
	}
	public void setPayTime(LocalDateTime payTime) {
		this.payTime = payTime;
	}
	public Integer getAmount() {
		return amount;
	}
	public void setAmount(Integer amount) {
		this.amount = amount;
	}
	
}
