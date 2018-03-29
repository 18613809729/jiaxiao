package com.nbs.jiaxiao.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.exception.NotFoundException;
import com.nbs.jiaxiao.service.db.StudentService;
import com.nbs.jiaxiao.wx.WxComponent;

@Controller
@RequestMapping("/teacher")
public class TeacherController {
	private static final Logger LOGGER = LoggerFactory.getLogger(TeacherController.class);
	
	@Autowired
	private WxComponent wxComponent;
	
	@Autowired
	private StudentService studentService;
	
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
		Student student = studentService.selectByPriKey(id);
		if(student == null) {
			throw new NotFoundException("student not found id:" + id);
		}
		mv.addObject("student", student);
		return mv;
	}
	
	@RequestMapping("/getToken")
	public @ResponseBody String getToken() {
		return wxComponent.getAccessToken();
	} 
	
	@RequestMapping("/student/sign/submit")
	public @ResponseBody BaseRes<Object> studentSignSubmit(@RequestAttribute("openId") String openId, Student student, double payFee) {
		try {
			student.setLastUpdateNoUserId(openId);
			student.setStage(Stage.STAGE_1.getCode());
			studentService.insert(student);
			return BaseRes.buildSuccessRes(null);
		} catch(Exception e) {
			LOGGER.error("登记学生信息出错", e);
			return BaseRes.buildExceptionRes();
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

}
