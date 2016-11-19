package pms.entity;

import java.util.List;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import pms.service.AuthorService;
import pms.service.PaperService;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = { "classpath:spring_mybatis_config.xml" })
public class PaperTest {
	@Resource(name = "paperServiceImpl")
	private PaperService paperService;
	
	@Resource(name = "authorServiceImpl")
	private AuthorService authorService;

	@Test
	public void testDeletePaper() {
	  boolean boo = paperService.deletePaper(30);
	 System.out.println(boo);
	}
	@Test
	public void testFindAuthorByPaperId(){
	  List<Author> authors = authorService.findAuthor(29);
	  System.out.println(authors.size());
	}
	
	@Test
	public void testInsertPaper(){
		Paper paper=new Paper();
		Journals_Conference paper_journals_Conference=new Journals_Conference();
		Teacher paper_teacher= new Teacher();
		paper_journals_Conference.setJournals_conference_id(1);
		paper_teacher.setTeacher_id(1);
		paper.setPaper_name("ppp");
		paper.setPaper_rank(1);
		paper.setPaper_accNum("1234");
		paper.setPaper_authorNum(1);
		paper.setPaper_includedType("ES");
		paper.setPaper_time("2014-8-8");
		paper.setPaper_teacher(paper_teacher);
		int paper_id = paperService.insertPaper(paper);
		System.out.println(paper_id);
	}
	

}
