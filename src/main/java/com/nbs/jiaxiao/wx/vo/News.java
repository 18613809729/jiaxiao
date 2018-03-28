package com.nbs.jiaxiao.wx.vo;

import com.thoughtworks.xstream.annotations.XStreamAlias;

/**
 * 图文消息
 * @author lifeng8
 *
 */
@XStreamAlias("item")
public class News {
	@XStreamCDATA
	private String picUrl;
	@XStreamCDATA
	private String url;
	@XStreamCDATA
	private String title;
	@XStreamCDATA
	private String description;
	public String getPicUrl() {
		return picUrl;
	}
	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
}
