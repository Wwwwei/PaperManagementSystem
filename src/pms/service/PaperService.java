package pms.service;

import java.util.List;

import pms.entity.Page;
import pms.entity.Paper;

public interface PaperService {
	
    /**
     * 根据查询关键词和类型查询论文
     * @param find_string
     * @param find_type
     * @param journals_conference_degree
     * @param paper_includedType
     * @param paper_time
     * @param journals_conference_flag
     * @param teacher_id
     * @param paper_time_order
     * @param page
     * @return
     */
	public List<Paper> findPaper(String find_string,String find_type,String journals_conference_degree,String paper_includedType,String paper_time,
			int journals_conference_flag,int teacher_id,int teacher_sex,int teacher_age_min,int teacher_age_max,
			double journals_conference_IF_min,double journals_conference_IF_max,int paper_citations_min,int paper_citations_max,int paper_citations_others_min,int paper_citations_others_max,
			String column,int order,Page page);
	
	
	
	/**
	 * 依靠论文条件查询所有论文
	 * @param journals_conference_degree
	 * @param paper_includedType
	 * @param paper_time
	 * @param journals_conference_flag
	 * @param teacher_id
	 * @param paper_time_order
	 * @param page
	 * @return
	 */
	public List<Paper> findAllPaper(int journals_conference_id,String paper_includedType,
			String paper_time,int journals_conference_flag,int teacher_id,int teacher_sex,
			int teacher_age_min,int teacher_age_max,double journals_conference_IF_min,double journals_conference_IF_max,
			int paper_citations_min,int paper_citations_max,int paper_citations_others_min,int paper_citations_others_max,String column,int order,Page page);

	public Paper findPaperByPaperId(int paper_id);
	
	public int insertPaper(Paper paper);
	
	public boolean deletePaper(int paper_id);
	
	public int insertPaperProxyByPaperId(int paper_id);
	
	public boolean insertAuthorProxyByPaperId(int paper_id,int paperproxy_id);
	
	public int findTeacherIdByPaperId(int paper_id);
}
