package pms.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import pms.dao.FileMapper;
import pms.entity.File;
import pms.service.FileService;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
    public Integer updateFile(File file) {
        fileMapper.update(file);
        return file.getFile_id();
    }

    @Override
    public List<File> findFileByPaperproxyId(Integer paperproxyId) {
        return fileMapper.findByPaperproxyId(paperproxyId);
    }

    @Override
    public File findFileByPaperproxyIdAndFileType(Integer paperproxyId, Integer fileType) {
        if (null != paperproxyId && null != fileType) {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("paperproxyId", paperproxyId);
            params.put("fileType", fileType);
            return fileMapper.selectByPaperproxyIdAndFileType(params);
        } else {
            return null;
        }
    }
    @Override
    public File findFileByPaperIdAndFileType(Integer paperId, Integer fileType) {
        if (null != paperId && null != fileType) {
            Map<String, Object> params = new HashMap<String, Object>();
            params.put("paperId", paperId);
            params.put("fileType", fileType);
            return fileMapper.selectByPaperIdAndFileType(params);
        } else {
            return null;
        }
    }
}
