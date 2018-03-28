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

	/* 创建时间开始 */
	public void appointCreatedTimeStart(Date createdTimeStart) {
		put("createdTimeStart", createdTimeStart);
	}

	/* 创建时间结束 */
	public void appointCreatedTimeEnd(Date createdTimeEnd) {
		put("createdTimeEnd", createdTimeEnd);
	}

	/* 修改时间开始 */
	public void appointModifiedTimeStart(Date modifiedTimeStart) {
		put("modifiedTimeStart", modifiedTimeStart);
	}

	/* 修改时间结束 */
	public void appointModifiedTimeEnd(Date modifiedTimeEnd) {
		put("modifiedTimeEnd", modifiedTimeEnd);
	}

	/* 创建次数开始 */
	public void appointLastUpdateNoStart(int lastUpdateNoStart) {
		put("lastUpdateNoStart", lastUpdateNoStart);
	}

	/* 创建次数结束 */
	public void appointLastUpdateNoEnd(int lastUpdateNoEnd) {
		put("lastUpdateNoEnd", lastUpdateNoEnd);
	}

	/* 设置排序字段 */
	public void appointColumnSort(String columnSort) {
		put("columnSort", columnSort);
	}
}
