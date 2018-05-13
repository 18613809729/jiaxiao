package com.nbs.jiaxiao.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.domain.po.School;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.IndexContent;
import com.nbs.jiaxiao.service.db.ContentService;
import com.nbs.jiaxiao.service.db.SchoolService;

@Controller
@RequestMapping("/teacher/sys")
public class TeacherSysController {
	public static final String FTL_PREFIX = "teacher/sys";

	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private ContentService contentService;
	
	@GetMapping("/index")
	public ModelAndView index() {
		return new ModelAndView(FTL_PREFIX + "/index");
	}
	
	@PostMapping("/school/info")
	public @ResponseBody BaseRes<List<School>> addSchool(@RequestAttribute("openId") String openId, String schoolName){
		NbsUtils.assertNotBlank(schoolName, "schoolName is blank openId:{1}", openId);
		School con = new School();
		con.setName(schoolName);
		List<School> lst = schoolService.selectList(con);
		if(!CollectionUtils.isEmpty(lst)) {
			return BaseRes.build(ResCode.REPEATED.getCode(), schoolName + "已存在");
		}
		School school = new School();
		school.setName(schoolName);
		school.setLastUpdateNoUserId(openId);
		schoolService.insert(school);
		return BaseRes.buildSuccess(schoolService.selectList(new School()));
	}
	
	@GetMapping("/school/all.json")
	public @ResponseBody BaseRes<List<School>> allSchools(){
		System.out.println(schoolService);
		return BaseRes.buildSuccess(schoolService.selectList(new School()));
	}
	

	@GetMapping("/content")
	public ModelAndView indexContent() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/indexContent");
		mv.addObject("sytdjj", contentService.getByKey("sytdjj"));
		mv.addObject("syzsts", contentService.getByKey("syzsts"));
		mv.addObject("syglfs", contentService.getByKey("syglfs"));
		mv.addObject("sylxfs", contentService.getByKey("sylxfs"));
		return mv;
	}
	
	@GetMapping("/content/example")
	public ModelAndView contentExample() {
		return new ModelAndView(FTL_PREFIX + "/contentExample");
	}
	
	@PostMapping("/content")
	public  @ResponseBody BaseRes<Object> updateContent(@RequestAttribute("openId") String openId,IndexContent indexContent) {
		contentService.saveOrUpdateIndex(openId, indexContent);
		return BaseRes.buildSuccess(null);
	}
	
	/*@GetMapping("/content")
	public ModelAndView indexContent() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/indexContent");
		mv.addObject("sytdjj", contentService.getByKey("sytdjj"));
		mv.addObject("syzsts", contentService.getByKey("syzsts"));
		mv.addObject("syglfs", contentService.getByKey("syglfs"));
		mv.addObject("sylxfs", contentService.getByKey("sylxfs"));
		return mv;
	}*/
	
}
