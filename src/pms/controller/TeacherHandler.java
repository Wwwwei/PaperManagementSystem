package pms.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pms.entity.Page;
import pms.entity.Paper;
import pms.entity.Teacher;
import pms.service.PaperService;
import pms.service.TeacherService;
import pms.util.CryptoUtil;

@Controller
@RequestMapping("/teacher")
public class TeacherHandler {
	public final static String LOGIN_ERROR_INFO = "账户或密码错误，请重新登录！";

	public final static String LOGIN_SUCCESS_INFO = "您已经登录，请勿重新登录！";

	public final static String FIND_ERROR_INFO = "查询发生错误，请重新查询！";

	public final static String UPDATE_PASSWORD_SUCCESS = "修改密码成功！";

	public final static String UPDATE_PASSWORD_FAILED = "修改密码失败，请从新修改！";

	@Resource(name = "teacherServiceImpl")
	private TeacherService teacherService;

	@Resource(name = "paperServiceImpl")
	private PaperService paperService;

	@ResponseBody
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@RequestParam(value = "teacher_no") String teacher_no,
			@RequestParam(value = "teacher_password") String teacher_password, HttpSession session) {
		String result = null;
		Map<String, String> password_info = teacherService.findTeacherPassword(teacher_no);
		if (password_info == null)
			result = "teacher_not_found";
		else {
			if (CryptoUtil.verify(password_info.get("teacher_password"), teacher_password,
					password_info.get("teacher_salt"))) {
				Teacher teacher = teacherService.findTeacher(teacher_no);
				session.setAttribute("teacher", teacher);
//				System.out.println(session.getId());
				result = "success";
			} else
				result = "error";
		}
		return result;
	}

	@RequestMapping(value = "/updatePassword", method = RequestMethod.GET)
	public String updatePassword(HttpSession session) {
		if ((Teacher) session.getAttribute("teacher") == null) {
			return "redirect:/login.jsp";
		}
		return "teacher/updatePassword";
	}

	@ResponseBody
	@RequestMapping(value = "/updatePassword", method = RequestMethod.POST)
	public String updatePassword(@RequestParam(value="oldPassword") String oldPassword,@RequestParam(value="newPassword") String newPassword, HttpSession session,
			HttpServletRequest request) {
		String result=null;
		if ((Teacher) session.getAttribute("teacher") == null) {
			return "redirect:/login.jsp";
		}
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		Map<String, String> password_info = teacherService.findTeacherPassword(teacher.getTeacher_no());
		if (CryptoUtil.verify(password_info.get("teacher_password"), oldPassword,
				password_info.get("teacher_salt"))) {
			teacherService.updatePassword(teacher.getTeacher_id(), newPassword);
			result= "success";
			
		}else{
			result="oldPassword_error";
		}
		return result;
	}

	@RequestMapping(value = "/teacherFunction", method = RequestMethod.GET)
	public String teacherFunction(HttpSession session) {
		if ((Teacher) session.getAttribute("teacher") == null) {
			return "redirect:/login.jsp";
		}
		return "teacher/function";
	}

	@RequestMapping(value = "/findPaper", method = RequestMethod.GET)
	public String findPaper(HttpSession session, HttpServletRequest request,
			@RequestParam("isCommited") boolean isCommited,
			@RequestParam(value = "currentPage", required = false, defaultValue = "1") int currentPage) {
		if ((Teacher) session.getAttribute("teacher") == null) {
			return "redirect:/login.jsp";
		}
		Object object = session.getAttribute("teacher");
		if (object == null || !(object instanceof Teacher)) {
			request.setAttribute("FIND_ERROR_INFO", FIND_ERROR_INFO);
			return "teacher/function";
		}
		Page page = new Page();
		page.setCurrentPage(currentPage);
		Teacher teacher = (Teacher) object;
		session.setAttribute("isCommited", isCommited);
		isCommited = (boolean) session.getAttribute("isCommited");
		List<Paper> papers = teacherService.findPaperByTeacherId(teacher.getTeacher_id(), isCommited, page);
//		System.out.println(papers.get(0).getPaper_location_CCF_id());
		System.out.println("--------------------------------");
		session.setAttribute("page", page);
		request.setAttribute("papers", papers);
		if (isCommited)
			return "teacher/commitedPaper";
		else
			return "teacher/unCommitedPaper";
	}

	@RequestMapping(value = "/findTeacherInfo", method = RequestMethod.GET)
	public String findTeacherInfo(HttpSession session,
			@RequestParam(value = "teacher_id", required = true) int teacher_id, HttpServletRequest request) {
		// if ((Teacher) session.getAttribute("teacher") == null) {
		// return "redirect:/login.jsp";
		// }
		Teacher teacher = teacherService.findTeacherById(teacher_id);
		request.setAttribute("teacher", teacher);
		return "teacher/teacherInfo";
	}

	@RequestMapping(value = "/quit", method = RequestMethod.GET)
	public String quit(HttpSession session) {
		session.invalidate();
		return "redirect:/login.jsp";
	}

	@RequestMapping(value = "/updatePaperById", method = RequestMethod.GET)
	public String updatePaperById(@RequestParam(value = "paper_id") int paper_id, HttpSession session,
			RedirectAttributes attr) {
		int paperproxy_id = paperService.insertPaperProxyByPaperId(paper_id);
		if (paperproxy_id != 0) {
			attr.addAttribute("commited_paper_id", paper_id);
			attr.addAttribute("paperproxy_id", paperproxy_id);
			return "redirect:../paper_proxy/modify.do";
		} else
			return "";
	}
	
	@RequestMapping(value = "/modifyPaper", method = RequestMethod.GET)
	public String modifyPaper(@RequestParam(value = "paper_id") int paper_id, HttpSession session,
			HttpServletRequest request) {
		Paper paper = paperService.findPaperByPaperId(paper_id);
		request.setAttribute("paper", paper);
		return "teacher/paperInfo";
//		int paperproxy_id = paperService.insertPaperProxyByPaperId(paper_id);
//		if (paperproxy_id != 0) {
//			attr.addAttribute("commited_paper_id", paper_id);
//			attr.addAttribute("paperproxy_id", paperproxy_id);
//			return "redirect:../paper_proxy/modify.do";
//		} else
//			return "";
		
	}

}
