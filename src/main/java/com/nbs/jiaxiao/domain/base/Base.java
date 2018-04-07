package com.nbs.jiaxiao.domain.base;

import java.time.LocalDateTime;

/**
 * 数据库表domain公用字段
 * 
 * @author lifeng
 *
 */
public class Base {
	/* 创建事件 */
	protected LocalDateTime createdTime;
	/* 修改事件 */
	protected LocalDateTime modifiedTime;
	/* 更新次数 */
	protected Integer lastUpdateNo;
	/* 修改人 */
	protected String lastUpdateNoUserId;
	
	protected ParamMap param = new ParamMap(); 

	public LocalDateTime getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(LocalDateTime createdTime) {
		this.createdTime = createdTime;
	}

	public LocalDateTime getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(LocalDateTime modifiedTime) {
		this.modifiedTime = modifiedTime;
	}

	public Integer getLastUpdateNo() {
		return lastUpdateNo;
	}

	public void setLastUpdateNo(Integer lastUpdateNo) {
		this.lastUpdateNo = lastUpdateNo;
	}

	public String getLastUpdateNoUserId() {
		return lastUpdateNoUserId;
	}

	public void setLastUpdateNoUserId(String lastUpdateNoUserId) {
		this.lastUpdateNoUserId = lastUpdateNoUserId;
	}

	public ParamMap getParam() {
		return param;
	}

	public void setParam(ParamMap param) {
		this.param = param;
	}

}
