package com.nbs.jiaxiao.service.biz.impl;

import java.math.BigDecimal;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.CommissionType;
import com.nbs.jiaxiao.constant.DictType;
import com.nbs.jiaxiao.constant.FeeType;
import com.nbs.jiaxiao.constant.PayType;
import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.constant.State;
import com.nbs.jiaxiao.constant.Status;
import com.nbs.jiaxiao.controller.TeacherController;
import com.nbs.jiaxiao.domain.po.CommisionFee;
import com.nbs.jiaxiao.domain.po.Dict;
import com.nbs.jiaxiao.domain.po.Fee;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.Commissions;
import com.nbs.jiaxiao.domain.vo.PreSellerInfo;
import com.nbs.jiaxiao.exception.InvalidParamException;
import com.nbs.jiaxiao.service.biz.TeacherBizService;
import com.nbs.jiaxiao.service.db.CommisionFeeService;
import com.nbs.jiaxiao.service.db.DictService;
import com.nbs.jiaxiao.service.db.FeeService;
import com.nbs.jiaxiao.service.db.PreSellerService;
import com.nbs.jiaxiao.service.db.SellerService;
import com.nbs.jiaxiao.service.db.StudentService;

@Service
public class TeacherBizServiceImpl implements TeacherBizService{
	private static final Logger LOGGER = LoggerFactory.getLogger(TeacherController.class);

	@Resource
	private StudentService studentService;
	
	@Resource
	private FeeService feeService;
	
	@Resource
	private DictService dictService;
	
	@Resource
	private SellerService sellerService;
	
	@Resource
	private PreSellerService preSellerService;
	
	@Resource
	private CommisionFeeService commisionFeeService;
	
	@Transactional
	@Override
	public Student addStudent(String opeOpenId, Student student, Double payFee) {
		payFee = payFee == null ? 0.0d : payFee;
		student.setLastUpdateNoUserId(opeOpenId);
		student.setStage(Stage.STAGE_1.getCode());
		student.setIsArrearage(student.getTotalFee().doubleValue() > payFee); //是否欠费
		student.setExamDate(student.getSignDate());
		studentService.insert(student);
		if(payFee != null && payFee.doubleValue() != 0.0d) {
			Fee fee = new Fee();
			fee.setUserId(student.getId());
			fee.setMoney(BigDecimal.valueOf(payFee));
			fee.setType(FeeType.TUITION.getCode());
			fee.setPayType(PayType.SIGN.getCode());
			fee.setPayDate(student.getSignDate());
			fee.setRemark("学员登记录入");
			fee.setLastUpdateNoUserId(opeOpenId);
			feeService.insert(fee);
		}
		
		if(student.getSellerId() != null && student.getSellerId().intValue() != 0) {
			addCommisionFee(opeOpenId, student.getId(), student.getSellerId());	
		}
		return student;
	}
	
	private void addCommisionFee(String opeOpenId, Integer studentId, Integer sellerId) {
		Seller seller = sellerService.selectByPriKey(sellerId);
		NbsUtils.assertNotNull(seller, "sign student the seller {0} not exist", sellerId);
		if(!seller.isValid()) {
			LOGGER.warn("sign student the seller {} is invalid", seller.getId());
			return;
		}
		Map<String, Dict> commissionsMap = queryCommission();
		if(seller.getLevel() == 1) {
			CommisionFee commisionFee = build(opeOpenId, studentId, sellerId, seller.getId(), CommissionType.TYPE_1_1, commissionsMap);
			commisionFeeService.insert(commisionFee);
		} else if(seller.getLevel() == 2) {
			CommisionFee commisionFee = build(opeOpenId, studentId, sellerId, seller.getId(), CommissionType.TYPE_2_2, commissionsMap);
			commisionFeeService.insert(commisionFee);
			Seller seller21 =  sellerService.selectByPriKey(seller.getParentId());
			if(!seller21.isValid()) {
				LOGGER.warn("sign student the seller21 {} is invalid", seller.getParentId());
				return;
			}
			CommisionFee commisionFee21 = build(opeOpenId, studentId, sellerId, seller21.getId(), CommissionType.TYPE_2_1, commissionsMap);
			commisionFeeService.insert(commisionFee21);
		} else {
			CommisionFee commisionFee = build(opeOpenId, studentId, sellerId, seller.getId(), CommissionType.TYPE_3_3, commissionsMap);
			commisionFeeService.insert(commisionFee);
			
			Seller seller32 =  sellerService.selectByPriKey(seller.getParentId());
			if(!seller32.isValid()) {
				LOGGER.warn("sign student the seller32 {} is invalid", seller.getParentId());
				return;
			}
			CommisionFee commisionFee32 = build(opeOpenId, studentId, sellerId, seller32.getId(), CommissionType.TYPE_3_2, commissionsMap);
			commisionFeeService.insert(commisionFee32);
			
			
			Seller seller31 =  sellerService.selectByPriKey(seller32.getParentId());
			if(!seller31.isValid()) {
				LOGGER.warn("sign student the seller31 {} is invalid", seller32.getParentId());
				return;
			}
			CommisionFee commisionFee31 = build(opeOpenId, studentId, sellerId, seller31.getId(), CommissionType.TYPE_3_1, commissionsMap);
			commisionFeeService.insert(commisionFee31);
		}
	}
	
