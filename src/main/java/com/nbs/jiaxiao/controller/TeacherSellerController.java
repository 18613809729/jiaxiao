package com.nbs.jiaxiao.controller;

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

import com.alibaba.fastjson.JSON;
import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.constant.State;
import com.nbs.jiaxiao.constant.Status;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.Commissions;
import com.nbs.jiaxiao.domain.vo.PreSellerInfo;
import com.nbs.jiaxiao.exception.InvalidParamException;
import com.nbs.jiaxiao.exception.NotFoundException;
import com.nbs.jiaxiao.service.biz.TeacherBizService;
import com.nbs.jiaxiao.service.db.CommisionFeeService;
import com.nbs.jiaxiao.service.db.PreSellerService;
import com.nbs.jiaxiao.service.db.SellerService;
import com.nbs.jiaxiao.service.db.UserService;

@Controller
@RequestMapping("/teacher/seller")
public class TeacherSellerController {
	public static final String FTL_PREFIX = "teacher/seller";
	
	private static final DateTimeFormatter FORMAT = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	
	@Autowired
	private TeacherBizService teacherService;
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private PreSellerService preSellerService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private CommisionFeeService commisionFeeService;
	
	@GetMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/index");
		mv.addObject("unReadCount", preSellerService.queryUnReadCount());
		return mv;
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
		PreSeller preSeller = preSellerService.selectByPriKey(id);
		NbsUtils.assertNull(preSeller, "the preseller {} not exisd", id);
		User user = userService.queryByOpenId(preSeller.getOpenId());
		preSeller.setUser(user);
		if(State.isUnRead(preSeller.getState())) {
			preSeller.setState(State.HAS_READ.getCode());
			preSellerService.updateByPriKey(preSeller);
		}
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/preSeller");
		mv.addObject("createdTime", preSeller.getCreatedTime().format(FORMAT));
		mv.addObject("info", preSeller);
		if(preSeller.getParentId() != null && preSeller.getParentId().intValue() != 0) {
			mv.addObject("parent", sellerService.selectByPriKey(preSeller.getParentId()));
		}
		return mv;
	}
	
	@PutMapping("/join/info/{id}")
	public @ResponseBody BaseRes<Object> joinStateChange(@RequestAttribute("openId") String openId, @PathVariable("id") int id, String state) {
		teacherService.operatePreSeller(openId, id, state);
		return BaseRes.buildSuccess(null);
	}
	
	@DeleteMapping("/join/info/{id}")
	public @ResponseBody BaseRes<Object> deleteJoin(@RequestAttribute("openId") String openId, @PathVariable("id") int id) {
		int count = preSellerService.deleteByPriKey(id);
		NbsUtils.assertExist(count, "the deleted preseller not exist, id:{}", id);
		return BaseRes.buildSuccess(null);
	}
	
	@GetMapping("/info/{id}")
	public ModelAndView sellerInfo(@PathVariable("id") int id) {
		Seller seller = sellerService.selectByPriKey(id);
		NbsUtils.assertNull(seller, "seller {} not found", id);
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/info");
		mv.addObject("info", seller);

		if(StringUtils.isNotBlank(seller.getOpenId())) {
			User user = userService.queryByOpenId(seller.getOpenId());
			seller.setUser(user);
		}
		if(seller.getParentId() != null && seller.getParentId().intValue() != 0) {
			Seller parentSeller = sellerService.selectByPriKey(seller.getParentId());
			if(parentSeller != null) {
				mv.addObject("parent", parentSeller);
			}
		}
		mv.addObject("createdTime", seller.getCreatedTime().format(FORMAT));
		if(seller.getLevel() != 3) {
			List<Seller> childrenSellers = sellerService.queryChildrenSellers(seller.getId());
			if(!childrenSellers.isEmpty()) {
				mv.addObject("childrenSellers", childrenSellers);
			}
		}
		
		return mv;
	}

	@PutMapping("/info/{id}")
	public @ResponseBody BaseRes<Seller> sellerInfo(@PathVariable("id") int id, Seller info) {
		Seller seller = sellerService.selectByPriKey(id);
		NbsUtils.assertNull(seller, "seller {} not found", id);
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
