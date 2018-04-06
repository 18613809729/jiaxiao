package com.nbs.jiaxiao.service.db;

import java.util.List;

import com.nbs.jiaxiao.domain.po.PreSeller;

public interface PreSellerService {
	
	/**
	 * 保存
	 * @param preSeller
	 * @return
	 */
	public int insert(PreSeller preSeller);
	
	/**
	 * 根据主键更新
	 * @param preSeller
	 * @return
	 */
	public void updateByPriKey(PreSeller preSeller);
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(PreSeller con);
	
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
	public int deleteActual(PreSeller con);
	
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
	public PreSeller selectByPriKey(Integer id);
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<PreSeller> selectList(PreSeller con);
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(PreSeller con);
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(PreSeller con);
	
	/* customized code start */
	
	/**
	 * 查询分销员加盟信息
	 * @param username
	 * @param mobile
	 * @return
	 */
	PreSeller queryPreSeller(String username, String mobile);

	/**
	 * 销售员加盟
	 * @param opeOpenId
	 * @param seller
	 * @return
	 */
	PreSeller addPreSeller(String opeOpenId, PreSeller seller);

	/* customized code end */

}
