package com.nbs.jiaoxiao.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbs.jiaoxiao.wx.WxComponent;

@Controller
@RequestMapping("/wx")
public class WexinController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WexinController.class);
	@Autowired
	private WxComponent wxComponent;

	@RequestMapping(value="", method = RequestMethod.GET)
	public @ResponseBody String index(String signature, String timestamp, String nonce, String echostr) {
		LOGGER.info("wx request,signature:{}, timestamp:{}, nonce:{}, echostr:{}", signature, timestamp, nonce, echostr);
		return wxComponent.checkSign(signature, timestamp, nonce) ? echostr : "";
	}

}