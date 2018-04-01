package com.nbs.jiaxiao.service.db.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.nbs.jiaxiao.domain.po.Dict;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.DictMapper;
import com.nbs.jiaxiao.service.db.DictService;

@Service
public class DictServiceImpl implements DictService{
	
	@Resource
	private DictMapper dictMapper;
	
	/**
	 * 保存
	 * @param dict
	 * @return
	 */
	public int insert(Dict dict){
		return dictMapper.insert(dict);
	}
	
	/**
	 * 根据主键更新
	 * @param dict
	 * @return
	 */
	public void updateByPriKey(Dict dict){
		if(dictMapper.updateByPriKey(dict) != 1) {
			throw new ConcurrentException("并发更新Dict失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Dict con){
		return dictMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return dictMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(Dict con){
		return dictMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return dictMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return dictMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Dict selectByPriKey(Integer id){
		return dictMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Dict> selectList(Dict con){
		return dictMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Dict con){
		return dictMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(Dict con){
		return dictMapper.exist(con) != null;
	}

}
