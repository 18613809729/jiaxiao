package com.nbs.jiaxiao.constant;

public enum FeeType{
	
	TUITION("1", "学费");
	String code;
	String desc;
	
	
	private FeeType(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public FeeType valueOfByCode(String type) {
		for (FeeType stage : FeeType.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
}