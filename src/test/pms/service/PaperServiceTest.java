package pms.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pms.entity.Paper;
import pms.entity.Teacher;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:config/spring_mybatis_config.xml"})
public class PaperServiceTest {
    @Resource
    PaperService paperService;

    @Test
    public void testInsertPaper() throws Exception {
        Paper paper = new Paper();
        Teacher teacher = new Teacher();
        teacher.setTeacher_id(1);
        paper.setPaper_name("测试使用");
        paper.setPaper_authorNum(1);
        paper.setPaper_rank(1);
        paper.setPaper_includedType("SCI");
        paper.setPaper_teacher(teacher);
        paper.setPaper_time("2016");
        paper.setPaper_issue(0);
        System.out.println(paperService.insertPaper(paper));
    }
}