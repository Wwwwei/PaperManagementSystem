package pms.dao;

import pms.entity.File;

import java.util.List;
import java.util.Map;

public interface FileMapper {
    /**
     * 创建文件记录
     *
     * @param file
     * @return
     */
    public Integer insert(File file);

    /**
     * 更新文件记录
     * @param file
     * @return
     */
    public Integer update(File file);

    /**
     * 根据论文代理id查询文件记录
     *
     * @param paperproxyId
     * @return
     */
    public List<File> findByPaperproxyId(Integer paperproxyId);

    /**
     * 根据论文代理id和文件类型查询文件记录
     *
     * @param params
     * @return
     */
    public File selectByPaperproxyIdAndFileType(Map<String, Object> params);
}
