package pms.service;

import pms.entity.File;

import java.util.List;

public interface FileService {
    /**
     * 创建文件记录
     *
     * @param file
     * @return
     */
    public Integer createFile(File file);

    /**
     * 根究论文代理id查询文件记录
     *
     * @param paperproxyId
     * @return
     */
    public List<File> findFileByPaperproxyId(Integer paperproxyId);
}
