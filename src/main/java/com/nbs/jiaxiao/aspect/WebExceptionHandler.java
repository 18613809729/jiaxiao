package com.nbs.jiaxiao.aspect;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.exception.ForbiiddernException;
import com.nbs.jiaxiao.exception.NotFoundException;

//@ControllerAdvice
public class WebExceptionHandler {
	//private static final Logger LOGGER = LoggerFactory.getLogger(WebExceptionHandler.class);

	@ExceptionHandler({ NotFoundException.class })
	@ResponseStatus(code=HttpStatus.NOT_FOUND)
	public ModelAndView notFoundException(NotFoundException e) {
		return new ModelAndView("404");
	}
	
	@ExceptionHandler({ ForbiiddernException.class })
	@ResponseStatus(code=HttpStatus.FORBIDDEN)
	public ModelAndView forbiiddernException(ForbiiddernException e) {
		return new ModelAndView("403"); 
	}
	
	@ExceptionHandler({ Throwable.class })
	@ResponseStatus(code=HttpStatus.INTERNAL_SERVER_ERROR)
	public ModelAndView serverErrorException(Throwable e) {
		return new ModelAndView("500"); 
	}
}
