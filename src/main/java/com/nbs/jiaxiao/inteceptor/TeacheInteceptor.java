package com.nbs.jiaxiao.inteceptor;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.common.WebUtil;
import com.nbs.jiaxiao.exception.ForbiiddernException;
import com.nbs.jiaxiao.wx.WxLoginInteceptor;

public class TeacheInteceptor implements HandlerInterceptor {
	private static final Logger LOGGER = LoggerFactory.getLogger(WxLoginInteceptor.class);

	private List<String> teacherLst = Arrays.asList("test", "admin");

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object arg2) throws Exception {
		String openId = (String) request.getAttribute("openId");
		String url = WebUtil.getRequestUrl(request);
		LOGGER.info("teacheInteceptor openId:{}, url:{}", openId, url);
		if (!teacherLst.contains(openId)) {
			LOGGER.info("teacheInteceptor error openId:{}, url:{}", openId, url);
			throw new ForbiiddernException("not allowed access");
		}
		return true;
	}

}
