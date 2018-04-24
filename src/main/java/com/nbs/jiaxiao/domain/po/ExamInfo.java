package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 考试学生信息
 *
 */
public class ExamInfo extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* 考试批次 */
	private java.lang.Integer examId;
	/* 学生Id */
	private java.lang.Integer studentId;
	/* 考试状态 */
	private java.lang.String status;
	/* 标识 */
	private java.lang.String flag;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.Integer getExamId() {
		return examId;
	}

	public void setExamId(java.lang.Integer examId) {
		this.examId = examId;
	}
	
	public java.lang.Integer getStudentId() {
		return studentId;
	}

	public void setStudentId(java.lang.Integer studentId) {
		this.studentId = studentId;
	}
	
	public java.lang.String getStatus() {
		return status;
	}

	public void setStatus(java.lang.String status) {
		if (status != null) {
			this.status = status.trim();
		}
	}
	
	public java.lang.String getFlag() {
		return flag;
	}

	public void setFlag(java.lang.String flag) {
		if (flag != null) {
			this.flag = flag.trim();
		}
	}
	
	/* customized code start */
	
	public static final String PASS = "1";
	
	public static final String NO_PASS = "0";
	
	/* customized code end */
}
