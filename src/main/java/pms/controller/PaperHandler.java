package pms.controller;

import java.util.List;


import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import pms.entity.Journals_Conference;
import pms.entity.Page;
import pms.entity.Paper;
import pms.entity.Teacher;
import pms.service.AuthorProxyService;
import pms.service.JournalsConferenceService;
import pms.service.PaperProxyService;
import pms.service.PaperService;
import pms.service.TeacherService;
import pms.util.DateUtil;

@Controller
// @RequestMapping("/paper")
public class PaperHandler {

	private final static String FIND_RESULT = "findPaper";

	private final static String FIND_ALL_RESULT = "findAllPaper";

	private final static String PAPER_INFO = "paperInfo";

	private final static String DEFAULT_FIND_TYPE = "paper_info";

	private static Logger logger = Logger.getLogger(PaperHandler.class);

	@Resource(name = "paperServiceImpl")
	private PaperService paperService;

	@Resource(name = "journalsConferenceServiceImpl")
	private JournalsConferenceService journalsConferenceService;

	@Resource(name = "teacherServiceImpl")
	private TeacherService teacherService;

	@Resource(name = "paperProxyServiceImpl")
	private PaperProxyService paperProxyService;

	@Resource(name = "authorProxyServiceImpl")
	private AuthorProxyService authorProxyService;

	@RequestMapping(value = "/findPaper", method = RequestMethod.POST)
	public String findPaper(@RequestParam(required = false, defaultValue = "") String find_string,
			@RequestParam(value = "find_type", required = false, defaultValue = DEFAULT_FIND_TYPE) String find_type,
			@RequestParam(value = "journals_conference_degree", required = false, defaultValue = "ALL") String journals_conference_degree,
			@RequestParam(value = "paper_includedType", required = false, defaultValue = "ALL") String paper_includedType,
			@RequestParam(value = "paper_time", required = false, defaultValue = "ALL") String paper_time,
			@RequestParam(value = "journals_conference_flag", required = false, defaultValue = "-1") int journals_conference_flag,
			@RequestParam(value = "teacher_id", required = false, defaultValue = "0") int teacher_id,
			@RequestParam(value = "teacher_sex", required = false, defaultValue = "-1") int teacher_sex,
			@RequestParam(value = "teacher_age_min", required = false, defaultValue = "0") int teacher_age_min,
			@RequestParam(value = "teacher_age_max", required = false, defaultValue = "100") int teacher_age_max,
			@RequestParam(value = "journals_conference_IF_min", required = false, defaultValue = "0") double journals_conference_IF_min,
			@RequestParam(value = "journals_conference_IF_max", required = false, defaultValue = "1000") double journals_conference_IF_max,
			@RequestParam(value = "paper_citations_min", required = false, defaultValue = "0") int paper_citations_min,
			@RequestParam(value = "paper_citations_max", required = false, defaultValue = "100000") int paper_citations_max,
			@RequestParam(value = "paper_citations_others_min", required = false, defaultValue = "0") int paper_citations_others_min,
			@RequestParam(value = "paper_citations_others_max", required = false, defaultValue = "100000") int paper_citations_others_max,
			HttpSession session, HttpServletRequest request) {
		Page page = new Page();
		page.setCurrentPage(1);
		find_string = find_string.trim();
		String column = (String) session.getAttribute("column");
		int order = (int) session.getAttribute("order");
		List<Paper> papers = paperService.findPaper(find_string, find_type, journals_conference_degree,
				paper_includedType, paper_time, journals_conference_flag, teacher_id, teacher_sex, teacher_age_min,
				teacher_age_max, journals_conference_IF_min, journals_conference_IF_max, paper_citations_min,
				paper_citations_max, paper_citations_others_min, paper_citations_others_max, column, order, page);
		session.setAttribute("find_string", find_string);
		session.setAttribute("find_type", find_type);
		session.setAttribute("paper_includedType", paper_includedType);
		session.setAttribute("journals_conference_degree", journals_conference_degree);
		session.setAttribute("paper_time", paper_time);
		session.setAttribute("journals_conference_flag", journals_conference_flag);
		session.setAttribute("teacher_id", teacher_id);
		session.setAttribute("teacher_sex", teacher_sex);
		session.setAttribute("teacher_age_min", teacher_age_min);
		session.setAttribute("teacher_age_max", teacher_age_max);
		session.setAttribute("journals_conference_IF_min", 0.0);
		session.setAttribute("journals_conference_IF_max", 1000.0);
		session.setAttribute("paper_citations_min", 0);
		session.setAttribute("paper_citations_max", 100000);
		session.setAttribute("paper_citations_others_min", 0);
		session.setAttribute("paper_citations_others_max", 100000);
		if (session.getAttribute("journals_Conference_degrees") == null) {
			List<Journals_Conference> journals_Conferences = journalsConferenceService.findAllJournals_Conference();
			session.setAttribute("journals_Conferences", journals_Conferences);
		}
		if (session.getAttribute("teachers") == null) {
			List<Teacher> teachers = teacherService.findAllTeacher();
			session.setAttribute("teachers", teachers);
		}
		if (session.getAttribute("paper_times") == null) {
			session.setAttribute("paper_times", DateUtil.getYears());
		}
		request.setAttribute("papers", papers);
		session.setAttribute("page", page);
		return FIND_RESULT;

	}

