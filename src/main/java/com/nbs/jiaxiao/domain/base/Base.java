package com.nbs.jiaxiao.domain.base;

import java.util.Date;

/**
 * 数据库表domain公用字段
 * 
 * @author lifeng
 *
 */
public class Base {
	/* 创建事件 */
	protected Date createdTime;
	/* 修改事件 */
	protected Date modifiedTime;
	/* 更新次数 */
	protected Integer lastUpdateNo;
	/* 修改人 */
	protected String lastUpdateNoUserId;
	
	protected Integer limit;
	
	protected Integer offset;
	
	protected ParamMap param = new ParamMap(); 
	
	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getModifiedTime() {
		return modifiedTime;
	}

	public void setModifiedTime(Date modifiedTime) {
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

	public Integer getLimit() {
		return limit;
	}

	public void setLimit(Integer limit) {
		this.limit = limit;
	}

	public Integer getOffset() {
		return offset;
	}

	public void setOffset(Integer offset) {
		this.offset = offset;
	}
	
}
