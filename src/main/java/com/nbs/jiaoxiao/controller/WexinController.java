package com.nbs.jiaoxiao.controller;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbs.jiaoxiao.wx.WxUtils;

@Controller
@RequestMapping("/wx")
public class WexinController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WexinController.class);
	@Value("${wx.token}")
	private String token;
	
	@RequestMapping("")
	public @ResponseBody String index(String signature, String timestamp, String nonce, String echostr) {
		LOGGER.info("wx request,signature:{}, timestamp:{}, nonce:{}, echostr:{}", signature, timestamp, nonce, echostr);
		if(WxUtils.checkSign(token, signature, timestamp, nonce)) {
			if(StringUtils.isNotBlank(echostr)) {
				return echostr;
			} else {
				return "";
			}
		} 
		return "";
	}

}
