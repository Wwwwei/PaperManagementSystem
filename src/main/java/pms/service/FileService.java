package pms.service;

import pms.entity.File;

import java.util.List;
import java.util.Map;

public interface FileService {
    /**
     * 创建文件记录
     *
     * @param file
     * @return
     */
    public Integer createFile(File file);

    /**
     * 更新文件记录
     *
     * @param file
     * @return
     */
    public Integer updateFile(File file);

    /**
     * 根究论文代理id查询文件记录
     *
     * @param paperproxyId
     * @return
     */
    public List<File> findFileByPaperproxyId(Integer paperproxyId);

    /**
     * 根据论文代理id和文件类型查询文件记录
     *
     * @param paperproxyId
     * @param fileType
     * @return
     */
    public File findFileByPaperproxyIdAndFileType(Integer paperproxyId, Integer fileType);

}
