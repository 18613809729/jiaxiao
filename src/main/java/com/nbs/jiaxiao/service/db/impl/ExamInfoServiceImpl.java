package com.nbs.jiaxiao.service.db.impl;


import java.util.List;
import javax.annotation.Resource;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.alibaba.fastjson.JSON;
import com.nbs.jiaxiao.common.NbsUtils;
import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.domain.po.Exam;
import com.nbs.jiaxiao.domain.po.ExamInfo;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.exception.InvalidParamException;
import com.nbs.jiaxiao.mapper.ExamInfoMapper;
import com.nbs.jiaxiao.service.db.ExamInfoService;
import com.nbs.jiaxiao.service.db.ExamService;
import com.nbs.jiaxiao.service.db.StudentService;


@Service
public class ExamInfoServiceImpl implements ExamInfoService{
	
	@Resource
	private ExamInfoMapper examInfoMapper;
	
	/**
	 * 保存
	 * @param examInfo
	 * @return
	 */
	public int insert(ExamInfo examInfo){
		return examInfoMapper.insert(examInfo);
	}
	
	/**
	 * 根据主键更新
	 * @param examInfo
	 * @return
	 */
	public void updateByPriKey(ExamInfo examInfo){
		if(examInfoMapper.updateByPriKey(examInfo) != 1) {
			throw new ConcurrentException("并发更新ExamInfo失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(ExamInfo con){
		return examInfoMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return examInfoMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(ExamInfo con){
		return examInfoMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return examInfoMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return examInfoMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public ExamInfo selectByPriKey(Integer id){
		return examInfoMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<ExamInfo> selectList(ExamInfo con){
		return examInfoMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(ExamInfo con){
		return examInfoMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(ExamInfo con){
		return examInfoMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private ExamService examService;
	
	@Override
	public ExamInfo queryByUk(Integer examId, Integer studentId) {
		ExamInfo con = new ExamInfo();
		con.setExamId(examId);
		con.setStudentId(studentId);
		return NbsUtils.getFirst(selectList(con));
	}
	
	@Override
	public ExamInfo delete(Integer examId, Integer studentId) {
		ExamInfo examInfo = queryByUk(examId, studentId);
		if(examInfo != null && StringUtils.isBlank(examInfo.getStatus())) {
			deleteByPriKey(examInfo.getId());
		}
		return examInfo;
	}
	
	@Transactional
	@Override
	public void pass(ExamInfo examInfo) {
		if(examInfo != null && StringUtils.isBlank(examInfo.getStatus())) {
			examInfo.setStatus(ExamInfo.PASS);
			Student student = studentService.selectByPriKey(examInfo.getStudentId());
			Exam exam = examService.selectByPriKey(examInfo.getExamId());
			Stage stage = Stage.valueOfByCode(exam.getStage());
			switch (stage) {
			case STAGE_1:
				student.setStage(Stage.STAGE_2.getCode());
				break;
			case STAGE_2:
				student.setStage(Stage.STAGE_3.getCode());
				break;
			case STAGE_3:
				student.setStage(Stage.STAGE_4.getCode());
				break;
			case STAGE_4:
				student.setStage(Stage.GRADUATED.getCode());
				break;

			default:
				throw new InvalidParamException("pass invalid stage:" + stage);
			}
			student.setExamDate(exam.getExamDate());
			studentService.updateByPriKey(student);
			updateByPriKey(examInfo);
		} else {
			throw new InvalidParamException("canot pass exam :" + JSON.toJSONString(examInfo));
		}
	}
	
	@Transactional
	@Override
	public void noPass(ExamInfo examInfo) {
		if(examInfo != null && StringUtils.isBlank(examInfo.getStatus())) {
			examInfo.setStatus(ExamInfo.NO_PASS);
			Student student = studentService.selectByPriKey(examInfo.getStudentId());
			Exam exam = examService.selectByPriKey(examInfo.getExamId());
			student.setExamDate(exam.getExamDate());
			studentService.updateByPriKey(student);
			updateByPriKey(examInfo);
		} else {
			throw new InvalidParamException("canot pass exam :" + JSON.toJSONString(examInfo));
		}
	}
	
	
	@Override
	public List<ExamInfo>  queryStudentExam(Integer studentId) {
		ExamInfo con = new ExamInfo();
		con.setStudentId(studentId);
		return selectList(con);
	}
	/* customized code end */

}
