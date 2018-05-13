package com.nbs.jiaxiao.domain.po;


import com.nbs.jiaxiao.domain.base.Base;


/**
 * 
 * 页面内容
 *
 */
public class Content extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* key */
	private java.lang.String keyId;
	/* 内容 */
	private java.lang.String info;
	
	
	
	public java.lang.Integer getId() {
		return id;
	}

	public void setId(java.lang.Integer id) {
		this.id = id;
	}
	
	public java.lang.String getKeyId() {
		return keyId;
	}

	public void setKeyId(java.lang.String keyId) {
		if (keyId != null) {
			this.keyId = keyId.trim();
		}
	}
	
	public java.lang.String getInfo() {
		return info;
	}

	public void setInfo(java.lang.String info) {
		if (info != null) {
			this.info = info.trim();
		}
	}

	
	
	/* customized code start */
	public Content() {
	}
	
	public Content(String keyId, String info) {
		this.keyId = keyId;
		this.info = info;
	}
	
	
	/* customized code end */
}
