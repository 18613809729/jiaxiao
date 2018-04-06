package com.nbs.jiaxiao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.service.db.SellerService;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	public static final String FTL_PREFIX = "seller";
	
	@Autowired
	private SellerService sellerService;
	
	@GetMapping("/all.json")
	public @ResponseBody BaseRes<List<Seller>> sellerAll() {
		return BaseRes.buildSuccess(sellerService.queryAllValidSellers()) ;
	}

	@GetMapping("/parent.json")
	public @ResponseBody BaseRes<List<Seller>> parentSellers() {
		return BaseRes.buildSuccess(sellerService.queryAllValidParentSellers());
	}
	
	@GetMapping("/join")
	public ModelAndView join(Integer parentId) {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/sign");
		mv.addObject("parent", sellerService.queryParentSeller(parentId));
		return mv;
	}

}
