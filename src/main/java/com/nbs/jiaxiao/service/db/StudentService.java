package com.nbs.jiaxiao.service.db;


import java.time.LocalDate;
import java.util.List;

import com.nbs.jiaxiao.domain.po.Exam;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.vo.ExamStudentInfo;
import com.nbs.jiaxiao.domain.vo.StudentInfo;


public interface StudentService {
	
	/**
	 * 保存
	 * @param student
	 * @return
	 */
	public int insert(Student student);
	
	/**
	 * 根据主键更新
	 * @param student
	 * @return
	 */
	public void updateByPriKey(Student student);
	
	/**
	 * 根据条件逻辑删除 慎用
	 * @param con 条件
	 * @return
	 */
	public int delete(Student con);
	
	/**
	 * 根据主键逻辑删除
	 * @param id 主键
	 * @return
	 */
	public int deleteByPriKey(Integer id);
	
	/**
	 * 根据条件物理删除 慎用
	 * @param con
	 * @return
	 */
	public int deleteActual(Student con);
	
	/**
	 * 根据主键物理删除 慎用
	 * @param id
	 * @return
	 */
	public int deleteActualByPriKey(Integer id);

	/**
	 * 清理>=主键的已删除数据
	 * @param id 主键
	 * @return
	 */
	public int clean(Integer id);

	/**
	 * 根据主键查询
	 * @param id
	 * @return
	 */
	public Student selectByPriKey(Integer id);
	
	/**
	 * 根据条件查询
	 * @param con
	 * @return
	 */
	public List<Student> selectList(Student con);
	
	/**
	 * 根据条件计数
	 * @param con
	 * @return
	 */
	public long selectCount(Student con);
	
	/**
	 * 根据条件判断是否存在
	 * @param con 条件
	 * @return 存在的第一个值的主键
	 */
	public boolean exist(Student con);
	
	/* customized code start */
	
	List<StudentInfo> selectStageStudent(String stage);

	List<StudentInfo> selectInLearnStudent();

	List<StudentInfo> selectArrearageStudent();

	List<StudentInfo> selectSearchInfo(Student con);

	List<StudentInfo> selectTrainInfo(String stage);

	List<Student> queryExamData(String stage, LocalDate examDate);

	Exam addExam(String openId, String stage, LocalDate examDate, int[] studentIds);

	List<StudentInfo> selectExamInfo(Integer examId);

	List<ExamStudentInfo> selectExamStudentInfo(Integer examId);

	/* customized code end */

}
