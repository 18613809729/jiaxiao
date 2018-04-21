package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 驾校
 *
 */
public class School extends Base{
	
	/*  */
	private java.lang.Integer id;
	/*  */
	private java.lang.String name;
	/*  */
	private java.lang.String address;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.String getName() {
		return name;
	}

	public void setName(java.lang.String name) {
		if (name != null) {
			this.name = name.trim();
		}
	}
	
	public java.lang.String getAddress() {
		return address;
	}

	public void setAddress(java.lang.String address) {
		if (address != null) {
			this.address = address.trim();
		}
	}
	
	/* customized code start */
	
	/* customized code end */
}
