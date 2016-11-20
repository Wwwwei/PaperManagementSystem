package pms.entity;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import pms.dao.AuthorMapper;
import pms.service.PaperProxyService;
import pms.service.PaperService;
import pms.service.TeacherService;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring_mybatis_config.xml" })
public class TeacherTest {

	// @Autowired
	// private AuthorMapper authorMapper;
	//
	 @Resource(name = "teacherServiceImpl")
	 private TeacherService teacherService;
	//
	// @Resource(name = "paperServiceImpl")
	// private PaperService paperService;

	@Resource(name = "paperProxyServiceImpl")
	private PaperProxyService paperProxyService;

	// @Before
	// public void beforeFuntion(){
	//
	// }
	/*
	 * @Test public void test_findByTeacher() { // SqlSessionFactory Teacher
	 * teacher = new Teacher(); teacher.setTeacher_no("201326811413");
	 * teacher.setTeacher_password("123456"); teacher =
	 * teacherService.login(teacher);
	 * System.out.println(teacher.getTeacher_name()); }
	 * 
	 * @Test public void test_findPaper() { String find_string = "算法"; String
	 * find_type = "paper_info"; Page page = new Page(); page.setCurrentPage(1);
	 * 
	 * // List<Paper> papers=paperService.findPaper(find_string, //
	 * find_type,page); // System.out.println(papers.size()); }
	 * 
	 * @Test public void test_findPaperByPaperId() { Paper paper =
	 * paperService.findPaperByPaperId(1);
	 * System.out.println(paper.getPaper_name() + "    " +
	 * paper.getPaper_teacher().getTeacher_id() + " " +
	 * paper.getPaper_teacher().getTeacher_name()); }
	 * 
	 * @Test public void test_findPaperByTeacherId() { Page page = new Page();
	 * page.setCurrentPage(1); // List<Paper>
	 * papers=teacherService.findPaperByTeacherId(1, true, // page); List<Paper>
	 * papers = teacherService.findPaperByTeacherId(1, true, page);
	 * System.out.println(page.getTotalPage());
	 * System.out.println(papers.size()); }
	 * 
	 * @Test public void test_updatePassword() { Teacher teacher =
	 * teacherService.updatePassword(1, "123456789");
	 * System.out.println(teacher.getTeacher_password()); }
	 */
	@Test
	public void test() {
		Paper paper = paperProxyService.findPaperProxyById(153);
		System.out.println("ZKY:" + paper.getPaper_journals_conference_ZKY().getJournals_conference_id());
		System.out.println("JCR:" + paper.getPaper_journals_conference_JCR().getJournals_conference_id());
		System.out.println("CCF:" + paper.getPaper_journals_conference_CCF().getJournals_conference_id());

	}
	@Test
	public void testFindPaperByTeacherId(){
		Page page = new Page();
		page.setCurrentPage(1);
		Paper paper = teacherService.findPaperByTeacherId(1, true, page).get(0);
		System.out.println("ZKY:" + paper.getPaper_journals_conference_ZKY().getJournals_conference_id());
		System.out.println("JCR:" + paper.getPaper_journals_conference_JCR().getJournals_conference_id());
		System.out.println("CCF:" + paper.getPaper_journals_conference_CCF().getJournals_conference_id());

	}
	// @Test
	// public void testInsertTeacher(){
	// Teacher teacher = new Teacher();
	// teacher.setTeacher_name("pgs");
	// teacher.setTeacher_no("201326811413");
	// teacher.setTeacher_password("201326811413");
	// teacher.setTeacher_sex(1);
	// teacher.setTeacher_idCard("332528199504135017");
	// teacher.setTeacher_comeTime("2013-09-01");
	// teacher.setTeacher_birth("1995-04-13");
	// teacher.setTeacher_graUniversity("浙江工业大学");
	// teacherService.insertTeacher(teacher);
	// }
}
