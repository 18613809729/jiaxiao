package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.domain.po.User;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.UserMapper;
import com.nbs.jiaxiao.service.db.UserService;


@Service
public class UserServiceImpl implements UserService{
	
	@Resource
	private UserMapper userMapper;
	
	/**
	 * 保存
	 * @param user
	 * @return
	 */
	public int insert(User user){
		return userMapper.insert(user);
	}
	
	/**
	 * 根据主键更新
	 * @param user
	 * @return
	 */
	public void updateByPriKey(User user){
		if(userMapper.updateByPriKey(user) != 1) {
			throw new ConcurrentException("并发更新User失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(User con){
		return userMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return userMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(User con){
		return userMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return userMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return userMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public User selectByPriKey(Integer id){
		return userMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<User> selectList(User con){
		return userMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(User con){
		return userMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(User con){
		return userMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	@Override
	public User queryByOpenId(String openId) {
		User user = new User();
		user.setOpenId(openId);
		return NbsUtils.getFirst(selectList(user));
	}
	
	/* customized code end */

}
