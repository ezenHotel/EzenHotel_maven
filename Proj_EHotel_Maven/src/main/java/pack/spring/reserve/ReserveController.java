package pack.spring.reserve;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class ReserveController {
	 
	@Autowired
	ReserveService ReserveService;
	
	// reserve.jsp 예약 현황에서 '호텔 리스트'와 선택된 '호텔의 객실 리스트' 조회
	@RequestMapping(value="/resvHome", method=RequestMethod.GET)
	public ModelAndView sel_resvHome(@RequestParam Map<String, Object> map) {
		// ModelAndView - 내장객체, 자료형
		
		System.out.println();

		System.out.println("resvHome 들어왔다잉~~~~~~~~~~~~~~~~~~~~~~~~?");
		System.out.println("map : "+map+"============");
		
		// '호텔 리스트' 조회
		List<Map<String, Object>> HList = this.ReserveService.selHotelList(map);
		// 선택된 '호텔의 객실 리스트' 조회
		List<Map<String, Object>> RList = this.ReserveService.selRoomList(map);
		
		
		String rCode = "";		// 객실 코드
		int rCnt = RList.size();	// 선택된 호텔의 객실 수
		
		
		 
		ModelAndView mav = new ModelAndView();
		mav.addObject("HList", HList);
		mav.addObject("RList", RList);
		
		System.out.println("HList : "+HList+"============");
		System.out.println("RList : "+RList+"============");
		
		String hCode = map.get("hCode").toString();
		
		mav.addObject("hCode", hCode);
		mav.setViewName("reserve/reserve"); 
		
		
		return mav;
		
	}
	
	@ResponseBody
	@RequestMapping(value="/resvRoomCnt", method=RequestMethod.GET)
	public Map<String, String> mtd_resvRoomCnt(@RequestBody String rCode, String resev_start) {
	    Map<String, String> map = new HashMap<String, String>();
	    
	    // 선택된 호텔 객실들의 예약 건이 있는지 조회(예약 가능 잔여 객실 추출 시 필요)
 		Map<String, Object> ResvRCntMap = new HashMap<String, Object>();
		ResvRCntMap.put("resev_start", resev_start);
		ResvRCntMap.put("rCode", rCode);
 		String ResvRCnt = this.ReserveService.selResvRoomCnt(ResvRCntMap);		// 객실 별 잔여객실 수 
 		
 		// 선택된 호텔 객실들의 '총' 객실 수 조회
 		Map<String, Object> TotRCntMap = new HashMap<String, Object>();
 		TotRCntMap.put("rCode", rCode);
 		String TotRCnt = this.ReserveService.selTotRoomCnt(TotRCntMap);
	    
 		map.put("resvCnt", ResvRCnt);
 		map.put("totCnt", TotRCnt);
		
	    return map;
	}
}
