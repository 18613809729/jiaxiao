package com.nbs.jiaxiao.inteceptor;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.component.Jedis;
import com.nbs.jiaxiao.constant.RedisKey;
import com.nbs.jiaxiao.exception.ForbiiddernException;

/**
 * 请求限速器
 * 
 * @author lifeng8
 *
 */
public class RateLimiterInteceptor implements HandlerInterceptor {
	private static final Logger LOGGER = LoggerFactory.getLogger(RateLimiterInteceptor.class);
	@Resource
	private Jedis jedis;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		String openId = (String) request.getAttribute("openId");
		String key = RedisKey.RATE_LIMITER_ + openId;
		Long count = jedis.incr(key);
		if(jedis.ttl(key).longValue() == -1L) {
			jedis.expire(key, 60);
		}
		LOGGER.info("RateLimiterInteceptor {} count {}", openId, count);
		if(count < 30) {
			return true;
		} else {
			throw new ForbiiddernException("RateLimiterInteceptor over " + openId);
		}
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
	}

}
