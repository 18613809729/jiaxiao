package com.nbs.jiaxiao.aspect;

import java.util.UUID;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;

@Component
@Aspect
public class ControllerAspect {
	private static final Logger LOGGER = LoggerFactory.getLogger(ControllerAspect.class);

	@Around("execution(* com.nbs.jiaxiao.controller.*.*(..))")
	public Object arount(ProceedingJoinPoint point) throws Throwable {
		Object returnValue = null;
		String sign = point.getSignature().toShortString();
		LOGGER.info("ControllerAspect sign:{}, args:{}", sign, JSON.toJSONString(point.getArgs()));
		try {
			returnValue = point.proceed();
		} catch (Exception e) {
			LOGGER.error("ControllerAspect sign:" + sign, e);
			throw e;
		}
		LOGGER.info("ControllerAspect sign:{}, res:{}", sign, JSON.toJSONString(returnValue));
		return returnValue;
	}
	
	
	@AfterReturning(pointcut="execution(org.springframework.web.servlet.ModelAndView com.nbs.jiaxiao.controller.*.*(..))", returning="mv")
	public Object setUUID(ModelAndView mv) throws Throwable {
		mv.addObject("UUID", UUID.randomUUID().toString());
		return mv;
	}
}
