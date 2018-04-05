package com.nbs.jiaxiao.mapper;

import java.util.List;

import com.nbs.jiaxiao.domain.po.SignStudent;

public interface SignStudentMapper {
	
	/**
	 * 保存
	 * @param signStudent
	 * @return
	 */
	public int insert(SignStudent signStudent);
	
	/**
	 * 根据主键更新
	 * @param signStudent
	 * @return
	 */
	public int updateByPriKey(SignStudent signStudent);
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(SignStudent con);
	
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
	public int deleteActual(SignStudent con);
	
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
	public SignStudent selectByPriKey(Integer id);
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<SignStudent> selectList(SignStudent con);
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(SignStudent con);
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public Integer exist(SignStudent con);
	
	/* customized code start */
	
	/* customized code end */

}
