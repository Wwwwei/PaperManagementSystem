package pms.controller;

import com.alibaba.fastjson.JSON;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;
import pms.common.enums.PaperIssueEnum;
import pms.common.enums.PaperPublishTypeEnum;
import pms.entity.*;
import pms.service.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
public class PaperProxyHandler {
    @Resource(name = "paperProxyServiceImpl")
    private PaperProxyService paperProxyService;

    @Resource(name = "authorProxyServiceImpl")
    private AuthorProxyService authorProxyService;

    @Resource(name = "paperServiceImpl")
    private PaperService paperService;

    @Resource(name = "teacherServiceImpl")
    private TeacherService teacherService;

    @Resource(name = "authorServiceImpl")
    private AuthorService authorService;

    @Resource(name = "journalsConferenceServiceImpl")
    private JournalsConferenceService journalsConferenceService;

    @Resource(name = "fileServiceImpl")
    private FileService fileService;

    private static final String DELETE_PAPERPROXY_INFO = "删除未提交成果错误,请重新操作！";
    private static final String HAS_DELETE_PAPERPROXY_INFO = "已经删除，请勿重复提交！";
    private static final String ISSUING_PREFIX = "paper_location_issuing";
    private static final String VOLUME_PREFIX = "paper_location_volume";
    private static final String PAGINATION_PREFIX = "paper_location_pagination";
    private static final String[] NAME_SUFFIX = {"_ZKY", "_JCR", "_CCF"};

