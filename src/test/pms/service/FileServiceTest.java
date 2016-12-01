package pms.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import pms.entity.File;

import javax.annotation.Resource;

import java.util.List;

import static org.junit.Assert.*;

@RunWith(SpringJUnit4ClassRunner.class) // 表示继承了SpringJUnit4ClassRunner类
@ContextConfiguration(locations = {"classpath:config/spring_mybatis_config.xml"})
public class FileServiceTest {
    @Resource
    FileService fileService;

    @Test
    public void testCreateFile() throws Exception {
        File file = new File();
        file.setFile_type(2);
        file.setFile_url("test");
        file.setFile_paperproxy_id(2);
        System.out.println("\n" + fileService.createFile(file));
    }

    @Test
    public void testFindFileByPaperproxyId() throws Exception {
        List<File> files = fileService.findFileByPaperproxyId(1);
        for (File file : files) {
            System.out.println("\n" + file.getFile_type());
        }
    }

    @Test
    public void testUpdateFile() throws Exception {
        File file = new File();
        file.setFile_id(1);
        file.setFile_url("testtest");
        System.out.println("\n" + fileService.updateFile(file));
    }
}