	/**
	 * 分页检索查询
	 *
	 * @param currentPage
	 * @param session
	 * @param request
	 * @param column
	 * @param order
     * @return
     */
	@RequestMapping(value = "/findPaper", method = RequestMethod.GET)
	public String findPaper(@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			HttpSession session, HttpServletRequest request,
			@RequestParam(value = "column", required = false, defaultValue = "ALL") String column,
			@RequestParam(value = "order", required = false, defaultValue = "1") int order) {
		Page page = new Page();
		page.setCurrentPage(currentPage);
		session.setAttribute("column", column);
		session.setAttribute("order", order);
//		String find_string = (String) session.getAttribute("find_string");
//		String find_type = (String) session.getAttribute("find_type");
		int journals_conference_id = (int) session.getAttribute("journals_conference_id");
		int journals_conference_flag = (int) session.getAttribute("journals_conference_flag");
		String paper_includedType = (String) session.getAttribute("paper_includedType");
		String paper_time = (String) session.getAttribute("paper_time");
		int teacher_id = (int) session.getAttribute("teacher_id");
		int teacher_sex = (int) session.getAttribute("teacher_sex");
		int teacher_age_min = (int) session.getAttribute("teacher_age_min");
		int teacher_age_max = (int) session.getAttribute("teacher_age_max");
		double journals_conference_IF_min = (double) session.getAttribute("journals_conference_IF_min");
		double journals_conference_IF_max = (double) session.getAttribute("journals_conference_IF_max");
		int paper_citations_min = (int) session.getAttribute("paper_citations_min");
		int paper_citations_max = (int) session.getAttribute("paper_citations_max");
		int paper_citations_others_min = (int) session.getAttribute("paper_citations_others_min");
		int paper_citations_others_max = (int) session.getAttribute("paper_citations_others_max");
		List<Paper> papers = paperService.findAllPaper(journals_conference_id, paper_includedType, paper_time,
				journals_conference_flag, teacher_id, teacher_sex, teacher_age_min, teacher_age_max,
				journals_conference_IF_min, journals_conference_IF_max, paper_citations_min, paper_citations_max,
				paper_citations_others_min, paper_citations_others_max, column, order, page);
		request.setAttribute("papers", papers);
		session.setAttribute("page", page);
		return FIND_RESULT;
	}

	@RequestMapping(value = "/findPaperById", method = RequestMethod.GET)
	public String findPaperById(@RequestParam(value = "paper_id") int paper_id, HttpServletRequest request) {
		Paper paper = paperService.findPaperByPaperId(paper_id);
		if (paper != null)
			request.setAttribute("paper", paper);
		return PAPER_INFO;
	}

