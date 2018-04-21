package com.nbs.jiaxiao.constant;

public enum Phase{
	
	JUNIOR_1("1", "初级"),
	JUNIOR_2("2", "初级整套"),
	MIDDLE_1("3", "中级"),
	MIDDLE_2("4", "中级整套"),
	EXAM("5", "考试级");
	String code;
	String desc;
	
	
	private Phase(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public static Phase valueOfByCode(String type) {
		for (Phase stage : Phase.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
}