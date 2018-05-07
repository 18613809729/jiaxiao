package com.nbs.jiaxiao.common;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;

public class WebUtil {
	public static String getCookie(HttpServletRequest request, String cookieName) {
		if(request.getCookies() != null) {
			for (Cookie cookie : request.getCookies()) {
				if(cookie.getName().equalsIgnoreCase(cookieName)) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}
	
	//获取请求地址
	public static String getRequestUrl(HttpServletRequest request) {
		StringBuffer sb = request.getRequestURL();
		if(StringUtils.isNotBlank(request.getQueryString())) {
			sb.append("?").append(request.getQueryString());
		}
		return sb.toString();
	}
	
	public static boolean isAjax(HttpServletRequest request) {
		return "XMLHttpRequest".equals(request.getHeader("X-Requested-With"));
	}
}