	private CommisionFee build(String opeOpenId, Integer studentId, Integer topSellerId, Integer sellerId, CommissionType type, Map<String, Dict> commissionsMap) {
		CommisionFee commisionFee = new CommisionFee();
		commisionFee.setStudentId(studentId);
		commisionFee.setTopSellerId(topSellerId);
		commisionFee.setSellerId(sellerId);
		BigDecimal money = new BigDecimal(commissionsMap.get(type.getCode()).getValue());
		commisionFee.setMoney(money);
		commisionFee.setStatus(CommisionFee.NOT_PAY);
		commisionFee.setLastUpdateNoUserId(opeOpenId);
		return commisionFee;
	}
	
	@Override
	public Student queryStudent(String username, String mobile) {
		Student con = new Student();
		con.setUsername(username);
		con.setMobile(mobile);
		List<Student> lst = studentService.selectList(con);
		return lst.isEmpty() ? null : lst.get(0);
	} 
	
	@Override
	public Student queryStudent(Integer id) {
		return studentService.selectByPriKey(id);
	}

	@Transactional
	@Override
	public Seller addSeller(String opeOpenId, Seller seller) {
		seller.setLastUpdateNoUserId(opeOpenId);
		seller.setStatus(Status.VALID.getCode());
		seller.setType(Seller.SIGN_TYPE);
		if(seller.getParentId() != null && seller.getParentId() != 0) {
			Seller parentSeller =  sellerService.selectByPriKey(seller.getParentId());
			seller.setLevel(parentSeller.getLevel() + 1);
		} else {
			seller.setLevel(1);
			seller.setParentId(0);
		}
		sellerService.insert(seller);
		return seller;
	}
	
	
	
	
	
	
	
	
	@Override
	public void updateCommission(String openId, Commissions commissions) {
		Map<String, Dict> commissionsMap = queryCommission();
		if(commissions.getCommission11() != null) {
			Dict dict = commissionsMap.get(CommissionType.TYPE_1_1.getCode());
			dict.setValue(commissions.getCommission11().toString());
			dict.setLastUpdateNoUserId(openId);
			dictService.updateByPriKey(dict);
		}
		
		if(commissions.getCommission21() != null) {
			Dict dict = commissionsMap.get(CommissionType.TYPE_2_1.getCode());
			dict.setValue(commissions.getCommission21().toString());
			dict.setLastUpdateNoUserId(openId);
			dictService.updateByPriKey(dict);
		}
		
		if(commissions.getCommission22() != null) {
			Dict dict = commissionsMap.get(CommissionType.TYPE_2_2.getCode());
			dict.setValue(commissions.getCommission22().toString());
			dict.setLastUpdateNoUserId(openId);
			dictService.updateByPriKey(dict);
		}
		
		if(commissions.getCommission31() != null) {
			Dict dict = commissionsMap.get(CommissionType.TYPE_3_1.getCode());
			dict.setValue(commissions.getCommission31().toString());
			dict.setLastUpdateNoUserId(openId);
			dictService.updateByPriKey(dict);
		}
		
		if(commissions.getCommission32() != null) {
			Dict dict = commissionsMap.get(CommissionType.TYPE_3_2.getCode());
			dict.setValue(commissions.getCommission32().toString());
			dict.setLastUpdateNoUserId(openId);
			dictService.updateByPriKey(dict);
		}
		
		if(commissions.getCommission33() != null) {
			Dict dict = commissionsMap.get(CommissionType.TYPE_3_3.getCode());
			dict.setValue(commissions.getCommission33().toString());
			dict.setLastUpdateNoUserId(openId);
			dictService.updateByPriKey(dict);
		}
	}
	
