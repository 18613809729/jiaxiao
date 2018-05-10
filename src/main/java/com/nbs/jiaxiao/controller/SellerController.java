package com.nbs.jiaxiao.controller;

import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.SellerInfo;
import com.nbs.jiaxiao.service.db.PreSellerService;
import com.nbs.jiaxiao.service.db.SellerService;
import com.nbs.jiaxiao.service.db.UserService;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	public static final String FTL_PREFIX = "seller";
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private PreSellerService preSellerService;
	
	@Autowired
	private UserService userService;
	
	@GetMapping("/valid.json")
	public @ResponseBody BaseRes<List<Seller>> validSellers() {
		return BaseRes.buildSuccess(sellerService.queryAllValidSellers()) ;
	}

	@GetMapping("/parent.json")
	public @ResponseBody BaseRes<List<Seller>> parentSellers() {
		return BaseRes.buildSuccess(sellerService.queryAllValidParentSellers());
	}
	
	@GetMapping("/all.json")
	public @ResponseBody BaseRes<List<SellerInfo>> allSellers() {
		return BaseRes.buildSuccess(sellerService.selectAllInfo());
	}
	
	@GetMapping("/join")
	public ModelAndView join(Integer parentId) {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/sign");
		mv.addObject("parent", sellerService.queryParentSeller(parentId));
		return mv;
	}

	@PostMapping("/join")
	public @ResponseBody BaseRes<Object> join(@RequestAttribute("openId") String openId, PreSeller preSeller) {
		PreSeller existPreSeller = preSellerService.queryPreSeller(preSeller.getUsername(), preSeller.getMobile());
		if(existPreSeller != null) {
			return BaseRes.build(ResCode.REPEATED, existPreSeller);
		}
		
		Seller seller = sellerService.querySeller(preSeller.getUsername(), preSeller.getMobile());
		if(seller != null) {
			return BaseRes.build(ResCode.HAS_JOIN, seller);
		}
		
		return BaseRes.buildSuccess(preSellerService.addPreSeller(openId, preSeller));
	}
	
	@GetMapping("/link")
	public ModelAndView linkPage() {
		return new ModelAndView(FTL_PREFIX + "/link");
	}
	
	@PostMapping("/link")
	public @ResponseBody BaseRes<Object> link(@RequestAttribute("openId") String openId, Seller con) {
		Seller seller = sellerService.querySeller(con.getUsername(), con.getMobile());
		if(seller == null) {
			return BaseRes.build("-1", "销售员信息不存在");
		}
		if(!StringUtils.isBlank(seller.getOpenId())) {
			return BaseRes.build("-1", "销售员信息已被关联");
		}
		if(sellerService.querySeller(openId) != null) {
			return BaseRes.build("-1", "您的微信号已关联其他身份");
		}
		seller.setOpenId(openId);
		sellerService.updateByPriKey(seller);
		return BaseRes.buildSuccess(null);
	}
	
	
	@GetMapping("/index")
	public ModelAndView index(@RequestAttribute("openId") String openId) {
		Seller seller = sellerService.querySeller(openId);
		if(seller == null) {
			return new ModelAndView(FTL_PREFIX + "/choose");
		}
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/index");
		mv.addObject("info", seller);
		User user = userService.queryByOpenId(seller.getOpenId());
		seller.setUser(user);
		if(seller.getParentId() != null && seller.getParentId().intValue() != 0) {
			Seller parentSeller = sellerService.selectByPriKey(seller.getParentId());
			if(parentSeller != null) {
				mv.addObject("parent", parentSeller);
			}
		}
		
		return mv;
	}
	
}
