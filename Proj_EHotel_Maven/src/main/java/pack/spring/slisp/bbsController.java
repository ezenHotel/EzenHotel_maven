package pack.spring.slisp;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class bbsController {

	// 메인페이지 
	@RequestMapping(value="/index", method=RequestMethod.GET)
	public ModelAndView index() {
		return new ModelAndView("index");
	}

	// 회원가입 
	@RequestMapping(value="/join", method=RequestMethod.GET)
	public ModelAndView join() {
		return new ModelAndView("bbs/join");
	}


	@Autowired
	bbsService bbsService;

	@RequestMapping(value="/join", method=RequestMethod.POST)
	public ModelAndView joinPost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();

		String memberId = this.bbsService.join(map);

		if (memberId == null) {
			mav.setViewName("redirect:/create");
		} else {
			mav.setViewName("redirect:/detail?memberId="+memberId);
		}


		return mav;
	}

	// 로그인 
	@RequestMapping(value="/login", method=RequestMethod.GET)
	public ModelAndView login() {
		return new ModelAndView("bbs/login");
	}

	@RequestMapping(value="/login")
	public ModelAndView login(@RequestParam Map<String, Object> map, HttpSession session ) {
		Map<String, Object> login = bbsService.login(map);
		ModelAndView mav = new ModelAndView();


		System.out.println(login);

		if(login!=null) {
			mav.setViewName("/bbs/list");
			List<Map<String, Object>> list=this.bbsService.list(map);
			mav.addObject("data",list);

			session.setAttribute("sessionuid", login.get("uid"));
		}else {
			mav.setViewName("/bbs/login");
		}

		return mav;
	}


	// 게시판 글 작성 

	@RequestMapping(value="/bbs/write", method=RequestMethod.GET)
	public ModelAndView write() {
		return new ModelAndView("/bbs/write");
	}

	@RequestMapping(value="/bbs/write", method=RequestMethod.POST)
	public ModelAndView writePost(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();

		String memberId = this.bbsService.write(map);
		if (memberId == null) {
			mav.setViewName("redirect:/bbs/list");
		} else {
			mav.setViewName("redirect:/bbs/list");
		}

		return mav;
	}


	// 게시판 목록보기 
	@RequestMapping(value="/bbs/list", method=RequestMethod.GET)
	public ModelAndView list(@RequestParam Map<String, Object> map) {

		List<Map<String, Object>> list=this.bbsService.list(map);

		ModelAndView mav = new ModelAndView();
		mav.addObject("data",list);
		mav.setViewName("/bbs/list");

		return mav;

	}

	
	// 게시판 글 상세보기 
	@RequestMapping(value="/bbs/detail", method = RequestMethod.GET)
	public ModelAndView detail(@RequestParam Map<String, Object> map ) {
		//		String uid = map.get("uid").toString();
		String no = map.get("no").toString();		
		Map<String, Object> detailMap = this.bbsService.detail(map);

		ModelAndView mav = new ModelAndView();


		if(detailMap != null) {
			mav.addObject("data", detailMap);
			mav.addObject("no", no);
			mav.setViewName("/bbs/detail");			
		}else {
			mav.setViewName("/bbs/detailError");
		}


		return mav;
	}
	

	// 게시판 글 수정
	@RequestMapping(value="/bbs/modify", method=RequestMethod.GET)
	public ModelAndView modify(@RequestParam Map<String, Object> map) {
		String no = map.get("no").toString();	
		Map<String, Object> detailMap = this.bbsService.detail(map);
		
		ModelAndView mav = new ModelAndView();
		
		if(detailMap != null) {
			mav.addObject("data", detailMap);
			mav.addObject("no", no);
			mav.setViewName("/bbs/modify");			
		}else {
			mav.setViewName("/bbs/modify");
		}
		
		return mav;
	}

	@RequestMapping(value="/bbs/update", method=RequestMethod.GET)
	public ModelAndView update(@RequestParam Map<String, Object> map) {
		ModelAndView mav = new ModelAndView();
		
		String memberId = this.bbsService.update(map);
		if (memberId == null) {
			mav.setViewName("redirect:/bbs/list");
		} else {
			mav.setViewName("redirect:/bbs/list");
		}
		
		return mav;
	}

	
	// 게시판 글 삭제 
	@RequestMapping(value="/bbs/delete", method=RequestMethod.GET)
	public String delete(@RequestParam int no) throws Exception {	
		bbsService.delete(no);
		
		return "redirect:/bbs/list";
	}

	
	// FAQ
	@RequestMapping(value="/bbs/faq", method=RequestMethod.GET)
	public ModelAndView faq() {
		return new ModelAndView("/bbs/faq");
	}
}
