package com.nbs.jiaxiao.wx.vo;

import java.util.ArrayList;
import java.util.List;

import com.nbs.jiaxiao.common.XStreamUtil;
import com.thoughtworks.xstream.annotations.XStreamAlias;

@XStreamAlias("xml")
public class Reply {
	@XStreamCDATA
	private String toUserName;
	@XStreamCDATA
	private String fromUserName;
	private Long createTime;
	@XStreamCDATA
	private String msgType;
	@XStreamCDATA
	private String Content;
	@XStreamCDATA
	private String mediaId;
	@XStreamCDATA
	private String title;
	@XStreamCDATA
	private String description;
	@XStreamCDATA
	private String musicURL;
	@XStreamCDATA
	private String hQMusicUrl;
	@XStreamCDATA
	private String thumbMediaId;
	private Integer articleCount;
	private List<News> articles;
	
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
		return Content;
	}
	public void setContent(String content) {
		Content = content;
	}
	public String getMediaId() {
		return mediaId;
	}
	public void setMediaId(String mediaId) {
		this.mediaId = mediaId;
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
	public String getMusicURL() {
		return musicURL;
	}
	public void setMusicURL(String musicURL) {
		this.musicURL = musicURL;
	}
	public String gethQMusicUrl() {
		return hQMusicUrl;
	}
	public void sethQMusicUrl(String hQMusicUrl) {
		this.hQMusicUrl = hQMusicUrl;
	}
	public String getThumbMediaId() {
		return thumbMediaId;
	}
	public void setThumbMediaId(String thumbMediaId) {
		this.thumbMediaId = thumbMediaId;
	}
	public Integer getArticleCount() {
		return articleCount;
	}
	public void setArticleCount(Integer articleCount) {
		this.articleCount = articleCount;
	}
	
	public List<News> getArticles() {
		return articles;
	}
	public void setArticles(List<News> articles) {
		this.articles = articles;
	}
	
	
	public static enum ReplyType{
		TEXT("text", "文本消息"), IMAGE("image", "图片"), VOICE("voice", "语音"), VIDEO("video", "视频"), MUSIC("music", "音乐"),
		NEWS("news", "图文");
		String code;
		String desc;
		
		
		private ReplyType(String code, String desc) {
			this.code = code;
			this.desc = desc;
		}
		public String getCode() {
			return code;
		}
		public String getDesc() {
			return desc;
		}
		
		
		
		public ReplyType valueOfByCode(String type) {
			for (ReplyType replyType : ReplyType.values()) {
				if(replyType.getCode().equalsIgnoreCase(type)) {
					return replyType;
				}
			}
			return null;
		}
		
	}
	
	public static void main(String[] args) {
		Reply reply = new Reply();
		reply.setFromUserName("zhangsan");
		reply.setToUserName("lisi");
		reply.setCreateTime(17890L);
		reply.setArticleCount(8);
		List<News> lst = new ArrayList<>();
		News news1 = new News();
		news1.setDescription("描述");
		news1.setPicUrl("/img");
		news1.setTitle("new image");
		news1.setUrl("//im");
		lst.add(news1);
		reply.setArticles(lst);
		System.out.println(XStreamUtil.toWxXML(reply));
	}
}
