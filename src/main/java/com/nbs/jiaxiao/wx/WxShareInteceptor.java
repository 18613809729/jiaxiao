package com.nbs.jiaxiao.wx;

import java.security.MessageDigest;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.common.WebUtil;

public class WxShareInteceptor implements HandlerInterceptor {
	private static final Logger LOGGER = LoggerFactory.getLogger(WxLoginInteceptor.class);

	@Value("${wx.appID}")
	private String appID;
	
	@Resource
	private WxComponent wxComponent;
	
	
	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
		
	}
	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
		
	}
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse arg1, Object arg2) throws Exception {
		if(!WebUtil.isAjax(request)) {
			String jsToken = wxComponent.getJsApiToken();
			String noncestr = UUID.randomUUID().toString().replace("-", "");
			String timestamp = System.currentTimeMillis() + "";
			String url = WebUtil.getRequestUrl(request).split("#")[0];
			String str = "jsapi_ticket=" + jsToken+ "&noncestr=" + noncestr+ "&timestamp=" + timestamp + "&url=" + url;
			MessageDigest md = MessageDigest.getInstance("SHA-1");
			String signature = NbsUtils.toHex(md.digest(str.getBytes()));
			LOGGER.info("js api config {}, {}", str, signature);
			request.setAttribute("jsToken", jsToken);
			request.setAttribute("noncestr", noncestr);
			request.setAttribute("timestamp", timestamp);
			request.setAttribute("signature", signature);
			request.setAttribute("appID", appID);
		}
		return true;
	}
	
}
