package com.nbs.jiaxiao.controller;

import java.math.BigDecimal;
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

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.constant.State;
import com.nbs.jiaxiao.constant.Status;
import com.nbs.jiaxiao.domain.po.CommisionAccount;
import com.nbs.jiaxiao.domain.po.CommisionFee;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.CommisionFeeInfo;
import com.nbs.jiaxiao.domain.vo.Commissions;
import com.nbs.jiaxiao.domain.vo.PaySellerInfo;
import com.nbs.jiaxiao.domain.vo.PreSellerInfo;
import com.nbs.jiaxiao.domain.vo.SellerInfo;
import com.nbs.jiaxiao.service.biz.TeacherBizService;
import com.nbs.jiaxiao.service.db.CommisionAccountService;
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
	
	@Autowired
	private CommisionAccountService commisionAccountService;
	
	@GetMapping("/index")
	public ModelAndView index() {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/index");
		mv.addObject("unReadCount", preSellerService.queryUnReadCount());
		mv.addObject("lv1Count", sellerService.queryCount(1));
		mv.addObject("lv2Count", sellerService.queryCount(2));
		mv.addObject("lv3Count", sellerService.queryCount(3));
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
		NbsUtils.assertNotNull(preSeller, "the preseller {0} not exisd", id);
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
		return teacherService.operatePreSeller(openId, id, state);
	}
	
	@DeleteMapping("/join/info/{id}")
	public @ResponseBody BaseRes<Object> deleteJoin(@RequestAttribute("openId") String openId, @PathVariable("id") int id) {
		int count = preSellerService.deleteByPriKey(id);
		NbsUtils.assertExist(count, "the deleted preseller not exist, id:{0}", id);
		return BaseRes.buildSuccess(null);
	}
	
	@GetMapping("/info/{id}")
	public ModelAndView sellerInfo(@PathVariable("id") int id) {
		Seller seller = sellerService.selectByPriKey(id);
		NbsUtils.assertNotNull(seller, "seller {0} not found", id);
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
		NbsUtils.assertNotNull(seller, "seller {0} not found", id);
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
	
	@GetMapping("/retrieve")
	public ModelAndView retrieve() {
		return new ModelAndView(FTL_PREFIX + "/retrieve");
	} 
	
	@GetMapping("/fee/index")
	public ModelAndView feeIndex() {
		return new ModelAndView(FTL_PREFIX + "/feeIndex");
	} 
	
	@GetMapping("/fee/all.json")
	public @ResponseBody BaseRes<List<SellerInfo>> feeSumInfos() {
		return BaseRes.buildSuccess(sellerService.queryNotPayFeeSumInfo());
	}
	
	@GetMapping("/fee/settle/{id}")
	public ModelAndView feeSettle(@PathVariable("id") int id) {
		Seller seller = sellerService.selectByPriKey(id);
		NbsUtils.assertNotNull(seller, "seller {0} not found", id);
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/feeSettle");
		mv.addObject("info", seller);
		if(StringUtils.isNotBlank(seller.getOpenId())) {
			User user = userService.queryByOpenId(seller.getOpenId());
			seller.setUser(user);
		}
		mv.addObject("feeList", commisionFeeService.queryNotPayCommisionFeeInfo(id));
		return mv;
	} 
	
	@PutMapping("/fee/settle/{id}")
	public @ResponseBody BaseRes<Object> settle(@RequestAttribute("openId") String openId, @PathVariable("id") int id, int[] feeIds) {
		commisionFeeService.settle(openId, id, feeIds);
		return BaseRes.buildSuccess(null);
	}
	
	@GetMapping("/fee/history/index")
	public ModelAndView feeHistory() {
		return new ModelAndView(FTL_PREFIX + "/feeHistory");
	} 
	
	@GetMapping("/fee/history/data.json")
	public @ResponseBody BaseRes<List<PaySellerInfo>> feeHistoryData(Integer offset) {
		return BaseRes.buildSuccess(commisionAccountService.queryPayFeeHistory(offset));
	} 
	
	@GetMapping("/fee/history/detail/{id}")
	public ModelAndView feeHistoryDetail(@PathVariable("id") int id) {
		CommisionAccount account = commisionAccountService.selectByPriKey(id);
		NbsUtils.assertNotNull(account, "CommisionAccount {0} not exist", id);
		Seller seller = sellerService.selectByPriKey(account.getSellerId());
		NbsUtils.assertNotNull(seller, "seller {0} not found", id);
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/feeDetail");
		mv.addObject("info", seller);
		if(StringUtils.isNotBlank(seller.getOpenId())) {
			User user = userService.queryByOpenId(seller.getOpenId());
			seller.setUser(user);
		}
		mv.addObject("feeList", commisionFeeService.queryPayCommisionFeeInfo(id));
		mv.addObject("feeSum", account.getTotalMoney());
		return mv;
	} 
	
	
	@GetMapping("/info/history/fee/paied/{id}")
	public ModelAndView sellerPaiedFee(@PathVariable("id") int id) {
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/sellerFeeHistory");
		mv.addObject("sellerId", id);
		return mv;
	}
	
	@GetMapping("/info/history/fee/paied/{id}/data.json")
	public  @ResponseBody BaseRes<List<PaySellerInfo>> sellerPaiedFeeData(@PathVariable("id") int id, Integer offset) {
		return BaseRes.buildSuccess(commisionAccountService.queryPayFeeHistory(id, offset));
	}
	
	
	@GetMapping("/info/history/fee/{id}")
	public ModelAndView sellerFee(@PathVariable("id") int id) {
		Seller seller = sellerService.selectByPriKey(id);
		NbsUtils.assertNotNull(seller, "seller {0} not found", id);
		if(StringUtils.isNotBlank(seller.getOpenId())) {
			User user = userService.queryByOpenId(seller.getOpenId());
			seller.setUser(user);
		}
		List<CommisionFeeInfo> feeList = commisionFeeService.queryCommisionFeeInfo(id);
		BigDecimal feeSum = new BigDecimal(0);
		BigDecimal paySum = new BigDecimal(0);
		for (CommisionFeeInfo commisionFeeInfo : feeList) {
			feeSum = feeSum.add(commisionFeeInfo.getMoney());
			if(CommisionFee.HAS_PAY.equals(commisionFeeInfo.getStatus())) {
				paySum = paySum.add(commisionFeeInfo.getMoney());
			}
		}
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/sellerFeeRecord");
		mv.addObject("feeList", feeList);
		mv.addObject("info", seller);
		mv.addObject("feeSum", feeSum);
		mv.addObject("paySum", paySum);
		mv.addObject("needPay", feeSum.compareTo(paySum) > 0);
		return mv;
	}
	
	@GetMapping("/info/history/order/{id}")
	public ModelAndView sellerOrder(@PathVariable("id") int id) {
		Seller seller = sellerService.selectByPriKey(id);
		NbsUtils.assertNotNull(seller, "seller {0} not found", id);
		if(StringUtils.isNotBlank(seller.getOpenId())) {
			User user = userService.queryByOpenId(seller.getOpenId());
			seller.setUser(user);
		}
		List<CommisionFeeInfo> feeList = commisionFeeService.queryCommisionFeeInfo(id);
		feeList.removeIf(fee -> fee.getTopSellerId().intValue() != id);
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/sellerFeeOrder");
		mv.addObject("feeList", feeList);
		mv.addObject("info", seller);
		return mv;
	}
	
}
