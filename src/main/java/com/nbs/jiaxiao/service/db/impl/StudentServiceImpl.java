package com.nbs.jiaxiao.service.db.impl;


import java.util.ArrayList;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.nbs.jiaxiao.constant.Stage;
import com.nbs.jiaxiao.domain.po.Student;
import com.nbs.jiaxiao.domain.vo.StudentInfo;
import com.nbs.jiaxiao.exception.ConcurrentException;
import com.nbs.jiaxiao.mapper.StudentMapper;
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
	public List<Student> selectSearchInfo(Student con){
		return studentMapper.selectSearchInfo(con == null ? new Student() : con);
	}
	
	/* customized code end */

}
