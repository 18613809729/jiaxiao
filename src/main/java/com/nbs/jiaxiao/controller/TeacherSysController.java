package com.nbs.jiaxiao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.service.db.SellerService;

@Controller
@RequestMapping("/teacher/sys")
public class TeacherSysController {
	public static final String FTL_PREFIX = "teacher/sys";
	@Autowired
	private SellerService sellerService;

	@GetMapping("/index")
	public ModelAndView index() {
		return new ModelAndView(FTL_PREFIX + "/index");
	}
	
	@GetMapping("/seller/join")
	public ModelAndView join(Integer parentId) {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/sign");
		mv.addObject("parent", sellerService.queryParentSeller(parentId));
		return mv;
	}
}
