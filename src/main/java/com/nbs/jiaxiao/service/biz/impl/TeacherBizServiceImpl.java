package com.nbs.jiaxiao.service.biz.impl;

import java.math.BigDecimal;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nbs.jiaxiao.constant.CommissionType;
import com.nbs.jiaxiao.constant.DictType;
import com.nbs.jiaxiao.constant.FeeType;
import com.nbs.jiaxiao.constant.PayType;
import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.constant.Status;
import com.nbs.jiaxiao.domain.po.Dict;
import com.nbs.jiaxiao.domain.po.Fee;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.vo.Commissions;
import com.nbs.jiaxiao.service.biz.TeacherBizService;
import com.nbs.jiaxiao.service.db.DictService;
import com.nbs.jiaxiao.service.db.FeeService;
import com.nbs.jiaxiao.service.db.SellerService;
import com.nbs.jiaxiao.service.db.StudentService;

@Service
public class TeacherBizServiceImpl implements TeacherBizService{
//	private static final Logger LOGGER = LoggerFactory.getLogger(TeacherController.class);

	@Resource
	private StudentService studentService;
	
	@Resource
	private FeeService feeService;
	
	@Resource
	private DictService dictService;
	
	@Resource
	private SellerService sellerService;
	
	@Transactional
	@Override
	public Student addStudent(String opeOpenId, Student student, double payFee) {
		student.setLastUpdateNoUserId(opeOpenId);
		student.setStage(Stage.STAGE_1.getCode());
		student.setIsArrearage(student.getTotalFee().doubleValue() > payFee); //是否欠费
		studentService.insert(student);
		Fee fee = new Fee();
		fee.setUserId(student.getId());
		fee.setMoney(BigDecimal.valueOf(payFee));
		fee.setType(FeeType.TUITION.getCode());
		fee.setPayType(PayType.SIGN.getCode());
		fee.setPayDate(student.getSignDate());
		fee.setRemark("学员登记录入");
		fee.setLastUpdateNoUserId(opeOpenId);
		feeService.insert(fee);
		return student;
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
	
	/*private Dict queryDictByTypeAndCode(String type, String code) {
		Dict dict = new Dict();
		dict.setType(type);
		dict.setCode(code);
		List<Dict> lst = dictService.selectList(dict);
		return lst.isEmpty() ? null : lst.get(0);
	}*/
	
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
