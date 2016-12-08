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
        Paper paper = new Paper();
        paper.setPaper_name("test");
        paper.setPaper_publishName("测试期刊");
        paperProxyService.createPaperProxy(paper);
    }

    @Test
    public void testFindPaperProxyById1() throws Exception {
        System.out.println(paperProxyService.findPaperProxyByName("1208test03"));
    }
}