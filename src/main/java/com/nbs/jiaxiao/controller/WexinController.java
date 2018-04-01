package com.nbs.jiaxiao.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbs.jiaxiao.wx.WxComponent;

@Controller
@RequestMapping("/wx")
public class WexinController {
	private static final Logger LOGGER = LoggerFactory.getLogger(WexinController.class);
	@Autowired
	private WxComponent wxComponent;
//	@Autowired
//	private WxService wxService;

	@RequestMapping(value = "", method = RequestMethod.GET)
	public @ResponseBody String validate(String signature, String timestamp, String nonce, String echostr) {
		LOGGER.info("wx request,signature:{}, timestamp:{}, nonce:{}, echostr:{}", signature, timestamp, nonce, echostr);
		return wxComponent.checkSign(signature, timestamp, nonce) ? echostr : "";
	}

	/*@RequestMapping(value = "", method = RequestMethod.POST)
	public @ResponseBody String index(@RequestBody String text) {
		try {
			LOGGER.info("handle msg:{}", text);
			Msg msg = XStreamUtil.getInstance().deserialize(Msg.class, text);
			String res = wxService.handleMsg(msg);
			LOGGER.info("handle msgId:{} res:{}", msg.getMsgId(), res);
			return res;
		} catch (Exception e) {
			LOGGER.error("handle msg error", e);
		}
		return "";
	}*/

}
