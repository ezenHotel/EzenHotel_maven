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
public class MemberController {

	///////////////////////////////////////////////// 참고용 코드
	///////////////////////////////////////////////// ///////////////////////////////////////////////////
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		return new ModelAndView("member/create");
	}

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		String memberId = this.memberService.create(map);
		if (memberId == null) {
			mav.setViewName("redirect:/create");
		} else {
			mav.setViewName("redirect:/detail?memberId=" + memberId);
		}
		return mav;
	}

	// 상세보기 시작
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map) {
		Map<String, Object> detailMap = this.memberService.detail(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", detailMap);
		String no = map.get("no").toString();
		mav.addObject("no", no);
		mav.setViewName("/member/detail");
		return mav;
	}
	// 상세보기 끝

	// 전체 목록 보기 시작
	@RequestMapping(value = "/list")
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> list = this.memberService.list(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setViewName("/member/list");
		return mav;
	}
	// 전체 목록 보기 끝

	// 인덱스 페이지 시작
	@RequestMapping(value = "/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index");
		return mav;
	}
	// 인덱스 페이지 끝
	///////////////////////////////////////////////// 참고용 코드 끝
	// ///////////////////////////////////////////////////

	// 로그인 시작
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("member/login");
	}

	@ResponseBody
	@RequestMapping("/loginProc")
	public ModelAndView loginProc(@RequestParam Map<String, Object> map, HttpSession session) {
		Map<String, Object> loginMap = this.memberService.login(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", loginMap);
		String uid = map.get("uid").toString();
		if (uid == null) {
			mav.setViewName("/member/login");
		} else {
			session.setAttribute("isLogin", uid);
			mav.setViewName("/index");
		}
		return mav;
	}
	// 로그인 끝

	// 로그아웃 시작
	@RequestMapping("/logout")
	public ModelAndView logoutProc(@RequestParam Map<String, Object> map, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		session.invalidate();
		mav.setViewName("/index");

		return mav;
	}
	// 로그아웃 끝

	// 마이페이지 시작
	@RequestMapping(value = "/mypage", method = RequestMethod.GET)
	public ModelAndView mypage(@RequestParam Map<String, Object> map, HttpSession session) {
		map.put("sKey", (String) session.getAttribute("isLogin"));
		Map<String, Object> myPageMap = this.memberService.mypage(map);
		ModelAndView mav = new ModelAndView();
		System.out.print("프린트 갑니다요"+myPageMap);
		mav.addObject("data", myPageMap);
		System.out.print("프린트 또 갑니다요"+mav);
		String no = myPageMap.get("no").toString();
		mav.addObject("no", no);
		mav.setViewName("/member/userEdit");
		return mav;
	}
	// 마이페이지 끝
}
