package pms.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pms.entity.Journals_Conference;
import pms.entity.Paper;

import javax.annotation.Resource;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:config/spring_mybatis_config.xml"})
public class PaperProxyServiceTest {
    @Resource
    PaperProxyService paperProxyService;

    @Test
    public void testFindPaperProxyById() throws Exception {
        System.out.println("\n" + paperProxyService.findPaperProxyById(1).getPaper_name());
    }

    @Test
    public void testCreatePaperProxy() throws Exception {
        Paper paper=new Paper();
        paper.setPaper_name("1206test02");
        paper.setPaper_journals_conference_isZjut100(1);
        paper.setPaper_journals_conference_isOther(0);
        Journals_Conference journals_Conference=new Journals_Conference();
        journals_Conference.setJournals_conference_id(1);
        paper.setPaper_journals_conference_ESI(journals_Conference);
        paper.setPaper_journals_conference_OTHER(journals_Conference);
        paperProxyService.createPaperProxy(paper);
    }
}