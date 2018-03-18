package com.nbs.jiaoxiao.service.db;

import java.util.List;

import com.nbs.jiaoxiao.domain.po.UserInfo;

public interface UserInfoService {
	/**
	 * 保存
	 * @param userInfo
	 * @return
	 */
	public int insert(UserInfo userInfo);
	
	/**
	 * 根据主键更新
	 * @param userInfo
	 * @return
	 */
	public int updateByPriKey(UserInfo userInfo);
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(UserInfo con);
	
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
	public int deleteActual(UserInfo con);
	
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
	public UserInfo selectByPriKey(Integer id);
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<UserInfo> selectList(UserInfo con);
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(UserInfo con);
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(UserInfo con);
}
