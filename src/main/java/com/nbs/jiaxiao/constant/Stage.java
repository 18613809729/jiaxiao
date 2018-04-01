package com.nbs.jiaxiao.constant;

public enum Stage{
	
	STAGE_1("1", "科目一"),
	STAGE_2("2", "科目二"),
	STAGE_3("3", "科目三"),
	STAGE_4("4", "科目四"),
	GRADUATED("10", "已毕业"),
	LEAVE("11", "已退学");
	String code;
	String desc;
	
	
	private Stage(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public Stage valueOfByCode(String type) {
		for (Stage stage : Stage.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
}