package pack.spring.admin;

import java.util.ArrayList;
import java.util.Arrays;
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
		String isAdmin = (String) session.getAttribute("isAdmin");
		if (isAdmin == null) {
			// 어드민 계정으로 로그인 상태가 아니라면
			mav.setViewName("/admin/main");
		} else {
			// 어드민 계정으로 로그인 상태라면
			mav.setViewName("/admin/realMain");
		}
		return mav;
	}

	// 어드민 로그인 시작
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
	// 어드민 로그인 끝

	// 어드민 로그아웃 시작
	@RequestMapping("/adminOut")
	public ModelAndView admin_logout(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("redirect:/admin");

		return mav;
	}
	// 어드민 로그아웃 끝

	// 어드민 페이지 ( 회원 전체 관리 페이지 ) 시작
	@RequestMapping(value = "/admin/memberList")
	public ModelAndView admin_memberList(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String isAdmin = (String) session.getAttribute("isAdmin");
		if (isAdmin == null) {
			// 어드민 계정으로 로그인 상태가 아니라면
			mav.setViewName("redirect:/admin");
		} else {
			// 어드민 계정으로 로그인 상태라면
			List<Map<String, Object>> memList = this.adminService.memList(map);
			mav.addObject("member", memList);
			mav.setViewName("/admin/memberList");
		}
		return mav;
	}
	// 어드민 페이지 ( 회원 전체 관리 페이지 ) 끝

	// 회원 삭제 시작
	@RequestMapping(value = "/memberDel", method = RequestMethod.GET)
	public ModelAndView admin_memberDel(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();

		String nums = map.get("chkdNums").toString();
		ArrayList<String> numList = new ArrayList<>(Arrays.asList(nums.split("\\s*,\\s*")));

		for (String no : numList) {
			map.put("no", no);
			this.adminService.memDel(map);
		}
		mav.setViewName("redirect:/admin/memberList");

		return mav;
	}
	// 회원 삭제 끝

	// 회원 상세 조회 시작
	@RequestMapping(value = "/memberList/detail", method = RequestMethod.GET)
	public ModelAndView admin_memberDetail(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String isAdmin = (String) session.getAttribute("isAdmin");
		if (isAdmin == null) {
			// 어드민 계정으로 로그인 상태가 아니라면
			mav.setViewName("/admin/main");
		} else {
			// 어드민 계정으로 로그인 상태라면
			mav.setViewName("/admin/detail");

		}
		return mav;
	}
	// 회원 상세 조회 끝

}
