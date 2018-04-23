package com.nbs.jiaxiao.domain.vo;

import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.exception.InvalidParamException;

public class ExamInterval {
	public static final String INTERVAL1 = "1"; 
	public static final String INTERVAL2 = "2"; 
	public static final String INTERVAL3 = "3"; 
	public static final String INTERVAL4 = "4"; 

	private Integer interval1;
	private Integer interval2;
	private Integer interval3;
	private Integer interval4;
	public Integer getInterval1() {
		return interval1;
	}
	public void setInterval1(Integer interval1) {
		this.interval1 = interval1;
	}
	public Integer getInterval2() {
		return interval2;
	}
	public void setInterval2(Integer interval2) {
		this.interval2 = interval2;
	}
	public Integer getInterval3() {
		return interval3;
	}
	public void setInterval3(Integer interval3) {
		this.interval3 = interval3;
	}
	public Integer getInterval4() {
		return interval4;
	}
	public void setInterval4(Integer interval4) {
		this.interval4 = interval4;
	}
	
	public Integer getIntervalByStage(String stageCode) {
		Stage stage = Stage.valueOfByCode(stageCode);
		switch (stage) {
		case STAGE_1:
			return interval1;
		case STAGE_2:
			return interval2;
		case STAGE_3:
			return interval3;
		case STAGE_4:
			return interval4;
		default:
			throw new InvalidParamException("wrong stage" + stageCode);
		}
	}
}
