package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import javax.annotation.Resource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.nbs.jiaxiao.constant.State;
import com.nbs.jiaxiao.domain.po.PreSeller;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.vo.PreSellerInfo;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.PreSellerMapper;
import com.nbs.jiaxiao.service.db.PreSellerService;
import com.nbs.jiaxiao.service.db.SellerService;


@Service
public class PreSellerServiceImpl implements PreSellerService{
	
	@Resource
	private PreSellerMapper preSellerMapper;
	
	/**
	 * 保存
	 * @param preSeller
	 * @return
	 */
	public int insert(PreSeller preSeller){
		return preSellerMapper.insert(preSeller);
	}
	
	/**
	 * 根据主键更新
	 * @param preSeller
	 * @return
	 */
	public void updateByPriKey(PreSeller preSeller){
		if(preSellerMapper.updateByPriKey(preSeller) != 1) {
			throw new ConcurrentException("并发更新PreSeller失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(PreSeller con){
		return preSellerMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return preSellerMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(PreSeller con){
		return preSellerMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return preSellerMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return preSellerMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public PreSeller selectByPriKey(Integer id){
		return preSellerMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<PreSeller> selectList(PreSeller con){
		return preSellerMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(PreSeller con){
		return preSellerMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(PreSeller con){
		return preSellerMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	@Override
	public PreSeller queryPreSeller(String username, String mobile) {
		PreSeller con = new PreSeller();
		con.setUsername(username);
		con.setMobile(mobile);
		List<PreSeller> lst = selectList(con);
		return lst.isEmpty() ? null : lst.get(0);
	}
	
	@Autowired
	private SellerService sellerService;
	
	
	@Override
	public PreSeller addPreSeller(String opeOpenId, PreSeller preSeller) {
		preSeller.setOpenId(opeOpenId);
		preSeller.setLastUpdateNoUserId(opeOpenId);
		preSeller.setState(State.UN_READ.getCode());
		if(preSeller.getParentId() != null && preSeller.getParentId() != 0) {
			Seller parentSeller =  sellerService.selectByPriKey(preSeller.getParentId());
			preSeller.setLevel(parentSeller.getLevel() + 1);
		} else {
			preSeller.setLevel(1);
			preSeller.setParentId(0);
		}
		insert(preSeller);
		return preSeller;
	}
	
	@Override
	public List<PreSellerInfo> selectRecentInfos(){
		return preSellerMapper.selectRecentInfos();
	}
	
	/* customized code end */

}
