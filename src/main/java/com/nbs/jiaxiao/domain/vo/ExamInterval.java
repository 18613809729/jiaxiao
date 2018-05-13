package com.nbs.jiaxiao.domain.vo;

import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.exception.InvalidParamException;

public class ExamInterval {
	public static final String INTERVAL1 = "1"; 
	public static final String INTERVAL20 = "20"; 
	public static final String INTERVAL21 = "21"; 
	public static final String INTERVAL30 = "30"; 
	public static final String INTERVAL31 = "31"; 
	public static final String INTERVAL4 = "4"; 

	private Integer interval1;
	private Integer interval20;
	private Integer interval21;
	private Integer interval30;
	private Integer interval31;
	private Integer interval4;
	
	
	

	public Integer getInterval1() {
		return interval1;
	}




	public void setInterval1(Integer interval1) {
		this.interval1 = interval1;
	}




	public Integer getInterval20() {
		return interval20;
	}




	public void setInterval20(Integer interval20) {
		this.interval20 = interval20;
	}




	public Integer getInterval21() {
		return interval21;
	}




	public void setInterval21(Integer interval21) {
		this.interval21 = interval21;
	}




	public Integer getInterval30() {
		return interval30;
	}




	public void setInterval30(Integer interval30) {
		this.interval30 = interval30;
	}




	public Integer getInterval31() {
		return interval31;
	}




	public void setInterval31(Integer interval31) {
		this.interval31 = interval31;
	}




	public Integer getInterval4() {
		return interval4;
	}




	public void setInterval4(Integer interval4) {
		this.interval4 = interval4;
	}




	public Integer getIntervalByStage(String stageCode, Integer driveType) {
		Stage stage = Stage.valueOfByCode(stageCode);
		switch (stage) {
		case STAGE_1:
			return interval1;
		case STAGE_2:
			return driveType.intValue() == 0 ? interval20 : interval21;
		case STAGE_3:
			return driveType.intValue() == 0 ? interval30 : interval31;
		case STAGE_4:
			return interval4;
		default:
			throw new InvalidParamException("wrong stage" + stageCode);
		}
	}
}
