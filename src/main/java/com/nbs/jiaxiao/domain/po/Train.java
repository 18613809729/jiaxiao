package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 
 *
 */
public class Train extends Base{
	
	/*  */
	private java.lang.Integer id;
	/*  */
	private java.lang.Integer studentId;
	/*  */
	private java.lang.String stage;
	/*  */
	private java.lang.String phase;
	
	
	
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
	
	public java.lang.String getStage() {
		return stage;
	}

	public void setStage(java.lang.String stage) {
		if (stage != null) {
			this.stage = stage.trim();
		}
	}
	
	public java.lang.String getPhase() {
		return phase;
	}

	public void setPhase(java.lang.String phase) {
		if (phase != null) {
			this.phase = phase.trim();
		}
	}
	
	/* customized code start */
	
	/* customized code end */
}
