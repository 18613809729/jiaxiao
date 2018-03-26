package com.nbs.jiaoxiao.wx;

import java.net.URLEncoder;
import java.text.MessageFormat;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaoxiao.common.WebUtil;
import com.nbs.jiaoxiao.component.Jedis;
import com.nbs.jiaoxiao.constant.RedisKey;

public class WxLoginInteceptor implements HandlerInterceptor  {
	private static final Logger LOGGER = LoggerFactory.getLogger(WxLoginInteceptor.class);
	@Value("${wx.token}")
	private String token;
	@Value("${wx.appID}")
	private String appID;
	@Value("${wx.appsecret}")
	private String appsecret;
	@Value("${wx.state}")
	private String state;
	
	@Resource
	private Jedis jedis;

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response , Object arg2) throws Exception {
		LOGGER.info("login prehand, url:{}, paramters:{}, cookie:{}", WebUtil.getRequestUrl(request), JSON.toJSONString(request.getParameterMap()), JSON.toJSONString(request.getCookies()));
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		if(StringUtils.isNotBlank(code) && this.state.equals(state)) {
			LOGGER.info("wx login code:{}, state:{}", code ,state);
			
			return true;
		} else {
			String sid = WebUtil.getCookie(request, "sid");
			if(StringUtils.isBlank(sid)) {
				LOGGER.info("sid is null, will redirect");
				response.sendRedirect(MessageFormat.format(WxConstant.LOGIN_URL, appID, URLEncoder.encode(WebUtil.getRequestUrl(request), "utf-8"), WxConstant.LOGIN_STATE));
				return false;
			} else {
				String openId = jedis.get(RedisKey.SESSION_ + sid);
				if(StringUtils.isBlank(openId)) {
					LOGGER.info("sid is {}, but session openId is null", sid);
					response.sendRedirect(MessageFormat.format(WxConstant.LOGIN_URL, appID, URLEncoder.encode(WebUtil.getRequestUrl(request), "utf-8"), WxConstant.LOGIN_STATE));
					return false;
				} else {
					LOGGER.info("sid is {}, openId is:{}", sid, openId);
					request.setAttribute("openId", openId);
					return true;
				}
			}
		}
	}

}
