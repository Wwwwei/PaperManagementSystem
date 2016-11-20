package pms.service;

import java.io.InputStream;
import java.util.List;
import java.util.Map;

import pms.entity.Page;
import pms.entity.Paper;
import pms.entity.Teacher;

public interface TeacherService {
	
	public Map<String,String> findTeacherPassword(String teacher_no);
	
	/**
	 * 根据教师id查询论文
	 * @param teacherId
	 * @param IsCommit
	 * @return
	 */
	
	public List<Paper> findPaperByTeacherId(Object teacherId, boolean IsCommit, Page page);
	
	/**
	 * 教师密码修改
	 * @param teacher_id
	 * @param teacher_password
	 * @return
	 */
	public boolean updatePassword(Object teacher_id, String newPassword);
	
	/**
	 * 通过教师id查询教师信息
	 * @param teacher_id
	 * @return
	 */
	public Teacher findTeacherById(int teacher_id);
	
	
	/**
	 * 查询所有教师的id个name
	 * @return
	 */
	public List<Teacher> findAllTeacher();
	
	public List<Teacher> getTeacherFromExcel(InputStream inStream);
	
	public boolean insertTeacher(Teacher teacher);
	
	public boolean insertTeacher(List<Teacher> teachers, boolean isUpdate);
	
	public Teacher findTeacher(String find_String);
	
	public boolean updateTeacher(Teacher teacher);
	

}
