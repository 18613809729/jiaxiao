package com.nbs.jiaxiao.service.db.impl;


import java.util.List;

import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.Phase;
import com.nbs.jiaxiao.constant.ResCode;
import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.po.Train;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.TrainInfo;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.exception.InvalidParamException;
import com.nbs.jiaxiao.exception.ResException;
import com.nbs.jiaxiao.mapper.TrainMapper;
import com.nbs.jiaxiao.service.db.StudentService;
import com.nbs.jiaxiao.service.db.TrainService;


@Service
public class TrainServiceImpl implements TrainService{
	
	@Resource
	private TrainMapper trainMapper;
	
	/**
	 * 保存
	 * @param train
	 * @return
	 */
	public int insert(Train train){
		return trainMapper.insert(train);
	}
	
	/**
	 * 根据主键更新
	 * @param train
	 * @return
	 */
	public void updateByPriKey(Train train){
		if(trainMapper.updateByPriKey(train) != 1) {
			throw new ConcurrentException("并发更新Train失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Train con){
		return trainMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return trainMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(Train con){
		return trainMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return trainMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return trainMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Train selectByPriKey(Integer id){
		return trainMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Train> selectList(Train con){
		return trainMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Train con){
		return trainMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(Train con){
		return trainMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	@Autowired
	private StudentService studentService;
	
	@Override
	public List<TrainInfo> queryByStage(String stage){
		return trainMapper.queryInfo(stage);
	}
	
	@Transactional(rollbackFor=Exception.class)
	@Override
	public void addTrain(String openId, String stage, int[] studentIds) throws ResException{
		boolean isStage2 = Stage.STAGE_2.getCode().equals(stage);
		for (Integer studentId : studentIds) {
			Train train = new Train();
			train.setStage(stage);
			train.setStudentId(studentId);
			train.setLastUpdateNoUserId(openId);
			if(isStage2) {
				Student student = studentService.selectByPriKey(studentId);
				String phase = student.getPhase();
				if(StringUtils.isNotBlank(phase)) {
					train.setPhase(phase);
				} else {
					train.setPhase(Phase.JUNIOR_1.getCode());
					student.setPhase(Phase.JUNIOR_1.getCode());
					student.setRemark("更新 phase");
					student.setLastUpdateNoUserId(openId);
					studentService.updateByPriKey(student);
				}
			}
			try {
				insert(train);
			}catch (DuplicateKeyException e) {
				Student student = studentService.selectByPriKey(studentId);
				throw new ResException("train duplicate " + studentId, e, BaseRes.build(ResCode.REPEATED, student));
			}
		}
	}

	@Override
	public Train queryByUk(String stage, Integer studentId) {
		Train train = new Train();
		train.setStage(stage);
		train.setStudentId(studentId);
		return NbsUtils.getFirst(selectList(train));
	}
	
	@Transactional
	@Override
	public Train reach(String openId, Integer studentId) {
		Train train = queryByUk(Stage.STAGE_2.getCode(), studentId);
		NbsUtils.assertNotNull(train, "this train {0} not exist", studentId);
		Student student = studentService.selectByPriKey(studentId);
		student.setRemark("phase change");
		student.setLastUpdateNoUserId(openId);
		train.setLastUpdateNoUserId(openId);

		Phase phase = Phase.valueOfByCode(train.getPhase());
		if(phase == Phase.EXAM) {
			student.setPhase(Phase.REACH.getCode());
			train.setPhase(Phase.REACH.getCode());
			deleteByPriKey(train.getId());
		} else {
			String nextPhase = String.valueOf(Integer.valueOf(train.getPhase()) + 1);
			student.setPhase(nextPhase);
			train.setPhase(nextPhase);
			updateByPriKey(train);
		}
		studentService.updateByPriKey(student);
		return train;
	}
	
	/* customized code end */

}
