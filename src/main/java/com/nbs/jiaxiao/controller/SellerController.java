package com.nbs.jiaxiao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.service.db.PreSellerService;
import com.nbs.jiaxiao.service.db.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	public static final String FTL_PREFIX = "seller";
	
	@Autowired
	private SellerService sellerService;
	
	@Autowired
	private PreSellerService preSellerService;
	
	@GetMapping("/valid.json")
	public @ResponseBody BaseRes<List<Seller>> validSellers() {
		return BaseRes.buildSuccess(sellerService.queryAllValidSellers()) ;
	}

	@GetMapping("/parent.json")
	public @ResponseBody BaseRes<List<Seller>> parentSellers() {
		return BaseRes.buildSuccess(sellerService.queryAllValidParentSellers());
	}
	
	@GetMapping("/all.json")
	public @ResponseBody BaseRes<List<Seller>> allSellers() {
		return BaseRes.buildSuccess(sellerService.selectList(new Seller()));
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
}
