package com.nbs.jiaxiao.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.service.biz.TeacherBizService;
import com.nbs.jiaxiao.wx.WxComponent;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	private static final Logger LOGGER = LoggerFactory.getLogger(TeacherController.class);

	@Autowired
	private WxComponent wxComponent;

	@Autowired
	private TeacherBizService teacherService;

	



	

	

	@RequestMapping("/getToken")
	public @ResponseBody String getToken() {
		return wxComponent.getAccessToken();
	}

	

	

	

	

	
	@RequestMapping("/sys/commission/init")
	public @ResponseBody BaseRes<Object> init() {
		teacherService.init();
		return BaseRes.buildSuccess(null);
	}
}
