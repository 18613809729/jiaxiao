package com.nbs.jiaxiao.controller;

import java.math.BigDecimal;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.domain.po.CommisionAccount;
import com.nbs.jiaxiao.domain.po.CommisionFee;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.CommisionFeeInfo;
import com.nbs.jiaxiao.domain.vo.SellerInfo;
import com.nbs.jiaxiao.exception.NotFoundException;
import com.nbs.jiaxiao.service.db.CommisionAccountService;
import com.nbs.jiaxiao.service.db.CommisionFeeService;
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
	
	@Autowired
	private CommisionAccountService commisionAccountService;
	
	@Autowired
	private CommisionFeeService commisionFeeService;
	
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
	
	@GetMapping("/children")
	public ModelAndView children(@RequestAttribute("openId") String openId) {
		Seller seller = sellerService.querySeller(openId);
		if(seller == null) {
			return new ModelAndView("redirect:/seller/index");
		}
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/children");
		mv.addObject("seller", seller);
		if(seller.getLevel().intValue() == 3) {
			throw new NotFoundException("the seller is 3 level, id:" + seller.getId());
		}
		
		List<Seller> childrenSellers = sellerService.queryChildrenSellers(seller.getId());
		childrenSellers.forEach(child -> {
			if(child.getLevel().intValue() == 2) {
				child.setChildren(sellerService.queryChildrenSellers(child.getId()));
			}
		});
		mv.addObject("childrenSellers", childrenSellers);
		return mv;
	}
	
	@GetMapping("/pay/fee")
	public ModelAndView payFee(@RequestAttribute("openId") String openId) {
		Seller seller = sellerService.querySeller(openId);
		if(seller == null) {
			return new ModelAndView("redirect:/seller/index");
		}
		
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/payFee");
		mv.addObject("payFeeLst", commisionAccountService.queryAllPayFeeHistory(seller.getId()));
		return mv;
	}
	
	@GetMapping("/pay/fee/detail/{id}")
	public ModelAndView payFeeDetail(@RequestAttribute("openId") String openId, @PathVariable("id") Integer id) {
		CommisionAccount account = commisionAccountService.selectByPriKey(id);
		NbsUtils.assertNotNull(account, "CommisionAccount {0} not exist", id);
		Seller seller = sellerService.selectByPriKey(account.getSellerId());
		if(seller == null || !openId.equals(seller.getOpenId())) {
			throw new NotFoundException("seller is null or no match");
		}
		
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/payFeeDetail");
		mv.addObject("info", seller);
		mv.addObject("feeList", commisionFeeService.queryPayCommisionFeeInfo(id));
		mv.addObject("feeSum", account.getTotalMoney());
		return mv;
	}
	
	@GetMapping("/fee/record")
	public ModelAndView feeRecord(@RequestAttribute("openId") String openId) {
		Seller seller = sellerService.querySeller(openId);
		if(seller == null) {
			return new ModelAndView("redirect:/seller/index");
		}
		List<CommisionFeeInfo> feeList = commisionFeeService.queryCommisionFeeInfo(seller.getId());
		BigDecimal feeSum = new BigDecimal(0);
		BigDecimal paySum = new BigDecimal(0);
		for (CommisionFeeInfo commisionFeeInfo : feeList) {
			feeSum = feeSum.add(commisionFeeInfo.getMoney());
			if(CommisionFee.HAS_PAY.equals(commisionFeeInfo.getStatus())) {
				paySum = paySum.add(commisionFeeInfo.getMoney());
			}
		}
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/feeRecord");
		mv.addObject("feeList", feeList);
		mv.addObject("info", seller);
		mv.addObject("feeSum", feeSum);
		mv.addObject("paySum", paySum);
		return mv;
	}
	
	@GetMapping("/order")
	public ModelAndView order(@RequestAttribute("openId") String openId) {
		Seller seller = sellerService.querySeller(openId);
		if(seller == null) {
			return new ModelAndView("redirect:/seller/index");
		}
		List<CommisionFeeInfo> feeList = commisionFeeService.queryCommisionFeeInfo(seller.getId());
		feeList.removeIf(fee -> fee.getTopSellerId().intValue() != seller.getId());
		ModelAndView mv = new ModelAndView(FTL_PREFIX + "/order");
		mv.addObject("feeList", feeList);
		mv.addObject("info", seller);
		return mv;
	}
}
