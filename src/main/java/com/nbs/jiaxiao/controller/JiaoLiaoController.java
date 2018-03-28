package com.nbs.jiaxiao.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.wx.WxComponent;

@Controller
@RequestMapping("/jl")
public class JiaoLiaoController {
	
	@Autowired
	private WxComponent wxComponent;
	
	@RequestMapping("/xyIndex")
	public ModelAndView xyIndex() {
		return new ModelAndView("jl/xueyuan");
	}
	
	@RequestMapping("/getToken")
	public @ResponseBody String getToken() {
		return wxComponent.getAccessToken();
	} 

}
