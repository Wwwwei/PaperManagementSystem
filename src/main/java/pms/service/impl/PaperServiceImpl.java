package pms.service.impl;

import static pms.util.CheckUtil.isNumeric;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import pms.dao.PaperMapper;
import pms.entity.Page;
import pms.entity.Paper;
import pms.service.AuthorService;
import pms.service.PaperService;
import pms.util.DateUtil;

@Service
public class PaperServiceImpl implements PaperService {

	@Resource(name = "authorServiceImpl")
	private AuthorService authorService;

	@Autowired
	private PaperMapper paperMapper;

	@Override
	public List<Paper> findPaper(String find_string, String find_type, String journals_conference_degree,
			String paper_includedType, String paper_time, int journals_conference_flag, int teacher_id, int teacher_sex,
			int teacher_age_min, int teacher_age_max, double journals_conference_IF_min,
			double journals_conference_IF_max, int paper_citations_min, int paper_citations_max,
			int paper_citations_others_min, int paper_citations_others_max, String column, int order, Page page) {
		// TODO Auto-generated method stub
		// Map<String, Object> params = new HashMap<String, Object>();
		// params.put("find_string", find_string);
		// putParams(params, journals_conference_degree, paper_includedType,
		// paper_time, journals_conference_flag,
		// teacher_id, teacher_sex, teacher_age_min, teacher_age_max,
		// journals_conference_IF_min,
		// journals_conference_IF_max, paper_citations_min, paper_citations_max,
		// paper_citations_others_min,
		// paper_citations_others_max, column, order, page);
		// if (find_type != null && find_type.equals("author_info"))
		// return findPaperByAuthorInfo(params);
		// else if (find_type != null && find_type.equals("paper_info"))
		// return paperMapper.findPaperByPaperNameByPage(params);
		return null;
	}

	/**
	 * 根据作者信息查询
	 * 
	 * @param authorInfo
	 * @return
	 */
	public List<Paper> findPaperByAuthorInfo(Map<String, Object> params) {
		if (params.get("authorInfo") != null && isNumeric((String) params.get("authorInfo")))
			return paperMapper.findPaperByAuthorNoByPage(params);
		else
			return paperMapper.findPaperByAuthorNameByPage(params);
	}

	@Override
	public List<Paper> findAllPaper(int journals_conference_id, String paper_includedType, String paper_time,
			int journals_conference_flag, int teacher_id, int teacher_sex, int teacher_age_min, int teacher_age_max,
			double journals_conference_IF_min, double journals_conference_IF_max, int paper_citations_min,
			int paper_citations_max, int paper_citations_others_min, int paper_citations_others_max, String column,
			int order, Page page) {
		Map<String, Object> params = new HashMap<String, Object>();
		putParams(params, journals_conference_id, paper_includedType, paper_time, journals_conference_flag, teacher_id,
				teacher_sex, teacher_age_min, teacher_age_max, journals_conference_IF_min, journals_conference_IF_max,
				paper_citations_min, paper_citations_max, paper_citations_others_min, paper_citations_others_max,
				column, order, page);
		return paperMapper.findAllPaperByPage(params);
	}

