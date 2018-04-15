package com.nbs.jiaxiao.domain.vo;

import com.nbs.jiaxiao.domain.po.Seller;

public class SellerInfo extends Seller{
	/* 昵称 */
	private java.lang.String nickName;
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
	public java.lang.String getNickName() {
		return nickName;
	}
	public void setNickName(java.lang.String nickName) {
		this.nickName = nickName;
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
		this.country = country;
	}
	public java.lang.String getProvince() {
		return province;
	}
	public void setProvince(java.lang.String province) {
		this.province = province;
	}
	public java.lang.String getCity() {
		return city;
	}
	public void setCity(java.lang.String city) {
		this.city = city;
	}
	public java.lang.String getAddress() {
		return address;
	}
	public void setAddress(java.lang.String address) {
		this.address = address;
	}
	public java.lang.String getHeadImg() {
		return headImg;
	}
	public void setHeadImg(java.lang.String headImg) {
		this.headImg = headImg;
	}
}
