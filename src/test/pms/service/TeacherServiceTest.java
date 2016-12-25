package pms.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pms.entity.Teacher;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:config/spring_mybatis_config.xml" })
public class TeacherServiceTest {
	@Resource
	TeacherService teacherService;

	@Test
	public void testFindTeacherById() throws Exception {
		System.out.println(teacherService.findTeacherById(1).getTeacher_name());
	}

	@Test
	public void testInsert() throws Exception {
		Teacher teacher = teacherService.findTeacherById(1);
		teacher.setTeacher_id(33);
		teacher.setTeacher_no("201326811411");
		System.out.print(teacher.getTeacher_name());
		teacherService.insertTeacher(teacher);
	}
}