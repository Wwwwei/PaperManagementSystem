package pms.dao;

import java.util.List;
import java.util.Map;

import pms.entity.Paper;

public interface PaperMapper {
	/**
	 * 根据论文名字模糊查询
	 * @param paper_name
	 * @return
	 */
	public List<Paper> findPaperByPaperNameByPage(Map<String, Object> params);
	
	/**
	 * 根据作者姓名查询
	 * @param author_name
	 * @return
	 */
	public List<Paper> findPaperByAuthorNameByPage(Map<String, Object> params);
	
	/**
	 * 根据作者id查询
	 * @param author_no
	 * @return
	 */
	public List<Paper> findPaperByAuthorNoByPage(Map<String, Object> params);
	
	/**
	 * 根据教师id查询未提交论文
	 * @param teacherId
	 * @return
	 */
	public List<Paper> findUncommitedPaperByTeacherIdByPage(Map<String, Object> params);
	
	/**
	 * 根据教师id查询已提交论文
	 * @param teacherId
	 * @return
	 */
	public List<Paper> findCommitedPaperByTeacherIdByPage(Map<String, Object> params);
	
	/**
	 * 根据查询条件查询所有论文
	 * @param params
	 * @return
	 */
	public List<Paper> findAllPaperByPage(Map<String, Object> params);
	
	public Paper findPaperByPaperId(int paper_id);
	
	public int insertPaper(Paper paper);
	
	public int deletePaperByPaperId(int paper_id);
	
	public int insertPaperProxyByPaperId(Paper paper);
	
	public int insertAuthorProxyByPaperId(Map<String, Object> params);
	
	public int findTeacherIdByPaperId(int paper_id);

}
