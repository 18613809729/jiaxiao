package com.nbs.jiaxiao.controller;

import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.Commissions;
import com.nbs.jiaxiao.exception.NotFoundException;
import com.nbs.jiaxiao.service.biz.TeacherService;
import com.nbs.jiaxiao.wx.WxComponent;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	private static final Logger LOGGER = LoggerFactory.getLogger(TeacherController.class);
	
	@Autowired
	private WxComponent wxComponent;
	
	@Autowired
	private TeacherService teacherService;
	
	@RequestMapping("/student")
	public ModelAndView studentIndex() {
		return new ModelAndView("jl/xueyuan");
	}
	
	@RequestMapping("/student/sign")
	public ModelAndView studentSign() {
		return new ModelAndView("teacher/student/sign");
	}
	
	@RequestMapping("/student/info/{id}")
	public ModelAndView studentInfo(int id){
		ModelAndView mv = new  ModelAndView("teacher/student/info");
		Student student = teacherService.queryStudent(id);
		if(student == null) {
			throw new NotFoundException("student not found id:" + id);
		}
		mv.addObject("student", student);
		return mv;
	}
	
	@RequestMapping("/student/sign/submit")
	public @ResponseBody BaseRes<Student> studentSignSubmit(@RequestAttribute("openId") String openId, Student student, double payFee) {
		try {
			teacherService.addStudent(openId, student, payFee);
			return BaseRes.buildSuccess(student);
		} catch(Exception e) {
			LOGGER.error("登记学员信息出错", e);
			return BaseRes.Error();
		}
	} 
	
	
	@RequestMapping("/seller/all.json")
	public @ResponseBody List<Seller> sellerAll() {
		Seller seller1 = new Seller();
		seller1.setOpenId("0001");
		seller1.setMobile("18613809729");
		seller1.setUsername("张三");
		
		Seller seller2 = new Seller();
		seller2.setOpenId("0002");
		seller2.setMobile("13965810008");
		seller2.setUsername("李四");
		return Arrays.asList(seller1, seller2);
	}
	
	
	@RequestMapping("/getToken")
	public @ResponseBody String getToken() {
		return wxComponent.getAccessToken();
	} 

	
	@RequestMapping(value="/sell/commission", method=RequestMethod.GET)
	public ModelAndView commission() {
		ModelAndView mv = new  ModelAndView("teacher/sys/commission");
		mv.addObject("commissions", teacherService.queryCommission());
		return mv;
	}
	
	@RequestMapping(value="/sell/commission", method=RequestMethod.POST)
	public @ResponseBody BaseRes<Object> updateCommission(@RequestAttribute("openId") String openId, Commissions commissions ) {
		try {
			teacherService.updateCommission(openId, commissions);
			return BaseRes.buildSuccess(null);
		} catch(Exception e) {
			LOGGER.error("登记学员信息出错", e);
			return BaseRes.Error();
		}
	}
	
	
	
	@RequestMapping("/sys/commission/init")
	public @ResponseBody BaseRes<Object> init() {
		teacherService.init();
		return BaseRes.buildSuccess(null);
	}
}
