package com.nbs.jiaxiao.service.db.impl;


import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.nbs.jiaxiao.constant.Status;
import com.nbs.jiaxiao.domain.po.Seller;
import com.nbs.jiaxiao.domain.vo.SellerInfo;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.SellerMapper;
import com.nbs.jiaxiao.service.db.SellerService;


@Service
public class SellerServiceImpl implements SellerService{
	
	@Resource
	private SellerMapper sellerMapper;
	
	/**
	 * 保存
	 * @param seller
	 * @return
	 */
	public int insert(Seller seller){
		return sellerMapper.insert(seller);
	}
	
	/**
	 * 根据主键更新
	 * @param seller
	 * @return
	 */
	public void updateByPriKey(Seller seller){
		if(sellerMapper.updateByPriKey(seller) != 1) {
			throw new ConcurrentException("并发更新Seller失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Seller con){
		return sellerMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return sellerMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(Seller con){
		return sellerMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return sellerMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return sellerMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Seller selectByPriKey(Integer id){
		return sellerMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Seller> selectList(Seller con){
		return sellerMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Seller con){
		return sellerMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(Seller con){
		return sellerMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	@Override
	public Seller queryParentSeller(Integer parentId) {
		if(parentId == null) {
			return null;
		}
		Seller seller = selectByPriKey(parentId);
		if(seller != null && seller.isValid() && seller.canParent()) {
			return seller;
		}
		return null;
	}
	
	public Seller queryValidSeller(Integer id) {
		Seller seller = selectByPriKey(id);
		if(seller != null && seller.isValid()) {
			return seller;
		}
		return null;
	}
	
	@Override
	public List<Seller> queryAllValidSellers(){
		Seller seller = new Seller();
		seller.setStatus(Status.VALID.getCode());
		return selectList(seller);
	}
	
	@Override
	public List<Seller> queryAllValidParentSellers(){
		return queryAllValidSellers().stream().filter(seller -> seller.canParent()).collect(Collectors.toList());
	}
	
	@Override
	public Seller querySeller(String username, String mobile) {
		Seller con = new Seller();
		con.setUsername(username);
		con.setMobile(mobile);
		List<Seller> lst = selectList(con);
		return lst.isEmpty() ? null : lst.get(0);
	}
	
	@Override
	public Seller querySeller(String openId) {
		Seller con = new Seller();
		con.setOpenId(openId);
		List<Seller> lst = selectList(con);
		return lst.isEmpty() ? null : lst.get(0);
	}
	
	@Override
	public List<Seller> queryChildrenSellers(Integer parentId) {
		Seller con = new Seller();
		con.setParentId(parentId);
		return selectList(con);
	}
	
	@Override
	public List<SellerInfo> selectAllInfo() {
		return sellerMapper.selectAllInfo();
	}
	
	@Override
	public List<SellerInfo> queryNotPayFeeSumInfo() {
		return sellerMapper.queryNotPayFeeSumInfo();
	}
	
	@Override
	public long queryCount(int level) {
		Seller con = new Seller();
		con.setLevel(level);
		con.setStatus(Status.VALID.getCode());
		return sellerMapper.selectCount(con);
	}
	/* customized code end */

}
