package com.nbs.jiaxiao.mapper;


import java.util.List;
import com.nbs.jiaxiao.domain.po.CommisionAccount;
import com.nbs.jiaxiao.domain.vo.PaySellerInfo;


public interface CommisionAccountMapper {
	
	/**
	 * 保存
	 * @param commisionAccount
	 * @return
	 */
	public int insert(CommisionAccount commisionAccount);
	
	/**
	 * 根据主键更新
	 * @param commisionAccount
	 * @return
	 */
	public int updateByPriKey(CommisionAccount commisionAccount);
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(CommisionAccount con);
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id);
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(CommisionAccount con);
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id);

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id);

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public CommisionAccount selectByPriKey(Integer id);
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<CommisionAccount> selectList(CommisionAccount con);
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(CommisionAccount con);
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public Integer exist(CommisionAccount con);
	
	/* customized code start */
	
	public List<PaySellerInfo> queryPayFeeHistory(CommisionAccount con);
	
	/* customized code end */

}