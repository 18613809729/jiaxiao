package com.nbs.jiaxiao.service.db.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nbs.jiaxiao.domain.po.Fee;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.FeeMapper;
import com.nbs.jiaxiao.service.db.FeeService;

@Service
public class FeeServiceImpl implements FeeService{
	
	@Resource
	private FeeMapper feeMapper;
	
	/**
	 * 保存
	 * @param fee
	 * @return
	 */
	public int insert(Fee fee){
		return feeMapper.insert(fee);
	}
	
	/**
	 * 根据主键更新
	 * @param fee
	 * @return
	 */
	public void updateByPriKey(Fee fee){
		if(feeMapper.updateByPriKey(fee) != 1) {
			throw new ConcurrentException("并发更新Fee失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Fee con){
		return feeMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return feeMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(Fee con){
		return feeMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return feeMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return feeMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Fee selectByPriKey(Integer id){
		return feeMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Fee> selectList(Fee con){
		return feeMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Fee con){
		return feeMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(Fee con){
		return feeMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	/* customized code end */

}
