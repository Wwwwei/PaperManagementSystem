package pms.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.FileMapper;
import pms.entity.File;
import pms.service.FileService;

import java.util.List;

@Service
public class FileServiceImpl implements FileService {

    @Autowired
    private FileMapper fileMapper;

    @Override
    public Integer createFile(File file) {
        fileMapper.insert(file);
        return file.getFile_id();
    }

    @Override
    public List<File> findFileByPaperproxyId(Integer paperproxyId) {
        return fileMapper.findByPaperproxyId(paperproxyId);
    }
}
