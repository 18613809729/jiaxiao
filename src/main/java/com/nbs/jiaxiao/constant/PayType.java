package com.nbs.jiaxiao.constant;

public enum PayType{
	
	SIGN("1", "学员登记录入"),
	ADD("2", "添加");
	String code;
	String desc;
	
	
	private PayType(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public PayType valueOfByCode(String type) {
		for (PayType stage : PayType.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
}