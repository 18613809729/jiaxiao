package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 学员信息表
 *
 */
public class Student extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* 微信openId */
	private java.lang.String openId;
	/* 学员姓名 */
	private java.lang.String username;
	/* 学员手机号 */
	private java.lang.String mobile;
	/* 学员证件号 */
	private java.lang.String certNo;
	/* 驾驶类型 0：手动档，1：自动档 */
	private java.lang.Integer driveType;
	/* 学费 */
	private java.math.BigDecimal totalFee;
	/*  */
	private java.sql.Date signDate;
	/* 考试日期计算开始 */
	private java.sql.Date examDate;
	/* 分销员 */
	private java.lang.Integer sellerId;
	/*  */
	private java.lang.Integer schoolId;
	/* 学车阶段 */
	private java.lang.String stage;
	/* 是否欠费 */
	private java.lang.Boolean isArrearage;
	/* 二级阶段 */
	private java.lang.String phase;
	/* 备注 */
	private java.lang.String remark;
	
	
	
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
	
	public java.lang.String getCertNo() {
		return certNo;
	}

	public void setCertNo(java.lang.String certNo) {
		if (certNo != null) {
			this.certNo = certNo.trim();
		}
	}
	
	public java.lang.Integer getDriveType() {
		return driveType;
	}

	public void setDriveType(java.lang.Integer driveType) {
		this.driveType = driveType;
	}
	
	public java.math.BigDecimal getTotalFee() {
		return totalFee;
	}

	public void setTotalFee(java.math.BigDecimal totalFee) {
		this.totalFee = totalFee;
	}
	
	public java.sql.Date getSignDate() {
		return signDate;
	}

	public void setSignDate(java.sql.Date signDate) {
		this.signDate = signDate;
	}
	
	public java.sql.Date getExamDate() {
		return examDate;
	}

	public void setExamDate(java.sql.Date examDate) {
		this.examDate = examDate;
	}
	
	public java.lang.Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(java.lang.Integer sellerId) {
		this.sellerId = sellerId;
	}
	
	public java.lang.Integer getSchoolId() {
		return schoolId;
	}

	public void setSchoolId(java.lang.Integer schoolId) {
		this.schoolId = schoolId;
	}
	
	public java.lang.String getStage() {
		return stage;
	}

	public void setStage(java.lang.String stage) {
		if (stage != null) {
			this.stage = stage.trim();
		}
	}
	
	public java.lang.Boolean getIsArrearage() {
		return isArrearage;
	}

	public void setIsArrearage(java.lang.Boolean isArrearage) {
		this.isArrearage = isArrearage;
	}
	
	public java.lang.String getPhase() {
		return phase;
	}

	public void setPhase(java.lang.String phase) {
		if (phase != null) {
			this.phase = phase.trim();
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
	
	private User user;

	private java.lang.String schoolName;


	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public java.lang.String getSchoolName() {
		return schoolName;
	}

	public void setSchoolName(java.lang.String schoolName) {
		this.schoolName = schoolName;
	}
	
	/* customized code end */
}
