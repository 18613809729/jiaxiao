package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.nbs.jiaxiao.domain.po.CommisionFee;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.CommisionFeeMapper;
import com.nbs.jiaxiao.service.db.CommisionFeeService;


@Service
public class CommisionFeeServiceImpl implements CommisionFeeService{
	
	@Resource
	private CommisionFeeMapper commisionFeeMapper;
	
	/**
	 * 保存
	 * @param commisionFee
	 * @return
	 */
	public int insert(CommisionFee commisionFee){
		return commisionFeeMapper.insert(commisionFee);
	}
	
	/**
	 * 根据主键更新
	 * @param commisionFee
	 * @return
	 */
	public void updateByPriKey(CommisionFee commisionFee){
		if(commisionFeeMapper.updateByPriKey(commisionFee) != 1) {
			throw new ConcurrentException("并发更新CommisionFee失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(CommisionFee con){
		return commisionFeeMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return commisionFeeMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(CommisionFee con){
		return commisionFeeMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return commisionFeeMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return commisionFeeMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public CommisionFee selectByPriKey(Integer id){
		return commisionFeeMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<CommisionFee> selectList(CommisionFee con){
		return commisionFeeMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(CommisionFee con){
		return commisionFeeMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(CommisionFee con){
		return commisionFeeMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	/* customized code end */

}