	/**
	 * 查询所有论文信息
	 * 
	 * @param currentPage
	 * @param request
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/findAllPaperIndex", method = RequestMethod.GET)
	public String findAllPaperIndex(HttpSession session, HttpServletRequest request) {
		logger.debug("查询所有论文开始...");
		Page page = new Page();
		page.setCurrentPage(1);
		List<Paper> papers = paperService.findAllPaper(0, "ALL", "ALL", -1, 0, -1, 0, 100, 0, 1000.0, 0, 100000, 0,
				100000, "ALL", 1, page);
		List<Journals_Conference> journals_Conferences = journalsConferenceService.findAllJournals_Conference();
		List<Teacher> teachers = teacherService.findAllTeacher();
		session.setAttribute("journals_conference_id", 0);
		session.setAttribute("paper_includedType", "ALL");
		session.setAttribute("paper_time", "ALL");
		session.setAttribute("journals_conference_flag", -1);
		session.setAttribute("teacher_id", 0);
		session.setAttribute("teacher_sex", -1);
		session.setAttribute("teacher_age_min", 0);
		session.setAttribute("teacher_age_max", 100);
		session.setAttribute("journals_conference_IF_min", 0.0);
		session.setAttribute("journals_conference_IF_max", 1000.0);
		session.setAttribute("paper_citations_min", 0);
		session.setAttribute("paper_citations_max", 100000);
		session.setAttribute("paper_citations_others_min", 0);
		session.setAttribute("paper_citations_others_max", 100000);
		session.setAttribute("column", "ALL");
		session.setAttribute("order", 1);

		request.setAttribute("papers", papers);
		session.setAttribute("journals_Conferences", journals_Conferences);
		session.setAttribute("paper_times", DateUtil.getYears());
		session.setAttribute("teachers", teachers);
		session.setAttribute("page", page);
		logger.debug("所有论文查询成功，进行返回...");
		return FIND_ALL_RESULT;

	}

	// public String findAllPaperOrder(){
	//
	// }

	/**
	 * 根据页码分页查询
	 * 
	 * @param session
	 * @param request
	 * @param currentPage
	 * @return
	 */
	@RequestMapping(value = "/findAllPaper", method = RequestMethod.GET)
	public String findAllPaper(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage,
			@RequestParam(value = "column", required = false, defaultValue = "ALL") String column,
			@RequestParam(value = "order", required = false, defaultValue = "1") int order) {
		
		Page page = new Page();
		page.setCurrentPage(currentPage);
		session.setAttribute("currentPage", currentPage);
		session.setAttribute("column", column);
		session.setAttribute("order", order);
		if (session.getAttribute("journals_conference_id") == null) {
			return "forward:findAllPaperIndex.do";
		}
		int journals_conference_id = (int) session.getAttribute("journals_conference_id");
		int journals_conference_flag = (int) session.getAttribute("journals_conference_flag");
		String paper_includedType = (String) session.getAttribute("paper_includedType");
		String paper_time = (String) session.getAttribute("paper_time");
		int teacher_id = (int) session.getAttribute("teacher_id");
		int teacher_sex = (int) session.getAttribute("teacher_sex");
		int teacher_age_min = (int) session.getAttribute("teacher_age_min");
		int teacher_age_max = (int) session.getAttribute("teacher_age_max");
		double journals_conference_IF_min = (double) session.getAttribute("journals_conference_IF_min");
		double journals_conference_IF_max = (double) session.getAttribute("journals_conference_IF_max");
		int paper_citations_min = (int) session.getAttribute("paper_citations_min");
		int paper_citations_max = (int) session.getAttribute("paper_citations_max");
		int paper_citations_others_min = (int) session.getAttribute("paper_citations_others_min");
		int paper_citations_others_max = (int) session.getAttribute("paper_citations_others_max");
		List<Paper> papers = paperService.findAllPaper(journals_conference_id, paper_includedType, paper_time,
				journals_conference_flag, teacher_id, teacher_sex, teacher_age_min, teacher_age_max,
				journals_conference_IF_min, journals_conference_IF_max, paper_citations_min, paper_citations_max,
				paper_citations_others_min, paper_citations_others_max, column, order, page);
		request.setAttribute("papers", papers);
		session.setAttribute("page", page);
		System.out.println(page.getCurrentPage()+"==============");
		return FIND_ALL_RESULT;

	}

