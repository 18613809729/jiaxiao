package com.nbs.jiaxiao.service.db.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.domain.po.Content;
import com.nbs.jiaxiao.domain.vo.IndexContent;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.ContentMapper;
import com.nbs.jiaxiao.service.db.ContentService;


@Service
public class ContentServiceImpl implements ContentService{
	
	@Resource
	private ContentMapper contentMapper;
	
	/**
	 * 保存
	 * @param content
	 * @return
	 */
	public int insert(Content content){
		return contentMapper.insert(content);
	}
	
	/**
	 * 根据主键更新
	 * @param content
	 * @return
	 */
	public void updateByPriKey(Content content){
		if(contentMapper.updateByPriKey(content) != 1) {
			throw new ConcurrentException("并发更新Content失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Content con){
		return contentMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return contentMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(Content con){
		return contentMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return contentMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return contentMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Content selectByPriKey(Integer id){
		return contentMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Content> selectList(Content con){
		return contentMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Content con){
		return contentMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(Content con){
		return contentMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	public String getByKey(String key) {
		Content content = getContentByKey(key);
		return content == null ? "" : content.getInfo();
	}
	
	private Content getContentByKey(String key) {
		Content con = new Content();
		con.setKeyId(key);
		return NbsUtils.getFirst(selectList(con));
	}
	
	@Override
	@Transactional
	public void saveOrUpdateIndex(String opeOpenId, IndexContent indexContent) {
		Content sytdjj = getContentByKey("sytdjj");
		if(sytdjj != null) {
			sytdjj.setInfo(indexContent.getSytdjj());
			sytdjj.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(sytdjj);
		} else {
			sytdjj = new Content("sytdjj", indexContent.getSytdjj());
			sytdjj.setLastUpdateNoUserId(opeOpenId);
			insert(sytdjj);
		}
		
		
		Content syzsts = getContentByKey("syzsts");
		if(syzsts != null) {
			syzsts.setInfo(indexContent.getSyzsts());
			syzsts.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(syzsts);
		} else {
			syzsts = new Content("syzsts", indexContent.getSyzsts());
			syzsts.setLastUpdateNoUserId(opeOpenId);
			insert(syzsts);
		}
		
		Content syglfs = getContentByKey("syglfs");
		if(syglfs != null) {
			syglfs.setInfo(indexContent.getSyglfs());
			syglfs.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(syglfs);
		} else {
			syglfs = new Content("syglfs", indexContent.getSyglfs());
			syglfs.setLastUpdateNoUserId(opeOpenId);
			insert(syglfs);
		}
		
		Content sylxfs = getContentByKey("sylxfs");
		if(sylxfs != null) {
			sylxfs.setInfo(indexContent.getSylxfs());
			sylxfs.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(sylxfs);
		} else {
			sylxfs = new Content("sylxfs", indexContent.getSylxfs());
			sylxfs.setLastUpdateNoUserId(opeOpenId);
			insert(sylxfs);
		}
	}

	/* customized code end */

}
