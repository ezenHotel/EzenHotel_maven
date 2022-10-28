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
		List<Map<String, Object>> HList = this.ReserveService.selHotelList();
		
		
		ModelAndView mav = new ModelAndView();
		mav.addObject("HList", HList);
		
		System.out.println("HList : "+HList+"============");
		
		String hCode = map.get("hCode").toString();
		
		mav.addObject("hCode", hCode);
		mav.setViewName("reserve/reserve"); 
		
		
		return mav;
		
	}

	@RequestMapping(value="/resvRoomList")
	 public @ResponseBody List<RoomInfoDTO> mtd_resvRoomList(@RequestParam("hCode") String hCode){		 
		 
		 System.out.println("컨트롤러 resvRoomList 입장");
		 
		 List<RoomInfoDTO> roomList = ReserveService.selRoomList(hCode);
		 System.out.println("List<RoomInfoDTO> : "+roomList);
		 
		return roomList;
	}
	
	@ResponseBody
	@RequestMapping(value="/resvRoomCnt", method=RequestMethod.GET)
	public Map<String, Object> mtd_resvRoomCnt(@RequestParam String hCode, String rCode, String resev_start) {
	    Map<String, Object> map = new HashMap<String, Object>();
	    
	    System.out.println("컨트롤러 resvRoomCnt 입장");
	    System.out.println(rCode + " / " + resev_start);
	    
	    // 선택된 호텔 객실들의 예약 건이 있는지 조회(예약 가능 잔여 객실 추출 시 필요)
 		
	    String ResvRCnt = this.ReserveService.selResvRoomCnt(rCode, resev_start);		// 객실 별 잔여객실 수 
 		System.out.println("ResvRCnt : " + ResvRCnt);
 		
 		// 선택된 호텔 객실들의 '총' 객실 수 조회
 		//Map<String, Object> TotRCntMap = new HashMap<String, Object>();
 		//TotRCntMap.put("rCode", rCode);
 		String TotRCnt = this.ReserveService.selTotRoomCnt(rCode);
 		System.out.println("TotRCnt : " + TotRCnt);
	    
 		// 예약 가능 객실 건수
 		map.put("resvCnt", ResvRCnt);
 		// 총 객실 수
 		map.put("totCnt", TotRCnt);
 		map.put("rCode", rCode);
 		map.put("resev_start", resev_start);
 		map.put("hCode", hCode);
		
	    return map;
	}
}