	/**
	 * 根据筛选条件查询所有论文
	 * 
	 * @param session
	 * @param request
	 * @param journals_conference_degree
	 * @param paper_includedType
	 * @param paper_time
	 * @param paper_time_order
	 * @return
	 */
	@RequestMapping(value = "/findAllPaper", method = RequestMethod.POST)
	public String findAllPaper(HttpSession session, HttpServletRequest request,
			@RequestParam(value = "journals_conference_id", required = false, defaultValue = "0") int journals_conference_id,
			@RequestParam(value = "paper_includedType", required = false, defaultValue = "ALL") String paper_includedType,
			@RequestParam(value = "paper_time", required = false, defaultValue = "ALL") String paper_time,
			@RequestParam(value = "journals_conference_flag", required = false, defaultValue = "-1") int journals_conference_flag,
			@RequestParam(value = "teacher_id", required = false, defaultValue = "0") int teacher_id,
			@RequestParam(value = "teacher_sex", required = false, defaultValue = "0") int teacher_sex,
			@RequestParam(value = "teacher_age_min", required = false, defaultValue = "0") int teacher_age_min,
			@RequestParam(value = "teacher_age_max", required = false, defaultValue = "100") int teacher_age_max,
			@RequestParam(value = "journals_conference_IF_min", required = false, defaultValue = "0") double journals_conference_IF_min,
			@RequestParam(value = "journals_conference_IF_max", required = false, defaultValue = "1000") double journals_conference_IF_max,
			@RequestParam(value = "paper_citations_min", required = false, defaultValue = "0") int paper_citations_min,
			@RequestParam(value = "paper_citations_max", required = false, defaultValue = "100000") int paper_citations_max,
			@RequestParam(value = "paper_citations_others_min", required = false, defaultValue = "0") int paper_citations_others_min,
			@RequestParam(value = "paper_citations_others_max", required = false, defaultValue = "100000") int paper_citations_others_max) {
		Page page = new Page();
		page.setCurrentPage(1);
		if(session.getAttribute("column")==null){
			return "forward:findAllPaperIndex.do";
		}
		String column = (String) session.getAttribute("column");
		int order = (int) session.getAttribute("order");
		session.setAttribute("paper_includedType", paper_includedType);
		session.setAttribute("journals_conference_id", journals_conference_id);
		session.setAttribute("paper_time", paper_time);
		session.setAttribute("journals_conference_flag", journals_conference_flag);
		session.setAttribute("teacher_id", teacher_id);
		session.setAttribute("teacher_sex", teacher_sex);
		session.setAttribute("teacher_age_min", teacher_age_min);
		session.setAttribute("teacher_age_max", teacher_age_max);
		session.setAttribute("journals_conference_IF_min", journals_conference_IF_min);
		session.setAttribute("journals_conference_IF_max", journals_conference_IF_max);
		session.setAttribute("paper_citations_min", paper_citations_min);
		session.setAttribute("paper_citations_max", paper_citations_max);
		session.setAttribute("paper_citations_others_min", paper_citations_others_min);
		session.setAttribute("paper_citations_others_max", paper_citations_others_max);
		List<Paper> papers = paperService.findAllPaper(journals_conference_id, paper_includedType, paper_time,
				journals_conference_flag, teacher_id, teacher_sex, teacher_age_min, teacher_age_max,
				journals_conference_IF_min, journals_conference_IF_max, paper_citations_min, paper_citations_max,
				paper_citations_others_min, paper_citations_others_max, column, order, page);
		request.setAttribute("papers", papers);
		session.setAttribute("page", page);
		return FIND_ALL_RESULT;

	}

	/**
	 * 删除论文(2016/8/7 wei补充有问题联系)
	 * 
	 * @param paper_id
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/deletePaper", method = RequestMethod.POST)
	public String delete(@RequestParam("paper_id") String paper_id) {
		return null;
	}

	/**
	 * 修改论文（将论文复制到代理表，代理表提交后删除主表）(2016/8/7 wei补充有问题联系)
	 * 
	 * @param paper_id
	 * @return
	 */
	@RequestMapping(value = "/modifyPaper", method = RequestMethod.POST)
	public ModelAndView modify(@RequestParam("paper_id") Integer paper_id) {
		Paper paper = paperService.findPaperByPaperId(paper_id);
		/* 待定 */
		// paperProxyService.createPaperProxy(paper);
		// authorProxyService.createAuthorProxy(authorProxy);

		return null;
	}

}
