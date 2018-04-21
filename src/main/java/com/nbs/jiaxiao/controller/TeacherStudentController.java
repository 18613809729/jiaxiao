package com.nbs.jiaxiao.controller;

import java.math.BigDecimal;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.Phase;
import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.constant.State;
import com.nbs.jiaxiao.constant.Status;
import com.nbs.jiaxiao.domain.po.Fee;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.SignStudent;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.SignStudentInfo;
import com.nbs.jiaxiao.domain.vo.StudentInfo;
import com.nbs.jiaxiao.exception.InvalidParamException;
import com.nbs.jiaxiao.exception.NotFoundException;
import com.nbs.jiaxiao.service.biz.TeacherBizService;
import com.nbs.jiaxiao.service.db.FeeService;
import com.nbs.jiaxiao.service.db.SchoolService;
import com.nbs.jiaxiao.service.db.SellerService;
import com.nbs.jiaxiao.service.db.SignStudentService;
import com.nbs.jiaxiao.service.db.StudentService;
import com.nbs.jiaxiao.service.db.UserService;

@Controller
@RequestMapping("/teacher/student")
public class TeacherStudentController {
	public static final String FTL_PREFIX = "teacher/student";
	private static final DateTimeFormatter FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	@Autowired
	private TeacherBizService teacherService;
	
	@Autowired
	private SignStudentService signStudentService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private FeeService feeService;

	@Autowired
	private SchoolService schoolService;
	
	@GetMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/index");
		mv.addObject("unReadSignStudentCount", signStudentService.queryUnReadCount());
		return mv;
	}
	
	@GetMapping("/sign")
	public ModelAndView studentSign() {
		return new ModelAndView(FTL_PREFIX + "/sign");
	}
	
	@PostMapping("/sign")
	public @ResponseBody BaseRes<Student> studentSignSubmit(@RequestAttribute("openId") String openId, Student student, Double payFee) {
		Student existStudent = teacherService.queryStudent(student.getUsername(), student.getMobile());
		if (existStudent != null) {
			return BaseRes.build(ResCode.REPEATED, existStudent);
		} else {
			teacherService.addStudent(openId, student, payFee);
			return BaseRes.buildSuccess(student);
		}
	}
	
	@GetMapping("/join/list")
	public ModelAndView joinList() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/join");
		return mv;
	}
	
	@GetMapping("/join/infos.json")
	public @ResponseBody BaseRes<Map<String, List<SignStudentInfo>>> joinDatas() {
		return BaseRes.buildSuccess(signStudentService.queryRecent());
	}
	
	@GetMapping("/join/info/{id}")
	public ModelAndView joinInfo(@PathVariable("id") int id) {
		SignStudent signStudent = signStudentService.selectByPriKey(id);
		NbsUtils.assertNotNull(signStudent, "the signStudent {0} not exisd", id);
		User user = userService.queryByOpenId(signStudent.getOpenId());
		signStudent.setUser(user);
		if(State.isUnRead(signStudent.getState())) {
			signStudent.setState(State.HAS_READ.getCode());
			signStudentService.updateByPriKey(signStudent);
		}
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/joinInfo");
		mv.addObject("createdTime", signStudent.getCreatedTime().format(FORMAT));
		mv.addObject("info", signStudent);
		if(signStudent.getSellerId() != null && signStudent.getSellerId().intValue() != 0) {
			mv.addObject("seller", sellerService.selectByPriKey(signStudent.getSellerId()));
		}
		return mv;
	}
	
	@DeleteMapping("/join/info/{id}")
	public @ResponseBody BaseRes<Object> deleteJoin(@RequestAttribute("openId") String openId, @PathVariable("id") int id) {
		SignStudent signStudent = signStudentService.selectByPriKey(id);
		NbsUtils.assertNotNull(signStudent, "the deleted signStudent not exist, id:{0}", id);
		signStudent.setState(State.DELETED.getCode());
		signStudentService.updateByPriKey(signStudent);
		return BaseRes.buildSuccess(null);
	}


	@GetMapping("/retrieve")
	public ModelAndView retrieve() {
		return new ModelAndView(FTL_PREFIX + "/retrieve");
	} 
	
	@GetMapping("/data.json")
	public @ResponseBody BaseRes<List<StudentInfo>> studentInfo(String type, String stage) {
		List<StudentInfo> data = null;
		switch (type) {
		case "inLearn":
			data = studentService.selectInLearnStudent();
			break;
		case "stage":
			data = studentService.selectStageStudent(stage);
			break;
		case "arrearage":
			data = studentService.selectArrearageStudent();
			break;
		default:
			throw new InvalidParamException("unknow query type" + type);
		}
		return BaseRes.buildSuccess(data);
	} 
	
	@GetMapping("/search.json")
	public @ResponseBody BaseRes<List<Student>> searchStudentInfo(Student con) {
		return BaseRes.buildSuccess(studentService.selectSearchInfo(con));
	}
	
	
	
	@GetMapping("/info/{id}")
	public ModelAndView studentInfo(@PathVariable("id") int id) {
		Student student = studentService.selectByPriKey(id);
		NbsUtils.assertNotNull(student, "student {0} not found", id);
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/info");
		mv.addObject("info", student);

		if(StringUtils.isNotBlank(student.getOpenId())) {
			User user = userService.queryByOpenId(student.getOpenId());
			student.setUser(user);
		}
		if(student.getSellerId() != null && student.getSellerId().intValue() != 0) {
			Seller seller = sellerService.selectByPriKey(student.getSellerId());
			if(seller != null) {
				mv.addObject("seller", seller);
			}
		}
		mv.addObject("createdTime", student.getCreatedTime().format(FORMAT));
		mv.addObject("school", schoolService.selectByPriKey(student.getSchoolId()));
		mv.addObject("stage", Stage.valueOfByCode(student.getStage()).getDesc());
		mv.addObject("phase", Phase.valueOfByCode(student.getPhase()));
		List<Fee> feeLst = feeService.queryByStudentId(student.getId());
		BigDecimal payFee = new BigDecimal(0);
		for (Fee fee : feeLst) {
			payFee = payFee.add(fee.getMoney());
		}
		mv.addObject("payFee", payFee);
		mv.addObject("feeLst", feeLst);
		return mv;
	}

	@PutMapping("/info/{id}")
	public @ResponseBody BaseRes<Seller> sellerInfo(@PathVariable("id") int id, Seller info) {
		Seller seller = sellerService.selectByPriKey(id);
		NbsUtils.assertNotNull(seller, "seller {0} not found", id);
		if(StringUtils.isNotBlank(info.getMobile())) {
			seller.setMobile(info.getMobile());
		}
		if(StringUtils.isNotBlank(info.getUsername())) {
			seller.setUsername(info.getUsername());
		}
		if(StringUtils.isNotBlank(info.getStatus())) {
			Status.assertLegalCode(info.getStatus());
			seller.setStatus(info.getStatus());
		}
		sellerService.updateByPriKey(seller);
		return BaseRes.buildSuccess(seller);
	}
	
	
}
