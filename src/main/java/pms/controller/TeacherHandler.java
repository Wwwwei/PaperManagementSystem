package pms.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import pms.entity.Author;
import pms.entity.Page;
import pms.entity.Paper;
import pms.entity.Teacher;
import pms.service.AuthorService;
import pms.service.FileService;
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

	@Resource(name = "authorServiceImpl")
	private AuthorService authorService;

	@Resource(name = "fileServiceImpl")
	private FileService fileService;

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
				// System.out.println(session.getId());
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
	public String updatePassword(@RequestParam(value = "oldPassword") String oldPassword,
								 @RequestParam(value = "newPassword") String newPassword, HttpSession session, HttpServletRequest request) {
		String result = null;
		if ((Teacher) session.getAttribute("teacher") == null) {
			return "redirect:/login.jsp";
		}
		Teacher teacher = (Teacher) session.getAttribute("teacher");
		Map<String, String> password_info = teacherService.findTeacherPassword(teacher.getTeacher_no());
		if (CryptoUtil.verify(password_info.get("teacher_password"), oldPassword, password_info.get("teacher_salt"))) {
			teacherService.updatePassword(teacher.getTeacher_id(), newPassword);
			result = "success";

		} else {
			result = "oldPassword_error";
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
		// System.out.println(papers.get(0).getPaper_location_CCF_id());
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

	@ResponseBody
	@RequestMapping(value = "/updatePaperById", method = RequestMethod.GET)
	public String updatePaperById(@RequestParam(value = "paper_id") int paper_id,
								  @RequestParam(value = "paper_status") int paper_status,
								  @RequestParam(value = "paper_accNum") String paper_accNum, HttpSession session,
								  @RequestParam(value = "paper_time") String paper_time,
								  @RequestParam(value = "paper_location") String paper_location) {
		Paper paper=paperService.findPaperByPaperId(paper_id);
		String str=null;
		String location = null;
		if(paper.getPaper_issue()==0)
		{
			str=paper.getPaper_location().substring(0, paper.getPaper_location().indexOf("$"));
			location=str+'$'+paper_location;
		}
		if(paper.getPaper_issue()==1)
		{
			str=paper.getPaper_location().substring(paper.getPaper_location().indexOf("$"));
			location=paper_location+str;
		}
		if (paperService.updatePaper(paper_id, paper_status, paper_accNum, paper_time, location))
			return "success";
		else
			return "error";
	}

	/**
	 * 文件下载
	 * @Description:
	 * @param fileName
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/download")
	public String downloadFile(@RequestParam("fileType") String fileType, @RequestParam("paper_id") String paper_id,
							   HttpServletRequest request, HttpServletResponse response) {
		int fType = Integer.parseInt(fileType);
		int paperId = Integer.parseInt(paper_id);
		String fileName = null;
		if (fType == 1) {
			fileName = paper_id+"_1.doc";
		}
		if (fType == 2) {
			fileName = paper_id+"_2.doc";
		}
		if (fType == 3) {
			fileName = paper_id+"_3.doc";
		}
		if (fType == 4) {
			fileName = paper_id+"_4.doc";
		}
		if (fType == 5) {
			fileName = paper_id+"_5.doc";
		}
		System.out.println(fType + "---");
		pms.entity.File f = fileService.findFileByPaperIdAndFileType(paperId, fType);
		System.out.println(f.getFile_url() + "+++");
		if (f != null) {
			String realPath = f.getFile_url();
			File file = new File(realPath);

			if (file.exists()) {
				response.setContentType("application/force-download");// 设置强制下载不打开
				response.addHeader("Content-Disposition", "attachment;fileName=" +fileName);// 设置文件名
				byte[] buffer = new byte[1024];
				FileInputStream fis = null;
				BufferedInputStream bis = null;
				try {
					fis = new FileInputStream(file);
					bis = new BufferedInputStream(fis);
					OutputStream os = response.getOutputStream();
					int i = bis.read(buffer);
					while (i != -1) {
						os.write(buffer, 0, i);
						i = bis.read(buffer);
					}
				} catch (Exception e) {
					// TODO: handle exception
					e.printStackTrace();
				} finally {
					if (bis != null) {
						try {
							bis.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
					if (fis != null) {
						try {
							fis.close();
						} catch (IOException e) {
							// TODO Auto-generated catch block
							e.printStackTrace();
						}
					}
				}
			}
		}

		return null;
	}

	@RequestMapping(value = "/modifyPaper", method = RequestMethod.GET)
	public String modifyPaper(@RequestParam(value = "paper_id") int paper_id,
							  @RequestParam(value = "teacher_no") String teacher_no,HttpSession session,
							  HttpServletRequest request) {
		Paper paper = paperService.findPaperByPaperId(paper_id);
		List<Author> author=authorService.findAuthor(paper_id);
		request.setAttribute("paper", paper);
		request.setAttribute("authors", author);
		if(paper.getPaper_status()==0)
		{
			if(paper.getPaper_issue()==0)
			{
				String s1=paper.getPaper_location();
				System.out.println(s1);
				request.setAttribute("paper_number", s1.substring(0, s1.indexOf("$")));
			}
			if(paper.getPaper_issue()==1)
			{
				String s1=paper.getPaper_location();
				System.out.println(s1);
				request.setAttribute("meeting_place", s1.substring(s1.indexOf("$")+1));
			}

		}
		if(paper.getPaper_status()==1)
		{
			if(paper.getPaper_issue()==0)
			{
				String s1=paper.getPaper_location();
				System.out.println(s1);
				request.setAttribute("paper_number", s1.substring(0, s1.indexOf("$")));
				String s2=s1.substring(s1.indexOf("$")+1);
				System.out.println(s2);
				request.setAttribute("paper_location_volume", s2.substring(0, s2.indexOf("$")));
				String s3=s2.substring(s2.indexOf("$")+1);
				System.out.println(s3);
				request.setAttribute("paper_location_pagination", s3);
			}
			if(paper.getPaper_issue()==1)
			{
				String s1=paper.getPaper_location();
				System.out.println(s1);
				request.setAttribute("meeting_page", s1.substring(0, s1.indexOf("$")));
				String s2=s1.substring(s1.indexOf("$")+1);
				System.out.println(s2);
				request.setAttribute("meeting_place", s2);
			}

		}
		return "teacher/paperInfo";
		// int paperproxy_id = paperService.insertPaperProxyByPaperId(paper_id);
		// if (paperproxy_id != 0) {
		// attr.addAttribute("commited_paper_id", paper_id);
		// attr.addAttribute("paperproxy_id", paperproxy_id);
		// return "redirect:../paper_proxy/modify.do";
		// } else
		// return "";

	}

}
