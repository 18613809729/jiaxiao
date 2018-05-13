package com.nbs.jiaxiao.wx;

import java.io.IOException;
import java.net.URLEncoder;
import java.text.MessageFormat;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaxiao.common.WebUtil;
import com.nbs.jiaxiao.component.Jedis;
import com.nbs.jiaxiao.constant.RedisKey;
import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.service.db.UserService;
import com.nbs.jiaxiao.wx.vo.CommonRes;

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
	
	@Resource
	private WxComponent wxComponent;
	
	@Resource
	private UserService userService;

	@Override
	public void afterCompletion(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
		
	}

	@Override
	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1, Object arg2, ModelAndView arg3)
			throws Exception {
	}

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response , Object arg2) throws Exception {
		/*if(true) {
			request.setAttribute("openId", "oRKZ81lV_dhueAN--6d7ZwwSSqM4");
			return true;
		}*/
		LOGGER.info("login prehand, url:{}, paramters:{}, cookie:{}", WebUtil.getRequestUrl(request), JSON.toJSONString(request.getParameterMap()), JSON.toJSONString(request.getCookies()));
		String code = request.getParameter("code");
		String state = request.getParameter("state");
		if(StringUtils.isNotBlank(code) && this.state.equals(state)) {
			LOGGER.info("wx login code:{}, state:{}", code ,state);
			//获取用户微信信息并保存
			CommonRes accessTokenRes = wxComponent.getLoginAccessToken(code);
			com.nbs.jiaxiao.wx.vo.UserInfo userInfo = wxComponent.getUserInfo(accessTokenRes.getAccess_token(), accessTokenRes.getOpenid());
			String openId = userInfo.getOpenid();
			saveOrUpdateUserInfo(userInfo);
			//添加登录cookie
			String sid = UUID.randomUUID().toString().replace("-", "");
			Cookie cookie = new Cookie("sid", sid);
			cookie.setMaxAge(365 * 24 * 60 * 60);
			cookie.setPath("/");
			cookie.setHttpOnly(true);
			cookie.setSecure(true);
			response.addCookie(cookie);
			//删除先前cookie
			String preSid = jedis.get(RedisKey.SID_ + openId);
			if(StringUtils.isNotBlank(preSid)) {
				LOGGER.info("openId is:{}, del old sid is {}", openId, preSid);
				jedis.del(RedisKey.SESSION_ + preSid);
			}
			//添加cookie到缓存
			jedis.set(RedisKey.SESSION_ + sid, openId);
			jedis.set(RedisKey.SID_ + openId, sid);
			LOGGER.info("openId is:{}, new sid is {}", openId, sid);
			request.setAttribute("openId", openId);
			return true;
		} else {
			String sid = WebUtil.getCookie(request, "sid");
			if(StringUtils.isBlank(sid)) {
				LOGGER.info("sid is null, will redirect");
				jumpToLogin(request, response, MessageFormat.format(WxConstant.LOGIN_URL, appID, URLEncoder.encode(WebUtil.getRequestUrl(request), "utf-8"), WxConstant.LOGIN_STATE));			
				return false;
			} else {
				String openId = jedis.get(RedisKey.SESSION_ + sid);
				if(StringUtils.isBlank(openId)) {
					LOGGER.info("sid is {}, but session openId is null", sid);
					jumpToLogin(request, response, MessageFormat.format(WxConstant.LOGIN_URL, appID, URLEncoder.encode(WebUtil.getRequestUrl(request), "utf-8"), WxConstant.LOGIN_STATE));			
					return false;
				} else {
					LOGGER.info("sid is {}, openId is:{}", sid, openId);
					request.setAttribute("openId", openId);
					return true;
				}
			}
		}
	}

	
	private User saveOrUpdateUserInfo(com.nbs.jiaxiao.wx.vo.UserInfo userInfo) {
		User user = userService.queryByOpenId(userInfo.getOpenid());
		boolean exist = true;
		if(user == null) {
			exist = false;
			user = new User();
		}
		
		user.setOpenId(userInfo.getOpenid());
		user.setNickName(userInfo.getNickname());
		if(StringUtils.isNoneBlank(userInfo.getSex())) {
			user.setSex(Integer.parseInt(userInfo.getSex()));
		}
		user.setProvince(userInfo.getProvince());
		user.setCity(userInfo.getCity());
		user.setCountry(userInfo.getCountry());
		if(StringUtils.isNotBlank(userInfo.getHeadimgurl())) {
			user.setHeadImg(userInfo.getHeadimgurl().replace("http://", "//"));
		}
		
		if(exist) {
			userService.updateByPriKey(user);
		} else {
			userService.insert(user);
		}
		return user;
	}
	
	private void jumpToLogin(HttpServletRequest request, HttpServletResponse response, String url) throws IOException {
		if(WebUtil.isAjax(request)) {
			LOGGER.info("ajax request print {}", "notlogin");
			response.getWriter().println("notlogin");
		} else {
			LOGGER.info("login jump to {}", url);
			response.sendRedirect(url);
		}	
	}
}
