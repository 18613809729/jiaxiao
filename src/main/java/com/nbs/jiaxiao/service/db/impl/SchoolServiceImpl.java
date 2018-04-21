package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.nbs.jiaxiao.domain.po.School;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.SchoolMapper;
import com.nbs.jiaxiao.service.db.SchoolService;


@Service
public class SchoolServiceImpl implements SchoolService{
	
	@Resource
	private SchoolMapper schoolMapper;
	
	/**
	 * 保存
	 * @param school
	 * @return
	 */
	public int insert(School school){
		return schoolMapper.insert(school);
	}
	
	/**
	 * 根据主键更新
	 * @param school
	 * @return
	 */
	public void updateByPriKey(School school){
		if(schoolMapper.updateByPriKey(school) != 1) {
			throw new ConcurrentException("并发更新School失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(School con){
		return schoolMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return schoolMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(School con){
		return schoolMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return schoolMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return schoolMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public School selectByPriKey(Integer id){
		return schoolMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<School> selectList(School con){
		return schoolMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(School con){
		return schoolMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(School con){
		return schoolMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	/* customized code end */

}
