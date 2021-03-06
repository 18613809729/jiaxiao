package com.nbs.jiaxiao.mapper;


import java.util.List;
import com.nbs.jiaxiao.domain.po.CommisionFee;
import com.nbs.jiaxiao.domain.vo.CommisionFeeInfo;


public interface CommisionFeeMapper {
	
	/**
	 * 保存
	 * @param commisionFee
	 * @return
	 */
	public int insert(CommisionFee commisionFee);
	
	/**
	 * 根据主键更新
	 * @param commisionFee
	 * @return
	 */
	public int updateByPriKey(CommisionFee commisionFee);
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(CommisionFee con);
	
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
	public int deleteActual(CommisionFee con);
	
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
	public CommisionFee selectByPriKey(Integer id);
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<CommisionFee> selectList(CommisionFee con);
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(CommisionFee con);
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public Integer exist(CommisionFee con);
	
	/* customized code start */
	
	public List<CommisionFeeInfo>  queryCommisionFeeInfo(Integer sellerId);
	
	public List<CommisionFeeInfo>  queryPayCommisionFeeInfo(Integer payId);
	
	/* customized code end */

}
