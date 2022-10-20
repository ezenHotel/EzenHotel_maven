package pack.spring.basic;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller

public class MemberController {

	@RequestMapping(value = "/create", method = RequestMethod.GET)
	// value에 해당하는 패턴이 들어오면 method의 방식으로 실행하라

	public ModelAndView create() {
		return new ModelAndView("member/create");
	}
	// 무엇을? member 폴더 아래 있는 create View(jsp)를 (연결)
	// 모델과 뷰를 연결시켜주는 것

	@Autowired
	MemberService memberService;

	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public ModelAndView createPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		String memberId = this.memberService.create(map);
		if (memberId == null) {
			mav.setViewName("redirect:/create");
		} else {
			mav.setViewName("redirect:/detail?no=" + memberId);
		}
		return mav;
	}

	// 상세보기 시작
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		Map<String, Object> detailMap = this.memberService.detail(map);
		mav.addObject("data", detailMap);
		String no = map.get("no").toString();
		mav.addObject("no", no);
		mav.setViewName("/member/detail");
		return mav;
	}
	// 상세보기 끝

	// 회원 전체 목록 보기 시작
	@RequestMapping(value = "/list")
	public ModelAndView list(@RequestParam Map<String, Object> map) {
		List<Map<String, Object>> list = this.memberService.list(map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("data", list);
		mav.setViewName("/member/list");
		return mav;
	}
	// 회원 전체 목록 보기 끝

	// 인덱스 페이지 시작
	@RequestMapping(value = "/")
	public ModelAndView index() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/index");
		return mav;
	}
	// 인덱스 페이지 끝
}
