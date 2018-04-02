package com.nbs.jiaxiao.constant;

public enum ResCode{
	
	REPEATED("101", "数据重复");
	String code;
	String desc;
	
	
	private ResCode(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public ResCode valueOfByCode(String type) {
		for (ResCode stage : ResCode.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
}