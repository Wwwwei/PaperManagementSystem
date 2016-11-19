package pms.controller;

import java.io.IOException;
import java.util.HashMap;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pms.entity.Admin;
import pms.entity.Institute;
import pms.entity.Teacher;
import pms.service.AdminService;
import pms.service.InstituteService;
import pms.service.PaperService;
import pms.service.TeacherService;
import pms.util.CryptoUtil;

@Controller
@RequestMapping("/admin")
public class AdminHandler {
	public final static String LOGIN_ERROR_INFO = "账户或密码错误，请重新登录！";

	public final static String LOGIN_SUCCESS_INFO = "您已经登录，请勿重新登录！";

	@Resource(name = "adminServiceImpl")
	private AdminService adminService;

	@Resource(name = "paperServiceImpl")
	private PaperService paperService;

	@Resource(name = "teacherServiceImpl")
	private TeacherService teacherService;

	@Resource(name = "instituteServiceImpl")
	private InstituteService instituteService;

	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(Admin admin, HttpSession session, HttpServletRequest request) {
		if ((Admin) session.getAttribute("admin") != null) {
			request.setAttribute("LOGIN_SUCCESS_INFO", LOGIN_SUCCESS_INFO);
			return "admin/function";
		}
		if ((admin = adminService.login(admin)) != null) {
			session.setAttribute("admin", admin);
			return "admin/function";
		} else {
			session.setAttribute("LOGIN_ERROR_INFO", LOGIN_ERROR_INFO);
			return "redirect:/loginAdmin.jsp";
		}
	}

	@RequestMapping(value = "/deletePaperById", method = RequestMethod.GET)
	public String deletePaperById(@RequestParam(value = "paper_id") int paper_id, HttpSession session,
			RedirectAttributes attr) {
		if (paperService.deletePaper(paper_id)) {
			attr.addAttribute("currentPage", session.getAttribute("currentPage"));
			attr.addAttribute("column", session.getAttribute("column"));
			attr.addAttribute("order", session.getAttribute("order"));
			return "redirect:../findAllPaper.do";
		} else
			return "";
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

	@ResponseBody
	@RequestMapping(value = "/insertTeacher", method = RequestMethod.POST)
	public Map<String, String> insertTeacher(@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {
		Map<String, String> result = new HashMap<String, String>();
		if (file.isEmpty()) {
			result.put("status", "文件为空，请检查上传！");
			return result;
		}
		try
		{
			List<Teacher> teachers = teacherService.getTeacherFromExcel(file.getInputStream());
			if (teacherService.insertTeacher(teachers, true))
				result.put("status", "录入教师信息成功！");
			else
				result.put("status", "录入教师信息失败，请重新尝试！");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result.put("status", "录入教师信息失败，请重新尝试！");
		}
		return result;
	}
	
	@RequestMapping(value = "/insertOneTeacher", method = RequestMethod.GET)
	public String insertOneTeacher(HttpSession session,HttpServletRequest request){
		if (session.getAttribute("admin") == null)
			return "redirect:/loginAdmin.jsp";
		List<Institute> institutes = instituteService.getAllInstitute();
		request.setAttribute("institutes", institutes);
		return "admin/insertOneTeacher";
	}
	
	@RequestMapping(value="/insertNTeacher",method=RequestMethod.GET)
	public String insertNTeacher(HttpSession session,HttpServletRequest request){
		if (session.getAttribute("admin") == null)
			return "redirect:/loginAdmin.jsp";
//		List<Institute> institutes = instituteService.getAllInstitute();
//		request.setAttribute("institutes", institutes);
		return "admin/insertNTeacher";
	}
	
	@RequestMapping(value = "/insertOneTeacher", method = RequestMethod.POST)
	public String insertOneTeacher(HttpSession session,Teacher teacher){
		if (session.getAttribute("admin") == null)
			return "redirect:/loginAdmin.jsp";
		teacherService.insertTeacher(teacher);
		return "admin/insertOneTeacher";
	}

	@RequestMapping(value = "/adminFunction", method = RequestMethod.GET)
	public String adminFunction(HttpSession session) {
		if (session.getAttribute("admin") == null)
			return "redirect:/loginAdmin.jsp";
		return "admin/function";
	}

	@RequestMapping(value = "/updateTeacherInfo", method = RequestMethod.GET)
	public String updateTeacherInfo(HttpSession session) {
		if (session.getAttribute("admin") == null)
			return "redirect:/loginAdmin.jsp";
		return "admin/updateTeacherInfo";
	}

	@RequestMapping(value = "/findTeacherInfo", method = RequestMethod.POST)
	public String findTeacherInfo(@RequestParam(value = "find_string") String find_string, HttpServletRequest request,HttpSession session) {
		if (session.getAttribute("admin") == null)
			return "redirect:/loginAdmin.jsp";
		Teacher teacher = teacherService.findTeacher(find_string);
		List<Institute> institutes = instituteService.getAllInstitute();
		request.setAttribute("institutes", institutes);
		request.setAttribute("find_string", find_string);
		request.setAttribute("isFindTeacher", true);
		request.setAttribute("teacher", teacher);
		return "admin/updateTeacherInfo";
	}

	@RequestMapping(value = "updateTeacher", method = RequestMethod.POST)
	public String updateTeacher(Teacher teacher, HttpSession session, HttpServletRequest request) {
		if (session.getAttribute("admin") == null)
			return "redirect:/loginAdmin.jsp";
		System.out.println(teacher.getTeacher_no() + "]]]]]]");
		if (teacherService.updateTeacher(teacher)) {
			teacher = teacherService.findTeacher(teacher.getTeacher_no());
			List<Institute> institutes = instituteService.getAllInstitute();
			request.setAttribute("teacher", teacher);
			request.setAttribute("find_string", teacher.getTeacher_no());
			request.setAttribute("isFindTeacher", true);
			request.setAttribute("institutes", institutes);
			request.setAttribute("updateTeacherResult", "修改教师信息成功！");
		} else {
			request.setAttribute("updateTeacherResult", "修改教师信息失败，请重新尝试！");
		}
		return "admin/updateTeacherInfo";
	}

	@ResponseBody
	@RequestMapping(value = "resetPassword", method = RequestMethod.POST)
	public String resetPassword(@RequestParam(value = "teacher_id") String teacher_id,
			@RequestParam(value = "teacher_no") String teacher_no,HttpSession session) {
		String result = null;
		if (session.getAttribute("admin") == null){
			result="admin_not_login";
			return result;
		}
		String sha1_password = CryptoUtil.SHA1(teacher_no.trim());
		if (teacherService.updatePassword(teacher_id, sha1_password))
			result = "success";
		else
			result = "resetPassword_error";
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value = "findTeacherNo", method = RequestMethod.POST)
	public String findTeacherNo(@RequestParam(value = "teacher_no") String teacher_no){
		String result = "false";
		if(teacherService.findTeacher(teacher_no)!=null)
			result="true";
		return result;
	}

}
