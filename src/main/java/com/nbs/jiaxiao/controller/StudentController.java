package com.nbs.jiaxiao.controller;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.Phase;
import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.constant.State;
import com.nbs.jiaxiao.domain.po.ExamInfo;
import com.nbs.jiaxiao.domain.po.Fee;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.SignStudent;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.service.db.ExamInfoService;
import com.nbs.jiaxiao.service.db.ExamService;
import com.nbs.jiaxiao.service.db.FeeService;
import com.nbs.jiaxiao.service.db.SchoolService;
import com.nbs.jiaxiao.service.db.SellerService;
import com.nbs.jiaxiao.service.db.SignStudentService;
import com.nbs.jiaxiao.service.db.StudentService;
import com.nbs.jiaxiao.service.db.UserService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	public static final String FTL_PREFIX = "student";
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private SignStudentService signStudentService;
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private FeeService feeService;
	
	@Autowired
	private ExamService examService;
	
	@Autowired
	private ExamInfoService examInfoService;
	
	@GetMapping("/join")
	public ModelAndView join(@RequestAttribute("openId") String openId, Integer sellerId) {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/sign");
		mv.addObject("seller", sellerService.queryParentSeller(sellerId));
		return mv;
	}

	@PostMapping("/join")
	public @ResponseBody BaseRes<Object> join(@RequestAttribute("openId") String openId, SignStudent signStudent) {
		signStudent.setOpenId(openId);
		signStudent.setLastUpdateNoUserId(openId);
		signStudent.setState(State.UN_READ.getCode());
		SignStudent existSignStudent = signStudentService.queryByKey(signStudent.getUsername(), signStudent.getMobile());
		if(existSignStudent != null) {
			return BaseRes.build("-1", "该身份已成功预约", existSignStudent);
		}
		return BaseRes.buildSuccess(signStudentService.insert(signStudent));
	}

	@GetMapping("/link")
	public ModelAndView linkPage() {
		return new ModelAndView(FTL_PREFIX + "/link");
	}
	
	@PostMapping("/link")
	public @ResponseBody BaseRes<Object> link(@RequestAttribute("openId") String openId, Student con) {
		Student student = studentService.queryStudent(con.getUsername(), con.getMobile());
		if(student == null) {
			return BaseRes.build("-1", "学员信息不存在");
		}
		if(!StringUtils.isBlank(student.getOpenId())) {
			return BaseRes.build("-1", "学员信息已被关联");
		}
		if(!CollectionUtils.isEmpty(studentService.queryStudent(openId))) {
			return BaseRes.build("-1", "您的微信号已关联其他身份");
		}
		student.setOpenId(openId);
		studentService.updateByPriKey(student);
		return BaseRes.buildSuccess(null);
	}
	
	@GetMapping("/index")
	public ModelAndView index(@RequestAttribute("openId") String openId) {
		List<Student> students = studentService.queryStudent(openId);
		if(students.isEmpty()) {
			return new ModelAndView(FTL_PREFIX + "/choose");
		}
		
		Student student = NbsUtils.getFirst(students);
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/info");
		mv.addObject("info", student);
		User user = userService.queryByOpenId(openId);
		student.setUser(user);
		if(student.getSellerId() != null && student.getSellerId().intValue() != 0) {
			Seller seller = sellerService.selectByPriKey(student.getSellerId());
			if(seller != null) {
				mv.addObject("seller", seller);
			}
		}
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
		mv.addObject("needPay", payFee.compareTo(student.getTotalFee()) < 0);
		List<ExamInfo> examInfos = examInfoService.queryStudentExam(student.getId());
		examInfos.forEach(examInfo -> {
			examInfo.setExam(examService.selectByPriKey(examInfo.getExamId()));
		});
		mv.addObject("examInfos", examInfos);
		return mv;
	} 

}
