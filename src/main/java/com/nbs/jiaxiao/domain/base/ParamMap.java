package com.nbs.jiaxiao.domain.base;

import java.util.Date;
import java.util.HashMap;

/**
 * 查询参数
 * 
 * @author lifeng
 *
 */
public class ParamMap extends HashMap<String, Object> {
	private static final long serialVersionUID = 1L;
	
	/* offset */
	public ParamMap appointOffset(Integer offset) {
		put("offset", offset);
		return this;
	}
	
	/* offset */
	public ParamMap appointLimit(Integer limit) {
		put("limit", limit);
		return this;
	}

	/* 创建时间开始 */
	public ParamMap appointCreatedTimeStart(Date createdTimeStart) {
		put("createdTimeStart", createdTimeStart);
		return this;
	}

	/* 创建时间结束 */
	public ParamMap appointCreatedTimeEnd(Date createdTimeEnd) {
		put("createdTimeEnd", createdTimeEnd);
		return this;
	}

	/* 修改时间开始 */
	public ParamMap appointModifiedTimeStart(Date modifiedTimeStart) {
		put("modifiedTimeStart", modifiedTimeStart);
		return this;
	}

	/* 修改时间结束 */
	public ParamMap appointModifiedTimeEnd(Date modifiedTimeEnd) {
		put("modifiedTimeEnd", modifiedTimeEnd);
		return this;
	}

	/* 创建次数开始 */
	public ParamMap appointLastUpdateNoStart(int lastUpdateNoStart) {
		put("lastUpdateNoStart", lastUpdateNoStart);
		return this;
	}

	/* 创建次数结束 */
	public ParamMap appointLastUpdateNoEnd(int lastUpdateNoEnd) {
		put("lastUpdateNoEnd", lastUpdateNoEnd);
		return this;
	}

	/* 设置排序字段 */
	public ParamMap appointColumnSort(String columnSort) {
		put("columnSort", columnSort);
		return this;
	}
}
