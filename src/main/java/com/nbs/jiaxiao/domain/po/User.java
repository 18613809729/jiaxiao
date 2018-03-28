package com.nbs.jiaxiao.domain.po;

import com.nbs.jiaxiao.domain.base.Base;

/**
 * 
 * 用户信息表
 *
 */
public class User extends Base{
	
	/*  */
	private java.lang.Integer id;
	/* 微信openId */
	private java.lang.String openId;
	/* 姓名 */
	private java.lang.String userName;
	/* 昵称 */
	private java.lang.String nickName;
	/* 证件号 */
	private java.lang.String certNo;
	/* 手机号 */
	private java.lang.String mobile;
	/* 性别 0：未知，1：男，2：女 */
	private java.lang.Integer sex;
	/* 国家 */
	private java.lang.String country;
	/* 省 */
	private java.lang.String province;
	/* 市 */
	private java.lang.String city;
	/* 地址 */
	private java.lang.String address;
	/* 图像 */
	private java.lang.String headImg;
	/* 密码 */
	private java.lang.String password;
	/*  */
	private java.lang.Boolean subscribe;
	
	
	
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
	
	public java.lang.String getUserName() {
		return userName;
	}

	public void setUserName(java.lang.String userName) {
		if (userName != null) {
			this.userName = userName.trim();
		}
	}
	
	public java.lang.String getNickName() {
		return nickName;
	}

	public void setNickName(java.lang.String nickName) {
		if (nickName != null) {
			this.nickName = nickName.trim();
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
	
	public java.lang.String getMobile() {
		return mobile;
	}

	public void setMobile(java.lang.String mobile) {
		if (mobile != null) {
			this.mobile = mobile.trim();
		}
	}
	
	public java.lang.Integer getSex() {
		return sex;
	}

	public void setSex(java.lang.Integer sex) {
		this.sex = sex;
	}
	
	public java.lang.String getCountry() {
		return country;
	}

	public void setCountry(java.lang.String country) {
		if (country != null) {
			this.country = country.trim();
		}
	}
	
	public java.lang.String getProvince() {
		return province;
	}

	public void setProvince(java.lang.String province) {
		if (province != null) {
			this.province = province.trim();
		}
	}
	
	public java.lang.String getCity() {
		return city;
	}

	public void setCity(java.lang.String city) {
		if (city != null) {
			this.city = city.trim();
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
	
	public java.lang.String getHeadImg() {
		return headImg;
	}

	public void setHeadImg(java.lang.String headImg) {
		if (headImg != null) {
			this.headImg = headImg.trim();
		}
	}
	
	public java.lang.String getPassword() {
		return password;
	}

	public void setPassword(java.lang.String password) {
		if (password != null) {
			this.password = password.trim();
		}
	}
	
	public java.lang.Boolean getSubscribe() {
		return subscribe;
	}

	public void setSubscribe(java.lang.Boolean subscribe) {
		this.subscribe = subscribe;
	}
}