	@Override
	public Map<String, Dict> queryCommission() {
		List<Dict> commissionLst = queryDictByType(DictType.COMMISSION.getCode());
		return commissionLst.stream().collect(Collectors.toMap(Dict::getCode, dict -> dict));
	}
	
	private List<Dict> queryDictByType(String type) {
		Dict dict = new Dict();
		dict.setType(type);
		return dictService.selectList(dict);
	}
	
	@Override
	public Map<String, List<PreSellerInfo>> queryRecent() {
		Map<String, List<PreSellerInfo>> map = new HashMap<String, List<PreSellerInfo>>();
		LocalDateTime localDateTime = LocalDate.now().minusDays(2).atStartOfDay();
		List<PreSellerInfo> recentInfos = preSellerService.selectRecentInfos();
		List<PreSellerInfo> recentLst = recentInfos.stream().filter(sellerInfo -> sellerInfo.getCreatedTime().compareTo(localDateTime) >= 0).collect(Collectors.toList());
		List<PreSellerInfo> beforeLst = recentInfos.stream().filter(sellerInfo -> sellerInfo.getCreatedTime().compareTo(localDateTime) < 0).collect(Collectors.toList());
		map.put("recentLst", recentLst);
		map.put("beforeLst", beforeLst);
		return map;
	}
	
	@Transactional
	@Override
	public BaseRes<Object> operatePreSeller(String openId, int id, String state) {
		PreSeller preSeller = preSellerService.selectByPriKey(id);
		NbsUtils.assertNotNull(preSeller, "the preseller {0} not exisd", id);
		if(State.REJECTED.getCode().equals(state)) {
			preSeller.setState(state);
		} else if(State.HANDLED.getCode().equals(state)) {
			if(sellerService.querySeller(preSeller.getUsername(), preSeller.getMobile()) != null) {
				return BaseRes.build("-1", "该用户已是销售员");
			}
			if(sellerService.querySeller(preSeller.getOpenId()) != null) {
				return BaseRes.build("-1", "该用户微信号已关联其它销售员");
			}
			
			Seller seller = new Seller();
			seller.setLastUpdateNoUserId(openId);
			seller.setLevel(preSeller.getLevel());
			seller.setMobile(preSeller.getMobile());
			seller.setOpenId(preSeller.getOpenId());
			seller.setParentId(preSeller.getParentId());
			seller.setStatus(Status.VALID.getCode());
			seller.setType(Seller.APPLY_TYPE);
			seller.setUsername(preSeller.getUsername());
			preSeller.setState(state);
			sellerService.insert(seller);
		} else {
			throw new InvalidParamException("joinStateChange bad state:" + state);
		}
		preSellerService.updateByPriKey(preSeller);
		return BaseRes.buildSuccess(null);
	}
	
	
	@Transactional
	@Override
	public void init() {
		Dict dict = new Dict();
		dict.setType(DictType.TYPE.getCode());
		dict.setCode(DictType.COMMISSION.getCode());
		dict.setValue("分销员佣金");
		dictService.insert(dict);
		
		Dict dict1 = new Dict();
		dict1.setType(DictType.COMMISSION.getCode());
		dict1.setCode(CommissionType.TYPE_1_1.getCode());
		dict1.setValue("100");
		dictService.insert(dict1);
		
		Dict dict2 = new Dict();
		dict2.setType(DictType.COMMISSION.getCode());
		dict2.setCode(CommissionType.TYPE_2_1.getCode());
		dict2.setValue("30");
		dictService.insert(dict2);
		
		Dict dict3 = new Dict();
		dict3.setType(DictType.COMMISSION.getCode());
		dict3.setCode(CommissionType.TYPE_2_2.getCode());
		dict3.setValue("70");
		dictService.insert(dict3);
		
		Dict dict4 = new Dict();
		dict4.setType(DictType.COMMISSION.getCode());
		dict4.setCode(CommissionType.TYPE_3_1.getCode());
		dict4.setValue("20");
		dictService.insert(dict4);
		
		Dict dict5 = new Dict();
		dict5.setType(DictType.COMMISSION.getCode());
		dict5.setCode(CommissionType.TYPE_3_2.getCode());
		dict5.setValue("30");
		dictService.insert(dict5);
		
		Dict dict6 = new Dict();
		dict6.setType(DictType.COMMISSION.getCode());
		dict6.setCode(CommissionType.TYPE_3_3.getCode());
		dict6.setValue("50");
		dictService.insert(dict6);
		
	}
}
