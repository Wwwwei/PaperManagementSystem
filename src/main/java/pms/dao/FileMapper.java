package pms.dao;

import pms.entity.File;

import java.util.List;

public interface FileMapper {
    /**
     * 创建文件记录
     *
     * @param file
     * @return
     */
    public Integer insert(File file);

    /**
     * 根据论文代理id查询文件记录
     *
     * @param paperproxyId
     * @return
     */
    public List<File> findByPaperproxyId(Integer paperproxyId);
}