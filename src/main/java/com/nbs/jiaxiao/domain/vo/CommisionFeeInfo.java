package com.nbs.jiaxiao.domain.vo;

import com.nbs.jiaxiao.domain.po.CommisionFee;

public class CommisionFeeInfo extends CommisionFee{
	private String studentName;
	private String topSellerUsername;
	private String studentMobile;
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
	public String getStudentMobile() {
		return studentMobile;
	}
	public void setStudentMobile(String studentMobile) {
		this.studentMobile = studentMobile;
	}
}
