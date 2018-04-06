package com.nbs.jiaxiao.service.biz;

import java.util.Map;

import com.nbs.jiaxiao.domain.po.Dict;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.vo.Commissions;

public interface TeacherBizService {

	/**
	 * 登记学员
	 * @param opeOpenId 操作人员openId
	 * @param student 学员信息
	 * @param payFee 缴费金额
	 * @return 
	 */
	Student addStudent(String opeOpenId, Student student, double payFee);

	/**
	 * 根据主键查询学员
	 * @param id
	 * @return
	 */
	Student queryStudent(Integer id);

	void init();

	/**
	 * 更新分销员佣金配置
	 * @param openId 操作员
	 * @param commissions 佣金配置
	 */
	void updateCommission(String openId, Commissions commissions);

	/**
	 * 查询分销员佣金配置
	 * @return
	 */
	Map<String, Dict> queryCommission();

	/**
	 * 添加分销员
	 * @param opeOpenId
	 * @param seller
	 * @return
	 */
	Seller addSeller(String opeOpenId, Seller seller);

	/**
	 * 根据姓名和手机号查询
	 * @param username
	 * @param mobile
	 * @return
	 */
	Student queryStudent(String username, String mobile);

}
