package com.nbs.jiaxiao.constant;

public enum DictType{
	
	TYPE("type", "类型"),
	COMMISSION("COMMISSION", "佣金");
	String code;
	String desc;
	
	
	private DictType(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public DictType valueOfByCode(String type) {
		for (DictType stage : DictType.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
}