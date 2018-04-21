package com.nbs.jiaxiao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.constant.State;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.SignStudent;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.service.db.SellerService;
import com.nbs.jiaxiao.service.db.SignStudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	public static final String FTL_PREFIX = "student";
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private SignStudentService signStudentService;
	
	
	@GetMapping("/join")
	public ModelAndView join(Integer sellerId) {
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
			return BaseRes.build(ResCode.REPEATED, existSignStudent);
		}
		return BaseRes.buildSuccess(signStudentService.insert(signStudent));
	}
}
