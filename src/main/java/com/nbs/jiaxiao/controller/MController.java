package com.nbs.jiaxiao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.service.db.ContentService;

@Controller
@RequestMapping("/m")
public class MController {

	@Autowired
	private ContentService contentService;
	
	@RequestMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView("m/index");
		mv.addObject("sytdjj", contentService.getByKey("sytdjj"));
		mv.addObject("syzsts", contentService.getByKey("syzsts"));
		mv.addObject("syglfs", contentService.getByKey("syglfs"));
		mv.addObject("sylxfs", contentService.getByKey("sylxfs"));
		return mv;
	}
}
