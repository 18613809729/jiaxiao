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
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.Commissions;
import com.nbs.jiaxiao.exception.NotFoundException;
import com.nbs.jiaxiao.service.biz.TeacherBizService;

@Controller
@RequestMapping("/teacher/seller")
public class TeacherSellerController {
	public static final String FTL_PREFIX = "teacher/seller";
	
	@Autowired
	private TeacherBizService teacherService;
	
	@GetMapping("/index")
	public ModelAndView index() {
		return new ModelAndView(FTL_PREFIX + "/index");
	}
	
	@GetMapping("/commission")
	public ModelAndView commission() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/commission");
		mv.addObject("commissions", teacherService.queryCommission());
		return mv;
	}
	
	@PostMapping("/commission")
	public @ResponseBody BaseRes<Object> updateCommission(@RequestAttribute("openId") String openId, Commissions commissions) {
		teacherService.updateCommission(openId, commissions);
		return BaseRes.buildSuccess(null);
	}
	
	@GetMapping("/sign")
	public ModelAndView sign() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/sign");
		//mv.addObject("commissions", teacherService.queryCommission());
		return mv;
	}
	
	@PostMapping("/sign")
	public BaseRes<Seller> addSell(@RequestAttribute("openId") String openId, Seller seller) {
		Seller existSeller = teacherService.querySeller(seller.getUsername(), seller.getMobile());
		if (existSeller != null) {
			return BaseRes.build(ResCode.REPEATED, existSeller);
		} else {
			seller = teacherService.addSeller(openId, seller);
			return BaseRes.buildSuccess(seller);
		}
	}
	
	
	@GetMapping("/info/{id}")
	public ModelAndView sellerInfo(@PathVariable("id") int id) {
		Seller seller = teacherService.querySeller(id);
		if (seller == null) {
			throw new NotFoundException("seller not found id:" + id);
		}
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/info");
		mv.addObject("sellerInfo", seller);
		return mv;
	}

}
