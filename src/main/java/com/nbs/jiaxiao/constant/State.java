package com.nbs.jiaxiao.constant;

public enum State{
	UN_READ("0", "未读"),
	HAS_READ("1", "已读"),
	MAR_READ("2", "标为已读"),
	HANDLED("3", "已处理"),
	REJECTED("4", "已拒绝"),
	DELETED("-1", "删除");
	String code;
	String desc;
	
	
	private State(String code, String desc) {
		this.code = code;
		this.desc = desc;
	}
	public String getCode() {
		return code;
	}
	public String getDesc() {
		return desc;
	}
	
	
	
	public State valueOfByCode(String type) {
		for (State stage : State.values()) {
			if(stage.getCode().equalsIgnoreCase(type)) {
				return stage;
			}
		}
		return null;
	}
}