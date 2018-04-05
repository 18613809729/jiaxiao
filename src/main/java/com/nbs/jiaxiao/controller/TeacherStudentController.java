package com.nbs.jiaxiao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.exception.NotFoundException;
import com.nbs.jiaxiao.service.biz.TeacherBizService;

@Controller
@RequestMapping("/teacher/student")
public class TeacherStudentController {
	public static final String FTL_PREFIX = "teacher/student";

	@Autowired
	private TeacherBizService teacherService;

	@GetMapping("/index")
	public ModelAndView index() {
		return new ModelAndView(FTL_PREFIX + "/index");
	}
	
	@GetMapping("/sign")
	public ModelAndView studentSign() {
		return new ModelAndView(FTL_PREFIX + "/sign");
	}
	
	@PostMapping("/sign")
	public @ResponseBody BaseRes<Student> studentSignSubmit(@RequestAttribute("openId") String openId, Student student, double payFee) {
		Student existStudent = teacherService.queryStudent(student.getUsername(), student.getMobile());
		if (existStudent != null) {
			return BaseRes.build(ResCode.REPEATED, existStudent);
		} else {
			teacherService.addStudent(openId, student, payFee);
			return BaseRes.buildSuccess(student);
		}
	}
	
	@GetMapping("/info/{id}")
	public ModelAndView studentInfo(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/info");
		Student student = teacherService.queryStudent(id);
		if (student == null) {
			throw new NotFoundException("student not found id:" + id);
		}
		mv.addObject("student", student);
		return mv;
	}
	
	

}
