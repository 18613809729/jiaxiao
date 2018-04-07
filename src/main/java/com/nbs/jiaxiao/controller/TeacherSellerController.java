package com.nbs.jiaxiao.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.constant.State;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.Commissions;
import com.nbs.jiaxiao.domain.vo.PreSellerInfo;
import com.nbs.jiaxiao.exception.NotFoundException;
import com.nbs.jiaxiao.service.biz.TeacherBizService;
import com.nbs.jiaxiao.service.db.PreSellerService;
import com.nbs.jiaxiao.service.db.SellerService;

@Controller
@RequestMapping("/teacher/seller")
public class TeacherSellerController {
	public static final String FTL_PREFIX = "teacher/seller";
	
	@Autowired
	private TeacherBizService teacherService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private PreSellerService preSellerService;
	
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
		return mv;
	}
	
	@PostMapping("/sign")
	public @ResponseBody BaseRes<Seller> addSell(@RequestAttribute("openId") String openId, Seller seller) {
		Seller existSeller = sellerService.querySeller(seller.getUsername(), seller.getMobile());
		if (existSeller != null) {
			return BaseRes.build(ResCode.REPEATED, existSeller);
		} else {
			seller = teacherService.addSeller(openId, seller);
			return BaseRes.buildSuccess(seller);
		}
	}
	
	@GetMapping("/join/list")
	public ModelAndView joinList() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/join");
		return mv;
	}
	
	@GetMapping("/join/infos.json")
	public @ResponseBody BaseRes<Map<String, List<PreSellerInfo>>> joinDatas() {
		return BaseRes.buildSuccess(teacherService.queryRecent());
	}
	
	@GetMapping("/join/info/{id}")
	public ModelAndView joinInfo(@PathVariable("id") int id) {
		return new ModelAndView(FTL_PREFIX + "/info");
	}
	
	@DeleteMapping("/join/info/{id}")
	public @ResponseBody BaseRes<Object> deleteJoin(@RequestAttribute("openId") String openId, @PathVariable("id") int id) {
		int count = preSellerService.deleteByPriKey(id);
		if(count == 0) {
			throw new NotFoundException("the deleted preseller not exist, id:" + id);
		}
		return BaseRes.buildSuccess(null);
	}
	
	@GetMapping("/info/{id}")
	public ModelAndView sellerInfo(@PathVariable("id") int id) {
		Seller seller = sellerService.selectByPriKey(id);
		if (seller == null) {
			throw new NotFoundException("seller not found id:" + id);
		}
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/info");
		mv.addObject("sellerInfo", seller);
		return mv;
	}

}
