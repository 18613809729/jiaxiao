package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.nbs.jiaxiao.domain.po.CommisionAccount;
import com.nbs.jiaxiao.domain.vo.PaySellerInfo;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.CommisionAccountMapper;
import com.nbs.jiaxiao.service.db.CommisionAccountService;


@Service
public class CommisionAccountServiceImpl implements CommisionAccountService{
	
	@Resource
	private CommisionAccountMapper commisionAccountMapper;
	
	/**
	 * 保存
	 * @param commisionAccount
	 * @return
	 */
	public int insert(CommisionAccount commisionAccount){
		return commisionAccountMapper.insert(commisionAccount);
	}
	
	/**
	 * 根据主键更新
	 * @param commisionAccount
	 * @return
	 */
	public void updateByPriKey(CommisionAccount commisionAccount){
		if(commisionAccountMapper.updateByPriKey(commisionAccount) != 1) {
			throw new ConcurrentException("并发更新CommisionAccount失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(CommisionAccount con){
		return commisionAccountMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return commisionAccountMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(CommisionAccount con){
		return commisionAccountMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return commisionAccountMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return commisionAccountMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public CommisionAccount selectByPriKey(Integer id){
		return commisionAccountMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<CommisionAccount> selectList(CommisionAccount con){
		return commisionAccountMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(CommisionAccount con){
		return commisionAccountMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(CommisionAccount con){
		return commisionAccountMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	@Override
	public List<PaySellerInfo> queryPayFeeHistory(Integer offset){
		CommisionAccount con = new CommisionAccount();
		con.getParam().appointOffset( offset == null  ? 0 : offset).appointLimit(30);
		return commisionAccountMapper.queryPayFeeHistory(con);
	}
	
	@Override
	public List<PaySellerInfo> queryPayFeeHistory(Integer sellerId, Integer offset){
		CommisionAccount con = new CommisionAccount();
		con.setSellerId(sellerId);
		con.getParam().appointOffset( offset == null  ? 0 : offset).appointLimit(30);
		return commisionAccountMapper.queryPayFeeHistory(con);
	}
	
	
	@Override
	public List<PaySellerInfo> queryAllPayFeeHistory(Integer sellerId){
		CommisionAccount con = new CommisionAccount();
		con.setSellerId(sellerId);
		con.getParam().appointOffset(0).appointLimit(30000);
		return commisionAccountMapper.queryPayFeeHistory(con);
	}
 
	/* customized code end */

}
