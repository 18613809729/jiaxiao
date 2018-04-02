package com.nbs.jiaxiao.service.biz.impl;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaxiao.component.Jedis;
import com.nbs.jiaxiao.constant.RedisKey;
import com.nbs.jiaxiao.service.biz.WxService;
import com.nbs.jiaxiao.wx.vo.Msg;
import com.nbs.jiaxiao.wx.vo.Msg.Event;

@Service
public class WxServiceImpl implements WxService {
	private static final Logger LOGGER = LoggerFactory.getLogger(WxServiceImpl.class);

	@Resource
	private Jedis jedis;

	@Override
	public String handleMsg(Msg msg) {
		String duplicateKey = msg.getEvent() == null ? RedisKey.MSG_ + msg.getMsgId() : RedisKey.MSG_ + msg.getFromUserName() + msg.getCreateTime();
		if (StringUtils.isNotBlank(jedis.get(duplicateKey))) {
			LOGGER.warn("duplicate msg:{}", JSON.toJSONString(msg));
		}

		String res = msg.getEvent() == null ? handleUserMsg(msg) : handleEvent(msg);
		jedis.setex(duplicateKey, 30, "1");
		return res;
	}

	private String handleUserMsg(Msg msg) {
		return "欢迎光临";
	}

	private String handleEvent(Msg msg) {
		Event event = Event.valueOf(msg.getEvent());
		if (event == null) {
			LOGGER.warn("unknow event type {}, info:{}", msg.getEvent(), JSON.toJSONString(msg));
		}
		switch (event) {
		case SUBSCRIBE:
			return handleSubscribe(msg);
		case UNSUBSCRIBE:
			return handleUnsubscribe(msg);
		case CLICK:
			return handleClick(msg);
		case VIEW:
			return handleView(msg);
		default:
			LOGGER.info("cann't handle event {}, info:{}", msg.getEvent(), JSON.toJSONString(msg));
			return "";
		}
	}

	private String handleSubscribe(Msg msg) {
		return "";
	}

	private String handleUnsubscribe(Msg msg) {
		return "";
	}

	private String handleClick(Msg msg) {
		return "";
	}

	private String handleView(Msg msg) {
		return "";
	}

}
