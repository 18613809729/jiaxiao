package com.nbs.jiaxiao.service.db.impl;


import java.sql.Date;
import java.time.LocalDate;
import java.util.ArrayList;
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
import com.nbs.jiaxiao.domain.po.Exam;
import com.nbs.jiaxiao.domain.po.ExamInfo;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.po.Train;
import com.nbs.jiaxiao.domain.vo.BaseRes;
import com.nbs.jiaxiao.domain.vo.ExamInterval;
import com.nbs.jiaxiao.domain.vo.ExamStudentInfo;
import com.nbs.jiaxiao.domain.vo.StudentInfo;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.exception.ResException;
import com.nbs.jiaxiao.mapper.StudentMapper;
import com.nbs.jiaxiao.service.db.DictService;
import com.nbs.jiaxiao.service.db.ExamInfoService;
import com.nbs.jiaxiao.service.db.ExamService;
import com.nbs.jiaxiao.service.db.SchoolService;
import com.nbs.jiaxiao.service.db.StudentService;


@Service
public class StudentServiceImpl implements StudentService{
	
	@Resource
	private StudentMapper studentMapper;
	
	/**
	 * 保存
	 * @param student
	 * @return
	 */
	public int insert(Student student){
		return studentMapper.insert(student);
	}
	
	/**
	 * 根据主键更新
	 * @param student
	 * @return
	 */
	public void updateByPriKey(Student student){
		if(studentMapper.updateByPriKey(student) != 1) {
			throw new ConcurrentException("并发更新Student失败");
		}
	}
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Student con){
		return studentMapper.delete(con);
	}
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id){
		return studentMapper.deleteByPriKey(id);
	}
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(Student con){
		return studentMapper.deleteActual(con);
	}
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id){
		return studentMapper.deleteActualByPriKey(id);
	}

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id){
		return studentMapper.clean(id);
	}

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Student selectByPriKey(Integer id){
		return studentMapper.selectByPriKey(id);
	}
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Student> selectList(Student con){
		return studentMapper.selectList(con);
	}
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Student con){
		return studentMapper.selectCount(con);
	}
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(Student con){
		return studentMapper.exist(con) != null;
	}
	
	/* customized code start */
	
	@Autowired
	private SchoolService schoolService;
	
	@Autowired
	private DictService dictService;
	
	@Autowired
	private ExamService examService;
	
	@Autowired
	private ExamInfoService examInfoService;
	
	@Override
	public List<StudentInfo> selectStageStudent(String stage){
		Student con = new Student();
		con.setStage(stage);
		return studentMapper.selectAllInfo(con);
	}
	
	@Override
	public List<StudentInfo> selectInLearnStudent(){
		List<StudentInfo> res = new ArrayList<StudentInfo>();
		res.addAll(selectStageStudent(Stage.STAGE_1.getCode()));
		res.addAll(selectStageStudent(Stage.STAGE_2.getCode()));
		res.addAll(selectStageStudent(Stage.STAGE_3.getCode()));
		res.addAll(selectStageStudent(Stage.STAGE_4.getCode()));
		return res;
	}
	
	@Override
	public List<StudentInfo> selectArrearageStudent(){
		Student con = new Student();
		con.setIsArrearage(true);
		return studentMapper.selectAllInfo(con);
	}
	
	@Override
	public List<StudentInfo> selectSearchInfo(Student con){
		List<StudentInfo> lst = studentMapper.selectSearchInfo(con == null ? new Student() : con);
		lst.forEach(student -> student.setSchoolName(schoolService.queryName(student.getSchoolId())));
		return lst;
	}
	
	@Override
	public List<StudentInfo> selectTrainInfo(String stage){
		return studentMapper.selectTrainInfo(stage);
	}
	
	@Override
	public List<Student> queryExamData(String stage, LocalDate examDate){
		Student con = new Student();
		con.setStage(stage);
		if(Stage.STAGE_2.getCode().equals(stage)) {
			con.setPhase(Phase.REACH.getCode());
		}
		List<Student> lst = selectList(con);
		Integer interval = dictService.queryExamInterval().getIntervalByStage(stage);
		lst.removeIf(student -> {
			LocalDate date = student.getExamDate().toLocalDate();
			return date.plusDays(interval).compareTo(examDate) > 0;
		});
		lst.forEach(student -> student.setSchoolName(schoolService.queryName(student.getSchoolId())));
		return lst;
	}
	
	@Transactional
	@Override
	public Exam addExam(String openId, String stage, LocalDate examDate, int[] studentIds) {
		Exam exam = new Exam();
		exam.setLastUpdateNoUserId(openId);
		exam.setExamDate(Date.valueOf(examDate));
		exam.setStage(stage);
		examService.insert(exam);
		for (int studentId : studentIds) {
			ExamInfo examInfo = new ExamInfo();
			examInfo.setExamId(exam.getId());
			examInfo.setStudentId(studentId);
			examInfo.setLastUpdateNoUserId(openId);;
			examInfoService.insert(examInfo);
		}
		return exam;
	}
	
	@Transactional
	@Override
	public void examAddMore(String openId, Integer examId, int[] studentIds) {
		for (int studentId : studentIds) {
			ExamInfo examInfo = new ExamInfo();
			examInfo.setExamId(examId);
			examInfo.setStudentId(studentId);
			examInfo.setLastUpdateNoUserId(openId);;
			examInfoService.insert(examInfo);
		}
	}
	
	@Override
	public List<StudentInfo> selectExamInfo(Integer examId){
		return studentMapper.selectExamInfo(examId);
	}

	@Override
	public List<ExamStudentInfo> selectExamStudentInfo(Integer examId){
		List<ExamStudentInfo> lst = studentMapper.selectExamStudentInfo(examId);
		lst.forEach(student -> student.setSchoolName(schoolService.queryName(student.getSchoolId())));
		return lst;
	}
	
	
	@Override
	public long queryInLearnCount(){
		long count = 0;
		Student con = new Student();
		con.setStage(Stage.STAGE_1.getCode());
		count += selectCount(con);
		con.setStage(Stage.STAGE_2.getCode());
		count += selectCount(con);
		con.setStage(Stage.STAGE_3.getCode());
		count += selectCount(con);
		con.setStage(Stage.STAGE_4.getCode());
		count += selectCount(con);
		return count;
	}
	
	
	@Override
	public Student queryStudent(String username, String mobile) {
		Student con = new Student();
		con.setUsername(username);
		con.setMobile(mobile);
		return NbsUtils.getFirst(selectList(con));
	} 
	
	@Override
	public List<Student> queryStudent(String openId) {
		Student con = new Student();
		con.setOpenId(openId);
		return selectList(con);
	} 
	
	/* customized code end */

}
