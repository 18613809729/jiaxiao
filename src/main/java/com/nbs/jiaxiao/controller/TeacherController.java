package com.nbs.jiaxiao.controller;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.service.biz.TeacherBizService;
import com.nbs.jiaxiao.service.db.UserService;
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

	

	

	

	

	@Resource
	private UserService userService;
	
	@RequestMapping("/sys/init")
	public @ResponseBody BaseRes<Object> init() {
		//teacherService.init();
		long mobile = 18613809729L;
		int openId = 10;
		long certNo = 340811198809226310L;
		String img = "https://static.newbs.xyz/test/jia/img/mv.jpeg";
		String[] userName = {"一","二", "三", "四", "五", "六", "七", "八", "九", "十",};
		for (int i = 1; i < 10; i++) {
			User user = new User();
			user.setNickName("夏日の忧伤");
			user.setAddress("广东省贵州市");
			user.setCertNo(++certNo + "");
			user.setCity("广州市");
			user.setCountry("中国");
			user.setHeadImg(img);
			user.setLastUpdateNoUserId("test");
			user.setMobile(++mobile + "");
			user.setOpenId(++openId + "");
			user.setProvince("广东");
			user.setSex(1);
			user.setUserName("陈" + userName[i]);
			userService.insert(user);
		}
		
		return BaseRes.buildSuccess(null);
	}
}
