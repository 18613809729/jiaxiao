package com.nbs.jiaxiao.service.db;


import java.util.List;
import com.nbs.jiaxiao.domain.po.ExamInfo;


public interface ExamInfoService {
	
	/**
	 * 保存
	 * @param examInfo
	 * @return
	 */
	public int insert(ExamInfo examInfo);
	
	/**
	 * 根据主键更新
	 * @param examInfo
	 * @return
	 */
	public void updateByPriKey(ExamInfo examInfo);
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(ExamInfo con);
	
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
	public int deleteActual(ExamInfo con);
	
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
	public ExamInfo selectByPriKey(Integer id);
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<ExamInfo> selectList(ExamInfo con);
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(ExamInfo con);
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(ExamInfo con);
	
	/* customized code start */
	
	/* customized code end */

}
