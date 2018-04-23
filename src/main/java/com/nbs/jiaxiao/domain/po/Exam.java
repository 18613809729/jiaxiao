package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 考试表
 *
 */
public class Exam extends Base{
	
	/*  */
	private java.lang.Integer id;
	/*  */
	private java.lang.String stage;
	/*  */
	private java.sql.Date examDate;
	/*  */
	private java.lang.String status;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.String getStage() {
		return stage;
	}

	public void setStage(java.lang.String stage) {
		if (stage != null) {
			this.stage = stage.trim();
		}
	}
	
	public java.sql.Date getExamDate() {
		return examDate;
	}

	public void setExamDate(java.sql.Date examDate) {
		this.examDate = examDate;
	}
	
	public java.lang.String getStatus() {
		return status;
	}

	public void setStatus(java.lang.String status) {
		if (status != null) {
			this.status = status.trim();
		}
	}
	
	/* customized code start */
	
	/* customized code end */
}
