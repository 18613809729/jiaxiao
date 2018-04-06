package com.nbs.jiaxiao.constant;

public enum Status{
	INVALID("0", "失效"),
	VALID("1", "有效");
	String code;
	String desc;
	
	
	private Status(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public Status valueOfByCode(String type) {
		for (Status stage : Status.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
	
	public static boolean isValid(String code) {
		return VALID.getCode().equals(code);
	}
}