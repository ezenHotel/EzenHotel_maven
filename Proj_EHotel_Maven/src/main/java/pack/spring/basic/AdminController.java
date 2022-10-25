package pack.spring.basic;

import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

	@Autowired
	AdminService adminService;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String isAdmin = (String)session.getAttribute("isAdmin");
		if(isAdmin == null) {
			// 어드민 계정으로 로그인 상태가 아니라면 
			mav.setViewName("/admin/main");
		} else {
			// 어드민 계정으로 로그인 상태라면
			mav.setViewName("/admin/realMain");
		}
		return mav;
	}
	
	@RequestMapping(value = "/adminProc", method = RequestMethod.POST)
	public ModelAndView adminLogin(@RequestParam Map<String, Object> map, HttpSession session) {
		Map<String, Object> adminLogin = this.adminService.aLogin(map);
		ModelAndView mav = new ModelAndView();
		if (adminLogin == null) {
			mav.setViewName("redirect:/admin");
		} else {
			String aid = adminLogin.get("aid").toString();
			session.setAttribute("isAdmin", aid);
			mav.addObject("isAdmin", "yes");
			mav.setViewName("redirect:/admin");
			// 어드민 로그인 성공시 어드민 페이지로 리다이렉트
		}
		return mav;
	}
	
	// 어드민 페이지 ( 회원 전체 관리 페이지 ) 시작
	@RequestMapping(value = "/admin/memberList")
	public ModelAndView admin_(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String isAdmin = (String)session.getAttribute("isAdmin");
		if(isAdmin == null) {
			// 어드민 계정으로 로그인 상태가 아니라면 
			mav.setViewName("redirect:/admin");
		} else {
			// 어드민 계정으로 로그인 상태라면
			List<Map<String, Object>> memList = this.adminService.memList(map);
			mav.addObject("member",memList);
			mav.setViewName("/admin/memberList");
		}
		return mav;
	}
	// 어드민 페이지 ( 회원 전체 관리 페이지 ) 끝
	
	
}
