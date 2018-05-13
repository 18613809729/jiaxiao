package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.DictType;
import com.nbs.jiaxiao.domain.po.Dict;
import com.nbs.jiaxiao.domain.vo.ExamInterval;
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
	
	/* customized code start */
	
	@Override
	public Dict queryByTypeAndCode(String type, String code) {
		Dict dict = new Dict();
		dict.setType(type);
		dict.setCode(code);
		return NbsUtils.getFirst(selectList(dict));
	}
	
	@Override
	public List<Dict> queryDictByType(String type) {
		Dict dict = new Dict();
		dict.setType(type);
		return selectList(dict);
	}
	
	@Override
	public Map<String, Dict> queryDictMapByType(String type) {
		return queryDictByType(type).stream().collect(Collectors.toMap(Dict::getCode, dict -> dict));
	}
	
	@Override
	public ExamInterval queryExamInterval() {
		Map<String, Dict> map = queryDictMapByType(DictType.EXAM_INTERVAL.getCode());
		if(map.size() == 0) {
			return null;
		}
		ExamInterval examInterval = new ExamInterval();
		if(map.get(ExamInterval.INTERVAL1) != null) {
			examInterval.setInterval1(Integer.valueOf(map.get(ExamInterval.INTERVAL1).getValue()));
		}
		if(map.get(ExamInterval.INTERVAL20) != null) {
			examInterval.setInterval20(Integer.valueOf(map.get(ExamInterval.INTERVAL20).getValue()));
		}
		if(map.get(ExamInterval.INTERVAL21) != null) {
			examInterval.setInterval21(Integer.valueOf(map.get(ExamInterval.INTERVAL21).getValue()));
		}
		if(map.get(ExamInterval.INTERVAL30) != null) {
			examInterval.setInterval30(Integer.valueOf(map.get(ExamInterval.INTERVAL30).getValue()));
		}
		if(map.get(ExamInterval.INTERVAL31) != null) {
			examInterval.setInterval31(Integer.valueOf(map.get(ExamInterval.INTERVAL31).getValue()));
		}
		if(map.get(ExamInterval.INTERVAL4) != null) {
			examInterval.setInterval4(Integer.valueOf(map.get(ExamInterval.INTERVAL4).getValue()));
		}
		return examInterval;
	}
	
	@Transactional
	@Override
	public void saveOrUpdateExamInterval(String opeOpenId, ExamInterval examInterval) {
		String type = DictType.EXAM_INTERVAL.getCode();
		Dict interval1 = queryByTypeAndCode(type, ExamInterval.INTERVAL1);
		if(interval1 != null) {
			interval1.setValue(String.valueOf(examInterval.getInterval1()));
			interval1.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(interval1);
		} else {
			interval1 = new Dict(type, ExamInterval.INTERVAL1, String.valueOf(examInterval.getInterval1()));
			interval1.setLastUpdateNoUserId(opeOpenId);
			insert(interval1);
		}
		
		
		Dict interval20 = queryByTypeAndCode(type, ExamInterval.INTERVAL20);
		if(interval20 != null) {
			interval20.setValue(String.valueOf(examInterval.getInterval20()));
			interval20.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(interval20);
		} else {
			interval20 = new Dict(type, ExamInterval.INTERVAL20, String.valueOf(examInterval.getInterval20()));
			interval20.setLastUpdateNoUserId(opeOpenId);
			insert(interval20);
		}
		
		Dict interval21 = queryByTypeAndCode(type, ExamInterval.INTERVAL21);
		if(interval21 != null) {
			interval21.setValue(String.valueOf(examInterval.getInterval21()));
			interval21.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(interval21);
		} else {
			interval21 = new Dict(type, ExamInterval.INTERVAL21, String.valueOf(examInterval.getInterval21()));
			interval21.setLastUpdateNoUserId(opeOpenId);
			insert(interval21);
		}
		
		Dict interval30 = queryByTypeAndCode(type, ExamInterval.INTERVAL30);
		if(interval30 != null) {
			interval30.setValue(String.valueOf(examInterval.getInterval30()));
			interval30.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(interval30);
		} else {
			interval30 = new Dict(type, ExamInterval.INTERVAL30, String.valueOf(examInterval.getInterval30()));
			interval30.setLastUpdateNoUserId(opeOpenId);
			insert(interval30);
		}
		
		Dict interval31 = queryByTypeAndCode(type, ExamInterval.INTERVAL31);
		if(interval31 != null) {
			interval31.setValue(String.valueOf(examInterval.getInterval31()));
			interval31.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(interval31);
		} else {
			interval31 = new Dict(type, ExamInterval.INTERVAL31, String.valueOf(examInterval.getInterval31()));
			interval31.setLastUpdateNoUserId(opeOpenId);
			insert(interval31);
		}
		
		Dict interval4 = queryByTypeAndCode(type, ExamInterval.INTERVAL4);
		if(interval4 != null) {
			interval4.setValue(String.valueOf(examInterval.getInterval4()));
			interval4.setLastUpdateNoUserId(opeOpenId);
			updateByPriKey(interval4);
		} else {
			interval4 = new Dict(type, ExamInterval.INTERVAL4, String.valueOf(examInterval.getInterval4()));
			interval4.setLastUpdateNoUserId(opeOpenId);
			insert(interval4);
		}
	}
	
	/* customized code end */

}
