package com.nbs.jiaxiao.mapper;


import java.util.List;
import com.nbs.jiaxiao.domain.po.Train;
import com.nbs.jiaxiao.domain.vo.TrainInfo;


public interface TrainMapper {
	
	/**
	 * 保存
	 * @param train
	 * @return
	 */
	public int insert(Train train);
	
	/**
	 * 根据主键更新
	 * @param train
	 * @return
	 */
	public int updateByPriKey(Train train);
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Train con);
	
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
	public int deleteActual(Train con);
	
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
	public Train selectByPriKey(Integer id);
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Train> selectList(Train con);
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Train con);
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public Integer exist(Train con);
	
	/* customized code start */
	
	public List<TrainInfo> queryInfo(String stage);
	/* customized code end */

}
