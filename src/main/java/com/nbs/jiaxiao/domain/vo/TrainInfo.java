package com.nbs.jiaxiao.domain.vo;

import com.nbs.jiaxiao.constant.Phase;
import com.nbs.jiaxiao.domain.po.Train;

public class TrainInfo extends Train{
	/* 学员姓名 */
	private java.lang.String username;
	/* 学员手机号 */
	private java.lang.String mobile;
	
	/*  */
	private java.lang.Integer schoolId;
	
	private java.lang.String schoolName;

	public java.lang.String getUsername() {
		return username;
	}

	public void setUsername(java.lang.String username) {
		this.username = username;
	}

	public java.lang.String getMobile() {
		return mobile;
	}

	public void setMobile(java.lang.String mobile) {
		this.mobile = mobile;
	}

	public java.lang.Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(java.lang.Integer schoolId) {
		this.schoolId = schoolId;
	}

	public java.lang.String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(java.lang.String schoolName) {
		this.schoolName = schoolName;
	}
	
	public java.lang.String getPhaseName() {
		Phase phase = Phase.valueOfByCode(getPhase());
		return phase == null ? "" : phase.getDesc();
	}
}
