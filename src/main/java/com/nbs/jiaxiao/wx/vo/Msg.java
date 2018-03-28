package com.nbs.jiaxiao.wx.vo;

import com.thoughtworks.xstream.annotations.XStreamAlias;

@XStreamAlias("xml")
public class Msg {
	@XStreamAlias("ToUserName")
	private String toUserName;
	@XStreamAlias("FromUserName")
	private String fromUserName;
	@XStreamAlias("CreateTime")
	private Long createTime;
	@XStreamAlias("MsgType")
	private String msgType;
	@XStreamAlias("Content")
	private String content;
	@XStreamAlias("MsgId")
	private Long msgId;
	@XStreamAlias("PicUrl")
	private String picUrl;
	@XStreamAlias("MediaId")
	private String mediaId;
	@XStreamAlias("Format")
	private String format;
	@XStreamAlias("Recognition")
	private String recognition;
	@XStreamAlias("ThumbMediaId")
	private String thumbMediaId;
	@XStreamAlias("Location_X")
	private String location_X;
	@XStreamAlias("Location_Y")
	private String location_Y;
	@XStreamAlias("Scale")
	private String scale;
	@XStreamAlias("Label")
	private String label;
	@XStreamAlias("Title")
	private String title;
	@XStreamAlias("Description")
	private String description;
	@XStreamAlias("Url")
	private String url;
	@XStreamAlias("Event")
	private String event;
	@XStreamAlias("EventKey")
	private String eventKey;
	@XStreamAlias("Ticket")
	private String ticket;
	@XStreamAlias("Latitude")
	private String latitude;
	@XStreamAlias("Longitude")
	private String longitude;
	@XStreamAlias("Precision")
	private String precision;
	
	
	public String getToUserName() {
		return toUserName;
	}



	public void setToUserName(String toUserName) {
		this.toUserName = toUserName;
	}



	public String getFromUserName() {
		return fromUserName;
	}



	public void setFromUserName(String fromUserName) {
		this.fromUserName = fromUserName;
	}



	public Long getCreateTime() {
		return createTime;
	}



	public void setCreateTime(Long createTime) {
		this.createTime = createTime;
	}



	public String getMsgType() {
		return msgType;
	}



	public void setMsgType(String msgType) {
		this.msgType = msgType;
	}



	public String getContent() {
		return content;
	}



	public void setContent(String content) {
		this.content = content;
	}



	public Long getMsgId() {
		return msgId;
	}



	public void setMsgId(Long msgId) {
		this.msgId = msgId;
	}



	public String getPicUrl() {
		return picUrl;
	}



	public void setPicUrl(String picUrl) {
		this.picUrl = picUrl;
	}



	public String getMediaId() {
		return mediaId;
	}



	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
	}



	public String getFormat() {
		return format;
	}



	public void setFormat(String format) {
		this.format = format;
	}



	public String getRecognition() {
		return recognition;
	}



	public void setRecognition(String recognition) {
		this.recognition = recognition;
	}



	public String getThumbMediaId() {
		return thumbMediaId;
	}



	public void setThumbMediaId(String thumbMediaId) {
		this.thumbMediaId = thumbMediaId;
	}



	public String getLocation_X() {
		return location_X;
	}



	public void setLocation_X(String location_X) {
		this.location_X = location_X;
	}



	public String getLocation_Y() {
		return location_Y;
	}



	public void setLocation_Y(String location_Y) {
		this.location_Y = location_Y;
	}



	public String getScale() {
		return scale;
	}



	public void setScale(String scale) {
		this.scale = scale;
	}



	public String getLabel() {
		return label;
	}



	public void setLabel(String label) {
		this.label = label;
	}



	public String getTitle() {
		return title;
	}



	public void setTitle(String title) {
		this.title = title;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getUrl() {
		return url;
	}



	public void setUrl(String url) {
		this.url = url;
	}



	public String getEvent() {
		return event;
	}



	public void setEvent(String event) {
		this.event = event;
	}


	public String getEventKey() {
		return eventKey;
	}



	public void setEventKey(String eventKey) {
		this.eventKey = eventKey;
	}



	public String getTicket() {
		return ticket;
	}



	public void setTicket(String ticket) {
		this.ticket = ticket;
	}



	public String getLatitude() {
		return latitude;
	}



	public void setLatitude(String latitude) {
		this.latitude = latitude;
	}



	public String getLongitude() {
		return longitude;
	}



	public void setLongitude(String longitude) {
		this.longitude = longitude;
	}



	public String getPrecision() {
		return precision;
	}



	public void setPrecision(String precision) {
		this.precision = precision;
	}




	public static enum MsgType{
		TEXT("text", "文本消息"), IMAGE("image", "图片"), VOICE("voice", "语音"), VIDEO("video", "视频"), SHORTVIDEO("shortvideo", "短视频"),
		LOCATION("location", "位置"), LINK("link", "位置"), EVENT("event", "事件");
		String code;
		String desc;
		
		
		private MsgType(String code, String desc) {
			this.code = code;
			this.desc = desc;
		}
		public String getCode() {
			return code;
		}
		public String getDesc() {
			return desc;
		}
		
		
		
		public MsgType valueOfByCode(String type) {
			for (MsgType msgType : MsgType.values()) {
				if(msgType.getCode().equals(type)) {
					return msgType;
				}
			}
			return null;
		}
		
	}
	
	
	public static enum Event{
		SUBSCRIBE("subscribe", "公众号订阅"), UNSUBSCRIBE("unsubscribe", "订阅取消"), SCAN("SCAN", "扫描"), LOCATION("LOCATION", "地理位置上报"), 
		CLICK("CLICK", "菜单点击"), VIEW("link", "位置");
		String code;
		String desc;
		
		
		private Event(String code, String desc) {
			this.code = code;
			this.desc = desc;
		}
		public String getCode() {
			return code;
		}
		public String getDesc() {
			return desc;
		}
		
		
		
		public Event valueOfByCode(String type) {
			for (Event event : Event.values()) {
				if(event.getCode().equals(type)) {
					return event;
				}
			}
			return null;
		}
	}
}
