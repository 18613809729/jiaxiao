package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.domain.po.SignStudent;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.SignStudentMapper;
import com.nbs.jiaxiao.service.db.SignStudentService;


@Service
public class SignStudentServiceImpl implements SignStudentService{
	
	@Resource
	private SignStudentMapper signStudentMapper;
	
	/**
	 * 保存
	 * @param signStudent
	 * @return
	 */
	public int insert(SignStudent signStudent){
		return signStudentMapper.insert(signStudent);
	}
	
	/**
	 * 根据主键更新
	 * @param signStudent
	 * @return
	 */
	public void updateByPriKey(SignStudent signStudent){
		if(signStudentMapper.updateByPriKey(signStudent) != 1) {
			throw new ConcurrentException("并发更新SignStudent失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(SignStudent con){
		return signStudentMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return signStudentMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(SignStudent con){
		return signStudentMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return signStudentMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return signStudentMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public SignStudent selectByPriKey(Integer id){
		return signStudentMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<SignStudent> selectList(SignStudent con){
		return signStudentMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(SignStudent con){
		return signStudentMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(SignStudent con){
		return signStudentMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	@Override
	public SignStudent queryByKey(String username, String mobile){
		SignStudent con = new SignStudent();
		con.setUsername(username);
		con.setMobile(mobile);;
		return NbsUtils.getFirst(signStudentMapper.selectList(con)); 
	}
	
	/* customized code end */

}