    /**
     * 创建论文代理对象
     *
     * @param paper
     * @param other_includedType
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/paper_proxy/create", method = RequestMethod.POST)
    public ModelAndView create(Paper paper,
                               @RequestParam(value = "other_includedType", required = false) String other_includedType,
                               @RequestParam(value = "paper_conference_location1", required = false) String paper_conference_location1,
                               @RequestParam(value = "paper_conference_location2", required = false) String paper_conference_location2,
                               @RequestParam(value = "paper_journals_location1", required = false) String paper_journals_location1,
                               @RequestParam(value = "paper_journals_location2", required = false) String paper_journals_location2,
                               @RequestParam(value = "paper_journals_location3", required = false) String paper_journals_location3,
                               HttpServletRequest request, HttpSession session) {
        if ((Teacher) session.getAttribute("teacher") == null) {
            return new ModelAndView("redirect:/login.jsp", null);
        }
        if (other_includedType != null) {
            paper.setPaper_includedType(other_includedType);
        }
        //组装论文位置信息(以$分隔)
        StringBuilder stringBuilder = null;
        PaperIssueEnum paperIssue = PaperIssueEnum.getInstance(paper.getPaper_issue());
        switch (paperIssue) {
            case JOURNALS:
                stringBuilder = new StringBuilder();
                stringBuilder.append(paper_journals_location1).append("$")
                        .append(paper_journals_location2).append("$").append(paper_journals_location3);
                break;
            case CONFERENCE:
                stringBuilder = new StringBuilder();
                stringBuilder.append(paper_conference_location1).append("$")
                        .append(paper_conference_location2);
                //发表方式为会议时,出版物类型默认为国际
                paper.setPaper_publishType(PaperPublishTypeEnum.INTERNATIONAL.getType());
                break;
        }
        paper.setPaper_location(stringBuilder.toString());
        /*
        // 组装期刊会议位置信息
        String issuing = null;
        String volume = null;
        String pagination = null;
        String paper_location = null;
        for (int i = 0; i < NAME_SUFFIX.length; i++) {
            issuing = request.getParameter((ISSUING_PREFIX + NAME_SUFFIX[i]));
            volume = request.getParameter(VOLUME_PREFIX + NAME_SUFFIX[i]);
            pagination = request.getParameter(PAGINATION_PREFIX + NAME_SUFFIX[i]);
            if (null == issuing) {
                issuing = "";
            }
            if (null == volume) {
                volume = "";
            }
            if (null == pagination) {
                pagination = "";
            }
            paper_location = issuing + "$" + volume + "$" + pagination;
            if ("_ZKY".equals(NAME_SUFFIX[i])) {
                paper.setPaper_location_ZKY(paper_location);
            } else if ("_JCR".equals(NAME_SUFFIX[i])) {
                paper.setPaper_location_JCR(paper_location);
            } else if ("_CCF".equals(NAME_SUFFIX[i])) {
                paper.setPaper_location_CCF(paper_location);
            }
        }
        // 输出信息====================================================
        System.out.println("=========");
        System.out.println("ZKY:" + paper.getPaper_location_ZKY());
        System.out.println("JCR:" + paper.getPaper_location_JCR());
        System.out.println("CCF:" + paper.getPaper_location_CCF());
        System.out.println("=========");
        // ===========================================================
        // paper.setPaper_location(paper_location);
        */
        // 勾选其他时，设置影响因子为0
     /*   if (0 == paper.getPaper_journals_conference_isOther()) {
            System.out.println("=========勾选其他=============");
            paper.setPaper_if(new Double(0));
        } else {
            System.out.println("=========未勾选其他=============");
            double zky_if = 0.0;
            double jcr_if = 0.0;
            double ccf_if = 0.0;
            if (null != paper.getPaper_journals_conference_ZKY()
                    && -1 != paper.getPaper_journals_conference_ZKY().getJournals_conference_id()) {
                int zky_id = paper.getPaper_journals_conference_ZKY().getJournals_conference_id();
                Journals_Conference zky = journals_ConferenceService.findJournals_ConferenceByIdAndYear(zky_id,
                        (Calendar.getInstance()).get(Calendar.YEAR));
                if (null != zky) {
                    zky_if = journals_ConferenceService
                            .findJournals_ConferenceByIdAndYear(zky_id, (Calendar.getInstance()).get(Calendar.YEAR))
                            .getJournals_conference_IF();
                }

            }
            if (null != paper.getPaper_journals_conference_JCR()
                    && -1 != paper.getPaper_journals_conference_JCR().getJournals_conference_id()) {
                int jcr_id = paper.getPaper_journals_conference_JCR().getJournals_conference_id();
                Journals_Conference jcr = journals_ConferenceService.findJournals_ConferenceByIdAndYear(jcr_id,
                        (Calendar.getInstance()).get(Calendar.YEAR));
                if (null != jcr) {
                    jcr_if = journals_ConferenceService
                            .findJournals_ConferenceByIdAndYear(jcr_id, (Calendar.getInstance()).get(Calendar.YEAR))
                            .getJournals_conference_IF();
                }
            }
            if (null != paper.getPaper_journals_conference_CCF()
                    && -1 != paper.getPaper_journals_conference_CCF().getJournals_conference_id()) {
                int ccf_id = paper.getPaper_journals_conference_CCF().getJournals_conference_id();
                Journals_Conference ccf = journals_ConferenceService.findJournals_ConferenceByIdAndYear(ccf_id,
                        (Calendar.getInstance()).get(Calendar.YEAR));
                if (null != ccf) {
                    ccf_if = journals_ConferenceService
                            .findJournals_ConferenceByIdAndYear(ccf_id, (Calendar.getInstance()).get(Calendar.YEAR))
                            .getJournals_conference_IF();
                }
            }
            System.out.println("zky_if" + zky_if);
            System.out.println("jcr_if" + jcr_if);
            System.out.println("ccf_if" + ccf_if);
            paper.setPaper_if(getMaxFromThreeDouble(zky_if, jcr_if, ccf_if));
        }
        */
//        System.out.println("\n" + JSON.toJSONString(paper));
        paperProxyService.createPaperProxy(paper);
        System.out.println(paper.getPaper_teacher().getTeacher_id() + "----------------------------");
        // authorProxy处理
        //	List<AuthorProxy> authors = new ArrayList();
        for (int i = 1; i <= paper.getPaper_authorNum(); i++) {
            // 输出信息====================================================
            System.out.println("=========");
            System.out.println(request.getParameter("authorName" + i));
            System.out.println(request.getParameter("authorID" + i));
            System.out.println(request.getParameter("authorOffice" + i));
            System.out.println(request.getParameter("authorType" + i));
            // ===========================================================
            AuthorProxy authorProxy = new AuthorProxy();
            authorProxy.setAuthor_name(request.getParameter("authorName" + i));
            authorProxy.setAuthor_rank(i);
            String authorID = request.getParameter("authorID" + i);
            String authorOffice = request.getParameter("authorOffice" + i);
            int authorType = Integer.parseInt(request.getParameter("authorType" + i));
            if (authorID != null) {
                authorProxy.setAuthor_no(authorID);
            }
            if (authorOffice != null) {
                authorProxy.setAuthor_office(authorOffice);
            }
            authorProxy.setAuthor_paper(paper);
            authorProxy.setAuthor_type(authorType);
            //		authors.add(authorProxy);
            authorProxyService.createAuthorProxy(authorProxy);
        }
        Map<String, String> model = new HashMap<String, String>();
        model.put("paperproxy_id", String.valueOf(paper.getPaper_id()));
        model.put("teacher_no", ((Teacher) session.getAttribute("teacher")).getTeacher_no());
        return new ModelAndView("paperproxy/paperproxy_show", model);
    }

    private double getMaxFromThreeDouble(double a, double b, double c) {
        double maxNum = a > b ? a > c ? a : c : b > c ? b : c;
        return maxNum;
    }

    /**
     * 更新论文代理对象
     *
     * @param paper
     * @param other_includedType
     * @param commited_paper_id
     * @param request
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/paper_proxy/update", method = RequestMethod.POST)
    public ModelAndView update(Paper paper,
                               @RequestParam(value = "other_includedType", required = false) String other_includedType,
                               @RequestParam(value = "commited_paper_id") Integer commited_paper_id, HttpServletRequest request,
                               HttpSession session) {
        // if ((Teacher) session.getAttribute("teacher") == null && (int)
        // commited_paper_id == 0) {
        // return new ModelAndView("redirect:/login.jsp", null);
        // }
        if ((Teacher) session.getAttribute("teacher") == null) {
            return new ModelAndView("redirect:/login.jsp", null);
        }
        System.out.println(commited_paper_id + "(((((((((((");
        // String paper_location = paper_location_issuing + "$" +
        // paper_location_volume + "$" + paper_location_pagination;
        if (null != other_includedType) {
            paper.setPaper_includedType(other_includedType);
        }
    /*    // 组装期刊会议位置信息
        String issuing = null;
        String volume = null;
        String pagination = null;
        String paper_location = null;
        for (int i = 0; i < NAME_SUFFIX.length; i++) {
            // System.out.println(ISSUING_PREFIX + NAME_SUFFIX[i]);
            issuing = request.getParameter((ISSUING_PREFIX + NAME_SUFFIX[i]));
            volume = request.getParameter(VOLUME_PREFIX + NAME_SUFFIX[i]);
            pagination = request.getParameter(PAGINATION_PREFIX + NAME_SUFFIX[i]);
            if (null == issuing) {
                issuing = "";
            }
            if (null == volume) {
                volume = "";
            }
            if (null == pagination) {
                pagination = "";
            }
            paper_location = issuing + "$" + volume + "$" + pagination;
            if ("_ZKY".equals(NAME_SUFFIX[i])) {
                paper.setPaper_location_ZKY(paper_location);
            } else if ("_JCR".equals(NAME_SUFFIX[i])) {
                paper.setPaper_location_JCR(paper_location);
            } else if ("_CCF".equals(NAME_SUFFIX[i])) {
                paper.setPaper_location_CCF(paper_location);
            }
        }
        // 输出信息====================================================
        System.out.println("=========");
        System.out.println("ZKY:" + paper.getPaper_location_ZKY());
        System.out.println("JCR:" + paper.getPaper_location_JCR());
        System.out.println("CCF:" + paper.getPaper_location_CCF());
        System.out.println("=========");
        // ===========================================================
        */
        // 勾选其他时，设置影响因子为0
        if (0 == paper.getPaper_journals_conference_isOther()) {
            System.out.println("=========勾选其他=============");
            paper.setPaper_if(new Double(0));
        } else {
            System.out.println("=========未勾选其他=============");
            double zky_if = 0.0;
            double jcr_if = 0.0;
            double ccf_if = 0.0;
            if (null != paper.getPaper_journals_conference_ZKY()
                    && -1 != paper.getPaper_journals_conference_ZKY().getJournals_conference_id()) {
                int zky_id = paper.getPaper_journals_conference_ZKY().getJournals_conference_id();
                Journals_Conference zky = journalsConferenceService.findJournals_ConferenceByIdAndYear(zky_id,
                        (Calendar.getInstance()).get(Calendar.YEAR));
                if (null != zky) {
                    zky_if = journalsConferenceService
                            .findJournals_ConferenceByIdAndYear(zky_id, (Calendar.getInstance()).get(Calendar.YEAR))
                            .getJournals_conference_IF();
                }

            }
            if (null != paper.getPaper_journals_conference_JCR()
                    && -1 != paper.getPaper_journals_conference_JCR().getJournals_conference_id()) {
                int jcr_id = paper.getPaper_journals_conference_JCR().getJournals_conference_id();
                Journals_Conference jcr = journalsConferenceService.findJournals_ConferenceByIdAndYear(jcr_id,
                        (Calendar.getInstance()).get(Calendar.YEAR));
                if (null != jcr) {
                    jcr_if = journalsConferenceService
                            .findJournals_ConferenceByIdAndYear(jcr_id, (Calendar.getInstance()).get(Calendar.YEAR))
                            .getJournals_conference_IF();
                }
            }
            if (null != paper.getPaper_journals_conference_CCF()
                    && -1 != paper.getPaper_journals_conference_CCF().getJournals_conference_id()) {
                int ccf_id = paper.getPaper_journals_conference_CCF().getJournals_conference_id();
                Journals_Conference ccf = journalsConferenceService.findJournals_ConferenceByIdAndYear(ccf_id,
                        (Calendar.getInstance()).get(Calendar.YEAR));
                if (null != ccf) {
                    ccf_if = journalsConferenceService
                            .findJournals_ConferenceByIdAndYear(ccf_id, (Calendar.getInstance()).get(Calendar.YEAR))
                            .getJournals_conference_IF();
                }
            }
            System.out.println("zky_if" + zky_if);
            System.out.println("jcr_if" + jcr_if);
            System.out.println("ccf_if" + ccf_if);
            paper.setPaper_if(getMaxFromThreeDouble(zky_if, jcr_if, ccf_if));
        }
        // paper.setPaper_location(paper_location);
        // 未更新前作者人数
        int ex_authorNum = paperProxyService.findPaperProxyById(paper.getPaper_id()).getPaper_authorNum();
        System.out.println("=========更新前作者人数：" + ex_authorNum);
        System.out.println("=========更新后作者人数：" + paper.getPaper_authorNum());
        paperProxyService.updatePaperProxy(paper);
