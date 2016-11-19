package pms.entity;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import pms.service.AdminService;
import pms.service.AuthorProxyService;
import pms.service.TeacherService;


@RunWith(SpringJUnit4ClassRunner.class)     //表示继承了SpringJUnit4ClassRunner类  
@ContextConfiguration(locations = {"classpath:spring_mybatis_config.xml"}) 
public class AdminTest {
	
	
	@Resource(name="adminServiceImpl")
	private AdminService adminService;
	
	
	@Resource(name="teacherServiceImpl")
	private TeacherService teacherService;
	
	@Resource(name="authorProxyServiceImpl")
	private AuthorProxyService authorProxyService;
	
	@Test
	public void test_updatePassword(){
//	    boolean flag=adminService.resetPassword("201326811413");
//	    Teacher teacher=null;
//	    if(flag)
//	       teacher=teacherService.findTeacherById(1);
//		System.out.println(teacher.getTeacher_password());
	}
	
	@Test
	public void test_createAuthorProxy(){
		AuthorProxy ap=new AuthorProxy();
		ap.setAuthor_id(100);
		ap.setAuthor_name("pgs");
		Paper paper=new Paper();
		paper.setPaper_id(1);
		ap.setAuthor_paper(paper);
		int a=authorProxyService.createAuthorProxy(ap);
	    System.out.println(a);
	}
	
	

}
