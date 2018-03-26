package com.nbs.jiaoxiao.controller;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaoxiao.common.XStreamUtil;
import com.nbs.jiaoxiao.wx.WxComponent;
import com.nbs.jiaoxiao.wx.vo.Msg;

@Controller
@RequestMapping("/wx")
public class WexinController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WexinController.class);
	@Autowired
	private WxComponent wxComponent;

	@RequestMapping(value="", method = RequestMethod.GET)
	public @ResponseBody String validate(String signature, String timestamp, String nonce, String echostr) {
		LOGGER.info("wx request,signature:{}, timestamp:{}, nonce:{}, echostr:{}", signature, timestamp, nonce, echostr);
		return wxComponent.checkSign(signature, timestamp, nonce) ? echostr : "";
	}
	
	@RequestMapping(value="", method = RequestMethod.POST)
	public @ResponseBody String index(@RequestBody String text) {
		Msg msg = XStreamUtil.getInstance().deserialize(Msg.class, text);
		System.out.println(JSON.toJSONString(msg));
		return "";
	}

}
