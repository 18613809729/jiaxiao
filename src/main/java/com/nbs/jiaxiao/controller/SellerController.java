package com.nbs.jiaxiao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.service.biz.TeacherBizService;

@Controller
@RequestMapping("/seller")
public class SellerController {
	
	@Autowired
	private TeacherBizService teacherService;
	
	@RequestMapping("/all.json")
	public @ResponseBody List<Seller> sellerAll() {
		return teacherService.queryAllValidSellers();
	}

	@RequestMapping("/parent.json")
	public @ResponseBody List<Seller> parentSellers() {
		return teacherService.queryLevel1AndLevel2Sellers();
	}

}
