package com.nbs.jiaxiao.constant;

public enum CommissionType{
	
	TYPE_1_1("c11", "一级分销员本级奖励"),
	TYPE_2_1("c21", "二级分销员上级奖励"),
	TYPE_2_2("c22", "二级分销员本级奖励"),
	TYPE_3_1("c31", "三级分销员上上级奖励"),
	TYPE_3_2("c32", "三级分销员上级奖励"),
	TYPE_3_3("c33", "三级分销员本级奖励");
	String code;
	String desc;
	
	
	private CommissionType(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public CommissionType valueOfByCode(String type) {
		for (CommissionType stage : CommissionType.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
}