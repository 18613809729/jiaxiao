package com.nbs.jiaxiao.aspect;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaxiao.domain.vo.BaseRes;

@Component
@Aspect
public class ControllerAspect {
	private static final Logger LOGGER = LoggerFactory.getLogger(ControllerAspect.class);

	@Around("execution(com.nbs.jiaxiao.domain.vo.BaseRes com.nbs.jiaxiao.controller.*.*(..))")
	public Object jsonArount(ProceedingJoinPoint point) throws Throwable {
		Object returnValue = null;
		String sign = point.getSignature().toShortString();
		LOGGER.info("ControllerAspect sign:{}, args:{}", sign, JSON.toJSONString(point.getArgs()));
		try {
			returnValue = point.proceed();
		} catch (Exception e) {
			LOGGER.error("ControllerAspect error sign:" + sign, e);
			returnValue = BaseRes.ERROR;
		}
		LOGGER.info("ControllerAspect sign:{}, res:{}", sign, JSON.toJSONString(returnValue));
		return returnValue;
	}
}
