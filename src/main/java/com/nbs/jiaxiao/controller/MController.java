package com.nbs.jiaxiao.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/m")
public class MController {

	@RequestMapping("/index")
	public ModelAndView index() {
		return new ModelAndView("m/index");
	}
}