//		List<AuthorProxy> authors = new ArrayList();
        // 作者表信息更新或者增加
        if (ex_authorNum <= paper.getPaper_authorNum()) {
            // authorProxy处理
            for (int i = 1; i <= paper.getPaper_authorNum(); i++) {
                // 输出信息====================================================
                System.out.println("=========");
                System.out.println(request.getParameter("author_id" + i));
                System.out.println(request.getParameter("authorName" + i));
                System.out.println(request.getParameter("authorID" + i));
                System.out.println(request.getParameter("authorOffice" + i));
                System.out.println(request.getParameter("authorType" + i));
                // ====================================================
                // 作者对象处理
                AuthorProxy authorProxy = new AuthorProxy();
                authorProxy.setAuthor_name(request.getParameter("authorName" + i));
                authorProxy.setAuthor_rank(i);
                String authorID = request.getParameter("authorID" + i);
                String authorOffice = request.getParameter("authorOffice" + i);
                int authorType = Integer.parseInt(request.getParameter("authorType" + i));
                if (authorID != null) {
                    authorProxy.setAuthor_no(authorID);
                }
                if (authorOffice != null) {
                    authorProxy.setAuthor_office(authorOffice);
                }
                authorProxy.setAuthor_paper(paper);
                authorProxy.setAuthor_type(authorType);
                // 当作者id为空时，表示新增加的作者信息
                if (request.getParameter("author_id" + i) == "" || request.getParameter("author_id" + i) == null) {
                    authorProxy.setAuthor_name(request.getParameter("authorName" + i));
                    authorProxyService.createAuthorProxy(authorProxy);
                } else {// 更新作者信息
                    authorProxy.setAuthor_id(Integer.valueOf(request.getParameter("author_id" + i)));
                    authorProxyService.updateAuthorProxy(authorProxy);
                }
                //	authors.add(authorProxy);
            }
        } else {
            // 作者表信息更新或者删除
            List<AuthorProxy> ex_authors = authorProxyService
                    .findAuthorProxyListByPaperProxyId(String.valueOf(paper.getPaper_id()));
            System.out.println("=========2==========" + ex_authors.size());
            // authorProxy处理
            for (int i = 1; i <= paper.getPaper_authorNum(); i++) {
                // 输出信息====================================================
                System.out.println("=========2");
                System.out.println(request.getParameter("author_id" + i));
                System.out.println(request.getParameter("authorName" + i));
                System.out.println(request.getParameter("authorID" + i));
                System.out.println(request.getParameter("authorOffice" + i));
                System.out.println(request.getParameter("authorType" + i));
                // ====================================================
                // 作者对象处理
                AuthorProxy authorProxy = new AuthorProxy();
                authorProxy.setAuthor_name(request.getParameter("authorName" + i));
                authorProxy.setAuthor_rank(i);
                String authorID = request.getParameter("authorID" + i);
                String authorOffice = request.getParameter("authorOffice" + i);
                int authorType = Integer.parseInt(request.getParameter("authorType" + i));
                if (authorID != null) {
                    authorProxy.setAuthor_no(authorID);
                }
                if (authorOffice != null) {
                    authorProxy.setAuthor_office(authorOffice);
                }
                authorProxy.setAuthor_paper(paper);
                authorProxy.setAuthor_type(authorType);
                authorProxy.setAuthor_id(Integer.valueOf(request.getParameter("author_id" + i)));

                for (AuthorProxy author : ex_authors) {
                    if (author.getAuthor_id() == authorProxy.getAuthor_id()) {
                        authorProxyService.updateAuthorProxy(authorProxy);
                        ex_authors.remove(author);
                        break;
                    }
                }
                //	authors.add(authorProxy);
            }
            System.out.println("=========22==========" + ex_authors.size());
            for (AuthorProxy author : ex_authors) {
                // 删除原作者表中多余信息
                authorProxyService.deleteAuthorProxy(String.valueOf(author.getAuthor_id()));
            }
        }
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("paperproxy_id", paper.getPaper_id());
        model.put("commited_paper_id", commited_paper_id);
        model.put("teacher_no", ((Teacher) session.getAttribute("teacher")).getTeacher_no());
        return new ModelAndView("paperproxy/paperproxy_show", model);
    }

    /**
     * 获取论文代理对象
     *
     * @param paperproxy_id
     * @param request
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/paper_proxy/getPaper", method = RequestMethod.POST)
    public Paper show(@RequestParam("paperproxy_id") Integer paperproxy_id, HttpServletRequest request,
                      HttpSession session) {
        Paper paper = paperProxyService.findPaperProxyById(paperproxy_id);
        return paper;
    }

    /**
     * 显示论文代理修改页面
     *
     * @param paperproxy_id
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/paper_proxy/modify", method = RequestMethod.GET)
    public ModelAndView modify(@RequestParam("paperproxy_id") String paperproxy_id,
                               @RequestParam(value = "commited_paper_id", required = false, defaultValue = "0") int commited_paper_id,
                               HttpServletRequest request, HttpSession session) {
        System.out.println(paperproxy_id + "------------");
        System.out.println(commited_paper_id + "*************");
        if ((Teacher) session.getAttribute("teacher") == null && (Teacher) session.getAttribute("admin") == null) {
            return new ModelAndView("redirect:/login.jsp", null);
        }
        Map<String, Object> model = new HashMap<String, Object>();
        Teacher teacher = null;
        if (session.getAttribute("teacher") != null) {
            teacher = (Teacher) session.getAttribute("teacher");
        } else {
            teacher = teacherService.findTeacherById(paperService.findTeacherIdByPaperId(commited_paper_id));
        }
        model.put("teacher", teacher);
        model.put("paperproxy_id", paperproxy_id);
        System.out.println(commited_paper_id + "------------------");
        model.put("commited_paper_id", commited_paper_id);
        return new ModelAndView("paperproxy/paperproxy_modify", model);
    }

    /**
     * 删除论文代理对象
     *
     * @param paperproxy_id
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/paper_proxy/deletePaperproxy", method = RequestMethod.GET)
    public String deletePaperproxy(@RequestParam("paperproxy_id") int paperproxy_id, HttpServletRequest request,
                                   HttpSession session) {
        if ((Teacher) session.getAttribute("teacher") == null) {
            return "redirect:/login.jsp";
        }
        int delete_paperproxy_id = 0;
        if (session.getAttribute("delete_paperproxy_id") != null)
            delete_paperproxy_id = (int) session.getAttribute("delete_paperproxy_id");
        if (delete_paperproxy_id == paperproxy_id) {
            request.setAttribute("DELETE_PAPERPROXY_INFO", HAS_DELETE_PAPERPROXY_INFO);
        } else {
            int flag = paperProxyService.deletePaperProxy(paperproxy_id); // 删除代理论文
            if (flag == 0) { // 删除失败
                request.setAttribute("DELETE_PAPERPROXY_INFO", DELETE_PAPERPROXY_INFO);
            }
        }
        session.setAttribute("delete_paperproxy_id", paperproxy_id);
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        Page page = new Page();
        page.setCurrentPage(1);
        List<Paper> papers = teacherService.findPaperByTeacherId(teacher.getTeacher_id(), false, page);
        request.setAttribute("papers", papers);
        return "teacher/unCommitedPaper";

    }

    /**
     * 显示论文代理显示页面
     *
     * @param paperproxy_id
     * @param session
     * @return
     */
    @RequestMapping(value = "/paper_proxy/show", method = RequestMethod.GET)
    public ModelAndView ShowView(@RequestParam("paperproxy_id") Integer paperproxy_id, HttpSession session) {
        Map<String, Object> model = new HashMap<String, Object>();
        model.put("paperproxy_id", paperproxy_id);
        model.put("teacher_no", ((Teacher) session.getAttribute("teacher")).getTeacher_no());
        return new ModelAndView("paperproxy/paperproxy_show", model);
    }

    /**
     * 显示论文代理录入页面
     *
     * @param request
     * @param session
     * @return
     */
    @RequestMapping(value = "/paper_proxy/input", method = RequestMethod.GET)
    public ModelAndView inputView(HttpServletRequest request, HttpSession session) {
        if ((Teacher) session.getAttribute("teacher") == null) {
            return new ModelAndView("redirect:/login.jsp", null);
        }
        Map<String, Object> model = new HashMap<String, Object>();
        // =====================================================
        Teacher teacher = (Teacher) session.getAttribute("teacher");
        // =====================================================
        model.put("teacher", teacher);
        return new ModelAndView("paperproxy/paperproxy_input", model);
    }

    /**
     * 显示论文代理文件上传页面
     *
     * @param teacher_no
     * @param paperproxy_id
     * @param session
     * @return
     */
    @RequestMapping(value = "/paper_proxy/upload", method = RequestMethod.GET)
    public ModelAndView uploadView(@RequestParam("teacher_no") String teacher_no, @RequestParam("paperproxy_id") Integer paperproxy_id, HttpSession session) {
        Map<String, Object> model = new HashMap<String, Object>();
        // =====================================================
        //  Teacher teacher = (Teacher) session.getAttribute("teacher");
        // =====================================================
        model.put("paperproxy_id", paperproxy_id);
        model.put("teacher_no", teacher_no);
        return new ModelAndView("paperproxy/paperproxy_upload", model);
    }
