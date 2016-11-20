package pms.service.impl;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import jxl.Sheet;
import jxl.Workbook;
import pms.dao.PaperMapper;
import pms.dao.TeacherMapper;
import pms.entity.Institute;
import pms.entity.Page;
import pms.entity.Paper;
import pms.entity.Teacher;
import pms.entity.TeachingProfession;
import pms.service.InstituteService;
import pms.service.TeacherService;
import pms.service.TeachingProfessionService;
import pms.util.CryptoUtil;
import pms.util.DateUtil;

@Service
public class TeacherServiceImpl implements TeacherService {

	@Autowired
	private PaperMapper paperMapper;

	@Autowired
	private TeacherMapper teacherMapper;

	@Resource(name = "instituteServiceImpl")
	private InstituteService instituteService;
	
	@Resource(name = "teachingProfessionServiceImpl")
	private TeachingProfessionService teachingProfessionService;

	@Override
	public Map<String, String> findTeacherPassword(String teacher_no) {
		// TODO Auto-generated method stub
		Map<String, String> result = new HashMap<String, String>();
		String teacher_salt = teacherMapper.findTeacherSaltByTeacherNo(teacher_no);
		if (teacher_salt != null) {
			result.put("teacher_salt", teacher_salt);
			result.put("teacher_password", teacherMapper.findTeacherPasswordByTeacherNo(teacher_no));
			return result;
		} else
			return null;
	}

	@Override
	public List<Paper> findPaperByTeacherId(Object teacher_id, boolean isCommit, Page page) {
		// TODO Auto-generated method stub
		if (teacher_id == null || (int) teacher_id == 0)
			return null;
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("teacher_id", teacher_id);
		params.put("page", page);
		if (isCommit)
			return paperMapper.findCommitedPaperByTeacherIdByPage(params);
		else {
			return paperMapper.findUncommitedPaperByTeacherIdByPage(params);
		}
	}

	@Override
	public boolean updatePassword(Object teacher_id, String newPassword) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		String teacher_salt = CryptoUtil.getSalt();
		String teacher_password = CryptoUtil.getHash(newPassword, teacher_salt);
		params.put("teacher_id", teacher_id);
		params.put("teacher_salt", teacher_salt);
		params.put("teacher_password", teacher_password);
		int flag = teacherMapper.updatePassword(params);
		if (flag == 1)
			return true;
		else
			return false;
	}

	@Override
	public Teacher findTeacherById(int teacher_id) {
		Teacher teacher = null;
		if (teacher_id > 0)
			teacher = teacherMapper.findTeacherById(teacher_id);
		return teacher;
	}

	@Override
	public List<Teacher> findAllTeacher() {
		List<Teacher> teachers = teacherMapper.findAllTeacher();
		return teachers;
	}

	public List<Teacher> getTeacherFromExcel(InputStream inStream) {
		List<Teacher> list = new ArrayList<Teacher>();
		try {
			Workbook rwb = Workbook.getWorkbook(inStream);
			Sheet rs = rwb.getSheet(0);// 或者rwb.getSheet(0)
			int clos = rs.getColumns();// 得到所有的列
			int rows = rs.getRows();// 得到所有的行

			System.out.println(clos + " rows:" + rows);
			for (int i = 1; i < rows; i++) {
				for (int j = 0; j < clos; j++) {
					// 第一个是列数，第二个是行数
					String teacher_no = rs.getCell(j++, i).getContents();// 默认最左边编号也算一列,所以这里得j++
					String teacher_name = rs.getCell(j++, i).getContents();
					String teacher_sex_str = rs.getCell(j++, i).getContents();
					String teacher_email = rs.getCell(j++, i).getContents();
					String teacher_phoneNumber = rs.getCell(j++, i).getContents();
					String teacher_officeNumber = rs.getCell(j++, i).getContents();
					String teacher_title = rs.getCell(j++, i).getContents();
					String teacher_birth = rs.getCell(j++, i).getContents();
//					String teacher_age = rs.getCell(j++, i).getContents();
					String teacher_qq = rs.getCell(j++, i).getContents();
					String teacher_idCard = rs.getCell(j++, i).getContents();
					String teacher_comeTime = rs.getCell(j++, i).getContents();
					String teacher_graUniversity = rs.getCell(j++, i).getContents();
					String teacher_info = rs.getCell(j++, i).getContents();
					String teacher_info_url = rs.getCell(j++, i).getContents();
					String teacher_google_scolar_url = rs.getCell(j++, i).getContents();
					String teacher_university = rs.getCell(j++, i).getContents();
					String teacher_subject = rs.getCell(j++, i).getContents();
					String teacher_subject_study = rs.getCell(j++, i).getContents();
					String teacher_institute_name = rs.getCell(j++, i).getContents();
					String teacher_teachingProfession_name = rs.getCell(j++, i).getContents();
					int teacher_sex = 0;
					if (teacher_sex_str.trim().equals("男"))
						teacher_sex = 1;
					teacher_birth = DateUtil.changeDateFormat(teacher_birth);
					teacher_comeTime = DateUtil.changeDateFormat(teacher_comeTime);
					Institute teacher_institute = instituteService.getInstitue(teacher_institute_name.trim());
					TeachingProfession teachingProfession=teachingProfessionService.getTeachingProfession(teacher_teachingProfession_name.trim());
					list.add(new Teacher(teacher_no, teacher_name, null, null, teacher_sex, teacher_email,
							teacher_phoneNumber, teacher_officeNumber, teacher_title, teacher_birth,
							0, teacher_qq, teacher_idCard, teacher_comeTime,
							teacher_graUniversity, teacher_info,teacher_info_url,teacher_google_scolar_url,
							teacher_university,teacher_subject,teacher_subject_study,teacher_institute,teachingProfession));
				}
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean insertTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		String teacher_no = teacher.getTeacher_no();
		String teacher_salt = CryptoUtil.getSalt();
		String teacher_password = CryptoUtil.SHA1(teacher_no);
		teacher_password = CryptoUtil.getHash(teacher_password, teacher_salt);
		teacher.setTeacher_password(teacher_password);
		teacher.setTeacher_salt(teacher_salt);
		if (teacherMapper.insertTeacher(teacher) != 0)
			return true;
		else
			return false;
	}

	@Override
	public boolean insertTeacher(List<Teacher> teachers, boolean isUpdate) {
		List<String> teacher_no_list = teacherMapper.findAllTeacherNo();
		try {
			for (Teacher teacher : teachers) {
				if (!teacher_no_list.contains(teacher.getTeacher_no()))
					insertTeacher(teacher);
				else {
					if (isUpdate){
						teacher.setTeacher_id(teacherMapper.findTeacherIdByTeacherNo(teacher.getTeacher_no()));
						updateTeacher(teacher);
					}
				}
			}
			return true;
		} catch (Exception e) {
			return false;
		}

	}

	@Override
	public Teacher findTeacher(String find_string) {
		Map<String, Object> params = new HashMap<String, Object>();
		if (find_string.trim().matches("^[0-9]+$"))
			params.put("teacher_no", find_string.trim());
		else
			params.put("teacher_name", find_string.trim());
		// TODO Auto-generated method stub
		return teacherMapper.findTeacher(params);
	}

	@Override
	public boolean updateTeacher(Teacher teacher) {
		// TODO Auto-generated method stub
		if (teacherMapper.updateTeacher(teacher) == 1)
			return true;
		return false;
	}

}