	/**
	 * 填充参数
	 * 
	 * @param params
	 * @param journals_conference_degree
	 * @param paper_includedType
	 * @param paper_time
	 * @param journals_conference_flag
	 * @param teacher_id
	 * @param teacher_sex
	 * @param teacher_age_min
	 * @param teacher_age_max
	 * @param paper_time_order
	 * @param page
	 */
	private void putParams(Map<String, Object> params, int journals_conference_id, String paper_includedType,
			String paper_time, int journals_conference_flag, int teacher_id, int teacher_sex, int teacher_age_min,
			int teacher_age_max, double journals_conference_IF_min, double journals_conference_IF_max,
			int paper_citations_min, int paper_citations_max, int paper_citations_others_min,
			int paper_citations_others_max, String column, int order, Page page) {
		if (0 < journals_conference_id && journals_conference_id < 13) {
			if (0 < journals_conference_id && journals_conference_id <= 3)
				params.put("journals_conference_ZKY_id", journals_conference_id);
			if (3 < journals_conference_id && journals_conference_id <= 6)
				params.put("journals_conference_JCR_id", journals_conference_id);
			if (6 < journals_conference_id && journals_conference_id <= 12)
				params.put("journals_conference_CCF_id", journals_conference_id);
		}
		if (!paper_includedType.equals("ALL"))
			params.put("paper_includedType", paper_includedType);
		if (!paper_time.equals("ALL")) {
			params.put("paper_time_start", paper_time + "-01-01");
			params.put("paper_time_end", paper_time + "-12-31");
		}
		if (journals_conference_flag != -1)
			params.put("journals_conference_flag", journals_conference_flag);
		if (teacher_id > 0)
			params.put("teacher_id", teacher_id);
		if (teacher_sex != -1)
			params.put("teacher_sex", teacher_sex);
		if (teacher_age_min != 0) {
			String teacher_birth_max = DateUtil.get_birth(teacher_age_min);
			params.put("teacher_birth_max", teacher_birth_max);
		}
		if (teacher_age_max != 100) {
			String teacher_birth_min = DateUtil.get_birth(teacher_age_max);
			params.put("teacher_birth_min", teacher_birth_min);
		}
		if (journals_conference_IF_min != 0.0)
			params.put("journals_conference_IF_min", journals_conference_IF_min);
		if (journals_conference_IF_max != 1000.0)
			params.put("journals_conference_IF_max", journals_conference_IF_max);
		if (paper_citations_min != 0)
			params.put("paper_citations_min", paper_citations_min);
		if (paper_citations_max != 100000)
			params.put("paper_citations_max", paper_citations_max);
		if (paper_citations_others_min != 0)
			params.put("paper_citations_others_min", paper_citations_others_min);
		if (paper_citations_others_max != 100000)
			params.put("paper_citations_others_max", paper_citations_others_max);
		if (!column.equals("ALL")) {
			params.put("column", column);
			if (order == 1)
				params.put("order", "ASC");
			if (order == -1)
				params.put("order", "DESC");
		} else {
			params.put("column", "p.paper_time");
			params.put("order", "DESC");
		}
		params.put("page", page);
	}

	@Override
	public Paper findPaperByPaperId(int paper_id) {
		// TODO Auto-generated method stub
		if (paper_id < 1)
			return null;
		return paperMapper.findPaperByPaperId(paper_id);
	}

	@Override
	public int insertPaper(Paper paper) {
		// TODO Auto-generated method stub
		paperMapper.insertPaper(paper);
		return paper.getPaper_id();
	}

	public boolean deletePaper(int paper_id) {
		if (paperMapper.deletePaperByPaperId(paper_id) != 0 && authorService.deleteAuthor(paper_id))
			return true;
		return false;
	}

	@Override
	public int insertPaperProxyByPaperId(int paper_id) {
		// TODO Auto-generated method stub
		Paper paper = paperMapper.findPaperByPaperId(paper_id);
		paperMapper.insertPaperProxyByPaperId(paper);
		if (insertAuthorProxyByPaperId(paper_id, paper.getPaper_id()))
			return paper.getPaper_id();
		else
			return 0;
	}

	@Override
	public boolean insertAuthorProxyByPaperId(int paper_id, int paperproxy_id) {
		// TODO Auto-generated method stub
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("paper_id", paper_id);
		params.put("paperproxy_id", paperproxy_id);
		if (paperMapper.insertAuthorProxyByPaperId(params) != 0)
			return true;
		else
			return false;
	}

	@Override
	public int findTeacherIdByPaperId(int paper_id) {
		// TODO Auto-generated method stub
		return paperMapper.findTeacherIdByPaperId(paper_id);
	}

}