//	/**
//	 * 上传请求
//	 *
//	 * @param request
//	 * @param response
//	 * @return
//	 * @throws IllegalStateException
//	 * @throws IOException
//	 */
//	@ResponseBody
//	@RequestMapping(value = "/paper_proxy/upload", method = RequestMethod.POST)
//	public String upload2(HttpServletRequest request, HttpServletResponse response)
//			throws IllegalStateException, IOException {
//		String path = null;
//		String teacher_name = request.getParameter("teacher_name");
//		String paper_id = request.getParameter("paper_id");
//
//		// 创建一个通用的多部分解析器
//		CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
//				request.getSession().getServletContext());
//		// 判断 request 是否有文件上传,即多部分请求
//		if (multipartResolver.isMultipart(request)) {
//			// 转换成多部分request
//			MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
//			// 取得request中的所有文件名
//			Iterator<String> iter = multiRequest.getFileNames();
//			while (iter.hasNext()) {
//				// 记录上传过程起始时的时间，用来计算上传时间
//				int pre = (int) System.currentTimeMillis();
//				// 取得上传文件
//				MultipartFile file = multiRequest.getFile(iter.next());
//				if (file != null) {
//					// 取得当前上传文件的文件名称
//					String myFileName = file.getOriginalFilename();
//					// 如果名称不为“”,说明该文件存在，否则说明该文件不存在
//					if (myFileName.trim() != "") {
//						System.out.println(myFileName);
//						// 重命名上传后的文件名
//						String fileName = teacher_name + "_paper_" + paper_id
//								+ file.getOriginalFilename().substring(file.getOriginalFilename().indexOf('.'));
//						// 定义上传路径
//						// ===============================================
//						/*
//						 * String logoRealPathDir =
//						 * request.getSession().getServletContext().getRealPath(
//						 * "/upload"); File f = new File(logoRealPathDir); if
//						 * (!f.exists()) { f.mkdirs(); }
//						 */
//						// ==============================
//						path = "D:/" + fileName;
//						// String path = logoRealPathDir + fileName;
//						File localFile = new File(path);
//						file.transferTo(localFile);
//					}
//				}
//				// 记录上传该文件后的时间
//				int finaltime = (int) System.currentTimeMillis();
//				System.out.println(finaltime - pre);
//			}
//
//		}
//
//		// =======================================
//		// path放入Paper对象
//		// =======================================
//		System.out.println(paper_id + "-------------" + path);
//		return path;
//	}

    /**
     * 上传请求
     *
     * @param request
     * @return
     * @throws IllegalStateException
     * @throws IOException
     */
    @ResponseBody
    @RequestMapping(value = "/paper_proxy/file/upload", method = RequestMethod.POST)
    public Object upload(HttpServletRequest request)
            throws IllegalStateException, IOException {
        String path = null;
        String fileType = request.getParameter("fileType");
//		String teacher_name = request.getParameter("teacher_name");
//		String paper_id = request.getParameter("paper_id");
//        String teacher_id = "1";
//        String paper_id = "1";
        String teacher_id = request.getParameter("teacher_no");
        String paperproxy_id = request.getParameter("paperproxy_id");
        // 创建一个通用的多部分解析器
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(
                request.getSession().getServletContext());
        // 判断 request 是否有文件上传,即多部分请求
        if (multipartResolver.isMultipart(request)) {
            // 转换成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 取得request中的所有文件名
            Iterator<String> iter = multiRequest.getFileNames();

            while (iter.hasNext()) {
                // 记录上传过程起始时的时间，用来计算上传时间
                int pre = (int) System.currentTimeMillis();
                // 取得上传文件
                MultipartFile file = multiRequest.getFile(iter.next());
                if (file != null) {
                    // 取得当前上传文件的文件名称
                    String myFileName = file.getOriginalFilename();
                    // 如果名称不为“”,说明该文件存在，否则说明该文件不存在
                    if (myFileName.trim() != "") {
                        System.out.println(myFileName);
                        // 重命名上传后的文件名
                        String fileName = fileType
                                + file.getOriginalFilename().substring(file.getOriginalFilename().indexOf('.'));
                        System.out.println(fileName);
                        // 定义上传路径
                        // ===============================================
                        /*
                         * String logoRealPathDir =
						 * request.getSession().getServletContext().getRealPath(
						 * "/upload"); File f = new File(logoRealPathDir); if
						 * (!f.exists()) { f.mkdirs(); }
						 */
                        // ==============================
//                        path = "G:/" + teacher_id + "/" + paperproxy_id + "/";
                        path = "/Users/zhaogx/Downloads/" + teacher_id + "/" + paperproxy_id + "/";
                        File f = new File(path);
                        if (!f.exists()) {
                            f.mkdirs();
                        }
                        path = path + fileName;

                        // String path = logoRealPathDir + fileName;
                        File localFile = new File(path);
                        file.transferTo(localFile);
                    }
                }
                // 记录上传该文件后的时间
                int finaltime = (int) System.currentTimeMillis();
                System.out.println(finaltime - pre);
            }

        }

        // =======================================
        // path放入Paper对象
        // =======================================
        System.out.println(paperproxy_id + "-------------" + path);
        pms.entity.File file = fileService.findFileByPaperproxyIdAndFileType(Integer.parseInt(paperproxy_id), Integer.parseInt(fileType));
        if (null == file) {
            file = new pms.entity.File();
            file.setFile_paperproxy_id(Integer.parseInt(paperproxy_id));
            file.setFile_type(Integer.parseInt(fileType));
            file.setFile_url(path);
            fileService.createFile(file);
        } else {
            file.setFile_url(path);
            fileService.updateFile(file);
        }
        return JSON.toJSONString(path);
    }

    /**
     * 论文代理提交请求
     *
     * @param paperproxy_id
     * @param session
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/paper_proxy/submit", method = RequestMethod.POST)
    public String submit(@RequestParam("paperproxy_id") Integer paperproxy_id, HttpSession session) {
        System.out.println(paperproxy_id + "------------------");
        if (session.getAttribute("teacher") == null) {
            return "redirect:/login.jsp";
        }
        Paper paperProxy = paperProxyService.findPaperProxyById(paperproxy_id);
        List<AuthorProxy> authors = authorProxyService.findAuthorProxyListByPaperProxyId(String.valueOf(paperproxy_id));
        paperProxy.setPaper_id(null);
        int paper_id = paperService.insertPaper(paperProxy);
        System.out.println("&&&&&&&&&&&&" + paper_id);
        Paper paper = new Paper();
        paper.setPaper_id(paper_id);
        // =================================
        // 代理表转正式表操作
        // =================================
        // 删除代理表操作
        // boolean flag=true;
        System.out.println(authors.size());
        for (AuthorProxy author : authors) {
            author.setAuthor_paper(paper);
            authorService.insertAuthor(author);
        }
        // authorProxyService.deleteAuthorProxyByPaperId(String.valueOf(paperproxy_id));
        // authorProxyService.deleteAuthorProxy(String.valueOf(paperproxy_id));
        paperProxyService.deletePaperProxy(paperproxy_id);
        // =================================
//        if (commited_paper_id != 0) {
//            paperService.deletePaper(commited_paper_id);
//        }
        return paper_id + "";
    }

    /**
     * 论文代理录入论文名称查重
     *
     * @param paperproxy_name
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/paper_proxy/check", method = RequestMethod.POST)
    public boolean check(@RequestParam("paper_name") String paperproxy_name) {
        return paperProxyService.findPaperProxyByName(paperproxy_name);
    }

    /**
     * 获取已经录入的文件
     *
     * @param paperproxy_id
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/paper_proxy/file/getFile", method = RequestMethod.POST)
    public List<pms.entity.File> getFileByPaperproxyId(@RequestParam("paperproxy_id") Integer paperproxy_id) {
        return fileService.findFileByPaperproxyId(paperproxy_id);
    }

    @ResponseBody
    @RequestMapping(value = "/paper_proxy/test1", method = RequestMethod.GET)
    public ModelAndView test1() {
        Map<String, String> model = new HashMap<String, String>();
        model.put("paperproxy_id", "23");
        return new ModelAndView("paperproxy/paperproxy_show", model);
    }
}
