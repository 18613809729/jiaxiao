package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 字典表
 *
 */
public class Dict extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* 字典类型 */
	private java.lang.String type;
	/* 代码 */
	private java.lang.String code;
	/* 名称 */
	private java.lang.String value;
	
	public Dict() {
	}

	
	public Dict(String type, String code, String value) {
		this.type = type;
		this.code = code;
		this.value = value;
	}

	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.String getType() {
		return type;
	}

	public void setType(java.lang.String type) {
		if (type != null) {
			this.type = type.trim();
		}
	}
	
	public java.lang.String getCode() {
		return code;
	}

	public void setCode(java.lang.String code) {
		if (code != null) {
			this.code = code.trim();
		}
	}
	
	public java.lang.String getValue() {
		return value;
	}

	public void setValue(java.lang.String value) {
		if (value != null) {
			this.value = value.trim();
		}
	}
	
	/* customized code start */
	
	/* customized code end */
}
