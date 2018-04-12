package com.nbs.jiaxiao.domain.vo;

import com.nbs.jiaxiao.domain.po.CommisionFee;

public class CommisionFeeInfo extends CommisionFee{
	private String studentName;
	private String topSellerUsername;
	public String getStudentName() {
		return studentName;
	}
	public void setStudentName(String studentName) {
		this.studentName = studentName;
	}
	public String getTopSellerUsername() {
		return topSellerUsername;
	}
	public void setTopSellerUsername(String topSellerUsername) {
		this.topSellerUsername = topSellerUsername;
	}
	
}
