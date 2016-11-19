package pms.dao;


import java.util.List;
import java.util.Map;

import pms.entity.Teacher;

public interface TeacherMapper {
	
	/**
	 * 修改教师密码
	 * @param param
	 * @return
	 */
	public int updatePassword(Map<String,Object> params);
	
	/**
	 * 根据id加载teacher对象
	 * @param teacher_id
	 * @return
	 */
	public Teacher findTeacherById(int teacher_id);
	
	
	/**
	 * 查询所有老师
	 * @return  返回Teacher对象的List列表
	 */
	public List<Teacher> findAllTeacher();
	
	public int insertTeacher(Teacher teacher);
	
	public Teacher findTeacher(Map<String,Object> params);
	
	public String findTeacherSaltByTeacherNo(String teacher_no);
	
	public String findTeacherPasswordByTeacherNo(String teacher_no);
	
	public int updateTeacher(Teacher teacher);
	
	public List<String> findAllTeacherNo();
	
	public int findTeacherIdByTeacherNo(String teacher_no);

}
