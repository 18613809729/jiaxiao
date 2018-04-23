package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.nbs.jiaxiao.domain.po.Exam;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.ExamMapper;
import com.nbs.jiaxiao.service.db.ExamService;


@Service
public class ExamServiceImpl implements ExamService{
	
	@Resource
	private ExamMapper examMapper;
	
	/**
	 * 保存
	 * @param exam
	 * @return
	 */
	public int insert(Exam exam){
		return examMapper.insert(exam);
	}
	
	/**
	 * 根据主键更新
	 * @param exam
	 * @return
	 */
	public void updateByPriKey(Exam exam){
		if(examMapper.updateByPriKey(exam) != 1) {
			throw new ConcurrentException("并发更新Exam失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Exam con){
		return examMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return examMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(Exam con){
		return examMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return examMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return examMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Exam selectByPriKey(Integer id){
		return examMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Exam> selectList(Exam con){
		return examMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Exam con){
		return examMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(Exam con){
		return examMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	/* customized code end */

}
