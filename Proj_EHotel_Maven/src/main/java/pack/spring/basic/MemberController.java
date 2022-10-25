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
	public ModelAndView login(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		if (map.get("isOK") != null) {
			String isOK = map.get("isOK").toString();
			mav.addObject("isOK", isOK);
		}
		mav.setViewName("member/login");
		return mav;
	}

	@ResponseBody
	@RequestMapping("/loginProc")
	public ModelAndView loginProc(@RequestParam Map<String, Object> map, HttpSession session) {
		Map<String, Object> loginMap = this.memberService.login(map);
		ModelAndView mav = new ModelAndView();
		if (loginMap == null) {
			mav.addObject("isOK", "no");
			mav.setViewName("redirect:/login");
		} else {
			String uid = loginMap.get("uid").toString();
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
		String sKey = (String) session.getAttribute("isLogin");
		ModelAndView mav = new ModelAndView();
		if (sKey == null) {
			// 잘못된 접근
			mav.setViewName("redirect:/");
		} else {
			map.put("sKey", sKey);
			Map<String, Object> myPageMap = this.memberService.mypage(map);
			mav.addObject("data", myPageMap);
			mav.setViewName("/member/userEdit");
		}
		return mav;
	}

	@RequestMapping(value = "/mypageProc", method = RequestMethod.GET)
	public ModelAndView mypageProc(@RequestParam Map<String, Object> map, HttpSession session) {
		map.put("sKey", (String) session.getAttribute("isLogin"));
		this.memberService.mypageEdit(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/mypage");
		return mav;
	}

	@RequestMapping(value = "/pwEdit", method = RequestMethod.GET)
	public ModelAndView pwEditPage() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/pwEdit");
		return mav;
	}

	@RequestMapping(value = "/pwEditProc", method = RequestMethod.POST)
	public ModelAndView pwEdit(@RequestParam Map<String, Object> map, HttpSession session) {
		map.put("sKey", (String) session.getAttribute("isLogin"));
		this.memberService.pwEdit(map);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/pwEditProc");
		return mav;
	}
	// 마이페이지 끝

	// 회원가입 시작
	@RequestMapping("/join")
	public ModelAndView joinAgreement() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/join/joinAgreement");
		return mav;
	}

	@ResponseBody
	@RequestMapping("/joinFrm")
	public ModelAndView joinFrm(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		if (map.get("vCode") == null) {
			// 잘못된 경로로 접근시
			mav.setViewName("redirect:/");
		} else {
			// 올바른 경로로 접근시
			mav.setViewName("/member/join/join");
		}
		return mav;
	}

	@RequestMapping(value = "/joinProc", method = RequestMethod.GET)
	public ModelAndView joinProc(@RequestParam Map<String, Object> map) {
		int isDone = this.memberService.joinProc(map);
		ModelAndView mav = new ModelAndView();
		String name = map.get("name").toString();
		if (isDone > 0) {
			// 정상 가입
			mav.addObject("name", name);
			mav.setViewName("/member/join/joinComplete");
		} else {
			// 가입 실패시
			mav.addObject("msg", "잘못된 정보입니다. 다시 시도해 주세요.");
			mav.addObject("url", "/");
			mav.setViewName("/member/join/catchError");
		}
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/idChk")
	public ModelAndView idChkProc(@RequestParam Map<String, Object> map) {
		String uid = map.get("uid").toString();
		int isExist = this.memberService.inqId(map);
		ModelAndView mav = new ModelAndView();
		if (isExist == 0) {
			mav.addObject("isExist", "no");
		} else {
			mav.addObject("isExist", "yes");
		}
		mav.addObject("uid", uid);
		mav.setViewName("/member/join/idCheck");
		return mav;
	}

	// 회원가입 끝
	// +++
	// 회원가입 이용약관 페이지 시작
	@RequestMapping(value = "/uA")
	public ModelAndView joinAg_uA() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/ind/uA");
		return mav;
	}
	
	@RequestMapping(value = "/sA")
	public ModelAndView joinAg_sA() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/ind/sA");
		return mav;
	}
	
	@RequestMapping(value = "/pA")
	public ModelAndView joinAg_pA() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/member/ind/pA");
		return mav;
	}
	// 회원가입 이용약관 페이지 끝
	
	// 호텔 안내에 관한 페이지 시작
	@RequestMapping(value = "/info/intro")
	public ModelAndView hotelInfo_intro() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/hotelInfo/hotelInfo");
		return mav;
	}
	
	@RequestMapping(value = "/info/contact")
	public ModelAndView hotelInfo_contact() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/hotelInfo/contact");
		return mav;
	}
	
	@RequestMapping(value = "/info/direction")
	public ModelAndView hotelInfo_direction() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/hotelInfo/wayToCome");
		return mav;
	}
	// 호텔 안내에 관한 페이지 끝
}
