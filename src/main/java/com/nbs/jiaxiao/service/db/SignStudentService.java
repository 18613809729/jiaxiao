package com.nbs.jiaxiao.service.db;


import java.util.List;
import java.util.Map;
import com.nbs.jiaxiao.domain.po.SignStudent;
import com.nbs.jiaxiao.domain.vo.SignStudentInfo;


public interface SignStudentService {
	
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
	public void updateByPriKey(SignStudent signStudent);
	
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
	public boolean exist(SignStudent con);
	
	/* customized code start */
	
	SignStudent queryByKey(String username, String mobile);

	long queryUnReadCount();

	Map<String, List<SignStudentInfo>> queryRecent();

	SignStudent queryByOpenId(String openId);

	
	/* customized code end */

}
