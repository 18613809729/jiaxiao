package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
		examInterval.setInterval1(Integer.valueOf(map.get(ExamInterval.INTERVAL1).getValue()));
		examInterval.setInterval2(Integer.valueOf(map.get(ExamInterval.INTERVAL2).getValue()));
		examInterval.setInterval3(Integer.valueOf(map.get(ExamInterval.INTERVAL3).getValue()));
		examInterval.setInterval4(Integer.valueOf(map.get(ExamInterval.INTERVAL4).getValue()));
		return examInterval;
	}
	
	@Transactional
	@Override
	public void saveOrUpdateExamInterval(String opeOpenId, ExamInterval examInterval) {
		Map<String, Dict> map = queryDictMapByType(DictType.EXAM_INTERVAL.getCode());
		if(map.size() == 0) {
			Dict interval1 = new Dict(DictType.EXAM_INTERVAL.getCode(), ExamInterval.INTERVAL1, String.valueOf(examInterval.getInterval1()));
			Dict interval2 = new Dict(DictType.EXAM_INTERVAL.getCode(), ExamInterval.INTERVAL2, String.valueOf(examInterval.getInterval2()));
			Dict interval3 = new Dict(DictType.EXAM_INTERVAL.getCode(), ExamInterval.INTERVAL3, String.valueOf(examInterval.getInterval3()));
			Dict interval4 = new Dict(DictType.EXAM_INTERVAL.getCode(), ExamInterval.INTERVAL4, String.valueOf(examInterval.getInterval4()));
			interval1.setLastUpdateNoUserId(opeOpenId);
			interval2.setLastUpdateNoUserId(opeOpenId);
			interval3.setLastUpdateNoUserId(opeOpenId);
			interval4.setLastUpdateNoUserId(opeOpenId);
			insert(interval1);
			insert(interval2);
			insert(interval3);
			insert(interval4);
		} else {
			Dict interval1 = map.get(ExamInterval.INTERVAL1);
			interval1.setValue(String.valueOf(examInterval.getInterval1()));
			interval1.setLastUpdateNoUserId(opeOpenId);

			Dict interval2 = map.get(ExamInterval.INTERVAL2);
			interval2.setValue(String.valueOf(examInterval.getInterval2()));
			interval2.setLastUpdateNoUserId(opeOpenId);
			
			Dict interval3 = map.get(ExamInterval.INTERVAL3);
			interval3.setValue(String.valueOf(examInterval.getInterval3()));
			interval3.setLastUpdateNoUserId(opeOpenId);
			
			Dict interval4 = map.get(ExamInterval.INTERVAL4);
			interval4.setValue(String.valueOf(examInterval.getInterval4()));
			interval4.setLastUpdateNoUserId(opeOpenId);
			
			updateByPriKey(interval1);
			updateByPriKey(interval2);
			updateByPriKey(interval3);
			updateByPriKey(interval4);
		}
	}
	
	/* customized code end */

}
